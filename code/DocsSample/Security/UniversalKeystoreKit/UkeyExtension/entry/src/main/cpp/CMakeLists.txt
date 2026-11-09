# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(UkeyExtension)

set(SRC_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${SRC_ROOT_DIR}
                    ${SRC_ROOT_DIR}/include)

add_library(entry SHARED napi_init.cpp)
# The following are system-provided shared libraries
target_link_libraries(entry PUBLIC libace_napi.z.so libhuks_ndk.z.so libhuks_external_crypto.z.so libohcert_manager.z.so libsec_shared.z.so)
