/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef DRM_SAMPLE_H
#define DRM_SAMPLE_H

#include <string>

// 查询设备是否支持指定的DRM解决方案，name示例："com.clearplay.drm"。
bool IsMediaKeySystemSupported(const char *name);

// 演示MediaKeySystem的完整使用流程：创建、查询内容保护级别与证书状态、获取统计信息、销毁。
std::string MediaKeySystemFlow(const char *name);

// 演示MediaKeySession的完整使用流程：创建会话、生成媒体密钥请求、检查密钥状态、清除密钥、销毁。
std::string MediaKeySessionFlow(const char *name, const char *mimeType);

// 获取设备支持的DRM解决方案名称和唯一标识的列表。
std::string GetMediaKeySystemsFlow();

// 查询设备是否支持对应的DRM解决方案、媒体类型、内容保护级别。
std::string IsSupported3Flow(const char *name, const char *mimeType);

#endif // DRM_SAMPLE_H
