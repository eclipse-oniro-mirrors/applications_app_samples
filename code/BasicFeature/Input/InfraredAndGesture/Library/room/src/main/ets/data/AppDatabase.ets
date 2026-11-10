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
import { common } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { AppConstants, AppLogger } from 'common';
import { MigrationResult } from '../model/RoomTypes';
import { SchemaMigration } from './SchemaMigration';

const SCOPE: string = 'AppDatabase';
/** hiTraceMeter span name for the database initialization flow. */
const DB_INIT_TRACE_NAME: string = 'MeetingScene.DbInit';
/** Independent hiTraceMeter task id so the db-init span is easy to filter. */
const DB_INIT_TRACE_TASK_ID: number = 4601;
/** Backup file name prefix for corrupted databases. */
const CORRUPT_BACKUP_PREFIX: string = 'corrupt-';
/** Database file extension used for backup copies. */
const DB_FILE_EXT: string = '.db';

/**
 * Database DDL executed on every start; all statements are idempotent so they
 * simply keep an existing schema untouched. Embedded newlines are harmless
 * SQL whitespace and keep the definitions readable.
 */
const CREATE_STATEMENTS: string[] = [
  `CREATE TABLE IF NOT EXISTS room (
    id TEXT PRIMARY KEY, name TEXT NOT NULL, note TEXT NOT NULL,
    sort_order INTEGER NOT NULL, created_at INTEGER NOT NULL, updated_at INTEGER NOT NULL)`,
  `CREATE TABLE IF NOT EXISTS device (
    id TEXT PRIMARY KEY, room_id TEXT NOT NULL, name TEXT NOT NULL, type TEXT NOT NULL,
    template_id TEXT NOT NULL, brand TEXT NOT NULL, model TEXT NOT NULL,
    sort_order INTEGER NOT NULL, created_at INTEGER NOT NULL, updated_at INTEGER NOT NULL)`,
  `CREATE TABLE IF NOT EXISTS key (
    id TEXT PRIMARY KEY, device_id TEXT NOT NULL, semantic TEXT NOT NULL, label TEXT NOT NULL,
    ir_code_id TEXT NOT NULL, sort_order INTEGER NOT NULL)`,
  `CREATE TABLE IF NOT EXISTS ir_code (
    id TEXT PRIMARY KEY, protocol TEXT NOT NULL, frequency_hz INTEGER NOT NULL, payload TEXT NOT NULL,
    repeat_count INTEGER NOT NULL, source TEXT NOT NULL, license TEXT NOT NULL, brand TEXT NOT NULL,
    model TEXT NOT NULL, key_semantic TEXT NOT NULL, checksum TEXT NOT NULL)`,
  `CREATE TABLE IF NOT EXISTS remote_template (
    id TEXT PRIMARY KEY, device_type TEXT NOT NULL, name TEXT NOT NULL, layout TEXT NOT NULL,
    builtin INTEGER NOT NULL)`,
  `CREATE TABLE IF NOT EXISTS scene (
    id TEXT PRIMARY KEY, room_id TEXT NOT NULL, name TEXT NOT NULL, icon TEXT NOT NULL,
    sort_order INTEGER NOT NULL)`,
  `CREATE TABLE IF NOT EXISTS scene_step (
    id TEXT PRIMARY KEY, scene_id TEXT NOT NULL, device_id TEXT NOT NULL, key_id TEXT NOT NULL,
    delay_ms INTEGER NOT NULL, step_order INTEGER NOT NULL, enabled INTEGER NOT NULL,
    UNIQUE(scene_id, step_order))`,
  `CREATE TABLE IF NOT EXISTS device_expected_state (
    device_id TEXT PRIMARY KEY, power TEXT NOT NULL, level INTEGER NOT NULL,
    source TEXT NOT NULL, updated_at INTEGER NOT NULL)`,
  `CREATE TABLE IF NOT EXISTS send_log (
    id TEXT PRIMARY KEY, timestamp INTEGER NOT NULL, room_id TEXT NOT NULL, device_id TEXT NOT NULL,
    key_id TEXT NOT NULL, frequency_hz INTEGER NOT NULL, pattern_summary TEXT NOT NULL,
    result TEXT NOT NULL, duration_ms INTEGER NOT NULL, scene_run_id TEXT NOT NULL)`,
  'CREATE INDEX IF NOT EXISTS idx_device_room ON device(room_id)',
  'CREATE INDEX IF NOT EXISTS idx_scene_room ON scene(room_id)',
  'CREATE INDEX IF NOT EXISTS idx_step_scene ON scene_step(scene_id)',
  'CREATE INDEX IF NOT EXISTS idx_send_log_ts ON send_log(timestamp)'
];

/**
 * Process-wide holder of the relational store and application context.
 * Callers reach the store through the static DAO helpers so a single
 * {@code init} call from the UI ability is enough to bootstrap persistence.
 */
export class AppDatabase {
  // Single shared store instance, set after a successful init.
  private static appStore: relationalStore.RdbStore | undefined = undefined;
  // Context captured at init time and reused for file operations.
  private static appContext: common.Context | undefined = undefined;

