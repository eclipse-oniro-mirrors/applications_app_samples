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
// File extension constants
// ========================================

/** Image file extension list */
const IMAGE_EXTENSIONS: string[] = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'svg', 'ico', 'tiff', 'tif'];
/** Document file extension list */
const DOCUMENT_EXTENSIONS: string[] = ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'csv', 'md', 'rtf'];
/** Audio file extension list */
const AUDIO_EXTENSIONS: string[] = ['mp3', 'wav', 'aac', 'flac', 'ogg', 'wma', 'm4a', 'amr', 'opus'];
/** Video file extension list */
const VIDEO_EXTENSIONS: string[] = ['mp4', 'avi', 'mkv', 'mov', 'wmv', 'flv', 'webm', '3gp', 'm4v', 'ts'];

// ========================================
// MIME type mapping table
// ========================================

/** MIME type mapping */
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

/** Default MIME type */
const DEFAULT_MIME_TYPE: string = 'application/octet-stream';

/** Illegal file name characters (control chars and <>:"/\|?*), used by sanitizeFileName */
const ILLEGAL_FILE_NAME_CHARS: RegExp = /[<>:"/\\|?*\x00-\x1F]/g;

/** Maximum file name length */
const MAX_FILE_NAME_LENGTH: number = 200;

/** Default name when sanitization results in an empty string */
const DEFAULT_FILE_NAME: string = 'unnamed_file';

// ========================================
// File operation utility class
// ========================================

/**
 * File operation utility class.
 * Provides static methods for common file operations such as extension parsing,
 * type detection, MIME type lookup and file name sanitization.
 */
export class FileUtils {
  /** Auto-incrementing temp file counter */
  private static tempFileCounter: number = 0;

  /**
   * Gets the file extension.
   * Extracts the extension from a file name or path (without the dot), lowercased.
   * @param {string} filename - File name or full path
   * @returns {string} Lowercase extension without the dot, or empty string if none
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
   * Gets the file name (without path).
   * Extracts the trailing file name part from a full path.
   * @param {string} path - Full file path
   * @returns {string} File name
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
  // File size formatting methods
  // ========================================

  /**
   * Formats a file size into a readable string.
   * Converts bytes into human-readable B/KB/MB/GB/TB formats.
   * @param {number} size - File size in bytes
   * @returns {string} Formatted file size string
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
  // File type detection methods
  // ========================================

  /**
   * Checks whether the file is an image.
   * Detects image types by extension.
   * @param {string} ext - File extension (without the dot)
   * @returns {boolean} Whether it is an image file
   */
  static isImageFile(ext: string): boolean {
    const lowerExt: string = ext.toLowerCase();
    const result: boolean = IMAGE_EXTENSIONS.indexOf(lowerExt) >= 0;
    hilog.debug(DOMAIN, TAG, 'FileUtils isImageFile: ext=%{public}s, result=%{public}s', lowerExt, result.toString());
    return result;
  }

  /**
   * Checks whether the file is a document.
   * Detects document types by extension.
   * @param {string} ext - File extension (without the dot)
   * @returns {boolean} Whether it is a document file
   */
  static isDocumentFile(ext: string): boolean {
    const lowerExt: string = ext.toLowerCase();
    const result: boolean = DOCUMENT_EXTENSIONS.indexOf(lowerExt) >= 0;
    hilog.debug(DOMAIN, TAG, 'FileUtils isDocumentFile: ext=%{public}s, result=%{public}s', lowerExt, result.toString());
    return result;
  }

  /**
   * Checks whether the file is audio.
   * Detects audio types by extension.
   * @param {string} ext - File extension (without the dot)
   * @returns {boolean} Whether it is an audio file
   */
  static isAudioFile(ext: string): boolean {
    const lowerExt: string = ext.toLowerCase();
    const result: boolean = AUDIO_EXTENSIONS.indexOf(lowerExt) >= 0;
    hilog.debug(DOMAIN, TAG, 'FileUtils isAudioFile: ext=%{public}s, result=%{public}s', lowerExt, result.toString());
    return result;
  }

  /**
   * Checks whether the file is video.
   * Detects video types by extension.
   * @param {string} ext - File extension (without the dot)
   * @returns {boolean} Whether it is a video file
   */
  static isVideoFile(ext: string): boolean {
    const lowerExt: string = ext.toLowerCase();
    const result: boolean = VIDEO_EXTENSIONS.indexOf(lowerExt) >= 0;
    hilog.debug(DOMAIN, TAG, 'FileUtils isVideoFile: ext=%{public}s, result=%{public}s', lowerExt, result.toString());
    return result;
  }

  // ========================================
  // MIME type and file name handling methods
  // ========================================

  /**
   * Gets the MIME type of a file.
   * Looks up the MIME type string by extension.
   * @param {string} ext - File extension (without the dot)
   * @returns {string} MIME type string
   */
  static getMimeType(ext: string): string {
    const lowerExt: string = ext.toLowerCase();
    const mimeType: string | undefined = MIME_TYPE_MAP.get(lowerExt);
    const result: string = mimeType !== undefined ? mimeType : DEFAULT_MIME_TYPE;
    hilog.debug(DOMAIN, TAG, 'FileUtils getMimeType: ext=%{public}s, mime=%{public}s', lowerExt, result);
    return result;
  }

  /**
   * Sanitizes a file name.
   * Removes illegal characters, keeping only the safe character set.
   * @param {string} name - Original file name
   * @returns {string} Sanitized safe file name
   */
  static sanitizeFileName(name: string): string {
    hilog.debug(DOMAIN, TAG, 'FileUtils sanitizeFileName: input=%{public}s', name);
    if (name.length === 0) {
      hilog.warn(DOMAIN, TAG, 'FileUtils sanitizeFileName: empty name, returning default');
      return DEFAULT_FILE_NAME;
    }
    let sanitized: string = name.replace(ILLEGAL_FILE_NAME_CHARS, '_').trim();
    if (sanitized.length === 0) {
      sanitized = DEFAULT_FILE_NAME;
    }
    if (sanitized.length > MAX_FILE_NAME_LENGTH) {
      sanitized = FileUtils.truncateFileName(sanitized);
    }
    hilog.debug(DOMAIN, TAG, 'FileUtils sanitizeFileName: sanitized=%{public}s', sanitized);
    return sanitized;
  }

  /**
   * Truncates an over-long file name to at most 200 characters while keeping the extension.
   * @param {string} sanitized - Sanitized over-long file name
   * @returns {string} Truncated file name
   */
  private static truncateFileName(sanitized: string): string {
    const ext: string = FileUtils.getFileExtension(sanitized);
    const baseName: string = sanitized.substring(0, sanitized.lastIndexOf('.'));
    return baseName.substring(0, MAX_FILE_NAME_LENGTH - ext.length - 1) + '.' + ext;
  }

  /**
   * Generates a temporary file name.
   * Builds a unique temp name from a prefix, timestamp and auto-increment counter.
   * @param {string} prefix - File name prefix
   * @returns {string} Temporary file name
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
   * Gets the localized file type category description.
   * Returns the type description by extension from string.json resources.
   * @param {string} ext - File extension (without the dot)
   * @returns {string} Localized file type description
   */
  static getFileTypeDescription(ext: string): string {
    const lowerExt: string = ext.toLowerCase();
    if (FileUtils.isImageFile(lowerExt)) {
      return ResourceHelper.getStringByName('file_type_image');
    } else if (FileUtils.isDocumentFile(lowerExt)) {
      return ResourceHelper.getStringByName('file_type_document');
    } else if (FileUtils.isAudioFile(lowerExt)) {
      return ResourceHelper.getStringByName('file_type_audio');
    } else if (FileUtils.isVideoFile(lowerExt)) {
      return ResourceHelper.getStringByName('file_type_video');
    } else {
      return ResourceHelper.getStringByName('file_type_other');
    }
  }
}
