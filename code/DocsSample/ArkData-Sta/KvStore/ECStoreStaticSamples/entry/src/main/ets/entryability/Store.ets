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
// [Start kvstore_Store]
import distributedKVStore from '@ohos.data.distributedKVStore';
import common from '@ohos.app.ability.common';

export class StoreInfo {
  public context: common.UIAbilityContext | null = null;
  public kvManagerConfig: distributedKVStore.KVManagerConfig | null = null;
  public storeId: string = '';
  public option: distributedKVStore.Options | null = null;
}

export class Store {
  async getKVStore(storeInfo: StoreInfo): Promise<distributedKVStore.SingleKVStore | null> {
    try {
      let kvManager = distributedKVStore.createKVManager(storeInfo.kvManagerConfig!);
      let store = await kvManager.getKVStore<distributedKVStore.SingleKVStore>(storeInfo.storeId!, storeInfo.option!);
      console.info('ECDB_Encry succeeded in getting KVStore: ' + storeInfo.storeId);
      return store;
    } catch (e) {
      console.error('An unexpected error occurred in getKVStore');
      return null;
    }
  }

  async putOnedata(kvStore: distributedKVStore.SingleKVStore | null): Promise<void> {
    if (kvStore !== null) {
      try {
        await kvStore.put('test_key', 'test_value');
        console.info('ECDB_Encry put success');
      } catch (e) {
        console.error('An unexpected error occurred in putOnedata');
      }
    }
  }

  async getDataNum(kvStore: distributedKVStore.SingleKVStore | null): Promise<void> {
    if (kvStore !== null) {
      try {
        let data = await kvStore.get('test_key');
        console.info('ECDB_Encry get success value : ' + data);
      } catch (e) {
        console.error('An unexpected error occurred in getDataNum');
      }
    }
  }

  async deleteOnedata(kvStore: distributedKVStore.SingleKVStore | null): Promise<void> {
    if (kvStore !== null) {
      try {
        await kvStore.delete('test_key');
        console.info('ECDB_Encry delete success');
      } catch (e) {
        console.error('An unexpected error occurred in deleteOnedata');
      }
    }
  }

  async updateOnedata(kvStore: distributedKVStore.SingleKVStore | null): Promise<void> {
    if (kvStore !== null) {
      try {
        await kvStore.put('test_key', 'updated_value');
        console.info('ECDB_Encry update success');
      } catch (e) {
        console.error('An unexpected error occurred in updateOnedata');
      }
    }
  }
}
// [End kvstore_Store]