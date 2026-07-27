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
  Alignment,
  Button,
  Component,
  DataChangeListener,
  Entry,
  IDataSource,
  LazyForEach,
  List,
  ListOptions,
  NavDestination,
  Row,
  RowOptions,
  Stack,
  StackOptions,
  State,
  Text,
  TextAlign,
  Watch,
  $r
} from '@kit.ArkUI';
import { LazyDynamicLayout } from '@ohos.arkui.components.ArkLazyDynamicLayout';
import { LazyWaterFlowLayoutAlgorithm } from './LazyWaterFlowLayoutAlgorithm';

export class BasicDataSource implements IDataSource<string> {
  private listeners: DataChangeListener[] = [];
  protected dataArray: Array<string> = new Array<string>();

  public totalCount(): int {
    return this.dataArray.length;
  }

  public getData(index: int): string {
    return this.dataArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos: int = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    });
  }

  notifyDataAdd(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    });
  }

  notifyDataDelete(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    });
  }
}

export class MyDataSource extends BasicDataSource {
  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}

@Component
export struct CustomLazyWaterFlowLayoutSample {
  @State @Watch('onColumnsChange') columns: int = 2;
  @State @Watch('onRowGapChange') rowGap: int = 5;
  @State @Watch('onColumnGapChange') columnGap: int = 5;
  private arr: MyDataSource = new MyDataSource();
  private lazyAlgorithm: LazyWaterFlowLayoutAlgorithm = new LazyWaterFlowLayoutAlgorithm(this.getUIContext());

  onColumnsChange(): void {
    this.lazyAlgorithm.setColumns(this.columns);
  }

  onRowGapChange(): void {
    this.lazyAlgorithm.setRowGap(this.getUIContext().vp2px(this.rowGap));
  }

  onColumnGapChange(): void {
    this.lazyAlgorithm.setColumnGap(this.getUIContext().vp2px(this.columnGap));
  }

  aboutToAppear(): void {
    this.lazyAlgorithm.setColumns(this.columns);
    this.lazyAlgorithm.setRowGap(this.getUIContext().vp2px(this.rowGap));
    this.lazyAlgorithm.setColumnGap(this.getUIContext().vp2px(this.columnGap));
    for (let i = 0; i < 50; i++) {
      this.arr.pushData(`Item ${i}`);
    }
  }

  build(): void {
    NavDestination() {
      Stack({ alignContent: Alignment.Bottom } as StackOptions) {
        List({} as ListOptions) {
          LazyDynamicLayout(this.lazyAlgorithm) {
            LazyForEach(this.arr, (item: string, index: int) => {
              Text(item)
                .height(60 + (index % 3) * 40)
                .width('100%')
                .borderRadius(8)
                .backgroundColor('#FFE0E0')
                .padding(10)
                .textAlign(TextAlign.Center)
            })
          }
          .width('100%')
          .onVisibleIndexesChange((child: Array<int>) => {
            console.info(`onVisibleIndexesChange: ${child}`);
          })
        }
        .width('100%')
        .height('100%')
        .padding({ left: 12, right: 12 })

        Row({ space: 10 } as RowOptions) {
          Button(`Columns: ${this.columns}`)
            .fontSize(12)
            .onClick(() => {
              this.columns = this.columns === 2 ? 3 : 2;
            })

          Button(`RowGap: ${this.rowGap}vp`)
            .fontSize(12)
            .onClick(() => {
              this.rowGap = this.rowGap === 5 ? 10 : 5;
            })

          Button(`ColGap: ${this.columnGap}vp`)
            .fontSize(12)
            .onClick(() => {
              this.columnGap = this.columnGap === 5 ? 10 : 5;
            })
        }
        .margin({ bottom: 20 })
      }
      .height('100%')
      .width('100%')
    }
    .backgroundColor('#f1f2f3')
    .title($r('app.string.customLazyWaterFlowLayout_title'))
  }
}
