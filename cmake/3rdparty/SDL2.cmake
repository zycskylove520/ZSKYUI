# SDL�������ļ�

include(${CMAKE_CURRENT_LIST_DIR}/../ZSKY_global.cmake)

if(${ZSKY_PLATFORM} MATCHES "Windows")
	include(${ZSKY_3RDPARTY_ROOT_DIR}/SDL2/Windows/cmake/sdl2-config.cmake)
else()
	message(FATAL_ERROR "not support current platform : ${ZSKY_PLATFORM}" )
endif()

set(ZSKY_3RDPARTY_SDL_INCLUDE_DIR ${SDL2_INCLUDE_DIR})                    # ���ð���ͷ�ļ�
set(ZSKY_3RDPARTY_SDL_LIB_DIR ${SDL2_LIBDIR})                             # ���ÿ�Ŀ¼
set(ZSKY_3RDPARTY_SDL_LIBRARIES SDL2::SDL2 SDL2::SDL2main)                 # ���þ�̬���ӿ�
set(ZSKY_3RDPARTY_SDL_DLL "${ZSKY_3RDPARTY_SDL_LIB_DIR}/SDL2.dll")        # ���ö�̬��