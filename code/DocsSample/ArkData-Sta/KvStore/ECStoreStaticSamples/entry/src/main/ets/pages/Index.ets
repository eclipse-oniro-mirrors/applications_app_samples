'use static'
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { Entry, Component, State, Row, Column, Button, Text, FontWeight, ClickEvent } from '@kit.ArkUI';
import { storeManager, e_secretKeyObserver } from '../entryability/EntryAbility';
import distributedKVStore from '@ohos.data.distributedKVStore.d.ets';
import { Store } from '../entryability/Store';

let storeOption = new Store();
let lockStatus: Double = 1;

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  handleLockUnlock(): void {
    if (lockStatus !== 0) {
      e_secretKeyObserver.onLock();
      lockStatus = 0;
    } else {
      e_secretKeyObserver.onUnLock();
      lockStatus = 1;
    }
    this.message = lockStatus !== 0 ? '解锁' : '加锁';
  }

  handleStoreType(): void {
    this.message = e_secretKeyObserver.getCurrentStatus() !== 0 ? 'estore' : 'cstore';
  }

  build() {
    Row() {
      Column() {
        Button('加锁/解锁').onClick((event: ClickEvent) => {
          this.handleLockUnlock();
        }).margin(5)
          .width(100) // 宽度，单位默认vp（可视像素）
          .height(40) // 高度

        Button('StoreType')
          .onClick((event: ClickEvent): void => {
            this.handleStoreType();
          }).margin(5)
          .width(100)
          .height(40)

        Button('Put')
          .onClick((event: ClickEvent): void => {
            this.doPut();
          }).margin(5)
          .width(100)
          .height(40)

        Button('Get')
          .onClick((event: ClickEvent): void => {
            this.doGet();
          }).margin(5)
          .width(100)
          .height(40)

        Button('Delete')
          .onClick((event: ClickEvent): void => {
            this.doDelete();
          }).margin(5)
          .width(100)
          .height(40)

        Button('Update')
          .onClick((event: ClickEvent): void => {
            this.doUpdate();
          }).margin(5)
          .width(100)
          .height(40)

        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }

  async doPut(): Promise<void> {
    let store: distributedKVStore.SingleKVStore | null = await storeManager.getCurrentStore(e_secretKeyObserver.getCurrentStatus());
    if (store !== null) {
      storeOption.putOnedata(store);
    }
  }

  async doGet(): Promise<void> {
    let store: distributedKVStore.SingleKVStore | null = await storeManager.getCurrentStore(e_secretKeyObserver.getCurrentStatus());
    if (store !== null) {
      storeOption.getDataNum(store);
    }
  }

  async doDelete(): Promise<void> {
    let store: distributedKVStore.SingleKVStore | null = await storeManager.getCurrentStore(e_secretKeyObserver.getCurrentStatus());
    if (store !== null) {
      storeOption.deleteOnedata(store);
    }
  }

  async doUpdate(): Promise<void> {
    let store: distributedKVStore.SingleKVStore | null = await storeManager.getCurrentStore(e_secretKeyObserver.getCurrentStatus());
    if (store !== null) {
      storeOption.updateOnedata(store);
    }
  }
}