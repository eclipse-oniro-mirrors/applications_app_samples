/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
// ArkUIBaseNode.h
// 提供组件树操作的基类。
#ifndef MYAPPLICATION_ARKUIBASENODE_H
#define MYAPPLICATION_ARKUIBASENODE_H

#include <arkui/native_type.h>
#include <list>
#include <memory>

#include "NativeModule.h"

namespace NativeModule {

    class ArkUIBaseNode {
    public:
        explicit ArkUIBaseNode(ArkUI_NodeHandle handle)
            : handle_(handle), nativeModule_(NativeModuleInstance::GetInstance()->GetNativeNodeAPI()) {}

        virtual ~ArkUIBaseNode()
        {
            // 封装析构函数，实现子节点移除功能。
            if (!children_.empty()) {
                for (const auto &child : children_) {
                    nativeModule_->removeChild(handle_, child->GetHandle());
                }
                children_.clear();
            }
            // 封装析构函数，统一回收节点资源。
            nativeModule_->disposeNode(handle_);
        }

        void AddChild(const std::shared_ptr<ArkUIBaseNode> &child)
        {
            children_.emplace_back(child);
            OnAddChild(child);
        }

        void RemoveChild(const std::shared_ptr<ArkUIBaseNode> &child)
        {
            children_.remove(child);
            OnRemoveChild(child);
        }

        void InsertChild(const std::shared_ptr<ArkUIBaseNode> &child, int32_t index)
        {
            if (index >= children_.size()) {
                AddChild(child);
            } else {
                auto iter = children_.begin();
                std::advance(iter, index);
                children_.insert(iter, child);
                OnInsertChild(child, index);
            }
        }

        void InsertChildBefore(const std::shared_ptr<ArkUIBaseNode> &child,
            const std::shared_ptr<ArkUIBaseNode> &slibing)
        {
            auto it = std::find(children_.begin(), children_.end(), slibing);
            if (it != children_.end()) {
                children_.insert(it, child);
            }
            OnInsertChildBefore(child, slibing);
        }

        void InsertChildAfter(const std::shared_ptr<ArkUIBaseNode> &child,
            const std::shared_ptr<ArkUIBaseNode> &slibing)
        {
            auto it = std::find(children_.begin(), children_.end(), slibing);
            if (it != children_.end()) {
                children_.insert(std::next(it), child);
            }
            OnInsertChildAfter(child, slibing);
        }

        void RemoveAllChild()
        {
            for (auto it = children_.begin(); it != children_.end();) {
                RemoveChild(*it);
            }
            OnRemoveAllChild();
        }
        ArkUI_NodeHandle (*getChildAt)(ArkUI_NodeHandle node, int32_t position);
        ArkUI_NodeHandle (*getFirstChild)(ArkUI_NodeHandle node);
        ArkUI_NodeHandle (*getLastChild)(ArkUI_NodeHandle node);
        ArkUI_NodeHandle (*getPreviousSibling)(ArkUI_NodeHandle node);
        ArkUI_NodeHandle (*getNextSibling)(ArkUI_NodeHandle node);

        // 以下方法不可跨过ContentSlot。获取nodeHandle后可根据nativeEntry保存的节点map，做对应查找。
        ArkUI_NodeHandle GetParent() const { return nativeModule_->getParent(handle_); }
        ArkUI_NodeHandle GetChildAt(uint32_t index) const { return nativeModule_->getChildAt(handle_, index); }
        ArkUI_NodeHandle GetFirstChild() const { return nativeModule_->getFirstChild(handle_); }
        ArkUI_NodeHandle GetLastChild() const { return nativeModule_->getLastChild(handle_); }
        ArkUI_NodeHandle GetPreviousSibling() const { return nativeModule_->getPreviousSibling(handle_); }
        ArkUI_NodeHandle GetNextSibling() const { return nativeModule_->getNextSibling(handle_); }

        // 以下方法可以跨过ContentSlot。
        ArkUI_NodeHandle GetParentInPageTree() const { return OH_ArkUI_NodeUtils_GetParentInPageTree(handle_); }

        ArkUI_NodeHandle GetCurrentPageRootNode() const { return OH_ArkUI_NodeUtils_GetCurrentPageRootNode(handle_); }

