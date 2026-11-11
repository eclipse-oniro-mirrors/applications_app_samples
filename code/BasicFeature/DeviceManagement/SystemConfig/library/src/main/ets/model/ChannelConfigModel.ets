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
 * 渠道配置状态枚举。
 * 用于标识渠道配置的获取状态。
 */
export enum ChannelConfigStatus {
  /** 未初始化 */
  UNINITIALIZED = 'uninitialized',
  /** 获取成功 */
  SUCCESS = 'success',
  /** 获取失败 */
  FAILED = 'failed',
  /** 获取中 */
  LOADING = 'loading'
}

/**
 * 渠道配置 JSON 序列化接口。
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
 * 渠道配置数据模型。
 * 封装 customConfig.getChannelId() 返回的渠道信息，
 * 提供状态追踪和时间戳记录能力。
 */
export class ChannelConfigModel {
  /** 渠道标识符 */
  public channelId: string;
  /** 渠道配置状态 */
  public status: ChannelConfigStatus;
  /** 最后一次获取的时间戳 */
  public lastFetchTime: number;
  /** 错误信息（获取失败时记录） */
  public errorMessage: string;
  /** 错误码 */
  public errorCode: number;
  /** 获取次数统计 */
  public fetchCount: number;

  /**
   * 创建渠道配置模型实例。
   * @param {string} channelId - 渠道标识符
   * @param {ChannelConfigStatus} status - 初始状态
   * @param {number} lastFetchTime - 最后获取时间戳
   * @param {string} errorMessage - 错误信息
   * @param {number} errorCode - 错误码
   * @param {number} fetchCount - 获取次数
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
  // 状态管理方法
  // ========================================

  /**
   * 标记为加载中状态。
   * 在调用 getChannelId 之前调用。
   */
  markLoading(): void {
    hilog.info(DOMAIN, TAG, 'ChannelConfigModel markLoading: setting status to LOADING');
    this.status = ChannelConfigStatus.LOADING;
    this.errorMessage = '';
    this.errorCode = 0;
  }

  /**
   * 标记为成功状态并更新渠道号。
   * @param {string} channelId - 获取到的渠道号
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
   * 标记为失败状态并记录错误信息。
   * @param {string} errorMessage - 错误描述
   * @param {number} errorCode - 错误码
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
  // 查询方法
  // ========================================

  /**
   * 判断当前是否已成功获取渠道号。
   * @returns {boolean} 是否成功
   */
  isSuccess(): boolean {
    const result: boolean = this.status === ChannelConfigStatus.SUCCESS && this.channelId.length > 0;
    hilog.debug(DOMAIN, TAG, 'ChannelConfigModel isSuccess: %{public}s', result.toString());
    return result;
  }

  /**
   * 判断当前是否正在加载中。
   * @returns {boolean} 是否加载中
   */
  isLoading(): boolean {
    return this.status === ChannelConfigStatus.LOADING;
  }

  /**
   * 判断当前是否获取失败。
   * @returns {boolean} 是否失败
   */
  isFailed(): boolean {
    return this.status === ChannelConfigStatus.FAILED;
  }

  /**
   * 获取距上次获取的时间差（毫秒）。
   * @returns {number} 时间差，未获取过返回 -1
   */
  getTimeSinceLastFetch(): number {
    if (this.lastFetchTime === 0) {
      return -1;
    }
    return Date.now() - this.lastFetchTime;
  }

  // ========================================
  // 序列化方法
  // ========================================

  /**
   * 序列化为 JSON 兼容对象。
   * @returns {ChannelConfigJson} JSON 表示
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
   * 转换为可读字符串。
   * @returns {string} 字符串描述
   */
  toString(): string {
    const result: string = `ChannelConfigModel[id=${this.channelId}, status=${this.status}, ` +
      `fetchCount=${this.fetchCount}, lastFetch=${this.lastFetchTime}]`;
    hilog.debug(DOMAIN, TAG, 'ChannelConfigModel toString: %{public}s', result);
    return result;
  }

  /**
   * 重置模型到初始状态。
   * 清除所有已获取的数据和统计信息。
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
