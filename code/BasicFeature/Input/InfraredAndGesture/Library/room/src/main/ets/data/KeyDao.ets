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

import { relationalStore } from '@kit.ArkData';
import { AppLogger } from 'common';
import { KeySemantic, RoomKey } from '../model/RoomTypes';
import { AppDatabase } from './AppDatabase';

const SCOPE: string = 'KeyDao';
const TABLE: string = 'key';
const COLUMNS: string[] = [
  'id', 'device_id', 'semantic', 'label', 'ir_code_id', 'sort_order'
];

/** Data access object for the key table (logical remote keys of devices). */
export class KeyDao {
  /** Inserts one key row. */
  static async insert(key: RoomKey): Promise<void> {
    const values: relationalStore.ValuesBucket = {
      'id': key.id,
      'device_id': key.deviceId,
      'semantic': key.semantic,
      'label': key.label,
      'ir_code_id': key.irCodeId,
      'sort_order': key.sortOrder
    };
    await AppDatabase.getStore().insert(TABLE, values);
    AppLogger.info(SCOPE, `insert: id=${key.id}, deviceId=${key.deviceId}, semantic=${key.semantic}`);
  }

  /** Updates the editable fields of an existing key row. */
  static async update(key: RoomKey): Promise<void> {
    const values: relationalStore.ValuesBucket = {
      'device_id': key.deviceId,
      'semantic': key.semantic,
      'label': key.label,
      'ir_code_id': key.irCodeId,
      'sort_order': key.sortOrder
    };
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('id', key.id);
    await AppDatabase.getStore().update(values, predicates);
    AppLogger.info(SCOPE, `update: id=${key.id}, irCodeId=${key.irCodeId}`);
  }

  /** Deletes one key row. */
  static async remove(keyId: string): Promise<void> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('id', keyId);
    await AppDatabase.getStore().delete(predicates);
    AppLogger.info(SCOPE, `remove: id=${keyId}`);
  }

  /** Fetches one key by id, or undefined when it does not exist. */
  static async get(keyId: string): Promise<RoomKey | undefined> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('id', keyId);
    const resultSet: relationalStore.ResultSet =
      await AppDatabase.getStore().query(predicates, COLUMNS);
    let key: RoomKey | undefined = undefined;
    if (resultSet.goToNextRow()) {
      key = KeyDao.fromRow(resultSet);
    }
    resultSet.close();
    return key;
  }

  /** Lists keys of one device ordered by sort order. */
  static async listByDevice(deviceId: string): Promise<RoomKey[]> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('device_id', deviceId);
    predicates.orderByAsc('sort_order');
    return KeyDao.queryList(predicates);
  }

  /** Lists all keys ordered by device then sort order. */
  static async listAll(): Promise<RoomKey[]> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.orderByAsc('device_id');
    predicates.orderByAsc('sort_order');
    return KeyDao.queryList(predicates);
  }

  /** Runs a query and maps every row to a RoomKey instance. */
  private static async queryList(predicates: relationalStore.RdbPredicates): Promise<RoomKey[]> {
    const resultSet: relationalStore.ResultSet =
      await AppDatabase.getStore().query(predicates, COLUMNS);
    const keys: RoomKey[] = [];
    while (resultSet.goToNextRow()) {
      keys.push(KeyDao.fromRow(resultSet));
    }
    resultSet.close();
    return keys;
  }

  /** Maps the current row of a result set to a RoomKey instance. */
  private static fromRow(resultSet: relationalStore.ResultSet): RoomKey {
    const key: RoomKey = new RoomKey();
    key.id = resultSet.getString(resultSet.getColumnIndex('id'));
    key.deviceId = resultSet.getString(resultSet.getColumnIndex('device_id'));
    key.semantic = resultSet.getString(resultSet.getColumnIndex('semantic')) as KeySemantic;
    key.label = resultSet.getString(resultSet.getColumnIndex('label'));
    key.irCodeId = resultSet.getString(resultSet.getColumnIndex('ir_code_id'));
    key.sortOrder = resultSet.getLong(resultSet.getColumnIndex('sort_order'));
    return key;
  }
}
