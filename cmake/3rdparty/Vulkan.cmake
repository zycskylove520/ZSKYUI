# Vulkan库配置文件

# 引入ZSKY_global.cmake文件，该cmake文件必须包含！！！
include(${CMAKE_CURRENT_LIST_DIR}/../ZSKY_global.cmake)

# 跨平台调用第三方库的cmake文件，这里调用的是3rdparty目录下的Windows平台版本的Vulkan的cmake文件
if(${ZSKY_PLATFORM} MATCHES "Windows")
	include(${ZSKY_3RDPARTY_ROOT_DIR}/Vulkan/Windows/cmake/Vulkan-config.cmake)
else()
	message(FATAL_ERROR "not support current platform : ${ZSKY_PLATFORM}" )
endif()

# 下面的步骤为把对应的第三方库的信息重新设置一下变量，统一命名方便管理。
# 命名规则为ZSKY_3RDPARTY_XXX库_尾缀
set(ZSKY_3RDPARTY_Vulkan_INCLUDE_DIR ${Vulkan_INCLUDE_DIR})								# 设置包含头文件目录
set(ZSKY_3RDPARTY_Vulkan_LIB_DIR ${Vulkan_LIBDIR})										# 设置库目录
set(ZSKY_3RDPARTY_Vulkan_LIBRARIES Vulkan::Vulkan)										# 设置静态链接库
set(ZSKY_3RDPARTY_Vulkan_DLL "${ZSKY_3RDPARTY_Vulkan_LIB_DIR}/vulkan-1.dll")			# 设置动态库，如果是该库是动态库，那么需要额外设置这个变量，该变量用于安装动态库到安装目录

# 假设第三方库是源代码版本的，假设第三方库名为SSS，那么下面是示例代码
# set(ZSKY_3RDPARTY_SSS_INCLUDE_DIR ${SSS_INCLUDE_DIR})								# 设置包含头文件目录
# set(ZSKY_3RDPARTY_SSS_SOURCE ${SSS_SOURCE}											# 设置库源文件