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

// [Start KeyframeAnimateToDemo]
import { Entry, Component, Column, Row, Text, ClickEvent, FlexAlign, RotateOptions, State } from '@kit.ArkUI';

@Entry
@Component
struct KeyframeAnimateToDemo {
  // 第一步: 声明相关状态变量
  @State rotateValue: double = 0; // 组件一旋转角度
  @State translateX: double = 0; // 组件二偏移量
  @State opacityValue: double = 1; // 组件二透明度
  // 第二步：将状态变量设置到相关可动画属性接口
  build() {
    Row() {
      // 组件一
      Column() {
      }
      .rotate({ angle: this.rotateValue } as RotateOptions)
      .backgroundColor('#317AF7')
      .justifyContent(FlexAlign.Center)
      .width(100)
      .height(100)
      .borderRadius(30)
      .onClick((e: ClickEvent) => {
        // 第三步：调用keyframeAnimateTo接口
        this.getUIContext()?.keyframeAnimateTo({
          iterations: 1
        }, [
          {
            // 第一段关键帧动画时长为800ms，组件一顺时针旋转90度，组件二的透明度变从1变为0.6，组件二的translate从0位移到50
            duration: 800,
            event: () => {
              this.rotateValue = 90;
              this.opacityValue = 0.6;
              this.translateX = 50;
            }
          },
          {
            // 第二段关键帧动画时长为500ms，组件一逆时针旋转90度恢复至0度，组件二的透明度变从0.6变为1，组件二的translate从50位移到0
            duration: 500,
            event: () => {
              this.rotateValue = 0;
              this.opacityValue = 1;
              this.translateX = 0;
            }
          }
        ]);
      })
      // 组件二
      Column() {
      }
      .justifyContent(FlexAlign.Center)
      .width(100)
      .height(100)
      .backgroundColor('#D94838')
      .borderRadius(30)
      .opacity(this.opacityValue)
      .translate({ x: this.translateX })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

// [End KeyframeAnimateToDemo]
