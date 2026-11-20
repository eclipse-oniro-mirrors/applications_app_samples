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
import { AppLogger } from 'common';
import { IrCode } from 'ircore';
import {
  ConfigExportResult,
  ConfigImportReport,
  Device,
  DeviceExpectedState,
  RemoteTemplate,
  Room,
  RoomKey,
  Scene,
  SceneStep
} from '../model/RoomTypes';
import { AppDatabase } from '../data/AppDatabase';
import { RoomDao } from '../data/RoomDao';
import { DeviceDao } from '../data/DeviceDao';
import { KeyDao } from '../data/KeyDao';
import { IrCodeDao } from '../data/IrCodeDao';
import { RemoteTemplateDao } from '../data/RemoteTemplateDao';
import { SceneDao } from '../data/SceneDao';
import { SceneStepDao } from '../data/SceneStepDao';
import { ExpectedStateDao } from '../data/ExpectedStateDao';
import { ConfigPackageData, ConfigPackageSchema } from './ConfigPackageSchema';

const SCOPE: string = 'ConfigPackageService';
/** Directory (relative to filesDir) holding exported package files. */
const CONFIG_DIR: string = 'config-packages';
/** Directory (relative to filesDir) holding pre-import database backups. */
const BACKUP_DIR: string = 'backup';
/** File name prefix for exported configuration packages. */
const EXPORT_PREFIX: string = 'meeting-config-';
/** Database file extension used for pre-import backups. */
const DB_FILE_EXT: string = '.db';
/** JSON file extension used for exported packages. */
const JSON_FILE_EXT: string = '.json';
/** hiTraceMeter span name for one configuration package export. */
const CONFIG_EXPORT_TRACE_NAME: string = 'MeetingScene.ConfigExport';
/** Independent hiTraceMeter task id so the export span is easy to filter. */
const CONFIG_EXPORT_TRACE_TASK_ID: number = 4603;
/** hiTraceMeter span name for one configuration package import. */
const CONFIG_IMPORT_TRACE_NAME: string = 'MeetingScene.ConfigImport';
/** Independent hiTraceMeter task id so the import span is easy to filter. */
const CONFIG_IMPORT_TRACE_TASK_ID: number = 4604;
/**
 * Clear order for the import transaction: dependent rows first so FK-free
 * tables stay consistent even if a later insert fails and rolls back.
 */
const CLEAR_ORDER: string[] = [
  'device_expected_state', 'scene_step', 'scene',
  'key', 'device', 'room', 'remote_template', 'ir_code'
];

/**
 * Exports selected rooms (with all dependent rows) into a self-contained
 * JSON package and imports such packages back into the database.
 */
export class ConfigPackageService {
  private static appContext: common.Context | undefined = undefined;

  /** Captures the application context used for file operations. */
  static setContext(context: common.Context): void {
    ConfigPackageService.appContext = context;
  }

