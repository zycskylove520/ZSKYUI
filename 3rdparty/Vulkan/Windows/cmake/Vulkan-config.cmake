# 这一步是根据目录来区分使用哪种Windows系统的库，对应\Vulkan\Windows\lib\x86和\Vulkan\Windows\lib\x64这两个目录
if(CMAKE_SIZEOF_VOID_P STREQUAL "4")
    set(_vulkan_arch_subdir "x86")
else(CMAKE_SIZEOF_VOID_P STREQUAL "8")
    set(_vulkan_arch_subdir "x64")
endif()

set(Vulkan_PREFIX "${CMAKE_CURRENT_LIST_DIR}/..")    # 设置Vulkan库所在的路径
set(Vulkan_INCLUDE_DIR "${Vulkan_PREFIX}/include")    # 设置Vulkan库的包含目录的路径
set(Vulkan_LIBDIR "${Vulkan_PREFIX}/lib/${_vulkan_arch_subdir}")  # 设置Vulkan库的库目录的路径

set(_Vulkan_library     "${Vulkan_LIBDIR}/vulkan-1.lib")    # 设置Vulkan的静态库
set(_Vulkan_dll_library "${Vulkan_LIBDIR}/vulkan-1.dll")    # 设置Vulkan的动态库，如果使用的是静态库则不需要设置这个变量

add_library(Vulkan::Vulkan SHARED IMPORTED)   # 建议库名称同一写成 XXX:XXX 形式，如果是动态库参数使用：SHARED，如果是静态库参数使用STATIC

# 动态库的目标属性设置
set_target_properties(Vulkan::Vulkan PROPERTIES
    IMPORTED_LOCATION "${_Vulkan_dll_library}"                          # 这里设置动态库
    IMPORTED_IMPLIB "${_Vulkan_library}"                                # 这里设置静态库
    INTERFACE_INCLUDE_DIRECTORIES "${Vulkan_INCLUDE_DIR}"               # 这里设置包含目录
)

# 如果使用的是静态库，请按照下面的方式写
# 静态库的目标属性设置，注意静态库不需要IMPORTED_IMPLIB，并且把静态库写道IMPORTED_LOCATION参数后面
#set_target_properties(Vulkan::Vulkan PROPERTIES
#    IMPORTED_LOCATION "${_Vulkan_library}"                          # 这里设置静态库
#    INTERFACE_INCLUDE_DIRECTORIES "${Vulkan_INCLUDE_DIR}"               # 这里设置包含目录
#)

# 如果使用的是源代码版本的第三方库，假设第三方库名为SSS，以下是示例
# set(SSS_PREFIX "${CMAKE_CURRENT_LIST_DIR}/..")                                    # 设置SSS库所在的路径
# set(SSS_INCLUDE_DIR "${SSS_PREFIX}/include")                                      # 设置SSS库的包含目录的路径
# set(SSS_SOURCE "${SSS_PREFIX}/src/xxx1.cpp" "${SSS_PREFIX}/src/xxx2.cpp" ...)    # 添加SSS库的源代码，一般情况下第三方库如果是源代码版本会自带一个CMakeLists.txt，里面有一个变量已经添加好了所需的全部源代码，这里直接调用对应的变量即可
# 源代码版本的不需要add_library和set_target_properties。