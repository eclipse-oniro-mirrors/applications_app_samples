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

// [Start DynInteropStaBuilderBuilderByRef]
// entry/src/main/ets/pages/BuilderByRef.ets
import { personInfo } from 'static_module'; // 引入@Builder函数

@Entry
@Component
struct Parent {
  @State name: string = 'Kevin';
  @State age: number = 20;
  build() {
    Column() {
      // 传入对象字面量，状态变量的改变引起@Builder的UI刷新
      personInfo({name: this.name, age: this.age})
      Button('changeName')
        .onClick(() => {
          // 变化name状态变量，触发@Builder内部UI刷新
          this.name += 'a';
        })
        .width(300)
        .margin(10)
      Button('changeAge')
        .onClick(() => {
          // 变化age状态变量，触发@Builder内部UI刷新
          this.age += 1;
        })
        .width(300)
        .margin(10)
    }
    .width('100%')
  }
}
// [End DynInteropStaBuilderBuilderByRef]
