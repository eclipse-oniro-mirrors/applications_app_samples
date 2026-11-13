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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { SystemConfigConstants } from 'library';
import { SettingsLiteService } from 'library';
import { TraceService, TraceName } from 'library';
import { EventService } from 'library';
import {
  SettingsItemModel,
  SettingsItemType,
  SettingsOperationStatus,
  ClickResult,
  ClickCallback
} from 'library';
import { common } from '@kit.AbilityKit';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * Settings Lite view model.
 * Manages the data and business logic of SettingsLitePage,
 * coordinating calls to SettingsLiteService, TraceService and EventService.
 */
export class SettingsLiteViewModel {
  /** Settings info service instance */
  private settingsService: SettingsLiteService = new SettingsLiteService();
  /** Trace service instance */
  private traceService: TraceService = new TraceService();
  /** Event service instance */
  private eventService: EventService = new EventService();
  /** UIAbility context */
  private context: common.UIAbilityContext | null = null;
  /** Page operation logs */
  public pageLogs: string[] = [];
  /** PIN setting item model */
  public pinModel: SettingsItemModel = new SettingsItemModel(SettingsItemType.PIN_SETTING);
  /** NFC setting item model */
  public nfcModel: SettingsItemModel = new SettingsItemModel(SettingsItemType.NFC_SETTING);
  /** Double-click setting item model */
  public doubleClickModel: SettingsItemModel = new SettingsItemModel(SettingsItemType.DOUBLE_CLICK_SETTING);
  /** Double-click query result */
  public clickResultText: string = '';
  /** Whether loading */
  public isLoading: boolean = false;

