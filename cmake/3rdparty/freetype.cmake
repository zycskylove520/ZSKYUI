# freetype�������ļ�--Դ�����

include(${CMAKE_CURRENT_LIST_DIR}/../ZSKY_global.cmake)

if(${ZSKY_PLATFORM} MATCHES "Windows")
	include(${ZSKY_3RDPARTY_ROOT_DIR}/freetype/Windows/cmake/freetype-config.cmake)
else()
	message(FATAL_ERROR "not support current platform : ${ZSKY_PLATFORM}" )
endif()

set(ZSKY_3RDPARTY_freetype_INCLUDE_DIR ${freetype_INCLUDE_DIR})                      # ���ð���ͷ�ļ�
set(ZSKY_3RDPARTY_freetype_LIB_DIR ${freetype_LIBDIR})                               # ���ÿ�Ŀ¼
set(ZSKY_3RDPARTY_freetype_LIBRARIES freetype::freetype)                              # ���þ�̬���ӿ�
set(ZSKY_3RDPARTY_freetype_DLL "${ZSKY_3RDPARTY_freetype_LIB_DIR}/freetype.dll")  # ���ö�̬��