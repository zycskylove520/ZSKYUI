// ���ļ�ΪZSKYUI�����������ļ�
// �û����Զ����޸ĸ��࣬�����ڸ�����ͬ����Ⱦ��˵�main.cpp�б�����

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
	/*����ʵ���Զ�����������ں���*/
	// ��ʼ��
	void ZSKYUI_Init() noexcept;

	// ÿ֡����
	void ZSKYUI_Update() noexcept;

public:
	// Our state
	bool show_demo_window = true;
	bool show_another_window = false;
	ImVec4 color = ImVec4(0.45f, 0.55f, 0.60f, 1.00f);
	ImGuiIO& io;
};
