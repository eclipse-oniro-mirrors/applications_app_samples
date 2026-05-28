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

// [Start DynInteropStaBuilderParamByRef]
// static_module/src/main/ets/components/StaBuilderParamByRef.ets
import { Component, Builder, BuilderParam, Column, Button } from '@ohos.arkui.component';
import { State, Observed } from '@ohos.arkui.stateManagement';

export interface IPerson { // ArkTS-Sta侧的对象字面量interface
  name: string;
  age: number;
}

@Component
export struct Child {
  @State name: string = 'Kevin';
  @State age: number = 20;

  @Builder
  myBuilder(person: IPerson): void {}

  // 使用@BuilderParam接收ArkTS-Dyn侧传递的@Builder函数
  @BuilderParam customBuilderParam: (person: IPerson) => void = this.myBuilder;

  build(): void {
    Column() {
      // 调用@BuilderParam定义的变量，传递ArkTS-Sta侧的对象字面量
      this.customBuilderParam({ name: this.name, age: this.age })
      Button('changeName')
        .onClick(() => {
          // 修改状态变量，触发@Builder内部UI刷新
          this.name += 'a';
        })
        .width(300)
        .margin(10)
      Button('changeAge')
        .onClick(() => {
          // 修改状态变量，触发@Builder内部UI刷新
          this.age += 1;
        })
        .width(300)
        .margin(10)
    }
    .width('100%')
  }
}
// [End DynInteropStaBuilderParamByRef]
