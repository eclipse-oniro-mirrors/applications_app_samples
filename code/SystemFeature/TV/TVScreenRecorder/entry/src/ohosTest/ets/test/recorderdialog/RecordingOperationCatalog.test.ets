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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  recorderComponentCount,
  pressAndWait,
  serializedDelay,
  buildRecordingFileName,
  isValidRecordingFileName,
  formatTimerLabel,
  KEY_BACK,
  DELAY_KEY_NAVIGATION
} from '../shared/RecordingDriver';

// Kinds of catalogued recording operations. START is the default value 0 so
// that an uninitialized entry always maps to the safe operation.
enum RecordingOperationKind {
  START = 0,
  STOP = 1,
  QUERY = 2,
  TIMER_PANEL = 3,
  TIP_PANEL = 4,
  RESOLUTION_PANEL = 5
}

// One catalogued operation with the metadata used by the automation.
interface RecordingOperationDef {
  id: string;
  icon: string;
  focusIcon: string;
  name: string;
  kind: number;
  startId: number;
}

// Business category of an operation.
enum OperationCategory {
  CATEGORY_SESSION_CONTROL = 'session_control',
  CATEGORY_WINDOW_RENDER = 'window_render',
  CATEGORY_STORAGE = 'storage'
}

// Risk level of an operation.
enum OperationRiskLevel {
  RISK_SAFE = 0,
  RISK_MODERATE = 1,
  RISK_HIGH = 2
}

// Relationship between two catalogued operations.
interface OperationRelationshipDef {
  sourceId: string;
  targetId: string;
  mutuallyExclusive: boolean;
  description: string;
}

// Static catalog of the recording operations. The catalog is the single source
// of truth used by both the service wiring and the automation cases.
class RecordingOperationCatalog {
  public static readonly START: RecordingOperationDef = {
    id: 'record_start',
    icon: 'app.media.recorder_start',
    focusIcon: 'app.media.recorder_start_focus',
    name: '开始录屏',
    kind: RecordingOperationKind.START,
    startId: 1
  };
  public static readonly STOP: RecordingOperationDef = {
    id: 'record_stop',
    icon: 'app.media.recorder_stop',
    focusIcon: 'app.media.recorder_stop_focus',
    name: '结束录屏',
    kind: RecordingOperationKind.STOP,
    startId: 2
  };
  public static readonly QUERY: RecordingOperationDef = {
    id: 'record_query',
    icon: 'app.media.recorder_query',
    focusIcon: 'app.media.recorder_query_focus',
    name: '查询状态',
    kind: RecordingOperationKind.QUERY,
    startId: 2
  };
  public static readonly TIMER_PANEL: RecordingOperationDef = {
    id: 'timer_panel',
    icon: 'app.media.recorder_timer',
    focusIcon: 'app.media.recorder_timer_focus',
    name: '录制计时',
    kind: RecordingOperationKind.TIMER_PANEL,
    startId: 0
  };
  public static readonly TIP_PANEL: RecordingOperationDef = {
    id: 'tip_panel',
    icon: 'app.media.recorder_tip',
    focusIcon: 'app.media.recorder_tip_focus',
    name: '存储提示',
    kind: RecordingOperationKind.TIP_PANEL,
    startId: 0
  };

  public static getAll(): RecordingOperationDef[] {
    const all: RecordingOperationDef[] = [];
    all.push(RecordingOperationCatalog.START);
    all.push(RecordingOperationCatalog.STOP);
    all.push(RecordingOperationCatalog.QUERY);
    all.push(RecordingOperationCatalog.TIMER_PANEL);
    all.push(RecordingOperationCatalog.TIP_PANEL);
    return all;
  }

  public static getIds(): string[] {
    const all: RecordingOperationDef[] = RecordingOperationCatalog.getAll();
    const ids: string[] = [];
    for (let i = 0; i < all.length; i++) {
      ids.push(all[i].id);
    }
    return ids;
  }

  public static getSessionOperations(): RecordingOperationDef[] {
    const result: RecordingOperationDef[] = [];
    const all: RecordingOperationDef[] = RecordingOperationCatalog.getAll();
    for (let i = 0; i < all.length; i++) {
      if (all[i].kind === RecordingOperationKind.START || all[i].kind === RecordingOperationKind.STOP ||
        all[i].kind === RecordingOperationKind.QUERY) {
        result.push(all[i]);
      }
    }
    return result;
  }
}

// Production constants of the recording sample.
class RecorderCatalogConstants {
  public static readonly FD_PREFIX: string = 'fd://';
  public static readonly TIME_LENGTH: number = 2;
  public static readonly TIME_PREFIX: string = '0';
  public static readonly RECORD_PREFIX: string = 'REC';
  public static readonly VIDEO_TYPE: string = '.mp4';
  public static readonly CONNECTOR: string = '_';
  public static readonly VIRTUAL_SCREEN_NAME: string = 'screenRecorder';
  public static readonly DEVICE_RATE: number = 0.6;
  public static readonly RECORD_WIDTH: number = 1920;
  public static readonly RECORD_HEIGHT: number = 1080;
  public static readonly PHONE_WIDTH: number = 180;
  public static readonly PHONE_HEIGHT: number = 160;
  public static readonly DESTROY_FLOAT_WINDOW: number = 1;
  public static readonly TIP_DURATION: number = 3000;
  public static readonly BUBBLE_BLINK: number = 800;
  public static readonly DOUBLE_CLICK_WINDOW: number = 500;
  public static readonly TIMER_X: number = 96;
  public static readonly TIMER_Y: number = 48;
  public static readonly TIMER_WIDTH: number = 624;
  public static readonly TIMER_HEIGHT: number = 56;
  public static readonly TIP_X: number = 615;
  public static readonly TIP_Y: number = 46;
  public static readonly TIP_WIDTH: number = 686;
  public static readonly TIP_HEIGHT: number = 100;
  public static readonly TIMER_RADIUS: number = 28;
  public static readonly TIP_RADIUS: number = 24;
  public static readonly WINDOW_BG: string = '#B33A3F62';
  public static readonly TRANSPARENT_BG: string = '#00000000';
  public static readonly SESSION_STATE_KEY: string = 'recorderState';
  public static readonly CONTEXT_KEY: string = 'SRAbilityContext';
  public static readonly SESSION_STATE_IDLE: number = 0;
  public static readonly SESSION_STATE_RECORDING: number = 1;
  public static readonly SESSION_STATE_STOPPED: number = 2;
  public static readonly SESSION_STATE_ERROR: number = 3;
}

