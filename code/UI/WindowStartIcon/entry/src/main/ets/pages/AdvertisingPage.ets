/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/AdvertisingPage.ets
 * 文件职责：AdvertisingPage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TransitionsAnimation。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { router, window } from '@kit.ArkUI';

/**
 * TransitionsAnimation：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct TransitionsAnimation {
  // @State pageCountDown：组件内部状态
  @State pageCountDown: number = 6; // 进场动画总用时6s
  private timer: number = 0;

  // 页面显示时打开定时器
  /**
   * onPageShow：页面进入前台时回调。
   */
  onPageShow() {
    this.changeFullScreen(true);
    this.timer = setInterval(() => {
      this.pageCountDown--;
      if (this.pageCountDown === 0) {
        this.changeFullScreen(false);
        clearInterval(this.timer); // 关闭定时器
        router.replaceUrl({ url: 'pages/Index' });
      }
    }, 1000)
  }

  /**
   * 页面显示打开沉浸式，页面销毁关闭
   * @param isFull是否需要打开沉浸式
   */
  changeFullScreen(isFull: boolean) {
    let context = getContext();
    window.getLastWindow(context, (err, window) => {
      window.setWindowLayoutFullScreen(isFull);
    })
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色
    Column() {
      // 跳过按钮和倒计时
      // Row：水平布局容器
      // 关键属性：宽度、外边距、主轴对齐
      Row() {
        // Row：水平布局容器
        // 关键属性：宽度、aspectRatio、背景色、圆角、点击事件回调、changeFullScreen
        // 交互：可点击交互
        Row() {
          // Text：文本
          // 关键属性：字号、文本对齐、字体颜色、外边距
          Text($r('app.string.skip')).id('advertising_page_text_2')
            .fontSize($r('app.integer.advertising_description_skip_font_size'))
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .margin({ left: $r('app.integer.skip_text_margin_left') })
          // Text：文本
          // 关键属性：字号、文本对齐、字体颜色、外边距
          Text(`${this.pageCountDown}`)
            .id('countdownText')
            .fontSize($r('app.integer.advertising_description_skip_font_size'))
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .margin({ left: $r('app.integer.advertising_description_pageCountDown_margin') })
        }
        .width($r('app.integer.advertising_description_skip_width'))
        .aspectRatio(2.4)
        .backgroundColor($r('app.string.advertising_description_backgroundColor'))
        .borderRadius($r('app.integer.advertising_description_skip_borderRadius'))
        .id('skipButton')
        .onClick(() => {
          this.changeFullScreen(false);
          this.pageCountDown = 0;
          clearInterval(this.timer); // 手动跳过时关闭定时器
          router.replaceUrl({ url: 'pages/Index' });
        })
      }.id('advertising_page_row_1')
      .width('100%')
      .margin({top: $r('app.integer.skip_button_margin_top'),right: $r('app.integer.skip_button_margin_right')})
      .justifyContent(FlexAlign.End)

      // 广告页动图和描述
      // Column：垂直布局容器
      // 关键属性：宽度
      Column() {
        // Row：水平布局容器
        // 关键属性：外边距
        Row() {
          // Image：图片
          // 关键属性：objectFit、宽度、aspectRatio
          Image($r('app.media.enter_app_animation'))
            .id('advertisingImage')
            .objectFit(ImageFit.Contain)
            .width('100%')
            .aspectRatio(1.4)
        }.id('advertising_page_row_4')
        .margin({ top: $r('app.integer.advertising_page_gif_margin') })

        // Column：垂直布局容器
        // 关键属性：外边距
        Column() {
          // Text：文本
          // 关键属性：字号
          Text($r('app.string.Implementation_case_of_startup_page'))
            .id('advertisingTitle')
            .fontSize($r('app.integer.advertising_page_font_size'))
          // Text：文本
          // 关键属性：外边距、字号、透明度
          Text($r('app.string.advertising_description'))
            .id('advertisingDescription')
            .margin({ top: $r('app.integer.advertising_description_text_margin') })
            .fontSize($r('app.integer.advertising_description_font_size'))
            .opacity(0.6)
        }.id('advertising_page_column_5')
        .margin({ top: $r('app.integer.advertising_description_margin') })
      }.id('advertising_page_column_3')
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .id('advertisingRoot')
    .backgroundColor($r('app.color.advertising_backgroundColor'))
  }
}