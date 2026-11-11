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
import { BluetoothConstants } from '../../constants/BluetoothConstants';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * 剪贴板数据类型枚举
 */
export enum ClipboardDataType {
  TEXT = 'text',
  URI = 'uri',
  HTML = 'html',
  UNKNOWN = 'unknown'
}

/**
 * 剪贴板变更监听器接口
 */
export interface ClipboardChangeListener {
  onDataChange(data: string, type: ClipboardDataType): void;
}

/**
 * 剪贴板工具类
 * 提供剪贴板操作相关的实用方法
 */
export class ClipboardUtils {
  /** 内部剪贴板存储 */
  private static clipboardData: string = '';
  /** 数据类型 */
  private static dataType: ClipboardDataType = ClipboardDataType.UNKNOWN;
  /** 监听器列表 */
  private static listeners: ClipboardChangeListener[] = [];

  /**
   * 设置剪贴板文本
   * @param text - 要设置的文本
   */
  static setText(text: string): void {
    hilog.info(DOMAIN, TAG, 'ClipboardUtils setText: length=%{public}d', text.length);
    ClipboardUtils.clipboardData = text;
    ClipboardUtils.dataType = ClipboardDataType.TEXT;
    ClipboardUtils.notifyListeners(text, ClipboardDataType.TEXT);
  }

  /**
   * 获取剪贴板文本
   * @returns 剪贴板文本
   */
  static getText(): string {
    return ClipboardUtils.clipboardData;
  }

  /**
   * 获取剪贴板数据类型
   * @returns 数据类型
   */
  static getDataType(): ClipboardDataType {
    return ClipboardUtils.dataType;
  }

  /**
   * 检查剪贴板是否有内容
   * @returns 是否有内容
   */
  static hasData(): boolean {
    return ClipboardUtils.clipboardData.length > 0;
  }

  /**
   * 清空剪贴板
   */
  static clear(): void {
    hilog.info(DOMAIN, TAG, 'ClipboardUtils clear: clearing clipboard');
    ClipboardUtils.clipboardData = '';
    ClipboardUtils.dataType = ClipboardDataType.UNKNOWN;
  }

  /**
   * 检测数据类型
   * @param data - 要检测的数据
   * @returns 数据类型
   */
  static detectType(data: string): ClipboardDataType {
    if (!data) {
      return ClipboardDataType.UNKNOWN;
    }
    if (data.startsWith('http://') || data.startsWith('https://')) {
      return ClipboardDataType.URI;
    }
    if (data.startsWith('<') && data.indexOf('>') !== -1) {
      return ClipboardDataType.HTML;
    }
    return ClipboardDataType.TEXT;
  }

  /**
   * 复制蓝牙设备信息到剪贴板
   * @param deviceName - 设备名称
   * @param macAddress - MAC地址
   */
  static copyDeviceInfo(deviceName: string, macAddress: string): void {
    const info: string = 'Device: ' + deviceName + '\nMAC: ' + macAddress;
    ClipboardUtils.setText(info);
  }

  /**
   * 复制连接日志
   * @param logs - 日志数组
   */
  static copyConnectionLogs(logs: string[]): void {
    ClipboardUtils.setText(logs.join('\n'));
  }

  /**
   * 添加变更监听器
   * @param listener - 监听器
   */
  static addListener(listener: ClipboardChangeListener): void {
    ClipboardUtils.listeners.push(listener);
  }

  /**
   * 移除变更监听器
   * @param listener - 监听器
   */
  static removeListener(listener: ClipboardChangeListener): void {
    const index: number = ClipboardUtils.listeners.indexOf(listener);
    if (index !== -1) {
      ClipboardUtils.listeners.splice(index, 1);
    }
  }

  /**
   * 通知所有监听器
   * @param data - 数据
   * @param type - 类型
   */
  private static notifyListeners(data: string, type: ClipboardDataType): void {
    for (const listener of ClipboardUtils.listeners) {
      try {
        listener.onDataChange(data, type);
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'ClipboardUtils notifyListeners: error');
      }
    }
  }
}
