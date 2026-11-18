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
 * @file entry/src/main/ets/pages/components/auxiliary/panelSample/PanelSample.ets
 * 文件职责：PanelSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PanelSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'
import { fruitArray } from '../../ComponentData'
import { getStringArrayData, getStringData } from '../../../../data/ResourceDataHandle'

@Extend(Text) function leftTitleStyle() {
  .fontColor($r('app.color.sub_title_color'))
  .fontSize(14)
  .height(22)
}

@Extend(Text) function subTitleStyle() {
  .fontColor($r('app.color.sub_title_color'))
  .fontSize(14)
  .height(22)
}

@Extend(Column) function cardStyle() {
  .backgroundColor(Color.White)
  .borderRadius(24)
  .width('100%')
  .padding(15)
}

@Extend(Column) function itemCardStyle() {
  .backgroundColor(Color.White)
  .borderRadius(24)
  .width('100%')
  .padding(10)
}

/**
 * PanelSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct PanelSample {
  // @State minShow：组件内部状态
  @State minShow: boolean = false
  // @State foldableShow：组件内部状态
  @State foldableShow: boolean = false
  // @State temporaryShow：组件内部状态
  @State temporaryShow: boolean = false
  // @State selectIndex：组件内部状态
  @State selectIndex: number = 0
  private panelMode: PanelMode = PanelMode.Half
  private miniPanelMode: PanelMode = PanelMode.Full
  private fruitArray: string[] = getStringArrayData(fruitArray)
  private radioGroupName: string = getStringData($r('app.string.panel_radio_groupname'))

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.auxiliary_panel') }).id('panel_sample_title_bar_2')
      // Column：垂直布局容器
      // 关键属性：cardStyle、外边距
      Column() {
        // Column：垂直布局容器
        // 关键属性：宽度、cardStyle
        Column({ space: 20 }) {
          // Button：按钮
          // 关键属性：宽度、点击事件回调
          // 交互：可点击交互
          Button(this.minShow ? $r('app.string.panel_close_minibar') : $r('app.string.panel_show_minibar'))
            .width('80%')
            .onClick(() => {
              this.minShow = !this.minShow
            }).id('test_miniBarButton')
          // Button：按钮
          // 关键属性：宽度、点击事件回调
          // 交互：可点击交互
          Button(this.foldableShow ? $r('app.string.panel_close_foldable') : $r('app.string.panel_show_foldable'))
            .width('80%')
            .onClick(() => {
              this.foldableShow = !this.foldableShow
            }).id('test_foldableButton')
          // Button：按钮
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Button(this.temporaryShow ? $r('app.string.panel_close_temporary') : $r('app.string.panel_show_temporary'))
            .onClick(() => {
              this.temporaryShow = !this.temporaryShow
            }).id('test_temporaryButton')
            .width('80%')
        }.id('panel_sample_column_4').width('100%')
      }.id('panel_sample_column_3').cardStyle()
      .margin({ top: 20 })

      // Panel：面板容器
      // 关键属性：mode、输入类型、背景色、边框宽度、圆角
      Panel(this.minShow) {
        // Column：垂直布局容器
        // 关键属性：外边距
        Column({ space: 5 }) {
          ForEach(this.fruitArray, (item: string, index: number) => {
            // Column：垂直布局容器
            // 关键属性：itemCardStyle、点击事件回调
            // 交互：可点击交互
            Column() {
              // Row：水平布局容器
              // 关键属性：宽度、itemCardStyle
              Row() {
                // Text：文本
                // 关键属性：字号
                Text(item).id('panel_sample_text_9')
                  .fontSize(15)
                // Blank：占位空白
                Blank().id('panel_sample_blank_10')
                // Radio：单选框
                // 关键属性：勾选状态、宽度
                Radio({ value: item, group: this.radioGroupName })
                  .id('test_miniBarRadio' + index)
                  .checked(this.selectIndex === index)
              }.id('panel_sample_row_8').width('100%')
            }.id('panel_sample_column_7').itemCardStyle()
            .onClick(() => {
              this.selectIndex = index
            })
          })
        }.id('panel_sample_column_6').margin({ left: 10, right: 10 })
      }.id('panel_sample_panel_5')
      .mode(this.miniPanelMode)
      .type(PanelType.Minibar)
      .backgroundColor($r('app.string.panel_background_color'))
      .borderWidth(0)
      .borderRadius(24)

      // Panel：面板容器
      // 关键属性：内容变更回调
      // 交互：输入/提交回调
      Panel(this.foldableShow) {
        // Column：垂直布局容器
        // 关键属性：外边距、内容变更回调
        // 交互：输入/提交回调
        Column({ space: 5 }) {
          ForEach(this.fruitArray, (item: string, index: number) => {
            // Column：垂直布局容器
            // 关键属性：itemCardStyle、点击事件回调
            // 交互：可点击交互
            Column() {
              // Row：水平布局容器
              // 关键属性：宽度、itemCardStyle
              Row() {
                // Text：文本
                // 关键属性：字号
                Text(item).id('panel_sample_text_15')
                  .fontSize(15)
                // Blank：占位空白
                Blank().id('panel_sample_blank_16')
                // Radio：单选框
                // 关键属性：勾选状态、宽度
                Radio({ value: item, group: this.radioGroupName })
                  .id('test_foldableRadio' + index)
                  .checked(this.selectIndex === index)
              }.id('panel_sample_row_14').width('100%')
            }.id('panel_sample_column_13').itemCardStyle()
            .onClick(() => {
              this.selectIndex = index
            })
          })
        }.id('panel_sample_column_12').margin({ left: 10, right: 10 })
      }.id('panel_sample_panel_11').onChange((width, height, mode) => {
        this.panelMode = mode
      })
      .mode(this.panelMode)
      .backgroundColor($r('app.string.panel_background_color'))
      .borderWidth(0)
      .borderRadius(24)

      // Panel：面板容器
      // 关键属性：内容变更回调
      // 交互：输入/提交回调
      Panel(this.temporaryShow) {
        // Column：垂直布局容器
        // 关键属性：外边距、内容变更回调
        // 交互：输入/提交回调
        Column({ space: 5 }) {
          ForEach(this.fruitArray, (item: string, index: number) => {
            // Column：垂直布局容器
            // 关键属性：itemCardStyle、点击事件回调
            // 交互：可点击交互
            Column() {
              // Row：水平布局容器
              // 关键属性：宽度、itemCardStyle
              Row() {
                // Text：文本
                // 关键属性：字号
                Text(item).id('panel_sample_text_21')
                  .fontSize(15)
                // Blank：占位空白
                Blank().id('panel_sample_blank_22')
                // Radio：单选框
                // 关键属性：勾选状态、宽度
                Radio({ value: item, group: this.radioGroupName })
                  .id('test_temporaryRadio' + index)
                  .checked(this.selectIndex === index)
              }.id('panel_sample_row_20').width('100%')
            }.id('panel_sample_column_19').itemCardStyle()
            .onClick(() => {
              this.selectIndex = index
            })
          })
        }.id('panel_sample_column_18').margin({ left: 10, right: 10 })
      }.id('panel_sample_panel_17').onChange((width, height, mode) => {
        this.panelMode = mode
      })
      .type(PanelType.Temporary)
      .backgroundColor($r('app.string.panel_background_color'))
      .borderWidth(0)
      .borderRadius(24)

    }.id('panel_sample_column_1')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding(12)
  }
}