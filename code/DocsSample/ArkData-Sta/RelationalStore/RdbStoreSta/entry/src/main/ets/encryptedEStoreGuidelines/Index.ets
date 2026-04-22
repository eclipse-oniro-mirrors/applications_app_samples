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

// [Start rdb_encryptedEStoreGuidelines_index]
import {
  Entry,
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ClickEvent,
  FontWeight,
  AlignRuleOption,
  VerticalAlign,
  HorizontalAlign,
  ButtonType,
  State,
  UIContext,
  Row
} from '@kit.ArkUI'
import { storeManager, e_secretKeyObserver } from '../entryability/EntryAbility';
import { relationalStore } from '@kit.ArkData';
import { Store } from './Store';

let storeOption = new Store();
let lockStatus: number = 1;

async function putData() {
  let store: relationalStore.RdbStore | null =
    await storeManager.getCurrentStore(e_secretKeyObserver.getCurrentStatus());
  storeOption.putOnedata(store!);
}

async function getData() {
  let store: relationalStore.RdbStore | null =
    await storeManager.getCurrentStore(e_secretKeyObserver.getCurrentStatus());
  storeOption.getDataNum(store!);
}

async function deleteData() {
  let store: relationalStore.RdbStore | null =
    await storeManager.getCurrentStore(e_secretKeyObserver.getCurrentStatus());
  storeOption.deleteAlldata(store!);
}

async function updateData() {
  let store: relationalStore.RdbStore | null =
    await storeManager.getCurrentStore(e_secretKeyObserver.getCurrentStatus());
  storeOption.updateOnedata(store!);
}
@Entry
@Component
struct Index {
  @State message: string = '';

  build() {
    Row() {
      Column() {
        Button('加锁/解锁')
          .onClick((event: ClickEvent) => {
            if (lockStatus) {
              e_secretKeyObserver.onLock();
              lockStatus = 0;
            } else {
              e_secretKeyObserver.onUnLock();
              lockStatus = 1;
            }
            lockStatus ? this.message = '解锁' : this.message = '加锁';
          })
          .margin('5')
          .backgroundColor('#0D9FFB')
          .width('50%')
          .height('5%')
          .type(ButtonType.Capsule)

        Button('store type')
          .onClick(() => {
            e_secretKeyObserver.getCurrentStatus() ? this.message = 'estore' : this.message = 'cstore';
            console.info(`ECDB_Encry current store : ${this.message}`);
          })
          .margin('5')
          .backgroundColor('#0D9FFB')
          .width('50%')
          .height('5%')
          .type(ButtonType.Capsule)

        Button('put')
          .onClick(() => {
            putData();
          })
          .margin(5)
          .backgroundColor('#0D9FFB')
          .width('50%')
          .height('5%')
          .type(ButtonType.Capsule)

        Button('Get')
          .onClick(() => {
            getData();
          })
          .margin(5)
          .backgroundColor('#0D9FFB')
          .width('50%')
          .height('5%')
          .type(ButtonType.Capsule)

        Button('delete')
          .onClick(() => {
            deleteData();
          })
          .margin(5)
          .backgroundColor('#0D9FFB')
          .width('50%')
          .height('5%')
          .type(ButtonType.Capsule)

        Button('update')
          .onClick(() => {
            updateData();
          })
          .margin(5)
          .backgroundColor('#0D9FFB')
          .width('50%')
          .height('5%')
          .type(ButtonType.Capsule)

        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End rdb_encryptedEStoreGuidelines_index]