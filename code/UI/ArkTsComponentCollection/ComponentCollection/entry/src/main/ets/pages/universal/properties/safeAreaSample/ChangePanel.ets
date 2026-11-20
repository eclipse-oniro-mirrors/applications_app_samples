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
 * @file entry/src/main/ets/pages/universal/properties/safeAreaSample/ChangePanel.ets
 * 文件职责：ChangePanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ChangePanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { getStringData } from '../../../../data//ResourceDataHandle'
import Logger from '../../../../util/Logger'

/**
 * ChangePanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ChangePanel {
  // @Link mSafeAreaType：与父组件双向绑定的状态
  @Link mSafeAreaType: SafeAreaType[]
  // @Link mSafeAreaEdge：与父组件双向绑定的状态
  @Link mSafeAreaEdge: SafeAreaEdge[]

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    Row() {
      // Column：垂直布局容器
      // 关键属性：布局权重
      Column() {
        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // CheckboxGroup：复选框组
          // 关键属性：selectedColor、内容变更回调
          // 交互：输入/提交回调
          CheckboxGroup({ group: getStringData($r('app.string.safe_area_type')) })
            .selectedColor(0xed6f21)
            .onChange((itemName: CheckboxGroupResult) => {
              this.mSafeAreaType = []
              for (let i = 0;i < itemName.name.length; i++) {
                if (itemName.name[i] == getStringData($r('app.string.safe_area_type_system'))) {
                  this.mSafeAreaType.push(SafeAreaType.SYSTEM)
                }
                else if (itemName.name[i] == getStringData($r('app.string.safe_area_type_cutout'))) {
                  this.mSafeAreaType.push(SafeAreaType.CUTOUT)
                }
                else if (itemName.name[i] == getStringData($r('app.string.safe_area_type_keyboard'))) {
                  this.mSafeAreaType.push(SafeAreaType.KEYBOARD)
                }
              }

              Logger.info(`checkbox group content ${JSON.stringify(this.mSafeAreaType)}`)
            }).id('test_selectAll')
          // Text：文本
          // 关键属性：字号、宽度
          Text($r('app.string.checkbox_select_all')).id('change_panel_text_4').fontSize(20)
        }.id('change_panel_row_3').width('100%')

        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // Checkbox：复选框
          // 关键属性：selectedColor、内容变更回调、info
          // 交互：输入/提交回调
          Checkbox({
            name: getStringData($r('app.string.safe_area_type_system')),
            group: getStringData($r('app.string.safe_area_type'))
          })
            .id('SYSTEM')
            .selectedColor($r('app.color.select_option_font_color'))
            .onChange((value: boolean) => {
              Logger.info(`Checkbox1 change is ${value}`)
            }).margin({ left: 30 })
          // Text：文本
          // 关键属性：字号、宽度
          Text($r('app.string.safe_area_type_system')).id('change_panel_text_6').fontSize(20)
        }.id('change_panel_row_5').width('100%')

        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // Checkbox：复选框
          // 关键属性：select、selectedColor、内容变更回调、info
          // 交互：输入/提交回调
          Checkbox({
            name: getStringData($r('app.string.safe_area_type_cutout')),
            group: getStringData($r('app.string.safe_area_type'))
          }).id('change_panel_checkbox_8')
            .select(true)
            .selectedColor($r('app.color.select_option_font_color'))
            .onChange((value: boolean) => {
              Logger.info(`Checkbox2 change is ${value}`)
            }).margin({ left: 30 })
          // Text：文本
          // 关键属性：字号、宽度
          Text($r('app.string.safe_area_type_cutout')).id('change_panel_text_9').fontSize(20)
        }.id('change_panel_row_7').width('100%')

        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // Checkbox：复选框
          // 关键属性：selectedColor、内容变更回调、info
          // 交互：输入/提交回调
          Checkbox({
            name: getStringData($r('app.string.safe_area_type_keyboard')),
            group: getStringData($r('app.string.safe_area_type'))
          }).id('change_panel_checkbox_11')
            .selectedColor($r('app.color.select_option_font_color'))
            .onChange((value: boolean) => {
              Logger.info(`Checkbox3 change is ${value}`)
            }).margin({ left: 30 })
          // Text：文本
          // 关键属性：字号、宽度
          Text($r('app.string.safe_area_type_keyboard')).id('change_panel_text_12').fontSize(20)
        }.id('change_panel_row_10').width('100%')
      }.id('change_panel_column_2')
      .layoutWeight(1)

      // Column：垂直布局容器
      // 关键属性：布局权重
      Column() {
        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // CheckboxGroup：复选框组
          // 关键属性：selectedColor、内容变更回调
          // 交互：输入/提交回调
          CheckboxGroup({ group: getStringData($r('app.string.safe_area_edge')) })
            .selectedColor(0xed6f21)
            .onChange((itemName: CheckboxGroupResult) => {
              this.mSafeAreaEdge = []
              for (let i = 0;i < itemName.name.length; i++) {
                if (itemName.name[i] == getStringData($r('app.string.safe_area_edge_bottom'))) {
                  this.mSafeAreaEdge.push(SafeAreaEdge.BOTTOM)
                }
                else if (itemName.name[i] == getStringData($r('app.string.safe_area_edge_top'))) {
                  this.mSafeAreaEdge.push(SafeAreaEdge.TOP)
                }
                else if (itemName.name[i] == getStringData($r('app.string.safe_area_edge_start'))) {
                  this.mSafeAreaEdge.push(SafeAreaEdge.START)
                }
                else if (itemName.name[i] == getStringData($r('app.string.safe_area_edge_end'))) {
                  this.mSafeAreaEdge.push(SafeAreaEdge.END)
                }
              }
              Logger.info(`checkbox group content ${JSON.stringify(itemName)}`)
            }).id('test_selectAll')
          // Text：文本
          // 关键属性：字号、宽度
          Text($r('app.string.checkbox_select_all')).id('change_panel_text_15').fontSize(20)
        }.id('change_panel_row_14').width('100%')

        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // Checkbox：复选框
          // 关键属性：select、selectedColor、内容变更回调、info
          // 交互：输入/提交回调
          Checkbox({
            name: getStringData($r('app.string.safe_area_edge_top')),
            group: getStringData($r('app.string.safe_area_edge'))
          }).id('change_panel_checkbox_17')
            .select(true)
            .selectedColor($r('app.color.select_option_font_color'))
            .onChange((value: boolean) => {
              Logger.info(`Checkbox1 change is ${value}`)
            }).margin({ left: 30 })
          // Text：文本
          // 关键属性：字号、宽度
          Text($r('app.string.safe_area_edge_top')).id('change_panel_text_18').fontSize(20)
        }.id('change_panel_row_16').width('100%')

        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // Checkbox：复选框
          // 关键属性：select、selectedColor、内容变更回调、info
          // 交互：输入/提交回调
          Checkbox({
            name: getStringData($r('app.string.safe_area_edge_bottom')),
            group: getStringData($r('app.string.safe_area_edge'))
          }).id('change_panel_checkbox_20')
            .select(true)
            .selectedColor($r('app.color.select_option_font_color'))
            .onChange((value: boolean) => {
              Logger.info(`Checkbox2 change is ${value}`)
            }).margin({ left: 30 })
          // Text：文本
          // 关键属性：字号、宽度
          Text($r('app.string.safe_area_edge_bottom')).id('change_panel_text_21').fontSize(20)
        }.id('change_panel_row_19').width('100%')

        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // Checkbox：复选框
          // 关键属性：selectedColor、内容变更回调、info
          // 交互：输入/提交回调
          Checkbox({
            name: getStringData($r('app.string.safe_area_edge_start')),
            group: getStringData($r('app.string.safe_area_edge'))
          }).id('change_panel_checkbox_23')
            .selectedColor($r('app.color.select_option_font_color'))
            .onChange((value: boolean) => {
              Logger.info(`Checkbox3 change is ${value}`)
            }).margin({ left: 30 })
          // Text：文本
          // 关键属性：字号、宽度
          Text($r('app.string.safe_area_edge_start')).id('change_panel_text_24').fontSize(20)
        }.id('change_panel_row_22').width('100%')

        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // Checkbox：复选框
          // 关键属性：selectedColor、内容变更回调、info
          // 交互：输入/提交回调
          Checkbox({
            name: getStringData($r('app.string.safe_area_edge_end')),
            group: getStringData($r('app.string.safe_area_edge'))
          }).id('change_panel_checkbox_26')
            .selectedColor($r('app.color.select_option_font_color'))
            .onChange((value: boolean) => {
              Logger.info(`Checkbox3 change is ${value}`)
            }).margin({ left: 30 })
          // Text：文本
          // 关键属性：字号、宽度
          Text($r('app.string.safe_area_edge_end')).id('change_panel_text_27').fontSize(20)
        }.id('change_panel_row_25').width('100%')
      }.id('change_panel_column_13')
      .layoutWeight(1)
    }.id('change_panel_row_1')
  }
}