# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(AVPlayerNDK)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED napi_init.cpp)

target_link_libraries(entry PUBLIC
    libohaudio.so
    libace_napi.z.so
    libace_ndk.z.so
    libnative_window.so
    libnative_drm.so
    libohfileuri.so
)

// [Start target_link_libraries]
target_link_libraries(entry PUBLIC 
    libavplayer.so 
    libnative_media_core.so 
    libhilog_ndk.z.so
)
// [End target_link_libraries]