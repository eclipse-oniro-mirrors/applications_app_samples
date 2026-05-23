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
// [Start MonitorObservedV2Class]
import { Button, Column, ComponentV2, Entry, IMonitor, Local, Monitor, ObservedV2, Text, Trace } from '@kit.ArkUI';

@ObservedV2
export class Info {
  @Trace name: string = 'Tom';
  @Trace region: string = 'North';
  @Trace job: string = 'Teacher';
  age: number = 25;
  // name被@Trace装饰，能够监听变化
  @Monitor(['name'])
  onNameChange(monitor: IMonitor): void {
    console.info(`name change from ${monitor.value<string>()?.before} to ${monitor.value<string>()?.now}`);
  }
  // age未被@Trace装饰，不能监听变化
  @Monitor(['age'])
  onAgeChange(monitor: IMonitor): void {
    console.info(`age change from ${monitor.value<number>()?.before} to ${monitor.value<number>()?.now}`);
  }
  // region与job均被@Trace装饰，能够监听变化
  @Monitor(['region', 'job'])
  onChange(monitor: IMonitor): void {
    monitor.dirty.forEach((path: string) => {
      console.info(`${path} change from ${monitor.value<string>(path)?.before} to ${monitor.value<string>(path)?.now}`);
    })
  }
}
@Entry
@ComponentV2
struct Index {
  info: Info = new Info();
  build() {
    Column() {
      Button('change name')
        .onClick((e) => {
          this.info.name = 'Jack'; // 能够触发onNameChange方法
        })
      Button('change age')
        .onClick((e) => {
          this.info.age = 26; // 不能够触发onAgeChange方法
        })
      Button('change region')
        .onClick((e) => {
          this.info.region = 'South'; // 能够触发onChange方法
        })
      Button('change job')
        .onClick((e) => {
          this.info.job = 'Driver'; // 能够触发onChange方法
        })
    }
  }
}

// [End MonitorObservedV2Class]

@Builder
export function monitorObservedV2Class(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.monitor_observed_v2_class_title'))
}