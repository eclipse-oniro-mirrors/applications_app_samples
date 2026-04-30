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

import { AppStorage } from '@ohos.arkui.stateManagement';
import common from "@ohos.app.ability.common";
import distributedKVStore from '@ohos.data.distributedKVStore.d.ets';
import { BusinessError } from '@kit.BasicServicesKit';
import { distributedDeviceManager } from '@kit.DistributedServiceKit';
import Logger from '../common/Logger';

let kvManager: distributedKVStore.KVManager | undefined = undefined;
let kvStore: distributedKVStore.SingleKVStore | undefined = undefined;
let appId: string = 'com.example.kvstoresamples';
let storeId: string = 'storeId';
let context: common.UIAbilityContext | undefined = undefined;

export class KvInterface {
  public CreateKvManager: () => void = (() => {
    Logger.info('CreateKvManager start');
    if (typeof (kvManager) === 'undefined') {
      let ctx = AppStorage.get<common.UIAbilityContext>("abilityContext");
      if (ctx !== undefined) {
        context = ctx;
      } else {
        Logger.error('CreateKvManager: context is undefined from AppStorage');
        return;
      }
      const kvManagerConfig: distributedKVStore.KVManagerConfig = {
        bundleName: appId,
        context: context!
      };
      try {
        kvManager = distributedKVStore.createKVManager(kvManagerConfig);
        Logger.info('Succeeded in creating KVManager.');
      } catch (err) {
        Logger.error(`Failed to create KVManager. Code:${err.code},message:${err.message}`);
      }
    } else {
      Logger.info('KVManager has created');
    }
  });

  public GetKvStore: () => void = (() => {
    Logger.info('GetKvStore start');
    if (kvManager === undefined) {
      Logger.info('KvManager not initialized');
      return;
    }
    try {
      let child1 = new distributedKVStore.FieldNode('id');
      child1.type = distributedKVStore.ValueType.LONG;
      child1.nullable = false;
      child1.defaultValue = '1';
      let child2 = new distributedKVStore.FieldNode('name');
      child2.type = distributedKVStore.ValueType.STRING;
      child2.nullable = false;
      child2.defaultValue = 'zhangsan';

      let schema = new distributedKVStore.Schema();
      schema.root.appendChild(child1);
      schema.root.appendChild(child2);
      schema.indexes = ['$.id', '$.name'];
      schema.mode = 1;
      schema.skip = 0;

      const options: distributedKVStore.Options = {
        createIfMissing: true,
        encrypt: true,
        backup: false,
        autoSync: false,
        kvStoreType: distributedKVStore.KVStoreType.SINGLE_VERSION,
        schema: schema,
        securityLevel: distributedKVStore.SecurityLevel.S3
      };
      kvManager!.getKVStore(storeId, options, (err: BusinessError | null, store: distributedKVStore.SingleKVStore | undefined): void => {
        if (err !== null) {
          Logger.error(`Failed to get KVStore: Code:${err.code},message:${err.message}`);
          return;
        }
        Logger.info('Succeeded in getting KVStore.');
        kvStore = store;
      });
    } catch (e) {
      let error = e as BusinessError;
      Logger.error(`An unexpected error occurred. Code:${error.code},message:${error.message}`);
    }
  });

