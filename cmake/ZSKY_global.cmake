# 全局配置信息模块

include(${CMAKE_CURRENT_LIST_DIR}/ZSKY_utils.cmake)

ZSKY_FUNC_CHECK_AND_SET_PLATDORM()  # 设置编译平台
option(ZSKY_BUILD_MODE "" OFF)

# 设置C++版本
if (CMAKE_VERSION VERSION_GREATER 3.12)  
  set(CMAKE_CXX_STANDARD 17)  
  set(CMAKE_CXX_STANDARD_REQUIRED ON)  
endif()

set(ZSKY_PROJECT_ROOT_DIR "${CMAKE_CURRENT_LIST_DIR}/../")          # 设置项目根目录
set(ZSKY_SRC_ROOT_DIR "${CMAKE_CURRENT_LIST_DIR}/../src/")          # 设置src根目录
set(ZSKY_DATA_ROOT_DIR "${CMAKE_CURRENT_LIST_DIR}/../data/")        # 设置data根目录
set(ZSKY_3RDPARTY_ROOT_DIR  "${ZSKY_PROJECT_ROOT_DIR}/3rdparty/")   # 设置第三方库的根目录
set(ZSKY_OUT_ROOT_DIR "${ZSKY_PROJECT_ROOT_DIR}/out/")              # 设置输出目录
set(ZSKY_BUILD_ROOT_DIR "${ZSKY_OUT_ROOT_DIR}/build/")              # 设置build目录
set(ZSKY_INSTALL_ROOT_DIR "${ZSKY_OUT_ROOT_DIR}/install/")          # 设置install目录

# 决定启动的后端，后端分为图形库和渲染后端
# 图形库和渲染后端每种只能启用一个
# 以下是图形库
option(USE_GLFW "使用GLFW图形库" OFF)						# 测试通过
option(USE_FREEGLUT "使用FreeGLUT图形库" OFF)				# 测试失败，无法找到dll
option(USE_WIN32 "使用Win32图形库" OFF)						# 测试通过
option(USE_SDL2 "使用SDL2图形库" ON)						# 测试通过
option(USE_SDL3 "使用SDL3图形库" OFF)						# 未引入

# 以下是渲染后端
option(USE_OPENGL2 "使用OpenGL2渲染后端" OFF)				# 测试通过
option(USE_OPENGL3 "使用OpenGL3渲染后端" OFF)				# 测试通过
option(USE_VULKAN "使用Vulkan渲染后端" ON)					# 测试通过
option(USE_DIRECTX9 "使用DirectX9渲染后端" OFF)				# 测试通过
option(USE_DIRECTX10 "使用DirectX10渲染后端" OFF)			# 测试通过
option(USE_DIRECTX11 "使用DirectX11渲染后端" OFF)			# 测试通过
option(USE_DIRECTX12 "使用DirectX12渲染后端" OFF)			# 测试通过
option(USE_SDLRENDERER2 "使用SDLRenderer2渲染后端" OFF)		# 测试通过
option(USE_SDLRENDERER3 "使用SDLRenderer3渲染后端" OFF)		# 未引入
option(USE_METAL "使用Metal渲染后端" OFF)					# 未引入