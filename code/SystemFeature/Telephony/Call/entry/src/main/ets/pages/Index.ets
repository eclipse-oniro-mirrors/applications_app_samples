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
 * @file entry/src/main/ets/pages/Index.ets
 * 文件职责：Index 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Index。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CallView } from '../common/CallView'

/**
 * Index：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Index {
  // @State input：组件内部状态
  @State input: string = ''
  // @State output：组件内部状态
  @State output: string = `call information` + '\n'

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度
    Column() {
      Text($r('app.string.entry_MainAbility'))
        .id('callTitle')
        .width('100%')
        .height(50)
        .backgroundColor('#0D9FFB')
        .fontColor(Color.White)
        .fontSize(20)
        .padding({ left: 20 })
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        Column() {
          TextInput({ placeholder: $r('app.string.input_hint'), text: this.input })
            .id('telInput')
            .type(InputType.Number)
            .placeholderColor(Color.Grey)
            .placeholderFont({ size: 20, weight: FontWeight.Normal, family: 'sans-serif', style: FontStyle.Normal })
            .enterKeyType(EnterKeyType.Next)
            .caretColor($r('app.color.caret_color'))
            .height(60)
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .fontFamily('cursive')
            .maxLength(11)
            .margin({ left: 20, right: 20, top: 20, bottom: 20 })
            .onChange((value: string) => {
              this.input = value
            })
          // CallView：CallView 自定义组件
          CallView({ input: $input, output: $output }).id('index_call_view_4')
          Text(this.output)
            .id('callOutput')
            .width('90%')
            .height('45%')
            .fontSize(20)
            .padding(15)
            .margin({ left: 20, right: 20, top: 20 })
            .border({ width: 2, radius: 15, color: Color.Grey })
        }.id('index_column_3')
      }.id('index_scroll_2')
    }.id('index_column_1')
    .height('100%')
    .width('100%')
  }
}