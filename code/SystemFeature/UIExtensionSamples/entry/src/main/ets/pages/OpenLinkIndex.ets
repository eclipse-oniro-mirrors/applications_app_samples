/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file entry/src/main/ets/pages/OpenLinkIndex.ets
 * 文件职责：OpenLinkIndex 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：OpenLinkIndex。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * OpenLinkIndex：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct OpenLinkIndex {
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色
    Column() {
      // Row：水平布局容器
      // 关键属性：宽度、高度、主轴对齐、背景色
      Row() {
        // Flex：弹性布局容器
        Flex({ justifyContent: FlexAlign.Start, alignContent: FlexAlign.Center }) {
          // Text：文本
          // 关键属性：字号、字重、文本对齐
          Text($r('app.string.OpenLinkTitle')).id('open_link_index_text_4')
            .fontSize(30)
            .fontWeight(700)
            .textAlign(TextAlign.Start)
        }.id('open_link_index_flex_3')
      }.id('open_link_index_row_2')
      .width('50%')
      .height('70%')
      .justifyContent(FlexAlign.Start)
      .backgroundColor($r('app.color.backGrounding'))
    }.id('open_link_index_column_1')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.backGrounding'))
  }
}
