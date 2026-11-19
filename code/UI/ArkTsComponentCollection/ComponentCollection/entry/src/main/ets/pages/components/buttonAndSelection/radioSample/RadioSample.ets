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
 * @file entry/src/main/ets/pages/components/buttonAndSelection/radioSample/RadioSample.ets
 * 文件职责：RadioSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：RadioSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import ShowToast from '../../../../util/ShowToast';
import { TitleBar } from '../../../../common/TitleBar';

@Extend(Column) function columnStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(24)
  .backgroundColor(Color.White)
}

/**
 * RadioSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct RadioSample {
  // @State radioItemWidth：组件内部状态
  @State radioItemWidth: number = 0;

  // @State responseRegionIndex：组件内部状态
  @State responseRegionIndex: number = 0;

  // @State noResponseRegionIndex：组件内部状态
  @State noResponseRegionIndex: number = 0;
  private context: Context = getContext(this);
  private cityNames: Resource[] = [$r('app.string.radio_beijing'), $r('app.string.radio_shanghai'), $r('app.string.radio_guangzhou'), $r('app.string.radio_shenzhen')];
  private widthValue: number = 20;
  private heightValue: number = 48;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.radio_title') }).id('radio_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：高度、内边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column({ space: 12 }) {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r("app.string.radio_no_response_region") })
            .id('radio_sample_introduction_title_5')
          // Column：垂直布局容器
          // 关键属性：columnStyle、交叉轴对齐
          Column() {
            ForEach(this.cityNames, (item: Resource, index: number) => {
              // Row：水平布局容器
              Row() {
                // Only one option for the same group
                // Radio：单选框
                // 关键属性：勾选状态、内容变更回调
                // 交互：输入/提交回调
                Radio({ value: this.context.resourceManager.getStringSync(item), group: 'noResponse' }).checked(false)
                  .checked(this.noResponseRegionIndex === index)
                  .onChange((isChecked: boolean) => {
                    if (isChecked) {
                      ShowToast.longToast(this.cityNames[index])
                      this.noResponseRegionIndex = index
                    }
                  }).id('city' + String(index))
                // Text：文本
                Text(item).id('radio_sample_text_8')
              }.id('radio_sample_row_7')
            })
          }.id('radio_sample_column_6')
          .columnStyle()
          .alignItems(HorizontalAlign.Start)

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r("app.string.radio_has_response_region") })
            .id('radio_sample_introduction_title_9')
          // Column：垂直布局容器
          // 关键属性：columnStyle、交叉轴对齐、外边距
          Column() {
            ForEach(this.cityNames, (item: Resource, index: number) => {
              // Row：水平布局容器
              // 关键属性：宽度、外边距、背景色、区域变化回调
              Row() {
                // Radio：单选框
                // 关键属性：尺寸、勾选状态、响应区域
                Radio({ value: this.context.resourceManager.getStringSync(item), group: 'responseRegion' })
                  .size({ width: this.widthValue, height: this.heightValue })
                  .checked(this.responseRegionIndex === index)
                  .responseRegion({
                    x: 0,
                    y: 0,
                    width: this.radioItemWidth * (100 / this.widthValue) + '%',
                    height: '100%'
                  })
                  .onChange((isChecked: boolean) => {
                    if (isChecked) {
                      ShowToast.longToast(this.cityNames[index])
                      this.responseRegionIndex = index
                    }
                  })
                  .id('cityHot' + String(index))
                // Text：文本
                // 关键属性：高度
                Text(item).id('radio_sample_text_12')
                  .height(this.heightValue)
              }.id('radio_sample_row_11')
              .width('100%')
              .margin({ bottom: 6 })
              .backgroundColor($r('app.color.radio_response_region_color'))
              .onAreaChange((oldValue: Area, newValue: Area) => {
                // Get radio item width
                this.radioItemWidth = Number.parseInt(newValue.width.toString())
              })
            })
          }.id('radio_sample_column_10')
          .columnStyle()
          .alignItems(HorizontalAlign.Start)
          .margin({ bottom: 70 })
        }.id('radio_sample_column_4')
        .constraintSize({ minHeight: '100%' }) // Let the minHeight of the component cover screen
      }.id('radio_sample_scroll_3')
      .height('100%')
      .padding({ left: 12, right: 12 })
    }.id('radio_sample_column_1')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}