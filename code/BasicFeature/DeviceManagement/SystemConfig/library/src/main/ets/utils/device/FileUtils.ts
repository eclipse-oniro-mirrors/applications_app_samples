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

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// 文件扩展名常量定义
// ========================================

/** 图片文件扩展名列表 */
const IMAGE_EXTENSIONS: string[] = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'svg', 'ico', 'tiff', 'tif'];
/** 文档文件扩展名列表 */
const DOCUMENT_EXTENSIONS: string[] = ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'csv', 'md', 'rtf'];
/** 音频文件扩展名列表 */
const AUDIO_EXTENSIONS: string[] = ['mp3', 'wav', 'aac', 'flac', 'ogg', 'wma', 'm4a', 'amr', 'opus'];
/** 视频文件扩展名列表 */
const VIDEO_EXTENSIONS: string[] = ['mp4', 'avi', 'mkv', 'mov', 'wmv', 'flv', 'webm', '3gp', 'm4v', 'ts'];

// ========================================
// MIME 类型映射表
// ========================================

/** MIME 类型映射 */
const MIME_TYPE_MAP: Map<string, string> = new Map<string, string>([
  ['jpg', 'image/jpeg'], ['jpeg', 'image/jpeg'], ['png', 'image/png'],
  ['gif', 'image/gif'], ['bmp', 'image/bmp'], ['webp', 'image/webp'],
  ['svg', 'image/svg+xml'], ['pdf', 'application/pdf'],
  ['doc', 'application/msword'],
  ['docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'],
  ['xls', 'application/vnd.ms-excel'],
  ['xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'],
  ['ppt', 'application/vnd.ms-powerpoint'],
  ['pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation'],
  ['txt', 'text/plain'], ['csv', 'text/csv'],
  ['mp3', 'audio/mpeg'], ['wav', 'audio/wav'], ['aac', 'audio/aac'],
  ['flac', 'audio/flac'], ['ogg', 'audio/ogg'],
  ['mp4', 'video/mp4'], ['avi', 'video/x-msvideo'],
  ['mkv', 'video/x-matroska'], ['mov', 'video/quicktime'], ['webm', 'video/webm'],
  ['json', 'application/json'], ['xml', 'application/xml'],
  ['html', 'text/html'], ['zip', 'application/zip'],
]);

/** 默认 MIME 类型 */
const DEFAULT_MIME_TYPE: string = 'application/octet-stream';

// ========================================
// 文件操作工具类
// ========================================

/**
 * 文件操作工具类。
 * 提供静态方法处理文件扩展名解析、类型判断、
 * MIME 类型获取、文件名清理等常见文件操作。
 */
export class FileUtils {
  /** 自增临时文件计数器 */
  private static tempFileCounter: number = 0;

  /**
   * 获取文件扩展名。
   * 从文件名或路径中提取扩展名（不含点号），转为小写。
   * @param {string} filename - 文件名或完整路径
   * @returns {string} 文件扩展名（小写，不含点号），无扩展名时返回空字符串
   */
  static getFileExtension(filename: string): string {
    hilog.debug(DOMAIN, TAG, 'FileUtils getFileExtension: input=%{public}s', filename);
    if (filename.length === 0) {
      hilog.warn(DOMAIN, TAG, 'FileUtils getFileExtension: empty filename');
      return '';
    }
    const lastDotIndex: number = filename.lastIndexOf('.');
    if (lastDotIndex < 0 || lastDotIndex === filename.length - 1) {
      hilog.debug(DOMAIN, TAG, 'FileUtils getFileExtension: no extension found');
      return '';
    }
    const ext: string = filename.substring(lastDotIndex + 1).toLowerCase();
    hilog.debug(DOMAIN, TAG, 'FileUtils getFileExtension: ext=%{public}s', ext);
    return ext;
  }

