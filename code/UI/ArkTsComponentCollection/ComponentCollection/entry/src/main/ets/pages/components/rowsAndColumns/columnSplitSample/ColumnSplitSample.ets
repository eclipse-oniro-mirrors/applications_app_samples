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
 * @file entry/src/main/ets/pages/components/rowsAndColumns/columnSplitSample/ColumnSplitSample.ets
 * 文件职责：ColumnSplitSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ColumnSplitSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';

@Extend(Text) function leftTitleStyle() {
  .fontColor($r('app.color.sub_title_color'))
  .fontSize(14)
  .height(22)
  .alignSelf(ItemAlign.Start)
  .margin({ left: 12, top: 12 })
}

@Extend(Column) function backgroundStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(16)
  .backgroundColor(Color.White)
}

/**
 * ColumnSplitSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ColumnSplitSample {
  // @State isDrag：组件内部状态
  @State isDrag: boolean = true;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.columnsplit_title') }).id('column_split_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：内边距、外边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：高度、宽度
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.columnsplit_introduction_drag_divider') })
            .id('column_split_sample_introduction_title_5')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle、宽度、高度
          Column() {
            // ColumnSplit：ColumnSplit 自定义组件
            // 关键属性：resizeable、宽度、高度、backgroundStyle
            ColumnSplit() {
              // Text：文本
              // 关键属性：宽度、高度、背景色
              Text().id('column_split_sample_text_8')
                .width('100%')
                .height(40)
                .backgroundColor($r('app.color.background_orange'))
              // Text：文本
              // 关键属性：宽度、高度、背景色
              Text().id('column_split_sample_text_9')
                .width('100%')
                .height(40)
                .backgroundColor($r('app.color.background_orange'))
              // Text：文本
              // 关键属性：宽度、高度、背景色
              Text().id('column_split_sample_text_10')
                .width('100%')
                .height(40)
                .backgroundColor($r('app.color.background_orange'))
              // Text：文本
              // 关键属性：宽度、高度、背景色
              Text().id('column_split_sample_text_11')
                .width('100%')
                .height(40)
                .backgroundColor($r('app.color.background_orange'))
            }.id('column_split_sample_column_split_7')
            .resizeable(this.isDrag)
            .width('100%')
            .height(300)
          }.id('column_split_sample_column_6').backgroundStyle()
          .width('100%')
          .height(400)

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.columnsplit_introduction_properties') })
            .id('column_split_sample_introduction_title_12')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // Row：水平布局容器
            // 关键属性：宽度
            Row() {
              // Text：文本
              // 关键属性：leftTitleStyle、宽度
              Text($r('app.string.columnsplit_drag')).id('column_split_sample_text_15')
                .leftTitleStyle()
                .width('50%')
              // Blank：占位空白
              Blank().id('column_split_sample_blank_16')
              // Toggle：开关
              // 关键属性：内容变更回调
              // 交互：输入/提交回调
              Toggle({ type: ToggleType.Switch, isOn: this.isDrag })
                .id(`columnsplit_001`)
                .onChange((isOn) => {
                  this.isDrag = isOn;
                })
            }.id('column_split_sample_row_14').width('100%')
          }.id('column_split_sample_column_13')
          .backgroundStyle()
        }.id('column_split_sample_column_4')
        .height('100%')
        .width('100%')
      }.id('column_split_sample_scroll_3')
      .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
      .margin({ bottom: 80 })
    }.id('column_split_sample_column_1')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}
