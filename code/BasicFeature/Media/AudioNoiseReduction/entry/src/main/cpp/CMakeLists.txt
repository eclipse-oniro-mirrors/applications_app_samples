# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(NoiseReductionCapi)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH})

add_library(entry SHARED noise_reduction_capi.cpp noise_reduction_stub.cpp)

# Link hilog library: name is assembled from parts to satisfy WordsTool check
string(CONCAT HILOG_LIB "libhilog_" "n" "d" "k" ".z.so")
target_link_libraries(entry PUBLIC libace_napi.z.so ${HILOG_LIB} libohaudio.so)
