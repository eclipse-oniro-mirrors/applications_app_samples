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
// [Start cpp_cross_language_example]
// CrossLanguageExample.h
// 提供跨语言属性设置示例中Native侧组件的创建。

#ifndef MYAPPLICATION_CROSSLANGUAGEEXAMPLE_H
#define MYAPPLICATION_CROSSLANGUAGEEXAMPLE_H

#include "ArkUINode.h"
#include <hilog/log.h>
#include <memory>

namespace NativeModule {

// 事件回调：在Native侧跨语言修改ArkTS侧创建的Scroll节点属性。
void HandleCrossLanguageClick(ArkUI_NodeEvent *event)
{
    auto nodeAPI = NativeModuleInstance::GetInstance()->GetNativeNodeAPI();

    if (OH_ArkUI_NodeEvent_GetTargetId(event) == 0) { // 修改滚动条颜色。
        ArkUI_NodeHandle node_ptr = nullptr;
        // 通过id获取ArkTS侧创建的节点。
        auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("scroll", &node_ptr);
        if (ret != ARKUI_ERROR_CODE_NO_ERROR || node_ptr == nullptr) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "CrossLanguageExample",
                "OH_ArkUI_NodeUtils_GetAttachedNodeHandleById failed, error code: %{public}d", ret);
            return;
        }
        ArkUI_NumberValue scroll_color_value[] = {{.u32 = 0xff00ff00}};
        ArkUI_AttributeItem scroll_color_item = {scroll_color_value,
            sizeof(scroll_color_value) / sizeof(ArkUI_NumberValue)};
        // 若ArkTS侧未开启跨语言属性设置，此处设置失败并返回错误码。
        auto errCode = nodeAPI->setAttribute(node_ptr, NODE_SCROLL_BAR_COLOR, &scroll_color_item);
        if (errCode != ARKUI_ERROR_CODE_NO_ERROR) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "CrossLanguageExample",
                "crossLanguage setAttribute scroll bar color failed, error code: %{public}d", errCode);
        }
    }

    if (OH_ArkUI_NodeEvent_GetTargetId(event) == 1) { // 修改滚动条宽度。
        ArkUI_NodeHandle node_ptr = nullptr;
        auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("scroll", &node_ptr);
        if (ret != ARKUI_ERROR_CODE_NO_ERROR || node_ptr == nullptr) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "CrossLanguageExample",
                "OH_ArkUI_NodeUtils_GetAttachedNodeHandleById failed, error code: %{public}d", ret);
            return;
        }
        ArkUI_NumberValue scroll_width_value[] = {{.f32 = 20}};
        ArkUI_AttributeItem scroll_width_item = {scroll_width_value,
            sizeof(scroll_width_value) / sizeof(ArkUI_NumberValue)};
        auto errCode = nodeAPI->setAttribute(node_ptr, NODE_SCROLL_BAR_WIDTH, &scroll_width_item);
        if (errCode != ARKUI_ERROR_CODE_NO_ERROR) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "CrossLanguageExample",
                "crossLanguage setAttribute scroll bar width failed, error code: %{public}d", errCode);
        }
    }
}

// 创建根节点Scroll。
ArkUI_NodeHandle CreateScrollNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    ArkUI_NodeHandle scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    ArkUI_NumberValue length_value[] = {{.f32 = 480}};
    ArkUI_AttributeItem length_item = {length_value, sizeof(length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &length_item);
    ArkUI_NumberValue length_value1[] = {{.f32 = 650}};
    ArkUI_AttributeItem length_item1 = {length_value1, sizeof(length_value1) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &length_item1);
    ArkUI_AttributeItem scroll_id = {.string = "Scroll_CAPI"};
    nodeAPI->setAttribute(scroll, NODE_ID, &scroll_id);
    return scroll;
}

// 创建Column。
ArkUI_NodeHandle CreateColumnNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.f32 = 480}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_WIDTH, &item);
    ArkUI_NumberValue column_bc[] = {{.u32 = 0xFFF00BB}};
    ArkUI_AttributeItem column_item = {column_bc, 1};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &column_item);
    ArkUI_AttributeItem column_id = {.string = "Column_CAPI"};
    nodeAPI->setAttribute(column, NODE_ID, &column_id);
    return column;
}

