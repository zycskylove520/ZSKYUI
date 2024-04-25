# 项目子文件

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/imgui_base)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ZSkyCore)

include_directories(.)

# 设置应用程序图标，可自己做一个应用图标来设置，图标数据存放到data目录下
set(APP_ICON ${ZSKY_DATA_ROOT_DIR}/resource.rc)

# 添加直接链接源文件，如果在src目录下有其他源文件，可直接添加在语句添加
set(DLINK_SOURCE_FILE "ZSKYUI.cpp")

# ------------------------------添加后端主文件---------------------------------------
# 客户端开发
if(${USE_GLFW} AND ${USE_OPENGL2})
	list(APPEND DLINK_SOURCE_FILE "main/glfw_opengl2_main.cpp")				# 测试通过
	message(STATUS "use GLFW + OpenGL2 backend!")
elseif(${USE_GLFW} AND ${USE_OPENGL3})
	list(APPEND DLINK_SOURCE_FILE "main/glfw_opengl3_main.cpp")				# 测试通过
	message(STATUS "use GLFW + OpenGL3 backend!")
elseif(${USE_GLFW} AND ${USE_VULKAN})
	list(APPEND DLINK_SOURCE_FILE "main/glfw_vulkan_main.cpp")				# 测试通过
	message(STATUS "use GLFW + Vulkan backend!")
elseif(${USE_SDL2} AND ${USE_DIRECTX11})
	list(APPEND DLINK_SOURCE_FILE "main/sdl2_directx11_main.cpp")			# 测试通过
	message(STATUS "use SDL2 + DirectX11 backend!")
elseif(${USE_SDL2} AND ${USE_OPENGL2})
	list(APPEND DLINK_SOURCE_FILE "main/sdl2_opengl2_main.cpp")				# 测试通过
	message(STATUS "use SDL2 + OpenGL2 backend!")
elseif(${USE_SDL2} AND ${USE_OPENGL3})
	list(APPEND DLINK_SOURCE_FILE "main/sdl2_opengl3_main.cpp")				# 测试通过
	message(STATUS "use SDL2 + OpenGL3 backend!")
elseif(${USE_SDL2} AND ${USE_VULKAN})
	list(APPEND DLINK_SOURCE_FILE "main/sdl2_vulkan_main.cpp")				# 测试通过
	message(STATUS "use SDL2 + Vulkan backend!")
elseif(${USE_SDL2} AND ${USE_SDLRENDERER2})
	list(APPEND DLINK_SOURCE_FILE "main/sdl2_sdlrenderer2_main.cpp")		# 测试通过
	message(STATUS "use SDL2 + SDLRenderer2 backend!")
elseif(${USE_WIN32} AND ${USE_OPENGL3})
	list(APPEND DLINK_SOURCE_FILE "main/win32_opengl3_main.cpp")			# 测试通过
	message(STATUS "use WIN32 + OpenGL3 backend!")
elseif(${USE_WIN32} AND ${USE_DIRECTX9})
	list(APPEND DLINK_SOURCE_FILE "main/win32_directx9_main.cpp")			# 测试通过
	message(STATUS "use WIN32 + DirectX9 backend!")
elseif(${USE_WIN32} AND ${USE_DIRECTX10})
	list(APPEND DLINK_SOURCE_FILE "main/win32_directx10_main.cpp")			# 测试通过
	message(STATUS "use WIN32 + DirectX10 backend!")
elseif(${USE_WIN32} AND ${USE_DIRECTX11})
	list(APPEND DLINK_SOURCE_FILE "main/win32_directx11_main.cpp")			# 测试通过
	message(STATUS "use WIN32 + DirectX11 backend!")
elseif(${USE_WIN32} AND ${USE_DIRECTX12})
	list(APPEND DLINK_SOURCE_FILE "main/win32_directx12_main.cpp")			# 测试通过
	message(STATUS "use WIN32 + DirectX12 backend!")
elseif(${USE_FREEGLUT} AND ${USE_OPENGL2})
	list(APPEND DLINK_SOURCE_FILE "main/glut_opengl2_main.cpp")				# 测试失败
	message(STATUS "use GLUT + OpenGL2 backend!")
elseif(${USE_SDL3} AND ${USE_OPENGL3})			
	list(APPEND DLINK_SOURCE_FILE "main/sdl3_opengl3_main.cpp")				# 未测试
	message(STATUS "use SDL3 + OpenGL3 backend!")
elseif(${USE_SDL3} AND ${USE_SDLRENDERER3})
	list(APPEND DLINK_SOURCE_FILE "main/sdl3_sdlrenderer3_main.cpp")		# 未测试
	message(STATUS "use SDL3 + SDLRenderer3 backend!")

# 移动端开发
elseif(${USE_SDL2} AND ${USE_METAL})
	list(APPEND DLINK_SOURCE_FILE "main/sdl2_metal_main.mm")				# 未测试
	message(STATUS "use SDL2 + Metal backend!")
endif()
# -------------------------------------------------------------------------------------

# 添加可执行文件，以及添加第三方库的源代码
add_executable(ZSKYUI ${DLINK_SOURCE_FILE} ${ZSKY_3RDPARTY_ALL_SOURCE} ${APP_ICON})

# 链接第三方库
target_link_libraries(ZSKYUI
					${ZSKY_3RDPARTY_ALL_LIBRARIES}
)

# 链接项目库目录，如果还有新的库目录可以在这里添加
target_link_libraries(ZSKYUI
					imgui_base
					zsky_core
)
