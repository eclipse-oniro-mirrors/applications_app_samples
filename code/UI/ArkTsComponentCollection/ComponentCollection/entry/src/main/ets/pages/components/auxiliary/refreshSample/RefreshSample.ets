/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/auxiliary/refreshSample/RefreshSample.ets
 * 文件职责：RefreshSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：RefreshSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'

/**
 * RefreshSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct RefreshSample {
  // @State counter：组件内部状态
  @State counter: number = 0
  // @State isRefreshing：组件内部状态
  @State isRefreshing: boolean = false
  private dataArray: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  @Builder refreshBuilder() {
    // Column：垂直布局容器
    // 关键属性：交叉轴对齐、主轴对齐、内边距、圆角
    Column() {
      // Text：文本
      // 关键属性：字号
      Text($r('app.string.auxiliary_refresh_refreshing')).id('refresh_sample_text_2')
        .fontSize(16)
    }.id('refresh_sample_column_1')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .padding(16)
    .borderRadius(12)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色、高度
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.auxiliary_refresh') }).id('refresh_sample_title_bar_4')
      // Column：垂直布局容器
      // 关键属性：内边距、背景色
      Column() {
        // Refresh：下拉刷新容器
        // 关键属性：宽度、onRefreshing
        Refresh({ refreshing: $$this.isRefreshing, builder: this.refreshBuilder }) {
          // Scroll：滚动容器
          // 关键属性：宽度
          Scroll() {
            // Column：垂直布局容器
            // 关键属性：宽度
            Column() {
              ForEach(this.dataArray, (item: number) => {
                // Stack：层叠布局容器
                // 关键属性：宽度、高度、背景色、圆角
                Stack() {
                  // Text：文本
                  // 关键属性：字号、宽度
                  Text((item + this.counter).toString()).id('refresh_sample_text_10')
                    .fontSize(20)
                }.id('refresh_sample_stack_9').width('100%')
                .height(60)
                .backgroundColor($r('app.color.white'))
                .borderRadius(10)

                // Blank：占位空白
                Blank(6).id('refresh_sample_blank_11')
              })
            }.id('refresh_sample_column_8').width('100%')
          }.id('refresh_sample_scroll_7').width('100%')
        }.id('refresh_sample_refresh_6')
        .width('100%')
        .onRefreshing(() => {
          setTimeout(() => {
            this.counter++
            this.isRefreshing = false
          }, 1000)
        })
      }.id('refresh_sample_column_5').padding(12)
    }.id('refresh_sample_column_3').backgroundColor($r('app.color.background_light_gray'))
    .height('100%')
  }
}