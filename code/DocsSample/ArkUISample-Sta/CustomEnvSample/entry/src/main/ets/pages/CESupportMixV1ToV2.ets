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
// [start CustomEnvSupportMixV1ToV2]
import { Entry, Row, ComponentV2, Component, Column, Text, Button, CustomEnv, ObservedV2, Trace, Require, CustomEnvKey, Param } from '@kit.ArkUI';

@ObservedV2
class CustomValue {
  @Trace defaultVal: string = 'hello';
}

const custom = CustomEnvKey.create<CustomValue>();

@Entry
@Component
struct PageOne {
  @CustomEnv('custom') defaultMessage: CustomValue = new CustomValue();

  build() {
    Column() {
      Text(this.defaultMessage.defaultVal)
      Button('update')
        .onClick(() => {
          this.defaultMessage.defaultVal = 'hello world';
        })
      Child({ message: this.defaultMessage })
    }
    .height('100%')
    .width('100%')
  }
}

@ComponentV2
struct Child {
  @Require @Param message: CustomValue;

  build() {
    Column() {
      Text(`Child Value is : ${this.message.defaultVal}`)
    }
    .height('100%')
    .width('100%')
  }
}

// [End CustomEnvSupportMixV1ToV2]
@Builder
export function localArray(): void {
  NavDestination() {
    PageOne();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.ce_mix_v1_v2_title'))
}
