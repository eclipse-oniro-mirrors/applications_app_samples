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

// [Start DynInteropStaBuilderStaBuilderByCallback]
// static_module/src/main/ets/components/StaBuilderByCallback.ets
import { Builder, Column, Button, Text, MutableBinding, Binding } from '@kit.ArkUI';
import { transfer } from '@kit.ArkTS';

export function createStaticMutableBinding(binding: Object): Any {
  // 将动态MutableBinding转换为静态MutableBinding，供ArkTS-Sta @Builder接收。
  return transfer.transferStatic(binding, 'ArkUI.MutableBinding');
}

export function createStaticBinding(binding: Object): Any {
  // 将动态Binding转换为静态Binding，供ArkTS-Sta @Builder接收。
  return transfer.transferStatic(binding, 'ArkUI.Binding');
}

@Builder
export function CustomButton(num1: MutableBinding<number>, num2: Binding<number>): void {
  Column() {
    Text(`CustomButton num1: ${num1.value}, num2: ${num2.value}`)
      .fontSize(20)
      .margin(10)
    Button('change num1')
      .onClick(() => {
        num1.value++;
      })
      .width(300)
      .margin(10)
  }
}
// [End DynInteropStaBuilderStaBuilderByCallback]
