/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef OECLIENTDEMO_COMMON_H
#define OECLIENTDEMO_COMMON_H

// Hilog domain/tag must be defined before including <hilog/log.h>.
// Kept identical to the ArkTS-side Logger (0xF811 / [Sample_OEClientDemo]) so a single
// hilog filter captures both the native and the ArkTS layers of this sample.
#define LOG_DOMAIN 0xF811
#define LOG_TAG "[Sample_OEClientDemo]"

#include <string>
#include <vector>

#include <hilog/log.h>
#include <multimedia/image_framework/image/pixelmap_native.h>

struct ContentEmbedFormat {
    std::string oeid;
    std::string name;
    std::string description;
    OH_PixelmapNative* icon;
    std::vector<std::string> fileExtensions;
};

#endif //OECLIENTDEMO_COMMON_H
