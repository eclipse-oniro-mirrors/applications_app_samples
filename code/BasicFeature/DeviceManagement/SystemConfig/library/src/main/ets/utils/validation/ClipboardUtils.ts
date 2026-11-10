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
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// 剪贴板数据类型枚举
// ========================================

/**
 * 剪贴板数据类型枚举。
 * 定义剪贴板中可能存储的数据种类。
 */
export enum ClipboardDataType {
  /** 纯文本类型 */
  TEXT = 'TEXT',
  /** 网址链接类型 */
  URL = 'URL',
  /** 图片资源类型 */
  IMAGE = 'IMAGE',
  /** HTML 富文本类型 */
  HTML = 'HTML',
  /** 未知类型 */
  UNKNOWN = 'UNKNOWN'
}

// ========================================
// 剪贴板变更监听接口
// ========================================

/**
 * 剪贴板内容变更监听接口。
 * 当剪贴板数据发生变化时，通过此接口回调通知。
 */
export interface ClipboardChangeListener {
  /**
   * 剪贴板内容变更回调。
   * @param {ClipboardDataType} type - 变更后的数据类型
   * @param {string} data - 变更后的数据内容
   */
  onClip(type: ClipboardDataType, data: string): void;
}

// ========================================
// 剪贴板内容解析结果接口
// ========================================

/**
 * 剪贴板内容解析结果。
 * 包含解析后的数据类型和数据内容。
 */
export interface ClipboardParseResult {
  /** 解析得到的数据类型 */
  type: ClipboardDataType;
  /** 解析得到的数据内容 */
  data: string;
}

// ========================================
// 剪贴板工具类
// ========================================

/**
 * 剪贴板模拟工具类。
 * 提供剪贴板数据的存取、类型检测、变更监听等能力，
 * 用于在系统配置场景中模拟剪贴板操作。
 */
export class ClipboardUtils {
  /** 内部剪贴板数据存储 */
  private clipboardData: string = '';
  /** 当前剪贴板数据类型 */
  private currentType: ClipboardDataType = ClipboardDataType.UNKNOWN;
  /** 变更监听器列表 */
  private listeners: ClipboardChangeListener[] = [];
  /** 剪贴板操作历史记录 */
  private operationHistory: string[] = [];
  /** 最大历史记录条数 */
  private readonly maxHistorySize: number = 50;

  /**
   * 设置剪贴板数据。
   * 自动检测数据类型并通知所有监听器。
   * @param {string} data - 要写入剪贴板的数据
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
          (err as Record<string, Object>)['message'] as string ?? 'unknown');
      }
    }
  }

  /**
   * 获取剪贴板数据。
   * @returns {string} 当前剪贴板中的文本数据
   */
  getData(): string {
    this.recordOperation('GET');
    return this.clipboardData;
  }

  /**
   * 获取当前剪贴板数据类型。
   * @returns {ClipboardDataType} 数据类型枚举值
   */
  getDataType(): ClipboardDataType {
    return this.currentType;
  }

  /**
   * 判断剪贴板是否包含数据。
   * @returns {boolean} 是否包含非空数据
   */
  hasData(): boolean {
    return this.clipboardData.length > 0;
  }

  /**
   * 清空剪贴板数据。
   * 重置数据类型为 UNKNOWN 并记录操作历史。
   */
  clear(): void {
    hilog.info(DOMAIN, TAG, 'ClipboardUtils clear: clearing clipboard data');
    this.clipboardData = '';
    this.currentType = ClipboardDataType.UNKNOWN;
    this.recordOperation('CLEAR');
  }

  /**
   * 添加剪贴板变更监听器。
   * @param {ClipboardChangeListener} listener - 要添加的监听器
   */
  addListener(listener: ClipboardChangeListener): void {
    this.listeners.push(listener);
    hilog.info(DOMAIN, TAG, 'ClipboardUtils addListener: total=%{public}d', this.listeners.length);
  }

  /**
   * 移除剪贴板变更监听器。
   * @param {ClipboardChangeListener} listener - 要移除的监听器
   */
  removeListener(listener: ClipboardChangeListener): void {
    const index: number = this.listeners.indexOf(listener);
    if (index >= 0) {
      this.listeners.splice(index, 1);
    }
  }

  /**
   * 获取当前监听器数量。
   * @returns {number} 已注册的监听器数量
   */
  getListenerCount(): number {
    return this.listeners.length;
  }

  // ========================================
  // 类型检测与解析
  // ========================================

  /**
   * 获取数据类型的可读标签。
   * @param {ClipboardDataType} type - 数据类型枚举值
   * @returns {string} 类型的中文描述标签
   */
  getDataTypeLabel(type: ClipboardDataType): string {
    switch (type) {
      case ClipboardDataType.TEXT:
        return '纯文本';
      case ClipboardDataType.URL:
        return '网址链接';
      case ClipboardDataType.IMAGE:
        return '图片资源';
      case ClipboardDataType.HTML:
        return 'HTML富文本';
      case ClipboardDataType.UNKNOWN:
        return '未知类型';
      default:
        return '未识别';
    }
  }

  /**
   * 判断字符串是否为有效的 URL 地址。
   * 支持 http、https、ftp 等常见协议。
   * @param {string} str - 待检测的字符串
   * @returns {boolean} 是否为有效 URL
   */
  isUrl(str: string): boolean {
    const urlPattern: RegExp = /^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$/i;
    return urlPattern.test(str);
  }

  /**
   * 判断字符串是否为 HTML 内容。
   * 通过检测常见的 HTML 标签来判断。
   * @param {string} str - 待检测的字符串
   * @returns {boolean} 是否为 HTML 内容
   */
  isHtml(str: string): boolean {
    const htmlPattern: RegExp = /<[a-z][\s\S]*>/i;
    return htmlPattern.test(str);
  }

  /**
   * 解析原始剪贴板内容，识别其类型和数据。
   * 按照 URL、HTML、IMAGE、TEXT 的优先级依次检测。
   * @param {string} raw - 原始剪贴板内容字符串
   * @returns {ClipboardParseResult} 解析结果，包含类型和数据
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
   * 获取剪贴板操作历史记录。
   * @returns {string[]} 操作历史数组，每条记录格式为 "操作类型:时间戳"
   */
  getOperationHistory(): string[] {
    return [...this.operationHistory];
  }

  // ========================================
  // 内部辅助方法
  // ========================================

  /**
   * 自动检测字符串的数据类型。
   * @param {string} data - 待检测的字符串
   * @returns {ClipboardDataType} 检测到的数据类型
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
   * 记录剪贴板操作到历史。
   * @param {string} operation - 操作类型标识
   */
  private recordOperation(operation: string): void {
    const timestamp: number = Date.now();
    const record: string = `${operation}:${timestamp}`;
    this.operationHistory.push(record);

    // 超出最大历史条数时移除最早的记录
    if (this.operationHistory.length > this.maxHistorySize) {
      this.operationHistory.shift();
    }
  }
}
