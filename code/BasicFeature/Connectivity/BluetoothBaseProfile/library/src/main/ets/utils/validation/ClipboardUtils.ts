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
 * clipboard data type enum
 */
export enum ClipboardDataType {
  TEXT = 'text',
  URI = 'uri',
  HTML = 'html',
  UNKNOWN = 'unknown'
}

/**
 * clipboard change listener interface
 */
export interface ClipboardChangeListener {
  onDataChange(data: string, type: ClipboardDataType): void;
}

/**
 * clipboard utility class
 * provides clipboard operation relative relate actual use method method
 */
export class ClipboardUtils {
  /** internal part clipboard store */
  private static clipboardData: string = '';
  /** number data class type */
  private static dataType: ClipboardDataType = ClipboardDataType.UNKNOWN;
  /** listener list */
  private static listeners: ClipboardChangeListener[] = [];

  /**
   * set clipboard text
   * @param text - want set text
   */
  static setText(text: string): void {
    hilog.info(DOMAIN, TAG, 'ClipboardUtils setText: length=%{public}d', text.length);
    ClipboardUtils.clipboardData = text;
    ClipboardUtils.dataType = ClipboardDataType.TEXT;
    ClipboardUtils.notifyListeners(text, ClipboardDataType.TEXT);
  }

  /**
   * get clipboard text
   * @returns clipboard text
   */
  static getText(): string {
    return ClipboardUtils.clipboardData;
  }

  /**
   * get clipboard data type
   * @returns number data class type
   */
  static getDataType(): ClipboardDataType {
    return ClipboardUtils.dataType;
  }

  /**
   * check whether the clipboard has content
   * @returns whether have internal content
   */
  static hasData(): boolean {
    return ClipboardUtils.clipboardData.length > 0;
  }

  /**
   * clear clipboard
   */
  static clear(): void {
    hilog.info(DOMAIN, TAG, 'ClipboardUtils clear: clearing clipboard');
    ClipboardUtils.clipboardData = '';
    ClipboardUtils.dataType = ClipboardDataType.UNKNOWN;
  }

  /**
   * check test number data class type
   * @param data - want check test number data
   * @returns number data class type
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
   * copy Bluetooth device info to clipboard
   * @param deviceName - device name
   * @param macAddress - MAC ground address
   */
  static copyDeviceInfo(deviceName: string, macAddress: string): void {
    const info: string = 'Device: ' + deviceName + '\nMAC: ' + macAddress;
    ClipboardUtils.setText(info);
  }

  /**
   * copy connection log
   * @param logs - log array
   */
  static copyConnectionLogs(logs: string[]): void {
    ClipboardUtils.setText(logs.join('\n'));
  }

  /**
   * add change listener
   * @param listener - listener
   */
  static addListener(listener: ClipboardChangeListener): void {
    ClipboardUtils.listeners.push(listener);
  }

  /**
   * remove change listener
   * @param listener - listener
   */
  static removeListener(listener: ClipboardChangeListener): void {
    const index: number = ClipboardUtils.listeners.indexOf(listener);
    if (index !== -1) {
      ClipboardUtils.listeners.splice(index, 1);
    }
  }

  /**
   * notify all listeners
   * @param data - number data
   * @param type - class type
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
