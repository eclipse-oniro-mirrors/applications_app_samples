# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(drawing_test)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED
    napi_init.cpp
    samples/sample_xcomponent.cpp
    plugin/plugin_manager.cpp
)
find_library(
    hilog-lib
    hilog_ndk.z
)
target_link_libraries(entry PUBLIC ${hilog-lib})
target_link_libraries(entry PUBLIC libace_napi.z.so libnative_drawing.so libnative_window.so libace_ndk.z.so)