/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/textAndInput/richEditorSample/Title.ets
 * 文件职责：Title 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Title。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * Title：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct Title {
  private title!: Resource;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度
    Column() {
      // Row：水平布局容器
      // 关键属性：外边距、宽度
      Row() {
        // Text：文本
        // 关键属性：字号、字重
        Text(this.title).id('title_text_3')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
      }.id('title_row_2')
      .margin({top:"2%",left:"5%"})
      .width('100%')
    }.id('title_column_1')
    .height('100%')
  }
}