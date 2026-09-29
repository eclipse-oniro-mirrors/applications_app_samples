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

// [Start top_level_collections_array]
import { PersistenceV2, UIUtils } from '@kit.ArkUI';
import { collections } from '@kit.ArkTS';

@Entry
@ComponentV2
struct Page1 {
  // 支持直接持久化collections.Array的类型
  @Local array: collections.Array<number> = PersistenceV2.globalConnect({
    // 定义持久化的数据类型
    type: collections.Array<number>,
    // 定义默认构造器，返回时需要调用makeObserved，才能实现自动持久化
    defaultCreator: () => UIUtils.makeObserved(new collections.Array<number>(2, 1))
  })!;
  // 基于collections.Array构建Repeat的数据源
  toArray<T>(array: collections.Array<T>): Array<T> {
    const result = new Array<T>();
    array.forEach((item: T) => result.push(item));
    return result;
  }

  build() {
    Column({ space: 10 }) {
      Column({ space: 0 }) {
        Repeat(this.toArray(this.array))
          .each(ri => {
            Row() {
              Text(`Item: `)
                .fontSize(20)
                .margin(10)
              Text(`${ri.item}`)
                .fontSize(20)
                .margin(10)
            }
          })
          .key((item: number, index: number) => `${index} - ${item}`)
      }
      Divider().width('100%')
      // 以下按钮依次演示对collections.Array的操作；数据已自动持久化，重启应用后保持当前数组状态
      // 点击后追加元素4，数组项变为：2, 1, 4
      Button('array.push(4)')
        .onClick(() => {
          this.array.push(4);
        })
        .width(300)
        .margin(10)
      // 点击后对数组升序排序，数组项变为：1, 2, 4
      Button('array.sort')
        .onClick(() => {
          this.array.sort((a, b) => a - b);
        })
        .width(300)
        .margin(10)
      // 点击后反转数组，数组项变为：4, 2, 1
      Button('array.reverse')
        .onClick(() => {
          this.array.reverse();
        })
        .width(300)
        .margin(10)
      // 点击后在索引1处插入元素9，数组项变为：4, 9, 2, 1
      Button('array.splice(1, 0, 9)')
        .onClick(() => {
          this.array.splice(1, 0, 9);
        })
        .width(300)
        .margin(10)
      // 点击后替换前两个元素为7和8，数组项变为：7, 8, 2, 1
      Button('array.splice(0, 2, 7, 8)')
        .onClick(() => {
          this.array.splice(0, 2, 7, 8);
        })
        .width(300)
        .margin(10)
      // 点击后移除末尾元素，数组项变为：7, 8, 2
      Button('array.pop()')
        .onClick(() => {
          this.array.pop();
        })
        .width(300)
        .margin(10)
      // 点击后清空数组，数组项为空
      Button('array.splice(0)')
        .onClick(() => {
          this.array.splice(0);
        })
        .width(300)
        .margin(10)
    }
    .width('100%')
  }
}
// [End top_level_collections_array]