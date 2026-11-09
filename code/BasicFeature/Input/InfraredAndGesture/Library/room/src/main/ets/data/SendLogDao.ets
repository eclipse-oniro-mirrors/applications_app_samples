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
import { SendLog } from '../model/RoomTypes';
import { AppDatabase } from './AppDatabase';

const SCOPE: string = 'SendLogDao';
const TABLE: string = 'send_log';
const COLUMNS: string[] = [
  'id', 'timestamp', 'room_id', 'device_id', 'key_id', 'frequency_hz',
  'pattern_summary', 'result', 'duration_ms', 'scene_run_id'
];

/**
 * Data access object for the send_log table that records every IR
 * transmission for the history page and cleanup jobs.
 */
export class SendLogDao {
  /** Inserts one send-log row. */
  static async insert(log: SendLog): Promise<void> {
    const values: relationalStore.ValuesBucket = {
      'id': log.id,
      'timestamp': log.timestamp,
      'room_id': log.roomId,
      'device_id': log.deviceId,
      'key_id': log.keyId,
      'frequency_hz': log.frequencyHz,
      'pattern_summary': log.patternSummary,
      'result': log.result,
      'duration_ms': log.durationMs,
      'scene_run_id': log.sceneRunId
    };
    await AppDatabase.getStore().insert(TABLE, values);
    AppLogger.info(SCOPE, `insert: id=${log.id}, deviceId=${log.deviceId}, result=${log.result}`);
  }

  /** Lists the newest send-log rows bounded by the given limit. */
  static async listRecent(limit: number): Promise<SendLog[]> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.orderByDesc('timestamp');
    predicates.limitAs(limit);
    return SendLogDao.queryList(predicates);
  }

  /** Lists every send-log row, newest first. */
  static async listAll(): Promise<SendLog[]> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.orderByDesc('timestamp');
    return SendLogDao.queryList(predicates);
  }

  /** Deletes send-log rows older than the given timestamp. */
  static async deleteOlderThan(timestamp: number): Promise<void> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.lessThan('timestamp', timestamp);
    const removed: number = await AppDatabase.getStore().delete(predicates);
    AppLogger.info(SCOPE, `deleteOlderThan: before=${timestamp}, removed=${removed}`);
  }

  /** Trims the table so at most maxCount newest rows remain. */
  static async trimToCount(maxCount: number): Promise<void> {
    if (maxCount < 0) {
      return;
    }
    await AppDatabase.getStore().executeSql(
      `DELETE FROM ${TABLE} WHERE id NOT IN ` +
      `(SELECT id FROM ${TABLE} ORDER BY timestamp DESC LIMIT ?)`,
      [maxCount]);
    AppLogger.info(SCOPE, `trimToCount: maxCount=${maxCount}`);
  }

  /** Returns the total number of send-log rows. */
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

  /** Runs a query and maps every row to a SendLog instance. */
  private static async queryList(
    predicates: relationalStore.RdbPredicates): Promise<SendLog[]> {
    const resultSet: relationalStore.ResultSet =
      await AppDatabase.getStore().query(predicates, COLUMNS);
    const logs: SendLog[] = [];
    while (resultSet.goToNextRow()) {
      logs.push(SendLogDao.fromRow(resultSet));
    }
    resultSet.close();
    return logs;
  }

  /** Maps the current row of a result set to a SendLog instance. */
  private static fromRow(resultSet: relationalStore.ResultSet): SendLog {
    const log: SendLog = new SendLog();
    log.id = resultSet.getString(resultSet.getColumnIndex('id'));
    log.timestamp = resultSet.getLong(resultSet.getColumnIndex('timestamp'));
    log.roomId = resultSet.getString(resultSet.getColumnIndex('room_id'));
    log.deviceId = resultSet.getString(resultSet.getColumnIndex('device_id'));
    log.keyId = resultSet.getString(resultSet.getColumnIndex('key_id'));
    log.frequencyHz = resultSet.getLong(resultSet.getColumnIndex('frequency_hz'));
    log.patternSummary = resultSet.getString(resultSet.getColumnIndex('pattern_summary'));
    log.result = resultSet.getString(resultSet.getColumnIndex('result'));
    log.durationMs = resultSet.getLong(resultSet.getColumnIndex('duration_ms'));
    log.sceneRunId = resultSet.getString(resultSet.getColumnIndex('scene_run_id'));
    return log;
  }
}
