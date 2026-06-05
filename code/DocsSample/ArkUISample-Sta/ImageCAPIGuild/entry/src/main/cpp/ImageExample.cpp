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

// entry/src/main/cpp/ImageExample.cpp
#include "ImageExample.h"
#include "NativeEntry.h"
// [Start image_headfiles]
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <arkui/native_interface.h>
#include <hilog/log.h>
// [End image_headfiles]

// 日志标签
#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "ImageExample"

// [Start event_receiver]
// 全局事件接收器函数
void GlobalEventReceiver(ArkUI_NodeEvent *event)
{
    auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
    if (eventType == NODE_IMAGE_ON_COMPLETE) {
        ArkUI_NodeComponentEvent *componentEvent = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (componentEvent != nullptr) {
            OH_LOG_INFO(LOG_APP, "Image loaded: %.0fx%.0f",
                        componentEvent->data[0].f32, componentEvent->data[1].f32);
        }
    } else if (eventType == NODE_IMAGE_ON_ERROR) {
        ArkUI_NodeComponentEvent *componentEvent = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (componentEvent != nullptr) {
            OH_LOG_ERROR(LOG_APP, "Image load failed, error: %d", componentEvent->data[0].i32);
        }
    } else if (eventType == NODE_IMAGE_ON_SVG_PLAY_FINISH) {
        OH_LOG_INFO(LOG_APP, "SVG animation play finished");
    }
}
// [End event_receiver]

// [Start image_load_complete]
// 图片加载完成事件处理
void HandleImageComplete(ArkUI_NodeEvent* event)
{
    // 使用函数获取 componentEvent
    ArkUI_NodeComponentEvent* componentEvent = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
    if (componentEvent == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Get component event failed");
        return;
    }

    // 获取图片信息
    float width = componentEvent->data[0].f32;           // 图片原始宽度
    float height = componentEvent->data[1].f32;          // 图片原始高度
    float componentWidth = componentEvent->data[2].f32;  // 组件宽度
    float componentHeight = componentEvent->data[3].f32; // 组件高度
    float contentWidth = componentEvent->data[4].f32;    // 渲染内容宽度
    float contentHeight = componentEvent->data[5].f32;   // 渲染内容高度

    OH_LOG_INFO(LOG_APP, "Image loaded: %.0fx%.0f, component: %.0fx%.0f",
                width, height, componentWidth, componentHeight);
}
// [End image_load_complete]

// [Start image_load_error]
// 图片加载失败事件处理
void HandleImageError(ArkUI_NodeEvent* event)
{
    ArkUI_NodeComponentEvent* componentEvent = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
    if (componentEvent == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Get component event failed");
        return;
    }

    int32_t errorCode = componentEvent->data[0].i32;
    // 401: 图片路径无效
    OH_LOG_ERROR(LOG_APP, "Image load failed, error code: %d", errorCode);
}
// [End image_load_error]

// [Start image_svg_complete]
// SVG播放完成事件处理
void HandleSvgPlayFinish(ArkUI_NodeEvent* event)
{
    OH_LOG_INFO(LOG_APP, "SVG animation play finished");
}
// [End image_svg_complete]

