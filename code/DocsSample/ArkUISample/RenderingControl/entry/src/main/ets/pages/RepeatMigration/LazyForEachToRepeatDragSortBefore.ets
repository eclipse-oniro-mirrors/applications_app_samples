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

// LazyForEach迁移Repeat示例：拖拽排序（迁移前）
// [Start lazyforeach_to_repeat_drag_sort_before]
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

  public moveDataWithoutNotify(from: number, to: number): void {
    let tmp = this.dataArray.splice(from, 1);
    this.dataArray.splice(to, 0, tmp[0]);
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}

@Entry
@Component
export struct Parent {
  private data: MyDataSource = new MyDataSource();

  aboutToAppear(): void {
    for (let i = 0; i < 100; i++) {
      this.data.pushData(i.toString());
    }
  }

  build() {
    Row() {
      List() {
        LazyForEach(this.data, (item: string) => {
          ListItem() {
            Text(item)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .size({ height: 100, width: '100%' })
          }.margin(10)
          .borderRadius(10)
          .backgroundColor('#FFFFFFFF')
        }, (item: string) => item)
        .onMove((from: number, to: number) => { // 实现拖拽排序
          this.data.moveDataWithoutNotify(from, to);
        })
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#FFDCDCDC')
    }
  }
}
// [End lazyforeach_to_repeat_drag_sort_before]
