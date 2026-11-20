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
import { BusinessError } from '@kit.BasicServicesKit';
import { SystemConfigConstants } from '../constants/SystemConfigConstants';
import {
  SettingsItemModel,
  SettingsItemType,
  ClickResult,
  ClickCallback
} from '../model/SettingsItemModel';
import { common } from '@kit.AbilityKit';
import { Want } from '@kit.AbilityKit';
import { ResourceHelper } from '../utils/basic/ResourceHelper';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * Settings lite service.
 * Opens the system PIN / NFC / double-click settings pages via Want + startAbility
 * (@ohos.settingsLite is an FA-model-only API and cannot be called directly under the Stage model).
 * The double-click app ownership query depends on settingsLite; under the Stage runtime it
 * faithfully returns an unsupported error instead of simulated results.
 * Integrates logging, tracing and event reporting.
 */
export class SettingsLiteService {
  /** PIN setting item model */
  private pinModel: SettingsItemModel = new SettingsItemModel(
    SettingsItemType.PIN_SETTING, ResourceHelper.getStringByName('settings_type_pin'),
    ResourceHelper.getStringByName('settings_desc_open_pin')
  );
  /** NFC setting item model */
  private nfcModel: SettingsItemModel = new SettingsItemModel(
    SettingsItemType.NFC_SETTING, ResourceHelper.getStringByName('settings_type_nfc'),
    ResourceHelper.getStringByName('settings_desc_open_nfc')
  );
  /** Double-click setting item model */
  private doubleClickModel: SettingsItemModel = new SettingsItemModel(
    SettingsItemType.DOUBLE_CLICK_SETTING, ResourceHelper.getStringByName('settings_type_double_click'),
    ResourceHelper.getStringByName('settings_desc_open_double_click')
  );
  /** Whether the service has been initialized */
  private isInitialized: boolean = false;

  /**
   * Initializes the settings lite service.
   * Called before first use to prepare internal state.
   */
  initialize(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteService initialize: starting initialization');
    this.pinModel = new SettingsItemModel(
      SettingsItemType.PIN_SETTING, ResourceHelper.getStringByName('settings_type_pin'),
      ResourceHelper.getStringByName('settings_desc_open_pin')
    );
    this.nfcModel = new SettingsItemModel(
      SettingsItemType.NFC_SETTING, ResourceHelper.getStringByName('settings_type_nfc'),
      ResourceHelper.getStringByName('settings_desc_open_nfc')
    );
    this.doubleClickModel = new SettingsItemModel(
      SettingsItemType.DOUBLE_CLICK_SETTING, ResourceHelper.getStringByName('settings_type_double_click'),
      ResourceHelper.getStringByName('settings_desc_open_double_click')
    );
    this.isInitialized = true;
    hilog.info(DOMAIN, TAG, 'SettingsLiteService initialize: initialization complete');
  }

  // ========================================
  // PIN setting methods
  // ========================================

  /**
   * Opens the PIN code settings page.
   * Uses startAbility to open the system settings page, awaiting the result before updating state.
   * @param {common.UIAbilityContext} context - UIAbility context
   * @returns {Promise<boolean>} Whether the page was opened successfully
   */
  async openPinSettingPage(context: common.UIAbilityContext): Promise<boolean> {
    hilog.info(DOMAIN, TAG, 'SettingsLiteService openPinSettingPage: opening PIN settings');
    this.pinModel.markOpening();

    try {
      const want: Want = {
        action: SystemConfigConstants.SETTINGS_PIN_ACTION,
        uri: SystemConfigConstants.SETTINGS_PIN_URI
      };
      await context.startAbility(want);
      hilog.info(DOMAIN, TAG, 'SettingsLiteService openPinSettingPage: page opened successfully');
      this.pinModel.markSuccess(ResourceHelper.getStringByName('settings_result_pin_opened'));
      return true;
    } catch (err) {
      const businessErr = err as BusinessError;
      const errMsg: string = businessErr.message ?? 'Unknown error';
      const errCode: number = businessErr.code ?? SystemConfigConstants.ERROR_INTERNAL;
      hilog.error(DOMAIN, TAG, 'SettingsLiteService openPinSettingPage: failed, error=%{public}s, code=%{public}d',
        errMsg, errCode);
      this.pinModel.markFailed(errMsg, errCode);
      return false;
    }
  }

  // ========================================
  // NFC setting methods
  // ========================================

  /**
   * Opens the NFC settings page.
   * Uses startAbility to open the system NFC settings page, awaiting the result before updating state.
   * @param {common.UIAbilityContext} context - UIAbility context
   * @returns {Promise<boolean>} Whether the page was opened successfully
   */
  async openNfcSettingsPage(context: common.UIAbilityContext): Promise<boolean> {
    hilog.info(DOMAIN, TAG, 'SettingsLiteService openNfcSettingsPage: opening NFC settings');
    this.nfcModel.markOpening();

    try {
      const want: Want = {
        action: SystemConfigConstants.SETTINGS_NFC_ACTION,
        uri: SystemConfigConstants.SETTINGS_NFC_URI
      };
      await context.startAbility(want);
      hilog.info(DOMAIN, TAG, 'SettingsLiteService openNfcSettingsPage: page opened successfully');
      this.nfcModel.markSuccess(ResourceHelper.getStringByName('settings_result_nfc_opened'));
      return true;
    } catch (err) {
      const businessErr = err as BusinessError;
      const errMsg: string = businessErr.message ?? 'Unknown error';
      const errCode: number = businessErr.code ?? SystemConfigConstants.ERROR_INTERNAL;
      hilog.error(DOMAIN, TAG, 'SettingsLiteService openNfcSettingsPage: failed, error=%{public}s, code=%{public}d',
        errMsg, errCode);
      this.nfcModel.markFailed(errMsg, errCode);
      return false;
    }
  }

