/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

/**
 * @file entry/src/main/ets/pages/universal/events/dragEventSample/component/GridItemDrag.ets
 * 文件职责：GridItemDrag 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：GridItemDrag。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * GridItemDrag：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct GridItemDrag {
  // @State numbers：组件内部状态
  @State numbers: string[] = new Array(15).fill('').map((item: string, i: number) => {
    return i.toString()
  });

  // @State dragIndex：组件内部状态
  @State dragIndex: number = -1;

  // 自定义拖拽过程中显示的内容
  /**
   * pixelMapBuilder：执行 pixelMapBuilder 相关逻辑。
   */
  @Builder
  pixelMapBuilder(item: string) {
    // Text：文本
    // 关键属性：字号、宽度、高度、背景色、文本对齐
    Text(item).id('grid_item_drag_text_1')
      .fontSize(16)
      .width(80)
      .height(60)
      .backgroundColor(0xF9CF93)
      .textAlign(TextAlign.Center)
  }

  /**
   * changeIndex：执行 changeIndex 相关逻辑。
   */
  changeIndex(index1: number, index2: number) {
    let temp = this.numbers[index1];
    this.numbers[index1] = this.numbers[index2];
    this.numbers[index2] = temp;
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Grid：网格容器
    // 关键属性：columnsTemplate、rowsTemplate、宽度、高度、editMode、onItemDragStart
    Grid() {
      ForEach(this.numbers, (item: string, index) => {
        // GridItem：网格项
        // 关键属性：可见性
        GridItem() {
          // Text：文本
          // 关键属性：字号、背景色、宽度、高度、文本对齐
          Text(item)
            .id('gridItem' + index)
            .fontSize(16)
            .backgroundColor(0xF9CF93)
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
        }.id('grid_item_drag_grid_item_3')
        .visibility(this.dragIndex === index ? Visibility.Hidden : Visibility.Visible)
      }, (item: string) => item)
    }.id('grid_item_drag_grid_2')
    .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
    .rowsTemplate('1fr 1fr 1fr')
    .width(400)
    .height(180)
    .editMode(true)
    .onItemDragStart((event: ItemDragInfo, itemIndex: number) => {
      this.dragIndex = itemIndex
      return this.pixelMapBuilder(this.numbers[itemIndex])
    })
    .onItemDrop((event: ItemDragInfo, itemIndex: number, insertIndex: number, isSuccess: boolean) => {
      if (isSuccess === true) {
        this.changeIndex(itemIndex, insertIndex)
      }
      this.dragIndex = -1
    })
  }
}