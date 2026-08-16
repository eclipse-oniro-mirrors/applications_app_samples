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

// LazyForEach迁移Repeat示例：状态管理V2观测组件外部输入
// [Start lazyforeach_to_repeat_external_input]
@ObservedV2
export class StringData {
  @Trace public message: string;

  constructor(message: string) {
    this.message = message;
  }
}

@Entry
@ComponentV2
export struct MyComponent {
  @Local data: StringData[] = [];

  aboutToAppear() {
    for (let i = 0; i <= 20; i++) {
      this.data.push(new StringData(`Hello ${i}`));
    }
  }

  build() {
    List({ space: 3 }) {
      Repeat(this.data)
        .each((repeatItem) => {
          ListItem() {
            ChildComponent({ data: repeatItem.item.message }) // 向自定义组件内传入变量
              .onClick(() => {
                repeatItem.item.message += '!';
              })
          }
        })
        .key((item: StringData, index: number) => index.toString())
        .virtualScroll()
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
// [End lazyforeach_to_repeat_external_input]
