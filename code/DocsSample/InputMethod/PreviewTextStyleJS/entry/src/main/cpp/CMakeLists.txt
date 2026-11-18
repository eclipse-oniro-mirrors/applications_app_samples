cmake_minimum_required(VERSION 3.5.0)
project(PreviewTextStyleJS)

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

add_library(entry SHARED napi_init.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so libohinputmethod.so libhilog_ndk.z.so)
