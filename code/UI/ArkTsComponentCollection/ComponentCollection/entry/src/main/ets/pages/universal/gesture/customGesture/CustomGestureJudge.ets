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
 * @file entry/src/main/ets/pages/universal/gesture/customGesture/CustomGestureJudge.ets
 * 文件职责：CustomGestureJudge 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：CustomJudgeEvent。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import router from '@ohos.router';
import { getStringData } from '../../../../data/ResourceDataHandle';
import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import ShowToast from '../../../../util/ShowToast';

/**
 * CustomJudgeEvent：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct CustomJudgeEvent {
  private btnFontColor: Resource = $r('app.color.white');

  // @State message：组件内部状态
  @State message: string = '';

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、内边距、背景色
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
            .margin({ left: 12 })
            .objectFit(ImageFit.Contain)
            .onClick(() => {
              router.back()
            })
            .id('backBtn')
          // Text：文本
          // 关键属性：字号、布局权重、字重、外边距、align
          Text($r('app.string.custom_judge_title')).id('custom_gesture_judge_text_4')
            .fontSize(20)
            .layoutWeight(1)
            .fontWeight(700)
            .margin({ left: 16 })
            .align(Alignment.Start)
          // Blank：占位空白
          Blank().id('custom_gesture_judge_blank_5')
        }.id('custom_gesture_judge_row_3')
        .height('100%')
        .width('100%')
      }.id('custom_gesture_judge_column_2')
      .height(56)
      .width('100%')

      // 上半部分
      // Stack：层叠布局容器
      // 关键属性：gesture
      Stack() {
        // Column：垂直布局容器
        // 关键属性：高度、宽度、背景色、透明度、交叉轴对齐、主轴对齐
        Column() {
        }
        .height(340)
        .width('100%')
        .backgroundColor('#007DFF')
        .opacity(0.1)
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
        .id('longPressColumn')
        .border({
          width: 1,
          color: '#007DFF',
          radius: { topLeft: 24, topRight: 24, bottomLeft: 0, bottomRight: 0 },
          style: BorderStyle.Dotted
        })

        // Text：文本
        // 关键属性：字号、字重、字体、文本对齐、透明度、字体颜色
        Text($r('app.string.custom_judge_long_press'))
          .fontSize(16)
          .fontWeight(400)
          .fontFamily(' HarmonyHeiTi')
          .textAlign(TextAlign.Center)
          .opacity(0.7)
          .fontColor('#007DFF')
          .id('longPressPrompt')
      }
      .id('longPressArea')
      .gesture(
        // TapGesture：TapGesture 自定义组件
        // 关键属性：tag
        TapGesture()
          .tag("tap1") // 设置点击手势标志
      )
      .gesture(
        // LongPressGesture：LongPressGesture 自定义组件
        // 关键属性：tag、onAction
        LongPressGesture()
          .tag("longPress1")// 设置长按手势标志
          .onAction(() => {
            this.message = 'longPress';
            ShowToast.longToast($r('app.string.custom_long_press_prompt'));
          })
      )
      .onGestureJudgeBegin((gestureInfo: GestureInfo, event: BaseGestureEvent) => {
        // 自定义判定标准
        if (gestureInfo.type == GestureControl.GestureType.LONG_PRESS_GESTURE &&
          gestureInfo.tag == 'longPress1' &&
          event.fingerList.length > 0 &&
          event.fingerList[0].localY < 340) {
          // 返回 CONTINUE 将保持系统判定。
          return GestureJudgeResult.CONTINUE;
        } else {
          return GestureJudgeResult.REJECT;
        }
      })

      // 下半部分
      // Stack：层叠布局容器
      // 关键属性：gesture
      Stack() {
        // Column：垂直布局容器
        // 关键属性：高度、宽度、背景色、透明度、交叉轴对齐、主轴对齐
        Column() {
        }
        .height(340)
        .width('100%')
        .backgroundColor('#F7CE00')
        .opacity(0.1)
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
        .id('clickColumn')
        .border({
          width: 1,
          color: '#F7BD00',
          radius: { topLeft: 0, topRight: 0, bottomLeft: 24, bottomRight: 24 },
          style: BorderStyle.Dotted
        })

        // Text：文本
        // 关键属性：字号、字重、字体、文本对齐、字体颜色、透明度
        Text($r('app.string.custom_judge_click'))
          .fontSize(16)
          .fontWeight(400)
          .fontFamily(' HarmonyHeiTi')
          .textAlign(TextAlign.Center)
          .fontColor('#FF9900')
          .opacity(1)
          .id('clickTextPrompt')
      }
      .id('clickArea')
      .gesture(
        // TapGesture：TapGesture 自定义组件
        // 关键属性：tag、onAction
        TapGesture()
          .tag("tap2")// 设置点击手势标志
          .onAction(() => {
            this.message = 'tap';
            ShowToast.longToast($r('app.string.custom_tap_prompt'));
          })
      )
      .gesture(
        // LongPressGesture：LongPressGesture 自定义组件
        // 关键属性：tag、onAction
        LongPressGesture()
          .tag("longPress2")// 设置长按手势标志
          .onAction(() => {
            this.message = 'longPress'
          })
      )
      .onGestureJudgeBegin((gestureInfo: GestureInfo, event: BaseGestureEvent) => {
        // 自定义判定标准
        if (gestureInfo.type == GestureControl.GestureType.TAP_GESTURE &&
          gestureInfo.tag == 'tap2' &&
          event.fingerList.length > 0 &&
          event.fingerList[0].localY <= 340) {
          // 返回 CONTINUE 将保持系统判定。
          return GestureJudgeResult.CONTINUE;
        } else {
          return GestureJudgeResult.REJECT;
        }
      })
    }.id('custom_gesture_judge_column_1')
    .height('100%')
    .width('100%')
    .padding({ left: 12, right: 12 })
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}