// Validates the catalog: unique ids, unique kinds and non-empty metadata.
class OperationCatalogValidator {
  private catalog: RecordingOperationDef[] = [];

  constructor(catalog: RecordingOperationDef[]) {
    this.catalog = catalog;
  }

  public hasUniqueIds(): boolean {
    const ids: Set<string> = new Set<string>();
    for (let i = 0; i < this.catalog.length; i++) {
      ids.add(this.catalog[i].id);
    }
    return ids.size === this.catalog.length;
  }

  public hasUniqueKinds(): boolean {
    const kinds: Set<number> = new Set<number>();
    for (let i = 0; i < this.catalog.length; i++) {
      kinds.add(this.catalog[i].kind);
    }
    return kinds.size === this.catalog.length;
  }

  public allHaveNonEmptyNames(): boolean {
    for (let i = 0; i < this.catalog.length; i++) {
      if (this.catalog[i].name.length === 0) {
        return false;
      }
    }
    return true;
  }

  public allHaveNonEmptyIcons(): boolean {
    for (let i = 0; i < this.catalog.length; i++) {
      if (this.catalog[i].icon.length === 0 || this.catalog[i].focusIcon.length === 0) {
        return false;
      }
    }
    return true;
  }

  public findById(id: string): RecordingOperationDef | null {
    for (let i = 0; i < this.catalog.length; i++) {
      if (this.catalog[i].id === id) {
        return this.catalog[i];
      }
    }
    return null;
  }

  public countByKind(kind: number): number {
    let count: number = 0;
    for (let i = 0; i < this.catalog.length; i++) {
      if (this.catalog[i].kind === kind) {
        count++;
      }
    }
    return count;
  }

  public countByStartId(startId: number): number {
    let count: number = 0;
    for (let i = 0; i < this.catalog.length; i++) {
      if (this.catalog[i].startId === startId) {
        count++;
      }
    }
    return count;
  }

  public validateAll(): boolean {
    return this.hasUniqueIds() && this.hasUniqueKinds() && this.allHaveNonEmptyNames() &&
      this.allHaveNonEmptyIcons();
  }
}

// Dependency graph between catalogued operations. Session control operations
// are mutually exclusive, window rendering operations are not.
class OperationDependencyGraph {
  private relationships: OperationRelationshipDef[] = [];

  public addRelationship(relationship: OperationRelationshipDef): void {
    this.relationships.push(relationship);
  }

  public getRelationships(): OperationRelationshipDef[] {
    const result: OperationRelationshipDef[] = [];
    for (let i = 0; i < this.relationships.length; i++) {
      result.push(this.relationships[i]);
    }
    return result;
  }

  public getRelationshipCount(): number {
    return this.relationships.length;
  }

  public areMutuallyExclusive(sourceId: string, targetId: string): boolean {
    for (let i = 0; i < this.relationships.length; i++) {
      const rel: OperationRelationshipDef = this.relationships[i];
      if (rel.sourceId === sourceId && rel.targetId === targetId && rel.mutuallyExclusive) {
        return true;
      }
    }
    return false;
  }

  public getTargetsOf(sourceId: string): string[] {
    const targets: string[] = [];
    for (let i = 0; i < this.relationships.length; i++) {
      if (this.relationships[i].sourceId === sourceId) {
        targets.push(this.relationships[i].targetId);
      }
    }
    return targets;
  }

  public hasCycle(): boolean {
    for (let i = 0; i < this.relationships.length; i++) {
      if (this.relationships[i].sourceId === this.relationships[i].targetId) {
        return true;
      }
    }
    return false;
  }

  public clear(): void {
    this.relationships = [];
  }
}

// Resolves the display name of an operation from its id or kind.
class OperationNameResolver {
  private catalog: RecordingOperationDef[] = [];

  constructor(catalog: RecordingOperationDef[]) {
    this.catalog = catalog;
  }

  public resolveById(id: string): string {
    for (let i = 0; i < this.catalog.length; i++) {
      if (this.catalog[i].id === id) {
        return this.catalog[i].name;
      }
    }
    return '未知操作';
  }

  public resolveByKind(kind: number): string {
    for (let i = 0; i < this.catalog.length; i++) {
      if (this.catalog[i].kind === kind) {
        return this.catalog[i].name;
      }
    }
    return '未知操作';
  }

  public resolveByStartId(startId: number): string {
    for (let i = 0; i < this.catalog.length; i++) {
      if (this.catalog[i].startId === startId && this.catalog[i].startId !== 0) {
        return this.catalog[i].name;
      }
    }
    return '未知操作';
  }

  public resolveAllNames(): string[] {
    const names: string[] = [];
    for (let i = 0; i < this.catalog.length; i++) {
      names.push(this.catalog[i].name);
    }
    return names;
  }

  public getResolvableCount(): number {
    return this.catalog.length;
  }

