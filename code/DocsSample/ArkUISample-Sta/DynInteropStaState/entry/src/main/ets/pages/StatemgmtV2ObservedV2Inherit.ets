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

// [Start DynInteropStaStatemgmtV2ObservedV2Inherit]
// entry/src/main/ets/pages/StatemgmtV2ObservedV2Inherit.ets
import { Sonny, Cousin, setEnableCompatibleObservedV2ForDynamicInherit } from 'static_module';

@Entry
@ComponentV2
struct Index { // ArkTS-Dyn自定义组件
  // 创建ArkTS-Sta @ObservedV2装饰类的实例
  sonny: Sonny = new Sonny(0);
  cousin: Cousin = new Cousin(0);
  renderTimes: number = 0;

  isRender(id: number): number {
    console.info(`id: ${id} renderTimes: ${this.renderTimes}`);
    this.renderTimes++;
    return 40;
  }
  aboutToAppear() {
    // 调用setEnableCompatibleObservedV2ForDynamicInherit方法，使ArkTS-Sta @Trace修饰的属性在ArkTS-Dyn中可观测
    setEnableCompatibleObservedV2ForDynamicInherit(this.sonny);
    setEnableCompatibleObservedV2ForDynamicInherit(this.cousin);
  }
  build() {
    Row() {
      Column() {
        // 显示Sonny.age属性
        Text(`Sonny ${this.sonny.age}`)
          .fontSize(this.isRender(1))
          .fontWeight(FontWeight.Bold)
          .margin(10)
        // 显示Cousin.age属性
        Text(`Cousin ${this.cousin.age}`)
          .fontSize(this.isRender(2))
          .fontWeight(FontWeight.Bold)
          .margin(10)
        Button('change Sonny age')
          .onClick((e) => {
            // 触发UI刷新
            this.sonny.age++;
          })
          .margin(10)
        Button('change Cousin age')
          .onClick((e) => {
            // 触发UI刷新
            this.cousin.age++;
          })
          .margin(10)
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End DynInteropStaStatemgmtV2ObservedV2Inherit]
