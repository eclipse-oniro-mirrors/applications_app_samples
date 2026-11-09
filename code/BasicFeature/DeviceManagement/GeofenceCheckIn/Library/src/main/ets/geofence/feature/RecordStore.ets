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

import { common } from '@kit.AbilityKit';
import { relationalStore } from '@kit.ArkData';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import {
  CheckInRecord,
  DaySummary,
  FenceConfig,
  MAX_RECORDS,
  OPEN_END,
  createDefaultConfig,
  createEmptySummary
} from '../model/GeofenceTypes';
import { Logger } from '../utils/Logger';

// Module-level counter that produces a unique task id for every trace span.
let traceTaskIdCounter: number = 0;

// File name of the relational database that stores the fence config and the check-in records.
const STORE_NAME: string = 'geofence_check_in.db';
// Table holding the single fence configuration row.
const CONFIG_TABLE: string = 'fence_config';
// Table holding the check-in history rows.
const RECORD_TABLE: string = 'check_in_record';
// Fixed primary key of the single configuration row.
const CONFIG_ID: number = 1;
// Database value meaning the fence switch is on.
const ENABLED_VALUE: number = 1;
// Database value meaning the fence switch is off.
const DISABLED_VALUE: number = 0;
// Columns read from the configuration table.
const CONFIG_COLUMNS: Array<string> = ['name', 'latitude', 'longitude', 'radius', 'fence_id', 'enabled', 'updated_at'];
// Columns read from the record table.
const RECORD_COLUMNS: Array<string> = ['id', 'enter_time', 'exit_time', 'duration_ms'];
// SQL that creates the configuration table when it does not exist yet.
const CREATE_CONFIG_SQL: string = 'CREATE TABLE IF NOT EXISTS fence_config (' +
  'id INTEGER PRIMARY KEY, name TEXT NOT NULL, latitude REAL NOT NULL, longitude REAL NOT NULL, ' +
  'radius REAL NOT NULL, fence_id INTEGER NOT NULL, enabled INTEGER NOT NULL, updated_at INTEGER NOT NULL)';
// SQL that creates the record table when it does not exist yet.
const CREATE_RECORD_SQL: string = 'CREATE TABLE IF NOT EXISTS check_in_record (' +
  'id INTEGER PRIMARY KEY AUTOINCREMENT, enter_time INTEGER NOT NULL, ' +
  'exit_time INTEGER NOT NULL, duration_ms INTEGER NOT NULL)';
// SQL that deletes every record row.
const DELETE_RECORDS_SQL: string = 'DELETE FROM check_in_record';

/**
 * Relational store facade that persists the fence configuration and the check-in records.
 * The store is opened once and reused for every subsequent database operation.
 */
export class RecordStore {
  // Cached store instance shared by all operations.
  private static store: relationalStore.RdbStore | undefined = undefined;
  // In-flight open promise that merges concurrent open requests into one.
  private static opening: Promise<relationalStore.RdbStore> | undefined = undefined;

