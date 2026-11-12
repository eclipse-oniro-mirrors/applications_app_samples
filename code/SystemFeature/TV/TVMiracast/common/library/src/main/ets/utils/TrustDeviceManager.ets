/*
 * Copyright (C) 2026 HiHope Open Source Organization.
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

import { TrustDeviceInfo } from './ConfigData';
import { Log } from './Log';
import { BusinessError } from '@kit.BasicServicesKit';
import { relationalStore } from '@kit.ArkData';

const TAG = 'TrustDeviceManager';

export class TrustDeviceManager {
  private static manager: TrustDeviceManager | null = null;
  private SQL_NAME: string = 'MiraCast.db';
  private TABLE_NAME: string = 'TrustDevice';
  private store: relationalStore.RdbStore | undefined = undefined;

  static getIns(): TrustDeviceManager {
    if (!TrustDeviceManager.manager) {
      TrustDeviceManager.manager = new TrustDeviceManager();
    }
    return TrustDeviceManager.manager;
  }

  init(context: Context) {
    Log.info(TAG, 'init');
    const STORE_CONFIG: relationalStore.StoreConfig = {
      name: this.SQL_NAME,
      securityLevel: relationalStore.SecurityLevel.S1
    };

    relationalStore.getRdbStore(context, STORE_CONFIG, (err: BusinessError, rdbStore: relationalStore.RdbStore) => {
      this.store = rdbStore;
      if (err) {
        Log.error(TAG, `Get RdbStore failed, code is ${err.code},message is ${err.message}`);
        return;
      }
      Log.info(TAG, 'Get RdbStore successfully.');
      this.createTable();
    });
  }

  private createTable() {
    const SQL_CREATE_TABLE =
      `CREATE TABLE IF NOT EXISTS ${this.TABLE_NAME} (_ID INTEGER PRIMARY KEY AUTOINCREMENT, ID TEXT, NAME TEXT, TYPE INT, DATE TEXT)`;

    this.store?.executeSql(SQL_CREATE_TABLE)
      .then(() => {
        Log.info(TAG, `Create Table success`);
      })
      .catch((err: BusinessError) => {
        Log.error(TAG, `Create Table failed, code is ${err.code},message is ${err.message}`);
      });
  }

  isStoreReady(): boolean {
    return this.store !== undefined;
  }

  isDeviceTrusted(deviceId: string): boolean {
    Log.debug(TAG, 'isDeviceTrusted, deviceId:' + deviceId);
    if (!this.store) {
      Log.error(TAG, 'store not created!');
      return false;
    }
    let predicates = new relationalStore.RdbPredicates(this.TABLE_NAME);
    predicates.equalTo('ID', deviceId);
    let result = this.store.querySync(predicates, ['ID']);
    Log.debug(TAG, 'device record rowCount:' + result.rowCount);
    return result.rowCount > 0;
  }

  getAllDeviceDataList(): Promise<Array<TrustDeviceInfo>> {
    Log.info(TAG, 'getAllDeviceDataList');
    return new Promise((resolve, reject) => {
      let predicates = new relationalStore.RdbPredicates(this.TABLE_NAME);
      this.store?.query(predicates)
        .then((resultSet: relationalStore.ResultSet) => {
          Log.info(TAG, `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          let res: TrustDeviceInfo[] = [];
          while (resultSet.goToNextRow()) {
            let item: TrustDeviceInfo = {
              id: resultSet.getString(resultSet.getColumnIndex('ID')),
              name: resultSet.getString(resultSet.getColumnIndex('NAME')),
              type: resultSet.getLong(resultSet.getColumnIndex('TYPE')),
              date: this.timestampToDate(resultSet.getString(resultSet.getColumnIndex('DATE')))
            }
            Log.info(TAG, `Query success, ${JSON.stringify(item)}`);
            res.push(item);
          }
          resultSet.close();
          resolve(res);
        })
        .catch((err: BusinessError) => {
          Log.error(TAG, `Query failed, code is ${err.code},message is ${err.message}`);
          reject();
        });
    });
  }

  private timestampToDate(timestamp: string) {
    const date = new Date();
    date.setTime(Number.parseInt(timestamp));
    return date;
  }

  deleteDeviceDataItem(id: string): Promise<void> {
    Log.info(TAG, 'deleteDeviceDataItem');
    return new Promise((resolve, reject) => {
      let predicates = new relationalStore.RdbPredicates(this.TABLE_NAME);
      predicates.equalTo('ID', id);

      this.store?.delete(predicates)
        .then((rows: number) => {
          Log.info(TAG, `Delete is successful, rows: ${rows}`);
          resolve();
        })
        .catch((err: BusinessError) => {
          Log.error(TAG, `Delete failed, code is ${err.code},message is ${err.message}`);
          reject();
        });
    });
  }

  addDeviceDataItem(item: TrustDeviceInfo): Promise<void> {
    Log.info(TAG, `addDeviceDataItem, item = ${JSON.stringify(item)}`);
    return new Promise((resolve, reject) => {
      let valueBucket1: relationalStore.ValuesBucket = {
        'ID': item.id,
        'NAME': item.name,
        'TYPE': item.type,
        'DATE': item.date.getTime() + '',
      };
      this.getAllDeviceDataList().then((data: Array<TrustDeviceInfo>) => {
        if (data.findIndex(x => x.id == item.id) == -1) {
          this.store?.insert(this.TABLE_NAME, valueBucket1).then((rowId: number) => {
            Log.info(TAG, `Insert is successful, rowId = ${rowId}`);
            resolve();
          }).catch((err: BusinessError) => {
            Log.error(TAG, `Insert is failed, code is ${err.code},message is ${err.message}`);
            reject();
          });
        } else {
          Log.info(TAG, `The id(${item.id}) has exist`);
          reject();
        }
      });
    });
  }
}
