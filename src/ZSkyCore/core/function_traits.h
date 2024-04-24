// 函数萃取模板

#pragma once
#include <type_traits>
#include <functional>

namespace zsky::core
{
	template<typename T>
	struct function_traits;

	// 对普通函数进行萃取
	template<typename Ret, typename... Args>
	struct function_traits<Ret(Args...)> : std::integral_constant<int, sizeof...(Args...)>
	{
	public:
		using function_type = Ret(Args...);   // 函数类型
		using return_type = Ret;              // 函数返回类型
		using stl_function_type = std::function<function_type>;  // std::function的函数类型
		using function_pointer = Ret(*)(Args...);   // 函数指针

		template<size_t N>
		using args_type = typename std::tuple_element<N, std::tuple<Args...>>::type;  // 函数第N个参数类型
	};

	// 对函数指针进行萃取
	template<typename Ret, typename... Args>
	struct function_traits<Ret(*)(Args...)> : function_traits<Ret(Args...)> {};

	// 对std::function进行萃取
	template<typename Ret, typename... Args>
	struct function_traits<std::function<Ret(Args...)>> : function_traits<Ret(Args...)> {};

	// 对从成员函数进行萃取
	#define FUNCTION_TRAITS(...) \
	template<typename ReturnType, typename ClassType, typename... Args> \
	struct function_traits<ReturnType(ClassType::*)(Args...) __VA_ARGS__> : function_traits<ReturnType(Args...)>{}; \

	FUNCTION_TRAITS()
	FUNCTION_TRAITS(const)
	FUNCTION_TRAITS(volatile)
	FUNCTION_TRAITS(const volatile)

	// 对函数对象进行萃取
	template<typename Callable>
	struct function_traits : function_traits<decltype(&Callable::operator())> {};
}