  /**
   * Create the database handle and make sure both tables exist.
   * @param context application context used to locate the database file
   * @returns the opened store handle
   */
  private static async open(context: common.Context): Promise<relationalStore.RdbStore> {
    // Describe the database file and its security level.
    const config: relationalStore.StoreConfig = {
      name: STORE_NAME,
      securityLevel: relationalStore.SecurityLevel.S1
    };
    // Ask the system for the store handle, creating the file when needed.
    const store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config);
    // Create the configuration table when it is missing.
    await store.executeSql(CREATE_CONFIG_SQL);
    // Create the record table when it is missing.
    await store.executeSql(CREATE_RECORD_SQL);
    // Report the successful open for later diagnosis.
    Logger.info('RecordStore#open: store ready');
    return store;
  }

  /**
   * Return the shared store handle, opening it lazily on first use.
   * @param context application context used to open the database
   * @returns the shared store handle
   */
  static async getStore(context: common.Context): Promise<relationalStore.RdbStore> {
    // Serve the cached handle when the store was opened before.
    if (RecordStore.store !== undefined) {
      return RecordStore.store;
    }
    // Start one open request and let concurrent callers share it.
    if (RecordStore.opening === undefined) {
      RecordStore.opening = RecordStore.open(context);
    }
    // Capture the shared request so a completing caller cannot detach it.
    const pending: Promise<relationalStore.RdbStore> = RecordStore.opening;
    try {
      // Wait until the shared open request resolves.
      const store: relationalStore.RdbStore = await pending;
      // Cache the handle for the following operations.
      RecordStore.store = store;
      return store;
    } finally {
      // Clear the in-flight marker so a failed open can be retried later.
      RecordStore.opening = undefined;
    }
  }

  /**
   * Read the persisted fence configuration, or a default one when no row exists.
   * @param context application context used to open the database
   * @returns the stored configuration, or the default configuration
   */
  static async getConfig(context: common.Context): Promise<FenceConfig> {
    // Start from a default configuration for a fresh install.
    const config: FenceConfig = createDefaultConfig();
    // Open the shared database handle.
    const store: relationalStore.RdbStore = await RecordStore.getStore(context);
    // Query the single configuration row by its fixed id.
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(CONFIG_TABLE);
    predicates.equalTo('id', CONFIG_ID);
    // Read only the columns mapped to the configuration fields.
    const resultSet: relationalStore.ResultSet = await store.query(predicates, CONFIG_COLUMNS);
    // Fill the configuration from the first row when one exists.
    if (resultSet.goToFirstRow()) {
      config.name = resultSet.getString(resultSet.getColumnIndex('name'));
      config.latitude = resultSet.getDouble(resultSet.getColumnIndex('latitude'));
      config.longitude = resultSet.getDouble(resultSet.getColumnIndex('longitude'));
      config.radius = resultSet.getDouble(resultSet.getColumnIndex('radius'));
      config.fenceId = resultSet.getLong(resultSet.getColumnIndex('fence_id'));
      config.enabled = resultSet.getLong(resultSet.getColumnIndex('enabled')) === ENABLED_VALUE;
      config.updatedAt = resultSet.getLong(resultSet.getColumnIndex('updated_at'));
    }
    // Release the result set resources.
    resultSet.close();
    // Report the loaded configuration without printing coordinates for privacy.
    Logger.debug('RecordStore#getConfig: loaded fence ' + config.name + ', enabled=' + config.enabled);
    return config;
  }

  /**
   * Write the configuration row, inserting it when it does not exist yet.
   * @param context application context used to open the database
   * @param config configuration values to persist
   * @returns a promise that resolves when the row is written
   */
  static async saveConfig(context: common.Context, config: FenceConfig): Promise<void> {
    // Open the shared database handle.
    const store: relationalStore.RdbStore = await RecordStore.getStore(context);
    // Map the configuration fields onto the database columns.
    const values: relationalStore.ValuesBucket = {
      'id': CONFIG_ID,
      'name': config.name,
      'latitude': config.latitude,
      'longitude': config.longitude,
      'radius': config.radius,
      'fence_id': config.fenceId,
      'enabled': config.enabled ? ENABLED_VALUE : DISABLED_VALUE,
      'updated_at': config.updatedAt
    };
    // Target the single configuration row by its fixed id.
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(CONFIG_TABLE);
    predicates.equalTo('id', CONFIG_ID);
    // Update the existing row first.
    const rows: number = await store.update(values, predicates);
    // Insert the row when no configuration was stored before.
    if (rows === 0) {
      await store.insert(CONFIG_TABLE, values);
    }
    // Report the persisted state without printing coordinates for privacy.
    Logger.info('RecordStore#saveConfig: saved fence ' + config.name + ', enabled=' + config.enabled);
  }

  /**
   * Find the check-in record that has no exit time yet.
   * @param context application context used to open the database
   * @returns the open record, or undefined when every record is closed
   */
  static async getOpenRecord(context: common.Context): Promise<CheckInRecord | undefined> {
    // Open the shared database handle.
    const store: relationalStore.RdbStore = await RecordStore.getStore(context);
    // Query the newest record whose exit time still carries the open marker.
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(RECORD_TABLE);
    predicates.equalTo('exit_time', OPEN_END);
    predicates.orderByDesc('enter_time');
    predicates.limitAs(1);
    // Read only the columns mapped to the record fields.
    const resultSet: relationalStore.ResultSet = await store.query(predicates, RECORD_COLUMNS);
    // Keep the record undefined until a row is found.
    let record: CheckInRecord | undefined = undefined;
    // Map the first row into a record when one exists.
    if (resultSet.goToFirstRow()) {
      record = RecordStore.readRecord(resultSet);
    }
    // Release the result set resources.
    resultSet.close();
    return record;
  }

  /**
   * Handle a fence enter event by inserting a new open check-in record.
   * @param context application context used to open the database
   * @param timestamp enter time in milliseconds since epoch
   * @returns the created record, or undefined when an open record already exists
   */
  static async handleEnter(context: common.Context, timestamp: number): Promise<CheckInRecord | undefined> {
    // Open a trace span for the enter bookkeeping.
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('RecordStore#handleEnter', taskId);
    try {
      // Look for a record that is still open.
      const openRecord: CheckInRecord | undefined = await RecordStore.getOpenRecord(context);
      // Ignore a second enter while one check-in is already running.
      if (openRecord !== undefined) {
        Logger.info('RecordStore#handleEnter: ignored, an open check-in already exists');
        return undefined;
      }
      // Open the shared database handle.
      const store: relationalStore.RdbStore = await RecordStore.getStore(context);
      // Map the enter event onto a new record row with an open exit time.
      const values: relationalStore.ValuesBucket = {
        'enter_time': timestamp,
        'exit_time': OPEN_END,
        'duration_ms': 0
      };
      // Insert the row and keep its generated id.
      const rowId: number = await store.insert(RECORD_TABLE, values);
      // Build the in-memory record matching the inserted row.
      const record: CheckInRecord = {
        id: rowId,
        enterTime: timestamp,
        exitTime: OPEN_END,
        durationMs: 0
      };
      // Report the created record for later diagnosis.
      Logger.info('RecordStore#handleEnter: inserted record id=' + rowId);
      return record;
    } finally {
      // Close the trace span whatever the enter outcome is.
      hiTraceMeter.finishTrace('RecordStore#handleEnter', taskId);
    }
  }

  /**
   * Handle a fence exit event by closing the open check-in record.
   * @param context application context used to open the database
   * @param timestamp exit time in milliseconds since epoch
   * @returns the closed record, or undefined when no open record exists
   */
  static async handleExit(context: common.Context, timestamp: number): Promise<CheckInRecord | undefined> {
    // Open a trace span for the exit bookkeeping.
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('RecordStore#handleExit', taskId);
    try {
      // Look for a record that is still open.
      const openRecord: CheckInRecord | undefined = await RecordStore.getOpenRecord(context);
      // Ignore an exit when every record is already closed.
      if (openRecord === undefined) {
        Logger.info('RecordStore#handleExit: ignored, no open check-in record');
        return undefined;
      }
      // Compute how long the stay lasted.
      const durationMs: number = timestamp - openRecord.enterTime;
      // Open the shared database handle.
      const store: relationalStore.RdbStore = await RecordStore.getStore(context);
      // Map the exit event onto the update payload.
      const values: relationalStore.ValuesBucket = {
        'exit_time': timestamp,
        'duration_ms': durationMs
      };
      // Target exactly the open record row.
      const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(RECORD_TABLE);
      predicates.equalTo('id', openRecord.id);
      // Write the exit time and duration into the row.
      await store.update(values, predicates);
      // Build the in-memory record matching the updated row.
      const record: CheckInRecord = {
        id: openRecord.id,
        enterTime: openRecord.enterTime,
        exitTime: timestamp,
        durationMs: durationMs
      };
      // Report the closed record for later diagnosis.
      Logger.info('RecordStore#handleExit: closed record id=' + openRecord.id + ', durationMs=' + durationMs);
      return record;
    } finally {
      // Close the trace span whatever the exit outcome is.
      hiTraceMeter.finishTrace('RecordStore#handleExit', taskId);
    }
  }

  /**
   * Read the newest check-in records for the history list.
   * @param context application context used to open the database
   * @param limit maximum number of records to return
   * @returns the records ordered from newest to oldest
   */
  static async getRecords(context: common.Context, limit: number = MAX_RECORDS): Promise<Array<CheckInRecord>> {
    // Collect the mapped rows in a fresh list.
    const records: Array<CheckInRecord> = [];
    // Open the shared database handle.
    const store: relationalStore.RdbStore = await RecordStore.getStore(context);
    // Order the rows from newest to oldest and cap the result size.
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(RECORD_TABLE);
    predicates.orderByDesc('enter_time');
    predicates.limitAs(limit);
    // Read only the columns mapped to the record fields.
    const resultSet: relationalStore.ResultSet = await store.query(predicates, RECORD_COLUMNS);
    // Map every returned row into a record.
    while (resultSet.goToNextRow()) {
      records.push(RecordStore.readRecord(resultSet));
    }
    // Release the result set resources.
    resultSet.close();
    // Report how many records were read for later diagnosis.
    Logger.debug('RecordStore#getRecords: loaded ' + records.length + ' records');
    return records;
  }

  /**
   * Sum up the check-in count and duration of one day.
   * @param context application context used to open the database
   * @param dayStart start of the day window in milliseconds since epoch
   * @returns the count and total duration inside the window
   */
  static async getDaySummary(context: common.Context, dayStart: number): Promise<DaySummary> {
    // Start from an empty summary.
    const summary: DaySummary = createEmptySummary();
    // Open the shared database handle.
    const store: relationalStore.RdbStore = await RecordStore.getStore(context);
    // Keep only records that entered on or after the day start.
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(RECORD_TABLE);
    predicates.greaterThanOrEqualTo('enter_time', dayStart);
    // Read only the columns needed for the summary.
    const resultSet: relationalStore.ResultSet = await store.query(predicates, RECORD_COLUMNS);
    // Accumulate the count and duration over every returned row.
    while (resultSet.goToNextRow()) {
      summary.count += 1;
      summary.durationMs += resultSet.getLong(resultSet.getColumnIndex('duration_ms'));
    }
    // Release the result set resources.
    resultSet.close();
    // Report the summary for later diagnosis.
    Logger.debug('RecordStore#getDaySummary: count=' + summary.count + ', durationMs=' + summary.durationMs);
    return summary;
  }

  /**
   * Delete every stored check-in record.
   * @param context application context used to open the database
   * @returns a promise that resolves when the table is cleared
   */
  static async clearRecords(context: common.Context): Promise<void> {
    // Open the shared database handle.
    const store: relationalStore.RdbStore = await RecordStore.getStore(context);
    // Run the delete statement over the whole record table.
    await store.executeSql(DELETE_RECORDS_SQL);
    // Report the cleanup for later diagnosis.
    Logger.info('RecordStore#clearRecords: all records deleted');
  }

  /**
   * Map the current result set row into a check-in record.
   * @param resultSet result set positioned on the row to read
   * @returns the record built from the row values
   */
  private static readRecord(resultSet: relationalStore.ResultSet): CheckInRecord {
    // Read every column once and build the record from the values.
    const record: CheckInRecord = {
      id: resultSet.getLong(resultSet.getColumnIndex('id')),
      enterTime: resultSet.getLong(resultSet.getColumnIndex('enter_time')),
      exitTime: resultSet.getLong(resultSet.getColumnIndex('exit_time')),
      durationMs: resultSet.getLong(resultSet.getColumnIndex('duration_ms'))
    };
    return record;
  }
}
