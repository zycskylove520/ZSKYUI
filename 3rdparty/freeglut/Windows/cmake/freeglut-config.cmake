set(freeglut_PREFIX "${CMAKE_CURRENT_LIST_DIR}/..")
set(freeglut_INCLUDE_DIR "${freeglut_PREFIX}/include")
set(freeglut_LIBDIR "${freeglut_PREFIX}/lib/x64")

set(_freeglut_library     "${freeglut_LIBDIR}/freeglutd.lib")
set(_freeglut_dll_library "${freeglut_LIBDIR}/freeglutd.dll")

add_library(freeglut::freeglut SHARED IMPORTED)
set_target_properties(freeglut::freeglut PROPERTIES
    IMPORTED_LOCATION "${_freeglut_dll_library}"
    IMPORTED_IMPLIB "${_freeglut_library}"
    INTERFACE_INCLUDE_DIRECTORIES "${freeglut_INCLUDE_DIR}"
)