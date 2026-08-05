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

// LazyForEach迁移Repeat示例：组件复用（迁移前）
// [Start lazyforeach_to_repeat_reuse_before]
import { hilog } from '@kit.PerformanceAnalysisKit';
// GenericBasicDataSource代码见文档末尾GenericBasicDataSource示例代码。
import { GenericBasicDataSource } from './GenericBasicDataSource';
const TAG = '[Sample_RenderingControl]';
const DOMAIN = 0xF811;

export class StringData {
  public message: string;

  constructor(message: string) {
    this.message = message;
  }
}

export class MyDataSource extends GenericBasicDataSource<StringData> {
  private dataArray: StringData[] = [];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): StringData {
    return this.dataArray[index];
  }

  public pushData(data: StringData): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}

@Entry
@Component
export struct MyComponent {
  private data: MyDataSource = new MyDataSource();

  aboutToAppear() {
    for (let i = 0; i <= 30; i++) {
      this.data.pushData(new StringData(`Hello${i}`));
    }
  }

  build() {
    List({ space: 3 }) {
      LazyForEach(this.data, (item: StringData, index: number) => {
        ListItem() {
          ChildComponent({ data: item })
            .onAppear(() => {
              hilog.info(DOMAIN, TAG, `onAppear: ${item.message}`);
            })
        }
      }, (item: StringData, index: number) => index.toString())
    }.cachedCount(5)
  }
}

@Reusable
@Component
export struct ChildComponent {
  @State data: StringData = new StringData('');

  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, `aboutToAppear: ${this.data.message}`);
  }

  aboutToRecycle(): void {
    hilog.info(DOMAIN, TAG, `aboutToRecycle: ${this.data.message}`);
  }

  // 对复用的组件进行数据更新
  aboutToReuse(params: Record<string, ESObject>): void {
    this.data = params.data as StringData;
    hilog.info(DOMAIN, TAG, `aboutToReuse: ${this.data.message}`);
  }

  build() {
    Row() {
      Text(this.data.message).fontSize(50)
    }
  }
}
// [End lazyforeach_to_repeat_reuse_before]
