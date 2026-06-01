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

// [Start DynInteropStaBuilderBuilderByCallback]
// entry/src/main/ets/pages/BuilderByCallback.ets
import { UIUtils } from '@kit.ArkUI';
import { CustomButton, createStaticMutableBinding, createStaticBinding } from 'static_module';

@Entry
@Component
struct Parent {
  @State num1: number = 10;
  @State num2: number = 10;

  build() {
    Column() {
      CustomButton(
        createStaticMutableBinding(
          UIUtils.makeBinding<number>(
            () => this.num1,
            (val: number) => {
              this.num1 = val;
            }
          )
        ),
        createStaticBinding(
          UIUtils.makeBinding<number>(() => this.num2)
        )
      )
      Text(`num1: ${this.num1}`)
        .fontSize(20)
        .margin(10)
      Button('change num1')
        .onClick(() => {
          this.num1++;
        })
        .width(300)
        .margin(10)
      Text(`num2: ${this.num2}`)
        .fontSize(20)
        .margin(10)
      Button('change num2')
        .onClick(() => {
          this.num2++;
        })
        .width(300)
        .margin(10)
    }
    .width('100%')
  }
}
// [End DynInteropStaBuilderBuilderByCallback]
