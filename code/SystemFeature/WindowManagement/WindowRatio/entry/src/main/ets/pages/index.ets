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
 * @file entry/src/main/ets/pages/index.ets
 * 文件职责：index 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Index。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import window from '@ohos.window';

/**
 * Index：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Index {
  // @State windowRatio：组件内部状态
  @State windowRatio: number = (4 / 3) * 1.0;

  // @State showWindowRatio：组件内部状态
  @State showWindowRatio: string = '4:3';

  // @StorageLink windowWidth：与 AppStorage 双向绑定
  @StorageLink('windowWidth') windowWidth: string = 'unknown';

  // @StorageLink windowHeight：与 AppStorage 双向绑定
  @StorageLink('windowHeight') windowHeight: string = 'unknown';

  // @State numbers：组件内部状态
  @State numbers: number = 0;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：高度
    Row() {
      // Column：垂直布局容器
      // 关键属性：宽度
      Column() {
        // Row：水平布局容器
        // 关键属性：宽度、高度、背景色、圆角
        Row() {
          // Column：垂直布局容器
          // 关键属性：外边距、交叉轴对齐、宽度
          Column() {
            // Row：水平布局容器
            Row() {
              // Text：文本
              // 关键属性：字号、字体颜色
              Text($r('app.string.windowRatios')).id('index_text_6')
                .fontSize('21.5px')
                .fontColor('#a6abb1')
              // Text：文本
              // 关键属性：字号、字体颜色
              Text(this.showWindowRatio)
                .fontSize('21.5px')
                .fontColor('#a6abb1')
                .id('ratioText')
            }.id('index_row_5')
          }.id('index_column_4')
          .margin({ left: '6%' })
          .alignItems(HorizontalAlign.Start)
          .width('64%')

          // Column：垂直布局容器
          Column() {
            // Select：下拉选择器
            // 关键属性：选中状态、当前值、背景色、font、selectedOptionFont、optionFont
            Select([{ value: '4:3' },
              { value: '1:1' },
              { value: '16:9' }])
              .selected(this.numbers)
              .value(this.showWindowRatio)
              .backgroundColor('#e9ebed')
              .font({ size: '22px' })
              .selectedOptionFont({ size: '22px' })
              .optionFont({ size: '21px' })
              .width('30%')
              .height('56px')
              .id('selectRatio')
              .onSelect((index: number) => {
                console.info("Select:" + index);
                this.numbers = index;
                if (index === 0) {
                  this.windowRatio = (4 / 3) * 1.0;
                  this.showWindowRatio = '4:3';
                } else if (index === 1) {
                  this.windowRatio = 1.0;
                  this.showWindowRatio = '1:1';
                } else {
                  this.windowRatio = (16 / 9) * 1.0;
                  this.showWindowRatio = '16:9';
                }
              })
          }.id('index_column_7')
        }.id('index_row_3')
        .width('98%')
        .height('56px')
        .backgroundColor('#e9ebed')
        .borderRadius(15)

        // Row：水平布局容器
        // 关键属性：外边距、宽度、align
        Row() {
          // Text：文本
          // 关键属性：字号、字体颜色、宽度、外边距、文本对齐
          Text($r('app.string.windowWidth')).id('index_text_9')
            .fontSize(20)
            .fontColor(Color.Black)
            .width('50%')
            .margin({ left: '10%' })
            .textAlign(TextAlign.End)
          // Text：文本
          // 关键属性：字号、宽度、字体颜色、外边距
          Text(this.windowWidth)
            .fontSize(20)
            .width('30%')
            .fontColor(Color.Black)
            .margin({ right: '10%' })
            .id('widthText')
        }.id('index_row_8')
        .margin({ top: 5 })
        .width('80%')
        .align(Alignment.Center)

        // Row：水平布局容器
        // 关键属性：外边距、宽度、align
        Row() {
          // Text：文本
          // 关键属性：字号、字体颜色、宽度、外边距、文本对齐
          Text($r('app.string.windowHeight')).id('index_text_11')
            .fontSize(20)
            .fontColor(Color.Black)
            .width('50%')
            .margin({ left: '10%' })
            .textAlign(TextAlign.End)
          // Text：文本
          // 关键属性：字号、宽度、字体颜色、外边距
          Text(this.windowHeight)
            .fontSize(20)
            .width('30%')
            .fontColor(Color.Black)
            .margin({ right: '10%' })
            .id('heightText')
        }.id('index_row_10')
        .margin({ top: 5 })
        .width('80%')
        .align(Alignment.Center)

        // Button：按钮
        // 关键属性：外边距、点击事件回调、info
        // 交互：可点击交互
        Button($r("app.string.set_OK"))
          .id('changeRatio')
          .margin({ top: 5 })
          .onClick(() => {
            console.info('MyApplicationDemo ' + 'get the ratio = ' + this.windowRatio);
            try {
              let windows: window.Window | undefined = AppStorage.get<window.Window>('windows');
              if (windows !== undefined) {
                windows.setAspectRatio(this.windowRatio, (error) => {
                  if (error.code) {
                    console.error('MyApplicationDemo ' + 'Failed to set the aspect ratio of window. Cause:' + JSON.stringify(error));
                    return;
                  }
                  console.info('MyApplicationDemo ' + 'Succeeded in setting the aspect ratio of window.');
                });
              }
            } catch (exception) {
              console.error('MyApplicationDemo ' + 'Failed to set the aspect ratio of window. Cause: ' + JSON.stringify(exception));
            }
          });
      }.id('index_column_2')
      .width('100%')
    }.id('index_row_1')
    .height('100%')
  }
}