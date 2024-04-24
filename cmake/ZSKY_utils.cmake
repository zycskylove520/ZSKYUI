# 杂项函数文件模块

# 检查并设置当前运行平台函数
function(ZSKY_FUNC_CHECK_AND_SET_PLATDORM)
	if(CMAKE_SYSTEM_NAME MATCHES "Windows")
		message(STATUS "current platform : Windows")
		set(ZSKY_PLATFORM "Windows" PARENT_SCOPE)
	elseif(CMAKE_SYSTEM_NAME MATCHES "Linux")
		message(STATUS "current platform : Linux" )
		set(ZSKY_PLATFORM "Linux" PARENT_SCOPE)
	elseif(CMAKE_SYSTEM_NAME MATCHES "Darwin")
		message(STATUS "current platform : MacOS")
		set(ZSKY_PLATFORM "MacOS" PARENT_SCOPE)
	else()
		message(FATAL_ERROR "unknown platform : ${CMAKE_SYSTEM_NAME}")
	endif()
endfunction()