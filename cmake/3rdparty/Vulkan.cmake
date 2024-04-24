# Vulkan库配置文件

include(${CMAKE_CURRENT_LIST_DIR}/../ZSKY_global.cmake)

if(${ZSKY_PLATFORM} MATCHES "Windows")
	include(${ZSKY_3RDPARTY_ROOT_DIR}/Vulkan/Windows/cmake/Vulkan-config.cmake)
else()
	message(FATAL_ERROR "not support current platform : ${ZSKY_PLATFORM}" )
endif()

set(ZSKY_3RDPARTY_Vulkan_INCLUDE_DIR ${Vulkan_INCLUDE_DIR})                    # 设置包含头文件
set(ZSKY_3RDPARTY_Vulkan_LIB_DIR ${Vulkan_LIBDIR})                             # 设置库目录
set(ZSKY_3RDPARTY_Vulkan_LIBRARIES Vulkan::Vulkan)                            # 设置静态链接库
set(ZSKY_3RDPARTY_Vulkan_DLL "${ZSKY_3RDPARTY_Vulkan_LIB_DIR}/vulkan-1.dll")        # 设置动态库