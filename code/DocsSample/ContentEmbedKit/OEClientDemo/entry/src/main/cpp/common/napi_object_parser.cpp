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

#include "napi_object_parser.h"

napi_value ParseNapi(napi_env env, const ContentEmbedFormat& format)
{
    napi_value obj;
    napi_create_object(env, &obj);
    napi_value oeidValue;
    napi_create_string_utf8(env, format.oeid.c_str(), NAPI_AUTO_LENGTH, &oeidValue);
    napi_set_named_property(env, obj, "oeid", oeidValue);
    napi_value nameValue;
    napi_create_string_utf8(env, format.name.c_str(), NAPI_AUTO_LENGTH, &nameValue);
    napi_set_named_property(env, obj, "name", nameValue);
    napi_value descValue;
    napi_create_string_utf8(env, format.description.c_str(), NAPI_AUTO_LENGTH, &descValue);
    napi_set_named_property(env, obj, "description", descValue);
    napi_value image;
    Image_ErrorCode retCode = OH_PixelmapNative_ConvertPixelmapNativeToNapi(env, format.icon, &image);
    if (retCode != Image_ErrorCode::IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ConvertPixelmapNativeToNapi failed: %{public}d", retCode);
        napi_get_undefined(env, &image);
    }
    napi_set_named_property(env, obj, "icon", image);
    napi_value extsArr;
    napi_create_array_with_length(env, format.fileExtensions.size(), &extsArr);
    for (size_t i = 0; i < format.fileExtensions.size(); i++) {
        napi_value ext;
        napi_create_string_utf8(env, format.fileExtensions[i].c_str(), NAPI_AUTO_LENGTH, &ext);
        napi_set_element(env, extsArr, i, ext);
    }
    napi_set_named_property(env, obj, "fileExtensions", extsArr);
    return obj;
}
