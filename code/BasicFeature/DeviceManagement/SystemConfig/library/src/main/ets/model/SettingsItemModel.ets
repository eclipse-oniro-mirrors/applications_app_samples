/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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
 * 设置项类型枚举。
 * 标识不同的设置页面类型。
 */
export enum SettingsItemType {
  /** PIN 码设置 */
  PIN_SETTING = 'pinSetting',
  /** NFC 设置 */
  NFC_SETTING = 'nfcSetting',
  /** 双击设置 */
  DOUBLE_CLICK_SETTING = 'doubleClickSetting'
}

/**
 * 设置项操作状态枚举。
 * 标识设置项的当前操作状态。
 */
export enum SettingsOperationStatus {
  /** 空闲 */
  IDLE = 'idle',
  /** 打开页面中 */
  OPENING = 'opening',
  /** 查询中 */
  QUERYING = 'querying',
  /** 操作成功 */
  SUCCESS = 'success',
  /** 操作失败 */
  FAILED = 'failed'
}

/**
 * 双击回调结果枚举。
 * 用于 isDoubleClickAppForSelf 的回调结果。
 */
export enum ClickResult {
  /** 是双击应用自身 */
  IS_SELF = 'isSelf',
  /** 不是双击应用自身 */
  NOT_SELF = 'notSelf',
  /** 查询失败 */
  ERROR = 'error'
}

/**
 * 双击回调接口。
 * 对应 settingsLite.isDoubleClickAppForSelf 的回调参数。
 */
export interface ClickCallback {
  /** 回调结果 */
  result: ClickResult;
  /** 错误信息（失败时） */
  errorMessage: string;
  /** 错误码（失败时） */
  errorCode: number;
}

/**
 * 设置项模型 JSON 序列化接口。
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
 * 设置项数据模型。
 * 封装 settingsLite 模块各设置项的状态和操作结果，
 * 支持 PIN 设置、NFC 设置和双击设置三种类型。
 */
export class SettingsItemModel {
  /** 设置项类型 */
  itemType: SettingsItemType;
  /** 设置项显示标题 */
  title: string;
  /** 设置项描述信息 */
  description: string;
  /** 操作状态 */
  operationStatus: SettingsOperationStatus;
  /** 双击回调结果（仅双击设置类型有效） */
  clickResult: ClickResult;
  /** 最后一次操作的时间戳 */
  lastOperationTime: number;
  /** 错误信息 */
  errorMessage: string;
  /** 错误码 */
  errorCode: number;
  /** 操作次数统计 */
  operationCount: number;

  /**
   * 创建设置项模型实例。
   * @param {SettingsItemType} itemType - 设置项类型
   * @param {string} title - 显示标题
   * @param {string} description - 描述信息
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
  // 状态管理方法
  // ========================================

  /**
   * 标记为打开页面中状态。
   * 在调用 openXxxSettingsPage 之前调用。
   */
  markOpening(): void {
    hilog.info(DOMAIN, TAG, 'SettingsItemModel markOpening: type=%{public}s', this.itemType);
    this.operationStatus = SettingsOperationStatus.OPENING;
    this.errorMessage = '';
    this.errorCode = 0;
  }

  /**
   * 标记为查询中状态。
   * 在调用 isDoubleClickAppForSelf 之前调用。
   */
  markQuerying(): void {
    hilog.info(DOMAIN, TAG, 'SettingsItemModel markQuerying: type=%{public}s', this.itemType);
    this.operationStatus = SettingsOperationStatus.QUERYING;
    this.errorMessage = '';
    this.errorCode = 0;
  }

  /**
   * 标记为操作成功。
   * @param {string} [additionalInfo] - 附加信息
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
   * 标记为操作失败。
   * @param {string} errorMessage - 错误描述
   * @param {number} errorCode - 错误码
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
   * 更新双击回调结果。
   * @param {ClickResult} result - 回调结果
   */
  updateClickResult(result: ClickResult): void {
    hilog.info(DOMAIN, TAG, 'SettingsItemModel updateClickResult: result=%{public}s', result);
    this.clickResult = result;
    this.lastOperationTime = Date.now();
  }

  // ========================================
  // 查询方法
  // ========================================

  /**
   * 判断当前操作是否成功。
   * @returns {boolean} 是否成功
   */
  isSuccess(): boolean {
    return this.operationStatus === SettingsOperationStatus.SUCCESS;
  }

  /**
   * 判断当前是否正在打开页面。
   * @returns {boolean} 是否打开中
   */
  isOpening(): boolean {
    return this.operationStatus === SettingsOperationStatus.OPENING;
  }

  /**
   * 判断当前是否正在查询。
   * @returns {boolean} 是否查询中
   */
  isQuerying(): boolean {
    return this.operationStatus === SettingsOperationStatus.QUERYING;
  }

  /**
   * 获取操作状态的中文描述。
   * @returns {string} 状态描述
   */
  getStatusDescription(): string {
    switch (this.operationStatus) {
      case SettingsOperationStatus.IDLE:
        return '空闲';
      case SettingsOperationStatus.OPENING:
        return '打开页面中';
      case SettingsOperationStatus.QUERYING:
        return '查询中';
      case SettingsOperationStatus.SUCCESS:
        return '操作成功';
      case SettingsOperationStatus.FAILED:
        return '操作失败';
      default:
        return '未知状态';
    }
  }

  /**
   * 获取设置项类型的中文名称。
   * @returns {string} 类型名称
   */
  getTypeName(): string {
    switch (this.itemType) {
      case SettingsItemType.PIN_SETTING:
        return 'PIN 码设置';
      case SettingsItemType.NFC_SETTING:
        return 'NFC 设置';
      case SettingsItemType.DOUBLE_CLICK_SETTING:
        return '双击设置';
      default:
        return '未知设置';
    }
  }

  // ========================================
  // 序列化方法
  // ========================================

  /**
   * 序列化为 JSON 兼容对象。
   * @returns {SettingsItemModelJson} JSON 表示
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
   * 转换为可读字符串。
   * @returns {string} 字符串描述
   */
  toString(): string {
    const result: string = `SettingsItemModel[type=${this.itemType}, title=${this.title}, ` +
      `status=${this.operationStatus}, ops=${this.operationCount}]`;
    hilog.debug(DOMAIN, TAG, 'SettingsItemModel toString: %{public}s', result);
    return result;
  }

  /**
   * 重置模型到初始状态。
   * 清除所有操作记录和统计信息。
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
