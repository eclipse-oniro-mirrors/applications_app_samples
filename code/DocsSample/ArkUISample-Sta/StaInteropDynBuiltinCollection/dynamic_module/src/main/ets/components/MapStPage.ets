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

// [Start StaDynBuiltinMapStMainPage]
// dynamic_module/src/main/ets/components/MapStPage.ets
import st, { STValue } from 'static.@ohos.lang.interop';

@Component
export struct MapStChild {
  @Link data: st.Map<string, number>;

  build() {
    Column() {
      Text(`Child data: ${this.data}`)
      Button('Set element')
        .onClick(() => {
          this.data.set('orange', 3);
        })
      Button('Reset Map')
        .onClick(() => {
          this.data = STValue.newSTMap(); // 当前st.Map不支持new创建，通过STValue.newSTMap()创建空的st.Map
        })
    }
  }
}
// [End StaDynBuiltinMapStMainPage]
