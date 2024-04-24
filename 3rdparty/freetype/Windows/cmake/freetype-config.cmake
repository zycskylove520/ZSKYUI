# 设置 FreeType 的前缀和包含目录  
set(freetype_PREFIX "${CMAKE_CURRENT_LIST_DIR}/..")
set(freetype_INCLUDE_DIR
    "${freetype_PREFIX}/include"
    "${freetype_PREFIX}/include/freetype"
    "${freetype_PREFIX}/include/freetype/internal"
    "${freetype_PREFIX}/include/freetype/config"
)
set(freetype_LIBDIR "${freetype_PREFIX}/lib")

set(_freetype_library     "${freetype_LIBDIR}/freetype.lib")
set(_freetype_dll_library "${freetype_LIBDIR}/freetype.dll")

add_library(freetype::freetype SHARED IMPORTED)
set_target_properties(freetype::freetype PROPERTIES
    IMPORTED_LOCATION "${_freetype_dll_library}"
    IMPORTED_IMPLIB "${_freetype_library}"
    INTERFACE_INCLUDE_DIRECTORIES "${freetype_INCLUDE_DIR}"
)