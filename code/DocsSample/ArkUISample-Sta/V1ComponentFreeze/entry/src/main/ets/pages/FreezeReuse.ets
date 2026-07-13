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
// [Start FreezeReuse]
import { Button, ClickEvent, Color, Column, Component, DataChangeListener, Entry, ForEach, IDataSource, LazyForEach, Link, List, ListItem, Reusable, Row, State, Text, Watch } from '@kit.ArkUI';

@Reusable
@Component
struct ChildComponent {
  @Link @Watch('descChange') desc: string;
  @State item: string = '';
  @State index: number = 0;
  descChange(propertyName: string) {
    console.info(`ChildComponent messageChange ${this.desc} this.index: ${this.index}`);
  }

  getValue(): string {
    console.info(`Child getvalue,id: ${this.index}`);
    return this.desc;
  }

  aboutToRecycle(): void {
    console.info(`ChildComponent has been recycled`);
  }
  build() {
    Column() {
      Text(`ChildComponent index: ${this.index} item: ${this.item}`)
        .fontSize(20)
        .margin(10)
      Text(`desc: ${this.getValue()}`)
        .fontSize(20)
        .margin(10)
    }
      .border({width: 2, color: Color.Pink})
      .width('100%')
  }
}

@Entry
@Component
struct Page {
  @State desc: string = 'Hello World';
  private data: TestDataSource = new TestDataSource();

  aboutToAppear() {
    for (let i = 0; i < 50; i++) {
      this.data.pushData(`Hello ${i}`);
    }
  }

  build() {
    Column() {
      Button(`change desc`)
        .width(300)
        .margin(10)
        .onClick(() => {
          this.desc += '!';
        })
      List({ space: 3 }) {
        LazyForEach(this.data, (item: string, index: int) => {
          ListItem() {
            ChildComponent({index: index, item: item, desc: this.desc})
          }
        }, (item: string) => item)
      }
      .cachedCount(5) // 设置ListItem的缓存数量
    }
    .height('100%')
    .width('100%')
  }
}

class BasicDataSource<string> implements IDataSource<string> {
  private listeners: Array<DataChangeListener> = Array<DataChangeListener>();
  private originDataArray: Array<string> = new Array<string>();

  public totalCount(): int {
    return this.originDataArray.length;
  }

  public getData(index: int): string {
    return this.originDataArray[index as int];
  }

  notifyDataAdd(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    });
  }

  notifyDataChange(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    });
  }

  onDataReloaded(): void {
    this.listeners.forEach((listener: DataChangeListener) => {
      listener.onDataReloaded();
    });
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener)
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }
}

class TestDataSource extends BasicDataSource<string> {
  private dataArray: string[] = [];

  public totalCount(): int {
    return this.dataArray.length;
  }

  public getData(index: int): string {
    return this.dataArray[index as int];
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
  }

  public changeData(index: int, data: string): void {
    this.dataArray[index as int] = data;
    this.notifyDataChange(index);
  }
}
// [End FreezeReuse]

@Builder
export function freezeReuse(): void {
  NavDestination() {
    Page();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.freeze_reuse_title'))
}
