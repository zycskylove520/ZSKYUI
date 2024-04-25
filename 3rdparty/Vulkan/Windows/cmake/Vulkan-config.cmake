# ��һ���Ǹ���Ŀ¼������ʹ������Windowsϵͳ�Ŀ⣬��Ӧ\Vulkan\Windows\lib\x86��\Vulkan\Windows\lib\x64������Ŀ¼
if(CMAKE_SIZEOF_VOID_P STREQUAL "4")
    set(_vulkan_arch_subdir "x86")
else(CMAKE_SIZEOF_VOID_P STREQUAL "8")
    set(_vulkan_arch_subdir "x64")
endif()

set(Vulkan_PREFIX "${CMAKE_CURRENT_LIST_DIR}/..")    # ����Vulkan�����ڵ�·��
set(Vulkan_INCLUDE_DIR "${Vulkan_PREFIX}/include")    # ����Vulkan��İ���Ŀ¼��·��
set(Vulkan_LIBDIR "${Vulkan_PREFIX}/lib/${_vulkan_arch_subdir}")  # ����Vulkan��Ŀ�Ŀ¼��·��

set(_Vulkan_library     "${Vulkan_LIBDIR}/vulkan-1.lib")    # ����Vulkan�ľ�̬��
set(_Vulkan_dll_library "${Vulkan_LIBDIR}/vulkan-1.dll")    # ����Vulkan�Ķ�̬�⣬���ʹ�õ��Ǿ�̬������Ҫ�����������

add_library(Vulkan::Vulkan SHARED IMPORTED)   # ���������ͬһд�� XXX:XXX ��ʽ������Ƕ�̬�����ʹ�ã�SHARED������Ǿ�̬�����ʹ��STATIC

# ��̬���Ŀ����������
set_target_properties(Vulkan::Vulkan PROPERTIES
    IMPORTED_LOCATION "${_Vulkan_dll_library}"                          # �������ö�̬��
    IMPORTED_IMPLIB "${_Vulkan_library}"                                # �������þ�̬��
    INTERFACE_INCLUDE_DIRECTORIES "${Vulkan_INCLUDE_DIR}"               # �������ð���Ŀ¼
)

# ���ʹ�õ��Ǿ�̬�⣬�밴������ķ�ʽд
# ��̬���Ŀ���������ã�ע�⾲̬�ⲻ��ҪIMPORTED_IMPLIB�����ҰѾ�̬��д��IMPORTED_LOCATION��������
#set_target_properties(Vulkan::Vulkan PROPERTIES
#    IMPORTED_LOCATION "${_Vulkan_library}"                          # �������þ�̬��
#    INTERFACE_INCLUDE_DIRECTORIES "${Vulkan_INCLUDE_DIR}"               # �������ð���Ŀ¼
#)

# ���ʹ�õ���Դ����汾�ĵ������⣬�������������ΪSSS��������ʾ��
# set(SSS_PREFIX "${CMAKE_CURRENT_LIST_DIR}/..")                                    # ����SSS�����ڵ�·��
# set(SSS_INCLUDE_DIR "${SSS_PREFIX}/include")                                      # ����SSS��İ���Ŀ¼��·��
# set(SSS_SOURCE "${SSS_PREFIX}/src/xxx1.cpp" "${SSS_PREFIX}/src/xxx2.cpp" ...)    # ���SSS���Դ���룬һ������µ������������Դ����汾���Դ�һ��CMakeLists.txt��������һ�������Ѿ���Ӻ��������ȫ��Դ���룬����ֱ�ӵ��ö�Ӧ�ı�������
# Դ����汾�Ĳ���Ҫadd_library��set_target_properties��