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

import { fileIo } from '@kit.CoreFileKit';
import { AppLogger } from 'common';
import { IrCode, IrProtocol } from 'ircore';
import { ConfigImportReport } from '../model/RoomTypes';
import { IrCodeDao } from '../data/IrCodeDao';

/** Standard Pronto HEX clock period, converted to microseconds per tick. */
const PRONTO_CLOCK_US: number = 0.241246;
/** Repeat count used for imported codes when the library omits one. */
const DEFAULT_REPEAT: number = 1;
const SCOPE: string = 'IrLibraryImporter';
/** Prefix for ids of codes parsed from a raw Pronto HEX payload. */
const PRONTO_ID_PREFIX: string = 'pronto-';
/** Prefix for ids of codes taken from an IR library JSON entry. */
const LIB_ID_PREFIX: string = 'lib-';

/**
 * Imports third-party IR code libraries (Pronto HEX arrays or generic code
 * entries) into the ir_code table, item by item with per-item error reports.
 */
export class IrLibraryImporter {
  // Monotonic sequence backing generated ids.
  private static seq: number = 0;

  /** Parses Pronto HEX from a JSON string array or space-separated 4-digit hex words. */
  static parseProntoHex(hex: string): IrCode {
    const text: string = hex.trim();
    if (text.length === 0) {
      throw new Error('Pronto HEX is empty');
    }
    const words: string[] = IrLibraryImporter.splitWords(text);
    if (words.length < 4) {
      throw new Error('Pronto HEX requires at least 4 words');
    }
    const values: number[] = [];
    for (let i = 0; i < words.length; i++) {
      values.push(IrLibraryImporter.parseWord(words[i], i));
    }
    if (values[1] === 0) {
      throw new Error('Pronto HEX frequency field is 0');
    }
    const dataWordCount: number = values.length - 4;
    if (dataWordCount === 0) {
      throw new Error('Pronto HEX has no waveform data');
    }
    if (dataWordCount % 2 !== 0) {
      throw new Error('Pronto HEX waveform data must come in pairs');
    }

    const periodUs: number = values[1] * PRONTO_CLOCK_US;
    const frequencyHz: number = Math.round(1000000 / periodUs);
    if (!(frequencyHz > 0)) {
      throw new Error('Pronto HEX cannot derive a valid frequency');
    }

    const pattern: number[] = [];
    for (let i = 4; i < values.length; i++) {
      pattern.push(Math.round(values[i] * periodUs));
    }

    const code: IrCode = new IrCode();
    code.id = `${PRONTO_ID_PREFIX}${Date.now()}-${IrLibraryImporter.nextSeq()}`;
    code.protocol = IrProtocol.RAW;
    code.frequencyHz = frequencyHz;
    code.payload = pattern.join(',');
    code.repeatCount = DEFAULT_REPEAT;
    code.source = 'Pronto HEX';
    code.license = 'User import';
    return code;
  }

  /**
   * Imports open-source code libraries as Pronto HEX arrays or {"codes":[...]}
   * entries, one by one; single-item failures do not abort the whole import.
   */
  static async importFromFile(filePath: string): Promise<ConfigImportReport> {
    const report: ConfigImportReport = new ConfigImportReport();
    AppLogger.info(SCOPE, `importFromFile enter: file=${filePath}`);
    let text: string = '';
    try {
      text = fileIo.readTextSync(filePath).trim();
    } catch (error) {
      AppLogger.warn(SCOPE, `importFromFile aborted: unreadable file, file=${filePath}`);
      report.ok = false;
      report.failedItems.push('Unable to read the IR code file');
      report.message = 'Unable to read the IR code file';
      return report;
    }

    const codes: IrCode[] = [];
    if (text.startsWith('[')) {
      IrLibraryImporter.collectProntoCodes(text, codes, report.failedItems);
    } else {
      IrLibraryImporter.collectLibraryCodes(text, codes, report.failedItems);
    }

    let imported: number = 0;
    for (let i = 0; i < codes.length; i++) {
      try {
        await IrCodeDao.upsert(codes[i]);
        imported++;
      } catch (error) {
        const detail: string = error instanceof Error ? error.message : 'Write failed';
        AppLogger.warn(SCOPE, `importFromFile item failed: index=${i + 1}, reason=${detail}`);
        report.failedItems.push(`Item ${i + 1}: ${detail}`);
      }
    }

    report.ok = imported > 0;
    report.message = `Imported ${imported}, failed ${report.failedItems.length}`;
    if (imported === 0 && report.failedItems.length === 0) {
      report.message = 'The file contains no importable IR codes';
    }
    AppLogger.info(SCOPE,
      `importFromFile done: imported=${imported}, failed=${report.failedItems.length}, ok=${report.ok}`);
    return report;
  }

