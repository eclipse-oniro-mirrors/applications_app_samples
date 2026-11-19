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
 * @file entry/src/main/ets/pages/components/buttonAndSelection/toggleSample/ToggleSample.ets
 * 文件职责：ToggleSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ToggleSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import ShowToast from '../../../../util/ShowToast'
import { TitleBar } from '../../../../common/TitleBar'

@Extend(Row) function rowStyle() {
  .padding(12)
  .borderRadius(24)
  .backgroundColor(Color.White)
  .size({ width: '100%', height: 70 })
}

/**
 * ToggleSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ToggleSample {
  // @State testIndexId：组件内部状态
  @State testIndexId: string = 'testIndexId';

  // @State isNormalSelect：组件内部状态
  @State isNormalSelect: boolean = false;

  // @State isCustomSelect：组件内部状态
  @State isCustomSelect: boolean = true;
  private context: Context = getContext(this);
  private toggleState: string = this.context.resourceManager.getStringSync($r('app.string.toggle_state').id);

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：尺寸、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.toggle_title') }).id(this.testIndexId)
      // Scroll：滚动容器
      // 关键属性：内边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.toggle_type_switch') })
            .id('toggle_sample_introduction_title_4')
          // Row：水平布局容器
          // 关键属性：rowStyle、主轴对齐
          Row() {
            // Toggle：开关
            // 关键属性：内容变更回调、longToast
            // 交互：输入/提交回调
            Toggle({ type: ToggleType.Switch, isOn: false })
              .onChange((isOn: boolean) => {
                ShowToast.longToast(`${this.toggleState}${isOn}`)
                this.testIndexId = 'test_ToggleSwitch1'
              }).id('test_ToggleSwitch1')

            // Toggle：开关
            // 关键属性：switchPointColor、selectedColor、内容变更回调、longToast
            // 交互：输入/提交回调
            Toggle({ type: ToggleType.Switch, isOn: true })
              .switchPointColor($r('app.color.background_blue'))
              .selectedColor($r('app.color.toggle_selected_color'))
              .onChange((isOn: boolean) => {
                ShowToast.longToast(`${this.toggleState}${isOn}`)
                this.testIndexId = 'test_ToggleSwitch2'
              }).id('test_ToggleSwitch2')
          }.id('toggle_sample_row_5')
          .rowStyle()
          .justifyContent(FlexAlign.SpaceAround)

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.toggle_type_checkbox') })
            .id('toggle_sample_introduction_title_6')
          // Row：水平布局容器
          // 关键属性：rowStyle、主轴对齐
          Row() {
            // Row：水平布局容器
            Row() {
              // Toggle：开关
              // 关键属性：内容变更回调、longToast
              // 交互：输入/提交回调
              Toggle({ type: ToggleType.Checkbox, isOn: false })
                .onChange((isOn: boolean) => {
                  ShowToast.longToast(`${this.toggleState}${isOn}`)
                  this.testIndexId = 'test_ToggleCheckbox1'
                }).id('test_ToggleCheckbox1')
              // Text：文本
              Text($r('app.string.radio_beijing')).id('toggle_sample_text_9')
            }.id('toggle_sample_row_8')

            // Row：水平布局容器
            Row() {
              // Toggle：开关
              // 关键属性：selectedColor、内容变更回调、longToast
              // 交互：输入/提交回调
              Toggle({ type: ToggleType.Checkbox, isOn: true })
                .selectedColor($r('app.color.toggle_selected_color'))
                .onChange((isOn: boolean) => {
                  ShowToast.longToast(`${this.toggleState}${isOn}`)
                  this.testIndexId = 'test_ToggleCheckbox2'
                }).id('test_ToggleCheckbox2')
              // Text：文本
              Text($r('app.string.radio_shanghai')).id('toggle_sample_text_11')
            }.id('toggle_sample_row_10')
          }.id('toggle_sample_row_7')
          .rowStyle()
          .justifyContent(FlexAlign.SpaceAround)

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.toggle_type_button') })
            .id('toggle_sample_introduction_title_12')
          // Row：水平布局容器
          // 关键属性：rowStyle、主轴对齐、外边距
          Row() {
            // Toggle：开关
            // 关键属性：尺寸、内容变更回调
            // 交互：输入/提交回调
            Toggle({ type: ToggleType.Button, isOn: this.isNormalSelect }) {
              // Text：文本
              // 关键属性：字号
              Text(this.isNormalSelect ? $r('app.string.toggle_select') : $r('app.string.toggle_unselect'))
                .id('toggle_sample_text_14')
                .fontSize(18)
            }
            .size({ width: 90, height: 35 })
            .onChange((isOn: boolean) => {
              this.isNormalSelect = isOn
              ShowToast.longToast(`${this.toggleState}${isOn}`)
              this.testIndexId = 'test_ToggleButton1'
            }).id('test_ToggleButton1')

            // Toggle：开关
            // 关键属性：尺寸、selectedColor、内容变更回调
            // 交互：输入/提交回调
            Toggle({ type: ToggleType.Button, isOn: this.isCustomSelect }) {
              // Text：文本
              // 关键属性：字号
              Text(this.isCustomSelect ? $r('app.string.toggle_select') : $r('app.string.toggle_unselect'))
                .id('toggle_sample_text_15')
                .fontSize(18)
            }
            .size({ width: 90, height: 35 })
            .selectedColor($r('app.color.toggle_selected_color'))
            .onChange((isOn: boolean) => {
              this.isCustomSelect = isOn
              ShowToast.longToast(`${this.toggleState}${isOn}`)
              this.testIndexId = 'test_ToggleButton2'
            }).id('test_ToggleButton2')
          }.id('toggle_sample_row_13')
          .rowStyle()
          .justifyContent(FlexAlign.SpaceAround)
          .margin({ bottom: 80 })
        }.id('toggle_sample_column_3')
        .constraintSize({ minHeight: '100%' }) // Let the minHeight of the component cover screen at least
      }.id('toggle_sample_scroll_2')
      .padding({ left: 12, right: 12 })
    }.id('toggle_sample_column_1')
    .size({ width: '100%', height: '100%' })
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}