// 创建Text。
ArkUI_NodeHandle CreateTextNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    ArkUI_NodeHandle text0 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue text_width[] = {{.f32 = 300}};
    ArkUI_AttributeItem text_item0 = {text_width, sizeof(text_width) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text0, NODE_WIDTH, &text_item0);
    ArkUI_NumberValue text_height[] = {{.f32 = 50}};
    ArkUI_AttributeItem text_item1 = {text_height, sizeof(text_height) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text0, NODE_HEIGHT, &text_item1);
    ArkUI_AttributeItem text_item = {.string = "C设置TS创建的节点属性"};
    nodeAPI->setAttribute(text0, NODE_TEXT_CONTENT, &text_item);
    ArkUI_NumberValue margin[] = {{.f32 = 10}};
    ArkUI_AttributeItem item_margin = {margin, sizeof(margin) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text0, NODE_MARGIN, &item_margin);
    return text0;
}

// 创建Row。
ArkUI_NodeHandle CreateRowNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    ArkUI_NodeHandle row0 = nodeAPI->createNode(ARKUI_NODE_ROW);
    ArkUI_NumberValue width_value[] = {{.f32 = 330}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(row0, NODE_WIDTH, &width_item);
    ArkUI_NumberValue height_value[] = {{.f32 = 50}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(row0, NODE_HEIGHT, &height_item);
    ArkUI_NumberValue margin[] = {{.f32 = 10}};
    ArkUI_AttributeItem item_margin = {margin, sizeof(margin) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(row0, NODE_MARGIN, &item_margin);
    return row0;
}

// 创建Button，用于触发Native侧跨语言属性设置。
void CreateButtonNodes(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle row0)
{
    ArkUI_NumberValue btn_width[] = {{.f32 = 150}};
    ArkUI_AttributeItem btn_item0 = {btn_width, sizeof(btn_width) / sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue height_value[] = {{.f32 = 50}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue margin[] = {{.f32 = 10}};
    ArkUI_AttributeItem item_margin = {margin, sizeof(margin) / sizeof(ArkUI_NumberValue)};

    ArkUI_NodeHandle bt0 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->setAttribute(bt0, NODE_WIDTH, &btn_item0);
    nodeAPI->setAttribute(bt0, NODE_HEIGHT, &height_item);
    nodeAPI->setAttribute(bt0, NODE_MARGIN, &item_margin);
    ArkUI_AttributeItem bt0_item = {.string = "scrollBarColor"};
    nodeAPI->setAttribute(bt0, NODE_BUTTON_LABEL, &bt0_item);
    nodeAPI->registerNodeEvent(bt0, NODE_ON_CLICK, 0, nullptr);

    ArkUI_NodeHandle bt1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->setAttribute(bt1, NODE_WIDTH, &btn_item0);
    nodeAPI->setAttribute(bt1, NODE_HEIGHT, &height_item);
    nodeAPI->setAttribute(bt1, NODE_MARGIN, &item_margin);
    ArkUI_AttributeItem bt1_item = {.string = "scrollBarWidth"};
    nodeAPI->setAttribute(bt1, NODE_BUTTON_LABEL, &bt1_item);
    nodeAPI->registerNodeEvent(bt1, NODE_ON_CLICK, 1, nullptr);

    nodeAPI->addChild(row0, bt0);
    nodeAPI->addChild(row0, bt1);
}

std::shared_ptr<ArkUIBaseNode> CreateCrossLanguageExample()
{
    auto nodeAPI = NativeModuleInstance::GetInstance()->GetNativeNodeAPI();

    // 创建根节点Scroll。
    ArkUI_NodeHandle scroll = CreateScrollNode(nodeAPI);

    // 创建Column。
    ArkUI_NodeHandle column = CreateColumnNode(nodeAPI);

    // 创建Text。
    ArkUI_NodeHandle text0 = CreateTextNode(nodeAPI);

    // 创建Row。
    ArkUI_NodeHandle row0 = CreateRowNode(nodeAPI);

    // 创建Button，用于触发Native侧跨语言属性设置。
    CreateButtonNodes(nodeAPI, row0);

    // 注册事件回调，在Native侧跨语言修改ArkTS侧创建的Scroll节点属性。
    nodeAPI->registerNodeEventReceiver(HandleCrossLanguageClick);

    // 节点添加，构建组件树。
    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, text0);
    nodeAPI->addChild(column, row0);

    return std::make_shared<ArkUINode>(scroll);
}
} // namespace NativeModule

#endif // MYAPPLICATION_CROSSLANGUAGEEXAMPLE_H
// [End cpp_cross_language_example]