  /** Splits a flat Pronto array or nested arrays into codes. */
  private static collectProntoCodes(text: string, codes: IrCode[],
    failedItems: string[]): void {
    let items: Object[] = [];
    try {
      const parsed: Object = JSON.parse(text) as Object;
      if (!(parsed instanceof Array)) {
        failedItems.push('Pronto HEX file must be an array of strings');
        return;
      }
      items = parsed as Object[];
    } catch (error) {
      failedItems.push('Failed to parse Pronto HEX JSON');
      return;
    }
    if (items.length === 0) {
      failedItems.push('Item 1: Pronto HEX array is empty');
      return;
    }

    let nested: boolean = false;
    for (let i = 0; i < items.length; i++) {
      if (items[i] instanceof Array) {
        nested = true;
        break;
      }
    }
    // A flat string array is one Pronto HEX code; nested arrays are treated as multiple.
    if (!nested) {
      try {
        codes.push(IrLibraryImporter.parseProntoHex(text));
      } catch (error) {
        const detail: string = error instanceof Error ? error.message : 'Parse failed';
        failedItems.push(`Item 1: ${detail}`);
      }
      return;
    }

    for (let i = 0; i < items.length; i++) {
      try {
        if (!(items[i] instanceof Array)) {
          throw new Error('Item must be an array of HEX strings');
        }
        codes.push(IrLibraryImporter.parseProntoHex(JSON.stringify(items[i])));
      } catch (error) {
        const detail: string = error instanceof Error ? error.message : 'Parse failed';
        failedItems.push(`Item ${i + 1}: ${detail}`);
      }
    }
  }

  /** Splits a generic library JSON into codes, one failure entry per item. */
  private static collectLibraryCodes(text: string, codes: IrCode[],
    failedItems: string[]): void {
    let raw: Record<string, Object> | undefined = undefined;
    try {
      raw = JSON.parse(text) as Record<string, Object>;
    } catch (error) {
      failedItems.push('Failed to parse IR library JSON');
      return;
    }
    if (raw === undefined) {
      failedItems.push('Failed to parse IR library JSON');
      return;
    }
    const list: Object = raw['codes'];
    if (!(list instanceof Array)) {
      failedItems.push('IR library file is missing the codes array');
      return;
    }
    const items: Object[] = list as Object[];
    for (let i = 0; i < items.length; i++) {
      try {
        const item: Record<string, Object> = items[i] as Record<string, Object>;
        codes.push(IrLibraryImporter.buildCode(item));
      } catch (error) {
        const detail: string = error instanceof Error ? error.message : 'Invalid item';
        failedItems.push(`Item ${i + 1}: ${detail}`);
      }
    }
  }

