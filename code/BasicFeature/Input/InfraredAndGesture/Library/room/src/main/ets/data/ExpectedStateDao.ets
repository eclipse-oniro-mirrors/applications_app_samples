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
import { DeviceExpectedState, PowerState, StateSource } from '../model/RoomTypes';
import { AppDatabase } from './AppDatabase';

const SCOPE: string = 'ExpectedStateDao';
const TABLE: string = 'device_expected_state';
const COLUMNS: string[] = ['device_id', 'power', 'level', 'source', 'updated_at'];

/** Data access object for the device_expected_state table (one row per device). */
export class ExpectedStateDao {
  /** Inserts or overwrites the expected state of one device. */
  static async upsert(state: DeviceExpectedState): Promise<void> {
    const values: relationalStore.ValuesBucket = {
      'device_id': state.deviceId,
      'power': state.power,
      'level': state.level,
      'source': state.source,
      'updated_at': state.updatedAt
    };
    await AppDatabase.getStore().insert(
      TABLE, values, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
    AppLogger.info(SCOPE, 'upsert: power=' + state.power + ', level=' + state.level.toString() +
      ', source=' + state.source);
  }

  /** Fetches the expected state of one device, or undefined when unset. */
  static async get(deviceId: string): Promise<DeviceExpectedState | undefined> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('device_id', deviceId);
    const resultSet: relationalStore.ResultSet =
      await AppDatabase.getStore().query(predicates, COLUMNS);
    let state: DeviceExpectedState | undefined = undefined;
    if (resultSet.goToNextRow()) {
      state = ExpectedStateDao.fromRow(resultSet);
    }
    resultSet.close();
    return state;
  }

  /** Lists expected states of the given devices; empty input returns empty. */
  static async listByDeviceIds(deviceIds: string[]): Promise<DeviceExpectedState[]> {
    if (deviceIds.length === 0) {
      return [];
    }
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.in('device_id', deviceIds);
    const resultSet: relationalStore.ResultSet =
      await AppDatabase.getStore().query(predicates, COLUMNS);
    const states: DeviceExpectedState[] = [];
    while (resultSet.goToNextRow()) {
      states.push(ExpectedStateDao.fromRow(resultSet));
    }
    resultSet.close();
    return states;
  }

  /** Maps the current row of a result set to a DeviceExpectedState instance. */
  private static fromRow(resultSet: relationalStore.ResultSet): DeviceExpectedState {
    const state: DeviceExpectedState = new DeviceExpectedState();
    state.deviceId = resultSet.getString(resultSet.getColumnIndex('device_id'));
    state.power = resultSet.getString(resultSet.getColumnIndex('power')) as PowerState;
    state.level = resultSet.getLong(resultSet.getColumnIndex('level'));
    state.source = resultSet.getString(resultSet.getColumnIndex('source')) as StateSource;
    state.updatedAt = resultSet.getLong(resultSet.getColumnIndex('updated_at'));
    return state;
  }
}
