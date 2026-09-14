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

// LazyForEach迁移Repeat示例：模板渲染（使用Repeat自身的模板渲染能力）
// [Start lazyforeach_to_repeat_template_self]
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

@Entry
@ComponentV2
export struct MyComponent {
  @Local data: StringData[] = [];

  aboutToAppear() {
    for (let i = 0; i <= 200; i++) {
      this.data.push(new StringData(`Hello${i}`, i % 2));
    }
  }

  build() {
    List({ space: 3 }) {
      Repeat(this.data)
        .each((repeatItem) => {
          ListItem() {
            Text('Default item')
          }
        })
        .template('A', (repeatItem) => { // 模板A
          ListItem() {
            Row() {
              Text(repeatItem.item.message).fontSize(50)
              Button('Type A')
            }
          }
        })
        .template('B', (repeatItem) => { // 模板B
          ListItem() {
            Row() {
              Text(repeatItem.item.message).fontSize(50).fontColor(Color.Gray)
              Text('Type B')
            }
          }
        })
        .templateId((item: StringData) => { // 为不同的数据项选择不同的模板
          if (item.getType() == 0) {
            return 'A';
          } else {
            return 'B';
          }
        })
        .key((item: StringData, index: number) => index.toString())
        .virtualScroll()
    }.cachedCount(5)
  }
}
// [End lazyforeach_to_repeat_template_self]
