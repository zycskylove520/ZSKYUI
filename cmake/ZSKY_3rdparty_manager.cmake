## ��cmake�ļ�ר�����������������

include(${CMAKE_CURRENT_LIST_DIR}/ZSKY_global.cmake)

set(ZSKY_3RDPARTY_ALL_INCLUDE_DIR)   # ���е�������İ���Ŀ¼
set(ZSKY_3RDPARTY_ALL_LIB_DIR)       # ���е�������Ŀ�Ŀ¼
set(ZSKY_3RDPARTY_ALL_LIBRARIES)     # ���е�������ľ�̬��
set(ZSKY_3RDPARTY_ALL_DLL)           # ���е�������Ķ�̬��

# SDL2��
if(${USE_SDL2})
    include(${CMAKE_CURRENT_LIST_DIR}/3rdparty/SDL2.cmake)
    list(APPEND ZSKY_3RDPARTY_ALL_INCLUDE_DIR "${ZSKY_3RDPARTY_SDL_INCLUDE_DIR}")  
    list(APPEND ZSKY_3RDPARTY_ALL_LIB_DIR "${ZSKY_3RDPARTY_SDL_LIB_DIR}")
    list(APPEND ZSKY_3RDPARTY_ALL_LIBRARIES "${ZSKY_3RDPARTY_SDL_LIBRARIES}")
    list(APPEND ZSKY_3RDPARTY_ALL_DLL "${ZSKY_3RDPARTY_SDL_DLL}")
endif()

# freeglut��
if(${USE_FREEGLUT})
    include(${CMAKE_CURRENT_LIST_DIR}/3rdparty/freeglut.cmake)
    list(APPEND ZSKY_3RDPARTY_ALL_INCLUDE_DIR "${ZSKY_3RDPARTY_FREEGLUT_INCLUDE_DIR}")  
    list(APPEND ZSKY_3RDPARTY_ALL_LIB_DIR "${ZSKY_3RDPARTY_FREEGLUT_LIB_DIR}")
    list(APPEND ZSKY_3RDPARTY_ALL_LIBRARIES "${ZSKY_3RDPARTY_FREEGLUT_LIBRARIES}")
    list(APPEND ZSKY_3RDPARTY_ALL_DLL "${ZSKY_3RDPARTY_FREEGLUT_DLL}")
endif()

# glfw��
if(${USE_GLFW})
    include(${CMAKE_CURRENT_LIST_DIR}/3rdparty/glfw.cmake)
    list(APPEND ZSKY_3RDPARTY_ALL_INCLUDE_DIR "${ZSKY_3RDPARTY_GLFW_INCLUDE_DIR}")  
    list(APPEND ZSKY_3RDPARTY_ALL_LIB_DIR "${ZSKY_3RDPARTY_GLFW_LIB_DIR}")
    list(APPEND ZSKY_3RDPARTY_ALL_LIBRARIES "${ZSKY_3RDPARTY_GLFW_LIBRARIES}")
endif()

# OpenGL��
if(${USE_OPENGL2} OR ${USE_OPENGL3})
    find_package(OpenGL REQUIRED)
    if(${CMAKE_SYSTEM_NAME} MATCHES "Windows" OR ${CMAKE_SYSTEM_NAME} MATCHES "Darwin")  # Windows����ϵͳ�Զ�����OpenGL�汾
        list(APPEND ZSKY_3RDPARTY_ALL_LIBRARIES OpenGL::GL)
    elseif(${CMAKE_SYSTEM_NAME} MATCHES "Linux")  
    endif()
endif()

# Vulkan��
if(${USE_VULKAN})
    include(${CMAKE_CURRENT_LIST_DIR}/3rdparty/Vulkan.cmake)
    list(APPEND ZSKY_3RDPARTY_ALL_INCLUDE_DIR "${ZSKY_3RDPARTY_Vulkan_INCLUDE_DIR}")  
    list(APPEND ZSKY_3RDPARTY_ALL_LIB_DIR "${ZSKY_3RDPARTY_Vulkan_LIB_DIR}")
    list(APPEND ZSKY_3RDPARTY_ALL_LIBRARIES "${ZSKY_3RDPARTY_Vulkan_LIBRARIES}")
    list(APPEND ZSKY_3RDPARTY_ALL_DLL "${ZSKY_3RDPARTY_Vulkan_DLL}")
endif()

# DirectX��
# ʹ��DirectX��Ϊ��Ⱦ�����Ҫ�Լ��������·���޸�Ϊ�Լ����Ե�Windows Kits��·����
if(${USE_DIRECTX9})
    list(APPEND ZSKY_3RDPARTY_ALL_INCLUDE_DIR "D:/Windows Kits/10/Include/10.0.22621.0/um/x64")  
    list(APPEND ZSKY_3RDPARTY_ALL_LIB_DIR "D:/Windows Kits/10/Lib/10.0.22621.0/um/x64")
    list(APPEND ZSKY_3RDPARTY_ALL_LIBRARIES "d3d9.lib")
endif()

if(${USE_DIRECTX10})
    list(APPEND ZSKY_3RDPARTY_ALL_INCLUDE_DIR "D:/Windows Kits/10/Include/10.0.22621.0/um/x64")  
    list(APPEND ZSKY_3RDPARTY_ALL_LIB_DIR "D:/Windows Kits/10/Lib/10.0.22621.0/um/x64")
    list(APPEND ZSKY_3RDPARTY_ALL_LIBRARIES "d3d10.lib" "d3dcompiler.lib" "dxgi.lib")
endif()

if(${USE_DIRECTX11})
    list(APPEND ZSKY_3RDPARTY_ALL_INCLUDE_DIR "D:/Windows Kits/10/Include/10.0.22621.0/um/x64")  
    list(APPEND ZSKY_3RDPARTY_ALL_LIB_DIR "D:/Windows Kits/10/Lib/10.0.22621.0/um/x64")
    list(APPEND ZSKY_3RDPARTY_ALL_LIBRARIES "d3d11.lib" "d3dcompiler.lib" "dxgi.lib")
endif()

if(${USE_DIRECTX12})
    list(APPEND ZSKY_3RDPARTY_ALL_INCLUDE_DIR "D:/Windows Kits/10/Include/10.0.22621.0/um/x64")  
    list(APPEND ZSKY_3RDPARTY_ALL_LIB_DIR "D:/Windows Kits/10/Lib/10.0.22621.0/um/x64")
    list(APPEND ZSKY_3RDPARTY_ALL_LIBRARIES "d3d12.lib" "d3dcompiler.lib" "dxgi.lib")
endif()

# freetype��
include(${CMAKE_CURRENT_LIST_DIR}/3rdparty/freetype.cmake)
list(APPEND ZSKY_3RDPARTY_ALL_INCLUDE_DIR "${ZSKY_3RDPARTY_freetype_INCLUDE_DIR}")  
list(APPEND ZSKY_3RDPARTY_ALL_LIB_DIR "${ZSKY_3RDPARTY_freetype_LIB_DIR}")
list(APPEND ZSKY_3RDPARTY_ALL_LIBRARIES "${ZSKY_3RDPARTY_freetype_LIBRARIES}")
list(APPEND ZSKY_3RDPARTY_ALL_DLL "${ZSKY_3RDPARTY_freetype_DLL}")