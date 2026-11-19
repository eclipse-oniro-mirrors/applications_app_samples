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
 * @file entry/src/main/ets/pages/components/buttonAndSelection/selectSample/SelectSample.ets
 * 文件职责：SelectSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：SelectSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import ShowToast from '../../../../util/ShowToast'
import { TitleBar } from '../../../../common/TitleBar'

/**
 * SelectSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct SelectSample {
  // @State selectIndex：组件内部状态
  @State selectIndex: number = 0;
  private context: Context = getContext(this);
  private indexTitle: string = this.context.resourceManager.getStringSync($r('app.string.select_index').id);
  private valueTitle: string = this.context.resourceManager.getStringSync($r('app.string.select_value').id);
  private selectIcon: ResourceStr[] = [
  $r('app.media.ic_select_option_picture'),
  $r('app.media.ic_select_option_collection'),
  $r('app.media.ic_select_option_gesture')];
  private cityNames: SelectOption[] = [{ value: $r('app.string.radio_beijing') }, {
    value: $r('app.string.radio_shanghai')
  }, { value: $r('app.string.radio_shenzhen') }];

  // @State onSelectId：组件内部状态
  @State onSelectId: string = '';

  @Styles itemBorder() {
    .height(60)
    .width('100%')
    .borderRadius(24)
    .backgroundColor(Color.White)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.select_title') }).id(this.onSelectId)
      // Scroll：滚动容器
      // 关键属性：高度、内边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：交叉轴对齐、尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.select_has_icon') }).id('select_sample_introduction_title_4')
          // Row：水平布局容器
          // 关键属性：itemBorder、主轴对齐
          Row() {
            // Image：图片
            // 关键属性：尺寸
            Image(this.selectIcon[this.selectIndex]).id('select_sample_image_6')
              .size({ width: 24, height: 24 })
            // Select：下拉选择器
            // 关键属性：font、选中状态、onSelect、longToast
            Select([{ value: $r('app.string.select_picture'), icon: $r('app.media.ic_select_option_picture') },
              { value: $r('app.string.select_collection'), icon: $r('app.media.ic_select_option_collection') },
              { value: $r('app.string.select_gesture'), icon: $r('app.media.ic_select_option_gesture') }])
              .font({ size: 20, weight: FontWeight.Normal })
              .selected(this.selectIndex)
              .onSelect((index: number, value: string) => {
                ShowToast.longToast(`${this.indexTitle}${index} ${this.valueTitle}${value}`)
                this.selectIndex = index
                this.onSelectId = 'onSelectId' + index
              }).id('select0')
          }.id('select_sample_row_5')
          .itemBorder()
          .justifyContent(FlexAlign.Center)

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.select_option_bg_and_text_style') })
            .id('select_sample_introduction_title_7')
          // Column：垂直布局容器
          // 关键属性：itemBorder、主轴对齐
          Column() {
            // Select：下拉选择器
            // 关键属性：选中状态、font、selectedOptionBgColor、selectedOptionFontColor、selectedOptionFont、onSelect
            Select(this.cityNames)
              .selected(1)
              .font({ size: 20, weight: FontWeight.Normal })
              .selectedOptionBgColor($r('app.color.select_option_bg_color'))
              .selectedOptionFontColor($r('app.color.select_option_font_color'))
              .selectedOptionFont({ size: 25, weight: FontWeight.Medium })
              .onSelect((index: number, value: string) => {
                ShowToast.longToast(`${this.indexTitle}${index} ${this.valueTitle}${value}`)
                this.onSelectId = 'onSelectId' + index
              })
              .id('select1')
          }.id('select_sample_column_8')
          .itemBorder()
          .justifyContent(FlexAlign.Center)

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.select_unselect_option_style') })
            .id('select_sample_introduction_title_9')
          // Column：垂直布局容器
          // 关键属性：itemBorder、主轴对齐
          Column() {
            // Select：下拉选择器
            // 关键属性：选中状态、font、optionBgColor、optionFontColor、optionFont、onSelect
            Select(this.cityNames)
              .selected(0)
              .font({ size: 20, weight: FontWeight.Normal })
              .optionBgColor($r('app.color.select_option_bg_color'))
              .optionFontColor(Color.White)
              .optionFont({ size: 25, weight: FontWeight.Normal })
              .onSelect((index: number, value: string) => {
                ShowToast.longToast(`${this.indexTitle}${index} ${this.valueTitle}${value}`)
                this.onSelectId = 'onSelectId' + index
              })
              .id('select2')
          }.id('select_sample_column_10')
          .itemBorder()
          .justifyContent(FlexAlign.Center)

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.select_button_style') })
            .id('select_sample_introduction_title_11')
          // Column：垂直布局容器
          // 关键属性：itemBorder、主轴对齐
          Column() {
            // Select：下拉选择器
            // 关键属性：选中状态、font、字体颜色、onSelect、longToast
            Select(this.cityNames)
              .selected(2)
              .font({ size: 20, weight: FontWeight.Normal })
              .fontColor(Color.Black)
              .onSelect((index: number, value: string) => {
                ShowToast.longToast(`${this.indexTitle}${index} ${this.valueTitle}${value}`)
                this.onSelectId = 'onSelectId' + index
              })
              .id('select3')
          }.id('select_sample_column_12')
          .itemBorder()
          .justifyContent(FlexAlign.Center)
        }.id('select_sample_column_3')
        .alignItems(HorizontalAlign.Start)
        .constraintSize({ minHeight: '100%' }) // Let the minHeight of the component cover screen
      }.id('select_sample_scroll_2')
      .height('100%')
      .padding({ left: 12, right: 12 })
    }.id('select_sample_column_1')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}