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

// [Start DynInteropStaDeclSpecStaDeclarationSpecBuilder]
// static_module/src/main/ets/components/StaDeclarationSpecBuilder.ets
import { Text, Column, Component, Builder, BuilderParam, WrappedBuilder, wrapBuilder } from '@ohos.arkui.component';

@Component
export struct StaChild {
  @Builder
  myText(content: string, num: number): void {
    Text('myText')
  }
  @BuilderParam customBuilderParam: (content: string, num: number) => void = this.myText;

  build(): void {
    Column() {
      this.customBuilderParam('hello world', 30)
    }
  }
}

@Builder
export function staticBuilder(value: string, size: number): void {
  Text(value).fontSize(size)
}

export const staticWrappedBuilder: WrappedBuilder<@Builder (value: string, size: number) => void> = wrapBuilder(staticBuilder);
// [End DynInteropStaDeclSpecStaDeclarationSpecBuilder]
