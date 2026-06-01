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
// [Start reusable_v2_lazy_foreach_usage]
import { IDataSource, DataChangeListener, DataOperation, ObservedV2, Trace, Entry, ComponentV2, List, LazyForEach, Button, ListItem, Column, Text, ReusableV2, Row, Param, Require } from '@kit.ArkUI';

export class BasicDataSource<StringData> implements IDataSource<StringData> {
  private listeners: Array<DataChangeListener> = [];
  private originDataArray: StringData[] = [];

  public totalCount(): int {
    return this.originDataArray.length;
  }

  public getData(index: int): StringData {
    return this.originDataArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  notifyDataAdd(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  notifyDataChange(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  notifyDataDelete(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  notifyDataMove(from: int, to: int): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }

  notifyDatasetChange(operations: Array<DataOperation>): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    });
  }
}

export class StringDataSource extends BasicDataSource<StringData> {
  dataArray: Array<StringData> = [];

  public totalCount(): int {
    return this.dataArray.length;
  }

  public getData(index: int): StringData {
    return this.dataArray[index];
  }

  public addData(index: int, data: StringData): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public pushData(data: StringData): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  public reloadData(): void {
    this.notifyDataReload();
  }
}

@ObservedV2
export class StringData {
  @Trace message: string;
  constructor(message: string) {
    this.message = message;
  }
}

@Entry
@ComponentV2
struct ReusableV2LazyForEachUsageExample {
  data: StringDataSource = new StringDataSource();

  aboutToAppear() {
    for (let i = 0; i <= 200; i++) {
      this.data.pushData(new StringData('Hello' + i));
    }
  }
  build() {
    List({ space: 3 }) {
      LazyForEach(this.data, (item: StringData, index: int) => {
        ListItem() {
          Column() {
            Text(item.message)
            ChildComponent({ data: item.message })
            Button('change message')
              .onClick(() => {
                item.message += '!'; // message为@Trace装饰的变量，可观察变化
              })
          }
        }
      })
    }.cachedCount(5)
  }
}

@ReusableV2
@ComponentV2
struct ChildComponent {
  @Param @Require data: string;
  aboutToAppear(): void {
    console.info('ChildComponent aboutToAppear', this.data);
  }
  aboutToDisappear(): void {
    console.info('ChildComponent aboutToDisappear', this.data);
  }
  aboutToReuse(): void {
    console.info('ChildComponent aboutToReuse', this.data); // 复用时触发
  }
  aboutToRecycle(): void {
    console.info('ChildComponent aboutToRecycle', this.data); // 回收时触发
  }
  build() {
    Row() {
      Text(this.data).fontSize(50)
    }
  }
}
// [End reusable_v2_lazy_foreach_usage]

@Builder
export function reusableV2LazyForEachUsage(): void {
  NavDestination() {
    ReusableV2LazyForEachUsageExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.reusable_v2_lazy_foreach_usage_title'))
}
