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
 * @file entry/src/main/ets/pages/universal/events/dragEventSample/component/ListItemDrag.ets
 * 文件职责：ListItemDrag 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ListItemDrag。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * ListItemDrag：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ListItemDrag {
  // @State numbers：组件内部状态
  @State numbers: string[] = ['one', 'two', 'three', 'four', 'five', 'six']
  // @State dragIndex：组件内部状态
  @State dragIndex: number = -1

  // 自定义拖拽过程中显示的内容
  @Builder pixelMapBuilder(item: string) {
    // Text：文本
    // 关键属性：宽度、高度、字号、圆角、文本对齐、背景色
    Text(item).id('list_item_drag_text_1')
      .width(400)
      .height(80)
      .fontSize(16)
      .borderRadius(10)
      .textAlign(TextAlign.Center)
      .backgroundColor(0xAFEEEE)
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
    // List：列表容器
    // 关键属性：宽度、高度、边框、内边距、分割线、onItemDragStart
    List({ space: 20 }) {
      ForEach(this.numbers, (item: string, index: number) => {
        // ListItem：列表项
        // 关键属性：可见性
        ListItem() {
          // Text：文本
          // 关键属性：宽度、高度、字号、圆角、文本对齐、背景色
          Text(item)
            .id('listItem' + index)
            .width('100%')
            .height(80)
            .fontSize(16)
            .borderRadius(10)
            .textAlign(TextAlign.Center)
            .backgroundColor(0xAFEEEE)
        }.id('list_item_drag_list_item_3')
        .visibility(this.dragIndex === index ? Visibility.Hidden : Visibility.Visible)
      }, (item: string) => item)
    }.id('list_item_drag_list_2')
    .width(400)
    .height(200)
    .border({ width: 1 })
    .padding(15)
    .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 })
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