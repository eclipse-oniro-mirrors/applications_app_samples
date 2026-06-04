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

// entry/src/main/cpp/NativeEntry.h
#ifndef NATIVE_ENTRY_H
#define NATIVE_ENTRY_H

#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_interface.h>

namespace NativeModule {

    // 获取ArkUI Native Node API
    inline ArkUI_NativeNodeAPI_1 *GetNativeNodeAPI()
    {
        static ArkUI_NativeNodeAPI_1 *api = nullptr;
        if (api == nullptr) {
            OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, api);
        }
        return api;
    }

    class NativeEntry {
    public:
        static NativeEntry *GetInstance()
        {
            static NativeEntry instance;
            return &instance;
        }

        void SetContentHandle(ArkUI_NodeContentHandle contentHandle)
        {
            contentHandle_ = contentHandle;
        }

        void SetRootNode(ArkUI_NodeHandle rootNode)
        {
            if (rootNode != nullptr && contentHandle_ != nullptr) {
                rootNode_ = rootNode;
                OH_ArkUI_NodeContent_AddNode(contentHandle_, rootNode);
            }
        }

        void DisposeRootNode()
        {
            if (rootNode_ != nullptr && contentHandle_ != nullptr) {
                OH_ArkUI_NodeContent_RemoveNode(contentHandle_, rootNode_);
                // 使用正确的方式销毁节点
                GetNativeNodeAPI()->disposeNode(rootNode_);
                rootNode_ = nullptr;
            }
        }

    private:
        NativeEntry() = default;
        ~NativeEntry() = default;

        ArkUI_NodeContentHandle contentHandle_ = nullptr;
        ArkUI_NodeHandle rootNode_ = nullptr;
    };

    // NAPI函数声明
    napi_value CreateNativeRoot(napi_env env, napi_callback_info info);
    napi_value DestroyNativeRoot(napi_env env, napi_callback_info info);

} // namespace NativeModule

#endif // NATIVE_ENTRY_H