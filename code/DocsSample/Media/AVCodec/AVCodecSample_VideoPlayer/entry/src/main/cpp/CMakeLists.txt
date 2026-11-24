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

cmake_minimum_required(VERSION 3.16)
project(AVCodecSample_VideoPlayer LANGUAGES CXX)

add_library(entry SHARED player_napi.cpp player.cpp video_output.cpp)
target_compile_features(entry PRIVATE cxx_std_17)
target_link_libraries(entry PRIVATE
    libace_napi.z.so
    libhilog_ndk.z.so
    libnative_media_core.so
    libnative_media_codecbase.so
    libnative_media_vdec.so
    libnative_media_avsource.so
    libnative_media_avdemuxer.so
    libnative_window.so
    libnative_buffer.so
    libnative_fence.so
)
