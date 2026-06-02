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

// [Start StaDynBuiltinArrayStMainPage]
// dynamic_module/src/main/ets/components/ArrayStPage.ets
import st, { STValue } from 'static.@ohos.lang.interop';

@Component
export struct ArrayStChild {
  @Link data: st.Array<string>;

  build() {
    Column() {
      Text(`Child data: ${this.data}`)
      Button('Push element')
        .onClick(() => {
          this.data.push('orange');
        })
      Button('Reset Array')
        .onClick(() => {
          this.data = STValue.newSTArray(); // 当前st.Array不支持new创建，通过STValue.newSTArray()创建空的st.Array
        })
    }
  }
}
// [End StaDynBuiltinArrayStMainPage]