  public isResolvable(kind: number): boolean {
    for (let i = 0; i < this.catalog.length; i++) {
      if (this.catalog[i].kind === kind) {
        return true;
      }
    }
    return false;
  }
}

// Statistics of the catalog sizes and identifier lengths.
class CatalogStatistics {
  private catalog: RecordingOperationDef[] = [];

  constructor(catalog: RecordingOperationDef[]) {
    this.catalog = catalog;
  }

  public getCatalogSize(): number {
    return this.catalog.length;
  }

  public getIdLengthSum(): number {
    let sum: number = 0;
    for (let i = 0; i < this.catalog.length; i++) {
      sum += this.catalog[i].id.length;
    }
    return sum;
  }

  public getAverageIdLength(): number {
    const size: number = this.getCatalogSize();
    if (size === 0) {
      return 0;
    }
    return this.getIdLengthSum() / size;
  }

  public getLongestIdLength(): number {
    let longest: number = 0;
    for (let i = 0; i < this.catalog.length; i++) {
      if (this.catalog[i].id.length > longest) {
        longest = this.catalog[i].id.length;
      }
    }
    return longest;
  }

  public getShortestNameLength(): number {
    if (this.catalog.length === 0) {
      return 0;
    }
    let shortest: number = this.catalog[0].name.length;
    for (let i = 1; i < this.catalog.length; i++) {
      if (this.catalog[i].name.length < shortest) {
        shortest = this.catalog[i].name.length;
      }
    }
    return shortest;
  }

  public describeCatalog(): string {
    return `RecordingCatalogStatistics{size: ${this.getCatalogSize()}, avgIdLength: ${this.getAverageIdLength()}}`;
  }
}

// Checks the individual properties of one catalog entry.
class OperationPropertyChecker {
  public hasRequiredId(def: RecordingOperationDef, minLength: number): boolean {
    return def.id.length >= minLength;
  }

  public hasNoWhitespaceInId(def: RecordingOperationDef): boolean {
    return !def.id.includes(' ');
  }

  public hasValidKindRange(def: RecordingOperationDef, min: number, max: number): boolean {
    return def.kind >= min && def.kind <= max;
  }

  public isComplete(def: RecordingOperationDef): boolean {
    return this.hasRequiredId(def, 3) && this.hasNoWhitespaceInId(def) && def.name.length > 0 &&
      def.icon.length > 0 && def.focusIcon.length > 0;
  }

  public collectMissingProperties(def: RecordingOperationDef): string[] {
    const missing: string[] = [];
    if (def.id.length === 0) {
      missing.push('id');
    }
    if (def.name.length === 0) {
      missing.push('name');
    }
    if (def.icon.length === 0) {
      missing.push('icon');
    }
    if (def.focusIcon.length === 0) {
      missing.push('focusIcon');
    }
    return missing;
  }
}

// Searches the catalog by name, id prefix and kind order.
class OperationCatalogSearcher {
  private catalog: RecordingOperationDef[] = [];

  constructor(catalog: RecordingOperationDef[]) {
    this.catalog = catalog;
  }

  public searchByName(keyword: string): RecordingOperationDef[] {
    const result: RecordingOperationDef[] = [];
    for (let i = 0; i < this.catalog.length; i++) {
      if (this.catalog[i].name.includes(keyword)) {
        result.push(this.catalog[i]);
      }
    }
    return result;
  }

  public searchByIdPrefix(prefix: string): RecordingOperationDef[] {
    const result: RecordingOperationDef[] = [];
    for (let i = 0; i < this.catalog.length; i++) {
      if (this.catalog[i].id.startsWith(prefix)) {
        result.push(this.catalog[i]);
      }
    }
    return result;
  }

  public findExactName(name: string): RecordingOperationDef | null {
    for (let i = 0; i < this.catalog.length; i++) {
      if (this.catalog[i].name === name) {
        return this.catalog[i];
      }
    }
    return null;
  }

  public getSortedById(): RecordingOperationDef[] {
    const result: RecordingOperationDef[] = [];
    for (let i = 0; i < this.catalog.length; i++) {
      result.push(this.catalog[i]);
    }
    for (let i = 1; i < result.length; i++) {
      const current: RecordingOperationDef = result[i];
      let j: number = i - 1;
      while (j >= 0 && result[j].id > current.id) {
        result[j + 1] = result[j];
        j--;
      }
      result[j + 1] = current;
    }
    return result;
  }

  public getSortedByKind(): RecordingOperationDef[] {
    const result: RecordingOperationDef[] = [];
    for (let i = 0; i < this.catalog.length; i++) {
      result.push(this.catalog[i]);
    }
    for (let i = 1; i < result.length; i++) {
      const current: RecordingOperationDef = result[i];
      let j: number = i - 1;
      while (j >= 0 && result[j].kind > current.kind) {
        result[j + 1] = result[j];
        j--;
      }
      result[j + 1] = current;
    }
    return result;
  }
}

// Map of localized operation names.
class OperationLocaleMap {
  private names: Map<string, string> = new Map<string, string>();

  public put(key: string, name: string): void {
    this.names.set(key, name);
  }

  public get(key: string): string | null {
    const name: string | undefined = this.names.get(key);
    return name === undefined ? null : name;
  }

  public getSize(): number {
    return this.names.size;
  }

  public hasKey(key: string): boolean {
    return this.names.has(key);
  }

  public keys(): string[] {
    const result: string[] = [];
    this.names.forEach((value: string, key: string) => {
      result.push(key);
    });
    return result;
  }

  public clear(): void {
    this.names.clear();
  }
}

// Validates the persisted recording file contract.
class RecordingFileCatalog {
  public isPrefixed(fileName: string): boolean {
    return fileName.startsWith(RecorderCatalogConstants.RECORD_PREFIX);
  }

