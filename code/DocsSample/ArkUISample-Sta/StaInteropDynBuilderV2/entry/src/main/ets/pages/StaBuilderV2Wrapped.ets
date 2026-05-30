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

// [Start StaBuilderV2Wrapped]
// entry/src/main/ets/pages/StaBuilderV2Wrapped.ets
import { Entry, ComponentV2, Column, Button, ClickEvent, compatibleWrappedBuilder } from '@ohos.arkui.component';
import { Local } from '@ohos.arkui.stateManagement';
import { globalBuilder } from 'dynamic_module';

@Entry
@ComponentV2
struct MainPage {
  @Local stateVar: string = 'Hello World!';

  build() {
    Column() {
      // 无需显式使用占位组件API，框架会自动处理
      let globalBuilderParam = ESValue.instantiateEmptyObject()
      globalBuilderParam.setProperty(ESValue.wrap('content'), ESValue.wrap(this.stateVar))
      compatibleWrappedBuilder(globalBuilder, globalBuilderParam)
      Button('Click me')
        .onClick((e: ClickEvent) => {
          this.stateVar = 'Hello ArkUI!';
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}
// [End StaBuilderV2Wrapped]