  // ========================================
  // Double-click setting methods
  // ========================================

  /**
   * Opens the double-click settings page.
   * Uses startAbility to open the system gesture settings page, awaiting the result before updating state.
   * @param {common.UIAbilityContext} context - UIAbility context
   * @returns {Promise<boolean>} Whether the page was opened successfully
   */
  async openDoubleClickSettingsPage(context: common.UIAbilityContext): Promise<boolean> {
    hilog.info(DOMAIN, TAG, 'SettingsLiteService openDoubleClickSettingsPage: opening double click settings');
    this.doubleClickModel.markOpening();

    try {
      const want: Want = {
        action: SystemConfigConstants.SETTINGS_GESTURE_ACTION,
        uri: SystemConfigConstants.SETTINGS_GESTURE_URI
      };
      await context.startAbility(want);
      hilog.info(DOMAIN, TAG, 'SettingsLiteService openDoubleClickSettingsPage: page opened successfully');
      this.doubleClickModel.markSuccess(ResourceHelper.getStringByName('settings_result_double_click_opened'));
      return true;
    } catch (err) {
      const businessErr = err as BusinessError;
      const errMsg: string = businessErr.message ?? 'Unknown error';
      const errCode: number = businessErr.code ?? SystemConfigConstants.ERROR_INTERNAL;
      hilog.error(DOMAIN, TAG, 'SettingsLiteService openDoubleClickSettingsPage: failed, error=%{public}s, code=%{public}d',
        errMsg, errCode);
      this.doubleClickModel.markFailed(errMsg, errCode);
      return false;
    }
  }

  /**
   * Queries whether the double-click app is itself.
   * settingsLite.isDoubleClickAppForSelf is an FA-model-only API,
   * unavailable under the Stage runtime; this faithfully invokes the callback with an
   * unsupported error and never returns simulated results.
   * @param {common.UIAbilityContext} context - UIAbility context (kept for API consistency)
   * @param {function(err: Object | null, cb: ClickCallback): void} callback - Query result callback
   */
  isDoubleClickAppForSelf(
    context: common.UIAbilityContext,
    callback: (err: Object | null, cb: ClickCallback) => void): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteService isDoubleClickAppForSelf: not available in Stage model');
    this.doubleClickModel.markQuerying();

    const errMsg: string = 'settingsLite.isDoubleClickAppForSelf is only available in FA model';
    const err: BusinessError = {
      name: 'SettingsLiteUnsupportedError',
      message: errMsg,
      code: SystemConfigConstants.ERROR_INTERNAL
    };
    const result: ClickCallback = {
      result: ClickResult.ERROR,
      errorMessage: errMsg,
      errorCode: SystemConfigConstants.ERROR_INTERNAL
    };

    this.doubleClickModel.updateClickResult(ClickResult.ERROR);
    this.doubleClickModel.markFailed(errMsg, SystemConfigConstants.ERROR_INTERNAL);
    callback(err, result);
  }

  // ========================================
  // Model access methods
  // ========================================

  /**
   * Gets the PIN setting item model.
   * @returns {SettingsItemModel} PIN setting model
   */
  getPinModel(): SettingsItemModel {
    return this.pinModel;
  }

  /**
   * Gets the NFC setting item model.
   * @returns {SettingsItemModel} NFC setting model
   */
  getNfcModel(): SettingsItemModel {
    return this.nfcModel;
  }

  /**
   * Gets the double-click setting item model.
   * @returns {SettingsItemModel} Double-click setting model
   */
  getDoubleClickModel(): SettingsItemModel {
    return this.doubleClickModel;
  }

  /**
   * Gets the list of all setting item models.
   * @returns {SettingsItemModel[]} Array of setting item models
   */
  getAllModels(): SettingsItemModel[] {
    hilog.debug(DOMAIN, TAG, 'SettingsLiteService getAllModels: returning 3 models');
    return [this.pinModel, this.nfcModel, this.doubleClickModel];
  }

  /**
   * Determines whether the service has been initialized.
   * @returns {boolean} Whether it is initialized
   */
  isServiceInitialized(): boolean {
    return this.isInitialized;
  }

  /**
   * Resets the service state.
   * Clears operation records and statistics of all setting items.
   */
  reset(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteService reset: clearing state');
    this.pinModel.reset();
    this.nfcModel.reset();
    this.doubleClickModel.reset();
    this.isInitialized = false;
  }

  /**
   * Destroys the service instance.
   * Releases internal resources and resets all state.
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteService destroy: releasing resources');
    this.reset();
    hilog.info(DOMAIN, TAG, 'SettingsLiteService destroy: resources released');
  }
}
