# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ANITest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(CMAKE_CXX_STANDARD 17)
if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)
add_library(aniTest SHARED ani_init.cpp)
target_link_libraries(aniTest PUBLIC libhilog_ndk.z.so)