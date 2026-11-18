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
 * @file ImageFitFullSample.ets
 * 文件职责：ImageFitFullSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ImageFitFullSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

@Extend(Radio) function fancyRadio(){
  .height(25)
  .width(25)
}

/**
 * ImageFitFullSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ImageFitFullSample {
  // @State message：组件内部状态
  @State message: string = 'Hello World';

  // @State imageFit：组件内部状态
  @State imageFit: ImageFit = ImageFit.None;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.image_fit_Full_effect') }).id('image_fit_full_sample_title_bar_2');
      // Image：图片
      // 关键属性：宽度、高度、objectFit、外边距、边框宽度、自身对齐
      Image($r('app.media.flower')).id('image_fit_full_sample_image_3')
        .width('100%')
        .height('30%')
        .objectFit(this.imageFit)
        .margin({ top: '30%' })
        .borderWidth(1)
        .alignSelf(ItemAlign.Center);

      // Grid：网格容器
      // 关键属性：columnsTemplate、宽度
      Grid() {
        // GridItem：网格项
        GridItem() {
          // Column：垂直布局容器
          Column() {
            // Text：文本
            Text('Contain').id('image_fit_full_sample_text_7')
            // Radio：单选框
            // 关键属性：fancyRadio、勾选状态、内容变更回调
            // 交互：输入/提交回调
            Radio({ value: 'RadioContain', group: 'radioGroup' }).id('image_fit_full_sample_radio_8')
              .fancyRadio()
              .checked(false)
              .onChange((isChecked: boolean) => {
                this.imageFit = ImageFit.Contain;
              });
          }.id('image_fit_full_sample_column_6');
        }.id('image_fit_full_sample_grid_item_5');
        // GridItem：网格项
        GridItem() {
          // Column：垂直布局容器
          Column() {
            // Text：文本
            Text('Cover').id('image_fit_full_sample_text_11')
            // Radio：单选框
            // 关键属性：fancyRadio、勾选状态、内容变更回调
            // 交互：输入/提交回调
            Radio({ value: 'RadioCover', group: 'radioGroup' }).id('image_fit_full_sample_radio_12')
              .fancyRadio()
              .checked(false)
              .onChange((isChecked: boolean) => {
                this.imageFit = ImageFit.Cover;
              });
          }.id('image_fit_full_sample_column_10');
        }.id('image_fit_full_sample_grid_item_9');
        // GridItem：网格项
        GridItem() {
          // Column：垂直布局容器
          Column() {
            // Text：文本
            Text('Auto').id('image_fit_full_sample_text_15')
            // Radio：单选框
            // 关键属性：fancyRadio、勾选状态、内容变更回调
            // 交互：输入/提交回调
            Radio({ value: 'RadioAuto', group: 'radioGroup' }).id('image_fit_full_sample_radio_16')
              .fancyRadio()
              .checked(false)
              .onChange((isChecked: boolean) => {
                this.imageFit = ImageFit.Auto;
              });
          }.id('image_fit_full_sample_column_14');
        }.id('image_fit_full_sample_grid_item_13');
        // GridItem：网格项
        GridItem() {
          // Column：垂直布局容器
          Column() {
            // Text：文本
            Text('Fill').id('image_fit_full_sample_text_19')
            // Radio：单选框
            // 关键属性：fancyRadio、勾选状态、内容变更回调
            // 交互：输入/提交回调
            Radio({ value: 'RadioFill', group: 'radioGroup' }).id('image_fit_full_sample_radio_20')
              .fancyRadio()
              .checked(false)
              .onChange((isChecked: boolean) => {
                this.imageFit = ImageFit.Fill;
              });
          }.id('image_fit_full_sample_column_18');
        }.id('image_fit_full_sample_grid_item_17');
        // GridItem：网格项
        GridItem() {
          // Column：垂直布局容器
          Column() {
            // Text：文本
            Text('ScaleDown').id('image_fit_full_sample_text_23')
            // Radio：单选框
            // 关键属性：fancyRadio、勾选状态、内容变更回调
            // 交互：输入/提交回调
            Radio({ value: 'RadioScaleDown', group: 'radioGroup' }).id('image_fit_full_sample_radio_24')
              .fancyRadio()
              .checked(false)
              .onChange((isChecked: boolean) => {
                this.imageFit = ImageFit.ScaleDown;
              });
          }.id('image_fit_full_sample_column_22');
        }.id('image_fit_full_sample_grid_item_21');
        // GridItem：网格项
        GridItem() {
          // Column：垂直布局容器
          Column() {
            // Text：文本
            Text('None').id('image_fit_full_sample_text_27')
            // Radio：单选框
            // 关键属性：fancyRadio、勾选状态、内容变更回调
            // 交互：输入/提交回调
            Radio({ value: 'RadioNone', group: 'radioGroup' }).id('image_fit_full_sample_radio_28')
              .fancyRadio()
              .checked(true)
              .onChange((isChecked: boolean) => {
                this.imageFit = ImageFit.None;
              });
          }.id('image_fit_full_sample_column_26');
        }.id('image_fit_full_sample_grid_item_25');
      }.id('image_fit_full_sample_grid_4')
      .columnsTemplate('1fr 1fr 1fr')
      .width('70%');
    }.id('image_fit_full_sample_column_1')
    .padding({top:24, bottom: 12});

  }
}