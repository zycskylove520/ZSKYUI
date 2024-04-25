# Vulkan�������ļ�

# ����ZSKY_global.cmake�ļ�����cmake�ļ��������������
include(${CMAKE_CURRENT_LIST_DIR}/../ZSKY_global.cmake)

# ��ƽ̨���õ��������cmake�ļ���������õ���3rdpartyĿ¼�µ�Windowsƽ̨�汾��Vulkan��cmake�ļ�
if(${ZSKY_PLATFORM} MATCHES "Windows")
	include(${ZSKY_3RDPARTY_ROOT_DIR}/Vulkan/Windows/cmake/Vulkan-config.cmake)
else()
	message(FATAL_ERROR "not support current platform : ${ZSKY_PLATFORM}" )
endif()

# ����Ĳ���Ϊ�Ѷ�Ӧ�ĵ����������Ϣ��������һ�±�����ͳһ�����������
# ��������ΪZSKY_3RDPARTY_XXX��_β׺
set(ZSKY_3RDPARTY_Vulkan_INCLUDE_DIR ${Vulkan_INCLUDE_DIR})								# ���ð���ͷ�ļ�Ŀ¼
set(ZSKY_3RDPARTY_Vulkan_LIB_DIR ${Vulkan_LIBDIR})										# ���ÿ�Ŀ¼
set(ZSKY_3RDPARTY_Vulkan_LIBRARIES Vulkan::Vulkan)										# ���þ�̬���ӿ�
set(ZSKY_3RDPARTY_Vulkan_DLL "${ZSKY_3RDPARTY_Vulkan_LIB_DIR}/vulkan-1.dll")			# ���ö�̬�⣬����Ǹÿ��Ƕ�̬�⣬��ô��Ҫ������������������ñ������ڰ�װ��̬�⵽��װĿ¼

# �������������Դ����汾�ģ��������������ΪSSS����ô������ʾ������
# set(ZSKY_3RDPARTY_SSS_INCLUDE_DIR ${SSS_INCLUDE_DIR})								# ���ð���ͷ�ļ�Ŀ¼
# set(ZSKY_3RDPARTY_SSS_SOURCE ${SSS_SOURCE}											# ���ÿ�Դ�ļ