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

#ifndef ARC_SWIPER_SAMPLE_NATIVE_ENTRY_H
#define ARC_SWIPER_SAMPLE_NATIVE_ENTRY_H

#include "napi/native_api.h"
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>

namespace NativeModule {

class NativeEntry {
public:
    static NativeEntry *GetInstance()
    {
        static NativeEntry nativeEntry;
        return &nativeEntry;
    }

    napi_value CreateArcSwiperNode(napi_env env, napi_callback_info info);

    void SetContentHandle(ArkUI_NodeContentHandle handle)
    {
        handle_ = handle;
    }

    void SetRootNode(ArkUI_NodeHandle &baseNode)
    {
        root_ = baseNode;
        OH_ArkUI_NodeContent_AddNode(handle_, root_);
    }

private:
    void UpdateArcSwiperAttribute(ArkUI_NodeHandle arcSwiper, ArkUI_NativeNodeAPI_1 *nodeApi);
    void AddEventReceiver(ArkUI_NodeHandle arcSwiper, ArkUI_NativeNodeAPI_1 *nodeApi);
    void AddChild(ArkUI_NodeHandle arcSwiper, ArkUI_NativeNodeAPI_1 *nodeApi);

    ArkUI_NodeHandle root_;
    ArkUI_NodeContentHandle handle_;
};

} // namespace NativeModule

#endif // ARC_SWIPER_SAMPLE_NATIVE_ENTRY_H