        ArkUI_NodeHandle GetActiveChildrenByIndex(uint32_t index) const
        {
            ArkUI_ActiveChildrenInfo *childrenInfo;
            OH_ArkUI_NodeUtils_GetActiveChildrenInfo(handle_, &childrenInfo);
            auto count = OH_ArkUI_ActiveChildrenInfo_GetCount(childrenInfo);
            ArkUI_NodeHandle child;
            if (index < count) {
                child = OH_ArkUI_ActiveChildrenInfo_GetNodeByIndex(childrenInfo, index);
            }
            OH_ArkUI_ActiveChildrenInfo_Destroy(childrenInfo);
            return child;
        }

        // 用于获取懒展开的第一个活跃子节点下标。
        uint32_t GetFirstChildIndexWithoutExpand() const
        {
            uint32_t index = -1;
            OH_ArkUI_NodeUtils_GetFirstChildIndexWithoutExpand(handle_, &index);
            return index;
        }

        // 用于获取懒展开的最后一个活跃子节点下标。
        uint32_t GetLastChildIndexWithoutExpand() const
        {
            uint32_t index = -1;
            OH_ArkUI_NodeUtils_GetLastChildIndexWithoutExpand(handle_, &index);
            return index;
        }

        // 根据前置接口获取的懒展开活跃节点范围，高效的获取子节点信息。
        ArkUI_NodeHandle GetChildWithExpandMode(uint32_t index) const
        {
            ArkUI_NodeHandle subNode;
            auto result = OH_ArkUI_NodeUtils_GetChildWithExpandMode(handle_, index, &subNode, ARKUI_LAZY_EXPAND);
            if (result == ARKUI_ERROR_CODE_NO_ERROR) {
                return subNode;
            }
            return nullptr;
        }

        // 通知节点从布局到绘制全部标脏，实际使用可根据业务需要选择其中具体需要执行的内容，提升性能。
        void MarkDirty()
        {
            nativeModule_->markDirty(handle_, NODE_NEED_MEASURE);
            nativeModule_->markDirty(handle_, NODE_NEED_LAYOUT);
            nativeModule_->markDirty(handle_, NODE_NEED_RENDER);
        }

        // 对单一节点设置单位。
        void SetLengthMetricUnit(ArkUI_LengthMetricUnit unit) { nativeModule_->setLengthMetricUnit(handle_, unit); }

        // 设置及获取自定义属性。
        void AddCustomProperty(const char *name, const char *value)
        {
            OH_ArkUI_NodeUtils_AddCustomProperty(handle_, name, value);
        }

        void RemoveCustomProperty(const char *name) { OH_ArkUI_NodeUtils_RemoveCustomProperty(handle_, name); }

        const char *GetCustomProperty(const char *name)
        {
            ArkUI_CustomProperty *property;
            OH_ArkUI_NodeUtils_GetCustomProperty(handle_, name, &property);
            auto value = OH_ArkUI_CustomProperty_GetStringValue(property);
            OH_ArkUI_CustomProperty_Destroy(property);
            return value;
        }

        // 节点迁移，可跨实例转移节点。
        void MoveTo(const std::shared_ptr<ArkUIBaseNode> &anotherParent)
        {
            OH_ArkUI_NodeUtils_MoveTo(handle_, anotherParent->GetHandle(), -1); //-1代表放到最后一个位置
        }

        ArkUI_NodeHandle GetHandle() const { return handle_; }

    protected:
        // 针对父容器子类需要重载下面的函数，实现组件挂载和卸载。
        virtual void OnAddChild(const std::shared_ptr<ArkUIBaseNode> &child) {}
        virtual void OnRemoveChild(const std::shared_ptr<ArkUIBaseNode> &child) {}
        virtual void OnRemoveAllChild() {}
        virtual void OnInsertChild(const std::shared_ptr<ArkUIBaseNode> &child, int32_t index) {}
        virtual void OnInsertChildBefore(const std::shared_ptr<ArkUIBaseNode> &child,
                                         const std::shared_ptr<ArkUIBaseNode> &slibing) {}
        virtual void OnInsertChildAfter(const std::shared_ptr<ArkUIBaseNode> &child,
                                        const std::shared_ptr<ArkUIBaseNode> &slibing) {}

        ArkUI_NodeHandle handle_;
        ArkUI_NativeNodeAPI_1 *nativeModule_ = nullptr;

    private:
        std::list<std::shared_ptr<ArkUIBaseNode>> children_;
    };
} // namespace NativeModule

#endif // MYAPPLICATION_ARKUIBASENODE_H