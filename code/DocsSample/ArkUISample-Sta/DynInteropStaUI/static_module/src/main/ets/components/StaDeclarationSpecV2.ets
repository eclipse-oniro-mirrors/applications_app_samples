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

// [Start DynInteropStaDeclSpecStaDeclarationSpecV2]
// static_module/src/main/ets/components/StaDeclarationSpecV2.ets
import { ComponentV2, Text, Column } from '@ohos.arkui.component';
import { Local, Param, Once, Event, Provider, Consumer, Monitor, IMonitor, Computed, ObservedV2, Trace } from '@ohos.arkui.stateManagement';

@ObservedV2
export class Person {
  name: string = 'person';
  @Trace age: number = 20;
}

// 状态管理V2装饰器
@ComponentV2
export struct ChildV2 {
  @Local localVar: string = 'localVar';
  @Param paramVar: string = 'paramVar';
  @Param @Once onceParam: string = 'onceParam';
  @Event eventVar: (val: number) => void;
  @Provider providerVar: string = 'providerVar';
  @Consumer consumerVar: string = 'consumerVar';
  @Monitor(['localVar', 'paramVar'])
  onStrChange(monitor: IMonitor): void {
    monitor.dirty.forEach((path: string) => {
      console.info(`${path} changed from ${monitor.value<string>(path)?.before} to ${monitor.value<string>(path)?.now}`);
    });
  }
  @Computed
  get computeVar(): string {
    return this.localVar + this.paramVar;
  }
  person: Person = new Person();

  build(): void {
    Column() {
      Text(`${this.localVar}`)
      Text(`${this.paramVar}`)
      Text(`${this.onceParam}`)
      Text(`${this.providerVar}`)
      Text(`${this.consumerVar}`)
      Text(`${this.person.age}`)
    }
  }
}
// [End DynInteropStaDeclSpecStaDeclarationSpecV2]
