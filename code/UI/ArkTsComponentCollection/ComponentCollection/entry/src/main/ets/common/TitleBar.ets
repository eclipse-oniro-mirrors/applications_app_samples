/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/common/TitleBar.ets
 * 文件职责：TitleBar 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TitleBar。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import router from '@ohos.router';

// Page title bar
/**
 * TitleBar：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct TitleBar {
  private title!: Resource;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // Row：水平布局容器
      // 关键属性：高度、宽度、内边距
      Row() {
        // Image：图片
        // 关键属性：宽度、高度、objectFit、点击事件回调、back
        // 交互：可点击交互
        Image($r('app.media.ic_back'))
          .width(40)
          .height(40)
          .objectFit(ImageFit.Contain)
          .onClick(() => {
            router.back()
          })
          .id('backBtn')
        // Text：文本
        // 关键属性：字号、字重、字体颜色、外边距
        Text(this.title).id('title_bar_text_3')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.font_color_black'))
          .margin({ left: 8, right: 8 })
      }.id('title_bar_row_2')
      .height(56)
      .width('100%')
      .padding({ left: 16, right: 16 })
    }.id('title_bar_column_1')
  }
}