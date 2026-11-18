/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
 * @file entry/src/main/ets/pages/universal/events/customEventSample/CustomClickEvent.ets
 * 文件职责：CustomClickEvent 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：CustomClickEvent。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import router from '@ohos.router';
import { getStringData } from '../../../../data/ResourceDataHandle';
import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import ShowToast from '../../../../util/ShowToast';
import Logger from '../../../../util/Logger';

const TAG: string = 'CustomClickEvent';

/**
 * CustomClickEvent：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct CustomClickEvent {
  private btnFontColor: Resource = $r('app.color.white');

  /**
   * isTouchPointInCircle：执行 isTouchPointInCircle 相关逻辑。
   */
  isTouchPointInCircle(info: TouchTestInfo): boolean {
    let circleCenterX = info.rect.x + info.rect.width / 2;
    let circleCenterY = info.rect.y + info.rect.height / 2;
    let circleRadius = info.rect.width / 2;
    let distance = Math.sqrt((circleCenterX - info.parentX)**2 + (circleCenterY - info.parentY)**2);
    Logger.info(TAG, `isTouchPoinInCircle circleCenterX: ${circleCenterX}, circleCenterY: ${circleCenterY},\
     circleRadius: ${circleRadius}, distance: ${distance}`);
    if (distance <= circleRadius) {
      return true;
    }
    return false;
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // 标题
      // Column：垂直布局容器
      // 关键属性：高度、宽度
      Column() {
        // Row：水平布局容器
        // 关键属性：高度、宽度
        Row() {
          // Image：图片
          // 关键属性：宽度、高度、外边距、objectFit、点击事件回调、back
          // 交互：可点击交互
          Image($r('app.media.ic_back'))
            .width(24)
            .height(24)
            .margin({ left: 24 })
            .objectFit(ImageFit.Contain)
            .onClick(() => {
              router.back()
            })
            .id('backBtn')
          // Text：文本
          // 关键属性：字号、布局权重、字重、外边距、align
          Text($r('app.string.custom_click_event')).id('custom_click_event_text_4')
            .fontSize(20)
            .layoutWeight(1)
            .fontWeight(700)
            .margin({ left: 16 })
            .align(Alignment.Start)
          // Blank：占位空白
          Blank().id('custom_click_event_blank_5')
        }.id('custom_click_event_row_3')
        .height(56)
        .width('100%')
      }.id('custom_click_event_column_2')
      .height(56)
      .width('100%')

      // Column：垂直布局容器
      // 关键属性：高度、宽度、交叉轴对齐、主轴对齐、空间不足收缩
      Column() {
        // 大小圆圈
        // Column：垂直布局容器
        // 关键属性：内边距
        Column({ space: 12 }) {
          // Stack：层叠布局容器
          // 关键属性：宽度、触摸测试策略、onChildTouchTest、info
          Stack({ alignContent: Alignment.Bottom }) {
            // Button：按钮
            // 关键属性：背景色、宽度、高度、字号、字重、字体颜色
            // 交互：可点击交互
            Button({ type: ButtonType.Circle }) {
              // Row：水平布局容器
              // 关键属性：交叉轴对齐
              Row() {
                // Text：文本
                // 关键属性：字号、字重、字体、文本对齐、内边距
                Text($r('app.string.custom_click_big_btn')).id('custom_click_event_text_10')
                  .fontSize(21)
                  .fontWeight(500)
                  .fontFamily('HarmonyHeiTi-Medium')
                  .textAlign(TextAlign.Center)
                  .padding({ top: 56, bottom: 300 })
              }.id('custom_click_event_row_9')
              .alignItems(VerticalAlign.Top)
            }
            .backgroundColor('#007DFF')
            .width('100%')
            .height('100%')
            .fontSize(21)
            .fontWeight(500)
            .id('BigCircle')
            .fontColor(this.btnFontColor)
            .onClick(() => {
              ShowToast.longToast($r('app.string.custom_bigcircle_prompt'));
            })

            // Button：按钮
            // 关键属性：背景色、宽度、字号、字重、圆角、字体颜色
            // 交互：可点击交互
            Button($r('app.string.custom_click_small_btn'), { type: ButtonType.Circle })
              .backgroundColor('#F7CE00')
              .width(240)
              .fontSize(21)
              .fontWeight(500)
              .borderRadius(20)
              .fontColor(this.btnFontColor)
              .id('SmallCircle')
              .onClick(() => {
                ShowToast.longToast($r('app.string.custom_smallcircle_prompt'));
              })
          }.id('custom_click_event_stack_8')
          .width('100%')
          .hitTestBehavior(HitTestMode.Block)
          .onChildTouchTest((touchinfo) => {
            Logger.info(TAG, `touchinfo array len: ${touchinfo.length}`);
            for(let i = 0; i < touchinfo.length; i++) {
              let info: TouchTestInfo = touchinfo[i];
              Logger.info(TAG, `touchinfo info.id: ${info.id}`);
              Logger.info(TAG, `touchinfo windowX: ${info.windowX}, windowY: ${info.windowY}`);
              Logger.info(TAG, `touchinfo parentX: ${info.parentX}, parentY: ${info.parentY}`);
              Logger.info(TAG, `touchinfo x: ${info.x}, y: ${info.y}`);
              Logger.info(TAG, `touchinfo rect.x: ${info.rect.x}, rect.y: ${info.rect.y}, rect.width: ${info.rect.width}, rect.height: ${info.rect.height}`);

              if (info.id == 'SmallCircle' && info.x > 0 && info.y > 0 && this.isTouchPointInCircle(info) == true) {
                Logger.info(TAG, `touchinfo touch point at scope of component: ${info.id}`);
                return { id: 'SmallCircle', strategy: TouchTestStrategy.FORWARD };
              }
              if (info.id == 'BigCircle' && info.x > 0 && info.y > 0 && this.isTouchPointInCircle(info) == true) {
                Logger.info(TAG, `touchinfo touch point at scope of component: ${info.id}`);
                return { id: 'BigCircle', strategy: TouchTestStrategy.FORWARD };
              }
            }
            return { strategy: TouchTestStrategy.DEFAULT };
          })
        }.id('custom_click_event_column_7')
        .padding({ left: 24, right: 24, bottom: 32 })

        // 文字提示
        // Column：垂直布局容器
        Column() {
          // Row：水平布局容器
          // 关键属性：交叉轴对齐、主轴对齐
          Row() {
            // Button：按钮
            // 关键属性：背景色、宽度、高度
            Button({ type: ButtonType.Circle }).id('custom_click_event_button_13')
              .backgroundColor('#007DFF')
              .width(8)
              .height(8)
            // Text：文本
            // 关键属性：字号、字重、字体、文本对齐、外边距
            Text($r('app.string.big_circle_prompt')).id('custom_click_event_text_14')
              .fontSize(14)
              .fontWeight(400)
              .fontFamily('HarmonyHeiTi')
              .textAlign(TextAlign.Start)
              .margin({ left: 8 })
          }.id('custom_click_event_row_12')
          .alignItems(VerticalAlign.Center)
          .justifyContent(FlexAlign.Center)

          // Row：水平布局容器
          // 关键属性：交叉轴对齐、主轴对齐
          Row() {
            // Button：按钮
            // 关键属性：背景色、宽度、高度
            Button({ type: ButtonType.Circle }).id('custom_click_event_button_16')
              .backgroundColor('#F7CE00')
              .width(8)
              .height(8)
            // Text：文本
            // 关键属性：字号、字重、字体、文本对齐、外边距
            Text($r('app.string.small_circle_prompt')).id('custom_click_event_text_17')
              .fontSize(14)
              .fontWeight(400)
              .fontFamily('HarmonyHeiTi')
              .textAlign(TextAlign.Start)
              .margin({ left: 8 })
          }.id('custom_click_event_row_15')
          .alignItems(VerticalAlign.Center)
          .justifyContent(FlexAlign.Center)
        }.id('custom_click_event_column_11')
      }.id('custom_click_event_column_6')
      .height('90%')
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .flexShrink(1)
    }.id('custom_click_event_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}
