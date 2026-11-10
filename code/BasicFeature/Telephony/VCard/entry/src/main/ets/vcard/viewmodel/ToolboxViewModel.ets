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
import {
  CapabilityCheck,
  ContactSummary,
  ErrorExplain,
  ExportResult,
  Formatter,
  ImportResult,
  Logger,
  PermissionState,
  PickedFile,
  VCardConstants,
  VCardManager,
  VCardPreview,
  VCardSettings
} from 'library';

/**
 * State orchestration of the toolbox page. All system calls go through the
 * Library facade; failures are converted into a result object or a boolean.
 */
@ObservedV2
export class ToolboxViewModel {
  @Trace public permissionGranted: boolean = false;
  @Trace public permissionStates: PermissionState[] = [];
  @Trace public capabilities: CapabilityCheck[] = [];
  @Trace public preview: VCardPreview = new VCardPreview();
  @Trace public hasPreview: boolean = false;
  @Trace public canImport: boolean = false;
  @Trace public pickFailed: boolean = false;
  @Trace public importResult: ImportResult = new ImportResult();
  @Trace public hasImportResult: boolean = false;
  @Trace public importExplain: ErrorExplain = new ErrorExplain(0, '', '', '', '');
  @Trace public exportResult: ExportResult = new ExportResult();
  @Trace public hasExportResult: boolean = false;
  @Trace public exportExplain: ErrorExplain = new ErrorExplain(0, '', '', '', '');
  @Trace public scopeAll: boolean = true;
  @Trace public selectedIds: number[] = [];
  @Trace public showPicker: boolean = false;
  @Trace public contacts: ContactSummary[] = [];
  @Trace public version: number = 0;
  @Trace public charset: string = VCardConstants.CHARSET_UTF8;
  @Trace public busy: boolean = false;
  @Trace public settings: VCardSettings = new VCardSettings();

  private context: common.Context | null = null;
  private pickedFile: PickedFile | null = null;

  init(context: common.Context): void {
    this.context = context;
    this.loadPermission();
    this.loadSettings();
  }

  async loadPermission(): Promise<void> {
    const context: common.Context | null = this.context;
    if (context === null) {
      return;
    }
    try {
      this.capabilities = VCardManager.checkCapability();
      const states: PermissionState[] = await VCardManager.getPermissionStates(context);
      this.permissionStates = states;
      this.permissionGranted = this.allGranted(states);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[ToolboxViewModel] loadPermission failed code=' + err.code + ' message=' + err.message);
    }
  }

  async requestPermission(): Promise<boolean> {
    const context: common.Context | null = this.context;
    if (context === null) {
      return false;
    }
    this.busy = true;
    let granted: boolean = false;
    try {
      granted = await VCardManager.requestPermissions(context);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[ToolboxViewModel] requestPermission failed code=' + err.code + ' message=' + err.message);
    }
    this.busy = false;
    await this.loadPermission();
    return granted && this.permissionGranted;
  }

  async loadSettings(): Promise<void> {
    const context: common.Context | null = this.context;
    if (context === null) {
      return;
    }
    try {
      const settings: VCardSettings = await VCardManager.loadSettings(context);
      this.settings = settings;
      this.version = settings.defaultVersion;
      this.charset = settings.defaultCharset;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[ToolboxViewModel] loadSettings failed code=' + err.code + ' message=' + err.message);
    }
  }

  async pickFile(): Promise<boolean> {
    const context: common.Context | null = this.context;
    if (context === null) {
      return false;
    }
    this.busy = true;
    this.pickFailed = false;
    try {
      const file: PickedFile | null = await VCardManager.pickVCardFile(context);
      if (file === null) {
        this.busy = false;
        return false;
      }
      const preview: VCardPreview = await VCardManager.previewSandboxFile(file.uri, file.name);
      this.pickedFile = file;
      this.preview = preview;
      this.hasPreview = true;
      this.canImport = true;
      this.hasImportResult = false;
      this.busy = false;
      if (preview.errorMessage.length > 0) {
        this.pickFailed = true;
        return false;
      }
      return true;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[ToolboxViewModel] pickFile failed code=' + err.code + ' message=' + err.message);
      this.busy = false;
      this.pickFailed = true;
      return false;
    }
  }