// 创建图片组件界面
// 函数1：初始化 + Column + 第一张图
ArkUI_NodeHandle CreateImageColumnAndFirstImage()
{
    // [Start image_getnode]
    ArkUI_NativeNodeAPI_1* nativeNodeApi = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nativeNodeApi);
    if (nativeNodeApi == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Get native node API failed");
        return nullptr;
    }
    // [End image_getnode]

    // [Start register_image_receiver]
    // 注册全局事件接收器
    nativeNodeApi->registerNodeEventReceiver(GlobalEventReceiver);
    // [End register_image_receiver]
    
    // 创建Column容器
    ArkUI_NodeHandle column = nativeNodeApi->createNode(ARKUI_NODE_COLUMN);
    if (column == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Create Column failed");
        return nullptr;
    }

    // 设置Column padding属性
    ArkUI_NumberValue paddingValue[] = {{.f32 = 20.0f}};
    ArkUI_AttributeItem paddingItem = {paddingValue, 1};
    nativeNodeApi->setAttribute(column, NODE_PADDING, &paddingItem);

    // 设置网络图片示例
    ArkUI_NodeHandle image0 = nativeNodeApi->createNode(ARKUI_NODE_IMAGE);
    // [Start network_image]
    ArkUI_AttributeItem srcItem = {nullptr, 0, "https://xxx.jpg"};
    nativeNodeApi->setAttribute(image0, NODE_IMAGE_SRC, &srcItem);
    // [End network_image]

    // [Start create_image_component]
    // 创建Image组件1 - 基础图片
    ArkUI_NodeHandle image1 = nativeNodeApi->createNode(ARKUI_NODE_IMAGE);
    // [End create_image_component]
    if (image1 != nullptr) {
        // [Start image_source_rawfile]
        // 设置图片源（使用rawfile资源）
        ArkUI_AttributeItem srcItem = {nullptr, 0, "resource://RAWFILE/clouds.jpg"};
        nativeNodeApi->setAttribute(image1, NODE_IMAGE_SRC, &srcItem);
        // [End image_source_rawfile]

        // 设置宽高
        ArkUI_NumberValue widthValue[] = {{.f32 = 200.0f}};
        ArkUI_AttributeItem widthItem = {widthValue, 1};
        nativeNodeApi->setAttribute(image1, NODE_WIDTH, &widthItem);

        ArkUI_NumberValue heightValue[] = {{.f32 = 200.0f}};
        ArkUI_AttributeItem heightItem = {heightValue, 1};
        nativeNodeApi->setAttribute(image1, NODE_HEIGHT, &heightItem);

        ArkUI_NumberValue borderWidthValue[] = {{.f32 = 2.0f}};
        ArkUI_AttributeItem borderWidthItem = {borderWidthValue, 1};
        nativeNodeApi->setAttribute(image1, NODE_BORDER_WIDTH, &borderWidthItem);

        // [Start image_zoom]
        // 设置缩放类型
        ArkUI_NumberValue fitValue[] = {{.i32 = ARKUI_OBJECT_FIT_COVER}};
        ArkUI_AttributeItem fitItem = {fitValue, 1};
        nativeNodeApi->setAttribute(image1, NODE_IMAGE_OBJECT_FIT, &fitItem);
        // [End image_zoom]

        // [Start image_interpolation]
        // 设置插值效果
        ArkUI_NumberValue interpolationValue[] = {{.i32 = ARKUI_IMAGE_INTERPOLATION_HIGH}};
        ArkUI_AttributeItem interpolationItem = {interpolationValue, 1};
        nativeNodeApi->setAttribute(image1, NODE_IMAGE_INTERPOLATION, &interpolationItem);
        // [End image_interpolation]
        
        // [Start image_repeat]
        // 设置重复样式
        ArkUI_NumberValue repeatValue[] = {{.i32 = ARKUI_IMAGE_REPEAT_NONE}};
        ArkUI_AttributeItem repeatItem = {repeatValue, 1};
        nativeNodeApi->setAttribute(image1, NODE_IMAGE_OBJECT_REPEAT, &repeatItem);
        // [End image_repeat]
        
        // [Start image_render]
        // 设置渲染模式
        ArkUI_NumberValue renderModeValue[] = {{.i32 = ARKUI_IMAGE_RENDER_MODE_ORIGINAL}};
        ArkUI_AttributeItem renderModeItem = {renderModeValue, 1};
        nativeNodeApi->setAttribute(image1, NODE_IMAGE_RENDER_MODE, &renderModeItem);
        // [End image_render]
        
        // [Start image_load_sync]
        // 设置同步加载
        ArkUI_NumberValue syncLoadValue[] = {{.i32 = 1}};
        ArkUI_AttributeItem syncLoadItem = {syncLoadValue, 1};
        nativeNodeApi->setAttribute(image1, NODE_IMAGE_SYNC_LOAD, &syncLoadItem);
        // [End image_load_sync]
        
        // [Start image_color_filter]
        // 设置颜色滤镜（5x4矩阵，共20个浮点数）
        // 矩阵格式：每行5个元素分别表示 R、G、B、A 的系数和偏移量
        // 行1: R行 - R_new = R*1 + G*0 + B*0 + A*0 + offset*0 = R
        // 行2: G行 - G_new = R*0 + G*1 + B*0 + A*0 + offset*0 = G
        // 行3: B行 - B_new = R*0 + G*0 + B*1 + A*0 + offset*0 = B
        // 行4: A行 - A_new = R*0 + G*0 + B*0 + A*1 + offset*0 = A
        // 示例矩阵为恒等矩阵，即不改变颜色
        float colorFilterMatrix[20] = {
            1.0f, 0.0f, 0.0f, 0.0f, 0.0f,  // R行: R、G、B、A的系数及偏移量
            0.0f, 1.0f, 0.0f, 0.0f, 0.0f,  // G行: R、G、B、A的系数及偏移量
            0.0f, 0.0f, 1.0f, 0.0f, 0.0f,  // B行: R、G、B、A的系数及偏移量
            0.0f, 0.0f, 0.0f, 1.0f, 0.0f   // A行: R、G、B、A的系数及偏移量
        };
        ArkUI_NumberValue colorFilterValue[20] = {
            {.f32 = colorFilterMatrix[0]}, {.f32 = colorFilterMatrix[1]},
            {.f32 = colorFilterMatrix[2]}, {.f32 = colorFilterMatrix[3]},
            {.f32 = colorFilterMatrix[4]}, {.f32 = colorFilterMatrix[5]},
            {.f32 = colorFilterMatrix[6]}, {.f32 = colorFilterMatrix[7]},
            {.f32 = colorFilterMatrix[8]}, {.f32 = colorFilterMatrix[9]},
            {.f32 = colorFilterMatrix[10]}, {.f32 = colorFilterMatrix[11]},
            {.f32 = colorFilterMatrix[12]}, {.f32 = colorFilterMatrix[13]},
            {.f32 = colorFilterMatrix[14]}, {.f32 = colorFilterMatrix[15]},
            {.f32 = colorFilterMatrix[16]}, {.f32 = colorFilterMatrix[17]},
            {.f32 = colorFilterMatrix[18]}, {.f32 = colorFilterMatrix[19]}
        };
        ArkUI_AttributeItem colorFilterItem = {colorFilterValue, 20};
        nativeNodeApi->setAttribute(image1, NODE_IMAGE_COLOR_FILTER, &colorFilterItem);
        // [End image_color_filter]
        
        // [Start image_orientation]
        // 设置图片显示方向
        ArkUI_NumberValue orientationValue[] = {{.i32 = ARKUI_ORIENTATION_UP}};
        ArkUI_AttributeItem orientationItem = {orientationValue, 1};
        nativeNodeApi->setAttribute(image1, NODE_IMAGE_ORIENTATION, &orientationItem);
        // [End image_orientation]

        // [Start register_image_load_complete]
        // 注册图片加载完成事件
        nativeNodeApi->registerNodeEvent(image1, NODE_IMAGE_ON_COMPLETE, 0, nullptr);
        // [End register_image_load_complete]
        
        // [Start register_image_load_error]
        // 注册图片加载失败事件
        nativeNodeApi->registerNodeEvent(image1, NODE_IMAGE_ON_ERROR, 0, nullptr);
        // [End register_image_load_error]

        // [Start register_svg_play_component]
        // 注册SVG播放完成事件
        nativeNodeApi->registerNodeEvent(image1, NODE_IMAGE_ON_SVG_PLAY_FINISH, 0, nullptr);
        // [End register_svg_play_component]

        // 添加到Column
        nativeNodeApi->addChild(column, image1);
        
        // [Start unregister_node_event]
        // 注销事件监听
        nativeNodeApi->unregisterNodeEvent(image1, NODE_IMAGE_ON_COMPLETE);
        nativeNodeApi->unregisterNodeEvent(image1, NODE_IMAGE_ON_ERROR);
        nativeNodeApi->unregisterNodeEvent(image1, NODE_IMAGE_ON_SVG_PLAY_FINISH);

        // 注销全局事件接收器
        nativeNodeApi->unregisterNodeEventReceiver();
        // [End unregister_node_event]
    }
    return column;
}

