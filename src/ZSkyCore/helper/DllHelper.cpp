#include "DllHelper.h"

namespace zsky::helper
{
	DllHelper::~DllHelper() noexcept(false)
	{
		bool res = UnLoad();
		if (!res)
		{
			throw std::exception("dll unload failed!");
		}
	}

	bool DllHelper::Load(const std::string& dllpath)
	{
#if defined(WIN32) || defined(_WIN32)
		m_fd = LoadLibrary(dllpath.data());
#elif defined(linux) || defined(__linux)
		m_fd = dlopen(dllpath.data(), RTLD_NOW);
#endif

		if (m_fd == nullptr)
		{
			std::cout << "load " << dllpath << " failed!\n";
			return false;
		}
		return true;
	}

	bool DllHelper::UnLoad()
	{
		if (m_fd == nullptr)
		{
			return true;
		}

#if defined(WIN32) || defined(_WIN32)
		auto res = FreeLibrary(m_fd);
		if (!res)
			return false;
#elif defined(linux) || defined(__linux)
		auto res = dlclose(m_fd);
		if (res)
			return false;
#endif
		return true;
	}
}
