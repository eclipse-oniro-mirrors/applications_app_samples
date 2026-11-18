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

// LazyForEach迁移Repeat示例：数据更新操作
// [Start lazyforeach_to_repeat_data_update]
@Entry
@ComponentV2
export struct MyComponent {
  @Local data: Array<string> = [];
  private count: number = 0;

  aboutToAppear() {
    for (let i = 0; i <= 10; i++) {
      this.data.push(`Hello ${i}`);
    }
  }

  build() {
    Column({ space: 3 }) {
      // 点击追加子组件
      Button('Add new item')
        .onClick(() => { this.data.push(`New item ${this.count++}`); })
      // 点击删除子组件
      Button('Delete item 0')
        .onClick(() => { this.data.splice(0, 1); })
      // 点击交换子组件
      Button('Swap item 0 and item 1')
        .onClick(() => {
          let temp: string = this.data[0];
          this.data[0] = this.data[1];
          this.data[1] = temp;
          })
      // 点击修改单个子组件
      Button('Change item 0')
        .onClick(() => { this.data.splice(0, 1, `Changed item ${this.count++}`); })
      // 点击修改多个子组件
      Button('Change all items')
        .onClick(() => { this.data = this.data.map((item: string) => { return 'Changed ' + item; }); })
      List({ space: 3 }) {
        Repeat(this.data)
          .each((repeatItem: RepeatItem<string>) => {
            ListItem() {
              Row() {
                Text(repeatItem.item).fontSize(25)
              }
            }
          })
          .key((item: string) => item)
          .virtualScroll()
      }.cachedCount(5)
    }
  }
}
// [End lazyforeach_to_repeat_data_update]
