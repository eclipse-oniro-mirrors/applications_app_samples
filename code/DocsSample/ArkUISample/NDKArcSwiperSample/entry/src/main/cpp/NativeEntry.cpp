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

#include "NativeEntry.h"
#include <arkui/native_interface.h>
#include <hilog/log.h>

namespace NativeModule {
const int ITEM_SIZE = 5;
const float ARC_SWIPER_WIDTH_PERCENT = 0.9f;
const float ARC_SWIPER_HEIGHT_PERCENT = 0.6f;
const float TEXT_FONT_SIZE = 28.0f;
const int32_t ARC_SWIPER_DURATION = 500;
const uint32_t INDICATOR_COLOR = 0x99FFFFFF;
const uint32_t INDICATOR_SELECTED_COLOR = 0xFF5EA1FF;
const uint32_t INDICATOR_BACKGROUND_COLOR = 0x335EA1FF;
const uint32_t PAGE_COLORS[ITEM_SIZE] = {
    0xFF3D9DB4, 0xFF4361EE, 0xFF2A9D8F, 0xFFE76F51, 0xFF7B2CBF
};

const unsigned int LOG_PRINT_DOMAIN = 0xFF00;

napi_value NativeEntry::CreateArcSwiperNode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &contentHandle);
    NativeEntry::GetInstance()->SetContentHandle(contentHandle);

    // [Start arc_swiper_create]
    ArkUI_NativeNodeAPI_1 *nodeApi = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeApi);
    ArkUI_NodeHandle arcSwiper = nodeApi->createNode(ARKUI_NODE_ARC_SWIPER);
    AddChild(arcSwiper, nodeApi);
    // [End arc_swiper_create]

    UpdateArcSwiperAttribute(arcSwiper, nodeApi);
    AddEventReceiver(arcSwiper, nodeApi);

    NativeEntry::GetInstance()->SetRootNode(arcSwiper);
    return nullptr;
}

void NativeEntry::UpdateArcSwiperAttribute(ArkUI_NodeHandle arcSwiper, ArkUI_NativeNodeAPI_1 *nodeApi)
{
    // [Start arc_swiper_attribute]
    ArkUI_NumberValue value[] = {0};
    ArkUI_AttributeItem item = {.value = value, .size = 1};

    value[0].f32 = ARC_SWIPER_HEIGHT_PERCENT;
    nodeApi->setAttribute(arcSwiper, NODE_HEIGHT_PERCENT, &item);
    value[0].f32 = ARC_SWIPER_WIDTH_PERCENT;
    nodeApi->setAttribute(arcSwiper, NODE_WIDTH_PERCENT, &item);

    value[0].i32 = 0;
    nodeApi->setAttribute(arcSwiper, NODE_ARC_SWIPER_INDEX, &item);
    value[0].i32 = ARC_SWIPER_DURATION;
    nodeApi->setAttribute(arcSwiper, NODE_ARC_SWIPER_DURATION, &item);
    value[0].i32 = 0;
    nodeApi->setAttribute(arcSwiper, NODE_ARC_SWIPER_VERTICAL, &item);
    nodeApi->setAttribute(arcSwiper, NODE_ARC_SWIPER_DISABLE_SWIPE, &item);
    nodeApi->setAttribute(arcSwiper, NODE_ARC_SWIPER_DISABLE_TRANSITION_ANIMATION, &item);
    value[0].i32 = ARKUI_CROWN_SENSITIVITY_MEDIUM;
    nodeApi->setAttribute(arcSwiper, NODE_ARC_SWIPER_DIGITAL_CROWN_SENSITIVITY, &item);
    value[0].i32 = ARKUI_EDGE_EFFECT_SPRING;
    nodeApi->setAttribute(arcSwiper, NODE_ARC_SWIPER_EFFECT_MODE, &item);

    ArkUI_NumberValue indicatorValue[] = {
        {.i32 = 1},
        {.i32 = OH_ARKUI_ARCDIRECTION_SIX_CLOCK_DIRECTION},
        {.u32 = INDICATOR_COLOR},
        {.u32 = INDICATOR_SELECTED_COLOR},
        {.u32 = INDICATOR_BACKGROUND_COLOR},
    };
    ArkUI_AttributeItem indicatorItem = {.value = indicatorValue, .size = 5};
    nodeApi->setAttribute(arcSwiper, NODE_ARC_SWIPER_INDICATOR, &indicatorItem);
    // [End arc_swiper_attribute]
}

