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
// [Start CustomEnvSupportInitialDefaultValue]
import {
  Entry, ComponentV2, Column, Text, Local, CustomEnvKey, CustomEnv
} from '@kit.ArkUI';

const custom = CustomEnvKey.create<string>();

@Entry
@ComponentV2
struct Index {
  @Local tempProp: string = 'Hello';

  build() {
    Column() {
      Child()
    }
  }
}

@ComponentV2
struct Child {
  @CustomEnv('custom') customProp: string = 'default content';

  build() {
    Column() {
      // 此时Text中的内容显示为: Child: default content
      Text(`Child: ${this.customProp}`);
    }
  }
}

// [End CustomEnvSupportInitialDefaultValue]
@Builder
export function localArray(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.ce_initial_default_value_title'))
}