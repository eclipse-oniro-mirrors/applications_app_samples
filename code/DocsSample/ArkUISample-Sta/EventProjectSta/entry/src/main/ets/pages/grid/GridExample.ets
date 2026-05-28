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

//[Start gridExample_start]
import { Color, Column, ColumnOptions, CommonMethod, Component, CustomStyles, DragItemInfo, Entry, ForEach, Grid, GridItem, Margin, State } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct GridEts {
  @State pixmap: image.PixelMap | undefined = undefined;
  @State numbers: Array<int> = new Array<int>();
  @State isSelectedGrid: Array<boolean> = new Array<boolean>();
  @State previewData: Array<DragItemInfo> = new Array<DragItemInfo>();
  @State numberBadge: int = 0;

  normalStyles: CustomStyles = (instance: CommonMethod): void => {
    instance.opacity(1.0);
  }

  selectStyles: CustomStyles = (instance: CommonMethod): void => {
    instance.opacity(0.4);
  }

  onPageShow(): void {
    let i: int = 0;
    for(i = 0; i < 100; i++) {
      this.numbers.push(i);
      this.isSelectedGrid.push(false);
      this.previewData.push({} as DragItemInfo);
    }
  }

  @Builder
  RandomBuilder(idx: int) {
    Column()
      .backgroundColor(Color.Blue)
      .width(50)
      .height(50)
      .opacity(1.0)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Grid() {
        ForEach(this.numbers, (idx: int, index: int) => {
          GridItem() {
            Column()
              .backgroundColor(Color.Blue)
              .width(50)
              .height(50)
              .opacity(1.0)
              .id('grid' + idx)
          }
          .dragPreview(this.previewData[idx])
          .selectable(true)
          .selected(this.isSelectedGrid[idx])
          // 设置多选显示效果
          .stateStyles({
            normal: this.normalStyles,
            selected: this.selectStyles
          })
          .onClick(() => {
            this.isSelectedGrid[idx] = !this.isSelectedGrid[idx];
            if (this.isSelectedGrid[idx]) {
              this.numberBadge++;
              let gridItemName = 'grid' + idx;
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
          })
          // 使能多选拖拽，右上角数量角标需要应用设置numberBadge参数
          .dragPreviewOptions({ numberBadge: this.numberBadge },
            { isMultiSelectionEnabled: true, defaultAnimationBeforeLifting: true })
          .onDragStart(() => {
            return {} as DragItemInfo;
          })
        }, (idx: int, index: int) => idx.toString())
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(5)
      .rowsGap(10)
      .backgroundColor(0xFAEEE0)
    }.width('100%').margin({ top: 5 } as Margin)
  }
}

//[End gridExample_start]
