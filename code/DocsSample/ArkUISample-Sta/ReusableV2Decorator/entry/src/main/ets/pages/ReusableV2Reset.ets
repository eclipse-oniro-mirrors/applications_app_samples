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
// [Start reusable_v2_reset]
import { ObservedV2, Trace, Entry, ComponentV2, Local, Provider, Column, Button, Text, Param, Once, Require, Event, Consumer, Monitor, IMonitor, Computed, ReusableV2 } from '@kit.ArkUI';

@ObservedV2
class Info {
  @Trace age: int;
  constructor(age: int) {
    this.age = age;
  }
}

@Entry
@ComponentV2
struct ReusableV2ResetExample {
  @Local local: int = 0;
  @Provider('inherit') inheritProvider: int = 100;
  @Local condition: boolean = true;
  build() {
    Column() {
      Button('回收/复用').onClick(()=>{this.condition=!this.condition;})
      Column() {
        Text('父组件变量')
        Text(`local: ${this.local}`).onClick(()=>{this.local++;})
        Text(`inheritProvider: ${this.inheritProvider}`).onClick(()=>{this.inheritProvider++;})
      }.borderWidth(2)
      if (this.condition) {
        ReusableV2Component({
          paramOut: this.local,
          paramOnce: this.local,
          changeParam: () => {
            this.local++;
          }
        })
      }
    }
  }
}

@ReusableV2
@ComponentV2
struct ReusableV2Component {
  @Local val: int = 0;
  @Local info: Info = new Info(25);
  @Param paramLocal: int = 1;
  @Require @Param paramOut: int;
  @Require @Param @Once paramOnce: int;
  @Event changeParam: () => void;
  @Provider('selfProvider') selfProvider: int = 0;
  @Consumer('inherit') inheritConsumer: int = 0;
  @Consumer('selfConsumer') selfConsumer: int = 0;
  noDecoVariable: int = 0; // 未加装饰器，被视作常量
  noDecoInfo: Info = new Info(30); // 未加装饰器，被视作常量
  readonly readOnlyVariable: int = 0; // readonly常量
  @Computed
  get plusParam(): int {
    return this.paramLocal + this.paramOut + this.paramOnce;
  }
  @Monitor(['val'])
  onValChange(monitor: IMonitor) {
    console.info(`val change from ${monitor.value<int>()?.before} to ${monitor.value<int>()?.now}`);
  }
  @Monitor(['plusParam'])
  onPlusParamChange(monitor: IMonitor) {
    console.info(`plusParam change from ${monitor.value<int>()?.before} to ${monitor.value<int>()?.now}`);
  }
  build() {
    Column() {
      Column() {
        Text('重置为本地初始值的变量')
        Text(`val: ${this.val}`).onClick(()=>{this.val++;})
        Text(`info.age: ${this.info.age}`).onClick(()=>{this.info.age++;})
        Text(`paramLocal: ${this.paramLocal}`).onClick(()=>{/* 无外部传入的Local无法本地修改 */})
        Text(`selfProvider: ${this.selfProvider}`).onClick(()=>{this.selfProvider++;})
        Text(`selfConsumer: ${this.selfConsumer}`).onClick(()=>{this.selfConsumer++;})
      }.borderWidth(2)
      Column() {
        Text('重置为外部传入的变量')
        Text(`paramOut: ${this.paramOut}`).onClick(()=>{this.changeParam();})
        Text(`paramOnce: ${this.paramOnce}`).onClick(()=>{this.paramOnce++;})
      }.borderWidth(2)
      Column() {
        Text('根据父组件情况决定')
        Text(`inheritConsumer: ${this.inheritConsumer}`).onClick(()=>{this.inheritConsumer++;})
        Text(`plusParam: ${this.plusParam}`)
      }.borderWidth(2)
      Column() {
        Text('不被重置')
        Text(`noDecoVariable: ${this.noDecoVariable}`)
        Text(`noDecoInfo.age: ${this.noDecoInfo.age}`).onClick(()=>{this.noDecoInfo.age++;}) // 能够触发刷新但是复用时不会被重置
        Text(`readOnlyVariable: ${this.readOnlyVariable}`)
      }.borderWidth(2)
    }
  }
}
// [End reusable_v2_reset]

@Builder
export function reusableV2Reset(): void {
  NavDestination() {
    ReusableV2ResetExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.reusable_v2_reset_title'))
}
