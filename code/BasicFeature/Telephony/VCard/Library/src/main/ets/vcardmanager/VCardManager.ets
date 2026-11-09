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
import { BusinessError } from '@kit.BasicServicesKit';
import { ContactSummary, ContactDraft } from './model/ContactTypes';
import {
  CapabilityCheck,
  PermissionState,
  VCardPreview,
  PickedFile,
  ImportResult,
  ExportResult,
  VCardSettings
} from './model/VCardTypes';
import { HistoryEntry, HistoryStats } from './model/HistoryTypes';
import { ErrorExplain, ErrorCodeMap } from './common/ErrorCodeMap';
import { VCardConstants } from './common/VCardConstants';
import { VCardError } from './common/VCardError';
import { Logger } from './utils/Logger';
import { PermissionService } from './feature/PermissionService';
import { ContactService } from './feature/ContactService';
import { HistoryStore } from './feature/HistoryStore';
import { SettingsStore } from './feature/SettingsStore';
import { FileService } from './feature/FileService';
import { VCardParser } from './feature/VCardParser';
import { VCardImportService } from './feature/VCardImportService';
import { VCardExportService } from './feature/VCardExportService';

const CODE_UNKNOWN: number = 8300999;
const ERROR_READ_FAILED: string = 'READ_FAILED';

/**
 * Single entry point of the Library HAR. Every exception is converted into a
 * code/message or a safe default here, so pages never see unhandled rejections.
 * Write operations re-throw after logging so the page can report the failure.
 */
export class VCardManager {
  static checkCapability(): CapabilityCheck[] {
    try {
      return PermissionService.checkCapability();
    } catch (error) {
      VCardManager.logError('checkCapability', error);
      return [];
    }
  }

  static async getPermissionStates(context: common.Context): Promise<PermissionState[]> {
    try {
      return await PermissionService.getPermissionStates(context);
    } catch (error) {
      VCardManager.logError('getPermissionStates', error);
      return [];
    }
  }

  static async requestPermissions(context: common.Context): Promise<boolean> {
    try {
      return await PermissionService.requestPermissions(context);
    } catch (error) {
      VCardManager.logError('requestPermissions', error);
      return false;
    }
  }

  static async loadContacts(context: common.Context): Promise<ContactSummary[]> {
    try {
      Logger.info('[VCardManager] loadContacts');
      return await ContactService.loadContacts(context);
    } catch (error) {
      VCardManager.logError('loadContacts', error);
      return [];
    }
  }

  static async createContact(context: common.Context, draft: ContactDraft): Promise<number> {
    try {
      const id: number = await ContactService.createContact(context, draft);
      Logger.info('[VCardManager] createContact id=' + id);
      return id;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      VCardManager.logError('createContact', err);
      throw VCardManager.toVCardError(error);
    }
  }

  static async updateContact(context: common.Context, summary: ContactSummary, draft: ContactDraft): Promise<void> {
    try {
      await ContactService.updateContact(context, summary, draft);
      Logger.info('[VCardManager] updateContact key=' + summary.key);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      VCardManager.logError('updateContact', err);
      throw VCardManager.toVCardError(error);
    }
  }

  static async removeContact(context: common.Context, key: string): Promise<void> {
    try {
      await ContactService.removeContact(context, key);
      Logger.info('[VCardManager] removeContact key=' + key);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      VCardManager.logError('removeContact', err);
      throw VCardManager.toVCardError(error);
    }
  }

  static async pickVCardFile(context: common.Context): Promise<PickedFile | null> {
    try {
      const file: PickedFile | null = await VCardImportService.pick(context);
      Logger.info('[VCardManager] pickVCardFile ' + (file === null ? 'canceled' : file.name));
      return file;
    } catch (error) {
      VCardManager.logError('pickVCardFile', error);
      return null;
    }
  }

  static async previewSandboxFile(filePath: string, fileName: string): Promise<VCardPreview> {
    try {
      const content: string = await FileService.readText(filePath);
      const preview: VCardPreview = VCardParser.parse(content, fileName);
      preview.filePath = filePath;
      preview.fileName = fileName;
      preview.sizeBytes = await FileService.fileSize(filePath);
      Logger.info('[VCardManager] previewSandboxFile cards=' + preview.cardCount);
      return preview;
    } catch (error) {
      VCardManager.logError('previewSandboxFile', error);
      const preview: VCardPreview = new VCardPreview();
      preview.filePath = filePath;
      preview.fileName = fileName;
      preview.errorMessage = ERROR_READ_FAILED;
      return preview;
    }
  }

  static previewContent(content: string, fileName: string): VCardPreview {
    return VCardParser.parse(content, fileName);
  }

  static previewToContacts(preview: VCardPreview): ContactSummary[] {
    return VCardParser.toContacts(preview);
  }

  static async loadSamplePreview(context: common.Context): Promise<VCardPreview> {
    try {
      const content: string = await FileService.readSample(context);
      const preview: VCardPreview = VCardParser.parse(content, VCardConstants.SAMPLE_FILE_NAME);
      Logger.info('[VCardManager] loadSamplePreview cards=' + preview.cardCount);
      return preview;
    } catch (error) {
      VCardManager.logError('loadSamplePreview', error);
      const preview: VCardPreview = new VCardPreview();
      preview.fileName = VCardConstants.SAMPLE_FILE_NAME;
      preview.errorMessage = ERROR_READ_FAILED;
      return preview;
    }
  }

