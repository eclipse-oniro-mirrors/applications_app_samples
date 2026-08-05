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

// LazyForEach迁移Repeat示例：状态管理V2观测组件内部状态
// [Start lazyforeach_to_repeat_internal_state]
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
            Row() {
              Text(repeatItem.item.message).fontSize(50)
                .onClick(() => {
                  // 修改@ObservedV2装饰类中@Trace装饰的变量，触发刷新此处Text组件
                  repeatItem.item.message += '!';
                })
              ChildComponent()
            }
          }
        })
        .key((item: StringData, index: number) => index.toString())
        .virtualScroll()
    }.cachedCount(5)
  }
}

@ComponentV2
export struct ChildComponent {
  @Local message: string = '?';

  build() {
    Row() {
      Text(this.message).fontSize(50)
        .onClick(() => {
          // 修改@Local装饰的变量，触发刷新此处Text组件
          this.message += '?';
        })
    }
  }
}
// [End lazyforeach_to_repeat_internal_state]
