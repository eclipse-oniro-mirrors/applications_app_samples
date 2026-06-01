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

'use static'

// [Start parallelExternalState_start]
// ArkTS-Sta示例
import { Entry, Text, Column, Component } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { ParallelizeUI } from '@ohos.arkui.Parallelize';

@Entry
@Component
struct Index {
  @State str: string = 'Hello';
  build() {
    Column() {
      ParallelizeUI(undefined) {
        Text(this.str) // ParallelizeUI内部不能使用外部定义的状态变量
          .fontSize(50)
      }
      Text('World')
        .fontSize(50)
    }.height('100%')
    .width('100%')
  }
}
// [End parallelExternalState_start]
