/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

/**
 * @file persistentProxyForm/src/main/ets/pages/Index.ets
 * 文件职责：Index 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Index。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import router from '@ohos.router';

/**
 * Index：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Index {
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：高度
    Row() {
      // Column：垂直布局容器
      // 关键属性：宽度
      Column() {
        // Button：按钮
        // 关键属性：输入类型、宽度、高度、外边距、圆角、背景色
        // 交互：可点击交互
        Button() {
          // Text：文本
          // 关键属性：字体颜色、字号、字重
          Text($r('app.string.modify_publish_data')).id('index_text_4')
            .fontColor($r('sys.color.ohos_id_color_foreground_contrary'))
            .fontSize($r('sys.float.ohos_id_text_size_button1'))
            .fontWeight(FontWeight.Bold)
        }.id('index_button_3')
        .type(ButtonType.Capsule)
        .width(220)
        .height(40)
        .margin({ top: 20 })
        .borderRadius($r('sys.float.ohos_id_corner_radius_button'))
        .backgroundColor($r('sys.color.ohos_id_color_component_activated'))
        .onClick(() => {
          router.pushUrl({ url: 'pages/PublishIndex' });
        })

        // Button：按钮
        // 关键属性：输入类型、宽度、高度、外边距、圆角、背景色
        // 交互：可点击交互
        Button() {
          // Text：文本
          // 关键属性：字体颜色、字号、字重
          Text($r('app.string.subscription_conditions')).id('index_text_6')
            .fontColor($r('sys.color.ohos_id_color_foreground_contrary'))
            .fontSize($r('sys.float.ohos_id_text_size_button1'))
            .fontWeight(FontWeight.Bold)
        }.id('index_button_5')
        .type(ButtonType.Capsule)
        .width(220)
        .height(40)
        .margin({ top: 20 })
        .borderRadius($r('sys.float.ohos_id_corner_radius_button'))
        .backgroundColor($r('sys.color.ohos_id_color_component_activated'))
        .onClick(() => {
          router.pushUrl({ url: 'pages/ModifyConditionIndex' });
        })
      }.id('index_column_2')
      .width('100%')
    }.id('index_row_1')
    .height('100%')
  }
}