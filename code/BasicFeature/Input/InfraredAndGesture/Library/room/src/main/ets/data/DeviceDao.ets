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
import { Device, DeviceType } from '../model/RoomTypes';
import { AppDatabase } from './AppDatabase';

const SCOPE: string = 'DeviceDao';
const TABLE: string = 'device';
const COLUMNS: string[] = [
  'id', 'room_id', 'name', 'type', 'template_id', 'brand', 'model',
  'sort_order', 'created_at', 'updated_at'
];

/**
 * Data access object for the device table and its dependent rows (keys,
 * expected states, scene steps) that are cleaned up together on removal.
 */
export class DeviceDao {
  /** Inserts one device row. */
  static async insert(device: Device): Promise<void> {
    await AppDatabase.getStore().insert(TABLE, DeviceDao.toValues(device));
    AppLogger.info(SCOPE, 'insert: type=' + device.type);
  }

  /** Updates the editable fields of an existing device row. */
  static async update(device: Device): Promise<void> {
    const values: relationalStore.ValuesBucket = {
      'room_id': device.roomId,
      'name': device.name,
      'type': device.type,
      'template_id': device.templateId,
      'brand': device.brand,
      'model': device.model,
      'sort_order': device.sortOrder,
      'updated_at': device.updatedAt
    };
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('id', device.id);
    await AppDatabase.getStore().update(values, predicates);
    AppLogger.info(SCOPE, 'update');
  }

  /**
   * Deletes a device together with its keys, expected state and scene steps
   * inside one transaction; rolls back completely on any failure.
   */
  static async remove(deviceId: string): Promise<void> {
    const store: relationalStore.RdbStore = AppDatabase.getStore();
    store.beginTransaction();
    try {
      const keyPredicates: relationalStore.RdbPredicates =
        new relationalStore.RdbPredicates('key');
      keyPredicates.equalTo('device_id', deviceId);
      await store.delete(keyPredicates);

      const statePredicates: relationalStore.RdbPredicates =
        new relationalStore.RdbPredicates('device_expected_state');
      statePredicates.equalTo('device_id', deviceId);
      await store.delete(statePredicates);

      const stepPredicates: relationalStore.RdbPredicates =
        new relationalStore.RdbPredicates('scene_step');
      stepPredicates.equalTo('device_id', deviceId);
      await store.delete(stepPredicates);

      const predicates: relationalStore.RdbPredicates =
        new relationalStore.RdbPredicates(TABLE);
      predicates.equalTo('id', deviceId);
      await store.delete(predicates);
      store.commit();
      AppLogger.info(SCOPE, 'remove');
    } catch (error) {
      store.rollBack();
      const detail: string = error instanceof Error ? error.message : 'Failed to delete device';
      AppLogger.error(SCOPE, 'remove rolled back: reason=' + detail);
      throw new Error(detail);
    }
  }

  /** Fetches one device by id, or undefined when it does not exist. */
  static async get(deviceId: string): Promise<Device | undefined> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('id', deviceId);
    const resultSet: relationalStore.ResultSet =
      await AppDatabase.getStore().query(predicates, COLUMNS);
    let device: Device | undefined = undefined;
    if (resultSet.goToNextRow()) {
      device = DeviceDao.fromRow(resultSet);
    }
    resultSet.close();
    return device;
  }

  /** Lists devices of one room ordered by sort order then creation time. */
  static async listByRoom(roomId: string): Promise<Device[]> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('room_id', roomId);
    predicates.orderByAsc('sort_order');
    predicates.orderByAsc('created_at');
    return DeviceDao.queryList(predicates);
  }

  /** Lists all devices ordered by room then sort order. */
  static async listAll(): Promise<Device[]> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.orderByAsc('room_id');
    predicates.orderByAsc('sort_order');
    return DeviceDao.queryList(predicates);
  }

  /** Returns the total number of device rows. */
  static async count(): Promise<number> {
    const resultSet: relationalStore.ResultSet =
      await AppDatabase.getStore().querySql(`SELECT COUNT(*) AS cnt FROM ${TABLE}`);
    let count: number = 0;
    if (resultSet.goToNextRow()) {
      count = resultSet.getLong(resultSet.getColumnIndex('cnt'));
    }
    resultSet.close();
    return count;
  }

  /** Runs a query and maps every row to a Device instance. */
  private static async queryList(predicates: relationalStore.RdbPredicates): Promise<Device[]> {
    const resultSet: relationalStore.ResultSet =
      await AppDatabase.getStore().query(predicates, COLUMNS);
    const devices: Device[] = [];
    while (resultSet.goToNextRow()) {
      devices.push(DeviceDao.fromRow(resultSet));
    }
    resultSet.close();
    return devices;
  }

  /** Maps a Device instance to the insertable values bucket. */
  private static toValues(device: Device): relationalStore.ValuesBucket {
    const values: relationalStore.ValuesBucket = {
      'id': device.id,
      'room_id': device.roomId,
      'name': device.name,
      'type': device.type,
      'template_id': device.templateId,
      'brand': device.brand,
      'model': device.model,
      'sort_order': device.sortOrder,
      'created_at': device.createdAt,
      'updated_at': device.updatedAt
    };
    return values;
  }

  /** Maps the current row of a result set to a Device instance. */
  private static fromRow(resultSet: relationalStore.ResultSet): Device {
    const device: Device = new Device();
    device.id = resultSet.getString(resultSet.getColumnIndex('id'));
    device.roomId = resultSet.getString(resultSet.getColumnIndex('room_id'));
    device.name = resultSet.getString(resultSet.getColumnIndex('name'));
    device.type = resultSet.getString(resultSet.getColumnIndex('type')) as DeviceType;
    device.templateId = resultSet.getString(resultSet.getColumnIndex('template_id'));
    device.brand = resultSet.getString(resultSet.getColumnIndex('brand'));
    device.model = resultSet.getString(resultSet.getColumnIndex('model'));
    device.sortOrder = resultSet.getLong(resultSet.getColumnIndex('sort_order'));
    device.createdAt = resultSet.getLong(resultSet.getColumnIndex('created_at'));
    device.updatedAt = resultSet.getLong(resultSet.getColumnIndex('updated_at'));
    return device;
  }
}
