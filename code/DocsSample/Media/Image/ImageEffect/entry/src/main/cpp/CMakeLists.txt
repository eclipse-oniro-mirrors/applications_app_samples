# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ImageEffect)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include
                    ${NATIVERENDER_ROOT_PATH}/backend
                    ${NATIVERENDER_ROOT_PATH}/utils
)

add_library(entry SHARED
    napi_init.cpp
    utils/common_utils.cpp
    utils/json_utils.cpp
    utils/pixelmap_helper.cpp
    utils/egl_utils.cpp
    utils/gl_utils.cpp
    backend/image_edit.cpp
)

find_library(
    # 纹理输入场景所需的EGL库。
    EGL-lib
    EGL
)

find_library(
    # 纹理输入场景所需的OpenGL ES库。
    GLES-lib
    GLESv3
)

# [Start image_effect_cmake_libraries]
target_link_libraries(entry PUBLIC
     libace_napi.z.so
     libpixelmap_ndk.z.so
     libimage_packer.so
     libimage_source.so
     libhilog_ndk.z.so
     libimage_effect.so
     libpixelmap.so
     libnative_window.so
     libnative_buffer.so
     ${EGL-lib}
     ${GLES-lib}
)
# [End image_effect_cmake_libraries]