void NativeEntry::AddEventReceiver(ArkUI_NodeHandle arcSwiper, ArkUI_NativeNodeAPI_1 *nodeApi)
{
    // [Start arc_swiper_event]
    nodeApi->registerNodeEvent(arcSwiper, NODE_ARC_SWIPER_EVENT_ON_CHANGE, 0, nullptr);  // 0: onChange事件id
    nodeApi->registerNodeEvent(arcSwiper, NODE_ARC_SWIPER_EVENT_ON_ANIMATION_START, 1, nullptr);  // 1: 动画开始事件id
    nodeApi->registerNodeEvent(arcSwiper, NODE_ARC_SWIPER_EVENT_ON_ANIMATION_END, 2, nullptr);  // 2: 动画结束事件id
    nodeApi->registerNodeEvent(arcSwiper, NODE_ARC_SWIPER_EVENT_ON_GESTURE_SWIPE, 3, nullptr);  // 3: 跟手滑动事件id
    nodeApi->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        ArkUI_NodeEventType eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        auto componentEvent = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (!componentEvent) {
            return;
        }

        if (eventType == NODE_ARC_SWIPER_EVENT_ON_CHANGE) {
            auto index = componentEvent->data[0].i32;
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArcSwiper",
                         "NODE_ARC_SWIPER_EVENT_ON_CHANGE index = %{public}d", index);
        }
        if (eventType == NODE_ARC_SWIPER_EVENT_ON_ANIMATION_START) {
            auto currentIndex = componentEvent->data[0].i32;
            auto targetIndex = componentEvent->data[1].i32;
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArcSwiper",
                         "NODE_ARC_SWIPER_EVENT_ON_ANIMATION_START currentIndex = %{public}d, "
                         "targetIndex = %{public}d",
                         currentIndex, targetIndex);
        }
        if (eventType == NODE_ARC_SWIPER_EVENT_ON_ANIMATION_END) {
            auto index = componentEvent->data[0].i32;
            auto offset = componentEvent->data[1].f32;
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArcSwiper",
                         "NODE_ARC_SWIPER_EVENT_ON_ANIMATION_END index = %{public}d, offset = %{public}f",
                         index, offset);
        }
        if (eventType == NODE_ARC_SWIPER_EVENT_ON_GESTURE_SWIPE) {
            auto index = componentEvent->data[0].i32;
            auto offset = componentEvent->data[1].f32;
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArcSwiper",
                         "NODE_ARC_SWIPER_EVENT_ON_GESTURE_SWIPE index = %{public}d, offset = %{public}f",
                         index, offset);
        }
    });
    // [End arc_swiper_event]
}

void NativeEntry::AddChild(ArkUI_NodeHandle arcSwiper, ArkUI_NativeNodeAPI_1 *nodeApi)
{
    const char *arr[ITEM_SIZE] = {"Arc 0", "Arc 1", "Arc 2", "Arc 3", "Arc 4"};
    for (int i = 0; i < ITEM_SIZE; i++) {
        ArkUI_NodeHandle textNode = nodeApi->createNode(ARKUI_NODE_TEXT);
        ArkUI_AttributeItem content = {.string = arr[i]};
        nodeApi->setAttribute(textNode, NODE_TEXT_CONTENT, &content);

        ArkUI_NumberValue value[] = {0};
        ArkUI_AttributeItem item = {.value = value, .size = 1};
        value[0].u32 = PAGE_COLORS[i];
        nodeApi->setAttribute(textNode, NODE_BACKGROUND_COLOR, &item);
        value[0].i32 = ARKUI_TEXT_ALIGNMENT_CENTER;
        nodeApi->setAttribute(textNode, NODE_TEXT_ALIGN, &item);
        value[0].f32 = TEXT_FONT_SIZE;
        nodeApi->setAttribute(textNode, NODE_FONT_SIZE, &item);
        value[0].u32 = 0xFFFFFFFF;
        nodeApi->setAttribute(textNode, NODE_FONT_COLOR, &item);
        nodeApi->addChild(arcSwiper, textNode);
    }
}

} // namespace NativeModule
