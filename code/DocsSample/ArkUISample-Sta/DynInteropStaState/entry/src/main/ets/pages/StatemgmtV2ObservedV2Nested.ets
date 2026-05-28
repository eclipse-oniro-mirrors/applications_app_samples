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

// [Start DynInteropStaStatemgmtV2ObservedV2Nested]
// entry/src/main/ets/pages/StatemgmtV2ObservedV2Nested.ets
import { Son, setEnableCompatibleObservedV2ForDynamicNested } from 'static_module';

@Entry
@ComponentV2
struct Page {
  // 使用@State修饰ArkTS-Sta @ObservedV2装饰的类
  son: Son = new Son();
  renderTimes: number = 0;
  isRender(id: number): number {
    console.info(`id: ${id} renderTimes: ${this.renderTimes}`);
    this.renderTimes++;
    return 40;
  }
  aboutToAppear() {
    // 调用setEnableCompatibleObservedV2ForDynamicNested方法，使ArkTS-Sta @Trace修饰的属性在ArkTS-Dyn中可观测
    setEnableCompatibleObservedV2ForDynamicNested(this.son);
  }
  build() {
    Column() {
      Text('pencil length'+ this.son.bag.pencil.length) // UINode (1)
        .fontSize(this.isRender(1))
        .margin(10)
      Button('change length')
        .onClick((e) => {
          // 触发UI刷新
          this.son.bag.pencil.length += 100;
        })
        .margin(10)
    }
    .width('100%')
  }
}
// [End DynInteropStaStatemgmtV2ObservedV2Nested]
