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

// LazyForEach迁移Repeat示例：数据更新操作（迁移前）
// [Start lazyforeach_to_repeat_data_update_before]
import { hilog } from '@kit.PerformanceAnalysisKit';
// BasicDataSource代码见文档末尾BasicDataSource示例代码: string类型数组的BasicDataSource代码。
import { BasicDataSource } from './BasicDataSource';

const TAG = '[Sample_RenderingControl]';
const DOMAIN = 0xF811;

export class MyDataSource extends BasicDataSource {
  private dataArray: string[] = [];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): string {
    return this.dataArray[index];
  }

  // 添加数据
  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  // 删除数据
  public deleteData(index: number): void {
    this.dataArray.splice(index, 1);
    this.notifyDataDelete(index);
  }

  // 交换数据
  public moveData(from: number, to: number): void {
    let temp: string = this.dataArray[from];
    this.dataArray[from] = this.dataArray[to];
    this.dataArray[to] = temp;
    this.notifyDataMove(from, to);
  }

  // 修改单个数据
  public changeData(index: number, data: string): void {
    this.dataArray.splice(index, 1, data);
    this.notifyDataChange(index);
  }

  // 修改多个数据
  public modifyAllData(): void {
    this.dataArray = this.dataArray.map((item: string) => {
      return 'Changed ' + item;
    });
    this.notifyDataReload();
  }
}

@Entry
@Component
export struct MyComponent {
  private data: MyDataSource = new MyDataSource();
  private count: number = 0;

  aboutToAppear() {
    for (let i = 0; i <= 10; i++) {
      this.data.pushData(`Hello ${i}`);
    }
  }

  build() {
    Column({ space: 3 }) {
      // 点击追加子组件
      Button('Add new item')
        .onClick(() => {
          this.data.pushData(`New item ${this.count++}`);
        })
      // 点击删除子组件
      Button('Delete item 0')
        .onClick(() => {
          this.data.deleteData(0);
        })
      // 点击交换子组件
      Button('Swap item 0 and item 1')
        .onClick(() => {
          this.data.moveData(0, 1);
        })
      // 点击修改单个子组件
      Button('Change item 0')
        .onClick(() => {
          this.data.changeData(0, `Changed item ${this.count++}`);
        })
      // 点击修改多个子组件
      Button('Change all items')
        .onClick(() => {
          this.data.modifyAllData();
        })
      List({ space: 3 }) {
        LazyForEach(this.data, (item: string) => {
          ListItem() {
            Row() {
              Text(item).fontSize(25)
            }
          }
        }, (item: string) => item)
      }.cachedCount(5)
    }
  }
}
// [End lazyforeach_to_repeat_data_update_before]
