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
// [Start reusable_repeat_scene]
@Entry
@ComponentV2
struct ReuseV2Demo {
  // 列表数据源
  private data: string[] = [];

  // 初始化列表数据
  aboutToAppear() {
    for (let i = 1; i < 1000; i++) {
      this.data.push(i + '');
    }
  }

  build() {
    Column() {
      List({ space: 10 }) {
        // 使用Repeat的virtualScroll模式实现懒加载，配合复用组件提升滚动性能
        Repeat(this.data)
          .virtualScroll()
          .each((ri) => {
            ListItem() {
              CardViewV2({ item: ri.item })
            }
          })
      }
      .width('100%')
      .height('100%')
      .padding(10)
    }
  }
}

// 复用组件
@ReusableV2
@ComponentV2
export struct CardViewV2 {
  // 使用@Param接收外部传入变量并观察变化
  @Param item: string = '';

  // Repeat自身能够进行复用，不会走到自定义组件复用的生命周期
  aboutToReuse(): void {
  }

  build() {
    Row() {
      // 显示当前列表项序号
      Text(`#${this.item}`)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      // 显示列表项内容
      Text(`Item ${this.item}`)
        .fontSize(18)
        .fontColor('#333333')
        .margin({ left: 10 })
    }
    .width('100%')
    .height(80)
    .padding({ left: 20, right: 20 })
    .borderRadius(12)
    .backgroundColor('#ffffff')
    .shadow({
      radius: 4,
      color: '#1a000000',
      offsetX: 0,
      offsetY: 2
    })
  }
}

// [End reusable_repeat_scene]
