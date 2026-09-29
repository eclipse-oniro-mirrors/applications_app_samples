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

// [Start top_level_array_classa_apis]
import { PersistenceV2, UIUtils } from '@kit.ArkUI';

class ClassA {
  public propA: number = 0;

  public classAToString(): string {
    return this.propA?.toString()
  }
}

@Entry
@ComponentV2
struct Page1 {
  @Local arr: Array<ClassA> = PersistenceV2.globalConnect({
    type: Array<ClassA>,
    defaultCreator: () => {
      const arr = UIUtils.makeObserved(new Array<ClassA>());
      const item = new ClassA();
      item.propA = 2;
      arr.push(UIUtils.makeObserved(item));
      return arr;
    },
    // 添加defaultSubCreator，通知状态管理框架如何创建ClassA对象
    // 另外持久化后的数据需要加上makeObserved，否则会持久化失败
    defaultSubCreator: () => UIUtils.makeObserved(new ClassA())
  })!;

  build() {
    Column({ space: 10 }) {
      Column({ space: 0 }) {
        Repeat(this.arr)
          .each(ri => {
            Row() {
              Text(`Item: `)
                .fontSize(20)
                .margin(10)
              Text(ri.item?.classAToString ? ri.item?.classAToString() :
                `classAToString() missing from object, propA: ${ri.item?.propA}`)
                .fontSize(20)
                .margin(10)
            }
          })
          .key((item: ClassA, index: number) => `${index} - ${item?.propA}`)
      }
      .width('100%')

      Divider().width('100%')
      // 以下按钮依次演示对Array<ClassA>的操作；数据已自动持久化，重启应用后保持当前数组状态
      // 点击后追加元素(propA=1)，数组propA序列变为：2, 1
      Button('array.push(1)')
        .width(300)
        .margin(10)
        .onClick(() => {
          let temp = new ClassA();
          temp.propA = 1;
          this.arr.push(UIUtils.makeObserved(temp));
        })
      // 点击后按propA升序排序，数组propA序列变为：1, 2
      Button('array.sort')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.arr.sort((tempA, tempB) => tempA?.propA - tempB?.propA);
        })
      // 点击后反转数组，数组propA序列变为：2, 1
      Button('array.reverse')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.arr.reverse();
        })
      // 点击后在索引1处插入元素(propA=9)，数组propA序列变为：2, 9, 1
      Button('array.splice(1, 0, 9)')
        .width(300)
        .margin(10)
        .onClick(() => {
          let temp = new ClassA();
          temp.propA = 9;
          this.arr.splice(1, 0, UIUtils.makeObserved(temp));
        })
      // 点击后替换前两个元素(propA=7、8)，数组propA序列变为：7, 8, 1
      Button('array.splice(0, 2, 7, 8)')
        .width(300)
        .margin(10)
        .onClick(() => {
          let tempA = new ClassA();
          tempA.propA = 7;
          let tempB = new ClassA();
          tempB.propA = 8;
          this.arr.splice(0, 2, UIUtils.makeObserved(tempA), UIUtils.makeObserved(tempB));
        })
      // 点击后移除末尾元素，数组propA序列变为：7, 8
      Button('array.pop()')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.arr.pop();
        })
      // 点击后清空数组，数组为空
      Button('array.splice(0)')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.arr.splice(0);
        })
    }
    .width('100%')
  }
}
// [End top_level_array_classa_apis]