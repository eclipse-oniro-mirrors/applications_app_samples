# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(OEClientDemo)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED
    napi_init.cpp
    content_embed/content_embed_proxy.cpp
    common/utils.cpp
    common/napi_object_parser.cpp
)
# [Start content_embed_client_cmake]
target_link_libraries(entry PUBLIC
    libcontent_embed_ndk.so
    libhilog_ndk.z.so
    libace_napi.z.so
    libpixelmap.so
    libohfileshare.so
)
# [End content_embed_client_cmake]