// 用于管理dll加载和卸载

#pragma once
#include "helper.h"
#include <iostream>
#include <string>
#include <map>
#include <functional>
#include <mutex>

#if defined(WIN32) || defined(_WIN32)
#include <Windows.h>
#define dll_fd HMODULE
#define dll_func_name FARPROC
#elif defined(linux) || defined(__linux)
#include <dlfcn.h>
#define dll_fd void*
#define dll_func_name const char*
#endif

namespace zsky::helper
{
	class DllHelper
	{
	private:
		dll_fd m_fd;
		std::map<std::string, dll_func_name> m_map;
		std::mutex m_mutex;

	public:
		DllHelper():m_fd(nullptr){}
		~DllHelper() noexcept(false);

		bool Load(const std::string& dllpath);
		bool UnLoad();

		template<typename T, typename... Args>
		std::invoke_result_t<T, Args...> InvokeFunc(const std::string& funcName, Args... args)
		{
			auto func = GetFunction<T>(funcName);
			if (func == nullptr)
			{
				std::string error_str = "dll cannot find this func: " + funcName;
				throw std::exception(error_str);
			}
			return func(std::forward<Args>(args)...);
		}

	private:
		template<typename T>
		std::function<T> GetFunction(const std::string& funcName)
		{
			std::unique_lock<std::mutex> locker;
			auto it = m_map.find(funcName);
			if (it == m_map.end())
			{
#if defined(WIN32) || defined(_WIN32)
				auto addr = GetProcAddress(m_fd, funcName.c_str());
#elif defined(linux) || defined(__linux)
				auto addr = dlsym(m_fd, funcName.c_str());
#endif
				if (!addr)
				{
					return nullptr;
				}
				m_map.insert(std::make_pair(funcName, addr));
				return std::function<T>((T*)addr);
			}
			return std::function<T>((T*)(it->second));
		}
	};
}