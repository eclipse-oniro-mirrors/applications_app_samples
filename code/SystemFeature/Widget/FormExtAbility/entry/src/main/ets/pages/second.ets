/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/second.ets
 * 文件职责：second 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Second。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位。
 */

import router from '@ohos.router';

/**
 * Second：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Second {
  @State message: string = 'Second Page'

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    Row() {
      Column() {
        Text(this.message)
          .id('secondMessageText')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('back to index').id('second_text_3')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }.id('secondBackButton')
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('35%')
        .height('5%')
        .onClick(() => {
          router.back()
        })
      }.id('second_column_2')
      .width('100%')
    }.id('second_row_1')
    .height('100%')
  }
}
