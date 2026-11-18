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
import { SystemConfigConstants } from '../constants/SystemConfigConstants';
import { ResourceHelper } from '../utils/basic/ResourceHelper';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * Settings item type enum.
 * Identifies the different settings page types.
 */
export enum SettingsItemType {
  /** PIN code setting */
  PIN_SETTING = 'pinSetting',
  /** NFC setting */
  NFC_SETTING = 'nfcSetting',
  /** Double-click setting */
  DOUBLE_CLICK_SETTING = 'doubleClickSetting'
}

/**
 * Settings item operation status enum.
 * Identifies the current operation status of a settings item.
 */
export enum SettingsOperationStatus {
  /** Idle */
  IDLE = 'idle',
  /** Opening page */
  OPENING = 'opening',
  /** Querying */
  QUERYING = 'querying',
  /** Operation succeeded */
  SUCCESS = 'success',
  /** Operation failed */
  FAILED = 'failed'
}

/**
 * Double-click callback result enum.
 * Used for the callback result of isDoubleClickAppForSelf.
 */
export enum ClickResult {
  /** The double-click app is itself */
  IS_SELF = 'isSelf',
  /** The double-click app is not itself */
  NOT_SELF = 'notSelf',
  /** Query failed */
  ERROR = 'error'
}

/**
 * Double-click callback interface.
 * Corresponds to the callback parameter of settingsLite.isDoubleClickAppForSelf.
 */
export interface ClickCallback {
  /** Callback result */
  result: ClickResult;
  /** Error message (on failure) */
  errorMessage: string;
  /** Error code (on failure) */
  errorCode: number;
}

/**
 * Settings item model JSON serialization interface.
 */
export interface SettingsItemModelJson {
  itemType: SettingsItemType;
  title: string;
  description: string;
  operationStatus: SettingsOperationStatus;
  clickResult: ClickResult;
  lastOperationTime: number;
  errorMessage: string;
  errorCode: number;
  operationCount: number;
}

/**
 * Settings item data model.
 * Encapsulates the status and operation results of each settings item of the settingsLite module,
 * supporting three types: PIN setting, NFC setting and double-click setting.
 */
export class SettingsItemModel {
  /** Settings item type */
  public itemType: SettingsItemType;
  /** Settings item display title */
  public title: string;
  /** Settings item description */
  public description: string;
  /** Operation status */
  public operationStatus: SettingsOperationStatus;
  /** Double-click callback result (only valid for the double-click setting type) */
  public clickResult: ClickResult;
  /** Timestamp of the last operation */
  public lastOperationTime: number;
  /** Error message */
  public errorMessage: string;
  /** Error code */
  public errorCode: number;
  /** Operation count statistic */
  public operationCount: number;

  /**
   * Creates a settings item model instance.
   * @param {SettingsItemType} itemType - Settings item type
   * @param {string} title - Display title
   * @param {string} description - Description
   */
  constructor(
    itemType: SettingsItemType = SettingsItemType.PIN_SETTING,
    title: string = '',
    description: string = ''
  ) {
    hilog.info(DOMAIN, TAG, 'SettingsItemModel constructor: type=%{public}s, title=%{public}s',
      itemType, title);
    this.itemType = itemType;
    this.title = title;
    this.description = description;
    this.operationStatus = SettingsOperationStatus.IDLE;
    this.clickResult = ClickResult.NOT_SELF;
    this.lastOperationTime = 0;
    this.errorMessage = '';
    this.errorCode = 0;
    this.operationCount = 0;
    hilog.info(DOMAIN, TAG, 'SettingsItemModel constructor: initialization complete');
  }

  // ========================================
  // Status management methods
  // ========================================

  /**
   * Marks the status as opening.
   * Called before invoking openXxxSettingsPage.
   */
  markOpening(): void {
    hilog.info(DOMAIN, TAG, 'SettingsItemModel markOpening: type=%{public}s', this.itemType);
    this.operationStatus = SettingsOperationStatus.OPENING;
    this.errorMessage = '';
    this.errorCode = 0;
  }

  /**
   * Marks the status as querying.
   * Called before invoking isDoubleClickAppForSelf.
   */
  markQuerying(): void {
    hilog.info(DOMAIN, TAG, 'SettingsItemModel markQuerying: type=%{public}s', this.itemType);
    this.operationStatus = SettingsOperationStatus.QUERYING;
    this.errorMessage = '';
    this.errorCode = 0;
  }

  /**
   * Marks the operation as success.
   * @param {string} [additionalInfo] - Additional info
   */
  markSuccess(additionalInfo?: string): void {
    hilog.info(DOMAIN, TAG, 'SettingsItemModel markSuccess: type=%{public}s, info=%{public}s',
      this.itemType, additionalInfo ?? 'none');
    this.operationStatus = SettingsOperationStatus.SUCCESS;
    this.lastOperationTime = Date.now();
    this.operationCount += 1;
    this.errorMessage = '';
    this.errorCode = 0;
    if (additionalInfo) {
      this.description = additionalInfo;
    }
  }