  static async loadSampleContacts(context: common.Context): Promise<ContactSummary[]> {
    try {
      const preview: VCardPreview = await VCardManager.loadSamplePreview(context);
      return VCardParser.toContacts(preview);
    } catch (error) {
      VCardManager.logError('loadSampleContacts', error);
      return [];
    }
  }

  static async importPicked(context: common.Context, file: PickedFile): Promise<ImportResult> {
    try {
      const result: ImportResult = await VCardImportService.importFile(context, file);
      if (result.success) {
        Logger.info('[VCardManager] importPicked ok cards=' + result.cardCount);
      } else {
        Logger.error('[VCardManager] importPicked failed code=' + result.code);
      }
      return result;
    } catch (error) {
      return VCardManager.failedImport(file, error);
    }
  }

  static async importContent(context: common.Context, content: string, fileName: string): Promise<ImportResult> {
    try {
      const result: ImportResult = await VCardImportService.importContent(context, content, fileName);
      if (result.success) {
        Logger.info('[VCardManager] importContent ok cards=' + result.cardCount);
      } else {
        Logger.error('[VCardManager] importContent failed code=' + result.code);
      }
      return result;
    } catch (error) {
      VCardManager.logError('importContent', error);
      const result: ImportResult = new ImportResult();
      result.fileName = fileName;
      result.success = false;
      result.code = VCardManager.errorCode(error);
      result.message = VCardManager.errorMessage(error);
      return result;
    }
  }

  static async exportContacts(context: common.Context, ids: number[], version: number,
    charset: string): Promise<ExportResult> {
    try {
      const result: ExportResult = await VCardExportService.exportContacts(context, ids, version, charset);
      if (result.success) {
        Logger.info('[VCardManager] exportContacts ok cards=' + result.cardCount);
      } else {
        Logger.error('[VCardManager] exportContacts failed code=' + result.code);
      }
      return result;
    } catch (error) {
      VCardManager.logError('exportContacts', error);
      const result: ExportResult = new ExportResult();
      result.success = false;
      result.code = VCardManager.errorCode(error);
      result.message = VCardManager.errorMessage(error);
      result.requestedCount = ids.length;
      return result;
    }
  }

  static async saveExportAs(context: common.Context, result: ExportResult, fileName: string): Promise<string> {
    try {
      const path: string = await VCardExportService.saveAs(context, result, fileName);
      Logger.info('[VCardManager] saveExportAs ' + (path.length === 0 ? 'canceled' : path));
      return path;
    } catch (error) {
      VCardManager.logError('saveExportAs', error);
      return '';
    }
  }

  static async loadSettings(context: common.Context): Promise<VCardSettings> {
    try {
      return await SettingsStore.load(context);
    } catch (error) {
      VCardManager.logError('loadSettings', error);
      return new VCardSettings();
    }
  }

  static async saveSettings(context: common.Context, settings: VCardSettings): Promise<void> {
    try {
      await SettingsStore.save(context, settings);
      Logger.info('[VCardManager] saveSettings');
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      VCardManager.logError('saveSettings', err);
      throw VCardManager.toVCardError(error);
    }
  }

  static async loadHistory(context: common.Context): Promise<HistoryEntry[]> {
    try {
      return await HistoryStore.load(context);
    } catch (error) {
      VCardManager.logError('loadHistory', error);
      return [];
    }
  }

  static async appendHistory(context: common.Context, entry: HistoryEntry): Promise<void> {
    try {
      await HistoryStore.append(context, entry);
      Logger.info('[VCardManager] appendHistory action=' + entry.action);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      VCardManager.logError('appendHistory', err);
      throw VCardManager.toVCardError(error);
    }
  }

  static async clearHistory(context: common.Context): Promise<void> {
    try {
      await HistoryStore.clear(context);
      Logger.info('[VCardManager] clearHistory');
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      VCardManager.logError('clearHistory', err);
      throw VCardManager.toVCardError(error);
    }
  }

  static makeStats(entries: HistoryEntry[]): HistoryStats {
    try {
      return HistoryStore.makeStats(entries);
    } catch (error) {
      VCardManager.logError('makeStats', error);
      return new HistoryStats();
    }
  }

  static async cleanSandbox(context: common.Context): Promise<number> {
    try {
      const removed: number = await FileService.clean(context);
      Logger.info('[VCardManager] cleanSandbox removed=' + removed);
      return removed;
    } catch (error) {
      VCardManager.logError('cleanSandbox', error);
      return 0;
    }
  }

  static explain(code: number): ErrorExplain {
    return ErrorCodeMap.explain(code);
  }

  private static failedImport(file: PickedFile, error: Error): ImportResult {
    const result: ImportResult = new ImportResult();
    result.filePath = file.uri;
    result.fileName = file.name;
    result.success = false;
    result.code = VCardManager.errorCode(error);
    result.message = VCardManager.errorMessage(error);
    VCardManager.logError('import', error);
    return result;
  }

  private static toVCardError(error: Error): VCardError {
    return new VCardError(VCardManager.errorCode(error), VCardManager.errorMessage(error));
  }

  private static errorCode(error: Error): number {
    const err = error as BusinessError;
    return typeof err.code === 'number' ? err.code : CODE_UNKNOWN;
  }

  private static errorMessage(error: Error): string {
    const err = error as BusinessError;
    return typeof err.message === 'string' ? err.message : '';
  }

  private static logError(action: string, error: Error): void {
    const err = error as BusinessError;
    Logger.error('[VCardManager] ' + action + ' failed code=' + err.code + ' message=' + err.message);
  }
}
