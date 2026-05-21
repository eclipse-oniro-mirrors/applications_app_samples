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
// [Start MonitorArrayChange]
import { Button, Column, ComponentV2, Entry, IMonitor, Monitor, ObservedV2, Trace } from '@kit.ArkUI';

@ObservedV2
export class Info {
  @Trace name: string;
  @Trace age: number;
  
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}
@ObservedV2
export class ArrMonitor {
  @Trace dimensionTwo: number[][] = [[1,1,1],[2,2,2],[3,3,3]];
  @Trace dimensionThree: number[][][] = [[[1],[2],[3]],[[4],[5],[6]],[[7],[8],[9]]];
  @Trace infoArr: Info[] = [new Info('Jack', 24), new Info('Lucy', 18)];
  // dimensionTwo为二维简单类型数组，且被@Trace装饰，能够观测里面的元素变化
  @Monitor(['dimensionTwo.0.0', 'dimensionTwo.1.1'])
  onDimensionTwoChange(monitor: IMonitor): void {
    monitor.dirty.forEach((path: string) => {
      console.info(`dimensionTwo path: ${path} change from ${monitor.value<number>(path)?.before} to ${monitor.value<number>(path)?.now}`);
    })
  }
  // dimensionThree为三维简单类型数组，且被@Trace装饰，能够观测里面的元素变化
  @Monitor(['dimensionThree.0.0.0', 'dimensionThree.1.1.0'])
  onDimensionThreeChange(monitor: IMonitor): void {
    monitor.dirty.forEach((path: string) => {
      console.info(`dimensionThree path: ${path} change from ${monitor.value<number>(path)?.before} to ${monitor.value<number>(path)?.now}`);
    })
  }
  // Info类中属性name、age均被@Trace装饰，能够监听到变化
  @Monitor(['infoArr.0.name', 'infoArr.1.age'])
  onInfoArrPropertyChange(monitor: IMonitor): void {
    monitor.dirty.forEach((path: string) => {
      console.info(`infoArr path:${path} change from ${monitor.value<Any>(path)?.before} to ${monitor.value<Any>(path)?.now}`);
    })
  }
  // infoArr被@Trace装饰，能够监听到infoArr整体赋值的变化
  @Monitor(['infoArr'])
  onInfoArrChange(monitor: IMonitor): void {
    console.info('infoArr whole change');
  }
  // 能够监听到infoArr的长度变化
  @Monitor(['infoArr.length'])
  onInfoArrLengthChange(monitor: IMonitor): void {
    console.info('infoArr length change');
  }
}
@Entry
@ComponentV2
struct Index {
  arrMonitor: ArrMonitor = new ArrMonitor();
  build() {
    Column() {
      Button('Change dimensionTwo')
        .onClick((e) => {
          // 能够触发onDimensionTwoChange方法  
          this.arrMonitor.dimensionTwo[0][0]++; 
          this.arrMonitor.dimensionTwo[1][1]++; 
        })
      Button('Change dimensionThree')
        .onClick((e) => {
          // 能够触发onDimensionThreeChange方法
          this.arrMonitor.dimensionThree[0][0][0]++;
          this.arrMonitor.dimensionThree[1][1][0]++; 
        })
      Button('Change info property')
        .onClick((e) => {
          // 能够触发onInfoArrPropertyChange方法
          this.arrMonitor.infoArr[0].name = 'Tom'; 
          this.arrMonitor.infoArr[1].age = 19; 
        })
      Button('Change whole infoArr')
        .onClick((e) => {
          // 能够触发onInfoArrChange、onInfoArrPropertyChange、onInfoArrLengthChange方法
          this.arrMonitor.infoArr = [new Info('Cindy', 8)]; 
        })
      Button('Push new info to infoArr')
        .onClick((e) => {
          // 能够触发onInfoArrPropertyChange、onInfoArrLengthChange方法
          this.arrMonitor.infoArr.push(new Info('David', 50)); 
        })
    }
  }
}

// [End MonitorArrayChange]

@Builder
export function monitorArrayChange(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.monitor_array_change_title'))
}