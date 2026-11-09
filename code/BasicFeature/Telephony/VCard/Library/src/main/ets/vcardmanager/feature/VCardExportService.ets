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

import { dataSharePredicates } from '@kit.ArkData';
import { vcard } from '@kit.TelephonyKit';
import { fileIo } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { ExportResult } from '../model/VCardTypes';
import { Formatter } from '../common/Formatter';
import { FileService } from './FileService';
import { Logger } from '../utils/Logger';

const PREVIEW_CONTENT_LIMIT: number = 8 * 1024;
const CODE_UNKNOWN: number = 8300999;
const BEGIN_MARK: string = 'BEGIN:VCARD';
const DEFAULT_FILE_NAME: string = 'contacts.vcf';

export class VCardExportService {
  static async exportContacts(context: common.Context, ids: number[], version: number,
    charset: string): Promise<ExportResult> {
    const result: ExportResult = new ExportResult();
    result.requestedCount = ids.length;
    try {
      const predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      if (ids.length > 0) {
        predicates.in('id', ids);
      }
      const options: vcard.VCardBuilderOptions = {
        cardType: VCardExportService.toCardType(version),
        charset: charset
      };
      const sourcePath: string = await vcard.exportVCard(context, predicates, options);
      Logger.info('[VCardExportService] exportVCard returned path=' + sourcePath);
      result.filePath = sourcePath;
      result.bytes = await FileService.fileSize(sourcePath);
      let full: string = '';
      try {
        full = await FileService.readText(sourcePath);
      } catch (error) {
        const err = error as BusinessError;
        const code: number = typeof err.code === 'number' ? err.code : CODE_UNKNOWN;
        Logger.error('[VCardExportService] read exported file failed code=' + code + ' path=' + sourcePath);
        result.success = false;
        result.code = code;
        result.message = err.message;
        return result;
      }
      // ponytail: preview keeps only the first 8KB; the full text stays on disk and saveAs re-reads it.
      result.content = full.length > PREVIEW_CONTENT_LIMIT ? full.substring(0, PREVIEW_CONTENT_LIMIT) : full;
      result.cardCount = VCardExportService.countCards(full);
      result.success = sourcePath.length > 0;
      result.code = 0;
      const copyPath: string = await VCardExportService.copyToExport(context, sourcePath);
      if (copyPath.length > 0) {
        result.filePath = copyPath;
      }
      Logger.info('[VCardExportService] export ok cards=' + result.cardCount + ' bytes=' + result.bytes);
    } catch (error) {
      const err = error as BusinessError;
      result.success = false;
      result.code = typeof err.code === 'number' ? err.code : CODE_UNKNOWN;
      result.message = err.message;
      Logger.error('[VCardExportService] export failed code=' + result.code + ' message=' + err.message);
    }
    return result;
  }

  static async saveAs(context: common.Context, result: ExportResult, fileName: string): Promise<string> {
    let content: string = result.content;
    if (result.filePath.length > 0) {
      try {
        content = await FileService.readText(result.filePath);
      } catch (error) {
        const err = error as BusinessError;
        Logger.warn('[VCardExportService] saveAs fallback to preview content code=' + err.code);
      }
    }
    if (content.length === 0) {
      Logger.warn('[VCardExportService] saveAs skipped, empty content');
      return '';
    }
    return await FileService.saveAs(context, content, fileName);
  }

  private static toCardType(version: number): vcard.VCardType {
    if (version === 1) {
      return vcard.VCardType.VERSION_30;
    }
    if (version === 2) {
      return vcard.VCardType.VERSION_40;
    }
    return vcard.VCardType.VERSION_21;
  }

  private static countCards(content: string): number {
    const upper: string = content.toUpperCase();
    let count: number = 0;
    let index: number = upper.indexOf(BEGIN_MARK);
    while (index >= 0) {
      count += 1;
      index = upper.indexOf(BEGIN_MARK, index + BEGIN_MARK.length);
    }
    return count;
  }

  private static async copyToExport(context: common.Context, sourcePath: string): Promise<string> {
    const dir: string = FileService.exportDir(context);
    FileService.ensureDir(dir);
    const slash: number = sourcePath.lastIndexOf('/');
    const name: string = slash >= 0 ? sourcePath.substring(slash + 1) : DEFAULT_FILE_NAME;
    const target: string = dir + '/' + Formatter.fileStamp(Date.now()) + '_' + name;
    let sourceFd: number = -1;
    try {
      sourceFd = fileIo.openSync(sourcePath, fileIo.OpenMode.READ_ONLY).fd;
      fileIo.copyFileSync(sourceFd, target);
      return target;
    } catch (error) {
      const err = error as BusinessError;
      Logger.warn('[VCardExportService] copyToExport failed code=' + err.code);
      return '';
    } finally {
      if (sourceFd >= 0) {
        fileIo.closeSync(sourceFd);
      }
    }
  }
}
