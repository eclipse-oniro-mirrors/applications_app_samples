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
 * @file entry/src/main/ets/pages/components/informationPresentationAndDynamicEffects/listSample/ListSample.ets
 * 文件职责：ListSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ListSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'

@Extend(Text) function leftTitleStyle() {
  .fontColor($r('app.color.font_color_shallow'))
  .fontSize(18)
  .height(22)
  .alignSelf(ItemAlign.Start)
  .margin({ left: 12, bottom: 8 })
}

@Extend(Column) function cardStyle() {
  .backgroundColor(Color.White)
  .borderRadius(24)
  .width('100%')
  .padding(12)
  .margin({ bottom: 12 })
}

/**
 * ListSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ListSample {
  // @State arr：组件内部状态
  @State arr: number[] = [0, 1, 2, 3, 4]

  @Builder itemEnd() {
    // Row：水平布局容器
    // 关键属性：内边距、主轴对齐
    Row() {
      // Button：按钮
      // 关键属性：外边距
      Button('Delete').id('list_sample_button_2').margin('4vp')
      // Button：按钮
      // 关键属性：外边距、内边距、主轴对齐
      Button('Set').id('list_sample_button_3').margin('4vp')
    }.id('list_sample_row_1').padding('4vp').justifyContent(FlexAlign.SpaceEvenly)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.list') }).id('list_sample_title_bar_5')
      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.delete_list_item')).id('list_sample_text_6')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // List：列表容器
        List({ space: 10 }) {
          ForEach(this.arr, (item: number) => {
            // ListItem：列表项
            // 关键属性：转场动画、swipeAction
            ListItem() {
              // Text：文本
              // 关键属性：宽度、高度、字号、文本对齐、圆角、背景色
              Text('item' + item).id('list_sample_text_10')
                .width('100%')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(0xFFFFFF)
            }.id('list_sample_list_item_9')
            .transition({ type: TransitionType.Delete, opacity: 0 })
            .swipeAction({
              end: {
                onAction: () => {
                  animateTo({ duration: 1000 }, () => {
                    let index = this.arr.indexOf(item)
                    this.arr.splice(index, 1)
                  })
                },
                actionAreaDistance: 56,
              }
            })
          }, (item: number) => item.toString())
        }.id('list_sample_list_8')
      }.id('list_sample_column_7')
      .cardStyle()
      .width('100%')
    }.id('list_sample_column_4')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding({ left: 20, right: 20 })
  }
}