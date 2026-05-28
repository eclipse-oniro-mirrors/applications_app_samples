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

// [Start DynInteropStaBuilderStaBuilderByRef]
// static_module/src/main/ets/components/StaBuilderByRef.ets
import { Builder, Text, Column } from '@ohos.arkui.component';
import { Person } from 'dynamic_module'; // 引入ArkTS-Dyn侧的Person类

@Builder
export function personInfo(person: Person): void { // 按引用传递参数，需传入对象字面量
  Column() {
    Text(`Name: ${person.name}`)
      .fontSize(20)
      .margin(10)
    Text(`Age: ${person.age}`)
      .fontSize(20)
      .margin(10)
  }
}
// [End DynInteropStaBuilderStaBuilderByRef]
