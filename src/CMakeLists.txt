# 项目子文件

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/imgui_base)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ZSkyCore)

include_directories(.)

# 设置应用程序图标
set(APP_ICON ${ZSKY_DATA_ROOT_DIR}/resource.rc)

# 添加直接链接源文件
set(DLINK_SOURCE_FILE "ZSKYUI.cpp")

# 添加可执行文件
# 客户端开发
if(${USE_GLFW} AND ${USE_OPENGL2})
	add_executable(ZSKYUI "main/glfw_opengl2_main.cpp"  ${DLINK_SOURCE_FILE})			# 测试通过
	message(STATUS "use GLFW + OpenGL2 backend!")
elseif(${USE_GLFW} AND ${USE_OPENGL3})
	add_executable(ZSKYUI "main/glfw_opengl3_main.cpp"  ${DLINK_SOURCE_FILE})			# 测试通过
	message(STATUS "use GLFW + OpenGL3 backend!")
elseif(${USE_GLFW} AND ${USE_VULKAN})
	add_executable(ZSKYUI "main/glfw_vulkan_main.cpp"  ${DLINK_SOURCE_FILE})			# 测试通过
	message(STATUS "use GLFW + Vulkan backend!")
elseif(${USE_SDL2} AND ${USE_DIRECTX11})
	add_executable(ZSKYUI "main/sdl2_directx11_main.cpp"  ${DLINK_SOURCE_FILE})			# 测试通过
	message(STATUS "use SDL2 + DirectX11 backend!")
elseif(${USE_SDL2} AND ${USE_OPENGL2})
	add_executable(ZSKYUI "main/sdl2_opengl2_main.cpp"  ${DLINK_SOURCE_FILE})			# 测试通过
	message(STATUS "use SDL2 + OpenGL2 backend!")
elseif(${USE_SDL2} AND ${USE_OPENGL3})
	add_executable(ZSKYUI "main/sdl2_opengl3_main.cpp"  ${DLINK_SOURCE_FILE})			# 测试通过
	message(STATUS "use SDL2 + OpenGL3 backend!")
elseif(${USE_SDL2} AND ${USE_VULKAN})
	add_executable(ZSKYUI "main/sdl2_vulkan_main.cpp"  ${DLINK_SOURCE_FILE})			# 测试通过
	message(STATUS "use SDL2 + Vulkan backend!")
elseif(${USE_SDL2} AND ${USE_SDLRENDERER2})
	add_executable(ZSKYUI "main/sdl2_sdlrenderer2_main.cpp"  ${DLINK_SOURCE_FILE})		# 测试通过	
	message(STATUS "use SDL2 + SDLRenderer2 backend!")
elseif(${USE_WIN32} AND ${USE_OPENGL3})
	add_executable(ZSKYUI "main/win32_opengl3_main.cpp"  ${DLINK_SOURCE_FILE})			# 测试通过
	message(STATUS "use WIN32 + OpenGL3 backend!")
elseif(${USE_WIN32} AND ${USE_DIRECTX9})
	add_executable(ZSKYUI "main/win32_directx9_main.cpp"  ${DLINK_SOURCE_FILE})			# 测试通过
	message(STATUS "use WIN32 + DirectX9 backend!")
elseif(${USE_WIN32} AND ${USE_DIRECTX10})
	add_executable(ZSKYUI "main/win32_directx10_main.cpp"  ${DLINK_SOURCE_FILE})		# 测试通过
	message(STATUS "use WIN32 + DirectX10 backend!")
elseif(${USE_WIN32} AND ${USE_DIRECTX11})
	add_executable(ZSKYUI "main/win32_directx11_main.cpp"  ${DLINK_SOURCE_FILE})		# 测试通过
	message(STATUS "use WIN32 + DirectX11 backend!")
elseif(${USE_WIN32} AND ${USE_DIRECTX12})
	add_executable(ZSKYUI "main/win32_directx12_main.cpp"  ${DLINK_SOURCE_FILE})		# 测试通过
	message(STATUS "use WIN32 + DirectX12 backend!")
elseif(${USE_FREEGLUT} AND ${USE_OPENGL2})
	add_executable(ZSKYUI "main/glut_opengl2_main.cpp"  ${DLINK_SOURCE_FILE})			# 测试通过
	message(STATUS "use GLUT + OpenGL2 backend!")
elseif(${USE_SDL3} AND ${USE_OPENGL3})									
	add_executable(ZSKYUI "main/sdl3_opengl3_main.cpp"  ${DLINK_SOURCE_FILE})			# 未测试
	message(STATUS "use SDL3 + OpenGL3 backend!")
elseif(${USE_SDL3} AND ${USE_SDLRENDERER3})
	add_executable(ZSKYUI "main/sdl3_sdlrenderer3_main.cpp"  ${DLINK_SOURCE_FILE})		# 未测试
	message(STATUS "use SDL3 + SDLRenderer3 backend!")

# 移动端开发
elseif(${USE_SDL2} AND ${USE_METAL})
	add_executable(ZSKYUI "main/sdl2_metal_main.mm"  ${DLINK_SOURCE_FILE})				# 未测试
	message(STATUS "use SDL2 + Metal backend!")
endif()

# 链接第三方库
target_link_libraries(ZSKYUI
					${ZSKY_3RDPARTY_ALL_LIBRARIES}
)

# 链接项目库目录
target_link_libraries(ZSKYUI
					imgui_base
					zsky_core
)
