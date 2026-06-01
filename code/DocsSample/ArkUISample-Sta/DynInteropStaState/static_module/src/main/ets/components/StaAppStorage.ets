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

// [Start DynInteropStaStatemgmtV1StaAppStorage]
// static_module/src/main/ets/components/StaAppStorage.ets
import { Component, Column, Button } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';

let gPropA: number = 1;

@Component
export struct MainPage { // 定义ArkTS-Sta自定义组件
  build(): void {
    Column() {
      Button('change AppStorage')
        .onClick(() => {
          // 通过接口修改ArkTS-Dyn的AppStorage并同步更新ArkTS-Dyn组件
          AppStorage.setOrCreate('PropA', ++gPropA);
        })
        .width(300)
        .margin(10)
    }
    .width('100%')
  }
}
// [End DynInteropStaStatemgmtV1StaAppStorage]
