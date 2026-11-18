# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(OEServerDemo)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED
    ole_ext_ability.cpp
)

# [Start content_embed_server_cmake]
target_link_libraries(entry PUBLIC
    libcontent_embed_ndk.so
    libhilog_ndk.z.so
    libace_napi.z.so
    libpixelmap.so
    libability_runtime.so
    libability_base_want.so
    libimage_source.so
    libohfileuri.so
    libuv.so
)
# [End content_embed_server_cmake]

add_library(comm SHARED
    napi_init.cpp
)

target_link_libraries(comm PUBLIC
    libace_napi.z.so
    libhilog_ndk.z.so
    entry
)
