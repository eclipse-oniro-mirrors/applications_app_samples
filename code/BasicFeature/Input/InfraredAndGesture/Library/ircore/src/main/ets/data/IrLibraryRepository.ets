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
import { util } from '@kit.ArkTS';
import { AppConstants, AppLogger } from 'common';
import {
  IrBrandEntry,
  IrCode,
  IrLibraryIndex,
  IrProtocol
} from '../model/IrTypes';

const SCOPE: string = 'IrLibraryRepository';
/** Raw file path of the bundled library index under resources/rawfile. */
const INDEX_PATH: string = 'ir-library/index.json';
/** Directory prefix of brand code files under resources/rawfile. */
const LIBRARY_DIR: string = 'ir-library/';
/** Fallback repeat count when a library entry omits it. */
const DEFAULT_REPEAT_COUNT: number = 1;

/**
 * Lazy loader and in-memory cache for the bundled IR code library. Reads raw
 * JSON files from resources/rawfile and parses them into IrTypes model objects.
 */
export class IrLibraryRepository {
  // Application context used to reach the resource manager, set once at startup.
  private static context: common.Context | undefined = undefined;
  // Parsed index cache, cleared by init().
  private static indexCache: IrLibraryIndex | undefined = undefined;
  // Per-brand code list cache keyed by brandId.
  private static brandCache: Map<string, IrCode[]> = new Map<string, IrCode[]>();

  /** Stores the context and clears all caches; must be called before any load. */
  static init(context: common.Context): void {
    IrLibraryRepository.context = context;
    IrLibraryRepository.indexCache = undefined;
    IrLibraryRepository.brandCache.clear();
    AppLogger.info(SCOPE, 'init: context stored and caches cleared');
  }

  /** Loads the library index once and caches it; missing files yield an empty index. */
  static async getIndex(): Promise<IrLibraryIndex> {
    AppLogger.info(SCOPE, 'getIndex enter');
    // Fast path: return the parsed index from memory.
    const cached: IrLibraryIndex | undefined = IrLibraryRepository.indexCache;
    if (cached !== undefined) {
      return cached;
    }

    const raw: Record<string, Object> | undefined =
      await IrLibraryRepository.readJson(INDEX_PATH);
    if (raw === undefined) {
      // Cache the empty result so a broken index is not re-read on every call.
      const empty: IrLibraryIndex = new IrLibraryIndex();
      IrLibraryRepository.indexCache = empty;
      AppLogger.warn(SCOPE, `getIndex: index file missing or unreadable at ${INDEX_PATH}`);
      return empty;
    }

    const index: IrLibraryIndex = new IrLibraryIndex();
    index.version = IrLibraryRepository.readString(raw, 'version', '');
    const brands: Object[] = IrLibraryRepository.toObjectList(raw['brands']);
    for (let i: number = 0; i < brands.length; i++) {
      const item: Record<string, Object> = brands[i] as Record<string, Object>;
      const entry: IrBrandEntry = new IrBrandEntry();
      entry.brandId = IrLibraryRepository.readString(item, 'brandId', '');
      entry.brandName = IrLibraryRepository.readString(item, 'brandName', '');
      entry.deviceTypes = IrLibraryRepository.readStringArray(item, 'deviceTypes');
      entry.models = IrLibraryRepository.readStringArray(item, 'models');
      entry.source = IrLibraryRepository.readString(item, 'source', '');
      entry.license = IrLibraryRepository.readString(item, 'license', '');
      entry.file = IrLibraryRepository.readString(item, 'file', '');
      // Entries without brandId or file can never be loaded, skip them early.
      if (entry.brandId.length === 0 || entry.file.length === 0) {
        AppLogger.warn(SCOPE, `Skipped brand entry without brandId/file at index ${i}`);
        continue;
      }
      index.brands.push(entry);
    }

    IrLibraryRepository.indexCache = index;
    AppLogger.info(SCOPE, `getIndex success: version=${index.version}, brands=${index.brands.length}`);
    return index;
  }

  /** Loads one brand's code list lazily and caches it by brandId. */
  static async loadBrand(brandId: string): Promise<IrCode[]> {
    AppLogger.info(SCOPE, `loadBrand enter: brandId=${brandId}`);
    // Fast path: return the cached code list.
    const cached: IrCode[] | undefined = IrLibraryRepository.brandCache.get(brandId);
    if (cached !== undefined) {
      return cached;
    }

    const index: IrLibraryIndex = await IrLibraryRepository.getIndex();
    let entry: IrBrandEntry | undefined = undefined;
    for (let i: number = 0; i < index.brands.length; i++) {
      if (index.brands[i].brandId === brandId) {
        entry = index.brands[i];
        break;
      }
    }
    if (entry === undefined) {
      AppLogger.error(SCOPE, `Brand not found in IR library: ${brandId}`);
      // Cache the empty result so unknown brands are not re-resolved repeatedly.
      const empty: IrCode[] = [];
      IrLibraryRepository.brandCache.set(brandId, empty);
      return empty;
    }

    const raw: Record<string, Object> | undefined =
      await IrLibraryRepository.readJson(`${LIBRARY_DIR}${entry.file}`);
    if (raw === undefined) {
      const empty: IrCode[] = [];
      IrLibraryRepository.brandCache.set(brandId, empty);
      return empty;
    }

    // Parse every code entry; incomplete entries are skipped with a warning.
    const codes: IrCode[] = [];
    const items: Object[] = IrLibraryRepository.toObjectList(raw['codes']);
    for (let i: number = 0; i < items.length; i++) {
      const item: Record<string, Object> = items[i] as Record<string, Object>;
      const code: IrCode | undefined =
        IrLibraryRepository.buildCode(brandId, entry, item);
      if (code !== undefined) {
        codes.push(code);
      }
    }

    IrLibraryRepository.brandCache.set(brandId, codes);
    AppLogger.info(SCOPE, `loadBrand success: brandId=${brandId}, file=${entry.file}, codes=${codes.length}`);
    return codes;
  }

