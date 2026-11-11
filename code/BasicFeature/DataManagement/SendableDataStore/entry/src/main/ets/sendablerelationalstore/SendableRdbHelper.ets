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
import { collections } from '@kit.ArkTS';
import { relationalStore, sendableRelationalStore } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../utils/Logger';
import { DataValidator } from '../utils/DataValidator';
import { DataStoreConstants } from '../constants/DataStoreConstants';
import { TableSchema, SchemaField, OperationResult } from '../models/DataModels';
import { ResultText } from '../utils/ResultText';

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: 'SendableDataStore.db',
  securityLevel: relationalStore.SecurityLevel.S3
};
const TABLE_NAME: string = 'sendable_sample';
const CREATE_TABLE_SQL: string = 'CREATE TABLE IF NOT EXISTS sendable_sample (' +
  'id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, age INTEGER, active INTEGER)';

export class SendableRdbHelper {
  private readonly context: common.UIAbilityContext;
  private store: relationalStore.RdbStore | null = null;
  private tableNames: string[] = [TABLE_NAME];
  private insertCount: number = 0;
  private updateCount: number = 0;
  private deleteCount: number = 0;
  private queryCount: number = 0;
  private transactionActive: boolean = false;
  private lastOperationTime: number = 0;

  constructor(context: common.UIAbilityContext) {
    this.context = context;
  }

  async initialize(): Promise<string> {
    if (this.store !== null) {
      return ResultText.of($r('app.string.result_rdb_already_initialized'), 'RDB store is already initialized');
    }
    this.store = await relationalStore.getRdbStore(this.context, STORE_CONFIG);
    await this.store.executeSql(CREATE_TABLE_SQL);
    return ResultText.of($r('app.string.result_rdb_ready'), 'RDB store and table are ready');
  }

