# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(EncryptionDecryptionGuidance3DESArkTs)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED napi_init.cpp types/project/3des_ecb_encryption_decryption.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so libohcrypto.so libhilog_ndk.z.so)