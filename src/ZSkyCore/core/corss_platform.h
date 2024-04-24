// ���ļ������ƽ̨��غ�
#pragma once

// Windowsƽ̨
#if defined(_WIN32) || defined(__WIN32__)  
	#define ZSKY_WIN 1  
#else  
	#define ZSKY_WIN 0  
#endif  

// Linuxƽ̨
#if defined(linux) || defined(__linux)
	#define ZSKY_LINUX 1
#else
	#define ZSKY_LINUX 0
#endif

// macOS ƽ̨  
#ifdef __APPLE__  
	#if defined(__APPLE__) && defined(__MACH__)  
		#define ZSKY_MACOS 1  
	#else  
		#define ZSKY_MACOS 0  
	#endif  
#else  
	#define ZSKY_MACOS 0  
#endif  

// Android ƽ̨  
#ifdef __ANDROID__  
	#define ZSKY_ANDROID 1  
#else  
	#define ZSKY_ANDROID 0  
#endif

/*---------------------------------------------------------------------------------------*/

#if ZSKY_WIN //�����ж��Ƿ��� Windows ƽ̨
	#ifdef ZSKY_CROSS_PLATFORM_LIBRARY_EXPORTS  // ��һ�����CMake�ж���
		#define ZSK_CROSS_PLATFORM_API extern"C" __declspec(dllexport)
	#else
		#define ZSK_CROSS_PLATFORM_API extern"C" __declspec(dllimport)
	#endif
#elif ZSKY_LINUX // �� Linux ƽ̨
	#define ZSK_CROSS_PLATFORM_API extern"C"
#elif ZSKY_MACOS  // macOS ƽ̨������Ҫ����ĵ�����������  
	#define ZSK_CROSS_PLATFORM_API extern "C"  
#elif ZSKY_ANDROID  // Android ƽ̨��ͨ��Ҳ����Ҫ����ĵ������������������漰 JNI  
	#define ZSK_CROSS_PLATFORM_API extern "C"  
#endif