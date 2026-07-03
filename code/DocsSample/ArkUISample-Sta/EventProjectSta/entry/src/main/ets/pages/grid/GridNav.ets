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
  Observed,
  dragController
} from '@kit.ArkUI';
import { unifiedDataChannel as UDC } from '@kit.ArkData';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';

export const gridRoutePrefix: string = 'gridExample';

@Observed
export class GridItemInfo {
  id: int;
  isSelected: boolean;
  previewData: DragItemInfo;

  constructor(id: int, isSelected: boolean, previewData: DragItemInfo) {
    this.id = id;
    this.isSelected = isSelected;
    this.previewData = previewData;
  }
}

@Entry
@Component
export struct GridNav {
  @Consume pathStack: NavPathStack;
  @State pixmap: image.PixelMap | undefined = undefined;
  @State gridItemInfoList: Array<GridItemInfo> = new Array<GridItemInfo>();
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
    if (this.gridItemInfoList.length > 0) {
      return;
    }
    let gridItemInfoList: Array<GridItemInfo> = new Array<GridItemInfo>();
    for (let i: int = 0; i < 500; i++) {
      gridItemInfoList.push(new GridItemInfo(i, false, {} as DragItemInfo));
    }
    this.gridItemInfoList = gridItemInfoList;
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
            for (let i: int = 0; i < this.gridItemInfoList.length; i++) {
              if (this.gridItemInfoList[i].isSelected === false) {
                this.numberBadge++;
                this.gridItemInfoList[i].isSelected = true;
                let data: UDC.Image = new UDC.Image();
                data.uri = '/resource/image.jpeg';
                if (!this.unifiedData) {
                  this.unifiedData = new UDC.UnifiedData(data);
                }
                this.unifiedData!.addRecord(data);
                let gridItemName: string = 'grid' + this.gridItemInfoList[i].id;
                this.getUIContext()
                  .getComponentSnapshot()
                  .get(gridItemName, (error: BusinessError | null, pixmap: image.PixelMap | undefined) => {
                    this.pixmap = pixmap;
                    this.gridItemInfoList[i].previewData = {
                      pixelMap: this.pixmap
                    };
                  });
              }
            }
          })
        Grid() {
          ForEach(this.gridItemInfoList, (gridItemInfo: GridItemInfo, index: int) => {
            GridItem() {
              Column()
                .backgroundColor(Color.Blue)
                .width(50)
                .height(50)
                .opacity(1.0)
                .id('grid' + gridItemInfo.id)
            }
            .dragPreview(gridItemInfo.previewData)
            .dragPreviewOptions({ numberBadge: this.numberBadge } as DragPreviewOptions,
              { isMultiSelectionEnabled: true, defaultAnimationBeforeLifting: true } as DragInteractionOptions)
            .selectable(true)
            .selected(gridItemInfo.isSelected)
            .stateStyles({
              normal: this.normalStyles,
              selected: this.selectStyles
            })
            .onClick(() => {
              this.gridItemInfoList[index].isSelected = !this.gridItemInfoList[index].isSelected;
              if (this.gridItemInfoList[index].isSelected) {
                let data: UDC.Image = new UDC.Image();
                data.uri = '/resource/image.jpeg';
                if (!this.unifiedData) {
                  this.unifiedData = new UDC.UnifiedData(data);
                }
                this.unifiedData!.addRecord(data);
                this.numberBadge++;
                let gridItemName: string = 'grid' + gridItemInfo.id;
                this.getUIContext()
                  .getComponentSnapshot()
                  .get(gridItemName, (error: BusinessError | null, pixmap: image.PixelMap | undefined) => {
                    this.pixmap = pixmap;
                    this.gridItemInfoList[index].previewData = {
                      pixelMap: this.pixmap
                    };
                  });
              } else {
                this.numberBadge--;
                for (let i: int = 0; i < this.gridItemInfoList.length; i++) {
                  if (this.gridItemInfoList[i].isSelected === true) {
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
          }, (gridItemInfo: GridItemInfo, index: int) => gridItemInfo.id.toString())
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