  /**
   * Marks the operation as failed.
   * @param {string} errorMessage - Error description
   * @param {number} errorCode - Error code
   */
  markFailed(errorMessage: string, errorCode: number): void {
    hilog.error(DOMAIN, TAG, 'SettingsItemModel markFailed: type=%{public}s, error=%{public}s, code=%{public}d',
      this.itemType, errorMessage, errorCode);
    this.operationStatus = SettingsOperationStatus.FAILED;
    this.errorMessage = errorMessage;
    this.errorCode = errorCode;
    this.lastOperationTime = Date.now();
    this.operationCount += 1;
  }

  /**
   * Updates the double-click callback result.
   * @param {ClickResult} result - Callback result
   */
  updateClickResult(result: ClickResult): void {
    hilog.info(DOMAIN, TAG, 'SettingsItemModel updateClickResult: result=%{public}s', result);
    this.clickResult = result;
    this.lastOperationTime = Date.now();
  }

  // ========================================
  // Query methods
  // ========================================

  /**
   * Determines whether the current operation succeeded.
   * @returns {boolean} Whether it succeeded
   */
  isSuccess(): boolean {
    return this.operationStatus === SettingsOperationStatus.SUCCESS;
  }

  /**
   * Determines whether the page is currently being opened.
   * @returns {boolean} Whether it is opening
   */
  isOpening(): boolean {
    return this.operationStatus === SettingsOperationStatus.OPENING;
  }

  /**
   * Determines whether a query is currently in progress.
   * @returns {boolean} Whether it is querying
   */
  isQuerying(): boolean {
    return this.operationStatus === SettingsOperationStatus.QUERYING;
  }

  /**
   * Gets the localized description of the operation status.
   * @returns {string} Status description
   */
  getStatusDescription(): string {
    switch (this.operationStatus) {
      case SettingsOperationStatus.IDLE:
        return ResourceHelper.getStringByName('settings_status_idle');
      case SettingsOperationStatus.OPENING:
        return ResourceHelper.getStringByName('settings_status_opening');
      case SettingsOperationStatus.QUERYING:
        return ResourceHelper.getStringByName('settings_status_querying');
      case SettingsOperationStatus.SUCCESS:
        return ResourceHelper.getStringByName('settings_status_success');
      case SettingsOperationStatus.FAILED:
        return ResourceHelper.getStringByName('settings_status_failed');
      default:
        return ResourceHelper.getStringByName('settings_status_unknown');
    }
  }

  /**
   * Gets the localized name of the settings item type.
   * @returns {string} Type name
   */
  getTypeName(): string {
    switch (this.itemType) {
      case SettingsItemType.PIN_SETTING:
        return ResourceHelper.getStringByName('settings_type_pin');
      case SettingsItemType.NFC_SETTING:
        return ResourceHelper.getStringByName('settings_type_nfc');
      case SettingsItemType.DOUBLE_CLICK_SETTING:
        return ResourceHelper.getStringByName('settings_type_double_click');
      default:
        return ResourceHelper.getStringByName('settings_type_unknown');
    }
  }

  // ========================================
  // Serialization methods
  // ========================================

  /**
   * Serializes to a JSON-compatible object.
   * @returns {SettingsItemModelJson} JSON representation
   */
  toJSON(): SettingsItemModelJson {
    hilog.debug(DOMAIN, TAG, 'SettingsItemModel toJSON: serializing type=%{public}s', this.itemType);
    const result: SettingsItemModelJson = {
      itemType: this.itemType,
      title: this.title,
      description: this.description,
      operationStatus: this.operationStatus,
      clickResult: this.clickResult,
      lastOperationTime: this.lastOperationTime,
      errorMessage: this.errorMessage,
      errorCode: this.errorCode,
      operationCount: this.operationCount
    };
    return result;
  }

  /**
   * Converts to a readable string.
   * @returns {string} String description
   */
  toString(): string {
    const result: string = `SettingsItemModel[type=${this.itemType}, title=${this.title}, ` +
      `status=${this.operationStatus}, ops=${this.operationCount}]`;
    hilog.debug(DOMAIN, TAG, 'SettingsItemModel toString: %{public}s', result);
    return result;
  }

  /**
   * Resets the model to its initial status.
   * Clears all operation records and statistics.
   */
  reset(): void {
    hilog.info(DOMAIN, TAG, 'SettingsItemModel reset: type=%{public}s', this.itemType);
    this.operationStatus = SettingsOperationStatus.IDLE;
    this.clickResult = ClickResult.NOT_SELF;
    this.lastOperationTime = 0;
    this.errorMessage = '';
    this.errorCode = 0;
    this.operationCount = 0;
  }
}