// 函数2：添加第二张图
void AddSecondImage(ArkUI_NodeHandle column)
{
    auto nativeNodeApi = NativeModule::GetNativeNodeAPI();
    if (nativeNodeApi == nullptr || column == nullptr) {
        return;
    };

    // 创建Image组件2 - 带填充颜色的SVG
    ArkUI_NodeHandle image2 = nativeNodeApi->createNode(ARKUI_NODE_IMAGE);
    if (image2 != nullptr) {
        // 设置图片源（可以是SVG）
        // [Start image_source_svg]
        ArkUI_AttributeItem srcItem2 = {nullptr, 0, "resource://RAWFILE/cloud.svg"};
        nativeNodeApi->setAttribute(image2, NODE_IMAGE_SRC, &srcItem2);
        // [End image_source_svg]

        // 设置宽高
        ArkUI_NumberValue widthValue2[] = {{.f32 = 200.0f}};
        ArkUI_AttributeItem widthItem2 = {widthValue2, 1};
        nativeNodeApi->setAttribute(image2, NODE_WIDTH, &widthItem2);

        ArkUI_NumberValue heightValue2[] = {{.f32 = 200.0f}};
        ArkUI_AttributeItem heightItem2 = {heightValue2, 1};
        nativeNodeApi->setAttribute(image2, NODE_HEIGHT, &heightItem2);

        ArkUI_NumberValue borderWidthValue[] = {{.f32 = 2.0f}};
        ArkUI_AttributeItem borderWidthItem = {borderWidthValue, 1};
        nativeNodeApi->setAttribute(image2, NODE_BORDER_WIDTH, &borderWidthItem);

        // [Start image_fillcolor]
        // 设置填充颜色（蓝色）
        ArkUI_NumberValue fillColorValue[] = {{.u32 = 0xFF007DFF}};
        ArkUI_AttributeItem fillColorItem = {fillColorValue, 1};
        nativeNodeApi->setAttribute(image2, NODE_IMAGE_FILL_COLOR, &fillColorItem);
        // [End image_fillcolor]
        
        // [Start retister_image_svg_complete]
        // 注册SVG播放完成事件
        nativeNodeApi->registerNodeEvent(image2, NODE_IMAGE_ON_SVG_PLAY_FINISH, 0, nullptr);
        // [End retister_image_svg_complete]

        // 添加到Column
        nativeNodeApi->addChild(column, image2);
    }
}

