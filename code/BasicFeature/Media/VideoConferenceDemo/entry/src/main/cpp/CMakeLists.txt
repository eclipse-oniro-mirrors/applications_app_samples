# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(avscreen-capture-record-system-audio-arkts)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED napi_init.cpp capabilities/AVScreenCapture.cpp capabilities/AVScreenCapture.cpp capabilities/AVScreenCapture.h napi_init.cpp)
# [Start addLibraries]
target_link_libraries(entry PUBLIC libace_napi.z.so libace_ndk.z.so libjsvm.so libhilog_ndk.z.so libnative_avscreen_capture.so libuv.so libnative_media_core.so)
# [End addLibraries]