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
// [Start kvstore_ECStoreManager]
import distributedKVStore from '@ohos.data.distributedKVStore';
import { Mover } from './Mover';
import { StoreInfo, Store } from './Store';
import { SecretStatus } from './SecretKeyObserver';

let store = new Store();
let appId: string = 'com.example.ecstoresamples';

export class ECStoreManager {
  config(cInfo: StoreInfo, other: StoreInfo): void {
    this.cInfo = cInfo;
    this.eInfo = other;
  }

  configDataMover(mover: Mover): void {
    this.mover = mover;
  }

  async getCurrentStore(screenStatus: number): Promise<distributedKVStore.SingleKVStore | null> {
    if (screenStatus === SecretStatus.UnLock) {
      try {
        this.eStore = await store.getKVStore(this.eInfo!);
      } catch (e) {
        console.error('Failed to GetKVStore');
      }
      if (this.needMove) {
        if (this.eStore !== null && this.cStore !== null) {
          await this.mover!.move(this.eStore!, this.cStore!);
          console.info('ECDB_Encry cstore data move to estore success');
        }
        this.deleteCStore();
        this.needMove = false;
      }
      return this.eStore;
    } else {
      this.needMove = true;
      try {
        this.cStore = await store.getKVStore(this.cInfo!);
      } catch (e) {
        console.error('Failed to GetKVStore');
      }
      return this.cStore;
    }
  }

  closeEStore(): void {
    this.eStore = null;
  }

  async deleteCStore(): Promise<void> {
    if (this.cInfo === null) {
      return;
    }
    try {
      let kvManager = distributedKVStore.createKVManager(this.cInfo!.kvManagerConfig!);
      await kvManager.deleteKVStore(appId, this.cInfo!.storeId!);
      console.info('Succeeded in deleting KVStore');
    } catch (e) {
      console.error('Failed to delete KVStore');
    }
  }

  private eStore: distributedKVStore.SingleKVStore | null = null;
  private cStore: distributedKVStore.SingleKVStore | null = null;
  private cInfo: StoreInfo | null = null;
  private eInfo: StoreInfo | null = null;
  private needMove: boolean = false;
  private mover: Mover | null = null;
}
// [End kvstore_ECStoreManager]