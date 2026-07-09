# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(devEcoApplication)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED audio.cpp renderer/oh_audio_renderer.cpp capturer/oh_audio_capturer.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so libhilog_ndk.z.so libohaudio.so libuv.so)