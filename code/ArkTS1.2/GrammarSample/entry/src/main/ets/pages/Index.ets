'use static'
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { Entry, Column, Component, Tabs, TabContent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { SwitchCaseDemo } from './SwitchCaseDemo';
import { FuncGenericDemo } from './FuncGenericDemo';

@Entry
@Component
struct ExampleSample {
  build() {
    Column() {
      Tabs() {
        TabContent() {
          FuncGenericDemo();
        }.tabBar('泛型函数')

        TabContent() {
          SwitchCaseDemo();
        }.tabBar('Switch/Case')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f0f0f0')
  }
}