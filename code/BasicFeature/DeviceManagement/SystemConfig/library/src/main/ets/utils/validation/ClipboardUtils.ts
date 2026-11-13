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
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';
import { ResourceHelper } from '../basic/ResourceHelper';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// Clipboard data type enum
// ========================================

/**
 * Clipboard data type enum.
 * Defines the kinds of data that may be stored in the clipboard.
 */
export enum ClipboardDataType {
  /** Plain text */
  TEXT = 'TEXT',
  /** URL link */
  URL = 'URL',
  /** Image resource */
  IMAGE = 'IMAGE',
  /** HTML rich text */
  HTML = 'HTML',
  /** Unknown type */
  UNKNOWN = 'UNKNOWN'
}

// ========================================
// Clipboard change listener interface
// ========================================

/**
 * Clipboard content change listener interface.
 * Notified via callback when clipboard data changes.
 */
export interface ClipboardChangeListener {
  /**
   * Clipboard content change callback.
   * @param {ClipboardDataType} type - Data type after the change
   * @param {string} data - Data content after the change
   */
  onClip(type: ClipboardDataType, data: string): void;
}

// ========================================
// Clipboard content parse result interface
// ========================================

/**
 * Clipboard content parse result.
 * Contains the parsed data type and data content.
 */
export interface ClipboardParseResult {
  /** Parsed data type */
  type: ClipboardDataType;
  /** Parsed data content */
  data: string;
}

// ========================================
// Clipboard utility class
// ========================================

/**
 * Simulated clipboard utility class.
 * Provides clipboard data storage, type detection and change listening,
 * used to simulate clipboard operations in system config scenarios.
 */
export class ClipboardUtils {
  /** Internal clipboard data store */
  private clipboardData: string = '';
  /** Current clipboard data type */
  private currentType: ClipboardDataType = ClipboardDataType.UNKNOWN;
  /** Change listener list */
  private listeners: ClipboardChangeListener[] = [];
  /** Clipboard operation history */
  private operationHistory: string[] = [];
  /** Maximum number of history records */
  private readonly maxHistorySize: number = 50;

  /**
   * Sets clipboard data.
   * Detects the data type automatically and notifies all listeners.
   * @param {string} data - Data to write into the clipboard
   */
  setData(data: string): void {
    hilog.info(DOMAIN, TAG, 'ClipboardUtils setData: length=%{public}d', data.length);
    this.clipboardData = data;
    this.currentType = this.detectDataType(data);
    this.recordOperation('SET');
    hilog.info(DOMAIN, TAG, 'ClipboardUtils setData: type=%{public}s', this.currentType);

    for (const listener of this.listeners) {
      try {
        listener.onClip(this.currentType, data);
      } catch (err) {
        hilog.error(DOMAIN, TAG, 'ClipboardUtils setData: listener error=%{public}s',
          (err as { message?: string }).message ?? 'unknown');
      }
    }
  }

  /**
   * Gets clipboard data.
   * @returns {string} Current text data in the clipboard
   */
  getData(): string {
    this.recordOperation('GET');
    return this.clipboardData;
  }

  /**
   * Gets the current clipboard data type.
   * @returns {ClipboardDataType} Data type enum value
   */
  getDataType(): ClipboardDataType {
    return this.currentType;
  }

  /**
   * Checks whether the clipboard contains data.
   * @returns {boolean} Whether non-empty data exists
   */
  hasData(): boolean {
    return this.clipboardData.length > 0;
  }

  /**
   * Clears clipboard data.
   * Resets the data type to UNKNOWN and records the operation history.
   */
  clear(): void {
    hilog.info(DOMAIN, TAG, 'ClipboardUtils clear: clearing clipboard data');
    this.clipboardData = '';
    this.currentType = ClipboardDataType.UNKNOWN;
    this.recordOperation('CLEAR');
  }

  /**
   * Adds a clipboard change listener.
   * @param {ClipboardChangeListener} listener - Listener to add
   */
  addListener(listener: ClipboardChangeListener): void {
    this.listeners.push(listener);
    hilog.info(DOMAIN, TAG, 'ClipboardUtils addListener: total=%{public}d', this.listeners.length);
  }

