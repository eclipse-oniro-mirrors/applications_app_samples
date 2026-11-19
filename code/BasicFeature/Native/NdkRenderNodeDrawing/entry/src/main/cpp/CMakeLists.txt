# Copyright (c) 2026 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(drawing_test)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

# 按绘制能力拆分源文件，便于对照文档阅读。
set(DRAWING_SOURCES
    native_bridge.cpp
    drawing/drawing_shape.cpp
    drawing/drawing_effect.cpp
    drawing/drawing_transform.cpp
    drawing/drawing_image.cpp
    drawing/drawing_text.cpp
)

# 能力域模块：每个文件对应一组 native_drawing 头文件，由 schema 驱动分派；
# cap_util.cpp 与 cap_text_util.cpp 是各能力域共用的绘制与排版辅助实现。
set(CAPABILITY_SOURCES
    capability/capability_dispatch.cpp
    capability/cap_util.cpp
    capability/cap_text_util.cpp
    capability/cap_canvas.cpp
    capability/cap_geometry.cpp
    capability/cap_paint.cpp
    capability/cap_color.cpp
    capability/cap_color_filter.cpp
    capability/cap_shader.cpp
    capability/cap_mask_filter.cpp
    capability/cap_image_filter.cpp
    capability/cap_bitmap.cpp
    capability/cap_pixelmap.cpp
    capability/cap_image_io.cpp
    capability/cap_font.cpp
    capability/cap_textblob.cpp
    capability/cap_typography.cpp
    capability/cap_shadow.cpp
    capability/cap_matrix.cpp
    capability/cap_record.cpp
    capability/cap_offscreen.cpp
    capability/cap_error.cpp
)

add_library(entry SHARED ${DRAWING_SOURCES} ${CAPABILITY_SOURCES})

find_library(
    # Sets the name of the path variable.
    hilog-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    hilog_ndk.z
)
target_link_libraries(entry PUBLIC ${hilog-lib})
target_link_libraries(entry PUBLIC libace_napi.z.so)
target_link_libraries(entry PUBLIC libnative_drawing.so)
target_link_libraries(entry PUBLIC libpixelmap_ndk.z.so libimage_source_ndk.z.so librawfile.z.so)
