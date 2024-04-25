// 该文件为ZSKYUI的生命周期文件
// 用户可自定义修改该类，该类在各个不同的渲染后端的main.cpp中被调用

#include <imgui.h>
class ZSKYUI final
{
public:
	explicit ZSKYUI();
	~ZSKYUI();
	ZSKYUI(ZSKYUI&&) = delete;
	ZSKYUI(const ZSKYUI&) = delete;
	ZSKYUI& operator=(const ZSKYUI&) = delete;
	ZSKYUI& operator=(ZSKYUI&&) = delete;

public:
	/*下面实现自定义的生命周期函数*/
	// 初始化
	void ZSKYUI_Init() noexcept;

	// 每帧更新
	void ZSKYUI_Update() noexcept;

public:
	// Our state
	bool show_demo_window = true;
	bool show_another_window = false;
	ImVec4 color = ImVec4(0.45f, 0.55f, 0.60f, 1.00f);
	ImGuiIO& io;
};
