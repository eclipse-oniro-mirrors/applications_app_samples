/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file entry/src/main/ets/pages/universal/properties/restoreIdSample/RestoreIdSample.ets
 * 文件职责：RestoreIdSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：RestoreIdExample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { getStringData } from '../../../../data/ResourceDataHandle';
import Logger from '../../../../util/Logger';

@Extend(Button) function commonButtonStyle() {
  .margin(8)
  .fontSize(16)
  .width('100%')
  .margin({ left: 24, right: 24, top: 12 })
}

@Extend(Column) function cardStyle() {
  .backgroundColor(Color.White)
  .borderRadius(24)
  .width('100%')
  .padding(15)
  .margin({ left: 12, right: 12, bottom: 12 })
}

/**
 * RestoreIdExample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct RestoreIdExample {
  // @State outSetValueTwo：组件内部状态
  @State outSetValueTwo: number = 40
  // @State fontColor：组件内部状态
  @State fontColor: string = '#182431'
  // @State selectedFontColor：组件内部状态
  @State selectedFontColor: string = '#007DFF'
  // @State currentIndex：组件内部状态
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()
  private apple: string = getStringData($r('app.string.text_picker_text_apple'));
  private orange: string = getStringData($r('app.string.text_picker_text_orange'));
  private peach: string = getStringData($r('app.string.text_picker_text_peach'));
  private grape: string = getStringData($r('app.string.text_picker_text_grape'));
  private banana: string = getStringData($r('app.string.text_picker_text_banana'));
  private fruits: string[] = [this.apple, this.orange, this.peach, this.grape, this.banana];

  @Builder TabBuilder(index: number, name: string) {
    // Column：垂直布局容器
    // 关键属性：宽度
    Column() {
      // Text：文本
      // 关键属性：字体颜色、字号、字重、行高、外边距
      Text(name).id('restore_id_sample_text_2')
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 })
      // Divider：分割线
      // 关键属性：strokeWidth、color、透明度、宽度
      Divider().id('restore_id_sample_divider_3')
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
    }.id('restore_id_sample_column_1').width('100%')
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {

    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.restore_id') }).id('restore_id_sample_title_bar_5')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：内边距、尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.list') }).id('restore_id_sample_introduction_title_8')
          // Column：垂直布局容器
          // 关键属性：cardStyle
          Column() {
            // List：列表容器
            // 关键属性：alignListItem、宽度、restoreId、cardStyle
            List({ space: 8 }) {
              ForEach(this.fruits, (item: string) => {
                // ListItem：列表项
                ListItem() {
                  // Button：按钮
                  // 关键属性：commonButtonStyle
                  Button(item).id('restore_id_sample_button_12')
                    .commonButtonStyle()
                }.id('restore_id_sample_list_item_11')
              }, (item: string) => item)
            }.id('restore_id_sample_list_10')
            .alignListItem(ListItemAlign.Center)
            .width('100%')
            .restoreId(1)
          }.id('restore_id_sample_column_9').cardStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.checkbox') }).id('restore_id_sample_introduction_title_13')
          // Column：垂直布局容器
          // 关键属性：cardStyle
          Column() {
            // Checkbox：复选框
            // 关键属性：select、selectedColor、restoreId、cardStyle
            Checkbox().id('restore_id_sample_checkbox_15')
              .select(true)
              .selectedColor(0xed6f21)
              .restoreId(2)
          }.id('restore_id_sample_column_14').cardStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.radio_title') })
            .id('restore_id_sample_introduction_title_16')
          // Column：垂直布局容器
          // 关键属性：cardStyle
          Column() {
            // Radio：单选框
            // 关键属性：勾选状态、restoreId、cardStyle
            Radio({ value: 'Radio1', group: 'radioGroup' }).id('restore_id_sample_radio_18')
              .checked(true)
              .restoreId(3)
          }.id('restore_id_sample_column_17').cardStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.toggle_title') })
            .id('restore_id_sample_introduction_title_19')
          // Column：垂直布局容器
          // 关键属性：cardStyle
          Column() {
            // Toggle：开关
            // 关键属性：selectedColor、switchPointColor、restoreId、cardStyle
            Toggle({ type: ToggleType.Switch, isOn: false }).id('restore_id_sample_toggle_21')
              .selectedColor('#007DFF')
              .switchPointColor('#FFFFFF')
              .restoreId(4)
          }.id('restore_id_sample_column_20').cardStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.swiper_name') })
            .id('restore_id_sample_introduction_title_22')
          // Column：垂直布局容器
          // 关键属性：cardStyle
          Column() {
            // Swiper：轮播容器
            // 关键属性：缓存数量、index、是否自动播放、切换间隔、指示器、是否循环
            Swiper() {
              ForEach(['1', '2', '3'], (item: string) => {
                // Text：文本
                // 关键属性：宽度、高度、背景色、文本对齐、字号
                Text(item).id('restore_id_sample_text_25')
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: string) => item)
            }.id('restore_id_sample_swiper_24')
            .cachedCount(2)
            .index(1)
            .autoPlay(true)
            .interval(4000)
            .indicator(true)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .curve(Curve.Linear)
            .restoreId(5)
          }.id('restore_id_sample_column_23').cardStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.tabs_name') }).id('restore_id_sample_introduction_title_26')
          // Column：垂直布局容器
          // 关键属性：cardStyle
          Column() {
            // Tabs：页签容器
            // 关键属性：是否纵向、barMode、barWidth、barHeight、animationDuration、内容变更回调
            // 交互：输入/提交回调
            Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
              // TabContent：页签内容
              // 关键属性：tabBar、TabBuilder
              TabContent() {
                // Column：垂直布局容器
                // 关键属性：宽度、高度、背景色、tabBar、TabBuilder
                Column().id('restore_id_sample_column_30').width('100%').height('100%').backgroundColor('#00CB87')
              }.id('restore_id_sample_tab_content_29').tabBar(this.TabBuilder(0, 'green'))

              // TabContent：页签内容
              // 关键属性：tabBar、TabBuilder
              TabContent() {
                // Column：垂直布局容器
                // 关键属性：宽度、高度、背景色、tabBar、TabBuilder
                Column().id('restore_id_sample_column_32').width('100%').height('100%').backgroundColor('#007DFF')
              }.id('restore_id_sample_tab_content_31').tabBar(this.TabBuilder(1, 'blue'))

              // TabContent：页签内容
              // 关键属性：tabBar、TabBuilder
              TabContent() {
                // Column：垂直布局容器
                // 关键属性：宽度、高度、背景色、tabBar、TabBuilder
                Column().id('restore_id_sample_column_34').width('100%').height('100%').backgroundColor('#FFBF00')
              }.id('restore_id_sample_tab_content_33').tabBar(this.TabBuilder(2, 'yellow'))

              // TabContent：页签内容
              // 关键属性：tabBar、TabBuilder
              TabContent() {
                // Column：垂直布局容器
                // 关键属性：宽度、高度、背景色、tabBar、TabBuilder
                Column().id('restore_id_sample_column_36').width('100%').height('100%').backgroundColor('#E67C92')
              }.id('restore_id_sample_tab_content_35').tabBar(this.TabBuilder(3, 'pink'))
            }.id('restore_id_sample_tabs_28')
            .vertical(false)
            .barMode(BarMode.Fixed)
            .barWidth(360)
            .barHeight(56)
            .animationDuration(400)
            .onChange((index: number) => {
              this.currentIndex = index
            })
            .width(360)
            .height(296)
            .margin({ top: 52 })
            .backgroundColor('#F1F3F5')
            .restoreId(6)
          }.id('restore_id_sample_column_27').cardStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.tabs_name') }).id('restore_id_sample_introduction_title_37')
          // Column：垂直布局容器
          // 关键属性：cardStyle
          Column() {
            // Slider：滑块
            // 关键属性：showSteps、内容变更回调
            // 交互：输入/提交回调
            Slider({
              value: this.outSetValueTwo,
              step: 10,
              style: SliderStyle.OutSet
            }).id('restore_id_sample_slider_39')
              .showSteps(true)
              .onChange((value: number, mode: SliderChangeMode) => {
                this.outSetValueTwo = value
                Logger.info('value:' + value + 'mode:' + mode.toString())
              })
              .restoreId(7)
            // Text：文本
            // 关键属性：字号、cardStyle
            Text(this.outSetValueTwo.toFixed(0)).id('restore_id_sample_text_40').fontSize(12)
          }.id('restore_id_sample_column_38').cardStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.select_name') })
            .id('restore_id_sample_introduction_title_41')
          // Column：垂直布局容器
          // 关键属性：cardStyle、外边距
          Column() {
            // Select：下拉选择器
            // 关键属性：选中状态、当前值、font、字体颜色、selectedOptionFont、optionFont
            Select([{ value: 'aaa', icon: $r('app.media.ic_select_global') },
              { value: 'bbb', icon: $r('app.media.ic_select_global') },
              { value: 'ccc', icon: $r('app.media.ic_select_global') },
              { value: 'ddd', icon: $r('app.media.ic_select_global') }]).id('restore_id_sample_select_43')
              .selected(2)
              .value('TTTTT')
              .font({ size: 16, weight: 500 })
              .fontColor('#182431')
              .selectedOptionFont({ size: 16, weight: 400 })
              .optionFont({ size: 16, weight: 400 })
              .onSelect((index: number) => {
                Logger.info('Select:' + index)
              })
              .restoreId(8)
          }.id('restore_id_sample_column_42').cardStyle().margin({ bottom: 80 })
        }.id('restore_id_sample_column_7')
        .padding(12)
        .constraintSize({ minHeight: '100%' })
      }.id('restore_id_sample_scroll_6')
    }.id('restore_id_sample_column_4')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}