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

#ifndef TEMPORAL_SCALABILITY_QUERY_H
#define TEMPORAL_SCALABILITY_QUERY_H

#include <string>
#include "CapabilityTypes.h"

/**
 * 具有抗弱网丢包能力的时域可分层编码场景执行器。
 *
 * 与《具有抗弱网丢包能力的时域可分层编码》开发指南的场景化示例一一对应，
 * 覆盖全局时域可分层特性与长期参考帧（LTR）特性的校验、配置与动态开关示例，
 * 文档示例代码以[Start xxx]/[End xxx]标记嵌入各场景函数中，供文档通过代码
 * 片段名引用。随帧通路回调注册的完整示例作为参考代码保留在源文件中。
 */
class TemporalScalabilityQuery {
public:
    // 场景：校验视频编码器是否支持全局时域可分层特性。
    static std::string FeatureCheck();
    // 场景：使能全局时域可分层特性时创建硬件编码器实例。
    static std::string CreateEncoder();
    // 场景：设置全局时域可分层编码特性参数。
    static std::string Configure();
    // 场景：运行过程中动态开启时域可分层能力。
    static std::string DynamicEnable();
    // 场景：运行过程中动态关闭时域可分层能力。
    static std::string DynamicDisable();
    // 场景：校验当前视频编码器是否支持LTR特性。
    static std::string LtrFeatureCheck();
    // 场景：配置阶段设置最大LTR数目。
    static std::string LtrConfigCount();
};

#endif // TEMPORAL_SCALABILITY_QUERY_H
