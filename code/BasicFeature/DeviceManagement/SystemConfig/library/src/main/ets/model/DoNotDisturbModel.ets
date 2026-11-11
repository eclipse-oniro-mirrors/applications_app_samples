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
 * 免打扰查询状态枚举。
 * 用于标识免打扰相关信息的查询状态。
 */
export enum DoNotDisturbStatus {
  /** 未查询 */
  IDLE = 'idle',
  /** 查询中 */
  QUERYING = 'querying',
  /** 查询成功 */
  SUCCESS = 'success',
  /** 查询失败 */
  FAILED = 'failed'
}

/**
 * 免打扰模型 JSON 序列化接口。
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
 * 免打扰模式数据模型。
 * 封装 intelligentScene 模块的免打扰状态查询结果，
 * 包括免打扰开关状态和通知允许状态。
 */
export class DoNotDisturbModel {
  /** 免打扰功能是否启用 */
  public isDoNotDisturbEnabled: boolean;
  /** 免打扰模式下是否允许通知 */
  public isNotifyAllowed: boolean;
  /** 查询状态 */
  public status: DoNotDisturbStatus;
  /** 最后一次查询的时间戳 */
  public lastQueryTime: number;
  /** 错误信息 */
  public errorMessage: string;
  /** 错误码 */
  public errorCode: number;
  /** 查询次数统计 */
  public queryCount: number;

  /**
   * 创建免打扰模型实例。
   * @param {boolean} isDoNotDisturbEnabled - 免打扰是否启用
   * @param {boolean} isNotifyAllowed - 免打扰时是否允许通知
   * @param {DoNotDisturbStatus} status - 初始查询状态
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
  // 状态管理方法
  // ========================================

  /**
   * 标记为查询中状态。
   * 在调用异步查询接口之前调用。
   */
  markQuerying(): void {
    hilog.info(DOMAIN, TAG, 'DoNotDisturbModel markQuerying: setting status to QUERYING');
    this.status = DoNotDisturbStatus.QUERYING;
    this.errorMessage = '';
    this.errorCode = 0;
  }

  /**
   * 标记为查询成功并更新免打扰状态。
   * @param {boolean} dndEnabled - 免打扰是否启用
   * @param {boolean} notifyAllowed - 免打扰时是否允许通知
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
   * 仅更新免打扰启用状态。
   * @param {boolean} dndEnabled - 免打扰是否启用
   */
  updateDndState(dndEnabled: boolean): void {
    hilog.info(DOMAIN, TAG, 'DoNotDisturbModel updateDndState: dnd=%{public}s', dndEnabled.toString());
    this.isDoNotDisturbEnabled = dndEnabled;
    this.lastQueryTime = Date.now();
  }

  /**
   * 仅更新通知允许状态。
   * @param {boolean} notifyAllowed - 是否允许通知
   */
  updateNotifyState(notifyAllowed: boolean): void {
    hilog.info(DOMAIN, TAG, 'DoNotDisturbModel updateNotifyState: notify=%{public}s', notifyAllowed.toString());
    this.isNotifyAllowed = notifyAllowed;
    this.lastQueryTime = Date.now();
  }

  /**
   * 标记为查询失败。
   * @param {string} errorMessage - 错误描述
   * @param {number} errorCode - 错误码
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
  // 查询方法
  // ========================================

  /**
   * 判断免打扰功能是否处于启用状态。
   * @returns {boolean} 是否启用
   */
  isDndActive(): boolean {
    const result: boolean = this.status === DoNotDisturbStatus.SUCCESS && this.isDoNotDisturbEnabled;
    hilog.debug(DOMAIN, TAG, 'DoNotDisturbModel isDndActive: %{public}s', result.toString());
    return result;
  }

  /**
   * 判断免打扰模式下通知是否被允许。
   * @returns {boolean} 是否允许
   */
  canNotify(): boolean {
    const result: boolean = this.status === DoNotDisturbStatus.SUCCESS && this.isNotifyAllowed;
    hilog.debug(DOMAIN, TAG, 'DoNotDisturbModel canNotify: %{public}s', result.toString());
    return result;
  }

  /**
   * 判断数据是否已就绪（至少成功查询过一次）。
   * @returns {boolean} 是否就绪
   */
  isReady(): boolean {
    return this.status === DoNotDisturbStatus.SUCCESS;
  }

  /**
   * 获取距上次查询的时间差（毫秒）。
   * @returns {number} 时间差，未查询过返回 -1
   */
  getTimeSinceLastQuery(): number {
    if (this.lastQueryTime === 0) {
      return -1;
    }
    return Date.now() - this.lastQueryTime;
  }

  // ========================================
  // 序列化方法
  // ========================================

  /**
   * 序列化为 JSON 兼容对象。
   * @returns {DoNotDisturbModelJson} JSON 表示
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
   * 转换为可读字符串。
   * @returns {string} 字符串描述
   */
  toString(): string {
    const result: string = `DoNotDisturbModel[dnd=${this.isDoNotDisturbEnabled}, ` +
      `notify=${this.isNotifyAllowed}, status=${this.status}, queries=${this.queryCount}]`;
    hilog.debug(DOMAIN, TAG, 'DoNotDisturbModel toString: %{public}s', result);
    return result;
  }

  /**
   * 重置模型到初始状态。
   * 清除所有查询结果和统计信息。
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
