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
 * @file entry/src/main/ets/pages/components/buttonAndSelection/checkboxSample/CheckboxSample.ets
 * 文件职责：CheckboxSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：CheckboxSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'
import Logger from '../../../../util/Logger'
import { getStringData } from '../../../../data//ResourceDataHandle'

@Extend(Text) function leftTitleStyle() {
  .fontColor($r('app.color.sub_title_color'))
  .fontSize(14)
  .height(22)
  .alignSelf(ItemAlign.Start)
  .margin({ left: 12, top: 12 })
}

@Extend(Column) function cardStyle() {
  .backgroundColor(Color.White)
  .borderRadius(24)
  .width('100%')
  .padding(15)
}

@Extend(Circle) function colorPicker(color: Color | string, callback: () => void) {
  .fill(color)
  .height(20)
  .width(20)
  .onClick(() => {
    callback()
  })
}

@Styles function pressedStyle() {
  .opacity(0.7)
  .borderWidth(1)
  .borderRadius(20)
}

/**
 * CheckboxSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct CheckboxSample {
  // @State testCount：组件内部状态
  @State testCount: number = 0
  // @State rating：组件内部状态
  @State rating: number = 1
  // @State indicator：组件内部状态
  @State indicator: boolean = false
  // @State stars：组件内部状态
  @State stars: number = 5
  // @State slectedColor：组件内部状态
  @State slectedColor: Color = 0xed6f21
  private colorArray: Color[] = [0xed6f21, Color.Gray, Color.Red, Color.Yellow,
  Color.Pink, Color.Blue, Color.Green, Color.Orange]

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.checkbox_checkboxgroup') }).id('checkbox_sample_title_bar_2')
      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.checkbox_title')).id('checkbox_sample_text_3')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // Text：文本
          // 关键属性：字号
          Text($r('app.string.checkbox_apple')).id('checkbox_sample_text_6').fontSize(20)
          // Blank：占位空白
          Blank().id('checkbox_sample_blank_7')
          // Checkbox：复选框
          // 关键属性：selectedColor、内容变更回调、info
          // 交互：输入/提交回调
          Checkbox({
            name: getStringData($r('app.string.checkbox_checkbox1')),
            group: getStringData($r('app.string.checkbox_checkgroup'))
          }).id('checkbox_sample_checkbox_8')
            .selectedColor(this.slectedColor)
            .onChange((value: boolean) => {
              Logger.info(`Checkbox1 change is ${value}`)
            })
        }.id('checkbox_sample_row_5').width('100%')

        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // Text：文本
          // 关键属性：字号
          Text($r('app.string.checkbox_blueberry')).id('checkbox_sample_text_10').fontSize(20)
          // Blank：占位空白
          Blank().id('checkbox_sample_blank_11')
          // Checkbox：复选框
          // 关键属性：selectedColor、内容变更回调、info
          // 交互：输入/提交回调
          Checkbox({
            name: getStringData($r('app.string.checkbox_checkbox1')),
            group: getStringData($r('app.string.checkbox_checkgroup'))
          }).id('checkbox_sample_checkbox_12')
            .selectedColor(this.slectedColor)
            .onChange((value: boolean) => {
              Logger.info(`Checkbox1 change is ${value}`)
            })
        }.id('checkbox_sample_row_9').width('100%')

        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // Text：文本
          // 关键属性：字号
          Text($r('app.string.checkbox_banbana')).id('checkbox_sample_text_14').fontSize(20)
          // Blank：占位空白
          Blank().id('checkbox_sample_blank_15')
          // Checkbox：复选框
          // 关键属性：selectedColor、内容变更回调、info
          // 交互：输入/提交回调
          Checkbox({
            name: getStringData($r('app.string.checkbox_checkbox1')),
            group: getStringData($r('app.string.checkbox_checkgroup'))
          }).id('checkbox_sample_checkbox_16')
            .selectedColor(this.slectedColor)
            .onChange((value: boolean) => {
              Logger.info(`Checkbox1 change is ${value}`)
            })
        }.id('checkbox_sample_row_13').width('100%')

        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // Text：文本
          // 关键属性：字号
          Text($r('app.string.checkbox_orange')).id('checkbox_sample_text_18').fontSize(20)
          // Blank：占位空白
          Blank().id('checkbox_sample_blank_19')
          // Checkbox：复选框
          // 关键属性：selectedColor、内容变更回调、info
          // 交互：输入/提交回调
          Checkbox({
            name: getStringData($r('app.string.checkbox_checkbox1')),
            group: getStringData($r('app.string.checkbox_checkgroup'))
          }).id('checkbox_sample_checkbox_20')
            .selectedColor(this.slectedColor)
            .onChange((value: boolean) => {
              Logger.info(`Checkbox1 change is ${value}`)
            })
        }.id('checkbox_sample_row_17').width('100%')

        // Column：垂直布局容器
        Column() {
          // Text：文本
          // 关键属性：字号、外边距
          Text($r('app.string.checkbox_select_color')).id('checkbox_sample_text_22').fontSize(20)
            .margin(10)
          // Row：水平布局容器
          // 关键属性：宽度
          Row() {
            // Blank：占位空白
            Blank().id('checkbox_sample_blank_24')
            ForEach(this.colorArray, (item: Color, index) => {
              // Circle：圆形
              // 关键属性：colorPicker
              Circle({ width: 20, height: 20 })
                .colorPicker(item, () => {
                  this.slectedColor = item
                }).id('test_changeColor' + index)
                .stateStyles({
                  pressed: pressedStyle,
                  normal: {
                    .borderRadius(20)
                    .borderWidth(1)
                  }
                })
              // Blank：占位空白
              Blank().id('checkbox_sample_blank_25')
            })
          }.id('checkbox_sample_row_23').width('100%')
        }.id('checkbox_sample_column_21')
      }.id('checkbox_sample_column_4')
      .cardStyle()
      .width('100%')

      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.checkbox_checkgroup_title')).id('checkbox_sample_text_26')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // CheckboxGroup：复选框组
          // 关键属性：selectedColor、内容变更回调、info、stringify
          // 交互：输入/提交回调
          CheckboxGroup({ group: getStringData($r('app.string.checkbox_checkgroup')) })
            .selectedColor(0xed6f21)
            .onChange((itemName: CheckboxGroupResult) => {
              Logger.info(`checkbox group content ${JSON.stringify(itemName)}`)
            }).id('test_selectAll')
          // Text：文本
          // 关键属性：字号、宽度
          Text($r('app.string.checkbox_select_all')).id('checkbox_sample_text_29').fontSize(20)
        }.id('checkbox_sample_row_28').width('100%')

        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // Checkbox：复选框
          // 关键属性：selectedColor、内容变更回调、info
          // 交互：输入/提交回调
          Checkbox({
            name: getStringData($r('app.string.checkbox_checkbox1')),
            group: getStringData($r('app.string.checkbox_checkgroup'))
          }).id('checkbox_sample_checkbox_31')
            .selectedColor(0x39a2db)
            .onChange((value: boolean) => {
              Logger.info(`Checkbox1 change is ${value}`)
            }).margin({ left: 30 })
          // Text：文本
          // 关键属性：字号、宽度
          Text('Checkbox1').id('checkbox_sample_text_32').fontSize(20)
        }.id('checkbox_sample_row_30').width('100%')

        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // Checkbox：复选框
          // 关键属性：selectedColor、内容变更回调、info
          // 交互：输入/提交回调
          Checkbox({
            name: getStringData($r('app.string.checkbox_checkbox2')),
            group: getStringData($r('app.string.checkbox_checkgroup'))
          }).id('checkbox_sample_checkbox_34')
            .selectedColor(0x39a2db)
            .onChange((value: boolean) => {
              Logger.info(`Checkbox2 change is ${value}`)
            }).margin({ left: 30 })
          // Text：文本
          // 关键属性：字号、宽度
          Text('Checkbox2').id('checkbox_sample_text_35').fontSize(20)
        }.id('checkbox_sample_row_33').width('100%')

        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // Checkbox：复选框
          // 关键属性：selectedColor、内容变更回调、info
          // 交互：输入/提交回调
          Checkbox({
            name: getStringData($r('app.string.checkbox_checkbox3')),
            group: getStringData($r('app.string.checkbox_checkgroup'))
          }).id('checkbox_sample_checkbox_37')
            .selectedColor(0x39a2db)
            .onChange((value: boolean) => {
              Logger.info(`Checkbox3 change is ${value}`)
            }).margin({ left: 30 })
          // Text：文本
          // 关键属性：字号、宽度
          Text('Checkbox3').id('checkbox_sample_text_38').fontSize(20)
        }.id('checkbox_sample_row_36').width('100%')
      }.id('checkbox_sample_column_27')
      .cardStyle()
      .width('100%')

    }.id('checkbox_sample_column_1').height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding({ left: 20, right: 20 })
  }
}