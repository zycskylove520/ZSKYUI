if(CMAKE_SIZEOF_VOID_P STREQUAL "4")
    set(_vulkan_arch_subdir "x86")
else(CMAKE_SIZEOF_VOID_P STREQUAL "8")
    set(_vulkan_arch_subdir "x64")
endif()

set(Vulkan_PREFIX "${CMAKE_CURRENT_LIST_DIR}/..")
set(Vulkan_INCLUDE_DIR "${Vulkan_PREFIX}/include")
set(Vulkan_LIBDIR "${Vulkan_PREFIX}/lib/${_vulkan_arch_subdir}")

set(_Vulkan_library     "${Vulkan_LIBDIR}/vulkan-1.lib")
set(_Vulkan_dll_library "${Vulkan_LIBDIR}/vulkan-1.dll")

add_library(Vulkan::Vulkan SHARED IMPORTED)
set_target_properties(Vulkan::Vulkan PROPERTIES
    IMPORTED_LOCATION "${_Vulkan_dll_library}"
    IMPORTED_IMPLIB "${_Vulkan_library}"
    INTERFACE_INCLUDE_DIRECTORIES "${Vulkan_INCLUDE_DIR}"
)