  /**
   * Collects rooms, devices, keys, IR codes, templates, scenes, steps and
   * expected states for the given room ids and writes them to one JSON file.
   * Wrapped in the MeetingScene.ConfigExport hiTraceMeter span.
   */
  static async export(roomIds: string[]): Promise<ConfigExportResult> {
    const result: ConfigExportResult = new ConfigExportResult();
    AppLogger.info(SCOPE, `export enter: roomIds=${roomIds.length}`);
    hiTraceMeter.startTrace(CONFIG_EXPORT_TRACE_NAME, CONFIG_EXPORT_TRACE_TASK_ID);
    try {
      const allRooms: Room[] = await RoomDao.list();
      const rooms: Room[] = [];
      for (let i = 0; i < allRooms.length; i++) {
        if (roomIds.indexOf(allRooms[i].id) >= 0) {
          rooms.push(allRooms[i]);
        }
      }

      const devices: Device[] = [];
      const scenes: Scene[] = [];
      for (let i = 0; i < rooms.length; i++) {
        const roomDevices: Device[] = await DeviceDao.listByRoom(rooms[i].id);
        for (let j = 0; j < roomDevices.length; j++) {
          devices.push(roomDevices[j]);
        }
        const roomScenes: Scene[] = await SceneDao.listByRoom(rooms[i].id);
        for (let j = 0; j < roomScenes.length; j++) {
          scenes.push(roomScenes[j]);
        }
      }

      const keys: RoomKey[] = [];
      const deviceIds: string[] = [];
      const codeIds: string[] = [];
      for (let i = 0; i < devices.length; i++) {
        deviceIds.push(devices[i].id);
        const deviceKeys: RoomKey[] = await KeyDao.listByDevice(devices[i].id);
        for (let j = 0; j < deviceKeys.length; j++) {
          keys.push(deviceKeys[j]);
          const codeId: string = deviceKeys[j].irCodeId;
          if (codeId.length > 0 && codeIds.indexOf(codeId) < 0) {
            codeIds.push(codeId);
          }
        }
      }

      const sceneSteps: SceneStep[] = [];
      for (let i = 0; i < scenes.length; i++) {
        const steps: SceneStep[] = await SceneStepDao.listByScene(scenes[i].id);
        for (let j = 0; j < steps.length; j++) {
          sceneSteps.push(steps[j]);
        }
      }

      const irCodes: IrCode[] = await IrCodeDao.listByIds(codeIds);
      const expectedStates: DeviceExpectedState[] =
        await ExpectedStateDao.listByDeviceIds(deviceIds);
      const remoteTemplates: RemoteTemplate[] = await RemoteTemplateDao.list();

      const data: ConfigPackageData = ConfigPackageSchema.build(
        rooms, devices, keys, irCodes, remoteTemplates, scenes, sceneSteps,
        expectedStates, 'EXPORT', Date.now());

      const context: common.Context = ConfigPackageService.requireContext();
      const dir: string = `${context.filesDir}/${CONFIG_DIR}`;
      if (!fileIo.accessSync(dir)) {
        fileIo.mkdirSync(dir, true);
      }
      const filePath: string = `${dir}/${EXPORT_PREFIX}${Date.now()}${JSON_FILE_EXT}`;
      const file: fileIo.File = fileIo.openSync(filePath,
        fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
      try {
        fileIo.writeSync(file.fd, ConfigPackageSchema.toJson(data));
      } finally {
        fileIo.closeSync(file);
      }

      result.ok = true;
      result.filePath = filePath;
      result.roomCount = rooms.length;
      result.deviceCount = devices.length;
      result.message = 'Export succeeded';
      AppLogger.info(SCOPE,
        `export success: file=${filePath}, rooms=${rooms.length}, devices=${devices.length}, keys=${keys.length}, scenes=${scenes.length}, steps=${sceneSteps.length}, codes=${irCodes.length}`);
    } catch (error) {
      const detail: string = error instanceof Error ? error.message : 'Export failed';
      result.ok = false;
      result.message = detail;
      AppLogger.error(SCOPE, `export failed: ${detail}`);
    } finally {
      hiTraceMeter.finishTrace(CONFIG_EXPORT_TRACE_NAME, CONFIG_EXPORT_TRACE_TASK_ID);
    }
    return result;
  }

  /**
   * Replaces the current configuration with the package stored in the given
   * JSON file. The database is backed up first; validation failures or write
   * failures leave the existing configuration untouched.
   * Wrapped in the MeetingScene.ConfigImport hiTraceMeter span.
   */
  static async import(filePath: string): Promise<ConfigImportReport> {
    const report: ConfigImportReport = new ConfigImportReport();
    AppLogger.info(SCOPE, `import enter: file=${filePath}`);
    hiTraceMeter.startTrace(CONFIG_IMPORT_TRACE_NAME, CONFIG_IMPORT_TRACE_TASK_ID);
    try {
      return await ConfigPackageService.importInner(report, filePath);
    } finally {
      hiTraceMeter.finishTrace(CONFIG_IMPORT_TRACE_NAME, CONFIG_IMPORT_TRACE_TASK_ID);
    }
  }

  /** Implements the import steps; kept separate to pair the trace cleanly. */
  private static async importInner(report: ConfigImportReport,
    filePath: string): Promise<ConfigImportReport> {
    let text: string = '';
    try {
      text = fileIo.readTextSync(filePath);
    } catch (error) {
      AppLogger.warn(SCOPE, 'import aborted: unable to read the config file');
      report.ok = false;
      report.failedItems.push('Unable to read the config file');
      report.message = 'Unable to read the config file';
      return report;
    }

    let raw: Record<string, Object> | undefined = undefined;
    try {
      raw = JSON.parse(text) as Record<string, Object>;
    } catch (error) {
      AppLogger.warn(SCOPE, 'import aborted: failed to parse the config file JSON');
      report.ok = false;
      report.failedItems.push('Failed to parse the config file JSON');
      report.message = 'Failed to parse the config file JSON';
      return report;
    }
    if (raw === undefined) {
      AppLogger.warn(SCOPE, 'import aborted: failed to parse the config file JSON');
      report.ok = false;
      report.failedItems.push('Failed to parse the config file JSON');
      report.message = 'Failed to parse the config file JSON';
      return report;
    }

    const errors: string[] = ConfigPackageSchema.validateRecord(raw);
    if (errors.length > 0) {
      AppLogger.warn(SCOPE, `import rejected: validation failed, problems=${errors.length}`);
      report.ok = false;
      report.failedItems = errors;
      report.message = 'Config package validation failed; existing configuration is unchanged';
      return report;
    }
    const data: ConfigPackageData = ConfigPackageSchema.parse(raw);

    let backupPath: string = '';
    try {
      backupPath =
        `${ConfigPackageService.requireContext().filesDir}/${BACKUP_DIR}/import-${Date.now()}${DB_FILE_EXT}`;
    } catch (error) {
      const detail: string = error instanceof Error ? error.message : 'Database is not initialized';
      AppLogger.warn(SCOPE, `import aborted: backup path unavailable, ${detail}`);
      report.ok = false;
      report.failedItems.push(detail);
      report.message = 'Cannot locate the database backup directory before import';
      return report;
    }
    report.backupPath = backupPath;
    const backedUp: boolean = await AppDatabase.backupTo(backupPath);
    if (!backedUp) {
      AppLogger.error(SCOPE, 'import aborted: database backup failed');
      report.ok = false;
      report.failedItems.push('Database backup failed before import');
      report.message = 'Database backup failed before import; import aborted';
      return report;
    }
    AppLogger.info(SCOPE, `import backup success: file=${backupPath}`);

    try {
      AppDatabase.beginTransaction();
      const store: relationalStore.RdbStore = AppDatabase.getStore();
      for (let i = 0; i < CLEAR_ORDER.length; i++) {
        await store.executeSql(`DELETE FROM ${CLEAR_ORDER[i]}`);
      }
      for (let i = 0; i < data.rooms.length; i++) {
        await RoomDao.insert(data.rooms[i]);
      }
      for (let i = 0; i < data.remoteTemplates.length; i++) {
        await RemoteTemplateDao.insert(data.remoteTemplates[i]);
      }
      await IrCodeDao.insertMany(data.irCodes);
      for (let i = 0; i < data.devices.length; i++) {
        await DeviceDao.insert(data.devices[i]);
      }
      for (let i = 0; i < data.keys.length; i++) {
        await KeyDao.insert(data.keys[i]);
      }
      for (let i = 0; i < data.scenes.length; i++) {
        await SceneDao.insert(data.scenes[i]);
      }
      for (let i = 0; i < data.sceneSteps.length; i++) {
        await SceneStepDao.insert(data.sceneSteps[i]);
      }
      for (let i = 0; i < data.expectedStates.length; i++) {
        await ExpectedStateDao.upsert(data.expectedStates[i]);
      }
      AppDatabase.commit();

      report.ok = true;
      report.importedRooms = data.rooms.length;
      report.importedDevices = data.devices.length;
      report.importedKeys = data.keys.length;
      report.importedScenes = data.scenes.length;
      report.message = 'Import complete';
      AppLogger.info(SCOPE,
        `import success: rooms=${report.importedRooms}, devices=${report.importedDevices}, keys=${report.importedKeys}, scenes=${report.importedScenes}, steps=${data.sceneSteps.length}, codes=${data.irCodes.length}`);
    } catch (error) {
      try {
        AppDatabase.rollBack();
      } catch (rollbackError) {
        AppLogger.error(SCOPE, 'import rollback failed; database may be inconsistent');
        report.message = 'Rollback failed';
      }
      const detail: string = error instanceof Error ? error.message : 'Import failed';
      report.ok = false;
      report.failedItems.push(detail);
      report.message = 'Import failed; existing configuration kept';
      AppLogger.error(SCOPE, `import failed and rolled back: ${detail}`);
    }
    return report;
  }

  /** Returns the captured context or falls back to the database context. */
  private static requireContext(): common.Context {
    const context: common.Context | undefined = ConfigPackageService.appContext;
    if (context !== undefined) {
      return context;
    }
    return AppDatabase.getContext();
  }
}
