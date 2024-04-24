# ��Ŀ���ļ�

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/imgui_base)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ZSkyCore)

include_directories(.)

# ����Ӧ�ó���ͼ��
set(APP_ICON ${ZSKY_DATA_ROOT_DIR}/resource.rc)

# ����ֱ������Դ�ļ�
set(DLINK_SOURCE_FILE "ZSKYUI.cpp")

# ���ӿ�ִ���ļ�
# �ͻ��˿���
if(${USE_GLFW} AND ${USE_OPENGL2})
	add_executable(ZSKYUI "main/glfw_opengl2_main.cpp"  ${DLINK_SOURCE_FILE})			# ����ͨ��
	message(STATUS "use GLFW + OpenGL2 backend!")
elseif(${USE_GLFW} AND ${USE_OPENGL3})
	add_executable(ZSKYUI "main/glfw_opengl3_main.cpp"  ${DLINK_SOURCE_FILE})			# ����ͨ��
	message(STATUS "use GLFW + OpenGL3 backend!")
elseif(${USE_GLFW} AND ${USE_VULKAN})
	add_executable(ZSKYUI "main/glfw_vulkan_main.cpp"  ${DLINK_SOURCE_FILE})			# ����ͨ��
	message(STATUS "use GLFW + Vulkan backend!")
elseif(${USE_SDL2} AND ${USE_DIRECTX11})
	add_executable(ZSKYUI "main/sdl2_directx11_main.cpp"  ${DLINK_SOURCE_FILE})			# ����ͨ��
	message(STATUS "use SDL2 + DirectX11 backend!")
elseif(${USE_SDL2} AND ${USE_OPENGL2})
	add_executable(ZSKYUI "main/sdl2_opengl2_main.cpp"  ${DLINK_SOURCE_FILE})			# ����ͨ��
	message(STATUS "use SDL2 + OpenGL2 backend!")
elseif(${USE_SDL2} AND ${USE_OPENGL3})
	add_executable(ZSKYUI "main/sdl2_opengl3_main.cpp"  ${DLINK_SOURCE_FILE})			# ����ͨ��
	message(STATUS "use SDL2 + OpenGL3 backend!")
elseif(${USE_SDL2} AND ${USE_VULKAN})
	add_executable(ZSKYUI "main/sdl2_vulkan_main.cpp"  ${DLINK_SOURCE_FILE})			# ����ͨ��
	message(STATUS "use SDL2 + Vulkan backend!")
elseif(${USE_SDL2} AND ${USE_SDLRENDERER2})
	add_executable(ZSKYUI "main/sdl2_sdlrenderer2_main.cpp"  ${DLINK_SOURCE_FILE})		# ����ͨ��	
	message(STATUS "use SDL2 + SDLRenderer2 backend!")
elseif(${USE_WIN32} AND ${USE_OPENGL3})
	add_executable(ZSKYUI "main/win32_opengl3_main.cpp"  ${DLINK_SOURCE_FILE})			# ����ͨ��
	message(STATUS "use WIN32 + OpenGL3 backend!")
elseif(${USE_WIN32} AND ${USE_DIRECTX9})
	add_executable(ZSKYUI "main/win32_directx9_main.cpp"  ${DLINK_SOURCE_FILE})			# ����ͨ��
	message(STATUS "use WIN32 + DirectX9 backend!")
elseif(${USE_WIN32} AND ${USE_DIRECTX10})
	add_executable(ZSKYUI "main/win32_directx10_main.cpp"  ${DLINK_SOURCE_FILE})		# ����ͨ��
	message(STATUS "use WIN32 + DirectX10 backend!")
elseif(${USE_WIN32} AND ${USE_DIRECTX11})
	add_executable(ZSKYUI "main/win32_directx11_main.cpp"  ${DLINK_SOURCE_FILE})		# ����ͨ��
	message(STATUS "use WIN32 + DirectX11 backend!")
elseif(${USE_WIN32} AND ${USE_DIRECTX12})
	add_executable(ZSKYUI "main/win32_directx12_main.cpp"  ${DLINK_SOURCE_FILE})		# ����ͨ��
	message(STATUS "use WIN32 + DirectX12 backend!")
elseif(${USE_FREEGLUT} AND ${USE_OPENGL2})
	add_executable(ZSKYUI "main/glut_opengl2_main.cpp"  ${DLINK_SOURCE_FILE})			# ����ͨ��
	message(STATUS "use GLUT + OpenGL2 backend!")
elseif(${USE_SDL3} AND ${USE_OPENGL3})									
	add_executable(ZSKYUI "main/sdl3_opengl3_main.cpp"  ${DLINK_SOURCE_FILE})			# δ����
	message(STATUS "use SDL3 + OpenGL3 backend!")
elseif(${USE_SDL3} AND ${USE_SDLRENDERER3})
	add_executable(ZSKYUI "main/sdl3_sdlrenderer3_main.cpp"  ${DLINK_SOURCE_FILE})		# δ����
	message(STATUS "use SDL3 + SDLRenderer3 backend!")

# �ƶ��˿���
elseif(${USE_SDL2} AND ${USE_METAL})
	add_executable(ZSKYUI "main/sdl2_metal_main.mm"  ${DLINK_SOURCE_FILE})				# δ����
	message(STATUS "use SDL2 + Metal backend!")
endif()

# ���ӵ�������
target_link_libraries(ZSKYUI
					${ZSKY_3RDPARTY_ALL_LIBRARIES}
)

# ������Ŀ��Ŀ¼
target_link_libraries(ZSKYUI
					imgui_base
					zsky_core
)