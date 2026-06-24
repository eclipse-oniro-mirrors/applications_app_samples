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
// [Start CustomEnvSupportMixV2ToV1]
import { Entry, Row, ComponentV2, Component, Column, Text, Button, CustomEnv, ObservedV2, Trace, Require, PropRef, CustomEnvKey } from '@kit.ArkUI';

@ObservedV2
class CustomValue {
  @Trace defaultVal: string = 'hello';
}

const custom = CustomEnvKey.create<string>();
const customObj = CustomEnvKey.create<CustomValue>();

@Entry
@ComponentV2
struct PageOne {
  @CustomEnv('custom') defaultMessage: string = 'parent Value';
  @CustomEnv('customObj') defaultObj: CustomValue = new CustomValue();

  build() {
    Column() {
      Text(`Parent Value is :${this.defaultMessage}`)
      Child({ message: this.defaultMessage }) // 正确用法
      // Child({ customMessage: this.defaultObj }) // 错误用法，编译报错。
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct Child {
  @Require @PropRef message: string;
  // @PropRef customMessage: CustomValue; //  错误用法，V1状态变量装饰器装饰的类型不能是ObservedV2装饰的class。

  build() {
    Column() {
      Text(`Child value is :${this.message}`)
    }
    .height('100%')
    .width('100%')
  }
}

// [End CustomEnvSupportMixV2ToV1]
@Builder
export function localArray(): void {
  NavDestination() {
    PageOne();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.ce_mix_v2_v1_title'))
}