  /** Validates one generic library entry and builds the IrCode for it. */
  private static buildCode(item: Record<string, Object>): IrCode {
    const payload: string =
      IrLibraryImporter.readString(item, 'payload', '').trim();
    if (payload.length === 0) {
      throw new Error('payload is empty');
    }
    const frequencyHz: number =
      IrLibraryImporter.readNumber(item, 'frequencyHz', 0);
    if (!(frequencyHz > 0)) {
      throw new Error('frequencyHz must be greater than 0');
    }
    const protocolText: string =
      IrLibraryImporter.readString(item, 'protocol', 'RAW');
    if (!IrLibraryImporter.isValidProtocol(protocolText)) {
      throw new Error(`Invalid protocol: ${protocolText}`);
    }
    const source: string = IrLibraryImporter.readString(item, 'source', '');
    if (source.length === 0) {
      throw new Error('source is empty');
    }
    const license: string = IrLibraryImporter.readString(item, 'license', '');
    if (license.length === 0) {
      throw new Error('license is empty');
    }

    const code: IrCode = new IrCode();
    const id: string = IrLibraryImporter.readString(item, 'id', '');
    code.id = id.length > 0 ? id : `${LIB_ID_PREFIX}${Date.now()}-${IrLibraryImporter.nextSeq()}`;
    code.protocol = protocolText as IrProtocol;
    code.frequencyHz = frequencyHz;
    code.payload = payload;
    const repeatCount: number =
      IrLibraryImporter.readNumber(item, 'repeatCount', DEFAULT_REPEAT);
    code.repeatCount = repeatCount > 0 ? repeatCount : DEFAULT_REPEAT;
    code.source = source;
    code.license = license;
    code.brand = IrLibraryImporter.readString(item, 'brand', '');
    code.model = IrLibraryImporter.readString(item, 'model', '');
    code.keySemantic = IrLibraryImporter.readString(item, 'keySemantic', '');
    code.checksum = IrLibraryImporter.readString(item, 'checksum', '');
    return code;
  }

  /** Splits Pronto text into 4-digit hex words; accepts JSON arrays or plain text. */
  private static splitWords(text: string): string[] {
    if (text.startsWith('[')) {
      let parsed: Object | undefined = undefined;
      try {
        parsed = JSON.parse(text) as Object;
      } catch (error) {
        throw new Error('Failed to parse Pronto HEX JSON');
      }
      if (parsed === undefined || !(parsed instanceof Array)) {
        throw new Error('Pronto HEX must be an array of strings');
      }
      const items: Object[] = parsed as Object[];
      const words: string[] = [];
      for (let i = 0; i < items.length; i++) {
        if (typeof items[i] !== 'string') {
          throw new Error(`Pronto HEX item ${i + 1} is not a string`);
        }
        words.push((items[i] as string).trim());
      }
      return words;
    }
    const parts: string[] = text.split(/[\s,]+/);
    const words: string[] = [];
    for (let i = 0; i < parts.length; i++) {
      const part: string = parts[i].trim();
      if (part.length > 0) {
        words.push(part);
      }
    }
    return words;
  }

  /** Parses one 4-digit hex word into its numeric value. */
  private static parseWord(word: string, index: number): number {
    if (!/^[0-9a-fA-F]{4}$/.test(word)) {
      throw new Error(`Pronto HEX word ${index + 1} is invalid: ${word}`);
    }
    return parseInt(word, 16);
  }

  /** Checks whether a protocol string is one of the supported protocols. */
  private static isValidProtocol(value: string): boolean {
    switch (value) {
      case IrProtocol.NEC:
      case IrProtocol.RC5:
      case IrProtocol.RC6:
      case IrProtocol.SONY:
      case IrProtocol.RAW:
        return true;
      default:
        return false;
    }
  }

  /** Returns a monotonically increasing sequence for generated ids. */
  private static nextSeq(): number {
    IrLibraryImporter.seq++;
    return IrLibraryImporter.seq;
  }

  /** Reads a string field from a record with a fallback value. */
  private static readString(record: Record<string, Object>, key: string,
    fallback: string): string {
    const value: Object = record[key];
    if (typeof value === 'string') {
      return value;
    }
    return fallback;
  }

  /** Reads a number field from a record with a fallback value. */
  private static readNumber(record: Record<string, Object>, key: string,
    fallback: number): number {
    const value: Object = record[key];
    if (typeof value === 'number' && Number.isFinite(value)) {
      return value;
    }
    return fallback;
  }
}
