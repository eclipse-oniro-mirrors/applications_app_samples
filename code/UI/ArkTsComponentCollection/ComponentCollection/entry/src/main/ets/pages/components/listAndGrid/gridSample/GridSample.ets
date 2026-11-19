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
 * @file entry/src/main/ets/pages/components/listAndGrid/gridSample/GridSample.ets
 * 文件职责：GridSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：GridSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import { ArgumentsControlPanel } from './GridControlPanel';

@Extend(Column) function backgroundStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(16)
  .backgroundColor(Color.White)
  .justifyContent(FlexAlign.Start)
}

@Extend(Text) function itemStyle() {
  .width('100%')
  .height('100%')
  .textAlign(TextAlign.Center)
  .backgroundColor($r('app.color.background_blue'))
}

/**
 * GridSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct GridSample {
  // @State columnTemplate：组件内部状态
  @State columnTemplate : string = '1fr 1fr 1fr 1fr';

  // @State rowsTemplate：组件内部状态
  @State rowsTemplate : string = '1fr 1fr 1fr 1fr';

  // @State columnsGap：组件内部状态
  @State columnsGap : number = 0;

  // @State rowGap：组件内部状态
  @State rowGap : number = 0;
  private controller: Scroller = new Scroller();
  private itemsText: string[] = [];

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    for (let i = 1; i < 17; i++) {
      this.itemsText.push(i.toString());
    }
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Flex：弹性布局容器
    // 关键属性：内边距、高度、宽度、背景色
    Flex({direction: FlexDirection.Column ,alignItems :ItemAlign.Center, justifyContent: FlexAlign.Start}) {
      // TitleBar：TitleBar 自定义组件
      // 关键属性：剩余空间放大
      TitleBar({ title: $r('app.string.grid_title')}).id('grid_sample_title_bar_2')
        .flexGrow(0)
      // component
      // Column：垂直布局容器
      // 关键属性：内边距、外边距、backgroundStyle、高度、宽度、剩余空间放大
      Column() {
        // Scroll：滚动容器
        Scroll(){
          // Grid：网格容器
          // 关键属性：columnsTemplate、rowsTemplate、列间距、行间距、高度、宽度
          Grid(this.controller) {
            ForEach(this.itemsText, (text: string) => {
              // GridItem：网格项
              // 关键属性：外边距
              GridItem() {
                // Text：文本
                // 关键属性：itemStyle、外边距
                Text(text).id('grid_sample_text_7')
                  .itemStyle()
              }.id('grid_sample_grid_item_6').margin(5)
            })
          }.id('grid_sample_grid_5')
          .columnsTemplate(this.columnTemplate)
          .rowsTemplate(this.rowsTemplate)
          .columnsGap(this.columnsGap)
          .rowsGap(this.rowGap)
          .height('100%')
          .width('100%')
        }.id('grid_sample_scroll_4')
      }.id('grid_sample_column_3')
      .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
      .margin({bottom : 16})
      .backgroundStyle()
      .height(200)
      .width('100%')
      .flexGrow(0)

      // Scroll：滚动容器
      // 关键属性：剩余空间放大、高度、外边距
      Scroll() {
        // 控制面板
        // Column：垂直布局容器
        // 关键属性：主轴对齐、宽度、高度
        Column() {
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column(){
            // ArgumentsControlPanel：ArgumentsControlPanel 自定义组件
            ArgumentsControlPanel(
              {
                columnTemplate :$columnTemplate,
                columnsGap : $columnsGap,
                rowGap: $rowGap,
                rowsTemplate: $rowsTemplate
              }
            ).id('grid_sample_arguments_control_panel_11')
          }.id('grid_sample_column_10')
          .backgroundStyle()
        }.id('grid_sample_column_9')
        .justifyContent(FlexAlign.Start)
        .width('100%')
        .height('100%')
      }.id('grid_sample_scroll_8')
      .flexGrow(1)
      .height(100)
      .margin({ bottom: 10 })
    }.id('grid_sample_flex_1')
    .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}