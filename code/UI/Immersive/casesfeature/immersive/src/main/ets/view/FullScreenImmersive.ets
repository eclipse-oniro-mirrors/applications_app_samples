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
 * @file casesfeature/immersive/src/main/ets/view/FullScreenImmersive.ets
 * 文件职责：FullScreenImmersive 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：FullScreenImmersive。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { window } from '@kit.ArkUI';
import { Constants } from '../common/Constants';

/**
 * 窗口全屏布局方案示例
 * 1、设置窗口强制全屏布局
 * 2、获取状态栏和导航条的高度手动进行避让
 */
/**
 * FullScreenImmersive：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct FullScreenImmersive {
  // @State topHeight：组件内部状态
  @State topHeight: number = 0;

  // @State bottomHeight：组件内部状态
  @State bottomHeight: number = 0;
  windowClass?: window.Window;

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear(): void {
    console.info(`Immersive about to appear`);
    window.getLastWindow(getContext(), (err, windowClass) => {
      console.info(`Immersive get last window succeed`);
      this.windowClass = windowClass;
      // 设置窗口强制全屏布局
      windowClass.setWindowLayoutFullScreen(true);
      // 获取导航条高度
      this.bottomHeight =
        windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR).bottomRect.height;
      // 获取状态栏高度
      this.topHeight = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).topRect.height;
      console.info(`Immersive get avoid height succeed, bottomHeight is ${this.bottomHeight}, topHeight is ${this.topHeight}`);
    })
  }

  /**
   * aboutToDisappear：组件即将销毁时回调，用于释放资源与取消订阅。
   */
  aboutToDisappear() {
    // 销毁前把布局设回去，防止影响其他页面
    if (this.windowClass) {
      this.windowClass.setWindowLayoutFullScreen(false);
    }
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // Text：文本
      // 关键属性：文本对齐、宽度、字号、字体颜色、高度
      // Text：文本
      // 关键属性：文本对齐、宽度、字号、字体颜色、高度
      Text($r('app.string.full_screen_immersive_adaption')).id('full_screen_immersive_text_2')
        .textAlign(TextAlign.Center)
        .width('100%')
        .fontSize($r('app.integer.integer_40'))
        .fontColor(Color.Black)
        .height('10%')
      // Column：垂直布局容器
      // 关键属性：宽度
      // Column：垂直布局容器
      // 关键属性：宽度
      Column() {
        // Text：文本
        // 关键属性：宽度、高度、字号、文本对齐、圆角、背景色
        // Text：文本
        // 关键属性：宽度、高度、字号、文本对齐、圆角、背景色
        Text('row1').id('full_screen_immersive_text_4')
          .width('100%')
          .height($r('app.integer.integer_100'))
          .fontSize(Constants.NUMBER_16)
          .textAlign(TextAlign.Center)
          .borderRadius(Constants.NUMBER_10)
          .backgroundColor(Color.White)

        // Divider：分割线
        // 关键属性：strokeWidth、color、宽度、内边距、外边距
        // Divider：分割线
        // 关键属性：strokeWidth、color、宽度、内边距、外边距
        Divider().id('full_screen_immersive_divider_5')
          .strokeWidth(Constants.NUMBER_2)
          .color(Color.White)
          .width('100%')
          .padding({ left: Constants.NUMBER_20, right: Constants.NUMBER_20 })
          .margin({ top: Constants.NUMBER_20, bottom: Constants.NUMBER_20 })

        // Text：文本
        // 关键属性：宽度、高度、字号、文本对齐、圆角、背景色
        // Text：文本
        // 关键属性：宽度、高度、字号、文本对齐、圆角、背景色
        Text('row2').id('full_screen_immersive_text_6')
          .width('100%')
          .height($r('app.integer.integer_100'))
          .fontSize(Constants.NUMBER_16)
          .textAlign(TextAlign.Center)
          .borderRadius(Constants.NUMBER_10)
          .backgroundColor(Color.White)
        // Divider：分割线
        // 关键属性：strokeWidth、color、宽度、内边距、外边距
        // Divider：分割线
        // 关键属性：strokeWidth、color、宽度、内边距、外边距
        Divider().id('full_screen_immersive_divider_7')
          .strokeWidth(Constants.NUMBER_2)
          .color(Color.White)
          .width('100%')
          .padding({ left: Constants.NUMBER_20, right: Constants.NUMBER_20 })
          .margin({ top: Constants.NUMBER_20, bottom: Constants.NUMBER_20 })

        // Text：文本
        // 关键属性：宽度、高度、字号、文本对齐、圆角、背景色
        // Text：文本
        // 关键属性：宽度、高度、字号、文本对齐、圆角、背景色
        Text('row3').id('full_screen_immersive_text_8')
          .width('100%')
          .height($r('app.integer.integer_100'))
          .fontSize(Constants.NUMBER_16)
          .textAlign(TextAlign.Center)
          .borderRadius(Constants.NUMBER_10)
          .backgroundColor(Color.White)

        // Divider：分割线
        // 关键属性：strokeWidth、color、宽度、内边距、外边距
        // Divider：分割线
        // 关键属性：strokeWidth、color、宽度、内边距、外边距
        Divider().id('full_screen_immersive_divider_9')
          .strokeWidth(Constants.NUMBER_2)
          .color(Color.White)
          .width('100%')
          .padding({ left: Constants.NUMBER_20, right: Constants.NUMBER_20 })
          .margin({ top: Constants.NUMBER_20, bottom: Constants.NUMBER_20 })

        // Text：文本
        // 关键属性：宽度、高度、字号、文本对齐、圆角、背景色
        // Text：文本
        // 关键属性：宽度、高度、字号、文本对齐、圆角、背景色
        Text('row4').id('full_screen_immersive_text_10')
          .width('100%')
          .height($r('app.integer.integer_100'))
          .fontSize(Constants.NUMBER_16)
          .textAlign(TextAlign.Center)
          .borderRadius(Constants.NUMBER_10)
          .backgroundColor(Color.White)

        // Divider：分割线
        // 关键属性：strokeWidth、color、宽度、内边距、外边距
        // Divider：分割线
        // 关键属性：strokeWidth、color、宽度、内边距、外边距
        Divider().id('full_screen_immersive_divider_11')
          .strokeWidth(Constants.NUMBER_2)
          .color(Color.White)
          .width('100%')
          .padding({ left: Constants.NUMBER_20, right: Constants.NUMBER_20 })
          .margin({ top: Constants.NUMBER_20, bottom: Constants.NUMBER_20 })
        // Text：文本
        // 关键属性：宽度、高度、字号、文本对齐、圆角、背景色
        // Text：文本
        // 关键属性：宽度、高度、字号、文本对齐、圆角、背景色
        Text('row5').id('full_screen_immersive_text_12')
          .width('100%')
          .height($r('app.integer.integer_100'))
          .fontSize(Constants.NUMBER_16)
          .textAlign(TextAlign.Center)
          .borderRadius(Constants.NUMBER_10)
          .backgroundColor(Color.White)
      }.id('full_screen_immersive_column_3')
      .width('90%')
    }.id('full_screen_immersive_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.immersive_background_color'))
    // 设置padding避让状态栏及导航条
    .padding({ top: px2vp(this.topHeight), bottom: px2vp(this.bottomHeight) })
  }
}