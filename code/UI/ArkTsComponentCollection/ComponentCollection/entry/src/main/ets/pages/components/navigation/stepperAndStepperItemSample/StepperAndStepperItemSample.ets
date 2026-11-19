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
 * @file entry/src/main/ets/pages/components/navigation/stepperAndStepperItemSample/StepperAndStepperItemSample.ets
 * 文件职责：StepperAndStepperItemSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：GridSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';

@Styles function itemStyle () {
  .width(336)
  .height(621)
  .margin({ top: 48, left: 12 })
  .borderRadius(16)
  .backgroundColor('#FFFFFF')
}

@Extend(Text) function itemTextStyle () {
  .fontColor('#182431')
  .fontSize(36)
  .fontWeight(500)
  .opacity(0.4)
  .margin({ top: 82, bottom: 40 })
}

/**
 * GridSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct GridSample {
  // @State currentIndex：组件内部状态
  @State currentIndex: number = 0;

  // @State firstState：组件内部状态
  @State firstState: ItemState = ItemState.Normal;

  // @State secondState：组件内部状态
  @State secondState: ItemState = ItemState.Normal;

  // @State thirdState：组件内部状态
  @State thirdState: ItemState = ItemState.Normal;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Flex：弹性布局容器
    // 关键属性：内边距、高度、宽度、背景色
    Flex({direction : FlexDirection.Column}){
      // TitleBar：TitleBar 自定义组件
      // 关键属性：剩余空间放大
      TitleBar({ title: $r('app.string.stepper_title')}).id('stepper_and_stepper_item_sample_title_bar_2')
        .flexGrow(0)
      // Stepper：步骤导航
      // 关键属性：宽度、高度、剩余空间放大、onFinish、info
      Stepper({
        index: this.currentIndex
      }) {
        // StepperItem：步骤导航项
        // 关键属性：nextLabel、getStringSync、status
        StepperItem() {
          // Column：垂直布局容器
          // 关键属性：itemStyle
          Column() {
            // Text：文本
            // 关键属性：itemTextStyle
            Text('Page One').id('stepper_and_stepper_item_sample_text_6')
              .itemTextStyle()
            // Button：按钮
            // 关键属性：背景色、点击事件回调
            // 交互：可点击交互
            Button('change status:' + this.firstState).id('stepper_and_stepper_item_sample_button_7')
              .backgroundColor('#007dFF')
              .onClick(() => {
                this.firstState = this.firstState === ItemState.Skip ? ItemState.Normal : ItemState.Skip;
              })
          }.id('stepper_and_stepper_item_sample_column_5').itemStyle()
        }.id('stepper_and_stepper_item_sample_stepper_item_4')
        .nextLabel(getContext().resourceManager.getStringSync($r('app.string.next_step')))
        .status(this.firstState)
        // StepperItem：步骤导航项
        // 关键属性：nextLabel、getStringSync、prevLabel、status
        StepperItem() {
          // Column：垂直布局容器
          // 关键属性：itemStyle
          Column() {
            // Text：文本
            // 关键属性：itemTextStyle
            Text('Page Two').id('stepper_and_stepper_item_sample_text_10')
              .itemTextStyle()
            // Button：按钮
            // 关键属性：背景色、点击事件回调
            // 交互：可点击交互
            Button('change status:' + this.secondState).id('stepper_and_stepper_item_sample_button_11')
              .backgroundColor('#007dFF')
              .onClick(() => {
                this.secondState = this.secondState === ItemState.Disabled ? ItemState.Normal : ItemState.Disabled;
              })
          }.id('stepper_and_stepper_item_sample_column_9').itemStyle()
        }.id('stepper_and_stepper_item_sample_stepper_item_8')
        .nextLabel(getContext().resourceManager.getStringSync($r('app.string.next_step')))
        .prevLabel(getContext().resourceManager.getStringSync($r('app.string.previous')))
        .status(this.secondState)
        // StepperItem：步骤导航项
        // 关键属性：status
        StepperItem() {
          // Column：垂直布局容器
          // 关键属性：itemStyle
          Column() {
            // Text：文本
            // 关键属性：itemTextStyle
            Text('Page Three').id('stepper_and_stepper_item_sample_text_14')
              .itemTextStyle()
            // Button：按钮
            // 关键属性：背景色、点击事件回调
            // 交互：可点击交互
            Button('change status:' + this.thirdState).id('stepper_and_stepper_item_sample_button_15')
              .backgroundColor('#007dFF')
              .onClick(() => {
                this.thirdState = this.thirdState === ItemState.Waiting ? ItemState.Normal : ItemState.Waiting;
              })
          }.id('stepper_and_stepper_item_sample_column_13').itemStyle()
        }.id('stepper_and_stepper_item_sample_stepper_item_12')
        .status(this.thirdState)
        // StepperItem：步骤导航项
        StepperItem() {
          // Column：垂直布局容器
          // 关键属性：itemStyle
          Column() {
            // Text：文本
            // 关键属性：itemTextStyle、itemStyle
            Text('Page Four').id('stepper_and_stepper_item_sample_text_18')
              .itemTextStyle()
          }.id('stepper_and_stepper_item_sample_column_17').itemStyle()
        }.id('stepper_and_stepper_item_sample_stepper_item_16')
      }.id('stepper_and_stepper_item_sample_stepper_3')
      .width('100%')
      .height(100)
      .flexGrow(1)
      .onFinish(() => {
        console.info('onFinish');
      })
      .onSkip(() => {
        console.info('onSkip');
      })
      .onChange((prevIndex: number, index: number) => {
        this.currentIndex = index;
      })
    }.id('stepper_and_stepper_item_sample_flex_1')
    .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}