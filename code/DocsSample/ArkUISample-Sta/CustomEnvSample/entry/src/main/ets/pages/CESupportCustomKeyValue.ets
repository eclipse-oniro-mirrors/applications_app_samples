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
import { NavDestination, $r } from '@kit.ArkUI';
// [Start CustomEnvSupportCustomKeyValue]
import { CustomEnv, ComponentV2, Entry, Text, Column, CustomEnvKey } from '@kit.ArkUI';

const custom = CustomEnvKey.create<string>();

@Entry
@ComponentV2
struct Index {
  // 实现了定义的key及value
  @CustomEnv('custom') customVarName: string = 'hello world';

  build() {
    Column() {
      Text(this.customVarName)
    }
  }
}

// [End CustomEnvSupportCustomKeyValue]
@Builder
export function localArray(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.ce_custom_key_value_title'))
}
