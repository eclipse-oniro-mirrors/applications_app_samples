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
 * @file entry/src/main/ets/pages/components/listAndGrid/listItemSample/ListItemSample.ets
 * 文件职责：ListItemSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：backgroundStyle、listItemTextStyle、RowSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonSwitcher } from '../../../../common/AttributeModificationTool';
import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';

/**
 * backgroundStyle：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Column)
function backgroundStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(16)
  .backgroundColor(Color.White)
  .justifyContent(FlexAlign.SpaceAround)
}

/**
 * listItemTextStyle：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Text)
function listItemTextStyle() {
  .fontSize(15)
  .borderRadius(16)
  .textAlign(TextAlign.Center)
  .backgroundColor($r('app.color.background_grey'))
}

/**
 * RowSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct RowSample {
  // @State numberArray：组件内部状态
  @State numberArray: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  // @State selectable：组件内部状态
  @State selectable: boolean = false;

  // @State output：组件内部状态
  @State output: string = '';

  /**
   * swipeAction：执行 swipeAction 相关逻辑。
   */
  @Builder
  swipeAction(index: number) {
    // Flex：弹性布局容器
    // 关键属性：宽度
    Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceAround }) {
      // Button：按钮
      // 关键属性：点击事件回调、splice
      // 交互：可点击交互
      Button($r('app.string.list_item_delete')).id('list_item_sample_button_2')
        .onClick(() => {
          this.numberArray.splice(index, 1);
        })
    }.id('list_item_sample_flex_1')
    .width('30%')
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Flex：弹性布局容器
    // 关键属性：内边距、高度、宽度、背景色
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start }) {
      // TitleBar：TitleBar 自定义组件
      // 关键属性：剩余空间放大
      TitleBar({ title: $r('app.string.list_item_title') }).id('list_item_sample_title_bar_4')
        .flexGrow(0)
      // IntroductionTitle：IntroductionTitle 自定义组件
      IntroductionTitle({ introduction: $r('app.string.list_introduction_delete') })
        .id('list_item_sample_introduction_title_5')
      // component
      // Column：垂直布局容器
      // 关键属性：内边距、backgroundStyle、高度、宽度、剩余空间放大
      Column() {

        // List：列表容器
        // 关键属性：alignListItem、高度、宽度、multiSelectable
        List({ space: 10 }) {
          ForEach(this.numberArray, (item: number, index: number) => {
            // ListItem：列表项
            // 关键属性：selectable、onSelect
            ListItem() {
              // Text：文本
              // 关键属性：listItemTextStyle、高度、宽度
              Text(item + ``).id('list_item_sample_text_9')
                .listItemTextStyle()
                .height('20%')
                .width('80%')
            }.id('list_item_sample_list_item_8')
            .selectable(this.selectable)
            .onSelect((b) => {
              this.output = b === true ? `进入鼠标框选范围` : `移除鼠标框选范围`;
            })
            .swipeAction({
              end: this.swipeAction(index)
            })
          })
        }.id('list_item_sample_list_7')
        .alignListItem(ListItemAlign.Center)
        .height('100%')
        .width('100%')
        .multiSelectable(true)
      }.id('list_item_sample_column_6')
      .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
      .backgroundStyle()
      .height(200)
      .width('100%')
      .flexGrow(0)

      // 状态栏
      // IntroductionTitle：IntroductionTitle 自定义组件
      IntroductionTitle({ introduction: $r('app.string.list_item_introduction_drag') })
        .id('list_item_sample_introduction_title_10')
      // Column：垂直布局容器
      // 关键属性：backgroundStyle、高度、宽度、交叉轴对齐、主轴对齐、外边距
      Column() {
        // Text：文本
        // 关键属性：宽度、文本对齐
        Text(this.output).id('list_item_sample_text_12')
          .width('100%')
          .textAlign(TextAlign.Center)
      }.id('list_item_sample_column_11')
      .backgroundStyle()
      .height(100)
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .margin({ bottom: 16 })
      .flexGrow(0)

      // Scroll：滚动容器
      // 关键属性：自身对齐、剩余空间放大、基准尺寸、外边距
      Scroll() {
        // 控制面板
        // Column：垂直布局容器
        // 关键属性：主轴对齐、高度、宽度
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.list_item_introduction_properties') })
            .id('list_item_sample_introduction_title_15')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // CommonSwitcher：CommonSwitcher 自定义组件
            CommonSwitcher({
              name: $r('app.string.list_item_properties_selectable'),
              bool: $selectable,
              testID: `listitem_001`
            }).id('list_item_sample_common_switcher_17')
          }.id('list_item_sample_column_16')
          .backgroundStyle()
        }.id('list_item_sample_column_14')
        .justifyContent(FlexAlign.Start)
        .height('100%')
        .width('100%')
      }.id('list_item_sample_scroll_13')
      .alignSelf(ItemAlign.Start)
      .flexGrow(1)
      .flexBasis(100)
      .margin({ bottom: 10 })
    }.id('list_item_sample_flex_3')
    .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}