  /**
   * 获取文件名（不含路径）。
   * 从完整路径中提取最后的文件名部分。
   * @param {string} path - 文件完整路径
   * @returns {string} 文件名
   */
  static getFileName(path: string): string {
    hilog.debug(DOMAIN, TAG, 'FileUtils getFileName: input=%{public}s', path);
    if (path.length === 0) {
      hilog.warn(DOMAIN, TAG, 'FileUtils getFileName: empty path');
      return '';
    }
    const separatorIndex: number = path.lastIndexOf('/');
    const backslashIndex: number = path.lastIndexOf('\\');
    const splitIndex: number = Math.max(separatorIndex, backslashIndex);
    if (splitIndex < 0) {
      hilog.debug(DOMAIN, TAG, 'FileUtils getFileName: no separator, returning full path as name');
      return path;
    }
    const name: string = path.substring(splitIndex + 1);
    hilog.debug(DOMAIN, TAG, 'FileUtils getFileName: name=%{public}s', name);
    return name;
  }

  // ========================================
  // 文件大小格式化方法
  // ========================================

  /**
   * 格式化文件大小为可读字符串。
   * 将字节数转换为 B/KB/MB/GB/TB 等人类可读格式。
   * @param {number} size - 文件大小（字节）
   * @returns {string} 格式化后的文件大小字符串
   */
  static getFileSize(size: number): string {
    hilog.debug(DOMAIN, TAG, 'FileUtils getFileSize: input bytes=%{public}s', size.toString());
    if (size < 0) {
      hilog.warn(DOMAIN, TAG, 'FileUtils getFileSize: negative size, returning 0 B');
      return '0 B';
    }
    if (size === 0) {
      return '0 B';
    }
    const units: string[] = ['B', 'KB', 'MB', 'GB', 'TB'];
    const base: number = 1024;
    let unitIndex: number = 0;
    let currentSize: number = size;
    while (currentSize >= base && unitIndex < units.length - 1) {
      currentSize = currentSize / base;
      unitIndex++;
    }
    const formatted: string = currentSize.toFixed(2) + ' ' + units[unitIndex];
    hilog.debug(DOMAIN, TAG, 'FileUtils getFileSize: formatted=%{public}s', formatted);
    return formatted;
  }

  // ========================================
  // 文件类型判断方法
  // ========================================

  /**
   * 判断是否为图片文件。
   * 根据扩展名判断文件是否属于图片类型。
   * @param {string} ext - 文件扩展名（不含点号）
   * @returns {boolean} 是否为图片文件
   */
  static isImageFile(ext: string): boolean {
    const lowerExt: string = ext.toLowerCase();
    const result: boolean = IMAGE_EXTENSIONS.indexOf(lowerExt) >= 0;
    hilog.debug(DOMAIN, TAG, 'FileUtils isImageFile: ext=%{public}s, result=%{public}s', lowerExt, result.toString());
    return result;
  }

  /**
   * 判断是否为文档文件。
   * 根据扩展名判断文件是否属于文档类型。
   * @param {string} ext - 文件扩展名（不含点号）
   * @returns {boolean} 是否为文档文件
   */
  static isDocumentFile(ext: string): boolean {
    const lowerExt: string = ext.toLowerCase();
    const result: boolean = DOCUMENT_EXTENSIONS.indexOf(lowerExt) >= 0;
    hilog.debug(DOMAIN, TAG, 'FileUtils isDocumentFile: ext=%{public}s, result=%{public}s', lowerExt, result.toString());
    return result;
  }

  /**
   * 判断是否为音频文件。
   * 根据扩展名判断文件是否属于音频类型。
   * @param {string} ext - 文件扩展名（不含点号）
   * @returns {boolean} 是否为音频文件
   */
  static isAudioFile(ext: string): boolean {
    const lowerExt: string = ext.toLowerCase();
    const result: boolean = AUDIO_EXTENSIONS.indexOf(lowerExt) >= 0;
    hilog.debug(DOMAIN, TAG, 'FileUtils isAudioFile: ext=%{public}s, result=%{public}s', lowerExt, result.toString());
    return result;
  }

  /**
   * 判断是否为视频文件。
   * 根据扩展名判断文件是否属于视频类型。
   * @param {string} ext - 文件扩展名（不含点号）
   * @returns {boolean} 是否为视频文件
   */
  static isVideoFile(ext: string): boolean {
    const lowerExt: string = ext.toLowerCase();
    const result: boolean = VIDEO_EXTENSIONS.indexOf(lowerExt) >= 0;
    hilog.debug(DOMAIN, TAG, 'FileUtils isVideoFile: ext=%{public}s, result=%{public}s', lowerExt, result.toString());
    return result;
  }

