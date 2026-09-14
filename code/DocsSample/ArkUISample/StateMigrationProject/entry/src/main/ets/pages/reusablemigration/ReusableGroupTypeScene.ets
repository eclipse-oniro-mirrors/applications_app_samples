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
// [Start reusable_group_type_scene]
@Entry
@ComponentV2
struct MyComponentV2 {
  // 列表数据源
  private data: string[] = [];

  // 初始化列表数据
  aboutToAppear() {
    for (let i = 0; i < 1000; i++) {
      this.data.push(i.toString());
    }
  }

  // itemBuilderOne作为复用组件的写法未展示，以下为转为Builder之后的写法
  // 组合一：包含子组件A、B、C
  @Builder
  itemBuilderOne(item: string) {
    Column() {
      ChildComponentA({ item: item })
      ChildComponentB({ item: item })
      ChildComponentC({ item: item })
    }
  }

  // itemBuilderTwo转为Builder之后的写法
  // 组合二：包含子组件A、C、D
  @Builder
  itemBuilderTwo(item: string) {
    Column() {
      ChildComponentA({ item: item })
      ChildComponentC({ item: item })
      ChildComponentD({ item: item })
    }
  }

  // itemBuilderThree转为Builder之后的写法
  // 组合三：包含子组件A、B、D
  @Builder
  itemBuilderThree(item: string) {
    Column() {
      ChildComponentA({ item: item })
      ChildComponentB({ item: item })
      ChildComponentD({ item: item })
    }
  }

  build() {
    List({ space: 40 }) {
      Repeat(this.data)
        .virtualScroll()
        .each((ri) => {
          ListItem() {
            // 根据索引选择不同的组合型布局
            if (ri.index % 3 === 0) {
              this.itemBuilderOne(ri.item)
            } else if (ri.index % 5 === 0) {
              this.itemBuilderTwo(ri.item)
            } else {
              this.itemBuilderThree(ri.item)
            }
          }
        })
    }
    .width('100%')
    .height('100%')
    .cachedCount(0)
  }
}

// 复用组件A，包含文本和图片网格
@ReusableV2
@ComponentV2
struct ChildComponentA {
  // 接收外部传入的序号
  @Param item: string = '';

  // 组件复用时回调，如无需对状态变量做额外修改可移除
  aboutToReuse() {
    console.info(`ChildComponentA Reuse ${this.item}`);
  }

  // 组件被回收时回调
  aboutToRecycle(): void {
    console.info(`ChildComponentA ${this.item} Recycle`);
  }

  build() {
    Column() {
      // 显示组件标识文本
      Text(`Item ${this.item} Child Component A`)
        .fontSize(20)
        .margin({ left: 10 })
        .fontColor(Color.Blue)
      // 使用网格展示多张图片
      Grid() {
        ForEach((new Array(20)).fill(''), (item: string, index: number) => {
          GridItem() {
            // 开发者可自行替换显示图片的内容，此处以app.media.startIcon为例
            Image($r('app.media.startIcon'))
              .height(20)
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr') // 五列等宽布局
      .rowsTemplate('1fr 1fr 1fr 1fr') // 四行等高布局
      .columnsGap(10)
      .width('90%')
      .height(160)
    }
    .margin({ left: 10, right: 10 })
    .backgroundColor(0xFAEEE0)
  }
}

// 复用组件B，显示红色文本
@ReusableV2
@ComponentV2
struct ChildComponentB {
  // 接收外部传入的序号
  @Param item: string = '';

  build() {
    Row() {
      Text(`Item ${this.item} Child Component B`)
        .fontSize(20)
        .margin({ left: 10 })
        .fontColor(Color.Red)
    }
    .margin({ left: 10, right: 10 })
  }
}

// 复用组件C，显示绿色文本
@ReusableV2
@ComponentV2
struct ChildComponentC {
  // 接收外部传入的序号
  @Param item: string = '';

  build() {
    Row() {
      Text(`Item ${this.item} Child Component C`)
        .fontSize(20)
        .margin({ left: 10 })
        .fontColor(Color.Green)
    }
    .margin({ left: 10, right: 10 })
  }
}

// 复用组件D，显示橙色文本
@ReusableV2
@ComponentV2
struct ChildComponentD {
  // 接收外部传入的序号
  @Param item: string = '';

  build() {
    Row() {
      Text(`Item ${this.item} Child Component D`)
        .fontSize(20)
        .margin({ left: 10 })
        .fontColor(Color.Orange)
    }
    .margin({ left: 10, right: 10 })
  }
}

// [End reusable_group_type_scene]
