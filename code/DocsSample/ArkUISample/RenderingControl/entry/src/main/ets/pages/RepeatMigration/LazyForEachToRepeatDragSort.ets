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

// LazyForEach迁移Repeat示例：拖拽排序
// [Start lazyforeach_to_repeat_drag_sort]
@Entry
@ComponentV2
export struct Parent {
  @Local data: string[] = [];

  aboutToAppear(): void {
    for (let i = 0; i < 100; i++) {
      this.data.push(i.toString());
    }
  }

  moveData(from: number, to: number) {
    let tmp = this.data.splice(from, 1);
    this.data.splice(to, 0, tmp[0]);
  }

  build() {
    Row() {
      List() {
        Repeat(this.data)
          .each((repeatItem) => {
            ListItem() {
              Text(repeatItem.item.toString())
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .size({ height: 100, width: '100%' })
            }.margin(10)
            .borderRadius(10)
            .backgroundColor('#FFFFFFFF')
          })
          .key((item: string) => item)
          .virtualScroll()
          .onMove((from: number, to: number) => { // 实现拖拽排序
            this.moveData(from, to);
          })
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#FFDCDCDC')
    }
  }
}
// [End lazyforeach_to_repeat_drag_sort]
