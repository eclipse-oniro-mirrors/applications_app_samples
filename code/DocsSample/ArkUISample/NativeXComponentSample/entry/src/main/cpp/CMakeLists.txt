# [Start cmake_lists]
# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(XComponent)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
add_definitions(-DOHOS_PLATFORM)

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(
    ${NATIVERENDER_ROOT_PATH}
    ${NATIVERENDER_ROOT_PATH}/include
    ${NATIVERENDER_ROOT_PATH}/render
    ${NATIVERENDER_ROOT_PATH}/manager
)

add_library(nativerender SHARED
    render/EGLRender.cpp
    render/egl_core.cpp
    render/plugin_render.cpp
    manager/plugin_manager.cpp
    napi_init.cpp
)

find_library(
    # 设置路径变量的名称。
    EGL-lib
    # 指定要让CMake查找的NDK库的名称。
    EGL
)

find_library(
    # 设置路径变量的名称。
    GLES-lib
    # 指定要让CMake查找的NDK库的名称。
    GLESv3
)

find_library(
    # 设置路径变量的名称。
    hilog-lib
    # 指定要让CMake查找的NDK库的名称。
    hilog_ndk.z
)

find_library(
    # 设置路径变量的名称。
    libace-lib
    # 指定要让CMake查找的NDK库的名称。
    ace_ndk.z
)

find_library(
    # 设置路径变量的名称。
    libnapi-lib
    # 指定要让CMake查找的NDK库的名称。
    ace_napi.z
)

find_library(
    # 设置路径变量的名称。
    libuv-lib
    # 指定要让CMake查找的NDK库的名称。
    uv
)

target_link_libraries(nativerender PUBLIC
    ${EGL-lib} ${GLES-lib} ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib} libnative_window.so)
# [End cmake_lists]
