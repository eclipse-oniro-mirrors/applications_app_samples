'use static'
/*
 * Copyright (c) 2025 - 2026 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog'
import { Entry, Column, ColumnOptions, Row, RowOptions, Component, Button, ButtonType, FontWeight, FlexAlign, Margin } from '@ohos.arkui.component';
import { State} from '@ohos.arkui.stateManagement';
import { common } from '@kit.AbilityKit';

import { KvInterface } from './KvStoreInterface';

let kvStore: KvInterface = new KvInterface();

@Entry
@Component
struct Index {
  @State text: string = 'The green button calls the interface, and the blue button sets the properties.';
  @State encryptSelect:number = 0
  private encryptLst:string[] = ['false','true']

  build() {
    Column({space:2} as ColumnOptions) {
      Row({space:2} as RowOptions) {
        Button('CreateKvManager').fontSize(10).fontWeight(FontWeight.Normal).type(ButtonType.Capsule).margin({} as Margin).width('50%').height('100%')
          .onClick(() => {
            kvStore.CreateKvManager();
          })
        Button('GetKvStore').fontSize(10).fontWeight(FontWeight.Normal).type(ButtonType.Capsule).margin({} as Margin).width('50%').height('100%')
          .onClick(() => {
          kvStore.GetKvStore();
        })
      }
      .justifyContent(FlexAlign.Center)
      .width('99%')
      .height('6%')
      .margin({ bottom: 10 })

      Row({space:2} as RowOptions) {
        Button('Put').fontSize(10).fontWeight(FontWeight.Normal).type(ButtonType.Capsule).margin({} as Margin).width('50%').height('100%')
          .onClick(() => {
          kvStore.Put();
        })
        Button('Get').fontSize(10).fontWeight(FontWeight.Normal).type(ButtonType.Capsule).margin({} as Margin).width('50%').height('100%')
          .onClick(() => {
          kvStore.Get();
        })
      }
      .justifyContent(FlexAlign.Center)
      .width('99%')
      .height('6%')
      .margin({ bottom: 10 })

      Row({space:2} as RowOptions) {
        Button('Delete').fontSize(10).fontWeight(FontWeight.Normal).type(ButtonType.Capsule).margin({} as Margin).width('50%').height('100%')
          .onClick(() => {
          kvStore.Delete();
        })
        Button('Backup').fontSize(10).fontWeight(FontWeight.Normal).type(ButtonType.Capsule).margin({} as Margin).width('50%').height('100%')
          .onClick(() => {
          kvStore.Backup();
        })
      }
      .justifyContent(FlexAlign.Center)
      .width('99%')
      .height('6%')
      .margin({ bottom: 10 })

      Row({space:2} as RowOptions) {
        Button('Restore').fontSize(10).fontWeight(FontWeight.Normal).type(ButtonType.Capsule).margin({} as Margin).width('50%').height('100%')
          .onClick(() => {
          kvStore.Restore();
        })
        Button('DeleteBackup').fontSize(10).fontWeight(FontWeight.Normal).type(ButtonType.Capsule).margin({} as Margin).width('50%').height('100%')
          .onClick(() => {
          kvStore.DeleteBackup();
        })
      }
      .justifyContent(FlexAlign.Center)
      .width('99%')
      .height('6%')
      .margin({ bottom: 10 })

      Row({space:2} as RowOptions) {
        Button('CloseKvStore').fontSize(10).fontWeight(FontWeight.Normal).type(ButtonType.Capsule).margin({} as Margin).width('50%').height('100%')
          .onClick(() => {
          kvStore.CloseKVStore();
        })
        Button('DeleteKvStore').fontSize(10).fontWeight(FontWeight.Normal).type(ButtonType.Capsule).margin({} as Margin).width('50%').height('100%')
          .onClick(() => {
          kvStore.DeleteKvStore();
        })
      }
      .justifyContent(FlexAlign.Center)
      .width('99%')
      .height('6%')
      .margin({ bottom: 10 })

      Row({space:2} as RowOptions){
        Button('Sync').fontSize(10).fontWeight(FontWeight.Normal).type(ButtonType.Capsule).margin({} as Margin).width('50%').height('100%')
          .onClick(() => {
          kvStore.Sync();
        })
        Button('On').fontSize(10).fontWeight(FontWeight.Normal).type(ButtonType.Capsule).margin({} as Margin).width('50%').height('100%')
          .onClick(() => {
          kvStore.On();
        })
        Column().width('33%').height('100%')
      }
      .justifyContent(FlexAlign.Center)
      .width('99%')
      .height('6%')
      .margin({ bottom: 10 })
    }
    .justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
  }
}