# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ModularObjectExtensionService)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include
                    ${NATIVERENDER_ROOT_PATH}/include/Taihe)

file(GLOB TaiHe_SOURCES "${NATIVERENDER_ROOT_PATH}/Taihe/*.cpp")
add_library(entry SHARED
    moe_ability.cpp
    ${TaiHe_SOURCES}
 TaiHe/calculator_stub_impl.h TaiHe/calculator_stub_impl.cpp)

target_link_libraries(entry PUBLIC
    libace_napi.z.so
    libhilog_ndk.z.so
    libability_runtime.so
    libability_base_want.so
    libipc_capi.so
)