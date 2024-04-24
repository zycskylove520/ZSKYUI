# freeglut库配置文件

include(${CMAKE_CURRENT_LIST_DIR}/../ZSKY_global.cmake)

if(${ZSKY_PLATFORM} MATCHES "Windows")
	include(${ZSKY_3RDPARTY_ROOT_DIR}/freeglut/Windows/cmake/freeglut-config.cmake)
else()
	message(FATAL_ERROR "not support current platform : ${ZSKY_PLATFORM}" )
endif()

set(ZSKY_3RDPARTY_FREEGLUT_INCLUDE_DIR ${freeglut_INCLUDE_DIR})                    # 设置包含头文件
set(ZSKY_3RDPARTY_FREEGLUT_LIB_DIR ${freeglut_LIBDIR})                             # 设置库目录
set(ZSKY_3RDPARTY_FREEGLUT_LIBRARIES freeglut::freeglut)								# 设置静态链接库
set(ZSKY_3RDPARTY_FREEGLUT_DLL "${ZSKY_3RDPARTY_FREEGLUT_LIB_DIR}/freeglutd.dll")        # 设置动态库