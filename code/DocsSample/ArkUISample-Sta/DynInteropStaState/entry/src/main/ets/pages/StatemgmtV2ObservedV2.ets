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

// [Start DynInteropStaStatemgmtV2ObservedV2]
// entry/src/main/ets/pages/StatemgmtV2ObservedV2.ets
import { setEnableCompatibleObservedV2ForDynamic, ObservedV2ForStatic }  from 'static_module';

@Entry
@ComponentV2
export struct Index {
  // 使用@State修饰ArkTS-Sta @ObservedV2装饰的类
  person: ObservedV2ForStatic = new ObservedV2ForStatic('Tom', 9);

  aboutToAppear() {
    // 调用setEnableCompatibleObservedV2ForDynamic方法，使ArkTS-Sta @Trace修饰的属性在ArkTS-Dyn中可观测
    setEnableCompatibleObservedV2ForDynamic(this.person);
  }
  build() {
    Row() {
      Column() {
        Text(`name: ${this.person.name}`)
        Text(`age: ${this.person.age}`)
        Button('add age')
          .onClick(() => {
            this.person.age++; // 触发UI刷新
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End DynInteropStaStatemgmtV2ObservedV2]
