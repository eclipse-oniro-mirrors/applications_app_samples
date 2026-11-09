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

import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { vcard } from '@kit.TelephonyKit';
import { PickedFile, VCardPreview, ImportResult } from '../model/VCardTypes';
import { VCardConstants } from '../common/VCardConstants';
import { FileService } from './FileService';
import { VCardParser } from './VCardParser';
import { Logger } from '../utils/Logger';

const CODE_PARAMETER_ERROR: number = 401;
const CODE_UNKNOWN: number = 8300999;
const ERROR_FILE_TOO_LARGE: string = 'FILE_TOO_LARGE';
const ERROR_READ_FAILED: string = 'READ_FAILED';

export class VCardImportService {
  static async pick(context: common.Context): Promise<PickedFile | null> {
    const picked: PickedFile | null = await FileService.pickDocument();
    if (picked === null) {
      return null;
    }
    try {
      const sandboxPath: string = await FileService.copyToImport(context, picked);
      const copied: PickedFile = new PickedFile();
      copied.uri = sandboxPath;
      copied.name = picked.name;
      copied.sizeBytes = await FileService.fileSize(sandboxPath);
      Logger.info('[VCardImportService] pick ready: ' + copied.name + ' size=' + copied.sizeBytes);
      return copied;
    } catch (error) {
      const err = error as BusinessError;
      Logger.error('[VCardImportService] pick failed code=' + err.code + ' message=' + err.message);
      return null;
    }
  }

  static async preview(context: common.Context, file: PickedFile): Promise<VCardPreview> {
    const empty: VCardPreview = new VCardPreview();
    empty.fileName = file.name;
    empty.filePath = file.uri;
    let size: number = file.sizeBytes;
    if (size <= 0) {
      size = await FileService.fileSize(file.uri);
    }
    empty.sizeBytes = size;
    if (size > VCardConstants.MAX_FILE_BYTES) {
      Logger.warn('[VCardImportService] preview rejected, size=' + size);
      empty.errorMessage = ERROR_FILE_TOO_LARGE;
      return empty;
    }
    try {
      const content: string = await FileService.readText(file.uri);
      const preview: VCardPreview = VCardParser.parse(content, file.name);
      preview.filePath = file.uri;
      preview.fileName = file.name;
      preview.sizeBytes = size;
      Logger.info('[VCardImportService] preview cards=' + preview.cardCount + ' error=' + preview.errorMessage);
      return preview;
    } catch (error) {
      const err = error as BusinessError;
      Logger.error('[VCardImportService] preview failed code=' + err.code + ' message=' + err.message);
      empty.errorMessage = ERROR_READ_FAILED;
      return empty;
    }
  }

  static async importFile(context: common.Context, file: PickedFile): Promise<ImportResult> {
    const result: ImportResult = new ImportResult();
    result.filePath = file.uri;
    result.fileName = file.name;
    if (file.sizeBytes > VCardConstants.MAX_FILE_BYTES) {
      result.code = CODE_PARAMETER_ERROR;
      result.message = ERROR_FILE_TOO_LARGE;
      Logger.error('[VCardImportService] import rejected, file too large');
      return result;
    }
    const preview: VCardPreview = await VCardImportService.preview(context, file);
    result.cardCount = preview.cardCount;
    if (preview.errorMessage.length > 0) {
      result.code = CODE_PARAMETER_ERROR;
      result.message = preview.errorMessage;
      Logger.error('[VCardImportService] import skipped: ' + preview.errorMessage);
      return result;
    }
    try {
      await vcard.importVCard(context, file.uri);
      result.success = true;
      result.code = 0;
      Logger.info('[VCardImportService] import ok cards=' + result.cardCount);
    } catch (error) {
      const err = error as BusinessError;
      result.success = false;
      result.code = typeof err.code === 'number' ? err.code : CODE_UNKNOWN;
      result.message = err.message;
      Logger.error('[VCardImportService] import failed code=' + result.code + ' message=' + err.message);
    }
    return result;
  }

  static async importContent(context: common.Context, content: string, fileName: string): Promise<ImportResult> {
    const result: ImportResult = new ImportResult();
    result.fileName = fileName;
    if (content.length > VCardConstants.MAX_FILE_BYTES) {
      result.code = CODE_PARAMETER_ERROR;
      result.message = ERROR_FILE_TOO_LARGE;
      Logger.error('[VCardImportService] importContent rejected, content too large');
      return result;
    }
    try {
      const path: string = await FileService.writeTempFile(context, content, fileName);
      const file: PickedFile = new PickedFile();
      file.uri = path;
      file.name = fileName;
      file.sizeBytes = content.length;
      return await VCardImportService.importFile(context, file);
    } catch (error) {
      const err = error as BusinessError;
      result.success = false;
      result.code = typeof err.code === 'number' ? err.code : CODE_UNKNOWN;
      result.message = err.message;
      Logger.error('[VCardImportService] importContent failed code=' + result.code + ' message=' + err.message);
      return result;
    }
  }
}