  /**
   * Opens (or creates) the RDB store, migrates it to the current schema
   * version and creates all tables. Backs the database file up before
   * throwing when initialization fails, so data can be inspected later.
   *
   * @param context ability context used to resolve the database directory
   * @throws Error when the store cannot be opened or migrated
   */
  static async init(context: common.Context): Promise<void> {
    AppDatabase.appContext = context;
    AppLogger.info(SCOPE, `db init enter: name=${AppConstants.DB_NAME}, version=${AppConstants.DB_VERSION}`);
    hiTraceMeter.startTrace(DB_INIT_TRACE_NAME, DB_INIT_TRACE_TASK_ID); // Open the MeetingScene.DbInit span for the whole bootstrap.
    try {
      const config: relationalStore.StoreConfig = {
        name: AppConstants.DB_NAME,
        securityLevel: relationalStore.SecurityLevel.S1
      };
      const store: relationalStore.RdbStore =
        await relationalStore.getRdbStore(context, config);
      const migration: MigrationResult = await SchemaMigration.migrate(context, store);
      if (!migration.ok) {
        AppLogger.error(SCOPE, `db init aborted: migration failed, ${migration.message}`);
        throw new Error(migration.message);
      }
      await AppDatabase.createTables(store);
      AppDatabase.appStore = store;
      AppLogger.info(SCOPE, `db init success: tables=${CREATE_STATEMENTS.length}`);
    } catch (error) {
      await AppDatabase.backupCorrupt(context);
      const detail: string = error instanceof Error ? error.message : 'Database initialization failed';
      AppLogger.error(SCOPE, `db init failed: ${detail}`);
      throw new Error(detail);
    } finally {
      hiTraceMeter.finishTrace(DB_INIT_TRACE_NAME, DB_INIT_TRACE_TASK_ID);
    }
  }

  /** Returns the initialized store or throws when init has not run yet. */
  static getStore(): relationalStore.RdbStore {
    const store: relationalStore.RdbStore | undefined = AppDatabase.appStore;
    if (store === undefined) {
      throw new Error('Database not initialized');
    }
    return store;
  }

  /** Returns the context captured during init or throws when init has not run. */
  static getContext(): common.Context {
    const context: common.Context | undefined = AppDatabase.appContext;
    if (context === undefined) {
      throw new Error('Database not initialized');
    }
    return context;
  }

  /** Reports whether the store is initialized and usable. */
  static isReady(): boolean {
    return AppDatabase.appStore !== undefined;
  }

  /** Starts an explicit transaction on the shared store. */
  static beginTransaction(): void {
    AppDatabase.getStore().beginTransaction();
  }

  /** Commits the current transaction. */
  static commit(): void {
    AppDatabase.getStore().commit();
  }

  /** Rolls back the current transaction. */
  static rollBack(): void {
    AppDatabase.getStore().rollBack();
  }

  /** Closes the shared store and clears the cached references. */
  static async close(): Promise<void> {
    const store: relationalStore.RdbStore | undefined = AppDatabase.appStore;
    AppDatabase.appStore = undefined;
    if (store !== undefined) {
      await store.close();
      AppLogger.info(SCOPE, 'db closed');
    }
  }

  /**
   * Copies the database file to the given absolute path, creating missing
   * parent directories as needed.
   *
   * @returns true when the copy succeeded, false otherwise
   */
  static async backupTo(targetPath: string): Promise<boolean> {
    const context: common.Context | undefined = AppDatabase.appContext;
    if (context === undefined) {
      return false;
    }
    try {
      const source: string = AppDatabase.dbFilePath(context);
      const dir: string = targetPath.substring(0, targetPath.lastIndexOf('/'));
      if (dir.length > 0 && !fileIo.accessSync(dir)) {
        fileIo.mkdirSync(dir, true);
      }
      fileIo.copyFileSync(source, targetPath);
      AppLogger.info(SCOPE, `db backup success: target=${targetPath}`);
      return true;
    } catch (error) {
      AppLogger.warn(SCOPE, `db backup failed: target=${targetPath}`);
      return false;
    }
  }

  /** Builds the absolute path of the RDB database file for this app. */
  private static dbFilePath(context: common.Context): string {
    return `${context.databaseDir}/rdb/${AppConstants.DB_NAME}`;
  }

  /** Executes every DDL statement in declaration order. */
  private static async createTables(store: relationalStore.RdbStore): Promise<void> {
    for (let i = 0; i < CREATE_STATEMENTS.length; i++) {
      await store.executeSql(CREATE_STATEMENTS[i]);
    }
  }

  /** Copies a suspected-corrupt database aside before re-initialization. */
  private static async backupCorrupt(context: common.Context): Promise<void> {
    const target: string =
      `${context.filesDir}/backup/${CORRUPT_BACKUP_PREFIX}${Date.now()}${DB_FILE_EXT}`;
    await AppDatabase.backupTo(target);
  }
}