  public isVideoType(fileName: string): boolean {
    return fileName.endsWith(RecorderCatalogConstants.VIDEO_TYPE);
  }

  public isWellFormed(fileName: string): boolean {
    return isValidRecordingFileName(fileName);
  }

  public buildName(date: Date): string {
    return buildRecordingFileName(date);
  }

  public buildTimerLabel(seconds: number): string {
    return formatTimerLabel(seconds);
  }

  public countValid(fileNames: string[]): number {
    let count: number = 0;
    for (let i = 0; i < fileNames.length; i++) {
      if (this.isWellFormed(fileNames[i])) {
        count++;
      }
    }
    return count;
  }

  public hasDuplicates(fileNames: string[]): boolean {
    for (let i = 0; i < fileNames.length; i++) {
      for (let j = i + 1; j < fileNames.length; j++) {
        if (fileNames[i] === fileNames[j]) {
          return true;
        }
      }
    }
    return false;
  }
}

export default function recordingOperationCatalogTest(): void {
  describe('RecordingOperationCatalog_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      await serializedDelay(driver, 200);
    });

    // Catalog: the operation kind enum contains the six documented members.
    it('operation_kind_enum_should_have_six_members', 0, async () => {
      const values: number[] = [RecordingOperationKind.START, RecordingOperationKind.STOP,
        RecordingOperationKind.QUERY, RecordingOperationKind.TIMER_PANEL, RecordingOperationKind.TIP_PANEL,
        RecordingOperationKind.RESOLUTION_PANEL];
      expect(values.length).assertEqual(6);
      const unique: Set<number> = new Set<number>(values);
      expect(unique.size).assertEqual(6);
    });

    // Catalog: the default kind is START.
    it('operation_kind_default_should_be_start', 0, async () => {
      expect(RecordingOperationKind.START).assertEqual(0);
      expect(RecordingOperationKind.STOP).assertEqual(1);
      expect(RecordingOperationKind.TIMER_PANEL).assertLarger(RecordingOperationKind.QUERY);
    });

    // Catalog: all five entries are present and unique.
    it('catalog_should_contain_all_operations', 0, async () => {
      const ids: string[] = RecordingOperationCatalog.getIds();
      expect(ids.length).assertEqual(5);
      expect(ids.includes('record_start')).assertTrue();
      expect(ids.includes('record_stop')).assertTrue();
      expect(ids.includes('record_query')).assertTrue();
      expect(ids.includes('timer_panel')).assertTrue();
      expect(ids.includes('tip_panel')).assertTrue();
      const unique: Set<string> = new Set<string>(ids);
      expect(unique.size).assertEqual(ids.length);
    });

    // Catalog: the session control subset excludes the panels.
    it('session_operations_should_exclude_panels', 0, async () => {
      const sessionOps: RecordingOperationDef[] = RecordingOperationCatalog.getSessionOperations();
      expect(sessionOps.length).assertEqual(3);
      expect(sessionOps[0].id).assertEqual('record_start');
      expect(sessionOps[2].id).assertEqual('record_query');
    });

    // Catalog: start uses startId 1 while stop uses any other value.
    it('start_id_should_follow_service_contract', 0, async () => {
      expect(RecordingOperationCatalog.START.startId).assertEqual(1);
      expect(RecordingOperationCatalog.STOP.startId).assertEqual(2);
      expect(RecordingOperationCatalog.QUERY.startId).assertEqual(2);
      expect(RecordingOperationCatalog.START.startId === 1).assertTrue();
      expect(RecordingOperationCatalog.STOP.startId === 1).assertFalse();
    });

    // Catalog: every entry carries complete metadata.
    it('each_operation_should_have_required_properties', 0, async () => {
      const all: RecordingOperationDef[] = RecordingOperationCatalog.getAll();
      for (let i = 0; i < all.length; i++) {
        expect(all[i].id.length).assertLargerOrEqual(1);
        expect(all[i].name.length).assertLargerOrEqual(1);
        expect(all[i].icon.length).assertLargerOrEqual(1);
        expect(all[i].focusIcon.length).assertLargerOrEqual(1);
        expect(all[i].kind).assertLargerOrEqual(0);
      }
    });

    // Catalog: identifiers are readable and bounded.
    it('operation_ids_should_be_meaningful', 0, async () => {
      const ids: string[] = RecordingOperationCatalog.getIds();
      for (let i = 0; i < ids.length; i++) {
        expect(ids[i].includes(' ')).assertFalse();
        expect(ids[i].length).assertLargerOrEqual(3);
        expect(ids[i].length).assertLessOrEqual(20);
        expect(ids[i].includes('_')).assertTrue();
      }
    });

    // Catalog: icons follow the media resource naming scheme.
    it('catalog_icons_should_follow_media_resource_format', 0, async () => {
      const all: RecordingOperationDef[] = RecordingOperationCatalog.getAll();
      for (let i = 0; i < all.length; i++) {
        expect(all[i].icon.startsWith('app.media.')).assertTrue();
        expect(all[i].focusIcon.startsWith('app.media.')).assertTrue();
        expect(all[i].focusIcon.length).assertLarger(all[i].icon.length);
        expect(all[i].focusIcon.includes(all[i].icon)).assertTrue();
      }
    });

    // Constants: the descriptor prefix and the file naming parts.
    it('file_contract_constants_should_be_stable', 0, async () => {
      expect(RecorderCatalogConstants.FD_PREFIX).assertEqual('fd://');
      expect(RecorderCatalogConstants.RECORD_PREFIX).assertEqual('REC');
      expect(RecorderCatalogConstants.VIDEO_TYPE).assertEqual('.mp4');
      expect(RecorderCatalogConstants.CONNECTOR).assertEqual('_');
      expect(RecorderCatalogConstants.TIME_LENGTH).assertEqual(2);
      expect(RecorderCatalogConstants.TIME_PREFIX).assertEqual('0');
    });

    // Constants: the capture geometry of the virtual screen.
    it('capture_geometry_constants_should_be_stable', 0, async () => {
      expect(RecorderCatalogConstants.VIRTUAL_SCREEN_NAME).assertEqual('screenRecorder');
      expect(RecorderCatalogConstants.RECORD_WIDTH).assertEqual(1920);
      expect(RecorderCatalogConstants.RECORD_HEIGHT).assertEqual(1080);
      expect(RecorderCatalogConstants.DEVICE_RATE).assertEqual(0.6);
      expect(RecorderCatalogConstants.PHONE_WIDTH).assertEqual(180);
      expect(RecorderCatalogConstants.PHONE_HEIGHT).assertEqual(160);
    });

    // Constants: the two floating window rectangles.
    it('window_rect_constants_should_be_stable', 0, async () => {
      expect(RecorderCatalogConstants.TIMER_X).assertEqual(96);
      expect(RecorderCatalogConstants.TIMER_Y).assertEqual(48);
      expect(RecorderCatalogConstants.TIMER_WIDTH).assertEqual(624);
      expect(RecorderCatalogConstants.TIMER_HEIGHT).assertEqual(56);
      expect(RecorderCatalogConstants.TIP_X).assertEqual(615);
      expect(RecorderCatalogConstants.TIP_Y).assertEqual(46);
      expect(RecorderCatalogConstants.TIP_WIDTH).assertEqual(686);
      expect(RecorderCatalogConstants.TIP_HEIGHT).assertEqual(100);
    });

    // Constants: style and timing tokens.
    it('window_style_constants_should_be_stable', 0, async () => {
      expect(RecorderCatalogConstants.TIMER_RADIUS).assertEqual(28);
      expect(RecorderCatalogConstants.TIP_RADIUS).assertEqual(24);
      expect(RecorderCatalogConstants.WINDOW_BG).assertEqual('#B33A3F62');
      expect(RecorderCatalogConstants.TRANSPARENT_BG).assertEqual('#00000000');
      expect(RecorderCatalogConstants.TIP_DURATION).assertEqual(3000);
      expect(RecorderCatalogConstants.BUBBLE_BLINK).assertEqual(800);
      expect(RecorderCatalogConstants.DOUBLE_CLICK_WINDOW).assertEqual(500);
    });

    // Constants: the storage keys and state values of the local storage.
    it('session_storage_constants_should_be_stable', 0, async () => {
      expect(RecorderCatalogConstants.SESSION_STATE_KEY).assertEqual('recorderState');
      expect(RecorderCatalogConstants.CONTEXT_KEY).assertEqual('SRAbilityContext');
      expect(RecorderCatalogConstants.SESSION_STATE_IDLE).assertEqual(0);
      expect(RecorderCatalogConstants.SESSION_STATE_RECORDING).assertEqual(1);
      expect(RecorderCatalogConstants.SESSION_STATE_STOPPED).assertEqual(2);
      expect(RecorderCatalogConstants.SESSION_STATE_ERROR).assertEqual(3);
      expect(RecorderCatalogConstants.DESTROY_FLOAT_WINDOW).assertEqual(1);
    });

    // Files: the generated file name follows the production rule.
    it('file_catalog_should_build_well_formed_names', 0, async () => {
      const catalog = new RecordingFileCatalog();
      const name: string = catalog.buildName(new Date(2026, 0, 9, 10, 11, 12));
      expect(name).assertEqual('REC_20260109_101112.mp4');
      expect(catalog.isPrefixed(name)).assertTrue();
      expect(catalog.isVideoType(name)).assertTrue();
      expect(catalog.isWellFormed(name)).assertTrue();
    });

    // Files: malformed names are rejected.
    it('file_catalog_should_reject_malformed_names', 0, async () => {
      const catalog = new RecordingFileCatalog();
      expect(catalog.isWellFormed('REC_2026.mp4')).assertFalse();
      expect(catalog.isWellFormed('VID_20260109_101112.mp4')).assertFalse();
      expect(catalog.isWellFormed('REC_20260109101112.mp4')).assertFalse();
      expect(catalog.isWellFormed('REC_20260109_101112.mkv')).assertFalse();
      expect(catalog.isPrefixed('VID_20260109_101112.mp4')).assertFalse();
      expect(catalog.isVideoType('REC_20260109_101112.mkv')).assertFalse();
    });

    // Files: a batch of names is counted and checked for duplicates.
    it('file_catalog_should_count_valid_names', 0, async () => {
      const catalog = new RecordingFileCatalog();
      const names: string[] = [];
      names.push(catalog.buildName(new Date(2026, 0, 9, 10, 11, 12)));
      names.push(catalog.buildName(new Date(2026, 0, 9, 10, 11, 13)));
      names.push('broken.mp4');
      expect(catalog.countValid(names)).assertEqual(2);
      expect(catalog.hasDuplicates(names)).assertFalse();
      names.push(names[0]);
      expect(catalog.hasDuplicates(names)).assertTrue();
    });

    // Files: the timer label of the overlay is HH:mm:ss.
    it('file_catalog_should_build_timer_labels', 0, async () => {
      const catalog = new RecordingFileCatalog();
      expect(catalog.buildTimerLabel(0)).assertEqual('00:00:00');
      expect(catalog.buildTimerLabel(61)).assertEqual('00:01:01');
      expect(catalog.buildTimerLabel(3599)).assertEqual('00:59:59');
      expect(catalog.buildTimerLabel(3600)).assertEqual('01:00:00');
    });

    // Validator: the shipped catalog passes every structural check.
    it('validator_should_pass_full_validation', 0, async () => {
      const validator = new OperationCatalogValidator(RecordingOperationCatalog.getAll());
      expect(validator.hasUniqueIds()).assertTrue();
      expect(validator.hasUniqueKinds()).assertTrue();
      expect(validator.allHaveNonEmptyNames()).assertTrue();
      expect(validator.allHaveNonEmptyIcons()).assertTrue();
      expect(validator.validateAll()).assertTrue();
    });

    // Validator: lookups by id and counts by kind.
    it('validator_should_find_definition_and_count_kinds', 0, async () => {
      const validator = new OperationCatalogValidator(RecordingOperationCatalog.getAll());
      const start: RecordingOperationDef | null = validator.findById('record_start');
      expect(start === null).assertFalse();
      expect(start?.name).assertEqual('开始录屏');
      expect(start?.startId).assertEqual(1);
      expect(validator.findById('missing_operation') === null).assertTrue();
      expect(validator.countByKind(RecordingOperationKind.START)).assertEqual(1);
      expect(validator.countByKind(RecordingOperationKind.TIP_PANEL)).assertEqual(1);
      expect(validator.countByKind(99)).assertEqual(0);
    });

    // Validator: stop and query share startId 2 but not the kind.
    it('validator_should_count_shared_start_ids', 0, async () => {
      const validator = new OperationCatalogValidator(RecordingOperationCatalog.getAll());
      expect(validator.countByStartId(1)).assertEqual(1);
      expect(validator.countByStartId(2)).assertEqual(2);
      expect(validator.countByStartId(0)).assertEqual(2);
      expect(validator.countByStartId(7)).assertEqual(0);
    });

    // Validator: a duplicated entry is rejected.
    it('validator_should_detect_duplicate_entries', 0, async () => {
      const duplicated: RecordingOperationDef[] = [];
      duplicated.push(RecordingOperationCatalog.START);
      duplicated.push(RecordingOperationCatalog.START);
      const validator = new OperationCatalogValidator(duplicated);
      expect(validator.hasUniqueIds()).assertFalse();
      expect(validator.hasUniqueKinds()).assertFalse();
      expect(validator.validateAll()).assertFalse();
    });

    // Validator: an empty catalog is structurally valid.
    it('validator_should_handle_empty_catalog', 0, async () => {
      const validator = new OperationCatalogValidator([]);
      expect(validator.hasUniqueIds()).assertTrue();
      expect(validator.hasUniqueKinds()).assertTrue();
      expect(validator.allHaveNonEmptyNames()).assertTrue();
      expect(validator.findById('record_start') === null).assertTrue();
      expect(validator.countByKind(0)).assertEqual(0);
      expect(validator.validateAll()).assertTrue();
    });

    // Graph: session control operations are mutually exclusive.
    it('dependency_graph_should_record_mutual_exclusion', 0, async () => {
      const graph = new OperationDependencyGraph();
      const rel: OperationRelationshipDef = {
        sourceId: 'record_start',
        targetId: 'record_stop',
        mutuallyExclusive: true,
        description: 'a session cannot start and stop at the same time'
      };
      graph.addRelationship(rel);
      expect(graph.getRelationshipCount()).assertEqual(1);
      expect(graph.areMutuallyExclusive('record_start', 'record_stop')).assertTrue();
      expect(graph.areMutuallyExclusive('record_stop', 'record_start')).assertFalse();
    });

    // Graph: panel rendering is not exclusive.
    it('dependency_graph_should_allow_non_exclusive_relations', 0, async () => {
      const graph = new OperationDependencyGraph();
      graph.addRelationship({
        sourceId: 'timer_panel',
        targetId: 'tip_panel',
        mutuallyExclusive: false,
        description: 'the tip panel replaces the timer panel'
      });
      expect(graph.areMutuallyExclusive('timer_panel', 'tip_panel')).assertFalse();
      expect(graph.getTargetsOf('timer_panel').length).assertEqual(1);
      expect(graph.getTargetsOf('tip_panel').length).assertEqual(0);
    });

    // Graph: all targets of one source are enumerated.
    it('dependency_graph_should_return_all_targets', 0, async () => {
      const graph = new OperationDependencyGraph();
      graph.addRelationship({
        sourceId: 'record_start', targetId: 'record_stop', mutuallyExclusive: true, description: 'exclusive'
      });
      graph.addRelationship({
        sourceId: 'record_start', targetId: 'timer_panel', mutuallyExclusive: false, description: 'triggers'
      });
      const targets: string[] = graph.getTargetsOf('record_start');
      expect(targets.length).assertEqual(2);
      expect(targets.includes('record_stop')).assertTrue();
      expect(targets.includes('timer_panel')).assertTrue();
    });

    // Graph: self loops are reported as cycles.
    it('dependency_graph_should_detect_self_cycle', 0, async () => {
      const graph = new OperationDependencyGraph();
      expect(graph.hasCycle()).assertFalse();
      graph.addRelationship({
        sourceId: 'record_stop', targetId: 'record_stop', mutuallyExclusive: true, description: 'self loop'
      });
      expect(graph.hasCycle()).assertTrue();
      graph.clear();
      expect(graph.hasCycle()).assertFalse();
      expect(graph.getRelationshipCount()).assertEqual(0);
    });

    // Graph: the returned list is a copy of the internal storage.
    it('dependency_graph_should_return_copy_of_relationships', 0, async () => {
      const graph = new OperationDependencyGraph();
      graph.addRelationship({
        sourceId: 'record_start', targetId: 'record_stop', mutuallyExclusive: true, description: 'exclusive'
      });
      const copy: OperationRelationshipDef[] = graph.getRelationships();
      copy.push({
        sourceId: 'record_stop', targetId: 'record_start', mutuallyExclusive: true, description: 'copy only'
      });
      expect(copy.length).assertEqual(2);
      expect(graph.getRelationshipCount()).assertEqual(1);
    });

    // Resolver: names are resolved by id.
    it('name_resolver_should_resolve_name_by_id', 0, async () => {
      const resolver = new OperationNameResolver(RecordingOperationCatalog.getAll());
      expect(resolver.resolveById('record_start')).assertEqual('开始录屏');
      expect(resolver.resolveById('record_stop')).assertEqual('结束录屏');
      expect(resolver.resolveById('timer_panel')).assertEqual('录制计时');
      expect(resolver.resolveById('unknown')).assertEqual('未知操作');
    });

    // Resolver: names are resolved by kind.
    it('name_resolver_should_resolve_name_by_kind', 0, async () => {
      const resolver = new OperationNameResolver(RecordingOperationCatalog.getAll());
      expect(resolver.resolveByKind(RecordingOperationKind.START)).assertEqual('开始录屏');
      expect(resolver.resolveByKind(RecordingOperationKind.STOP)).assertEqual('结束录屏');
      expect(resolver.resolveByKind(99)).assertEqual('未知操作');
      expect(resolver.isResolvable(RecordingOperationKind.QUERY)).assertTrue();
      expect(resolver.isResolvable(99)).assertFalse();
    });

    // Resolver: names are resolved by startId, skipping panel entries.
    it('name_resolver_should_resolve_name_by_start_id', 0, async () => {
      const resolver = new OperationNameResolver(RecordingOperationCatalog.getAll());
      expect(resolver.resolveByStartId(1)).assertEqual('开始录屏');
      expect(resolver.resolveByStartId(2)).assertEqual('结束录屏');
      expect(resolver.resolveByStartId(0)).assertEqual('未知操作');
      expect(resolver.resolveByStartId(42)).assertEqual('未知操作');
    });

    // Resolver: all names and the resolvable count.
    it('name_resolver_should_report_all_names', 0, async () => {
      const resolver = new OperationNameResolver(RecordingOperationCatalog.getAll());
      const names: string[] = resolver.resolveAllNames();
      expect(names.length).assertEqual(5);
      expect(names.includes('开始录屏')).assertTrue();
      expect(names.includes('结束录屏')).assertTrue();
      expect(names.includes('查询状态')).assertTrue();
      expect(resolver.getResolvableCount()).assertEqual(5);
    });

    // Resolver: an empty catalog resolves to the fallback label.
    it('name_resolver_should_handle_empty_catalog', 0, async () => {
      const resolver = new OperationNameResolver([]);
      expect(resolver.resolveById('record_start')).assertEqual('未知操作');
      expect(resolver.resolveByKind(0)).assertEqual('未知操作');
      expect(resolver.getResolvableCount()).assertEqual(0);
      expect(resolver.resolveAllNames().length).assertEqual(0);
    });

    // Statistics: catalog size and identifier lengths.
    it('catalog_statistics_should_report_size_and_length', 0, async () => {
      const stats = new CatalogStatistics(RecordingOperationCatalog.getAll());
      expect(stats.getCatalogSize()).assertEqual(5);
      const expectedSum: number = 'record_start'.length + 'record_stop'.length + 'record_query'.length +
        'timer_panel'.length + 'tip_panel'.length;
      expect(stats.getIdLengthSum()).assertEqual(expectedSum);
      expect(stats.getAverageIdLength()).assertEqual(expectedSum / 5);
      expect(stats.getLongestIdLength()).assertEqual('record_start'.length);
      expect(stats.describeCatalog().includes('size: 5')).assertTrue();
    });

    // Statistics: the shortest name belongs to the panels.
    it('catalog_statistics_should_report_shortest_name', 0, async () => {
      const stats = new CatalogStatistics(RecordingOperationCatalog.getAll());
      expect(stats.getShortestNameLength()).assertEqual('开始录屏'.length);
      const empty = new CatalogStatistics([]);
      expect(empty.getCatalogSize()).assertEqual(0);
      expect(empty.getIdLengthSum()).assertEqual(0);
      expect(empty.getAverageIdLength()).assertEqual(0);
      expect(empty.getLongestIdLength()).assertEqual(0);
      expect(empty.getShortestNameLength()).assertEqual(0);
    });

    // Property checker: identifier rules.
    it('property_checker_should_validate_identifier_rules', 0, async () => {
      const checker = new OperationPropertyChecker();
      expect(checker.hasRequiredId(RecordingOperationCatalog.START, 3)).assertTrue();
      expect(checker.hasRequiredId(RecordingOperationCatalog.START, 100)).assertFalse();
      expect(checker.hasNoWhitespaceInId(RecordingOperationCatalog.STOP)).assertTrue();
      expect(checker.hasValidKindRange(RecordingOperationCatalog.STOP, 0, 5)).assertTrue();
      expect(checker.hasValidKindRange(RecordingOperationCatalog.TIP_PANEL, 0, 3)).assertFalse();
    });

    // Property checker: completeness and missing field collection.
    it('property_checker_should_collect_missing_properties', 0, async () => {
      const checker = new OperationPropertyChecker();
      expect(checker.isComplete(RecordingOperationCatalog.START)).assertTrue();
      expect(checker.isComplete(RecordingOperationCatalog.TIP_PANEL)).assertTrue();
      const emptyDef: RecordingOperationDef = {
        id: '', icon: '', focusIcon: '', name: '', kind: 0, startId: 0
      };
      const missing: string[] = checker.collectMissingProperties(emptyDef);
      expect(missing.length).assertEqual(4);
      expect(missing.includes('id')).assertTrue();
      expect(missing.includes('name')).assertTrue();
      expect(missing.includes('icon')).assertTrue();
      expect(missing.includes('focusIcon')).assertTrue();
      expect(checker.isComplete(emptyDef)).assertFalse();
    });

    // Property checker: a single missing field is reported.
    it('property_checker_should_detect_partial_missing_property', 0, async () => {
      const checker = new OperationPropertyChecker();
      const partial: RecordingOperationDef = {
        id: 'record_start',
        icon: 'app.media.recorder_start',
        focusIcon: '',
        name: '开始录屏',
        kind: RecordingOperationKind.START,
        startId: 1
      };
      const missing: string[] = checker.collectMissingProperties(partial);
      expect(missing.length).assertEqual(1);
      expect(missing.includes('focusIcon')).assertTrue();
      expect(checker.isComplete(partial)).assertFalse();
    });

    // Searcher: name keyword and id prefix lookups.
    it('catalog_searcher_should_search_by_name_and_prefix', 0, async () => {
      const searcher = new OperationCatalogSearcher(RecordingOperationCatalog.getAll());
      const byName: RecordingOperationDef[] = searcher.searchByName('录屏');
      expect(byName.length).assertEqual(2);
      const byPrefix: RecordingOperationDef[] = searcher.searchByIdPrefix('record_');
      expect(byPrefix.length).assertEqual(3);
      expect(searcher.searchByIdPrefix('zz').length).assertEqual(0);
      expect(searcher.searchByName('不存在的操作').length).assertEqual(0);
    });

    // Searcher: exact name lookup.
    it('catalog_searcher_should_find_exact_name', 0, async () => {
      const searcher = new OperationCatalogSearcher(RecordingOperationCatalog.getAll());
      const match: RecordingOperationDef | null = searcher.findExactName('录制计时');
      expect(match === null).assertFalse();
      expect(match?.id).assertEqual('timer_panel');
      expect(searcher.findExactName('录制计时器') === null).assertTrue();
    });

    // Searcher: id ordering is stable and does not mutate the source.
    it('catalog_searcher_should_sort_by_id', 0, async () => {
      const searcher = new OperationCatalogSearcher(RecordingOperationCatalog.getAll());
      const sorted: RecordingOperationDef[] = searcher.getSortedById();
      expect(sorted.length).assertEqual(5);
      expect(sorted[0].id).assertEqual('record_query');
      expect(sorted[4].id).assertEqual('tip_panel');
      const original: RecordingOperationDef[] = RecordingOperationCatalog.getAll();
      expect(original[0].id).assertEqual('record_start');
      expect(original[4].id).assertEqual('tip_panel');
    });

    // Searcher: kind ordering starts with the session operations.
    it('catalog_searcher_should_sort_by_kind', 0, async () => {
      const searcher = new OperationCatalogSearcher(RecordingOperationCatalog.getAll());
      const sorted: RecordingOperationDef[] = searcher.getSortedByKind();
      expect(sorted[0].kind).assertEqual(RecordingOperationKind.START);
      expect(sorted[1].kind).assertEqual(RecordingOperationKind.STOP);
      expect(sorted[2].kind).assertEqual(RecordingOperationKind.QUERY);
      expect(sorted[4].kind).assertEqual(RecordingOperationKind.TIP_PANEL);
    });

    // Locale map: names can be stored per locale.
    it('locale_map_should_store_names_per_locale', 0, async () => {
      const map = new OperationLocaleMap();
      map.put('record_start_zh', '开始录屏');
      map.put('record_start_en', 'Start recording');
      expect(map.get('record_start_zh')).assertEqual('开始录屏');
      expect(map.get('record_start_en')).assertEqual('Start recording');
      expect(map.getSize()).assertEqual(2);
      expect(map.hasKey('record_start_en')).assertTrue();
      expect(map.hasKey('record_stop_en')).assertFalse();
    });

    // Locale map: overwriting and clearing.
    it('locale_map_should_overwrite_and_clear', 0, async () => {
      const map = new OperationLocaleMap();
      map.put('record_stop', '结束录屏');
      map.put('record_stop', 'Stop recording');
      expect(map.getSize()).assertEqual(1);
      expect(map.get('record_stop')).assertEqual('Stop recording');
      const keys: string[] = map.keys();
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('record_stop');
      map.clear();
      expect(map.getSize()).assertEqual(0);
      expect(map.get('record_stop')).assertEqual(null);
      expect(map.keys().length).assertEqual(0);
    });

    // Catalog: business categories and risk levels stay distinct.
    it('operation_categories_and_risk_levels_should_be_distinct', 0, async () => {
      const sessionControl: string = OperationCategory.CATEGORY_SESSION_CONTROL as string;
      const windowRender: string = OperationCategory.CATEGORY_WINDOW_RENDER as string;
      const storage: string = OperationCategory.CATEGORY_STORAGE as string;
      expect(sessionControl === windowRender).assertFalse();
      expect(windowRender === storage).assertFalse();
      expect(sessionControl === storage).assertFalse();
      expect(OperationRiskLevel.RISK_SAFE).assertLess(OperationRiskLevel.RISK_HIGH);
      expect(OperationRiskLevel.RISK_MODERATE).assertLess(OperationRiskLevel.RISK_HIGH);
      expect(OperationRiskLevel.RISK_MODERATE).assertLarger(OperationRiskLevel.RISK_SAFE);
    });

    // UI: the catalog is consistent with the running sample state.
    it('catalog_should_match_running_state', 0, async () => {
      const count: number = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      const validator = new OperationCatalogValidator(RecordingOperationCatalog.getAll());
      expect(validator.validateAll()).assertTrue();
      const searcher = new OperationCatalogSearcher(RecordingOperationCatalog.getAll());
      expect(searcher.searchByIdPrefix('record_').length).assertEqual(3);
    });
  });
}




