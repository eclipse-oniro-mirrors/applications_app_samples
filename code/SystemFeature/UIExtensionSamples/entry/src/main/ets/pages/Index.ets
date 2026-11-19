/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file entry/src/main/ets/pages/Index.ets
 * 文件职责：Index 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Index。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import router from '@ohos.router';

/**
 * Index：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Index {
  private fileName: string[] = [
    'AbilityStartCallback',
    'UIExtensionContext',
    'UIExtensionContentSession'
  ]

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色
    Column() {
      // Row：水平布局容器
      // 关键属性：宽度、高度、主轴对齐、背景色、外边距
      Row() {
        // Flex：弹性布局容器
        Flex({ justifyContent: FlexAlign.Start, alignContent: FlexAlign.Center }) {
          // Text：文本
          // 关键属性：字号、字重、文本对齐、外边距
          Text($r('app.string.main_title')).id('index_text_4')
            .fontSize(30)
            .fontWeight(700)
            .textAlign(TextAlign.Start)
            .margin({
              top: 8,
              bottom: 8,
              left: 12
            })
        }.id('index_flex_3')
      }.id('index_row_2')
      .width('100%')
      .height('7.18%')
      .justifyContent(FlexAlign.Start)
      .backgroundColor($r('app.color.backGrounding'))
      .margin({
        top: '7.18%',
        bottom: '6.41%',
        left: '3.33%'
      })

      // List：列表容器
      // 关键属性：高度、背景色
      List({ initialIndex: 0 }) {
        ForEach(this.fileName, (item: string, index: number) => {
          // ListItem：列表项
          // 关键属性：高度、背景色、圆角、外边距
          ListItem() {
            // Flex：弹性布局容器
            // 关键属性：点击事件回调、pushUrl
            // 交互：可点击交互
            Flex({ justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.Center }) {
              // Text：文本
              // 关键属性：文本对齐、字重、外边距
              Text($r(`app.string.${item}`)).id('index_text_7')
                .textAlign(TextAlign.Start)
                .fontWeight(500)
                .margin({
                  top: 17,
                  bottom: 17,
                  left: 12
                })
                .fontSize(16)
                .width('77.87%')
                .height('39.29%')
                .fontColor($r('app.color.text_color'))

              // Row：水平布局容器
              Row() {
                // Image：图片
                // 关键属性：宽度、高度、外边距
                Image($r('app.media.ic_arrow')).id('index_image_9')
                  .width(24)
                  .height(24)
                  .margin({ top: 16, bottom: 16, right: 6 })
              }.id('index_row_8')
            }
            .id(item)
            .onClick(() => {
              router.pushUrl({
                url: `uiextensionpages/${item}`
              });
            })
          }.id('index_list_item_6')
          .height('8.45%')
          .backgroundColor($r('app.color.start_window_background'))
          .borderRadius(24)
          .margin({ top: 12, right: 12, left: 12 })
        }, (item: string, index: number) => item)
      }.id('index_list_5')
      .height('85%')
      .backgroundColor($r('app.color.backGrounding'))
    }.id('index_column_1')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.backGrounding'))
  }
}