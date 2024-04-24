# imgui基础库

include(${CMAKE_CURRENT_SOURCE_DIR}/../../cmake/ZSKY_global.cmake)

set(imgui_base_include_dir 
	${CMAKE_CURRENT_SOURCE_DIR}
	${CMAKE_CURRENT_SOURCE_DIR}/backends
	${CMAKE_CURRENT_SOURCE_DIR}/misc
)

set(imgui_base_source 
	imgui.cpp
	imgui_demo.cpp
	imgui_draw.cpp
	imgui_tables.cpp
	imgui_widgets.cpp
	misc/freetype/imgui_freetype.cpp
)

# 引入图形库
if(${USE_GLFW})
	list(APPEND imgui_base_source backends/imgui_impl_glfw.cpp)
elseif(${USE_WIN32})
	list(APPEND imgui_base_source backends/imgui_impl_win32.cpp)
elseif(${USE_SDL2})
	list(APPEND imgui_base_source backends/imgui_impl_sdl2.cpp)
elseif(${USE_SDL3})
	list(APPEND imgui_base_source backends/imgui_impl_sdl3.cpp)
elseif(${USE_FREEGLUT})
	list(APPEND imgui_base_source backends/imgui_impl_glut.cpp)
endif()

# 引入渲染后端
if(${USE_OPENGL2})
	list(APPEND imgui_base_source backends/imgui_impl_opengl2.cpp)
elseif(${USE_OPENGL3})
	list(APPEND imgui_base_source backends/imgui_impl_opengl3.cpp)
elseif(${USE_VULKAN})
	list(APPEND imgui_base_source backends/imgui_impl_vulkan.cpp)
elseif(${USE_DIRECTX9})
	list(APPEND imgui_base_source backends/imgui_impl_dx9.cpp)
elseif(${USE_DIRECTX10})
	list(APPEND imgui_base_source backends/imgui_impl_dx10.cpp)
elseif(${USE_DIRECTX11})
	list(APPEND imgui_base_source backends/imgui_impl_dx11.cpp)
elseif(${USE_DIRECTX12})
	list(APPEND imgui_base_source backends/imgui_impl_dx12.cpp)
elseif(${USE_SDLRENDERER2})
	list(APPEND imgui_base_source backends/imgui_impl_sdlrenderer2.cpp)
elseif(${USE_SDLRENDERER3})
	list(APPEND imgui_base_source backends/imgui_impl_sdlrenderer3.cpp)
endif()

add_library(imgui_base STATIC ${imgui_base_source})

target_include_directories(imgui_base PUBLIC ${imgui_base_include_dir})