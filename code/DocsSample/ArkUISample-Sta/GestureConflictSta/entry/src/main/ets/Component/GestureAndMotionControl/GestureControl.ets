'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { Entry, Component, Stack, Scroll, Column, Text, Alignment, ScrollDirection, BarState, Color, EdgeEffect, PanGesture, ForEach, TextAlign, Margin, StackOptions, GestureRecognizer, GestureControl, GestureJudgeResult, BaseGestureEvent, GestureEvent, Scroller, GestureRecognizerState, ScrollableTargetInfo, PanGestureEvent } from '@kit.ArkUI'
@Entry
@Component
struct GestureControlGroup {
  scroller: Scroller = new Scroller();
  scroller2: Scroller = new Scroller();
  private arr: Array<int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  private childRecognizer: GestureRecognizer = new GestureRecognizer();
  private currentRecognizer: GestureRecognizer = new GestureRecognizer();
  private lastOffset: double = 0.0 as double;

  build() {
    Stack({ alignContent: Alignment.TopStart } as StackOptions) {
      Scroll(this.scroller) {
        Column() {
          Text('Scroll Area')
            .width('90%')
            .height(150)
            .backgroundColor(0xFFFFFF)
            .borderRadius(15)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({ top: 10 } as Margin)
          Scroll(this.scroller2) {
            Column() {
              Text('Scroll Area2')
                .width('90%')
                .height(150)
                .backgroundColor(0xFFFFFF)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 } as Margin)
              Column() {
                ForEach(this.arr, (item: int) => {
                  Text((item).toString())
                    .width('90%')
                    .height(150)
                    .backgroundColor(0xFFFFFF)
                    .borderRadius(15)
                    .fontSize(16)
                    .textAlign(TextAlign.Center)
                    .margin({ top: 10 } as Margin)
                }, (item: int) => (item).toString())
              }.width('100%')
            }
          }
          .id('inner')
          .width('100%')
          .height(800)
        }.width('100%')
      }
      .id('outer')
      .height(600)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(10)
      .edgeEffect(EdgeEffect.None)
      // [Start gesture_simultaneously]
      .shouldBuiltInRecognizerParallelWith((current: GestureRecognizer, others: Array<GestureRecognizer>) => {
        for (let i: int = 0; i < others.length; i++) {
          let target = others[i].getEventTargetInfo();
          if (target.getId() == 'inner' && others[i].isBuiltIn() && others[i].getType() == GestureControl.GestureType.PAN_GESTURE) { // 找到将要组成并行手势的识别器
            this.currentRecognizer = current; // 保存当前组件的识别器
            this.childRecognizer = others[i]; // 保存将要组成并行手势的识别器
            return others[i]; // 返回和当前手势将要组成并行手势的识别器
          }
        }
        return {} as GestureRecognizer;
      })
      //  [End gesture_simultaneously]
      // [Start gesture_openingclosing]
      .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
        others: Array<GestureRecognizer>) => { // 在识别器即将要成功时，根据当前组件状态，设置识别器使能状态
        let target = current.getEventTargetInfo();
        if (target !== null && target.getId() == 'outer' && current.isBuiltIn() && current.getType() == GestureControl.GestureType.PAN_GESTURE) {
          for (let i: int = 0; i < others.length; i++) {
            let targetInner = others[i].getEventTargetInfo() as ScrollableTargetInfo;
            if (targetInner !== null && targetInner.getId() == 'inner') { // 找到响应链上对应并行的识别器
              let panEvent = event as PanGestureEvent;
              this.childRecognizer.setEnabled(true);
              this.currentRecognizer.setEnabled(false);
              if (targetInner.isEnd()) { // 根据当前组件状态以及移动方向动态控制识别器使能状态
                if (panEvent !== null && panEvent.offsetY < 0.0 as double) {
                  this.childRecognizer.setEnabled(false);
                  this.currentRecognizer.setEnabled(true);
                }
              } else if (targetInner.isBegin()) {
                if (panEvent.offsetY > 0.0 as double) {
                  this.childRecognizer.setEnabled(false);
                  this.currentRecognizer.setEnabled(true);
                }
              }
            }
          }
        }
        return GestureJudgeResult.CONTINUE;
      })
      //  [End gesture_openingclosing]
      // [Start listening_gestures]
      .parallelGesture( // 绑定一个Pan手势作为动态控制器
        PanGesture()
          .onActionUpdate((event: GestureEvent) => {
            if (this.childRecognizer.getState() != GestureRecognizerState.SUCCESSFUL ||
              this.currentRecognizer.getState() != GestureRecognizerState.SUCCESSFUL) { // 如果识别器状态不是SUCCESSFUL，则不做控制
              return;
            }
            let target = this.childRecognizer.getEventTargetInfo() as ScrollableTargetInfo;
            let currentTarget = this.currentRecognizer.getEventTargetInfo() as ScrollableTargetInfo;
            if (target !== null && currentTarget !== null) {
              this.childRecognizer.setEnabled(true);
              this.currentRecognizer.setEnabled(false);
              if (target.isEnd()) { // 在移动过程中实时根据当前组件状态，控制识别器的开闭状态
                if ((event.offsetY - this.lastOffset) < 0.0 as double) {
                  this.childRecognizer.setEnabled(false);
                  if (currentTarget.isEnd()) {
                    this.currentRecognizer.setEnabled(false);
                  } else {
                    this.currentRecognizer.setEnabled(true);
                  }
                }
              } else if (target.isBegin()) {
                if ((event.offsetY - this.lastOffset) > 0.0 as double) {
                  this.childRecognizer.setEnabled(false);
                  if (currentTarget.isBegin()) {
                    this.currentRecognizer.setEnabled(false);
                  } else {
                    this.currentRecognizer.setEnabled(true);
                  }
                }
              }
            }
            this.lastOffset = event.offsetY;
          })
      )
      //  [End listening_gestures]

    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}
