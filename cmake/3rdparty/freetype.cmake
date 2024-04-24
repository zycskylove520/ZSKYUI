# freetype库配置文件--源码编译

include(${CMAKE_CURRENT_LIST_DIR}/../ZSKY_global.cmake)

if(${ZSKY_PLATFORM} MATCHES "Windows")
	include(${ZSKY_3RDPARTY_ROOT_DIR}/freetype/Windows/cmake/freetype-config.cmake)
else()
	message(FATAL_ERROR "not support current platform : ${ZSKY_PLATFORM}" )
endif()

set(ZSKY_3RDPARTY_freetype_INCLUDE_DIR ${freetype_INCLUDE_DIR})                      # 设置包含头文件
set(ZSKY_3RDPARTY_freetype_LIB_DIR ${freetype_LIBDIR})                               # 设置库目录
set(ZSKY_3RDPARTY_freetype_LIBRARIES freetype::freetype)                              # 设置静态链接库
set(ZSKY_3RDPARTY_freetype_DLL "${ZSKY_3RDPARTY_freetype_LIB_DIR}/freetype.dll")  # 设置动态库