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
// [Start reusable_waterflow_scene]
// 复用组件
@ReusableV2
@ComponentV2
struct ReusableV2FlowItem {
  // 接收外部传入的序号
  @Param item: number = 0;

  build() {
    Column() {
      // 显示瀑布流子项序号
      Text('N' + this.item)
        .fontSize(24)
        .height(26)
        .margin(10)
      // 开发者可自行替换显示图片的内容，此处以app.media.startIcon为例
      Image($r('app.media.startIcon'))
        .objectFit(ImageFit.Cover)
        .width(50)
        .height(50)
    }
  }
}

@Entry
@ComponentV2
struct ReusableWaterFlowScene {
  // 流式布局子项最小尺寸
  @Local minSize: number = 50;
  // 流式布局子项最大尺寸
  @Local maxSize: number = 80;
  // 瀑布流滚动控制器
  scroller: Scroller = new Scroller();
  // 瀑布流数据源
  @Local dataSource: number[] = [];
  private itemWidthArray: number[] = [];
  private itemHeightArray: number[] = [];

  // 计算flow item宽/高
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize);
    return (ret > this.minSize ? ret : this.minSize);
  }

  // 保存flow item宽/高
  getItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemWidthArray.push(this.getSize());
      this.itemHeightArray.push(this.getSize());
    }
  }

  // 初始化瀑布流数据
  aboutToAppear() {
    for (let i = 0; i <= 60; i++) {
      this.dataSource.push(i);
    }
    this.getItemSizeArray();
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column({ space: 2 }) {
        // 点击按钮回到瀑布流顶部
        Button('back top')
          .height('5%')
          .onClick(() => {
            // 点击后回到顶部
            this.scroller.scrollEdge(Edge.Top);
          })
        WaterFlow({ scroller: this.scroller }) {
          // 使用Repeat的virtualScroll模式配合WaterFlow实现懒加载
          Repeat(this.dataSource)
            .virtualScroll()
            .each((ri) => {
              FlowItem() {
                ReusableV2FlowItem({ item: ri.item })
              }
              .onAppear(() => {
                // 滚动到底部时加载更多数据
                if (ri.item + 20 == this.dataSource.length) {
                  for (let i = 0; i < 50; i++) {
                    this.dataSource.splice(this.dataSource.length, 0, this.dataSource.length);
                  }
                }
              })
            })
        }
        .margin({ left: 160, top: 10 })
      }
    }
  }
}

// [End reusable_waterflow_scene]
