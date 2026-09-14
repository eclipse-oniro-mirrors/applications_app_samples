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

// [Start repeat_builder]
import { UIUtils, Binding } from '@kit.ArkUI';

@Entry
@ComponentV2
struct RepeatBuilderPage {
  @Local simpleList: Array<number> = [];

  aboutToAppear(): void {
    for (let i = 0; i < 100; i++) {
      this.simpleList.push(i);
    }
  }

  @Builder
  buildItem1(bindingData: Binding<number>) { // 使用Binding类/MutableBinding类接收传参，通过value属性访问值。
    Text('[Binding] item: ' + bindingData.value)
      .fontSize(20)
  }

  @Builder
  buildItem2(ri: RepeatItem<number>) {
    Text('[RepeatItem] item: ' + ri.item)
      .fontSize(20)
  }

  @Builder
  buildItem3(data: number) {
    Text('[number] item: ' + data)
      .fontSize(20).fontColor(Color.Red)
  }

  build() {
    Column({ space: 10 }) {
      List({ space: 20 }) {
        Repeat<number>(this.simpleList)
          .each((ri) => {
            ListItem() {
              Column({ space: 2 }) {
                // 使用UIUtils.makeBinding()函数实现@Builder函数中状态变量的刷新。
                this.buildItem1(UIUtils.makeBinding<number>(() => ri.item))
                // 按引用传递，状态变量的改变会引起@Builder函数内的UI刷新。
                this.buildItem2(ri)
                // 反例。按值传递，状态变量的改变不会引起@Builder函数内的UI刷新。
                this.buildItem3(ri.item)
              }
            }.border({ width: 1 })
          }).virtualScroll()
      }
      .cachedCount(1)
      .border({ width: 1 })
      .width('70%')
      .height('60%')
      .alignListItem(ListItemAlign.Center)

      Button('click to change data.').onClick(() => {
        this.simpleList[0] = 10000; // 修改第一项数据为10000。
      })
    }
    .width('100%').height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

// [End repeat_builder]