# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(MyApplication)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include
                    ${NATIVERENDER_ROOT_PATH}/types/project)

add_library(entry SHARED napi_init.cpp types/project/rsa_pkcs1_segment_signature.cpp types/project/rsa_pkcs1_signature_restoration.cpp types/project/rsa_pkcs1_signature_validator.cpp types/project/rsa_pss_verification_tool.cpp types/project/ecdsa_signature_verification.cpp types/project/sm2_signature_verification.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so libohcrypto.so libhilog_ndk.z.so)