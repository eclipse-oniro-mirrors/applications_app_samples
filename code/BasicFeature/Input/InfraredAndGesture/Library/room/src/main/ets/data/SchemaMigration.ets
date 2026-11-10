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

const SCOPE: string = 'SchemaMigration';
/** hiTraceMeter span name for one schema migration run. */
const DB_MIGRATE_TRACE_NAME: string = 'MeetingScene.DbMigrate';
/** Independent hiTraceMeter task id so the migration span is easy to filter. */
const DB_MIGRATE_TRACE_TASK_ID: number = 4602;
/** Directory (relative to filesDir) that receives pre-migration backups. */
const MIGRATION_BACKUP_DIR: string = 'backup';
/** Database file extension used for migration backup copies. */
const DB_FILE_EXT: string = '.db';
/** System tables excluded from the emptiness check of a fresh database. */
const SYSTEM_TABLE_NAMES: string[] = ['android_metadata', 'sqlite_sequence'];

/**
 * Brings an existing RDB store to the schema version expected by this app
 * and records every step in logs plus a hiTraceMeter span.
 */
export class SchemaMigration {
  /** Compares database version direction for the migration flow and its callers. */
  static compareVersion(from: number, to: number): string {
    if (to > from) {
      return 'UPGRADE';
    }
    if (to < from) {
      return 'DOWNGRADE';
    }
    return 'SAME';
  }

  /**
   * Migrates the store to the current schema version when needed.
   * A downgrade attempt fails without touching data; a fresh empty store is
   * stamped with the current version directly; anything older is backed up
   * first and then upgraded.
   *
   * @param context ability context used for the pre-migration backup
   * @param store the RDB store to migrate
   * @returns a result describing version change, backup path and outcome
   */
  static async migrate(context: common.Context,
    store: relationalStore.RdbStore): Promise<MigrationResult> {
    const result: MigrationResult = new MigrationResult();
    const fromVersion: number = store.version;
    result.fromVersion = fromVersion;
    result.toVersion = AppConstants.DB_VERSION;
    AppLogger.info(SCOPE, `migrate enter: from=${fromVersion}, to=${AppConstants.DB_VERSION}`);
    hiTraceMeter.startTrace(DB_MIGRATE_TRACE_NAME, DB_MIGRATE_TRACE_TASK_ID); // Open the MeetingScene.DbMigrate span for this migration run.
    try {
      if (fromVersion === AppConstants.DB_VERSION) {
        result.ok = true;
        result.message = 'database version is current';
        AppLogger.info(SCOPE, 'migrate skipped: database version is current');
        return result;
      }
      if (fromVersion > AppConstants.DB_VERSION) {
        result.ok = false;
        result.message = 'Config version is newer than this app; please upgrade the app';
        AppLogger.warn(SCOPE, 'migrate rejected: config version is newer than this app');
        return result;
      }
      if (fromVersion === 0 && await SchemaMigration.isEmpty(store)) {
        store.version = AppConstants.DB_VERSION;
        result.ok = true;
        result.message = 'fresh database';
        AppLogger.info(SCOPE, 'migrate done: fresh database stamped to current version');
        return result;
      }

      const backupPath: string =
        `${context.filesDir}/${MIGRATION_BACKUP_DIR}/migration-v${fromVersion}-${Date.now()}${DB_FILE_EXT}`;
      try {
        SchemaMigration.copyDatabase(context, backupPath);
        result.backupPath = backupPath;
        AppLogger.info(SCOPE, `migrate backup success: path=${backupPath}`);
      } catch (error) {
        AppLogger.error(SCOPE, 'migrate aborted: backup before migration failed');
        result.ok = false;
        result.message = 'Backup before migration failed; migration aborted';
        return result;
      }

      // v1 is the baseline schema; older versions only need the version bump.
      store.version = AppConstants.DB_VERSION;
      result.ok = true;
      result.message = 'database migrated';
      AppLogger.info(SCOPE, 'migrate done: schema upgraded to current version');
      return result;
    } catch (error) {
      const detail: string = error instanceof Error ? error.message : 'Database migration failed';
      result.ok = false;
      result.message = detail;
      AppLogger.error(SCOPE, `migrate failed: ${detail}`);
      return result;
    } finally {
      hiTraceMeter.finishTrace(DB_MIGRATE_TRACE_NAME, DB_MIGRATE_TRACE_TASK_ID);
    }
  }

  /** Checks whether the store contains no user tables (fresh database). */
  private static async isEmpty(store: relationalStore.RdbStore): Promise<boolean> {
    const excluded: string = SYSTEM_TABLE_NAMES
      .map((name: string): string => `'${name}'`)
      .join(', ');
    const resultSet: relationalStore.ResultSet = await store.querySql(
      `SELECT COUNT(*) AS cnt FROM sqlite_master WHERE type = 'table' ` +
      `AND name NOT IN (${excluded})`);
    let count: number = 0;
    if (resultSet.goToNextRow()) {
      count = resultSet.getLong(resultSet.getColumnIndex('cnt'));
    }
    resultSet.close();
    return count === 0;
  }

  /** Copies the current database file to the target backup path. */
  private static copyDatabase(context: common.Context, targetPath: string): void {
    const source: string = `${context.databaseDir}/rdb/${AppConstants.DB_NAME}`;
    const dir: string = targetPath.substring(0, targetPath.lastIndexOf('/'));
    if (dir.length > 0 && !fileIo.accessSync(dir)) {
      fileIo.mkdirSync(dir, true);
    }
    fileIo.copyFileSync(source, targetPath);
  }
}
