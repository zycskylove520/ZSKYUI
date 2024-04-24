// ������ȡģ��

#pragma once
#include <type_traits>
#include <functional>

namespace zsky::core
{
	template<typename T>
	struct function_traits;

	// ����ͨ����������ȡ
	template<typename Ret, typename... Args>
	struct function_traits<Ret(Args...)> : std::integral_constant<int, sizeof...(Args...)>
	{
	public:
		using function_type = Ret(Args...);   // ��������
		using return_type = Ret;              // ������������
		using stl_function_type = std::function<function_type>;  // std::function�ĺ�������
		using function_pointer = Ret(*)(Args...);   // ����ָ��

		template<size_t N>
		using args_type = typename std::tuple_element<N, std::tuple<Args...>>::type;  // ������N����������
	};

	// �Ժ���ָ�������ȡ
	template<typename Ret, typename... Args>
	struct function_traits<Ret(*)(Args...)> : function_traits<Ret(Args...)> {};

	// ��std::function������ȡ
	template<typename Ret, typename... Args>
	struct function_traits<std::function<Ret(Args...)>> : function_traits<Ret(Args...)> {};

	// �Դӳ�Ա����������ȡ
	#define FUNCTION_TRAITS(...) \
	template<typename ReturnType, typename ClassType, typename... Args> \
	struct function_traits<ReturnType(ClassType::*)(Args...) __VA_ARGS__> : function_traits<ReturnType(Args...)>{}; \

	FUNCTION_TRAITS()
	FUNCTION_TRAITS(const)
	FUNCTION_TRAITS(volatile)
	FUNCTION_TRAITS(const volatile)

	// �Ժ������������ȡ
	template<typename Callable>
	struct function_traits : function_traits<decltype(&Callable::operator())> {};
}
