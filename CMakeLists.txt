# 要启动该项目的编译，请到ZSkyUI/out/build目录下(不存在ZSkyUI/out/build目录，请自行创建)，按顺序使用以下命令：
# 命令1："cmake ../.."
# 命令2："cmake --build . --target install" 或者使用 "make && make install"
# 该项目也支持直接使用visual studio进行编译

cmake_minimum_required (VERSION 3.8)

# 如果支持，请为 MSVC 编译器启用热重载。
if (POLICY CMP0141)
  cmake_policy(SET CMP0141 NEW)
  set(CMAKE_MSVC_DEBUG_INFORMATION_FORMAT "$<IF:$<AND:$<C_COMPILER_ID:MSVC>,$<CXX_COMPILER_ID:MSVC>>,$<$<CONFIG:Debug,RelWithDebInfo>:EditAndContinue>,$<$<CONFIG:Debug,RelWithDebInfo>:ProgramDatabase>>")
endif()

project (ZSKYUI)

# 加载cmake模块
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/ZSKY.cmake)

# 第三方包含目录
include_directories(${ZSKY_3RDPARTY_ALL_INCLUDE_DIR})
# 第三方库目录
link_directories(${ZSKY_3RDPARTY_ALL_LIB_DIR})
# 项目文件目录
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src)

# 安装可执行文件
install(TARGETS ZSKYUI RUNTIME DESTINATION ${ZSKY_INSTALL_ROOT_DIR})
# 安装第三方动态库
install(FILES ${ZSKY_3RDPARTY_ALL_DLL} DESTINATION ${ZSKY_INSTALL_ROOT_DIR})