if(CMAKE_SIZEOF_VOID_P STREQUAL "4")
    set(_glfw_arch_subdir "x86")
else(CMAKE_SIZEOF_VOID_P STREQUAL "8")
    set(_glfw_arch_subdir "x64")
endif()

set(glfw_PREFIX "${CMAKE_CURRENT_LIST_DIR}/..")
set(glfw_INCLUDE_DIR "${glfw_PREFIX}/include")
set(glfw_LIBDIR "${glfw_PREFIX}/lib/${_glfw_arch_subdir}")

set(glfw_library     "${glfw_LIBDIR}/glfw3.lib")

add_library(glfw::glfw STATIC IMPORTED)
set_target_properties(glfw::glfw PROPERTIES
    IMPORTED_LOCATION "${glfw_library}"
    INTERFACE_INCLUDE_DIRECTORIES "${glfw_INCLUDE_DIR}"
)