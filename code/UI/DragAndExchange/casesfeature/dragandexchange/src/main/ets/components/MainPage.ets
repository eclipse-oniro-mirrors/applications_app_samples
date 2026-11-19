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

/**
 * @file src/main/ets/components/MainPage.ets
 * 文件职责：MainPage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：MainPage。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * MainPage：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct MainPage {
  // @State message：组件内部状态
  @State message: string = 'Hello World';

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .id('main_page_text_2')
      }
      .width('100%')
      .id('main_page_column_1')
    }
    .height('100%')
    .id('main_page_row_0')
  }
}
