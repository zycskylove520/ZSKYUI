# Vulkan�������ļ�

include(${CMAKE_CURRENT_LIST_DIR}/../ZSKY_global.cmake)

if(${ZSKY_PLATFORM} MATCHES "Windows")
	include(${ZSKY_3RDPARTY_ROOT_DIR}/Vulkan/Windows/cmake/Vulkan-config.cmake)
else()
	message(FATAL_ERROR "not support current platform : ${ZSKY_PLATFORM}" )
endif()

set(ZSKY_3RDPARTY_Vulkan_INCLUDE_DIR ${Vulkan_INCLUDE_DIR})                    # ���ð���ͷ�ļ�
set(ZSKY_3RDPARTY_Vulkan_LIB_DIR ${Vulkan_LIBDIR})                             # ���ÿ�Ŀ¼
set(ZSKY_3RDPARTY_Vulkan_LIBRARIES Vulkan::Vulkan)                            # ���þ�̬���ӿ�
set(ZSKY_3RDPARTY_Vulkan_DLL "${ZSKY_3RDPARTY_Vulkan_LIB_DIR}/vulkan-1.dll")        # ���ö�̬��