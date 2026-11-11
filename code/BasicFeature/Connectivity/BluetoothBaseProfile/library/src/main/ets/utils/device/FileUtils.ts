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
 * 文件信息接口
 */
export interface FileInfo {
  /** 文件名 */
  name: string;
  /** 文件路径 */
  path: string;
  /** 文件大小（字节） */
  size: number;
  /** 文件类型 */
  type: string;
  /** 最后修改时间 */
  lastModified: number;
  /** 是否为目录 */
  isDirectory: boolean;
}

/**
 * 文件工具类
 * 提供文件操作相关的实用方法
 */
export class FileUtils {
  /**
   * 获取文件扩展名
   * @param filename - 文件名
   * @returns 扩展名（不含点号）
   */
  static getExtension(filename: string): string {
    if (!filename || filename.indexOf('.') === -1) return '';
    const parts: string[] = filename.split('.');
    return parts[parts.length - 1].toLowerCase();
  }

  /**
   * 获取文件名（不含路径）
   * @param filePath - 文件路径
   * @returns 文件名
   */
  static getFileName(filePath: string): string {
    if (!filePath) return '';
    const parts: string[] = filePath.split('/');
    return parts[parts.length - 1];
  }

  /**
   * 获取文件名（不含扩展名）
   * @param filename - 文件名
   * @returns 不含扩展名的文件名
   */
  static getFileNameWithoutExtension(filename: string): string {
    if (!filename) return '';
    const lastDot: number = filename.lastIndexOf('.');
    if (lastDot === -1) return filename;
    return filename.substring(0, lastDot);
  }

  /**
   * 格式化文件大小为可读字符串
   * @param bytes - 文件大小（字节）
   * @returns 格式化后的大小字符串
   */
  static formatFileSize(bytes: number): string {
    if (bytes === 0) return '0 B';
    const units: string[] = ['B', 'KB', 'MB', 'GB', 'TB'];
    const k: number = 1024;
    const i: number = Math.floor(Math.log(bytes) / Math.log(k));
    const value: number = bytes / Math.pow(k, i);
    return value.toFixed(2) + ' ' + units[i];
  }

  /**
   * 检查文件类型是否为图片
   * @param extension - 文件扩展名
   * @returns 是否为图片文件
   */
  static isImageFile(extension: string): boolean {
    const imageExts: string[] = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'svg', 'ico'];
    return imageExts.indexOf(extension.toLowerCase()) !== -1;
  }

  /**
   * 检查文件类型是否为音频
   * @param extension - 文件扩展名
   * @returns 是否为音频文件
   */
  static isAudioFile(extension: string): boolean {
    const audioExts: string[] = ['mp3', 'wav', 'aac', 'flac', 'ogg', 'wma', 'm4a'];
    return audioExts.indexOf(extension.toLowerCase()) !== -1;
  }

  /**
   * 检查文件类型是否为视频
   * @param extension - 文件扩展名
   * @returns 是否为视频文件
   */
  static isVideoFile(extension: string): boolean {
    const videoExts: string[] = ['mp4', 'avi', 'mkv', 'mov', 'wmv', 'flv', 'webm', '3gp'];
    return videoExts.indexOf(extension.toLowerCase()) !== -1;
  }

  /**
   * 检查文件类型是否为文档
   * @param extension - 文件扩展名
   * @returns 是否为文档文件
   */
  static isDocumentFile(extension: string): boolean {
    const docExts: string[] = ['doc', 'docx', 'pdf', 'txt', 'xls', 'xlsx', 'ppt', 'pptx'];
    return docExts.indexOf(extension.toLowerCase()) !== -1;
  }

  /**
   * 获取文件MIME类型
   * @param extension - 文件扩展名
   * @returns MIME类型
   */
  static getMimeType(extension: string): string {
    const mimeTypes: Record<string, string> = {
      'jpg': 'image/jpeg', 'jpeg': 'image/jpeg', 'png': 'image/png',
      'gif': 'image/gif', 'bmp': 'image/bmp', 'webp': 'image/webp',
      'mp3': 'audio/mpeg', 'wav': 'audio/wav', 'aac': 'audio/aac',
      'mp4': 'video/mp4', 'avi': 'video/x-msvideo', 'mkv': 'video/x-matroska',
      'pdf': 'application/pdf', 'txt': 'text/plain', 'json': 'application/json',
      'xml': 'application/xml', 'html': 'text/html', 'css': 'text/css',
      'js': 'application/javascript', 'ts': 'application/typescript'
    };
    return mimeTypes[extension.toLowerCase()] || 'application/octet-stream';
  }

  /**
   * 获取文件图标名称
   * @param extension - 文件扩展名
   * @returns 图标名称
   */
  static getFileIconName(extension: string): string {
    if (FileUtils.isImageFile(extension)) return 'image';
    if (FileUtils.isAudioFile(extension)) return 'audio';
    if (FileUtils.isVideoFile(extension)) return 'video';
    if (FileUtils.isDocumentFile(extension)) return 'document';
    return 'file';
  }

  /**
   * 规范化文件路径
   * @param path - 原始路径
   * @returns 规范化后的路径
   */
  static normalizePath(path: string): string {
    if (!path) return '';
    return path.replace(/\\+/g, '/').replace(/\/+/g, '/');
  }

  /**
   * 获取父目录路径
   * @param filePath - 文件路径
   * @returns 父目录路径
   */
  static getParentPath(filePath: string): string {
    if (!filePath) return '';
    const normalized: string = FileUtils.normalizePath(filePath);
    const lastSlash: number = normalized.lastIndexOf('/');
    if (lastSlash === -1) return '';
    return normalized.substring(0, lastSlash);
  }

  /**
   * 检查路径是否有效
   * @param path - 文件路径
   * @returns 路径是否有效
   */
  static isValidPath(path: string): boolean {
    if (!path || path.length === 0) return false;
    if (path.indexOf('\\') !== -1) return false;
    const invalidChars: string[] = ['<', '>', '|', '*', '?'];
    for (const char of invalidChars) {
      if (path.indexOf(char) !== -1) return false;
    }
    return true;
  }
}
