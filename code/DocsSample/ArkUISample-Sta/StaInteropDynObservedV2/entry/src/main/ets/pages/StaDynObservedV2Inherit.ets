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

// [Start StaDynObservedV2Inherit]
// entry/src/main/ets/pages/StaDynObservedV2Inherit.ets

import { Entry, Row, Text, Column, Component, Button, ComponentV2, enableCompatibleObservedV2ForStatic } from '@ohos.arkui.component';
import { State, ObservedV2, Trace } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import { Son, Cousin } from 'dynamic_module';// 引入ArkTS-Dyn @ObservedV2修饰的类

@Entry
@ComponentV2
struct Index { // ArkTS-Sta自定义组件
  // 创建ArkTS-Dyn @ObservedV2修饰类的实例
  son: Son = new Son(0);
  cousin: Cousin = new Cousin(0);
  renderTimes: number = 0;

  isRender(id: number): number {
    console.info(`id: ${id} renderTimes: ${this.renderTimes}`);
    this.renderTimes++;
    return 40;
  }
  aboutToAppear() {
    // 启用ArkTS-Dyn @ObservedV2与ArkTS-Sta组件的互操作开关，以支持@Trace属性变化观测
    enableCompatibleObservedV2ForStatic(this.son);
    enableCompatibleObservedV2ForStatic(this.cousin);
  }

  build() {
    Column() {
      // 显示Son.age属性
      Text(`Son ${this.son.age}`)
        .fontSize(this.isRender(1))
        .margin(10)
      // 显示Cousin.age属性
      Text(`Cousin ${this.cousin.age}`)
        .fontSize(this.isRender(2))
        .margin(10)
      Button('change Son age')
        .onClick(() => {
          // 修改@Trace修饰的age属性，UI会刷新
          this.son.age++;
        })
        .width(300)
        .margin(10)
      Button('change Cousin age')
        .onClick(() => {
          // 修改@Trace修饰的age属性，UI会刷新
          this.cousin.age++;
        })
        .width(300)
        .margin(10)
    }
  }
}
// [End StaDynObservedV2Inherit]