  /**
   * Removes a clipboard change listener.
   * @param {ClipboardChangeListener} listener - Listener to remove
   */
  removeListener(listener: ClipboardChangeListener): void {
    const index: number = this.listeners.indexOf(listener);
    if (index >= 0) {
      this.listeners.splice(index, 1);
    }
  }

  /**
   * Gets the current listener count.
   * @returns {number} Number of registered listeners
   */
  getListenerCount(): number {
    return this.listeners.length;
  }

  // ========================================
  // Type detection and parsing
  // ========================================

  /**
   * Gets the readable label of a data type.
   * @param {ClipboardDataType} type - Data type enum value
   * @returns {string} Localized type description label
   */
  getDataTypeLabel(type: ClipboardDataType): string {
    switch (type) {
      case ClipboardDataType.TEXT:
        return ResourceHelper.getStringByName('clip_type_text');
      case ClipboardDataType.URL:
        return ResourceHelper.getStringByName('clip_type_url');
      case ClipboardDataType.IMAGE:
        return ResourceHelper.getStringByName('clip_type_image');
      case ClipboardDataType.HTML:
        return ResourceHelper.getStringByName('clip_type_html');
      case ClipboardDataType.UNKNOWN:
        return ResourceHelper.getStringByName('clip_type_unknown');
      default:
        return ResourceHelper.getStringByName('clip_type_none');
    }
  }

  /**
   * Checks whether a string is a valid URL.
   * Supports common protocols such as http, https and ftp.
   * @param {string} str - String to check
   * @returns {boolean} Whether it is a valid URL
   */
  isUrl(str: string): boolean {
    const urlPattern: RegExp = /^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$/i;
    return urlPattern.test(str);
  }

  /**
   * Checks whether a string is HTML content.
   * Detected by looking for common HTML tags.
   * @param {string} str - String to check
   * @returns {boolean} Whether it is HTML content
   */
  isHtml(str: string): boolean {
    const htmlPattern: RegExp = /<[a-z][\s\S]*>/i;
    return htmlPattern.test(str);
  }

  /**
   * Parses raw clipboard content to identify its type and data.
   * Checks in the priority order of URL, HTML, IMAGE and TEXT.
   * @param {string} raw - Raw clipboard content string
   * @returns {ClipboardParseResult} Parse result containing type and data
   */
  parseClipboardContent(raw: string): ClipboardParseResult {
    hilog.info(DOMAIN, TAG, 'ClipboardUtils parseClipboardContent: parsing raw content');

    if (this.isUrl(raw)) {
      return { type: ClipboardDataType.URL, data: raw };
    }
    if (this.isHtml(raw)) {
      return { type: ClipboardDataType.HTML, data: raw };
    }
    if (raw.startsWith('image://') || raw.startsWith('data:image/')) {
      return { type: ClipboardDataType.IMAGE, data: raw };
    }
    return { type: ClipboardDataType.TEXT, data: raw };
  }

  /**
   * Gets the clipboard operation history.
   * @returns {string[]} History array, each record formatted as "operation type:timestamp"
   */
  getOperationHistory(): string[] {
    return [...this.operationHistory];
  }

  // ========================================
  // Internal helper methods
  // ========================================

  /**
   * Detects the data type of a string automatically.
   * @param {string} data - String to detect
   * @returns {ClipboardDataType} Detected data type
   */
  private detectDataType(data: string): ClipboardDataType {
    if (data.length === 0) {
      return ClipboardDataType.UNKNOWN;
    }
    if (this.isUrl(data)) {
      return ClipboardDataType.URL;
    }
    if (this.isHtml(data)) {
      return ClipboardDataType.HTML;
    }
    if (data.startsWith('image://') || data.startsWith('data:image/')) {
      return ClipboardDataType.IMAGE;
    }
    return ClipboardDataType.TEXT;
  }

  /**
   * Records a clipboard operation into the history.
   * @param {string} operation - Operation type identifier
   */
  private recordOperation(operation: string): void {
    const timestamp: number = Date.now();
    const record: string = `${operation}:${timestamp}`;
    this.operationHistory.push(record);

    // Remove the oldest record when the maximum history size is exceeded
    if (this.operationHistory.length > this.maxHistorySize) {
      this.operationHistory.shift();
    }
  }
}
