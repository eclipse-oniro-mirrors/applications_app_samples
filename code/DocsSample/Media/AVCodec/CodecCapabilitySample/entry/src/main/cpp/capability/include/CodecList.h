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

#ifndef CODEC_LIST_H
#define CODEC_LIST_H

#include <cstdint>
#include <string>
#include <vector>
#include "CapabilityTypes.h"
#include <multimedia/player_framework/native_avcapability.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xFF02
#define LOG_TAG "CodecList"

struct CodecBriefInfo {
    std::string name;
    std::string mime;
    bool isHardware = false;
    bool isSecure = false;
    int32_t maxInstances = 0;
};

/**
 * 编解码器列表与详情查询器，为应用界面提供数据。
 */
class CodecList {
public:
    /**
     * 获取指定类别的编解码器列表。
     *
     * @param category 编解码器类别，取值见CodecCategory。
     * @return JSON数组字符串，如[{"name":"...","mime":"...","isHardware":true}]。
     */
    static std::string GetCodecListJson(int32_t category);

    /**
     * 获取指定名称编解码器的详细能力信息。
     *
     * @param category 编解码器类别，取值见CodecCategory。
     * @param name 编解码器名称。
     * @return 多行文本，每行为一条能力描述。
     */
    static std::string GetCodecDetail(int32_t category, const std::string &name);

private:
    static std::vector<CodecBriefInfo> CollectCodecs(int32_t category);
    static OH_AVCapability *FindCodec(int32_t category, const std::string &name);
    static std::string BuildDetail(OH_AVCapability *capability, int32_t category);
};

#endif // CODEC_LIST_H
