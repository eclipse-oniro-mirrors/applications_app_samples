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

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * Do Not Disturb query status enum.
 * Identifies the query status of Do Not Disturb related information.
 */
export enum DoNotDisturbStatus {
  /** Not queried */
  IDLE = 'idle',
  /** Querying */
  QUERYING = 'querying',
  /** Query succeeded */
  SUCCESS = 'success',
  /** Query failed */
  FAILED = 'failed'
}

/**
 * Do Not Disturb model JSON serialization interface.
 */
export interface DoNotDisturbModelJson {
  isDoNotDisturbEnabled: boolean;
  isNotifyAllowed: boolean;
  status: DoNotDisturbStatus;
  lastQueryTime: number;
  errorMessage: string;
  errorCode: number;
  queryCount: number;
}

/**
 * Do Not Disturb data model.
 * Encapsulates the query results of the intelligentScene module's Do Not Disturb status,
 * including the Do Not Disturb switch state and the notification-allowed state.
 */
export class DoNotDisturbModel {
  /** Whether the Do Not Disturb feature is enabled */
  public isDoNotDisturbEnabled: boolean;
  /** Whether notifications are allowed in Do Not Disturb mode */
  public isNotifyAllowed: boolean;
  /** Query status */
  public status: DoNotDisturbStatus;
  /** Timestamp of the last query */
  public lastQueryTime: number;
  /** Error message */
  public errorMessage: string;
  /** Error code */
  public errorCode: number;
  /** Query count statistic */
  public queryCount: number;

  /**
   * Creates a Do Not Disturb model instance.
   * @param {boolean} isDoNotDisturbEnabled - Whether Do Not Disturb is enabled
   * @param {boolean} isNotifyAllowed - Whether notifications are allowed during Do Not Disturb
   * @param {DoNotDisturbStatus} status - Initial query status
   */
  constructor(
    isDoNotDisturbEnabled: boolean = false,
    isNotifyAllowed: boolean = true,
    status: DoNotDisturbStatus = DoNotDisturbStatus.IDLE
  ) {
    hilog.info(DOMAIN, TAG, 'DoNotDisturbModel constructor: initializing, dnd=%{public}s, notify=%{public}s',
      isDoNotDisturbEnabled.toString(), isNotifyAllowed.toString());
    this.isDoNotDisturbEnabled = isDoNotDisturbEnabled;
    this.isNotifyAllowed = isNotifyAllowed;
    this.status = status;
    this.lastQueryTime = 0;
    this.errorMessage = '';
    this.errorCode = 0;
    this.queryCount = 0;
    hilog.info(DOMAIN, TAG, 'DoNotDisturbModel constructor: initialization complete');
  }

  // ========================================
  // Status management methods
  // ========================================

  /**
   * Marks the status as querying.
   * Called before invoking the asynchronous query API.
   */
  markQuerying(): void {
    hilog.info(DOMAIN, TAG, 'DoNotDisturbModel markQuerying: setting status to QUERYING');
    this.status = DoNotDisturbStatus.QUERYING;
    this.errorMessage = '';
    this.errorCode = 0;
  }

  /**
   * Marks the query as success and updates the Do Not Disturb status.
   * @param {boolean} dndEnabled - Whether Do Not Disturb is enabled
   * @param {boolean} notifyAllowed - Whether notifications are allowed during Do Not Disturb
   */
  markSuccess(dndEnabled: boolean, notifyAllowed: boolean): void {
    hilog.info(DOMAIN, TAG, 'DoNotDisturbModel markSuccess: dnd=%{public}s, notify=%{public}s',
      dndEnabled.toString(), notifyAllowed.toString());
    this.isDoNotDisturbEnabled = dndEnabled;
    this.isNotifyAllowed = notifyAllowed;
    this.status = DoNotDisturbStatus.SUCCESS;
    this.lastQueryTime = Date.now();
    this.queryCount += 1;
    this.errorMessage = '';
    this.errorCode = 0;
  }

  /**
   * Updates only the Do Not Disturb enabled state.
   * @param {boolean} dndEnabled - Whether Do Not Disturb is enabled
   */
  updateDndState(dndEnabled: boolean): void {
    hilog.info(DOMAIN, TAG, 'DoNotDisturbModel updateDndState: dnd=%{public}s', dndEnabled.toString());
    this.isDoNotDisturbEnabled = dndEnabled;
    this.lastQueryTime = Date.now();
  }

