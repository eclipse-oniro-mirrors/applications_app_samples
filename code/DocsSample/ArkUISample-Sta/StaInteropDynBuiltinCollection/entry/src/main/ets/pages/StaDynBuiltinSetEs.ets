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

// [Start StaDynBuiltinSetEs]
// entry/src/main/ets/pages/StaDynBuiltinSetEs.ets

import { ClickEvent, Entry, Column, Button, Component, Text, State } from '@kit.ArkUI';
import es from '@ohos.lang.interop';
import { SetEsChild, dynCreateSet } from 'dynamic_module';

@Entry
@Component
struct Parent {
  @State data: es.Set<string> = dynCreateSet(); // 当前es.Set不支持new创建，需通过ArkTS-Dyn方法创建

  // 辅助函数：将es.Set转为字符串展示
  setToString(): string {
    let result = '';
    this.data.forEach((value: string) => { // 当前es.Set不支持iterator，通过forEach遍历
      result += `${value}, `;
    });
    return result;
  }

  build() {
    Column() {
      Text(`Parent data: ${this.setToString()}`)
      Button('Add element')
        .onClick((event: ClickEvent) => {
          this.data.add('orange');
        })
      Button('Reset Set')
        .onClick((event: ClickEvent) => {
          this.data = dynCreateSet();
        })
      SetEsChild({ data: this.data })
    }
  }
}
// [End StaDynBuiltinSetEs]
