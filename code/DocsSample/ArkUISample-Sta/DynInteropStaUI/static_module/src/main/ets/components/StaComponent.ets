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

// [Start DynInteropStaComponentStaComponent]
// static_module/src/main/ets/components/StaComponent.ets
import { Text, Column, Component, ComponentV2, Color } from '@ohos.arkui.component';

@Component
export struct ChildComponentV1 {
  message: string = 'Hello World V1!';

  build(): void {
    Column() {
      Text(this.message)
        .fontSize(20)
        .margin(10)
    }
    .width('100%')
  }
}

@ComponentV2
export struct ChildComponentV2 {
  message: string = 'Hello World V2!';

  build(): void {
    Column() {
      Text(this.message)
        .fontSize(20)
        .margin(10)
    }
    .width('100%')
  }
}
// [End DynInteropStaComponentStaComponent]
