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
// [Start MonitorInheritClass]
import { Button, Column, ComponentV2, Entry, IMonitor, Monitor, ObservedV2, Trace } from '@kit.ArkUI';

@ObservedV2
export class Base {
  @Trace name: string;
  // 基类监听name属性
  @Monitor(['name'])
  onBaseNameChange(monitor: IMonitor): void {
    console.info('Base Class name change');
  }
  constructor(name: string) {
    this.name = name;
  }
}
@ObservedV2
export class Derived extends Base {
  @Trace age: int = 0;
  // 继承类监听name属性
  @Monitor(['name'])
  onDerivedNameChange(monitor: IMonitor): void {
    console.info('Derived Class name change');
  }
  constructor(name: string) {
    super(name);
  }
}
@Entry
@ComponentV2
struct Index {
  derived: Derived = new Derived('AAA');
  build() {
    Column() {
      Button('change name')
        .onClick((e) => {
          this.derived.name = 'BBB'; // 能够先后触发onBaseNameChange、onDerivedNameChange方法
        })
    }
  }
}

// [End MonitorInheritClass]

@Builder
export function monitorInheritClass(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.monitor_inherit_class_title'))
}