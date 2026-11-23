/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/Index.ets
 * 文件职责：Index 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Index、CustomDialogExample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import testNapi from 'libentry.so';

/**
 * Index：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Index {
  // @State message：组件内部状态
  @State message: string = 'Native Notification Sample';

  // @Provide pageInfo：向子孙组件提供的状态
  @Provide('pageInfo') pageInfo: NavPathStack = new NavPathStack();

  // @State result：组件内部状态
  @State result:Boolean = false;

  privacyDialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({ result: $result }),
    autoCancel: false,
    alignment: DialogAlignment.Center,
    customStyle: false,
    backgroundColor: Color.White,
  });

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、主轴对齐
    Column() {
      // Column：垂直布局容器
      // 关键属性：宽度、高度、交叉轴对齐
      Column() {
        // Text：文本
        // 关键属性：字号、字重、文本对齐、外边距
        Text(this.message)
          .fontSize(30)
          .fontWeight(700)
          .textAlign(TextAlign.Start)
          .margin({ top: 56, left:16, right: 16 })
          .id('pageTitle')
      }.id('index_column_1')
      .width('100%')
      .height(px2vp(280))
      .alignItems(HorizontalAlign.Start)

      // Column：垂直布局容器
      // 关键属性：主轴对齐、宽度
      Column() {
        // Row：水平布局容器
        // 关键属性：宽度、外边距
        Row() {
          // Button：按钮
          // 关键属性：布局权重、字号、点击事件回调、isNotificationEnabled
          // 交互：可点击交互
          Button('Check notification enabled')
            .layoutWeight(1)
            .fontSize(18)
            .onClick(() => {
              this.result = testNapi.isNotificationEnabled();
              this.privacyDialogController.open();
            })
            .id('checkButton')
            .margin({ left: 16, right: 16 })
        }.id('index_row_3')
        .width('100%')
        .margin({bottom: 16})
      }.id('index_column_2')
      .justifyContent(FlexAlign.End)
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .id('indexRoot')
  }
}

/**
 * CustomDialogExample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@CustomDialog
struct CustomDialogExample {
  // @Link result：与父组件双向绑定的状态
  @Link result: Boolean;

  controller?: CustomDialogController;
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // Text：文本
      // 关键属性：字号、字重、高度
      Text('Native Notification Sample')
        .fontSize(24)
        .fontWeight(700)
        .height(px2vp(100))
        .id('dialogTitle')
      // Text：文本
      // 关键属性：字号、字重、文本对齐、外边距、宽度
      Text('Current application notification enabled: ' + this.result)
        .fontSize(18)
        .fontWeight(400)
        .textAlign(TextAlign.Start)
        .margin({ left: px2vp(84), right: px2vp(84) })
        .width('90%')
        .id('dialogResult')
      // Button：按钮
      // 关键属性：点击事件回调
      // 交互：可点击交互
      Button('OK', { buttonStyle: ButtonStyleMode.TEXTUAL, role: ButtonRole.NORMAL })
        .onClick(() => {
          if (this.controller != undefined) {
            this.controller.close();
          }
        })
        .stateEffect(false)
        .fontSize(18)
        .fontWeight(500)
        .margin(5)
        .id('dialogOkButton')
    }.id('index_column_4')
  }
}