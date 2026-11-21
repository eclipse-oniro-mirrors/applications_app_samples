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

#ifndef BFRAME_QUERY_H
#define BFRAME_QUERY_H

#include <string>
#include "CapabilityTypes.h"

/**
 * 高压缩率B帧编码场景执行器。
 *
 * 与《高压缩率B帧编码》开发指南的场景化示例一一对应，文档示例代码以
 * [Start xxx]/[End xxx]标记嵌入各场景函数中，供文档通过代码片段名引用。
 */
class BFrameQuery {
public:
    // 场景：校验当前视频编码器是否支持B帧编码特性。
    static std::string FeatureCheck();
    // 场景：配置使能B帧编码特性的参数。
    static std::string Configure();
};

#endif // BFRAME_QUERY_H