// 函数3：添加第三张图
void AddThirdImage(ArkUI_NodeHandle column)
{
    auto nativeNodeApi = NativeModule::GetNativeNodeAPI();
    if (nativeNodeApi == nullptr || column == nullptr) {
        return;
    };

    // 创建Image组件3 - 带占位图
    ArkUI_NodeHandle image3 = nativeNodeApi->createNode(ARKUI_NODE_IMAGE);
    if (image3 != nullptr) {
        // 设置网络图片源
        // [Start image_source_png]
        ArkUI_AttributeItem srcItem3 = {nullptr, 0, "resource://RAWFILE/sky.png"};
        nativeNodeApi->setAttribute(image3, NODE_IMAGE_SRC, &srcItem3);
        // [End image_source_png]

        // 设置宽高
        ArkUI_NumberValue widthValue3[] = {{.f32 = 200.0f}};
        ArkUI_AttributeItem widthItem3 = {widthValue3, 1};
        nativeNodeApi->setAttribute(image3, NODE_WIDTH, &widthItem3);

        ArkUI_NumberValue heightValue3[] = {{.f32 = 200.0f}};
        ArkUI_AttributeItem heightItem3 = {heightValue3, 1};
        nativeNodeApi->setAttribute(image3, NODE_HEIGHT, &heightItem3);

        ArkUI_NumberValue borderWidthValue[] = {{.f32 = 2.0f}};
        ArkUI_AttributeItem borderWidthItem = {borderWidthValue, 1};
        nativeNodeApi->setAttribute(image3, NODE_BORDER_WIDTH, &borderWidthItem);

        // [Start image_alt_source]
        // 设置占位图
        ArkUI_AttributeItem altItem = {nullptr, 0, "/data/storage/el2/base/haps/entry/files/placeholder.png"};
        nativeNodeApi->setAttribute(image3, NODE_IMAGE_ALT, &altItem);
        // [End image_alt_source]

        // [Start image_decode_size]
        // 设置解码尺寸
        ArkUI_NumberValue sourceSizeValue[] = {{.i32 = 150}, {.i32 = 150}};
        ArkUI_AttributeItem sourceSizeItem = {sourceSizeValue, 2};
        nativeNodeApi->setAttribute(image3, NODE_IMAGE_SOURCE_SIZE, &sourceSizeItem);
        // [End image_decode_size]

        // 添加到Column
        nativeNodeApi->addChild(column, image3);
    }
}

// 主函数（调用）
ArkUI_NodeHandle CreateImageExample()
{
    ArkUI_NodeHandle column = CreateImageColumnAndFirstImage();
    AddSecondImage(column);
    AddThirdImage(column);
    return column;
}
