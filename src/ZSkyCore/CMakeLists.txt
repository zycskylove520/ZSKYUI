add_subdirectory(core)
add_subdirectory(helper)
add_subdirectory(net)

set(zsky_core_include_dir 
	${CMAKE_CURRENT_SOURCE_DIR}
)

add_library(zsky_core INTERFACE)

# Á´½Ó×ÓÄ¿Â¼¾²Ì¬¿â
target_link_libraries(zsky_core INTERFACE zsky_core_core zsky_core_helper)

target_include_directories(zsky_core INTERFACE ${zsky_core_include_dir})