  async loadSample(): Promise<boolean> {
    const context: common.Context | null = this.context;
    if (context === null) {
      return false;
    }
    this.busy = true;
    this.pickFailed = false;
    try {
      const preview: VCardPreview = await VCardManager.loadSamplePreview(context);
      this.pickedFile = null;
      this.preview = preview;
      this.hasPreview = true;
      this.canImport = false;
      this.hasImportResult = false;
      this.busy = false;
      if (preview.errorMessage.length > 0) {
        this.pickFailed = true;
        return false;
      }
      return true;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[ToolboxViewModel] loadSample failed code=' + err.code + ' message=' + err.message);
      this.busy = false;
      this.pickFailed = true;
      return false;
    }
  }

  async importFile(): Promise<boolean> {
    const context: common.Context | null = this.context;
    const file: PickedFile | null = this.pickedFile;
    if (context === null || file === null) {
      return false;
    }
    this.busy = true;
    try {
      const result: ImportResult = await VCardManager.importPicked(context, file);
      this.importResult = result;
      this.importExplain = VCardManager.explain(result.code);
      this.hasImportResult = true;
      this.busy = false;
      return result.success;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[ToolboxViewModel] importFile failed code=' + err.code + ' message=' + err.message);
      this.busy = false;
      return false;
    }
  }

  async exportCards(): Promise<boolean> {
    const context: common.Context | null = this.context;
    if (context === null) {
      return false;
    }
    const ids: number[] = this.scopeAll ? [] : this.selectedIds;
    this.busy = true;
    try {
      const result: ExportResult =
        await VCardManager.exportContacts(context, ids, this.version, this.charset);
      this.exportResult = result;
      this.exportExplain = VCardManager.explain(result.code);
      this.hasExportResult = true;
      this.busy = false;
      return result.success;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[ToolboxViewModel] exportCards failed code=' + err.code + ' message=' + err.message);
      this.busy = false;
      return false;
    }
  }

  async saveExportAs(): Promise<boolean> {
    const context: common.Context | null = this.context;
    if (context === null || !this.exportResult.success) {
      return false;
    }
    try {
      const fileName: string = 'contacts_' + Formatter.fileStamp(Date.now()) + '.vcf';
      const path: string = await VCardManager.saveExportAs(context, this.exportResult, fileName);
      return path.length > 0;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[ToolboxViewModel] saveExportAs failed code=' + err.code + ' message=' + err.message);
      return false;
    }
  }

  loadContacts(): void {
    const context: common.Context | null = this.context;
    if (context === null) {
      return;
    }
    this.loadContactList(context);
  }

  setScope(all: boolean): void {
    this.scopeAll = all;
    if (!all) {
      this.openPicker();
    }
  }

  openPicker(): void {
    this.showPicker = true;
    this.loadContacts();
  }

  confirmPicker(): void {
    this.showPicker = false;
    if (this.selectedIds.length === 0) {
      this.scopeAll = true;
    }
  }

  toggleContact(id: number): void {
    const next: number[] = [];
    let removed: boolean = false;
    for (const item of this.selectedIds) {
      if (item === id) {
        removed = true;
      } else {
        next.push(item);
      }
    }
    if (!removed) {
      next.push(id);
    }
    this.selectedIds = next;
  }

  setVersion(value: number): void {
    this.version = value;
  }

  setCharset(value: string): void {
    this.charset = value;
  }

  private async loadContactList(context: common.Context): Promise<void> {
    try {
      const all: ContactSummary[] = await VCardManager.loadContacts(context);
      const usable: ContactSummary[] = [];
      for (const item of all) {
        if (item.id >= 0) {
          usable.push(item);
        }
      }
      this.contacts = usable;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[ToolboxViewModel] loadContacts failed code=' + err.code + ' message=' + err.message);
    }
  }

  private allGranted(states: PermissionState[]): boolean {
    if (states.length === 0) {
      return false;
    }
    for (const state of states) {
      if (!state.granted) {
        return false;
      }
    }
    return true;
  }
}
