# freeglut�������ļ�

include(${CMAKE_CURRENT_LIST_DIR}/../ZSKY_global.cmake)

if(${ZSKY_PLATFORM} MATCHES "Windows")
	include(${ZSKY_3RDPARTY_ROOT_DIR}/freeglut/Windows/cmake/freeglut-config.cmake)
else()
	message(FATAL_ERROR "not support current platform : ${ZSKY_PLATFORM}" )
endif()

set(ZSKY_3RDPARTY_FREEGLUT_INCLUDE_DIR ${freeglut_INCLUDE_DIR})                    # ���ð���ͷ�ļ�
set(ZSKY_3RDPARTY_FREEGLUT_LIB_DIR ${freeglut_LIBDIR})                             # ���ÿ�Ŀ¼
set(ZSKY_3RDPARTY_FREEGLUT_LIBRARIES freeglut::freeglut)								# ���þ�̬���ӿ�
set(ZSKY_3RDPARTY_FREEGLUT_DLL "${ZSKY_3RDPARTY_FREEGLUT_LIB_DIR}/freeglutd.dll")        # ���ö�̬��