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

import {
  $r,
  BarStyle,
  BlurStyle,
  Button,
  Color,
  Column,
  ColumnOptions,
  CommonMethod,
  Component,
  Consume,
  CustomStyles,
  DragEvent,
  DragInteractionOptions,
  DragItemInfo,
  DragPreviewOptions,
  Entry,
  ForEach,
  Grid,
  GridItem,
  Margin,
  NavDestination,
  NavPathStack,
  PreDragStatus,
  State,
  dragController
} from '@kit.ArkUI';
import { unifiedDataChannel as UDC } from '@kit.ArkData';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';

export const gridRoutePrefix: string = 'gridExample';

@Entry
@Component
export struct GridNav {
  @Consume pathStack: NavPathStack;
  @State pixmap: image.PixelMap | undefined = undefined;
  @State numbers: Array<int> = new Array<int>();
  @State isSelectedGrid: Array<boolean> = new Array<boolean>();
  @State previewData: Array<DragItemInfo> = new Array<DragItemInfo>();
  @State numberBadge: int = 0;
  unifiedData: UDC.UnifiedData | undefined = undefined;
  timeout: int = 1;
  finished: boolean = false;
  dragEvent: DragEvent | undefined;
  normalStyles: CustomStyles = (instance: CommonMethod): void => {
    instance.opacity(1.0);
  }
  selectStyles: CustomStyles = (instance: CommonMethod): void => {
    instance.opacity(0.4);
  }

  aboutToAppear(): void {
    if (this.numbers.length > 0) {
      return;
    }
    for (let i: int = 0; i < 500; i++) {
      this.numbers.push(i);
      this.isSelectedGrid.push(false);
      this.previewData.push({} as DragItemInfo);
    }
  }

  loadData(): void {
    this.timeout = setTimeout(() => {
      if (this.dragEvent) {
        this.dragEvent!.setData(this.unifiedData as UDC.UnifiedData);
      }
      this.getUIContext().getDragController().notifyDragStartRequest(dragController.DragStartRequestStatus.READY);
      this.finished = true;
    }, 4000);
  }

  @Builder
  RandomBuilder(idx: int): void {
    Column()
      .backgroundColor(Color.Blue)
      .width(50)
      .height(50)
      .opacity(1.0)
  }

  build(): void {
    NavDestination() {
      Column({ space: 5 } as ColumnOptions) {
        Button($r('app.string.Select_All'))
          .onClick(() => {
            for (let i: int = 0; i < this.isSelectedGrid.length; i++) {
              if (this.isSelectedGrid[i] === false) {
                this.numberBadge++;
                this.isSelectedGrid[i] = true;
                let data: UDC.Image = new UDC.Image();
                data.uri = '/resource/image.jpeg';
                if (!this.unifiedData) {
                  this.unifiedData = new UDC.UnifiedData(data);
                }
                this.unifiedData!.addRecord(data);
                let gridItemName: string = 'grid' + i;
                this.getUIContext()
                  .getComponentSnapshot()
                  .get(gridItemName, (error: BusinessError | null, pixmap: image.PixelMap | undefined) => {
                    this.pixmap = pixmap;
                    this.previewData[i] = {
                      pixelMap: this.pixmap
                    };
                  });
              }
            }
          })
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
            .dragPreviewOptions({ numberBadge: this.numberBadge } as DragPreviewOptions,
              { isMultiSelectionEnabled: true, defaultAnimationBeforeLifting: true } as DragInteractionOptions)
            .selectable(true)
            .selected(this.isSelectedGrid[idx])
            .stateStyles({
              normal: this.normalStyles,
              selected: this.selectStyles
            })
            .onClick(() => {
              this.isSelectedGrid[idx] = !this.isSelectedGrid[idx];
              if (this.isSelectedGrid[idx]) {
                let data: UDC.Image = new UDC.Image();
                data.uri = '/resource/image.jpeg';
                if (!this.unifiedData) {
                  this.unifiedData = new UDC.UnifiedData(data);
                }
                this.unifiedData!.addRecord(data);
                this.numberBadge++;
                let gridItemName: string = 'grid' + idx;
                this.getUIContext()
                  .getComponentSnapshot()
                  .get(gridItemName, (error: BusinessError | null, pixmap: image.PixelMap | undefined) => {
                    this.pixmap = pixmap;
                    this.previewData[idx] = {
                      pixelMap: this.pixmap
                    };
                  });
              } else {
                this.numberBadge--;
                for (let i: int = 0; i < this.isSelectedGrid.length; i++) {
                  if (this.isSelectedGrid[i] === true) {
                    let data: UDC.Image = new UDC.Image();
                    data.uri = '/resource/image.jpeg';
                    if (!this.unifiedData) {
                      this.unifiedData = new UDC.UnifiedData(data);
                    }
                    this.unifiedData!.addRecord(data);
                  }
                }
              }
            })
            .onPreDrag((status: PreDragStatus) => {
              if (status == PreDragStatus.PREPARING_FOR_DRAG_DETECTION) {
                this.loadData();
              } else if (status == PreDragStatus.ACTION_CANCELED_BEFORE_DRAG) {
                clearTimeout(this.timeout);
              }
            })
            .onDragStart((event: DragEvent) => {
              this.dragEvent = event;
              if (this.finished == false) {
                this.getUIContext()
                  .getDragController()
                  .notifyDragStartRequest(dragController.DragStartRequestStatus.WAITING);
              } else {
                event.setData(this.unifiedData as UDC.UnifiedData);
              }
              return {} as DragItemInfo;
            })
            .onDragEnd(() => {
              this.finished = false;
            })
          }, (idx: int, index: int) => idx.toString())
        }
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(10)
        .backgroundColor(0xFAEEE0)
      }
      .width('100%')
      .margin({ top: 5 } as Margin)
    }
    .backgroundColor('#f1f3f5')
    .title('', {
      backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
      barStyle: BarStyle.STACK
    })
    .title($r('app.string.Pages_Index_GridExample'))
  }
}
