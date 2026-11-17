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
 * @file entry/src/main/ets/pages/index.ets
 * 文件职责：index 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Index。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import router from '@ohos.router';
import Logger from '../model/Logger';

async function routePage() {
  let options: router.RouterOptions = {
    url: 'pages/second'
  }
  try {
    await router.push(options)
  } catch (err) {
    Logger.error(`fail callback, code: ${err.code}, msg: ${err.msg}`)
  }
}

/**
 * Index：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Index {
  // @State message：组件内部状态
  @State message: string = 'Hello World'

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
        // Text：文本
        // 关键属性：字号、字重
        Text(this.message)
          .id('indexMessageText')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        // Button：按钮
        // 关键属性：输入类型、外边距
        Button() {
          // Text：文本
          // 关键属性：字号、字重
          Text('next page').id('index_text_3')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }.id('indexNextButton')
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('35%')
        .height('5%')
        .onClick(() => {
          routePage()
        })
      }.id('index_column_2')
      .width('100%')
    }.id('index_row_1')
    .height('100%')
  }
}
