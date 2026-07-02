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
// [Start CustomEnvSupportMultipleTypes]
import {
  Entry, ComponentV2, Column, CustomEnv, Text, CustomEnvKey, ObservedV2, Trace
} from '@kit.ArkUI';

@ObservedV2
class CustomEnvValue {
  @Trace id: number = 123;
  @Trace userName: string = 'admin';
}

const customStr = CustomEnvKey.create<string>();
const customNum = CustomEnvKey.create<number>();
const customBool = CustomEnvKey.create<boolean>();
const customObj = CustomEnvKey.create<CustomEnvValue>();

@Entry
@ComponentV2
struct Index {
  @CustomEnv('customStr') customStrVarName: string = 'hello world';
  @CustomEnv('customNum') customNumVarName: number = 1;
  @CustomEnv('customBool') customBoolVarName: boolean = true;
  @CustomEnv('customObj') customObjVarName: CustomEnvValue = new CustomEnvValue();

  build() {
    Column() {
      Text(`customStrVarName type is ${typeof this.customStrVarName}`)
      Text(`customNumVarName type is ${typeof this.customNumVarName}`)
      Text(`customBoolVarName type is ${typeof this.customBoolVarName}`)
      Text(`customObjVarName type is ${typeof this.customObjVarName}`)
    }
  }
}

// [End CustomEnvSupportMultipleTypes]
@Builder
export function localArray(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.ce_multiple_types_title'))
}