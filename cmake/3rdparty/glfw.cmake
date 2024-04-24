# glfw�������ļ�

include(${CMAKE_CURRENT_LIST_DIR}/../ZSKY_global.cmake)

if(${ZSKY_PLATFORM} MATCHES "Windows")
	include(${ZSKY_3RDPARTY_ROOT_DIR}/glfw/Windows/cmake/glfw-config.cmake)
else()
	message(FATAL_ERROR "not support current platform : ${ZSKY_PLATFORM}" )
endif()

set(ZSKY_3RDPARTY_GLFW_INCLUDE_DIR ${glfw_INCLUDE_DIR})						# ���ð���ͷ�ļ�
set(ZSKY_3RDPARTY_GLFW_LIB_DIR ${glfw_LIBDIR})								# ���ÿ�Ŀ¼
set(ZSKY_3RDPARTY_GLFW_LIBRARIES glfw::glfw)									# ���þ�̬���ӿ