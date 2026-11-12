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
 * Channel config status enum.
 * Identifies the fetch status of the channel configuration.
 */
export enum ChannelConfigStatus {
  /** Uninitialized */
  UNINITIALIZED = 'uninitialized',
  /** Fetch succeeded */
  SUCCESS = 'success',
  /** Fetch failed */
  FAILED = 'failed',
  /** Fetching */
  LOADING = 'loading'
}

/**
 * Channel config JSON serialization interface.
 */
export interface ChannelConfigJson {
  channelId: string;
  status: ChannelConfigStatus;
  lastFetchTime: number;
  errorMessage: string;
  errorCode: number;
  fetchCount: number;
}

/**
 * Channel config data model.
 * Encapsulates the channel info returned by customConfig.getChannelId(),
 * providing status tracking and timestamp recording.
 */
export class ChannelConfigModel {
  /** Channel identifier */
  public channelId: string;
  /** Channel config status */
  public status: ChannelConfigStatus;
  /** Timestamp of the last fetch */
  public lastFetchTime: number;
  /** Error message (recorded when the fetch fails) */
  public errorMessage: string;
  /** Error code */
  public errorCode: number;
  /** Fetch count statistic */
  public fetchCount: number;

  /**
   * Creates a channel config model instance.
   * @param {string} channelId - Channel identifier
   * @param {ChannelConfigStatus} status - Initial status
   * @param {number} lastFetchTime - Last fetch timestamp
   * @param {string} errorMessage - Error message
   * @param {number} errorCode - Error code
   * @param {number} fetchCount - Fetch count
   */
  constructor(
    channelId: string = '',
    status: ChannelConfigStatus = ChannelConfigStatus.UNINITIALIZED,
    lastFetchTime: number = 0,
    errorMessage: string = '',
    errorCode: number = 0,
    fetchCount: number = 0
  ) {
    hilog.info(DOMAIN, TAG, 'ChannelConfigModel constructor: initializing with channelId=%{public}s', channelId);
    this.channelId = channelId;
    this.status = status;
    this.lastFetchTime = lastFetchTime;
    this.errorMessage = errorMessage;
    this.errorCode = errorCode;
    this.fetchCount = fetchCount;
    hilog.info(DOMAIN, TAG, 'ChannelConfigModel constructor: initialization complete');
  }

  // ========================================
  // Status management methods
  // ========================================

  /**
   * Marks the status as loading.
   * Called before invoking getChannelId.
   */
  markLoading(): void {
    hilog.info(DOMAIN, TAG, 'ChannelConfigModel markLoading: setting status to LOADING');
    this.status = ChannelConfigStatus.LOADING;
    this.errorMessage = '';
    this.errorCode = 0;
  }

  /**
   * Marks the status as success and updates the channel id.
   * @param {string} channelId - The fetched channel id
   */
  markSuccess(channelId: string): void {
    hilog.info(DOMAIN, TAG, 'ChannelConfigModel markSuccess: channelId=%{public}s', channelId);
    this.channelId = channelId;
    this.status = ChannelConfigStatus.SUCCESS;
    this.lastFetchTime = Date.now();
    this.fetchCount += 1;
    this.errorMessage = '';
    this.errorCode = 0;
  }

  /**
   * Marks the status as failed and records the error info.
   * @param {string} errorMessage - Error description
   * @param {number} errorCode - Error code
   */
  markFailed(errorMessage: string, errorCode: number): void {
    hilog.error(DOMAIN, TAG, 'ChannelConfigModel markFailed: error=%{public}s, code=%{public}d',
      errorMessage, errorCode);
    this.status = ChannelConfigStatus.FAILED;
    this.errorMessage = errorMessage;
    this.errorCode = errorCode;
    this.lastFetchTime = Date.now();
    this.fetchCount += 1;
  }

  // ========================================
  // Query methods
  // ========================================

  /**
   * Determines whether the channel id has been fetched successfully.
   * @returns {boolean} Whether it succeeded
   */
  isSuccess(): boolean {
    const result: boolean = this.status === ChannelConfigStatus.SUCCESS && this.channelId.length > 0;
    hilog.debug(DOMAIN, TAG, 'ChannelConfigModel isSuccess: %{public}s', result.toString());
    return result;
  }

  /**
   * Determines whether it is currently loading.
   * @returns {boolean} Whether it is loading
   */
  isLoading(): boolean {
    return this.status === ChannelConfigStatus.LOADING;
  }

  /**
   * Determines whether the current fetch failed.
   * @returns {boolean} Whether it failed
   */
  isFailed(): boolean {
    return this.status === ChannelConfigStatus.FAILED;
  }

  /**
   * Gets the time elapsed since the last fetch (milliseconds).
   * @returns {number} The elapsed time, or -1 if never fetched
   */
  getTimeSinceLastFetch(): number {
    if (this.lastFetchTime === 0) {
      return -1;
    }
    return Date.now() - this.lastFetchTime;
  }

  // ========================================
  // Serialization methods
  // ========================================

  /**
   * Serializes to a JSON-compatible object.
   * @returns {ChannelConfigJson} JSON representation
   */
  toJSON(): ChannelConfigJson {
    hilog.debug(DOMAIN, TAG, 'ChannelConfigModel toJSON: serializing');
    const result: ChannelConfigJson = {
      channelId: this.channelId,
      status: this.status,
      lastFetchTime: this.lastFetchTime,
      errorMessage: this.errorMessage,
      errorCode: this.errorCode,
      fetchCount: this.fetchCount
    };
    return result;
  }

  /**
   * Converts to a readable string.
   * @returns {string} String description
   */
  toString(): string {
    const result: string = `ChannelConfigModel[id=${this.channelId}, status=${this.status}, ` +
      `fetchCount=${this.fetchCount}, lastFetch=${this.lastFetchTime}]`;
    hilog.debug(DOMAIN, TAG, 'ChannelConfigModel toString: %{public}s', result);
    return result;
  }

  /**
   * Resets the model to its initial status.
   * Clears all fetched data and statistics.
   */
  reset(): void {
    hilog.info(DOMAIN, TAG, 'ChannelConfigModel reset: clearing all data');
    this.channelId = '';
    this.status = ChannelConfigStatus.UNINITIALIZED;
    this.lastFetchTime = 0;
    this.errorMessage = '';
    this.errorCode = 0;
    this.fetchCount = 0;
  }
}
