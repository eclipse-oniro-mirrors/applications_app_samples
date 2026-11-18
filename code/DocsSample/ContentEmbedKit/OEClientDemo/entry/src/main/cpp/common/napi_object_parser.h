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

#ifndef OECLIENTDEMO_NAPI_OBJECT_PARSER_H
#define OECLIENTDEMO_NAPI_OBJECT_PARSER_H

#include "napi/native_api.h"

#include "common.h"
#include "utils.h"

// Builds a napi object {oeid,name,description,icon,fileExtensions} from a
// ContentEmbedFormat. Defined in napi_object_parser.cpp.
napi_value ParseNapi(napi_env env, const ContentEmbedFormat& format);

// Builds a napi array of ParseNapi results. Short wrapper, kept inline.
inline napi_value ParseNapi(napi_env env, const std::vector<ContentEmbedFormat>& formatList)
{
    napi_value obj;
    napi_create_array_with_length(env, formatList.size(), &obj);
    for (size_t i = 0; i < formatList.size(); ++i) {
        napi_set_element(env, obj, i, ParseNapi(env, formatList[i]));
    }
    return obj;
}

// Builds a napi result object {errCode} for a content-embed call. Short, inline.
inline napi_value GetResult(napi_env env, int32_t ret)
{
    napi_value result;
    napi_create_object(env, &result);
    napi_value errCode;
    napi_create_int32(env, ret, &errCode);
    napi_set_named_property(env, result, "errCode", errCode);
    return result;
}

// Builds a napi result object {errCode, data}. Short, inline.
inline napi_value GetResult(napi_env env, int32_t ret, napi_value value)
{
    napi_value result;
    napi_create_object(env, &result);
    napi_value errCode;
    napi_create_int32(env, ret, &errCode);
    napi_set_named_property(env, result, "errCode", errCode);
    napi_set_named_property(env, result, "data", value);
    return result;
}

#endif //OECLIENTDEMO_NAPI_OBJECT_PARSER_H
