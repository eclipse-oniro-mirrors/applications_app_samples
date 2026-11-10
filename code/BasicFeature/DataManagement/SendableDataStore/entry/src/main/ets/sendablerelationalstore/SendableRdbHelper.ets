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
import { relationalStore, sendableRelationalStore } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../utils/Logger';
import { DataValidator } from '../utils/DataValidator';
import { DataStoreConstants } from '../constants/DataStoreConstants';
import { TableSchema, SchemaField, OperationResult } from '../models/DataModels';

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
  private insertCount = 0;
  private updateCount = 0;
  private deleteCount = 0;
  private queryCount = 0;
  private transactionActive = false;
  private lastOperationTime = 0;

  constructor(context: common.UIAbilityContext) {
    this.context = context;
  }

  async initialize(): Promise<string> {
    if (this.store !== null) {
      return 'RDB store is already initialized';
    }
    this.store = await relationalStore.getRdbStore(this.context, STORE_CONFIG);
    await this.store.executeSql(CREATE_TABLE_SQL);
    return 'RDB store and table are ready';
  }

  async convertInsertAndQuery(): Promise<string> {
    const source: relationalStore.ValuesBucket = {
      name: `Sendable user ${Date.now()}`,
      age: 26,
      active: true
    };
    const sendableBucket = sendableRelationalStore.toSendableValuesBucket(source);
    const normalBucket = sendableRelationalStore.fromSendableValuesBucket(sendableBucket);
    const rowId = this.getInstance().insertSync(TABLE_NAME, sendableBucket);
    const predicates = new relationalStore.RdbPredicates(TABLE_NAME);
    predicates.equalTo('id', rowId);
    const resultSet = await this.getInstance().query(predicates);
    try {
      if (resultSet.rowCount > 0 && resultSet.goToFirstRow()) {
        const sendableRow = resultSet.getSendableRow();
        const normalRow = sendableRelationalStore.fromSendableValuesBucket(sendableRow);
        return `Converted=${JSON.stringify(normalBucket)}; rowId=${rowId}; query=${JSON.stringify(normalRow)}`;
      }
      return `Converted=${JSON.stringify(normalBucket)}; inserted rowId=${rowId}; query returned no rows`;
    } finally {
      resultSet.close();
    }
  }

  convertValues(): string {
    const source: sendableRelationalStore.NonSendableValues = ['Sendable', 26, true, null];
    const sendableValues = sendableRelationalStore.toSendableValues(source);
    const normalValues = sendableRelationalStore.fromSendableValues(sendableValues);
    return `toSendableValues length=${sendableValues.length}; fromSendableValues=${JSON.stringify(normalValues)}`;
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
    const sendableAsset = sendableRelationalStore.toSendableAsset(source);
    const normalAsset = sendableRelationalStore.fromSendableAsset(sendableAsset);
    return `toSendableAsset name=${sendableAsset.name}; fromSendableAsset=${JSON.stringify(normalAsset)}`;
  }

  async closeStore(): Promise<string> {
    if (this.store === null) {
      return 'RDB store is already closed';
    }
    await this.store.close();
    this.store = null;
    this.tableNames = [];
    return 'RDB store closed';
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
      return `createTable failed: invalid table name '${tableName}'`;
    }
    const instance = this.getInstance();
    let columns = 'id INTEGER PRIMARY KEY AUTOINCREMENT';
    for (let i = 0; i < schema.fields.length; i++) {
      const field = schema.fields[i];
      let colDef = `${field.name} TEXT`;
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
    const createSql = `CREATE TABLE IF NOT EXISTS ${tableName} (${columns})`;
    await instance.executeSql(createSql);
    this.tableNames.push(tableName);
    return `createTable '${tableName}' completed with ${schema.fields.length} fields`;
  }

  async dropTable(tableName: string): Promise<string> {
    if (!DataValidator.isValidTableName(tableName)) {
      return `dropTable failed: invalid table name '${tableName}'`;
    }
    if (tableName === TABLE_NAME) {
      return `dropTable failed: cannot drop default table '${TABLE_NAME}'`;
    }
    const instance = this.getInstance();
    await instance.executeSql(`DROP TABLE IF EXISTS ${tableName}`);
    const remaining: string[] = [];
    for (let i = 0; i < this.tableNames.length; i++) {
      if (this.tableNames[i] !== tableName) {
        remaining.push(this.tableNames[i]);
      }
    }
    this.tableNames = remaining;
    return `dropTable '${tableName}' completed`;
  }

  listTables(): string {
    return `Tables: [${this.tableNames.join(', ')}] (${this.tableNames.length} tables)`;
  }

  hasTable(tableName: string): boolean {
    for (let i = 0; i < this.tableNames.length; i++) {
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
      return `batchInsert failed: invalid table name '${tableName}'`;
    }
    if (buckets.length === 0) {
      return 'batchInsert failed: empty buckets array';
    }
    if (buckets.length > DataStoreConstants.MAX_BATCH_SIZE) {
      return `batchInsert failed: batch size ${buckets.length} exceeds max ${DataStoreConstants.MAX_BATCH_SIZE}`;
    }
    const instance = this.getInstance();
    let successCount = 0;
    const rowIds: number[] = [];
    for (let i = 0; i < buckets.length; i++) {
      const sendableBucket = sendableRelationalStore.toSendableValuesBucket(buckets[i]);
      try {
        const rowId = instance.insertSync(tableName, sendableBucket);
        rowIds.push(rowId);
        successCount++;
      } catch (e) {
        Logger.error(`batchInsert row ${i} failed: ${(e as Error).message}`);
      }
    }
    this.insertCount += successCount;
    this.lastOperationTime = Date.now();
    return `batchInsert into '${tableName}': ${successCount}/${buckets.length} rows inserted, ids=[${rowIds.join(',')}]`;
  }

  async update(tableName: string, bucket: relationalStore.ValuesBucket, predicate: relationalStore.RdbPredicates): Promise<string> {
    if (!DataValidator.isValidTableName(tableName)) {
      return `update failed: invalid table name '${tableName}'`;
    }
    const instance = this.getInstance();
    const sendableBucket = sendableRelationalStore.toSendableValuesBucket(bucket);
    const normalBucket = sendableRelationalStore.fromSendableValuesBucket(sendableBucket);
    const rowCount = await instance.update(normalBucket, predicate);
    this.updateCount += rowCount;
    this.lastOperationTime = Date.now();
    return `update '${tableName}': ${rowCount} rows updated`;
  }

  updateSync(tableName: string, bucket: relationalStore.ValuesBucket, predicate: relationalStore.RdbPredicates): string {
    if (!DataValidator.isValidTableName(tableName)) {
      return `updateSync failed: invalid table name '${tableName}'`;
    }
    const instance = this.getInstance();
    const sendableBucket = sendableRelationalStore.toSendableValuesBucket(bucket);
    const normalBucket = sendableRelationalStore.fromSendableValuesBucket(sendableBucket);
    const rowCount = instance.updateSync(normalBucket, predicate);
    this.updateCount += rowCount;
    this.lastOperationTime = Date.now();
    return `updateSync '${tableName}': ${rowCount} rows updated`;
  }

  async deleteByPredicates(tableName: string, predicate: relationalStore.RdbPredicates): Promise<string> {
    if (!DataValidator.isValidTableName(tableName)) {
      return `deleteByPredicates failed: invalid table name '${tableName}'`;
    }
    const instance = this.getInstance();
    const rowCount = await instance.delete(predicate);
    this.deleteCount += rowCount;
    this.lastOperationTime = Date.now();
    return `deleteByPredicates from '${tableName}': ${rowCount} rows deleted`;
  }

  deleteByPredicatesSync(tableName: string, predicate: relationalStore.RdbPredicates): string {
    if (!DataValidator.isValidTableName(tableName)) {
      return `deleteByPredicatesSync failed: invalid table name '${tableName}'`;
    }
    const instance = this.getInstance();
    const rowCount = instance.deleteSync(predicate);
    this.deleteCount += rowCount;
    this.lastOperationTime = Date.now();
    return `deleteByPredicatesSync from '${tableName}': ${rowCount} rows deleted`;
  }

  async queryAll(tableName: string): Promise<string> {
    if (!DataValidator.isValidTableName(tableName)) {
      return `queryAll failed: invalid table name '${tableName}'`;
    }
    const instance = this.getInstance();
    const predicates = new relationalStore.RdbPredicates(tableName);
    const resultSet = await instance.query(predicates);
    try {
      const rowCount = resultSet.rowCount;
      const columns = resultSet.columnNames;
      const rows: string[] = [];
      if (rowCount > 0) {
        while (resultSet.goToNextRow()) {
          const row: string[] = [];
          for (let c = 0; c < columns.length; c++) {
            const val = resultSet.getString(c);
            row.push(`${columns[c]}=${val}`);
          }
          rows.push(`{${row.join(', ')}}`);
        }
      }
      this.queryCount++;
      this.lastOperationTime = Date.now();
      return `queryAll '${tableName}': ${rowCount} rows, columns=[${columns.join(',')}]`;
    } finally {
      resultSet.close();
    }
  }

  queryAllSync(tableName: string): string {
    if (!DataValidator.isValidTableName(tableName)) {
      return `queryAllSync failed: invalid table name '${tableName}'`;
    }
    const instance = this.getInstance();
    const predicates = new relationalStore.RdbPredicates(tableName);
    const resultSet = instance.querySync(predicates);
    try {
      const rowCount = resultSet.rowCount;
      const columns = resultSet.columnNames;
      this.queryCount++;
      this.lastOperationTime = Date.now();
      return `queryAllSync '${tableName}': ${rowCount} rows, columns=[${columns.join(',')}]`;
    } finally {
      resultSet.close();
    }
  }

  async beginTransaction(): Promise<string> {
    if (this.transactionActive) {
      return 'beginTransaction failed: transaction already active';
    }
    const instance = this.getInstance();
    try {
      await instance.executeSql('BEGIN TRANSACTION');
    } catch (e) {
      const msg = (e as Error).message;
      if (msg.indexOf('Capability not support') >= 0) {
        this.transactionActive = true;
        return 'beginTransaction completed (simulated, capability not supported)';
      }
      return `beginTransaction failed: ${msg}`;
    }
    this.transactionActive = true;
    return 'beginTransaction completed';
  }

  async commitTransaction(): Promise<string> {
    if (!this.transactionActive) {
      return 'commitTransaction failed: no active transaction';
    }
    const instance = this.getInstance();
    try {
      await instance.executeSql('COMMIT');
    } catch (e) {
      const msg = (e as Error).message;
      if (msg.indexOf('Capability not support') >= 0) {
        this.transactionActive = false;
        return 'commitTransaction completed (simulated, capability not supported)';
      }
      return `commitTransaction failed: ${msg}`;
    }
    this.transactionActive = false;
    return 'commitTransaction completed';
  }

  async rollbackTransaction(): Promise<string> {
    if (!this.transactionActive) {
      return 'rollbackTransaction failed: no active transaction';
    }
    const instance = this.getInstance();
    try {
      await instance.executeSql('ROLLBACK');
    } catch (e) {
      const msg = (e as Error).message;
      if (msg.indexOf('Capability not support') >= 0) {
        this.transactionActive = false;
        return 'rollbackTransaction completed (simulated, capability not supported)';
      }
      return `rollbackTransaction failed: ${msg}`;
    }
    this.transactionActive = false;
    return 'rollbackTransaction completed';
  }

  isTransactionActive(): boolean {
    return this.transactionActive;
  }

  async executeRawSQL(sql: string): Promise<string> {
    if (!DataValidator.isValidSQL(sql)) {
      return 'executeRawSQL failed: invalid SQL';
    }
    const instance = this.getInstance();
    await instance.executeSql(sql);
    const upperSql = sql.trim().toUpperCase();
    if (upperSql.indexOf('INSERT') === 0) {
      this.insertCount++;
    } else if (upperSql.indexOf('UPDATE') === 0) {
      this.updateCount++;
    } else if (upperSql.indexOf('DELETE') === 0) {
      this.deleteCount++;
    }
    this.lastOperationTime = Date.now();
    return `executeRawSQL completed: ${sql.substring(0, 50)}`;
  }

  executeRawSQLSync(sql: string): string {
    if (!DataValidator.isValidSQL(sql)) {
      return 'executeRawSQLSync failed: invalid SQL';
    }
    const instance = this.getInstance();
    instance.executeSync(sql);
    const upperSql = sql.trim().toUpperCase();
    if (upperSql.indexOf('INSERT') === 0) {
      this.insertCount++;
    } else if (upperSql.indexOf('UPDATE') === 0) {
      this.updateCount++;
    } else if (upperSql.indexOf('DELETE') === 0) {
      this.deleteCount++;
    }
    this.lastOperationTime = Date.now();
    return `executeRawSQLSync completed: ${sql.substring(0, 50)}`;
  }

  async queryBySQL(sql: string, args: string[]): Promise<string> {
    if (!DataValidator.isValidSQL(sql)) {
      return 'queryBySQL failed: invalid SQL';
    }
    const instance = this.getInstance();
    const resultSet = await instance.querySql(sql, args);
    try {
      const rowCount = resultSet.rowCount;
      const columns = resultSet.columnNames;
      this.queryCount++;
      this.lastOperationTime = Date.now();
      return `queryBySQL: ${rowCount} rows, columns=[${columns.join(',')}]`;
    } finally {
      resultSet.close();
    }
  }

  queryBySQLSync(sql: string, args: string[]): string {
    if (!DataValidator.isValidSQL(sql)) {
      return 'queryBySQLSync failed: invalid SQL';
    }
    const instance = this.getInstance();
    const resultSet = instance.querySqlSync(sql, args);
    try {
      const rowCount = resultSet.rowCount;
      const columns = resultSet.columnNames;
      this.queryCount++;
      this.lastOperationTime = Date.now();
      return `queryBySQLSync: ${rowCount} rows, columns=[${columns.join(',')}]`;
    } finally {
      resultSet.close();
    }
  }

  convertBatchBuckets(buckets: relationalStore.ValuesBucket[]): string {
    if (buckets.length === 0) {
      return 'convertBatchBuckets failed: empty input';
    }
    if (buckets.length > DataStoreConstants.MAX_BATCH_SIZE) {
      return `convertBatchBuckets failed: batch size ${buckets.length} exceeds max`;
    }
    const converted: string[] = [];
    for (let i = 0; i < buckets.length; i++) {
      const sendable = sendableRelationalStore.toSendableValuesBucket(buckets[i]);
      const normal = sendableRelationalStore.fromSendableValuesBucket(sendable);
      converted.push(JSON.stringify(normal));
    }
    return `convertBatchBuckets: ${converted.length} buckets converted`;
  }

  async convertResultSetToJSON(tableName: string): Promise<string> {
    if (!DataValidator.isValidTableName(tableName)) {
      return 'convertResultSetToJSON failed: invalid table name';
    }
    const instance = this.getInstance();
    const predicates = new relationalStore.RdbPredicates(tableName);
    const resultSet = await instance.query(predicates);
    try {
      const rowCount = resultSet.rowCount;
      const columns = resultSet.columnNames;
      const jsonRows: string[] = [];
      if (rowCount > 0) {
        while (resultSet.goToNextRow()) {
          const row: string[] = [];
          for (let c = 0; c < columns.length; c++) {
            const val = resultSet.getString(c);
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
      return 'convertResultSetToJSONSync failed: invalid table name';
    }
    const instance = this.getInstance();
    const predicates = new relationalStore.RdbPredicates(tableName);
    const resultSet = instance.querySync(predicates);
    try {
      const rowCount = resultSet.rowCount;
      const columns = resultSet.columnNames;
      const jsonRows: string[] = [];
      if (rowCount > 0) {
        while (resultSet.goToNextRow()) {
          const row: string[] = [];
          for (let c = 0; c < columns.length; c++) {
            const val = resultSet.getString(c);
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
    return `RDB Statistics: tables=${this.tableNames.length}, inserts=${this.insertCount}, ` +
      `updates=${this.updateCount}, deletes=${this.deleteCount}, queries=${this.queryCount}, ` +
      `lastOp=${this.lastOperationTime}, initialized=${this.isInitialized()}, ` +
      `transactionActive=${this.transactionActive}`;
  }

  resetStatistics(): string {
    this.insertCount = 0;
    this.updateCount = 0;
    this.deleteCount = 0;
    this.queryCount = 0;
    this.lastOperationTime = 0;
    return 'RDB statistics reset';
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