  public Put: () => void = (() => {
    Logger.info('Put start');
    if (kvStore === undefined) {
      Logger.info('Put: kvStore not initialized');
      return;
    }
    const KEY_TEST_STRING_ELEMENT = 'key_test_string';
    const VALUE_TEST_STRING_ELEMENT = '{"id":0, "name":"lisi"}';
    try {
      kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, (err: BusinessError | null): void => {
        if (err !== null) {
          Logger.error(`Failed to put data. Code:${err.code},message:${err.message}`);
          return;
        }
        Logger.info('Succeeded in putting data.');
      });
    } catch (e) {
      let error = e as BusinessError;
      Logger.error(`An unexpected error occurred. Code:${error.code},message:${error.message}`);
    }
  });

  public Get: () => void = (() => {
    Logger.info('Get start');
    if (kvStore === undefined) {
      Logger.info('Get: kvStore not initialized');
      return;
    }
    const KEY_TEST_STRING_ELEMENT = 'key_test_string';
    try {
      kvStore!.get(KEY_TEST_STRING_ELEMENT, (err: BusinessError | null, data: boolean | string | long | double | Uint8Array | undefined): void => {
        if (err !== null) {
          Logger.error(`Failed to get data. Code:${err.code},message:${err.message}`);
          return;
        }
        Logger.info(`Succeeded in getting data. Data:${data}`);
      });
    } catch (e) {
      let error = e as BusinessError;
      Logger.error(`Failed to get data. Code:${error.code},message:${error.message}`);
    }
  });

  public Delete: () => void = (() => {
    Logger.info('DeleteData start');
    if (kvStore === undefined) {
      Logger.info('DeleteData: kvStore not initialized');
      return;
    }
    const KEY_TEST_STRING_ELEMENT = 'key_test_string';
    try {
      kvStore!.delete(KEY_TEST_STRING_ELEMENT, (err: BusinessError | null): void => {
        if (err !== null) {
          Logger.error(`Failed to delete.code is ${err.code}, message is ${err.message}`);
          return;
        }
        Logger.info('Succeeded in deleting data.');
      });
    } catch (e) {
      let error = e as BusinessError;
      Logger.error(`An unexpected error occurred. Code:${error.code},message:${error.message}`);
    }
  });

  public Backup: () => void = (() => {
    Logger.info('Backup start');
    if (kvStore === undefined) {
      Logger.info('Backup: kvStore not initialized');
      return;
    }
    let backupFile = 'BK001';
    try {
      kvStore!.backup(backupFile, (err: BusinessError | null): void => {
        if (err !== null) {
          Logger.error(`Fail to backup data.code:${err.code},message:${err.message}`);
        } else {
          Logger.info('Succeeded in backing up data.');
        }
      });
    } catch (e) {
      let error = e as BusinessError;
      Logger.error(`An unexpected error occurred. Code:${error.code},message:${error.message}`);
    }
  });

  public Restore: () => void = (() => {
    Logger.info('Restore start');
    if (kvStore === undefined) {
      Logger.info('Restore: kvStore not initialized');
      return;
    }
    let backupFile = 'BK001';
    try {
      kvStore!.restore(backupFile, (err: BusinessError | null): void => {
        if (err !== null) {
          Logger.error(`Fail to restore data. Code:${err.code},message:${err.message}`);
        } else {
          Logger.info('Succeeded in restoring data.');
        }
      });
    } catch (e) {
      let error = e as BusinessError;
      Logger.error(`An unexpected error occurred. Code:${error.code},message:${error.message}`);
    }
  });

  public DeleteBackup: () => void = (() => {
    Logger.info('DeleteBackup start');
    if (kvStore === undefined) {
      Logger.info('DeleteBackup: kvStore not initialized');
      return;
    }
    let backupFile = 'BK001';
    let files: Array<string> = [backupFile];
    try {
      kvStore!.deleteBackup(files, (err: BusinessError | null, data: Array<[string, int]> | undefined): void => {
        if (err !== null) {
          Logger.error(`Failed to delete Backup.code is ${err.code},message is ${err.message}`);
        } else {
          Logger.info(`Succeed in deleting Backup.data=${data}`);
        }
      });
    } catch (e) {
      let error = e as BusinessError;
      Logger.error(`An unexpected error occurred.code is ${error.code},message is ${error.message}`);
    }
  });

  public CloseKVStore: () => void = (() => {
    Logger.info('CloseKVStore start');
    if (kvManager === undefined) {
      Logger.info('KvManager not initialized');
      return;
    }
    try {
      kvStore = undefined;
      kvManager!.closeKVStore(appId, storeId, (err: BusinessError | null): void => {
        if (err !== null) {
          Logger.error(`Failed to close KVStore.code is ${err.code},message is ${err.message}`);
          return;
        }
        Logger.info('Succeeded in closing KVStore');
      });
    } catch (e) {
      let error = e as BusinessError;
      Logger.error(`An unexpected error occurred. Code:${error.code},message:${error.message}`);
    }
  });

  public DeleteKvStore: () => void = (() => {
    Logger.info('DeleteKvStore start');
    if (kvManager === undefined) {
      Logger.info('KvManager not initialized');
      return;
    }
    try {
      kvStore = undefined;
      kvManager!.deleteKVStore(appId, storeId, (err: BusinessError | null): void => {
        if (err !== null) {
          Logger.error(`Failed to delete KVStore.code is ${err.code},message is ${err.message}`);
          return;
        }
        Logger.info('Succeeded in deleting KVStore');
      });
    } catch (e) {
      let error = e as BusinessError;
      Logger.error(`An unexpected error occurred. Code:${error.code},message:${error.message}`);
    }
  });

  public On: () => void = (() => {
    Logger.info('On start');
    if (kvStore === undefined) {
      Logger.info('On: kvStore not initialized');
      return;
    }
    try {
      kvStore!.onDataChange(distributedKVStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data: distributedKVStore.ChangeNotification): void => {
        console.info(`dataChange callback call data: ${data}`);
      });
    } catch (e) {
      let error = e as BusinessError;
      Logger.error(`An unexpected error occurred. code:${error.code},message:${error.message}`);
    }
  });

  public Sync: () => void = (() => {
    Logger.info('Sync start');
    if (kvStore === undefined) {
      Logger.info('Sync: kvStore not initialized');
      return;
    }
    if (context === undefined) {
      Logger.info('Sync: context not initialized');
      return;
    }
    let devManager: distributedDeviceManager.DeviceManager;
    try {
      devManager = distributedDeviceManager.createDeviceManager(context!.applicationInfo.name);
      let deviceIds: string[] = [];
      if (devManager !== null) {
        let devices = devManager.getAvailableDeviceListSync();
        for (let i = 0; i < devices.length; i++) {
          deviceIds[i] = devices[i].networkId as string;
        }
      }
      if (deviceIds.length === 0) {
        Logger.info('Sync failed networkId is empty.');
        return;
      }
      try {
        kvStore!.sync(deviceIds, distributedKVStore.SyncMode.PUSH_PULL, 1000);
      } catch (e) {
        let error = e as BusinessError;
        Logger.error(`An unexpected error occurred. Code:${error.code},message:${error.message}`);
      }
    } catch (err) {
      let error = err as BusinessError;
      Logger.error('createDeviceManager errCode:' + error.code + ',errMessage:' + error.message);
    }
  });
}