  /**
   * Updates only the notification-allowed state.
   * @param {boolean} notifyAllowed - Whether notifications are allowed
   */
  updateNotifyState(notifyAllowed: boolean): void {
    hilog.info(DOMAIN, TAG, 'DoNotDisturbModel updateNotifyState: notify=%{public}s', notifyAllowed.toString());
    this.isNotifyAllowed = notifyAllowed;
    this.lastQueryTime = Date.now();
  }

  /**
   * Marks the query as failed.
   * @param {string} errorMessage - Error description
   * @param {number} errorCode - Error code
   */
  markFailed(errorMessage: string, errorCode: number): void {
    hilog.error(DOMAIN, TAG, 'DoNotDisturbModel markFailed: error=%{public}s, code=%{public}d',
      errorMessage, errorCode);
    this.status = DoNotDisturbStatus.FAILED;
    this.errorMessage = errorMessage;
    this.errorCode = errorCode;
    this.lastQueryTime = Date.now();
    this.queryCount += 1;
  }

  // ========================================
  // Query methods
  // ========================================

  /**
   * Determines whether the Do Not Disturb feature is active.
   * @returns {boolean} Whether it is enabled
   */
  isDndActive(): boolean {
    const result: boolean = this.status === DoNotDisturbStatus.SUCCESS && this.isDoNotDisturbEnabled;
    hilog.debug(DOMAIN, TAG, 'DoNotDisturbModel isDndActive: %{public}s', result.toString());
    return result;
  }

  /**
   * Determines whether notifications are allowed in Do Not Disturb mode.
   * @returns {boolean} Whether they are allowed
   */
  canNotify(): boolean {
    const result: boolean = this.status === DoNotDisturbStatus.SUCCESS && this.isNotifyAllowed;
    hilog.debug(DOMAIN, TAG, 'DoNotDisturbModel canNotify: %{public}s', result.toString());
    return result;
  }

  /**
   * Determines whether the data is ready (at least one successful query).
   * @returns {boolean} Whether it is ready
   */
  isReady(): boolean {
    return this.status === DoNotDisturbStatus.SUCCESS;
  }

  /**
   * Gets the time elapsed since the last query (milliseconds).
   * @returns {number} The elapsed time, or -1 if never queried
   */
  getTimeSinceLastQuery(): number {
    if (this.lastQueryTime === 0) {
      return -1;
    }
    return Date.now() - this.lastQueryTime;
  }

  // ========================================
  // Serialization methods
  // ========================================

  /**
   * Serializes to a JSON-compatible object.
   * @returns {DoNotDisturbModelJson} JSON representation
   */
  toJSON(): DoNotDisturbModelJson {
    hilog.debug(DOMAIN, TAG, 'DoNotDisturbModel toJSON: serializing');
    const result: DoNotDisturbModelJson = {
      isDoNotDisturbEnabled: this.isDoNotDisturbEnabled,
      isNotifyAllowed: this.isNotifyAllowed,
      status: this.status,
      lastQueryTime: this.lastQueryTime,
      errorMessage: this.errorMessage,
      errorCode: this.errorCode,
      queryCount: this.queryCount
    };
    return result;
  }

  /**
   * Converts to a readable string.
   * @returns {string} String description
   */
  toString(): string {
    const result: string = `DoNotDisturbModel[dnd=${this.isDoNotDisturbEnabled}, ` +
      `notify=${this.isNotifyAllowed}, status=${this.status}, queries=${this.queryCount}]`;
    hilog.debug(DOMAIN, TAG, 'DoNotDisturbModel toString: %{public}s', result);
    return result;
  }

  /**
   * Resets the model to its initial status.
   * Clears all query results and statistics.
   */
  reset(): void {
    hilog.info(DOMAIN, TAG, 'DoNotDisturbModel reset: clearing all data');
    this.isDoNotDisturbEnabled = false;
    this.isNotifyAllowed = true;
    this.status = DoNotDisturbStatus.IDLE;
    this.lastQueryTime = 0;
    this.errorMessage = '';
    this.errorCode = 0;
    this.queryCount = 0;
  }
}
