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

// LazyForEach迁移Repeat示例：状态管理V2观测组件外部输入（迁移前）
// [Start lazyforeach_to_repeat_external_input_before]
// GenericBasicDataSource代码见文档末尾GenericBasicDataSource示例代码。
import { GenericBasicDataSource } from './GenericBasicDataSource';

@ObservedV2
export class StringData {
  @Trace public message: string;

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
@ComponentV2
export struct MyComponent {
  private data: MyDataSource = new MyDataSource();

  aboutToAppear() {
    for (let i = 0; i <= 20; i++) {
      this.data.pushData(new StringData(`Hello ${i}`));
    }
  }

  build() {
    List({ space: 3 }) {
      LazyForEach(this.data, (item: StringData, index: number) => {
        ListItem() {
          ChildComponent({ data: item.message }) // 向自定义组件内传入变量
            .onClick(() => {
              item.message += '!';
            })
        }
      }, (item: StringData, index: number) => index.toString())
    }.cachedCount(5)
  }
}

@ComponentV2
export struct ChildComponent {
  @Param @Require data: string = ''; // 接收来自外部的变量

  build() {
    Row() {
      Text(this.data).fontSize(50)
    }
  }
}
// [End lazyforeach_to_repeat_external_input_before]
