# ZSYUI��һ������Dear imgui�����Ŀ���ɵ��ʽ��cmake��Ŀ��

### ͨ��ʹ��cmake�������Լ���imgui����������visual studio���ƿأ��������ֲ��������ͬ��ƽ̨��linux��Windows��MacOS��Android�ȡ�ʹ��cmake�����������Ŀ������������⣬���Ի�ø��ߵ����ɶȺ͸���Ķ��ƻ���
### Ŀǰ����Ŀ��ʵ����Windowsƽ̨����ͨ���Ķ�����ģ���README�ʹ����е�ע�ͣ��κ��˶����Ժ����׵���չ������ƽ̨��δ��ZSYUIҲ��ʵ�ֲ�֧������ƽ̨��

****������Ŀǰ֧�ֵ�Dear Imgui�ĺ�����****��
Windows��
- GLFW + OpenGL2
- GLFW + OpenGL3
- GLFW + Vulkan
- SDL2 + DirectX11
- SDL2 + OpenGL2
- SDL2 + OpenGL3
- SDL2 + Vulkan
- SDL2 + SDLRenderer2
- WIN32 + OpenGL3
- WIN32 + DirectX9
- WIN32 + DirectX10
- WIN32 + DirectX11

��ǰWindowsƽ̨��ʱ��֧��GLUT + OpenGL2��ϣ�GLUT��֪��Ϊʲô���Ǳ�δ�ҵ�dll����Դ�������Ѱ�����Ӧdll����λ�����߸���Ȥ�����г��ԡ�

MacOS��
���豸δ���ԡ�

Linux��
δ���ԡ�

Android��
δ���ԡ�

## ʹ������ָ��
����Ŀ�Դ�SDL2��Vulkan��һϵ�п⣬���迪�����������أ��������Ҫ�����и��¿⡣

1. ����cmakeĿ¼�µ�****ZSKY_global.cmake****�ļ��У��޸���Ҫ�ĺ����ϣ�ע��ͼ�ο����Ⱦ���ÿ��ֻ������һ�������÷���Ϊ����Ҫ��option�޸�ΪON�����ʹ��Win32��Ϊͼ��⣬��Ҫ��**ZSKY_3rdparty_manager.cmake**���޸�DirectX���Windows Kits��·����
2. ����out/buildĿ¼�£�ʹ��cmake���б����install��Ȼ����out/install�пɻ�ð�װ�ĳ������ʹ��visual studio�򿪣���ʹ��visual studio���б��롣

�޸���Ŀ�������cmake����ָ��Լ����ƻ���CMakeLists.txt����ĸ�Ŀ¼�µ�CMakeLists.txt�е�ע�͡�

#### ��Ŀ�������ֵ�˵��������Ķ�ӦĿ¼�µ�README�ļ��Լ�����ע�͡