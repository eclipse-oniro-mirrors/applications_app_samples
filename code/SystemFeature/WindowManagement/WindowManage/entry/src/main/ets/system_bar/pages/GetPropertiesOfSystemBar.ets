/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/system_bar/pages/GetPropertiesOfSystemBar.ets
 * 文件职责：GetPropertiesOfSystemBar 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：GetPropertiesOfSystemBar、standardButton。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { window } from '@kit.ArkUI';

/**
 * GetPropertiesOfSystemBar：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct GetPropertiesOfSystemBar {
  // @State colorText：组件内部状态
  @State colorText: string = '';

  /**
   * onPageShow：页面进入前台时回调。
   */
  onPageShow() {
    this.colorText = '';
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：主轴对齐、交叉轴对齐、宽度、高度、背景色
    Column() {
      // Text：文本
      // 关键属性：宽度、高度、外边距、字号
      Text(this.colorText)
        .id("propertiesText")
        .width('80%')
        .height('50%')
        .margin('10vp')
        .fontSize(20)
      // Button：按钮
      // 关键属性：字号、standardButton、点击事件回调、showPropertiesOfSystemBar
      // 交互：可点击交互
      Button($r("app.string.GetPropertiesOfSystemBar"))
        .fontSize(20)
        .standardButton(15, '80%')
        .id('getPropsButton')
        .onClick(() => this.showPropertiesOfSystemBar());
    }.id('get_properties_of_system_bar_column_1')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.light_gray'))
  }

  /**
   * showPropertiesOfSystemBar：执行 showPropertiesOfSystemBar 相关逻辑。
   */
  async showPropertiesOfSystemBar() {
    const parentWindow: window.Window = await window.getLastWindow(getContext(this));
    const windowSystemBarProperties: window.SystemBarProperties = parentWindow.getWindowSystemBarProperties();
    this.colorText = JSON.stringify(windowSystemBarProperties, null, 4);
  }
}

/**
 * standardButton：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Button)
function standardButton(fontSize: number, width: Length) {
  .fontSize(fontSize)
  .fontColor($r('app.color.dark_gray'))
  .backgroundColor($r('app.color.white'))
  .padding(15)
  .margin({ top: 20 })
  .width(width)
}