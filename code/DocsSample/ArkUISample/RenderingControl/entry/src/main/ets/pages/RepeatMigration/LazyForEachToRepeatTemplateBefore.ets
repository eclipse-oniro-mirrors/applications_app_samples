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

// LazyForEach迁移Repeat示例：模板渲染（迁移前）
// [Start lazyforeach_to_repeat_template_before]
import { hilog } from '@kit.PerformanceAnalysisKit';
// GenericBasicDataSource代码见文档末尾GenericBasicDataSource示例代码。
import { GenericBasicDataSource } from './GenericBasicDataSource';
const TAG = '[Sample_RenderingControl]';
const DOMAIN = 0xF811;

export class StringData {
  public message: string;
  public type: number;

  constructor(message: string, type: number) {
    this.message = message;
    this.type = type;
  }

  getType(): number {
    if (this.type >= 1) {
      return 1;
    } else {
      return 0;
    }
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
    for (let i = 0; i <= 200; i++) {
      this.data.pushData(new StringData(`Hello${i}`, i % 2));
    }
  }

  build() {
    List({ space: 3 }) {
      LazyForEach(this.data, (item: StringData, index: number) => {
        ListItem() {
          // 开发者自己实现逻辑判断，为不同的数据项选择不同的渲染模板
          if (item.getType() == 0) {
            // 模板A
            ChildComponentA({ data: item })
              .onAppear(() => {
                hilog.info(DOMAIN, TAG, `type A onAppear: ${item.message}`);
              })
          } else {
            // 模板B
            ChildComponentB({ data: item })
              .onAppear(() => {
                hilog.info(DOMAIN, TAG, `type B onAppear: ${item.message}`);
              })
          }
        }
      }, (item: StringData, index: number) => index.toString())
    }.cachedCount(5)
  }
}

// 使用@Reusable实现组件复用
@Reusable
@Component
export struct ChildComponentA {
  @State data: StringData = new StringData('', 0);

  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, `type A aboutToAppear: ${this.data.message}`);
  }

  aboutToRecycle(): void {
    hilog.info(DOMAIN, TAG, `type A aboutToRecycle: ${this.data.message}`);
  }

  aboutToReuse(params: Record<string, ESObject>): void {
    this.data = params.data as StringData;
    hilog.info(DOMAIN, TAG, `type A aboutToReuse: ${this.data.message}`);
  }

  build() {
    Row() {
      Text(this.data.message).fontSize(50)
      Button('Type A')
    }
  }
}

@Reusable
@Component
export struct ChildComponentB {
  @State data: StringData = new StringData('', 0);

  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, `type B aboutToAppear: ${this.data.message}`);
  }

  aboutToRecycle(): void {
    hilog.info(DOMAIN, TAG, `type B aboutToRecycle: ${this.data.message}`);
  }

  aboutToReuse(params: Record<string, ESObject>): void {
    this.data = params.data as StringData;
    hilog.info(DOMAIN, TAG, `type B aboutToReuse: ${this.data.message}`);
  }

  build() {
    Row() {
      Text(this.data.message).fontSize(50).fontColor(Color.Gray)
      Text('Type B')
    }
  }
}
// [End lazyforeach_to_repeat_template_before]
