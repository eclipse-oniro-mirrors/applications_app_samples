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

// [Start attrAnimationDemo3]
import { Entry, Component, Column, Row, Text, ClickEvent, FlexAlign, RotateOptions, State } from '@kit.ArkUI';
import curves from '@ohos.curves';

@Entry
@Component
struct attrAnimationDemo3 {
  @State animate: boolean = false;
  // 第一步: 声明相关状态变量
  @State rotateValue: double = 0; // 组件一旋转角度
  @State translateX: double = 0; // 组件二偏移量
  @State opacityValue: double = 1; // 组件一、组件二透明度

  // 第二步：将状态变量设置到相关可动画属性接口
  build() {
    Row() {
      // 组件一
      Column() {
      }
      .opacity(this.opacityValue)
      .rotate({ angle: this.rotateValue } as RotateOptions)
      // 第三步：通过属性动画接口开启属性动画
      .animation({})
      .backgroundColor('#317AF7')
      .justifyContent(FlexAlign.Center)
      .width(100)
      .height(100)
      .borderRadius(30)
      .onClick((e: ClickEvent) => {
        this.animate = !this.animate;
        // 第四步：闭包内通过状态变量改变UI界面
        // 这里可以写任何能改变UI的逻辑比如数组添加，显隐控制，系统会检测改变后的UI界面与之前的UI界面的差异，对有差异的部分添加动画
        // 组件一的rotate属性发生变化，所以会给组件一添加rotate旋转动画
        this.rotateValue = this.animate ? 90 : 0;
        // 组件二的translate属性发生变化，所以会给组件二添加translate偏移动画
        this.translateX = this.animate ? 50 : 0;
        // 组件一、组件二的opacity属性发生变化，所以会给组件一、组件二添加透明度动画
        this.opacityValue = this.animate ? 0.6 : 1;
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
      .animation({})
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

// [End attrAnimationDemo3]
