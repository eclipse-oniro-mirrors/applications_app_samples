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

// [Start DynInteropStaESMap]
// static_module/src/main/ets/components/StaESMap.ets

import { Component, Column, Button, Text, ClickEvent, Link } from '@kit.ArkUI';
import es from '@ohos.lang.interop';
import { dynCreateMap } from 'dynamic_module';

@Component
export struct ESMapChild {
  @Link data: es.Map<string, number>;

  // 辅助函数：将es.Map转为字符串展示
  mapToString(): string {
    let result = '';
    this.data.forEach((value: number, key: string) => { // 当前es.Map不支持iterator，通过forEach遍历
      result += `${key}:${value}, `;
    });
    return result;
  }

  build(): void {
    Column() {
      Text(`Child data: ${this.mapToString()}`)
      Button('Set element')
        .onClick((event: ClickEvent) => {
          this.data.set('orange', 3);
        })
      Button('Reset Map')
        .onClick((event: ClickEvent) => {
          this.data = dynCreateMap(); // 当前es.Map不支持new创建，需通过ArkTS-Dyn方法创建
        })
    }
  }
}
// [End DynInteropStaESMap]
