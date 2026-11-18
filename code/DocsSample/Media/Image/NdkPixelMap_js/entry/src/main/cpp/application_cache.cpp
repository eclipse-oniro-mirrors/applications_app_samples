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

#include "application_cache.h"
#include <AbilityKit/ability_runtime/application_context.h>
#include <cstring>

// Keep AbilityKit's modern image-header transitive dependencies separate from the legacy MDK TU.
namespace SampleNdkPixelMap {
bool GetApplicationCacheDirectory(std::string& directory)
{
    constexpr int32_t CACHE_DIR_BUFFER_SIZE = 4096;
    char buffer[CACHE_DIR_BUFFER_SIZE] = {0};
    int32_t length = 0;
    const AbilityRuntime_ErrorCode status = OH_AbilityRuntime_ApplicationContextGetCacheDir(
        buffer, sizeof(buffer), &length);
    if (status != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR || length <= 0 || length >= CACHE_DIR_BUFFER_SIZE ||
        buffer[length] != '\0') {
        return false;
    }
    if (std::strlen(buffer) != static_cast<size_t>(length)) {
        return false;
    }
    directory.assign(buffer, static_cast<size_t>(length));
    return true;
}
}
