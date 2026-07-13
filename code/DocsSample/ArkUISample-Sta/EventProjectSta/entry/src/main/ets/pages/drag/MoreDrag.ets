'use static'

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

// [Start more_drag]
import { $r, AnimateParam, Color, Column, ColumnOptions, CommonMethod, Component, CustomStyles, Entry, FlexAlign, Grid, GridItem, Image, NavDestination, PlayMode, State, Text, Visibility, DragItemInfo, ForEach, Margin, Padding, Button, Flex, FlexOptions } from '@kit.ArkUI';
import { KeyCode } from '@kit.InputKit';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
export struct MoreDrag {
  @State pixmap: image.PixelMap | undefined = undefined;
  @State numbers: Array<int> = new Array<int>();
  @State isSelectedGrid: Array<boolean> = new Array<boolean>();
  @State previewData: Array<DragItemInfo> = new Array<DragItemInfo>();
  @State colors: Array<Color> =
    [Color.Red, Color.Blue, Color.Brown, Color.Gray, Color.Green, Color.Grey, Color.Orange, Color.Pink, Color.Yellow];
  @State numberBadge: int = 0;

  normalStyles: CustomStyles = (instance: CommonMethod): void => {
    instance.opacity(1.0);
  }

  selectStyles: CustomStyles = (instance: CommonMethod): void => {
    instance.opacity(0.4);
  }

  aboutToAppear(): void {
    let i: int = 0;
    for (i = 0; i < 100; i++) {
      this.numbers.push(i);
      this.isSelectedGrid.push(false);
      this.previewData.push({});
    }
  }

  @Builder
  RandomBuilder(idx: int): void {
    Column()
      .backgroundColor(this.colors[idx % 9])
      .width(50)
      .height(50)
      .opacity(1.0)
  }

  build(): void {
    NavDestination() {
      Column({ space: 12 } as ColumnOptions) {

        Column({ space: 5 } as ColumnOptions) {
          // [Start create_grid_item_module]
          Grid() {
            ForEach(this.numbers, (idx: int, index: int) => {
              GridItem() {
                Column()
                  .backgroundColor(this.colors[idx % 9])
                  .width(50)
                  .height(50)
                  .opacity(1.0)
                  .id(('grid' + idx) as string)
              }
              // [StartExclude create_grid_item_module]
              .dragPreview(this.previewData[idx])
              .selectable(true)
              .selected(this.isSelectedGrid[idx])
              // 设置多选显示效果
              .stateStyles({
                normal: this.normalStyles,
                selected: this.selectStyles
              })
              // [Start grid_item_module_selected_true]
              .onClick(() => {
                this.isSelectedGrid[idx] = !this.isSelectedGrid[idx];
                // [StartExclude grid_item_module_selected_true]
                if (this.isSelectedGrid[idx]) {
                  this.numberBadge++;
                  let gridItemName: string = 'grid' + idx;
                  // 选中状态下提前调用componentSnapshot中的get接口获取pixmap
                  this.getUIContext().getComponentSnapshot().get(gridItemName, (error: BusinessError | null, pixmap: image.PixelMap | undefined) => {
                    this.pixmap = pixmap;
                    this.previewData[idx] = {
                      pixelMap: this.pixmap
                    };
                  });
                } else {
                  this.numberBadge--;
                }
                // [EndExclude grid_item_module_selected_true]
              })
              // [End grid_item_module_selected_true]
              // 使能多选拖拽，右上角数量角标需要应用设置numberBadge参数
              // [EndExclude create_grid_item_module]
              // [Start drag_preview_options]
              .dragPreviewOptions({ numberBadge: this.numberBadge },
                { isMultiSelectionEnabled: true, defaultAnimationBeforeLifting: true })
              // [End drag_preview_options]
              .onDragStart(() => {
                return {} as DragItemInfo;
              })
            }, (idx: int) => idx.toString())
          }
          // [End create_grid_item_module]
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .columnsGap(5)
          .rowsGap(10)
          .backgroundColor(0xFAEEE0)
        }.width('100%').margin({ top: 5 } as Margin)

      }
      .width('100%')
      .height('100%')
      .padding({ left: 12, right: 12 } as Padding)
    }
    .backgroundColor('#f1f2f3')
    // 请将$r('app.string.Drag_MoreDrag_title')替换为实际资源文件，在本示例中该资源文件的value值为"多选拖拽"
    .title($r('app.string.Drag_MoreDrag_title'))
  }
}
// [End more_drag]