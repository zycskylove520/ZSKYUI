set(zsky_core_core_include_dir
	${CMAKE_CURRENT_SOURCE_DIR}
)

add_library(zsky_core_core INTERFACE)

target_include_directories(zsky_core_core INTERFACE ${zsky_core_core_include_dir})