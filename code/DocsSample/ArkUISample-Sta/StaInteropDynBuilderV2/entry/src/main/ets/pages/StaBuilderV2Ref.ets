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

// [Start StaBuilderV2Ref]
// entry/src/main/ets/pages/StaBuilderV2Ref.ets
import { Entry, ComponentV2, Column, Button, ClickEvent } from '@ohos.arkui.component';
import { Local } from '@ohos.arkui.stateManagement';
import { overBuilder } from 'dynamic_module';

@Entry
@ComponentV2
struct Index {
  @Local label: string = 'Local Interop';

  build() {
    Column() {
      Column() {
        // 在父组件中调用overBuilder组件时，
        // 把this.label通过引用传递的方式传给overBuilder组件。
        overBuilder({ paramA1: this.label })
        Button('Click me')
          .onClick(() => {
            // 单击Click me后，UI文本从Hello更改为ArkUI。
            this.label = 'ArkUI';
          })
      }
    }
  }
}
// [End StaBuilderV2Ref]
