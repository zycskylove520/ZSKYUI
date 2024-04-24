// 该文件管理跨平台相关宏
#pragma once

// Windows平台
#if defined(_WIN32) || defined(__WIN32__)  
	#define ZSKY_WIN 1  
#else  
	#define ZSKY_WIN 0  
#endif  

// Linux平台
#if defined(linux) || defined(__linux)
	#define ZSKY_LINUX 1
#else
	#define ZSKY_LINUX 0
#endif

// macOS 平台  
#ifdef __APPLE__  
	#if defined(__APPLE__) && defined(__MACH__)  
		#define ZSKY_MACOS 1  
	#else  
		#define ZSKY_MACOS 0  
	#endif  
#else  
	#define ZSKY_MACOS 0  
#endif  

// Android 平台  
#ifdef __ANDROID__  
	#define ZSKY_ANDROID 1  
#else  
	#define ZSKY_ANDROID 0  
#endif

/*---------------------------------------------------------------------------------------*/

#if ZSKY_WIN //用于判断是否是 Windows 平台
	#ifdef ZSKY_CROSS_PLATFORM_LIBRARY_EXPORTS  // 这一句宏在CMake中定义
		#define ZSK_CROSS_PLATFORM_API extern"C" __declspec(dllexport)
	#else
		#define ZSK_CROSS_PLATFORM_API extern"C" __declspec(dllimport)
	#endif
#elif ZSKY_LINUX // 是 Linux 平台
	#define ZSK_CROSS_PLATFORM_API extern"C"
#elif ZSKY_MACOS  // macOS 平台，不需要特殊的导出导入声明  
	#define ZSK_CROSS_PLATFORM_API extern "C"  
#elif ZSKY_ANDROID  // Android 平台，通常也不需要特殊的导出导入声明，除非涉及 JNI  
	#define ZSK_CROSS_PLATFORM_API extern "C"  
#endif