  /** Parses one raw JSON entry into an IrCode; returns undefined for incomplete entries. */
  private static buildCode(brandId: string, entry: IrBrandEntry,
    raw: Record<string, Object>): IrCode | undefined {
    const deviceType: string = IrLibraryRepository.readString(raw, 'deviceType', '');
    const model: string = IrLibraryRepository.readString(raw, 'model', '');
    const keySemantic: string = IrLibraryRepository.readString(raw, 'keySemantic', '');
    const payload: string = IrLibraryRepository.readString(raw, 'payload', '');
    const protocol: IrProtocol | undefined =
      IrLibraryRepository.parseProtocol(IrLibraryRepository.readString(raw, 'protocol', ''));
    // A code needs a semantic key, a payload and a known protocol to be usable.
    if (keySemantic.length === 0 || payload.length === 0 || protocol === undefined) {
      AppLogger.warn(SCOPE, `Skipped incomplete code entry: ${deviceType}/${model}/${keySemantic}`);
      return undefined;
    }

    const code: IrCode = new IrCode();
    code.id = `${brandId}-${deviceType}-${model}-${keySemantic}`;
    code.protocol = protocol;
    code.frequencyHz =
      IrLibraryRepository.readNumber(raw, 'frequencyHz', AppConstants.DEFAULT_FREQUENCY_HZ);
    code.payload = payload;
    code.repeatCount = IrLibraryRepository.readNumber(raw, 'repeatCount', DEFAULT_REPEAT_COUNT);
    code.source = IrLibraryRepository.readString(raw, 'source', entry.source);
    code.license = IrLibraryRepository.readString(raw, 'license', entry.license);
    code.brand = entry.brandName;
    code.model = model;
    code.keySemantic = keySemantic;
    return code;
  }

  /** Maps a protocol text to the enum; unknown values return undefined. */
  private static parseProtocol(value: string): IrProtocol | undefined {
    switch (value.toUpperCase()) {
      case 'NEC':
        return IrProtocol.NEC;
      case 'SONY':
        return IrProtocol.SONY;
      case 'RC5':
        return IrProtocol.RC5;
      case 'RC6':
        return IrProtocol.RC6;
      case 'RAW':
        return IrProtocol.RAW;
      default:
        return undefined;
    }
  }

  /** Reads and parses one raw JSON file; any failure returns undefined. */
  private static async readJson(path: string): Promise<Record<string, Object> | undefined> {
    const context: common.Context | undefined = IrLibraryRepository.context;
    if (context === undefined) {
      AppLogger.error(SCOPE, `Context is not initialized, cannot read ${path}`);
      return undefined;
    }
    try {
      const bytes: Uint8Array = await context.resourceManager.getRawFileContent(path);
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
      const text: string = decoder.decodeToString(bytes);
      const parsed: Record<string, Object> = JSON.parse(text) as Record<string, Object>;
      return parsed;
    } catch (error) {
      const detail: string = error instanceof Error ? error.message : 'unknown error';
      AppLogger.error(SCOPE, `Failed to read ${path}: ${detail}`);
      return undefined;
    }
  }

  /** Returns the value as an Object array, or an empty array for any other type. */
  private static toObjectList(value: Object): Object[] {
    if (value instanceof Array) {
      return value as Object[];
    }
    return [];
  }

  /** Reads a string field with a fallback for missing or mistyped values. */
  private static readString(record: Record<string, Object>, key: string,
    fallback: string): string {
    const value: Object = record[key];
    if (typeof value === 'string') {
      return value;
    }
    return fallback;
  }

  /** Reads a finite number field with a fallback for missing or mistyped values. */
  private static readNumber(record: Record<string, Object>, key: string,
    fallback: number): number {
    const value: Object = record[key];
    if (typeof value === 'number' && Number.isFinite(value)) {
      return value;
    }
    return fallback;
  }

  /** Reads a string array field, silently dropping non-string items. */
  private static readStringArray(record: Record<string, Object>, key: string): string[] {
    const result: string[] = [];
    const items: Object[] = IrLibraryRepository.toObjectList(record[key]);
    for (let i: number = 0; i < items.length; i++) {
      const item: Object = items[i];
      if (typeof item === 'string') {
        result.push(item);
      }
    }
    return result;
  }
}
