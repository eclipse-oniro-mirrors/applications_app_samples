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

// [Start DynInteropStaBuilderParamByValue]
// static_module/src/main/ets/components/StaBuilderParamByValue.ets
import { Component, Builder, BuilderParam, Column } from '@ohos.arkui.component';

@Component
export struct ChildByValue { // ArkTS-Sta侧的自定义组件
  @Builder
  myBuilder(str: string): void {
  }

  // 使用@BuilderParam接收ArkTS-Dyn侧传递的@Builder函数
  @BuilderParam customBuilderParam: (input: string) => void = this.myBuilder;

  build(): void {
    Column() {
      this.customBuilderParam('Hello World!')
    }
  }
}
// [End DynInteropStaBuilderParamByValue]
