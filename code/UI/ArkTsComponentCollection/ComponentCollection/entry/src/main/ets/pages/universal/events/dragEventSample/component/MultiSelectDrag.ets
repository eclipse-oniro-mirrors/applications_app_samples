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
 * @file entry/src/main/ets/pages/universal/events/dragEventSample/component/MultiSelectDrag.ets
 * 文件职责：MultiSelectDrag 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：MultiSelectDrag。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import componentSnapshot from '@ohos.arkui.componentSnapshot';
import image from '@ohos.multimedia.image';

/**
 * MultiSelectDrag：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct MultiSelectDrag {
  @Styles normalStyles() {
    .borderColor('#E5E5E1')
    .opacity(1.0)
  }

  @Styles selectStyles() {
    .borderColor('#ff1d0e04')
    .opacity(0.4)
  }

  // @State number1：组件内部状态
  @State number1: number[] = [0, 1, 2, 3, 4];

  // @State number2：组件内部状态
  @State number2: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8];

  // @State isSelectedGrid：组件内部状态
  @State isSelectedGrid: boolean[] = [false, false, false, false, false, false, false, false, false];

  // @State colors：组件内部状态
  @State colors: Color[] =
    [Color.Red, Color.Blue, Color.Brown, Color.Gray, Color.Green, Color.Gray, Color.Orange, Color.Pink, Color.Yellow];

  // @State previewData：组件内部状态
  @State previewData: DragItemInfo[] = [{}, {}, {}, {}, {}, {}, {}, {}, {}];

  // @State pixmap：组件内部状态
  @State pixmap: image.PixelMap | undefined = undefined;

  @Builder
  // MenuBuilder：MenuBuilder 自定义组件
  /**
   * MenuBuilder：执行 MenuBuilder 相关逻辑。
   */
  MenuBuilder() {
    // Flex：弹性布局容器
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      // Button：按钮
      // 关键属性：strokeWidth、外边距、color
      Button('Test ContextMenu1').id('multi_select_drag_button_3')
      // Divider：分割线
      // 关键属性：strokeWidth、外边距、color
      Divider().id('multi_select_drag_divider_4').strokeWidth(2).margin(5).color(Color.Black)
      // Button：按钮
      // 关键属性：strokeWidth、外边距、color
      Button('Test ContextMenu2').id('multi_select_drag_button_5')
      // Divider：分割线
      // 关键属性：strokeWidth、外边距、color
      Divider().id('multi_select_drag_divider_6').strokeWidth(2).margin(5).color(Color.Black)
      // Button：按钮
      Button('Test ContextMenu3').id('multi_select_drag_button_7')
    }.id('multi_select_drag_flex_2')
  }

  /**
   * createGrid：执行 createGrid 相关逻辑。
   */
  @Builder
  createGrid() {
    // Grid：网格容器
    // 关键属性：columnsTemplate、列间距、行间距、宽度、背景色
    Grid() {
      ForEach(this.number2, (index: number) => {
        // GridItem：网格项
        // 关键属性：selectable、选中状态、stateStyles
        GridItem() {
          // Column：垂直布局容器
          // 关键属性：背景色、宽度、高度、draggable
          Column()
            .backgroundColor(this.colors[index])
            .width('100%')
            .height(90)
            .draggable(false)
            .id(`gridItemId${index}`)
        }.id('multi_select_drag_grid_item_9')
        .selectable(true)
        .selected(this.isSelectedGrid[index])
        .stateStyles({
          normal: this.normalStyles,
          selected: this.selectStyles
        })
        .onClick(() => {
          this.isSelectedGrid[index] = !this.isSelectedGrid[index];
          if (!this.isSelectedGrid[index]) {
            componentSnapshot.get(`gridItemId${index}`, (error: Error, pixmap: image.PixelMap) => {
              this.pixmap = pixmap;
              this.previewData[index] = {
                pixelMap: this.pixmap
              };
            })
          }
        })
        .dragPreviewOptions({
          mode: [DragPreviewMode.ENABLE_DEFAULT_SHADOW, DragPreviewMode.ENABLE_DEFAULT_RADIUS]
        }, { isMultiSelectionEnabled: true, defaultAnimationBeforeLifting: true })
        .bindContextMenu(this.MenuBuilder, ResponseType.LongPress, { preview: MenuPreviewMode.NONE })
        .dragPreview(`gridItemId${index}`)
        .onDragStart(() => {

        })
      }, (index: string) => index)
    }.id('multi_select_drag_grid_8')
    .columnsTemplate('1fr 1fr 1fr')
    .columnsGap(10)
    .rowsGap(10)
    .width(290)
    .backgroundColor(0xFAEEE0)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度
    Column() {
      this.createGrid();
    }.id('multi_select_drag_column_10')
    .width('100%')
    .height(290)
  }
}