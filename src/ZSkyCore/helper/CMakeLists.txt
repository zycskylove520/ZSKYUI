set(zsky_core_helper_include_dir
	${CMAKE_CURRENT_SOURCE_DIR}
)

set(zsky_core_helper_source
	DllHelper.cpp
	StringConvHelper.cpp)

add_library(zsky_core_helper STATIC ${zsky_core_helper_source})

target_include_directories(zsky_core_helper PUBLIC ${zsky_core_helper_include_dir})