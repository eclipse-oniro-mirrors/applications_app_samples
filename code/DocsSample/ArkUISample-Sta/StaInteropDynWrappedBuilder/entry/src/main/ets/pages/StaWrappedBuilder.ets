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

// [Start StaWrappedBuilder]
// entry/src/main/ets/pages/StaWrappedBuilder.ets
import { Entry, Component, Column, Button, ClickEvent, compatibleWrappedBuilder } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

import { globalBuilder } from 'dynamic_module'; // 引入ArkTS-Dyn模块导出的WrappedBuilder对象

@Entry
@Component
struct MainPage {
  @State stateVar: string = 'Hello World!';
  flag: boolean = true;

  build() {
    Column() {
      // 构造WrappedBuilder函数的参数对象
      let globalBuilderParam = ESValue.instantiateEmptyObject();
      // 设置参数prop的值为@State变量
      globalBuilderParam.setProperty(ESValue.wrap('prop'), ESValue.wrap(this.stateVar))
      // 显式使用占位compatibleWrappedBuilder函数，链接ArkTS-Dyn的WrappedBuilder对象
      compatibleWrappedBuilder(globalBuilder, globalBuilderParam)

      Button('Click me').onClick((e: ClickEvent) => {
        // 点击按钮时更新@State变量，触发UI更新
        this.flag = !this.flag;
        if (this.flag) {
          this.stateVar = 'Hello static!';
        } else {
          this.stateVar = 'Hello dynamic!';
        }
      })
        .width(300)
        .margin(10)
    }
    .width('100%')
    .height('100%')
  }
}
// [End StaWrappedBuilder]
