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

// [Start DynInteropStaBuilderBuilderByValue]
// entry/src/main/ets/pages/BuilderByValue.ets
import { showTextBuilder } from 'static_module'; // 引入@Builder函数

@Entry
@Component
struct Parent {
  build() {
    Column() {
      // 使用@Builder函数显示文本
      showTextBuilder('Hello World!')
    }
    .width('100%')
    .height('100%')
  }
}
// [End DynInteropStaBuilderBuilderByValue]
