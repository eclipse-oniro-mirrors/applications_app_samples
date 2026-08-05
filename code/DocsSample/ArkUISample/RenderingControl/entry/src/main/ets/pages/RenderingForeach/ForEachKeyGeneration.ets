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

// [Start foreach_key_generation]
interface ChildItemType {
  str: string;
  num: number;
}

@Entry
@Component
export struct ForEachKeyGeneration {
  @State simpleList: Array<ChildItemType> = [
    { str: 'one', num: 1 },
    { str: 'two', num: 2 },
    { str: 'three', num: 3 }
  ];

  build() {
    Row() {
      Column() {
        ForEach(this.simpleList, (item: ChildItemType, index: number) => {
          ChildItem({ str: item.str, num: index }) // 组件生成函数中使用index参数
        }, (item: ChildItemType, index: number) => {
          return item.str; // 建议在键值生成函数中使用与UI界面相关的数据属性str
        })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
    .backgroundColor(0xF1F3F5)
  }
}

@Component
export struct ChildItem {
  @Prop str: string = '';
  @Prop num: number = 0;

  build() {
    Text(this.str)
      .fontSize(50)
  }
}
// [End foreach_key_generation]
