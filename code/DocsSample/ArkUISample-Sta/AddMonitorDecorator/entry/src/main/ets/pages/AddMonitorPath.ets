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
// [Start AddMonitorPath]
import { UIUtils, IMonitor, IMonitorDecoratedVariable, Local, Entry, ComponentV2,
         Row, Column, Text, Button, UIUtils } from '@kit.ArkUI';

export interface Pair<R, V> {
  key: R;
  value: V;
};

@Entry
@ComponentV2
struct Page {
  @Local singleValue: int = 0;
  @Local pairValue: Pair<int, int> = UIUtils.makeObserved({ key: 42, value: 35 } as Pair<int, int>);
  @Local multipleValue: int[] = [1, 2, 3];

  singleValueMonitor?: IMonitorDecoratedVariable;
  pairValueMonitor?: IMonitorDecoratedVariable;
  multipleValueMonitor?: IMonitorDecoratedVariable;

  aboutToAppear() {
    console.info('[DynamicMonitor] Test case begin.');

    this.singleValueMonitor = UIUtils.addMonitor(() => this.singleValue, this.onChange, { owner: this });

    const pairCallback: (() => Any)[] = [
      () => this.pairValue.key,
      () => this.pairValue.value
    ];
    this.pairValueMonitor = UIUtils.addMonitor(pairCallback, this.onChange, { owner: this, path: ['pair_key', 'pair_value'] });

    const valueCallback = this.multipleValue.map((_: int, index: int): (() => Any) => (
      () => this.multipleValue[index]
    ));
    this.multipleValueMonitor = UIUtils.addMonitor(valueCallback, this.onChange, { owner: this, path: ['First', 'Second', 'Third', 'Fourth'] });
  }

  onChange(mon: IMonitor) {
    console.info('[DynamicMonitor] Callback triggered.');

    mon.dirty.forEach((path: string) => {
      console.info(`[DynamicMonitor] value ${path} has changed from ${mon.value<int>(path)?.before} to ${mon.value<int>(path)?.now}.`);
    })
  }

  build() {
    Column() {
      Text(`Single value: ${this.singleValue}`)
      Button('Increase the single value')
        .onClick(() => {
          this.singleValue++;
        })
      Text(`Pair value: [${this.pairValue.key}, ${this.pairValue.value}]`)
      Button('Increase the pair value')
        .onClick(() => {
          this.pairValue.key++;
          this.pairValue.value++;
        })
      Text(`Multiple value: ${this.multipleValue}`)
      Button('Increase the multiple value')
        .onClick(() => {
          for (let index = 0; index < this.multipleValue.length; index++) {
            this.multipleValue[index]++;
          }
        })
    }
  }
}
// [End AddMonitorPath]

@Builder
export function addMonitorPath(): void {
  NavDestination() {
    Page();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.add_monitor_path_title'))
}