  // ========================================
  // MIME 类型与文件名处理方法
  // ========================================

  /**
   * 获取文件的 MIME 类型。
   * 根据扩展名查找对应的 MIME 类型字符串。
   * @param {string} ext - 文件扩展名（不含点号）
   * @returns {string} MIME 类型字符串
   */
  static getMimeType(ext: string): string {
    const lowerExt: string = ext.toLowerCase();
    const mimeType: string | undefined = MIME_TYPE_MAP.get(lowerExt);
    const result: string = mimeType !== undefined ? mimeType : DEFAULT_MIME_TYPE;
    hilog.debug(DOMAIN, TAG, 'FileUtils getMimeType: ext=%{public}s, mime=%{public}s', lowerExt, result);
    return result;
  }

  /**
   * 清理文件名。
   * 移除文件名中的非法字符，保留安全字符集合。
   * @param {string} name - 原始文件名
   * @returns {string} 清理后的安全文件名
   */
  static sanitizeFileName(name: string): string {
    hilog.debug(DOMAIN, TAG, 'FileUtils sanitizeFileName: input=%{public}s', name);
    if (name.length === 0) {
      hilog.warn(DOMAIN, TAG, 'FileUtils sanitizeFileName: empty name, returning default');
      return 'unnamed_file';
    }
    const illegalChars: RegExp = /[<>:"/\\|?*\x00-\x1F]/g;
    let sanitized: string = name.replace(illegalChars, '_').trim();
    if (sanitized.length === 0) {
      sanitized = 'unnamed_file';
    }
    if (sanitized.length > 200) {
      sanitized = FileUtils.truncateFileName(sanitized);
    }
    hilog.debug(DOMAIN, TAG, 'FileUtils sanitizeFileName: sanitized=%{public}s', sanitized);
    return sanitized;
  }

  /**
   * 将超长文件名截断到 200 字符以内，同时保留扩展名。
   * @param {string} sanitized - 已清理的超长文件名
   * @returns {string} 截断后的文件名
   */
  private static truncateFileName(sanitized: string): string {
    const ext: string = FileUtils.getFileExtension(sanitized);
    const baseName: string = sanitized.substring(0, sanitized.lastIndexOf('.'));
    return baseName.substring(0, 200 - ext.length - 1) + '.' + ext;
  }

  /**
   * 生成临时文件名。
   * 基于前缀、时间戳和自增计数器生成唯一的临时文件名。
   * @param {string} prefix - 文件名前缀
   * @returns {string} 临时文件名
   */
  static generateTempFileName(prefix: string): string {
    FileUtils.tempFileCounter++;
    const timestamp: number = Date.now();
    const random: number = Math.floor(Math.random() * 10000);
    const safePrefix: string = prefix.length > 0 ? FileUtils.sanitizeFileName(prefix) : 'tmp';
    const tempName: string = safePrefix + '_' + timestamp.toString() + '_' +
      FileUtils.tempFileCounter.toString() + '_' + random.toString() + '.tmp';
    hilog.info(DOMAIN, TAG, 'FileUtils generateTempFileName: name=%{public}s', tempName);
    return tempName;
  }

  /**
   * 获取文件类型分类描述。
   * 根据扩展名返回文件类型的中文描述。
   * @param {string} ext - 文件扩展名（不含点号）
   * @returns {string} 文件类型中文描述
   */
  static getFileTypeDescription(ext: string): string {
    const lowerExt: string = ext.toLowerCase();
    if (FileUtils.isImageFile(lowerExt)) {
      return '图片文件';
    } else if (FileUtils.isDocumentFile(lowerExt)) {
      return '文档文件';
    } else if (FileUtils.isAudioFile(lowerExt)) {
      return '音频文件';
    } else if (FileUtils.isVideoFile(lowerExt)) {
      return '视频文件';
    } else {
      return '其他文件';
    }
  }
}