  async convertInsertAndQuery(): Promise<string> {
    const source: relationalStore.ValuesBucket = {
      name: `Sendable user ${Date.now()}`,
      age: 26,
      active: true
    };
    const sendableBucket: sendableRelationalStore.ValuesBucket = sendableRelationalStore.toSendableValuesBucket(source);
    const normalBucket: relationalStore.ValuesBucket = sendableRelationalStore.fromSendableValuesBucket(sendableBucket);
    const rowId: number = this.getInstance().insertSync(TABLE_NAME, sendableBucket);
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE_NAME);
    predicates.equalTo('id', rowId);
    const resultSet: relationalStore.ResultSet = await this.getInstance().query(predicates);
    try {
      if (resultSet.rowCount > 0 && resultSet.goToFirstRow()) {
        const sendableRow: sendableRelationalStore.ValuesBucket = resultSet.getSendableRow();
        const normalRow: relationalStore.ValuesBucket = sendableRelationalStore.fromSendableValuesBucket(sendableRow);
        return ResultText.ofArgs($r('app.string.result_rdb_convert_insert_query'),
          [JSON.stringify(normalBucket), rowId, JSON.stringify(normalRow)],
          `Converted=${JSON.stringify(normalBucket)}; rowId=${rowId}; query=${JSON.stringify(normalRow)}`);
      }
      return ResultText.ofArgs($r('app.string.result_rdb_convert_insert_query_no_rows'),
        [JSON.stringify(normalBucket), rowId],
        `Converted=${JSON.stringify(normalBucket)}; inserted rowId=${rowId}; query returned no rows`);
    } finally {
      resultSet.close();
    }
  }

  convertValues(): string {
    const source: sendableRelationalStore.NonSendableValues = ['Sendable', 26, true, null];
    const sendableValues: collections.Array<sendableRelationalStore.ValueType> =
      sendableRelationalStore.toSendableValues(source);
    const normalValues: sendableRelationalStore.NonSendableValues =
      sendableRelationalStore.fromSendableValues(sendableValues);
    return ResultText.ofArgs($r('app.string.result_rdb_convert_values'),
      [sendableValues.length, JSON.stringify(normalValues)],
      `toSendableValues length=${sendableValues.length}; fromSendableValues=${JSON.stringify(normalValues)}`);
  }

  convertAsset(): string {
    const source: sendableRelationalStore.NonSendableAsset = {
      name: 'sample.txt',
      uri: '/data/storage/el2/base/files/sample.txt',
      path: 'sample.txt',
      createTime: '2026-01-01 00:00:00',
      modifyTime: '2026-01-01 00:00:00',
      size: '128',
      status: relationalStore.AssetStatus.ASSET_NORMAL
    };
    const sendableAsset: sendableRelationalStore.Asset = sendableRelationalStore.toSendableAsset(source);
    const normalAsset: sendableRelationalStore.NonSendableAsset =
      sendableRelationalStore.fromSendableAsset(sendableAsset);
    return ResultText.ofArgs($r('app.string.result_rdb_convert_asset'),
      [sendableAsset.name, JSON.stringify(normalAsset)],
      `toSendableAsset name=${sendableAsset.name}; fromSendableAsset=${JSON.stringify(normalAsset)}`);
  }

  async closeStore(): Promise<string> {
    if (this.store === null) {
      return ResultText.of($r('app.string.result_rdb_already_closed'), 'RDB store is already closed');
    }
    await this.store.close();
    this.store = null;
    this.tableNames = [];
    return ResultText.of($r('app.string.result_rdb_closed'), 'RDB store closed');
  }

  release(): void {
    if (this.store === null) {
      return;
    }
    this.store.close().then((): void => {
      Logger.info('RDB store released');
    }).catch((error: BusinessError): void => {
      Logger.error(`Failed to release RDB store: ${error.code}, ${error.message}`);
    });
    this.store = null;
    this.tableNames = [TABLE_NAME];
    this.insertCount = 0;
    this.updateCount = 0;
    this.deleteCount = 0;
    this.queryCount = 0;
    this.transactionActive = false;
    this.lastOperationTime = 0;
  }

  async createTable(tableName: string, schema: TableSchema): Promise<string> {
    if (!DataValidator.isValidTableName(tableName)) {
      return ResultText.ofArgs($r('app.string.result_rdb_create_table_invalid_name'), [tableName],
        `createTable failed: invalid table name '${tableName}'`);
    }
    const instance: relationalStore.RdbStore = this.getInstance();
    let columns: string = 'id INTEGER PRIMARY KEY AUTOINCREMENT';
    for (let i: number = 0; i < schema.fields.length; i++) {
      const field: SchemaField = schema.fields[i];
      let colDef: string = `${field.name} TEXT`;
      if (field.dataType === 'number') {
        colDef = `${field.name} INTEGER`;
      } else if (field.dataType === 'boolean') {
        colDef = `${field.name} INTEGER`;
      }
      if (field.required) {
        colDef += ' NOT NULL';
      }
      columns += `, ${colDef}`;
    }
    const createSql: string = `CREATE TABLE IF NOT EXISTS ${tableName} (${columns})`;
    await instance.executeSql(createSql);
    this.tableNames.push(tableName);
    return ResultText.ofArgs($r('app.string.result_rdb_create_table_completed'),
      [tableName, schema.fields.length],
      `createTable '${tableName}' completed with ${schema.fields.length} fields`);
  }

  async dropTable(tableName: string): Promise<string> {
    if (!DataValidator.isValidTableName(tableName)) {
      return ResultText.ofArgs($r('app.string.result_rdb_drop_table_invalid_name'), [tableName],
        `dropTable failed: invalid table name '${tableName}'`);
    }
    if (tableName === TABLE_NAME) {
      return ResultText.ofArgs($r('app.string.result_rdb_drop_table_default'), [TABLE_NAME],
        `dropTable failed: cannot drop default table '${TABLE_NAME}'`);
    }
    const instance: relationalStore.RdbStore = this.getInstance();
    await instance.executeSql(`DROP TABLE IF EXISTS ${tableName}`);
    const remaining: string[] = [];
    for (let i: number = 0; i < this.tableNames.length; i++) {
      if (this.tableNames[i] !== tableName) {
        remaining.push(this.tableNames[i]);
      }
    }
    this.tableNames = remaining;
    return ResultText.ofArgs($r('app.string.result_rdb_drop_table_completed'), [tableName],
      `dropTable '${tableName}' completed`);
  }

  listTables(): string {
    return ResultText.ofArgs($r('app.string.result_rdb_tables'),
      [this.tableNames.join(', '), this.tableNames.length],
      `Tables: [${this.tableNames.join(', ')}] (${this.tableNames.length} tables)`);
  }

  hasTable(tableName: string): boolean {
    for (let i: number = 0; i < this.tableNames.length; i++) {
      if (this.tableNames[i] === tableName) {
        return true;
      }
    }
    return false;
  }

  getTableCount(): number {
    return this.tableNames.length;
  }

  async batchInsert(tableName: string, buckets: relationalStore.ValuesBucket[]): Promise<string> {
    if (!DataValidator.isValidTableName(tableName)) {
      return ResultText.ofArgs($r('app.string.result_rdb_batch_insert_invalid_name'), [tableName],
        `batchInsert failed: invalid table name '${tableName}'`);
    }
    if (buckets.length === 0) {
      return ResultText.of($r('app.string.result_rdb_batch_insert_empty'), 'batchInsert failed: empty buckets array');
    }
    if (buckets.length > DataStoreConstants.MAX_BATCH_SIZE) {
      return ResultText.ofArgs($r('app.string.result_rdb_batch_insert_exceeds_max'),
        [buckets.length, DataStoreConstants.MAX_BATCH_SIZE],
        `batchInsert failed: batch size ${buckets.length} exceeds max ${DataStoreConstants.MAX_BATCH_SIZE}`);
    }
    const instance: relationalStore.RdbStore = this.getInstance();
    let successCount: number = 0;
    const rowIds: number[] = [];
    for (let i: number = 0; i < buckets.length; i++) {
      const sendableBucket: sendableRelationalStore.ValuesBucket =
        sendableRelationalStore.toSendableValuesBucket(buckets[i]);
      try {
        const rowId: number = instance.insertSync(tableName, sendableBucket);
        rowIds.push(rowId);
        successCount++;
      } catch (e) {
        Logger.error(`batchInsert row ${i} failed: ${(e as Error).message}`);
      }
    }
    this.insertCount += successCount;
    this.lastOperationTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_rdb_batch_insert_completed'),
      [tableName, successCount, buckets.length, rowIds.join(',')],
      `batchInsert into '${tableName}': ${successCount}/${buckets.length} rows inserted, ids=[${rowIds.join(',')}]`);
  }

  async update(tableName: string, bucket: relationalStore.ValuesBucket,
    predicate: relationalStore.RdbPredicates): Promise<string> {
    if (!DataValidator.isValidTableName(tableName)) {
      return ResultText.ofArgs($r('app.string.result_rdb_update_invalid_name'), [tableName],
        `update failed: invalid table name '${tableName}'`);
    }
    const instance: relationalStore.RdbStore = this.getInstance();
    const sendableBucket: sendableRelationalStore.ValuesBucket = sendableRelationalStore.toSendableValuesBucket(bucket);
    const normalBucket: relationalStore.ValuesBucket = sendableRelationalStore.fromSendableValuesBucket(sendableBucket);
    const rowCount: number = await instance.update(normalBucket, predicate);
    this.updateCount += rowCount;
    this.lastOperationTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_rdb_update_completed'), [tableName, rowCount],
      `update '${tableName}': ${rowCount} rows updated`);
  }

  updateSync(tableName: string, bucket: relationalStore.ValuesBucket,
    predicate: relationalStore.RdbPredicates): string {
    if (!DataValidator.isValidTableName(tableName)) {
      return ResultText.ofArgs($r('app.string.result_rdb_update_sync_invalid_name'), [tableName],
        `updateSync failed: invalid table name '${tableName}'`);
    }
    const instance: relationalStore.RdbStore = this.getInstance();
    const sendableBucket: sendableRelationalStore.ValuesBucket = sendableRelationalStore.toSendableValuesBucket(bucket);
    const normalBucket: relationalStore.ValuesBucket = sendableRelationalStore.fromSendableValuesBucket(sendableBucket);
    const rowCount: number = instance.updateSync(normalBucket, predicate);
    this.updateCount += rowCount;
    this.lastOperationTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_rdb_update_sync_completed'), [tableName, rowCount],
      `updateSync '${tableName}': ${rowCount} rows updated`);
  }

  async deleteByPredicates(tableName: string, predicate: relationalStore.RdbPredicates): Promise<string> {
    if (!DataValidator.isValidTableName(tableName)) {
      return ResultText.ofArgs($r('app.string.result_rdb_delete_invalid_name'), [tableName],
        `deleteByPredicates failed: invalid table name '${tableName}'`);
    }
    const instance: relationalStore.RdbStore = this.getInstance();
    const rowCount: number = await instance.delete(predicate);
    this.deleteCount += rowCount;
    this.lastOperationTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_rdb_delete_completed'), [tableName, rowCount],
      `deleteByPredicates from '${tableName}': ${rowCount} rows deleted`);
  }

  deleteByPredicatesSync(tableName: string, predicate: relationalStore.RdbPredicates): string {
    if (!DataValidator.isValidTableName(tableName)) {
      return ResultText.ofArgs($r('app.string.result_rdb_delete_sync_invalid_name'), [tableName],
        `deleteByPredicatesSync failed: invalid table name '${tableName}'`);
    }
    const instance: relationalStore.RdbStore = this.getInstance();
    const rowCount: number = instance.deleteSync(predicate);
    this.deleteCount += rowCount;
    this.lastOperationTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_rdb_delete_sync_completed'), [tableName, rowCount],
      `deleteByPredicatesSync from '${tableName}': ${rowCount} rows deleted`);
  }

  async queryAll(tableName: string): Promise<string> {
    if (!DataValidator.isValidTableName(tableName)) {
      return ResultText.ofArgs($r('app.string.result_rdb_query_all_invalid_name'), [tableName],
        `queryAll failed: invalid table name '${tableName}'`);
    }
    const instance: relationalStore.RdbStore = this.getInstance();
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(tableName);
    const resultSet: relationalStore.ResultSet = await instance.query(predicates);
    try {
      const rowCount: number = resultSet.rowCount;
      const columns: string[] = resultSet.columnNames;
      const rows: string[] = [];
      if (rowCount > 0) {
        while (resultSet.goToNextRow()) {
          const row: string[] = [];
          for (let c: number = 0; c < columns.length; c++) {
            const val: string = resultSet.getString(c);
            row.push(`${columns[c]}=${val}`);
          }
          rows.push(`{${row.join(', ')}}`);
        }
      }
      this.queryCount++;
      this.lastOperationTime = Date.now();
      return ResultText.ofArgs($r('app.string.result_rdb_query_all'), [tableName, rowCount, columns.join(',')],
        `queryAll '${tableName}': ${rowCount} rows, columns=[${columns.join(',')}]`);
    } finally {
      resultSet.close();
    }
  }

  queryAllSync(tableName: string): string {
    if (!DataValidator.isValidTableName(tableName)) {
      return ResultText.ofArgs($r('app.string.result_rdb_query_all_sync_invalid_name'), [tableName],
        `queryAllSync failed: invalid table name '${tableName}'`);
    }
    const instance: relationalStore.RdbStore = this.getInstance();
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(tableName);
    const resultSet: relationalStore.ResultSet = instance.querySync(predicates);
    try {
      const rowCount: number = resultSet.rowCount;
      const columns: string[] = resultSet.columnNames;
      this.queryCount++;
      this.lastOperationTime = Date.now();
      return ResultText.ofArgs($r('app.string.result_rdb_query_all_sync'),
        [tableName, rowCount, columns.join(',')],
        `queryAllSync '${tableName}': ${rowCount} rows, columns=[${columns.join(',')}]`);
    } finally {
      resultSet.close();
    }
  }

  async beginTransaction(): Promise<string> {
    if (this.transactionActive) {
      return ResultText.of($r('app.string.result_rdb_begin_tx_active'),
        'beginTransaction failed: transaction already active');
    }
    const instance: relationalStore.RdbStore = this.getInstance();
    try {
      await instance.executeSql('BEGIN TRANSACTION');
    } catch (e) {
      const msg: string = (e as Error).message;
      if (msg.indexOf('Capability not support') >= 0) {
        this.transactionActive = true;
        return ResultText.of($r('app.string.result_rdb_begin_tx_simulated'),
          'beginTransaction completed (simulated, capability not supported)');
      }
      return ResultText.ofArgs($r('app.string.result_rdb_begin_tx_failed'), [msg],
        `beginTransaction failed: ${msg}`);
    }
    this.transactionActive = true;
    return ResultText.of($r('app.string.result_rdb_begin_tx_completed'), 'beginTransaction completed');
  }

  async commitTransaction(): Promise<string> {
    if (!this.transactionActive) {
      return ResultText.of($r('app.string.result_rdb_commit_tx_none'),
        'commitTransaction failed: no active transaction');
    }
    const instance: relationalStore.RdbStore = this.getInstance();
    try {
      await instance.executeSql('COMMIT');
    } catch (e) {
      const msg: string = (e as Error).message;
      if (msg.indexOf('Capability not support') >= 0) {
        this.transactionActive = false;
        return ResultText.of($r('app.string.result_rdb_commit_tx_simulated'),
          'commitTransaction completed (simulated, capability not supported)');
      }
      return ResultText.ofArgs($r('app.string.result_rdb_commit_tx_failed'), [msg],
        `commitTransaction failed: ${msg}`);
    }
    this.transactionActive = false;
    return ResultText.of($r('app.string.result_rdb_commit_tx_completed'), 'commitTransaction completed');
  }

  async rollbackTransaction(): Promise<string> {
    if (!this.transactionActive) {
      return ResultText.of($r('app.string.result_rdb_rollback_tx_none'),
        'rollbackTransaction failed: no active transaction');
    }
    const instance: relationalStore.RdbStore = this.getInstance();
    try {
      await instance.executeSql('ROLLBACK');
    } catch (e) {
      const msg: string = (e as Error).message;
      if (msg.indexOf('Capability not support') >= 0) {
        this.transactionActive = false;
        return ResultText.of($r('app.string.result_rdb_rollback_tx_simulated'),
          'rollbackTransaction completed (simulated, capability not supported)');
      }
      return ResultText.ofArgs($r('app.string.result_rdb_rollback_tx_failed'), [msg],
        `rollbackTransaction failed: ${msg}`);
    }
    this.transactionActive = false;
    return ResultText.of($r('app.string.result_rdb_rollback_tx_completed'), 'rollbackTransaction completed');
  }

  isTransactionActive(): boolean {
    return this.transactionActive;
  }

  async executeRawSQL(sql: string): Promise<string> {
    if (!DataValidator.isValidSQL(sql)) {
      return ResultText.of($r('app.string.result_rdb_execute_invalid_sql'), 'executeRawSQL failed: invalid SQL');
    }
    const instance: relationalStore.RdbStore = this.getInstance();
    await instance.executeSql(sql);
    const upperSql: string = sql.trim().toUpperCase();
    if (upperSql.indexOf('INSERT') === 0) {
      this.insertCount++;
    } else if (upperSql.indexOf('UPDATE') === 0) {
      this.updateCount++;
    } else if (upperSql.indexOf('DELETE') === 0) {
      this.deleteCount++;
    }
    this.lastOperationTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_rdb_execute_completed'), [sql.substring(0, 50)],
      `executeRawSQL completed: ${sql.substring(0, 50)}`);
  }

  executeRawSQLSync(sql: string): string {
    if (!DataValidator.isValidSQL(sql)) {
      return ResultText.of($r('app.string.result_rdb_execute_sync_invalid_sql'),
        'executeRawSQLSync failed: invalid SQL');
    }
    const instance: relationalStore.RdbStore = this.getInstance();
    instance.executeSync(sql);
    const upperSql: string = sql.trim().toUpperCase();
    if (upperSql.indexOf('INSERT') === 0) {
      this.insertCount++;
    } else if (upperSql.indexOf('UPDATE') === 0) {
      this.updateCount++;
    } else if (upperSql.indexOf('DELETE') === 0) {
      this.deleteCount++;
    }
    this.lastOperationTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_rdb_execute_sync_completed'), [sql.substring(0, 50)],
      `executeRawSQLSync completed: ${sql.substring(0, 50)}`);
  }

  async queryBySQL(sql: string, args: string[]): Promise<string> {
    if (!DataValidator.isValidSQL(sql)) {
      return ResultText.of($r('app.string.result_rdb_query_by_sql_invalid'), 'queryBySQL failed: invalid SQL');
    }
    const instance: relationalStore.RdbStore = this.getInstance();
    const resultSet: relationalStore.ResultSet = await instance.querySql(sql, args);
    try {
      const rowCount: number = resultSet.rowCount;
      const columns: string[] = resultSet.columnNames;
      this.queryCount++;
      this.lastOperationTime = Date.now();
      return ResultText.ofArgs($r('app.string.result_rdb_query_by_sql'), [rowCount, columns.join(',')],
        `queryBySQL: ${rowCount} rows, columns=[${columns.join(',')}]`);
    } finally {
      resultSet.close();
    }
  }

  queryBySQLSync(sql: string, args: string[]): string {
    if (!DataValidator.isValidSQL(sql)) {
      return ResultText.of($r('app.string.result_rdb_query_by_sql_sync_invalid'), 'queryBySQLSync failed: invalid SQL');
    }
    const instance: relationalStore.RdbStore = this.getInstance();
    const resultSet: relationalStore.ResultSet = instance.querySqlSync(sql, args);
    try {
      const rowCount: number = resultSet.rowCount;
      const columns: string[] = resultSet.columnNames;
      this.queryCount++;
      this.lastOperationTime = Date.now();
      return ResultText.ofArgs($r('app.string.result_rdb_query_by_sql_sync'), [rowCount, columns.join(',')],
        `queryBySQLSync: ${rowCount} rows, columns=[${columns.join(',')}]`);
    } finally {
      resultSet.close();
    }
  }

  convertBatchBuckets(buckets: relationalStore.ValuesBucket[]): string {
    if (buckets.length === 0) {
      return ResultText.of($r('app.string.result_rdb_convert_batch_empty'), 'convertBatchBuckets failed: empty input');
    }
    if (buckets.length > DataStoreConstants.MAX_BATCH_SIZE) {
      return ResultText.ofArgs($r('app.string.result_rdb_convert_batch_exceeds_max'), [buckets.length],
        `convertBatchBuckets failed: batch size ${buckets.length} exceeds max`);
    }
    const converted: string[] = [];
    for (let i: number = 0; i < buckets.length; i++) {
      const sendable: sendableRelationalStore.ValuesBucket = sendableRelationalStore.toSendableValuesBucket(buckets[i]);
      const normal: relationalStore.ValuesBucket = sendableRelationalStore.fromSendableValuesBucket(sendable);
      converted.push(JSON.stringify(normal));
    }
    return ResultText.ofArgs($r('app.string.result_rdb_convert_batch'), [converted.length],
      `convertBatchBuckets: ${converted.length} buckets converted`);
  }

  async convertResultSetToJSON(tableName: string): Promise<string> {
    if (!DataValidator.isValidTableName(tableName)) {
      return ResultText.of($r('app.string.result_rdb_convert_json_invalid'),
        'convertResultSetToJSON failed: invalid table name');
    }
    const instance: relationalStore.RdbStore = this.getInstance();
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(tableName);
    const resultSet: relationalStore.ResultSet = await instance.query(predicates);
    try {
      const rowCount: number = resultSet.rowCount;
      const columns: string[] = resultSet.columnNames;
      const jsonRows: string[] = [];
      if (rowCount > 0) {
        while (resultSet.goToNextRow()) {
          const row: string[] = [];
          for (let c: number = 0; c < columns.length; c++) {
            const val: string = resultSet.getString(c);
            row.push(`"${columns[c]}":"${val}"`);
          }
          jsonRows.push(`{${row.join(',')}}`);
        }
      }
      this.queryCount++;
      this.lastOperationTime = Date.now();
      return `[${jsonRows.join(',')}]`;
    } finally {
      resultSet.close();
    }
  }

  convertResultSetToJSONSync(tableName: string): string {
    if (!DataValidator.isValidTableName(tableName)) {
      return ResultText.of($r('app.string.result_rdb_convert_json_sync_invalid'),
        'convertResultSetToJSONSync failed: invalid table name');
    }
    const instance: relationalStore.RdbStore = this.getInstance();
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(tableName);
    const resultSet: relationalStore.ResultSet = instance.querySync(predicates);
    try {
      const rowCount: number = resultSet.rowCount;
      const columns: string[] = resultSet.columnNames;
      const jsonRows: string[] = [];
      if (rowCount > 0) {
        while (resultSet.goToNextRow()) {
          const row: string[] = [];
          for (let c: number = 0; c < columns.length; c++) {
            const val: string = resultSet.getString(c);
            row.push(`"${columns[c]}":"${val}"`);
          }
          jsonRows.push(`{${row.join(',')}}`);
        }
      }
      this.queryCount++;
      this.lastOperationTime = Date.now();
      return `[${jsonRows.join(',')}]`;
    } finally {
      resultSet.close();
    }
  }

  isInitialized(): boolean {
    return this.store !== null;
  }

  getStatistics(): string {
    return ResultText.ofArgs($r('app.string.result_rdb_statistics'),
      [this.tableNames.length, this.insertCount, this.updateCount, this.deleteCount, this.queryCount,
        this.lastOperationTime, String(this.isInitialized()), String(this.transactionActive)],
      `RDB Statistics: tables=${this.tableNames.length}, inserts=${this.insertCount}, ` +
        `updates=${this.updateCount}, deletes=${this.deleteCount}, queries=${this.queryCount}, ` +
        `lastOp=${this.lastOperationTime}, initialized=${this.isInitialized()}, ` +
        `transactionActive=${this.transactionActive}`);
  }

  resetStatistics(): string {
    this.insertCount = 0;
    this.updateCount = 0;
    this.deleteCount = 0;
    this.queryCount = 0;
    this.lastOperationTime = 0;
    return ResultText.of($r('app.string.result_rdb_statistics_reset'), 'RDB statistics reset');
  }

  getInsertCount(): number {
    return this.insertCount;
  }

  getUpdateCount(): number {
    return this.updateCount;
  }

  getDeleteCount(): number {
    return this.deleteCount;
  }

  getQueryCount(): number {
    return this.queryCount;
  }

  getLastOperationTime(): number {
    return this.lastOperationTime;
  }

  async reinitialize(): Promise<string> {
    if (this.store !== null) {
      await this.store.close();
      this.store = null;
    }
    this.tableNames = [TABLE_NAME];
    this.insertCount = 0;
    this.updateCount = 0;
    this.deleteCount = 0;
    this.queryCount = 0;
    this.transactionActive = false;
    this.lastOperationTime = 0;
    return await this.initialize();
  }

  private getInstance(): relationalStore.RdbStore {
    if (this.store === null) {
      throw new Error('Initialize the RDB store first');
    }
    return this.store;
  }
}
