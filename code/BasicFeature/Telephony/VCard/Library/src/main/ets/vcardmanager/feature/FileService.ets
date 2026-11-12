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

import { picker, fileIo } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { PickedFile } from '../model/VCardTypes';
import { VCardConstants } from '../common/VCardConstants';
import { Formatter } from '../common/Formatter';
import { VCardError } from '../common/VCardError';
import { Logger } from '../utils/Logger';

const CANCEL_CODE: number = 13900042;
const DEFAULT_FILE_NAME: string = 'contacts.vcf';
const VCF_FILTERS: string[] = ['.vcf', '.txt'];
const WRITE_MODE: number = fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.CREATE | fileIo.OpenMode.TRUNC;

export class FileService {
  static importDir(context: common.Context): string {
    return context.filesDir + '/' + VCardConstants.VCARD_DIR + '/' + VCardConstants.IMPORT_DIR;
  }

  static exportDir(context: common.Context): string {
    return context.filesDir + '/' + VCardConstants.VCARD_DIR + '/' + VCardConstants.EXPORT_DIR;
  }

  static ensureDir(dirPath: string): void {
    try {
      if (!fileIo.accessSync(dirPath)) {
        fileIo.mkdirSync(dirPath, true);
      }
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.warn('[FileService] ensureDir failed: ' + dirPath + ' code=' + err.code);
    }
  }

  static async pickDocument(): Promise<PickedFile | null> {
    try {
      const options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
      options.fileSuffixFilters = VCF_FILTERS;
      options.maxSelectNumber = 1;
      const documentPicker: picker.DocumentViewPicker = new picker.DocumentViewPicker();
      const uris: string[] = await documentPicker.select(options);
      if (uris === undefined || uris.length === 0) {
        Logger.info('[FileService] pickDocument canceled');
        return null;
      }
      const picked: PickedFile = new PickedFile();
      picked.uri = uris[0];
      picked.name = FileService.baseName(uris[0]);
      picked.sizeBytes = 0;
      Logger.info('[FileService] pickDocument ok: ' + picked.name);
      return picked;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      if (err.code === CANCEL_CODE) {
        Logger.info('[FileService] pickDocument canceled by user');
        return null;
      }
      Logger.error('[FileService] pickDocument failed code=' + err.code + ' message=' + err.message);
      return null;
    }
  }

  static async copyToImport(context: common.Context, picked: PickedFile): Promise<string> {
    const dir: string = FileService.importDir(context);
    FileService.ensureDir(dir);
    const target: string = dir + '/' + Formatter.fileStamp(Date.now()) + '_' + FileService.safeName(picked.name);
    let sourceFd: number = -1;
    try {
      sourceFd = fileIo.openSync(picked.uri, fileIo.OpenMode.READ_ONLY).fd;
      fileIo.copyFileSync(sourceFd, target);
      Logger.info('[FileService] copyToImport ok: ' + target);
      return target;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[FileService] copyToImport failed code=' + err.code + ' message=' + err.message);
      throw new VCardError(err.code, err.message);
    } finally {
      if (sourceFd >= 0) {
        fileIo.closeSync(sourceFd);
      }
    }
  }

  static async readText(filePath: string): Promise<string> {
    try {
      return await fileIo.readText(filePath);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[FileService] readText failed: ' + filePath + ' code=' + err.code);
      throw new VCardError(err.code, err.message);
    }
  }

  static async fileSize(filePath: string): Promise<number> {
    try {
      return fileIo.statSync(filePath).size;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.warn('[FileService] fileSize failed: ' + filePath + ' code=' + err.code);
      return 0;
    }
  }

  static async readSample(context: common.Context): Promise<string> {
    try {
      const bytes: Uint8Array = await context.resourceManager.getRawFileContent(VCardConstants.SAMPLE_FILE_NAME);
      return new util.TextDecoder('utf-8').decodeToString(bytes);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[FileService] readSample failed code=' + err.code + ' message=' + err.message);
      return '';
    }
  }

  static async writeTempFile(context: common.Context, content: string, fileName: string): Promise<string> {
    const dir: string = FileService.importDir(context);
    FileService.ensureDir(dir);
    const target: string = dir + '/' + Formatter.fileStamp(Date.now()) + '_' + FileService.safeName(fileName);
    let fd: number = -1;
    try {
      fd = fileIo.openSync(target, WRITE_MODE).fd;
      fileIo.writeSync(fd, content);
      Logger.info('[FileService] writeTempFile ok: ' + target);
      return target;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[FileService] writeTempFile failed code=' + err.code + ' message=' + err.message);
      throw new VCardError(err.code, err.message);
    } finally {
      if (fd >= 0) {
        fileIo.closeSync(fd);
      }
    }
  }

  static async saveAs(context: common.Context, content: string, fileName: string): Promise<string> {
    try {
      const options: picker.DocumentSaveOptions = new picker.DocumentSaveOptions();
      options.newFileNames = [FileService.safeName(fileName)];
      const documentPicker: picker.DocumentViewPicker = new picker.DocumentViewPicker();
      const uris: string[] = await documentPicker.save(options);
      if (uris === undefined || uris.length === 0) {
        Logger.info('[FileService] saveAs canceled');
        return '';
      }
      let fd: number = -1;
      try {
        fd = fileIo.openSync(uris[0], WRITE_MODE).fd;
        fileIo.writeSync(fd, content);
      } finally {
        if (fd >= 0) {
          fileIo.closeSync(fd);
        }
      }
      Logger.info('[FileService] saveAs ok: ' + uris[0]);
      return uris[0];
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      if (err.code === CANCEL_CODE) {
        Logger.info('[FileService] saveAs canceled by user');
        return '';
      }
      Logger.error('[FileService] saveAs failed code=' + err.code + ' message=' + err.message);
      return '';
    }
  }

  static async clean(context: common.Context): Promise<number> {
    let removed: number = 0;
    const dirs: string[] = [FileService.importDir(context), FileService.exportDir(context)];
    for (let i = 0; i < dirs.length; i++) {
      removed += FileService.cleanDir(dirs[i]);
    }
    Logger.info('[FileService] clean removed=' + removed);
    return removed;
  }

  private static cleanDir(dirPath: string): number {
    let removed: number = 0;
    try {
      if (!fileIo.accessSync(dirPath)) {
        return 0;
      }
      const names: string[] = fileIo.listFileSync(dirPath);
      for (let i = 0; i < names.length; i++) {
        const target: string = dirPath + '/' + names[i];
        try {
          if (fileIo.statSync(target).isDirectory()) {
            fileIo.rmdirSync(target);
          } else {
            fileIo.unlinkSync(target);
            removed += 1;
          }
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          Logger.warn('[FileService] clean skip ' + target + ' code=' + err.code);
        }
      }
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.warn('[FileService] clean dir failed: ' + dirPath + ' code=' + err.code);
    }
    return removed;
  }

  private static baseName(uri: string): string {
    const slash: number = uri.lastIndexOf('/');
    const name: string = slash >= 0 ? uri.substring(slash + 1) : uri;
    return name.length > 0 ? name : DEFAULT_FILE_NAME;
  }

  private static safeName(name: string): string {
    const trimmed: string = name.trim().split('/').join('_').split('\\').join('_');
    return trimmed.length > 0 ? trimmed : DEFAULT_FILE_NAME;
  }
}
