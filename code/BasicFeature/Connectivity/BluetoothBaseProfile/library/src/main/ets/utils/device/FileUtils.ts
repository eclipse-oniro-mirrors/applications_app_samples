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
 * file info interface
 */
export interface FileInfo {
  /** text item name */
  name: string;
  /** text item path */
  path: string;
  /** text item large small (character section) */
  size: number;
  /** text item class type */
  type: string;
  /** last modified time */
  lastModified: number;
  /** whether for item record */
  isDirectory: boolean;
}

/**
 * file utility class
 * provides file operation relative relate actual use method method
 */
export class FileUtils {
  /**
   * get text item expand extend name
   * @param filename - text item name
   * @returns expand extend name (not contain point number)
   */
  static getExtension(filename: string): string {
    if (!filename || filename.indexOf('.') === -1) {
      return '';
    }
    const parts: string[] = filename.split('.');
    return parts[parts.length - 1].toLowerCase();
  }

  /**
   * get text item name (not contain path)
   * @param filePath - text item path
   * @returns text item name
   */
  static getFileName(filePath: string): string {
    if (!filePath) {
      return '';
    }
    const parts: string[] = filePath.split('/');
    return parts[parts.length - 1];
  }

  /**
   * get text item name (not contain expand extend name)
   * @param filename - text item name
   * @returns not contain expand extend name text item name
   */
  static getFileNameWithoutExtension(filename: string): string {
    if (!filename) {
      return '';
    }
    const lastDot: number = filename.lastIndexOf('.');
    if (lastDot === -1) {
      return filename;
    }
    return filename.substring(0, lastDot);
  }

  /**
   * format file size to readable string
   * @param bytes - text item large small (character section)
   * @returns formatted size string
   */
  static formatFileSize(bytes: number): string {
    if (bytes === 0) {
      return '0 B';
    }
    const units: string[] = ['B', 'KB', 'MB', 'GB', 'TB'];
    const k: number = 1024;
    const i: number = Math.floor(Math.log(bytes) / Math.log(k));
    const value: number = bytes / Math.pow(k, i);
    return value.toFixed(2) + ' ' + units[i];
  }

  /**
   * check text item class type whether for image piece
   * @param extension - text item expand extend name
   * @returns whether for image piece text item
   */
  static isImageFile(extension: string): boolean {
    const imageExts: string[] = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'svg', 'ico'];
    return imageExts.indexOf(extension.toLowerCase()) !== -1;
  }

  /**
   * check text item class type whether for audio
   * @param extension - text item expand extend name
   * @returns whether for audio text item
   */
  static isAudioFile(extension: string): boolean {
    const audioExts: string[] = ['mp3', 'wav', 'aac', 'flac', 'ogg', 'wma', 'm4a'];
    return audioExts.indexOf(extension.toLowerCase()) !== -1;
  }

  /**
   * check text item class type whether for view frequency
   * @param extension - text item expand extend name
   * @returns whether for view frequency text item
   */
  static isVideoFile(extension: string): boolean {
    const videoExts: string[] = ['mp4', 'avi', 'mkv', 'mov', 'wmv', 'flv', 'webm', '3gp'];
    return videoExts.indexOf(extension.toLowerCase()) !== -1;
  }

  /**
   * check text item class type whether for text file
   * @param extension - text item expand extend name
   * @returns whether for text file text item
   */
  static isDocumentFile(extension: string): boolean {
    const docExts: string[] = ['doc', 'docx', 'pdf', 'txt', 'xls', 'xlsx', 'ppt', 'pptx'];
    return docExts.indexOf(extension.toLowerCase()) !== -1;
  }

  /**
   * get text item MIME class type
   * @param extension - text item expand extend name
   * @returns MIME class type
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
   * get text item icon name name
   * @param extension - text item expand extend name
   * @returns icon name name
   */
  static getFileIconName(extension: string): string {
    if (FileUtils.isImageFile(extension)) {
      return 'image';
    }
    if (FileUtils.isAudioFile(extension)) {
      return 'audio';
    }
    if (FileUtils.isVideoFile(extension)) {
      return 'video';
    }
    if (FileUtils.isDocumentFile(extension)) {
      return 'document';
    }
    return 'file';
  }

  /**
   * rule range ize text item path
   * @param path - original path
   * @returns rule range ize after path
   */
  static normalizePath(path: string): string {
    if (!path) {
      return '';
    }
    return path.replace(/\\+/g, '/').replace(/\/+/g, '/');
  }

  /**
   * get parent item record path
   * @param filePath - text item path
   * @returns parent item record path
   */
  static getParentPath(filePath: string): string {
    if (!filePath) {
      return '';
    }
    const normalized: string = FileUtils.normalizePath(filePath);
    const lastSlash: number = normalized.lastIndexOf('/');
    if (lastSlash === -1) {
      return '';
    }
    return normalized.substring(0, lastSlash);
  }

  /**
   * check path whether valid
   * @param path - text item path
   * @returns path whether valid
   */
  static isValidPath(path: string): boolean {
    if (!path || path.length === 0) {
      return false;
    }
    if (path.indexOf('\\') !== -1) {
      return false;
    }
    const invalidChars: string[] = ['<', '>', '|', '*', '?'];
    for (const char of invalidChars) {
      if (path.indexOf(char) !== -1) {
        return false;
      }
    }
    return true;
  }
}