  /**
   * Initializes the view model.
   * Creates and initializes all dependent services.
   * @param {common.UIAbilityContext} context - UIAbility context
   */
  initialize(context: common.UIAbilityContext): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel initialize: starting');
    this.context = context;
    this.traceService.initialize(true);
    this.eventService.initialize();
    this.settingsService.initialize();
    this.applyLocalizedMeta();
    this.syncModels();
    this.addLog(this.fmt($r('app.string.log_vm_initialized')));
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel initialize: complete');
  }

  // ========================================
  // Business operation methods
  // ========================================

  /**
   * Opens the PIN code settings page.
   * Calls the SettingsLiteService.openPinSettingPage() API.
   */
  async openPinSettings(): Promise<void> {
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel openPinSettings: opening');
    this.addLog(this.fmt($r('app.string.log_opening_pin')));

    const taskId: number = this.traceService.startTrace(TraceName.SETTINGS_OPEN_PIN, 'openPin');

    try {
      if (!this.context) {
        this.addLog(this.fmt($r('app.string.log_error_no_context')));
        return;
      }

      const success: boolean = await this.settingsService.openPinSettingPage(this.context);
      this.syncModels();

      if (success) {
        this.addLog(this.fmt($r('app.string.log_pin_opened')));
        this.eventService.reportSettingsPageOpened('pin', true);
      } else {
        this.addLog(this.fmt($r('app.string.log_open_pin_failed'), this.pinModel.errorMessage));
        this.eventService.reportSettingsPageOpened('pin', false);
        this.eventService.reportError('openPinSettings', this.pinModel.errorMessage, this.pinModel.errorCode);
      }
    } finally {
      this.traceService.finishTrace(TraceName.SETTINGS_OPEN_PIN, taskId);
    }
  }

  /**
   * Opens the NFC settings page.
   * Calls the SettingsLiteService.openNfcSettingsPage() API.
   */
  async openNfcSettings(): Promise<void> {
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel openNfcSettings: opening');
    this.addLog(this.fmt($r('app.string.log_opening_nfc')));

    const taskId: number = this.traceService.startTrace(TraceName.SETTINGS_OPEN_NFC, 'openNfc');

    try {
      if (!this.context) {
        this.addLog(this.fmt($r('app.string.log_error_no_context')));
        return;
      }

      const success: boolean = await this.settingsService.openNfcSettingsPage(this.context);
      this.syncModels();

      if (success) {
        this.addLog(this.fmt($r('app.string.log_nfc_opened')));
        this.eventService.reportSettingsPageOpened('nfc', true);
      } else {
        this.addLog(this.fmt($r('app.string.log_open_nfc_failed'), this.nfcModel.errorMessage));
        this.eventService.reportSettingsPageOpened('nfc', false);
        this.eventService.reportError('openNfcSettings', this.nfcModel.errorMessage, this.nfcModel.errorCode);
      }
    } finally {
      this.traceService.finishTrace(TraceName.SETTINGS_OPEN_NFC, taskId);
    }
  }

  /**
   * Opens the double-click settings page.
   * Calls the SettingsLiteService.openDoubleClickSettingsPage() API.
   */
  async openDoubleClickSettings(): Promise<void> {
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel openDoubleClickSettings: opening');
    this.addLog(this.fmt($r('app.string.log_opening_double_click')));

    const taskId: number = this.traceService.startTrace(TraceName.SETTINGS_OPEN_DOUBLE_CLICK, 'openDoubleClick');

    try {
      if (!this.context) {
        this.addLog(this.fmt($r('app.string.log_error_no_context')));
        return;
      }

      const success: boolean = await this.settingsService.openDoubleClickSettingsPage(this.context);
      this.syncModels();

      if (success) {
        this.addLog(this.fmt($r('app.string.log_double_click_opened')));
        this.eventService.reportSettingsPageOpened('doubleClick', true);
      } else {
        this.addLog(this.fmt($r('app.string.log_open_double_click_failed'), this.doubleClickModel.errorMessage));
        this.eventService.reportSettingsPageOpened('doubleClick', false);
        this.eventService.reportError('openDoubleClickSettings', this.doubleClickModel.errorMessage, this.doubleClickModel.errorCode);
      }
    } finally {
      this.traceService.finishTrace(TraceName.SETTINGS_OPEN_DOUBLE_CLICK, taskId);
    }
  }

  /**
   * Queries whether the double-click app is itself.
   * Calls the SettingsLiteService.isDoubleClickAppForSelf() API.
   * settingsLite is an FA-model-only API; in the Stage model the callback returns an unsupported error.
   */
  queryDoubleClickApp(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel queryDoubleClickApp: querying');
    this.addLog(this.fmt($r('app.string.log_querying_double_click')));

    const taskId: number = this.traceService.startTrace(TraceName.SETTINGS_QUERY_DOUBLE_CLICK, 'queryDoubleClick');

    if (!this.context) {
      this.addLog(this.fmt($r('app.string.log_error_no_context')));
      this.traceService.finishTrace(TraceName.SETTINGS_QUERY_DOUBLE_CLICK, taskId);
      return;
    }

    this.settingsService.isDoubleClickAppForSelf(this.context, (err: Object | null, cb: ClickCallback) => {
      this.syncModels();
      this.clickResultText = this.getClickResultDescription(cb.result);

      if (cb.result === ClickResult.ERROR) {
        this.addLog(this.fmt($r('app.string.log_double_click_query_failed'), cb.errorMessage));
        this.eventService.reportError('queryDoubleClickApp', cb.errorMessage, cb.errorCode);
      } else {
        this.addLog(this.fmt($r('app.string.log_double_click_result'), this.clickResultText));
        this.eventService.reportDoubleClickQueried(this.clickResultText);
      }

      this.traceService.finishTrace(TraceName.SETTINGS_QUERY_DOUBLE_CLICK, taskId);
    });
  }

  /**
   * Resets the view model state.
   * Clears the operation records and logs of all setting items.
   */
  resetState(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel resetState: clearing');
    this.settingsService.reset();
    this.syncModels();
    this.clickResultText = '';
    this.isLoading = false;
    this.pageLogs = [];
    this.addLog(this.fmt($r('app.string.log_state_reset')));
  }

  // ========================================
  // Helper methods
  // ========================================

  /**
   * Initializes the title and description of the setting item models using localized resources.
   * Sets the view-model side display text before syncModels syncs from the service.
   */
  private applyLocalizedMeta(): void {
    this.pinModel.title = this.fmt($r('app.string.card_pin_title'));
    this.pinModel.description = this.fmt($r('app.string.setting_pin_desc'));
    this.nfcModel.title = this.fmt($r('app.string.card_nfc_title'));
    this.nfcModel.description = this.fmt($r('app.string.setting_nfc_desc'));
    this.doubleClickModel.title = this.fmt($r('app.string.card_double_click_title'));
    this.doubleClickModel.description = this.fmt($r('app.string.setting_double_click_desc'));
  }

  /**
   * Syncs model data from the service into the view model.
   */
  private syncModels(): void {
    this.pinModel = this.settingsService.getPinModel();
    this.nfcModel = this.settingsService.getNfcModel();
    this.doubleClickModel = this.settingsService.getDoubleClickModel();
  }

  /**
   * Gets the localized description of the double-click result.
   * @param {ClickResult} result - Query result
   * @returns {string} Localized description
   */
  private getClickResultDescription(result: ClickResult): string {
    switch (result) {
      case ClickResult.IS_SELF:
        return this.fmt($r('app.string.result_click_self'));
      case ClickResult.NOT_SELF:
        return this.fmt($r('app.string.result_click_not_self'));
      case ClickResult.ERROR:
        return this.fmt($r('app.string.result_click_error'));
      default:
        return this.fmt($r('app.string.result_click_unknown'));
    }
  }

  /**
   * Gets the status description of a setting item.
   * @param {SettingsItemModel} model - Setting item model
   * @returns {string} Status description
   */
  getItemStatusText(model: SettingsItemModel): string {
    return model.getStatusDescription();
  }

  /**
   * Gets the JSON representation of all setting items.
   * @returns {string} JSON string
   */
  getAllSettingsDetail(): string {
    const models: SettingsItemModel[] = this.settingsService.getAllModels();
    const details: object[] = models.map(m => m.toJSON());
    return JSON.stringify(details, null, 2);
  }

  // ========================================
  // Log management methods
  // ========================================

  /**
   * Resolves a localized text resource into a string.
   * @param {Resource} resource - Resource object obtained via $r reference
   * @param {Array<string | number>} args - Format placeholder arguments
   * @returns {string} The resolved localized string, or an empty string when the context is not ready
   */
  private fmt(resource: Resource, ...args: Array<string | number>): string {
    if (!this.context) {
      return '';
    }
    return this.context.resourceManager.getStringSync(resource.id, ...args);
  }

  /**
   * Adds a page operation log.
   * @param {string} message - Log message
   */
  private addLog(message: string): void {
    const timestamp: string = new Date().toLocaleTimeString();
    const logEntry: string = `[${timestamp}] ${message}`;
    this.pageLogs.push(logEntry);
    if (this.pageLogs.length > SystemConfigConstants.MAX_LOG_ENTRIES) {
      this.pageLogs = this.pageLogs.slice(-SystemConfigConstants.MAX_LOG_ENTRIES);
    }
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel addLog: %{public}s', message);
  }

  /**
   * Gets all page logs.
   * @returns {string[]} Log array
   */
  getLogs(): string[] {
    return [...this.pageLogs];
  }

  /**
   * Clears page logs.
   */
  clearLogs(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel clearLogs');
    this.pageLogs = [];
  }

  // ========================================
  // Destroy methods
  // ========================================

  /**
   * Destroys the view model and releases all service resources.
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel destroy: releasing');
    this.settingsService.destroy();
    this.traceService.destroy();
    this.eventService.destroy();
    this.pageLogs = [];
  }
}
