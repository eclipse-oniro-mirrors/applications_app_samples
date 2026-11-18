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

// [Start repeat_key_generation]
@ObservedV2
class ExampleData {
  @Trace public str: string;
  public num: number;

  constructor(s: string, n: number) {
    this.str = s;
    this.num = n;
  }
}

@Entry
@ComponentV2
struct RepeatKeyGeneration {
  @Local exampleList: Array<ExampleData> = [];

  aboutToAppear(): void {
    for (let i = 0; i < 20; i++) {
      this.exampleList.push(new ExampleData(`data${i}`, i));
    }
  }

  build() {
    Column() {
      List({ space: 10 }) {
        Repeat(this.exampleList)
          .each((obj: RepeatItem<ExampleData>) => {
            ListItem() {
              Text(obj.item.str).fontSize(50)
            }
          })
          .key(item => item.str) // UI显示刷新与属性str相关，建议在键值生成函数中设置其为返回值，此处键值生成与index无关
      }
    }
  }
}
// [End repeat_key_generation]
