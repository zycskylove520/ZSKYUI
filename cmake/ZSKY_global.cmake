# ȫ��������Ϣģ��

include(${CMAKE_CURRENT_LIST_DIR}/ZSKY_utils.cmake)

ZSKY_FUNC_CHECK_AND_SET_PLATDORM()  # ���ñ���ƽ̨
option(ZSKY_BUILD_MODE "" OFF)

# ����C++�汾
if (CMAKE_VERSION VERSION_GREATER 3.12)  
  set(CMAKE_CXX_STANDARD 17)  
  set(CMAKE_CXX_STANDARD_REQUIRED ON)  
endif()

set(ZSKY_PROJECT_ROOT_DIR "${CMAKE_CURRENT_LIST_DIR}/../")          # ������Ŀ��Ŀ¼
set(ZSKY_SRC_ROOT_DIR "${CMAKE_CURRENT_LIST_DIR}/../src/")          # ����src��Ŀ¼
set(ZSKY_DATA_ROOT_DIR "${CMAKE_CURRENT_LIST_DIR}/../data/")        # ����data��Ŀ¼
set(ZSKY_3RDPARTY_ROOT_DIR  "${ZSKY_PROJECT_ROOT_DIR}/3rdparty/")   # ���õ�������ĸ�Ŀ¼
set(ZSKY_OUT_ROOT_DIR "${ZSKY_PROJECT_ROOT_DIR}/out/")              # �������Ŀ¼
set(ZSKY_BUILD_ROOT_DIR "${ZSKY_OUT_ROOT_DIR}/build/")              # ����buildĿ¼
set(ZSKY_INSTALL_ROOT_DIR "${ZSKY_OUT_ROOT_DIR}/install/")          # ����installĿ¼

# ���������ĺ�ˣ���˷�Ϊͼ�ο����Ⱦ���
# ͼ�ο����Ⱦ���ÿ��ֻ������һ��
# ������ͼ�ο�
option(USE_GLFW "ʹ��GLFWͼ�ο�" OFF)						# ����ͨ��
option(USE_FREEGLUT "ʹ��FreeGLUTͼ�ο�" OFF)				# ����ʧ�ܣ��޷��ҵ�dll
option(USE_WIN32 "ʹ��Win32ͼ�ο�" OFF)						# ����ͨ��
option(USE_SDL2 "ʹ��SDL2ͼ�ο�" ON)						# ����ͨ��
option(USE_SDL3 "ʹ��SDL3ͼ�ο�" OFF)						# δ����

# ��������Ⱦ���
option(USE_OPENGL2 "ʹ��OpenGL2��Ⱦ���" OFF)				# ����ͨ��
option(USE_OPENGL3 "ʹ��OpenGL3��Ⱦ���" OFF)				# ����ͨ��
option(USE_VULKAN "ʹ��Vulkan��Ⱦ���" ON)					# ����ͨ��
option(USE_DIRECTX9 "ʹ��DirectX9��Ⱦ���" OFF)				# ����ͨ��
option(USE_DIRECTX10 "ʹ��DirectX10��Ⱦ���" OFF)			# ����ͨ��
option(USE_DIRECTX11 "ʹ��DirectX11��Ⱦ���" OFF)			# ����ͨ��
option(USE_DIRECTX12 "ʹ��DirectX12��Ⱦ���" OFF)			# ����ͨ��
option(USE_SDLRENDERER2 "ʹ��SDLRenderer2��Ⱦ���" OFF)		# ����ͨ��
option(USE_SDLRENDERER3 "ʹ��SDLRenderer3��Ⱦ���" OFF)		# δ����
option(USE_METAL "ʹ��Metal��Ⱦ���" OFF)					# δ����