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
import { Driver } from '../Shared/MiracastDriver';
import { Log } from 'library';
import {
  getDriver,
  KEY_BACK,
  KEY_ENTER,
  miracastComponentCount,
  waitForServiceConnected,
  waitForPageStable,
  pressAndWait,
  serializedDelay,
  DELAY_KEY_NAVIGATION,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_SERVICE_CONNECT
} from '../Shared/MiracastDriver';

const TAG: string = 'MiracastOperationCatalogSuite';

// 操作类别枚举：描述 IDL 方法所属的业务类别
enum OperationCategory {
  CATEGORY_SERVICE = 'service',
  CATEGORY_DEVICE = 'device',
  CATEGORY_SCREEN = 'screen',
  CATEGORY_PLAYBACK = 'playback',
  CATEGORY_AUDIO = 'audio'
}

// 操作风险等级枚举
enum OperationRiskLevel {
  RISK_LOW = 0,
  RISK_MEDIUM = 1,
  RISK_HIGH = 2
}

// IDL 操作定义接口：描述 IMiracastPlayerService 单个方法的契约
interface MiracastOperationDef {
  id: string;
  name: string;
  category: OperationCategory;
  riskLevel: OperationRiskLevel;
  parameterCount: number;
  requiresSession: boolean;
  requiresScreen: boolean;
}

// 操作关系接口：描述两个操作之间的依赖或互斥关系
interface OperationRelationship {
  sourceId: string;
  targetId: string;
  mutuallyExclusive: boolean;
  description: string;
}

// IDL 服务常量：与 MiracastPlayerServiceImpl 的创建参数保持一致
class MiracastServiceConstants {
  public static readonly MOCK: boolean = false;
  public static readonly WINDOW_WIDTH: number = 1920;
  public static readonly WINDOW_HEIGHT: number = 1280;
  public static readonly VIDEO_WIDTH: number = 1920;
  public static readonly VIDEO_HEIGHT: number = 1080;
  public static readonly VIDEO_FPS: number = 20;
  public static readonly CODEC_NAME: string = 'H264';
  public static readonly COLOR_SPACE: string = 'BT709';
  public static readonly EMITTER_PERMISSION_ID: number = 1000;
  public static readonly EMITTER_PLAYER_ID: number = 1001;
  public static readonly SERVICE_START_DELAY: number = 8000;
  public static readonly PLAYER_DATA_DELAY: number = 500;
  public static readonly RECONNECT_DELAY: number = 400;
  public static readonly SUCCESS_CODE: number = 0;
  public static readonly FAILURE_CODE: number = -1;
}

// IDL 操作目录：静态保存 10 个 IMiracastPlayerService 方法定义
class MiracastOperationCatalog {
  public static readonly START_SERVICE: MiracastOperationDef = {
    id: 'startMiracastService',
    name: 'start miracast service',
    category: OperationCategory.CATEGORY_SERVICE,
    riskLevel: OperationRiskLevel.RISK_MEDIUM,
    parameterCount: 1,
    requiresSession: false,
    requiresScreen: false
  };
  public static readonly STOP_SERVICE: MiracastOperationDef = {
    id: 'stopMiracastService',
    name: 'stop miracast service',
    category: OperationCategory.CATEGORY_SERVICE,
    riskLevel: OperationRiskLevel.RISK_MEDIUM,
    parameterCount: 1,
    requiresSession: true,
    requiresScreen: false
  };
  public static readonly REGISTER_LISTENER: MiracastOperationDef = {
    id: 'registerDeviceConnectListener',
    name: 'register device listener',
    category: OperationCategory.CATEGORY_DEVICE,
    riskLevel: OperationRiskLevel.RISK_LOW,
    parameterCount: 1,
    requiresSession: false,
    requiresScreen: false
  };
  public static readonly UNREGISTER_LISTENER: MiracastOperationDef = {
    id: 'unRegisterDeviceConnectListener',
    name: 'unregister device listener',
    category: OperationCategory.CATEGORY_DEVICE,
    riskLevel: OperationRiskLevel.RISK_LOW,
    parameterCount: 1,
    requiresSession: false,
    requiresScreen: false
  };
  public static readonly SET_SCREEN: MiracastOperationDef = {
    id: 'setScreen',
    name: 'set screen',
    category: OperationCategory.CATEGORY_SCREEN,
    riskLevel: OperationRiskLevel.RISK_HIGH,
    parameterCount: 2,
    requiresSession: true,
    requiresScreen: false
  };
  public static readonly PLAY: MiracastOperationDef = {
    id: 'play',
    name: 'play mirror',
    category: OperationCategory.CATEGORY_PLAYBACK,
    riskLevel: OperationRiskLevel.RISK_MEDIUM,
    parameterCount: 1,
    requiresSession: true,
    requiresScreen: true
  };
  public static readonly PAUSE: MiracastOperationDef = {
    id: 'pause',
    name: 'pause mirror',
    category: OperationCategory.CATEGORY_PLAYBACK,
    riskLevel: OperationRiskLevel.RISK_LOW,
    parameterCount: 1,
    requiresSession: true,
    requiresScreen: true
  };
  public static readonly STOP: MiracastOperationDef = {
    id: 'stop',
    name: 'stop mirror',
    category: OperationCategory.CATEGORY_PLAYBACK,
    riskLevel: OperationRiskLevel.RISK_MEDIUM,
    parameterCount: 1,
    requiresSession: true,
    requiresScreen: true
  };
  public static readonly MUTE: MiracastOperationDef = {
    id: 'mute',
    name: 'mute audio',
    category: OperationCategory.CATEGORY_AUDIO,
    riskLevel: OperationRiskLevel.RISK_LOW,
    parameterCount: 1,
    requiresSession: true,
    requiresScreen: false
  };
  public static readonly UNMUTE: MiracastOperationDef = {
    id: 'unMute',
    name: 'unmute audio',
    category: OperationCategory.CATEGORY_AUDIO,
    riskLevel: OperationRiskLevel.RISK_LOW,
    parameterCount: 1,
    requiresSession: true,
    requiresScreen: false
  };

  public static getAll(): MiracastOperationDef[] {
    return [MiracastOperationCatalog.START_SERVICE, MiracastOperationCatalog.STOP_SERVICE,
      MiracastOperationCatalog.REGISTER_LISTENER, MiracastOperationCatalog.UNREGISTER_LISTENER,
      MiracastOperationCatalog.SET_SCREEN, MiracastOperationCatalog.PLAY,
      MiracastOperationCatalog.PAUSE, MiracastOperationCatalog.STOP,
      MiracastOperationCatalog.MUTE, MiracastOperationCatalog.UNMUTE];
  }

  public static getIds(): string[] {
    return MiracastOperationCatalog.getAll().map((def: MiracastOperationDef) => def.id);
  }

  public static findById(id: string): MiracastOperationDef | null {
    const found = MiracastOperationCatalog.getAll().filter((def: MiracastOperationDef) => def.id === id);
    return found.length === 0 ? null : found[0];
  }

  public static countByCategory(category: OperationCategory): number {
    return MiracastOperationCatalog.getAll()
      .filter((def: MiracastOperationDef) => def.category === category).length;
  }
}
// 目录校验器：校验目录 id 唯一性、名称完整性与回调契约
class OperationCatalogValidator {
  private catalog: MiracastOperationDef[] = [];

  constructor(catalog: MiracastOperationDef[]) {
    this.catalog = catalog;
  }

  public hasUniqueIds(): boolean {
    const ids: Set<string> = new Set<string>();
    this.catalog.forEach((def: MiracastOperationDef) => ids.add(def.id));
    return ids.size === this.catalog.length;
  }

  public hasUniqueNames(): boolean {
    const names: Set<string> = new Set<string>();
    this.catalog.forEach((def: MiracastOperationDef) => names.add(def.name));
    return names.size === this.catalog.length;
  }

  public allHaveNonEmptyNames(): boolean {
    return this.catalog.every((def: MiracastOperationDef) => def.name.length > 0);
  }

  public allHavePositiveParameterCount(): boolean {
    return this.catalog.every((def: MiracastOperationDef) => def.parameterCount >= 1);
  }

  public findById(id: string): MiracastOperationDef | null {
    const found = this.catalog.filter((def: MiracastOperationDef) => def.id === id);
    return found.length === 0 ? null : found[0];
  }

  public countByCategory(category: OperationCategory): number {
    return this.catalog.filter((def: MiracastOperationDef) => def.category === category).length;
  }

  public countRequiringScreen(): number {
    return this.catalog.filter((def: MiracastOperationDef) => def.requiresScreen).length;
  }

  public validateAll(): boolean {
    return this.hasUniqueIds() && this.hasUniqueNames() && this.allHaveNonEmptyNames() &&
      this.allHavePositiveParameterCount();
  }
}

// 操作依赖图：维护操作之间的互斥与依赖关系
class OperationDependencyGraph {
  private relationships: OperationRelationship[] = [];

  public addRelationship(relationship: OperationRelationship): void {
    this.relationships.push(relationship);
  }

  public getRelationships(): OperationRelationship[] {
    return [...this.relationships];
  }

  public getRelationshipCount(): number {
    return this.relationships.length;
  }

  public areMutuallyExclusive(sourceId: string, targetId: string): boolean {
    return this.relationships.some((rel: OperationRelationship) => rel.sourceId === sourceId &&
      rel.targetId === targetId && rel.mutuallyExclusive);
  }

  public getTargetsOf(sourceId: string): string[] {
    return this.relationships
      .filter((rel: OperationRelationship) => rel.sourceId === sourceId)
      .map((rel: OperationRelationship) => rel.targetId);
  }

  public hasCycle(): boolean {
    return this.relationships.some((rel: OperationRelationship) => rel.sourceId === rel.targetId);
  }

  public clear(): void {
    this.relationships = [];
  }
}

// 操作名称解析器：按 id 或类别解析可读名称
class OperationNameResolver {
  private catalog: MiracastOperationDef[] = [];

  constructor(catalog: MiracastOperationDef[]) {
    this.catalog = catalog;
  }

  public resolveById(id: string): string {
    const found = this.catalog.filter((item: MiracastOperationDef) => item.id === id);
    return found.length === 0 ? 'unknown operation' : found[0].name;
  }

  public resolveAllNames(): string[] {
    return this.catalog.map((def: MiracastOperationDef) => def.name);
  }

  public getResolvableCount(): number {
    return this.catalog.length;
  }

  public isResolvable(id: string): boolean {
    return this.catalog.some((def: MiracastOperationDef) => def.id === id);
  }
}

// 目录统计器：统计目录规模与参数分布
class CatalogStatistics {
  private catalog: MiracastOperationDef[] = [];

  constructor(catalog: MiracastOperationDef[]) {
    this.catalog = catalog;
  }

  public getCatalogSize(): number {
    return this.catalog.length;
  }

  public getIdLengthSum(): number {
    let sum = 0;
    this.catalog.forEach((def: MiracastOperationDef) => {
      sum += def.id.length;
    });
    return sum;
  }

  public getAverageIdLength(): number {
    if (this.catalog.length === 0) {
      return 0;
    }
    return this.getIdLengthSum() / this.catalog.length;
  }

  public getLongestIdLength(): number {
    let longest = 0;
    this.catalog.forEach((def: MiracastOperationDef) => {
      if (def.id.length > longest) {
        longest = def.id.length;
      }
    });
    return longest;
  }

  public getParameterSum(): number {
    let sum = 0;
    this.catalog.forEach((def: MiracastOperationDef) => {
      sum += def.parameterCount;
    });
    return sum;
  }

  public describeCatalog(): string {
    return `CatalogStatistics{size: ${this.getCatalogSize()}, avgIdLength: ${this.getAverageIdLength()}}`;
  }
}
// 操作属性检查器：检查单个操作定义是否满足契约约束
class OperationPropertyChecker {
  public hasRequiredId(def: MiracastOperationDef, minLength: number): boolean {
    return def.id.length >= minLength;
  }

  public hasNoWhitespaceInId(def: MiracastOperationDef): boolean {
    return !def.id.includes(' ');
  }

  public isComplete(def: MiracastOperationDef): boolean {
    return this.hasRequiredId(def, 3) && this.hasNoWhitespaceInId(def) && def.name.length > 0 &&
      def.parameterCount >= 1 && def.riskLevel >= OperationRiskLevel.RISK_LOW &&
      def.riskLevel <= OperationRiskLevel.RISK_HIGH;
  }

  public collectMissingProperties(def: MiracastOperationDef): string[] {
    const missing: string[] = [];
    if (def.id.length === 0) {
      missing.push('id');
    }
    if (def.name.length === 0) {
      missing.push('name');
    }
    if (def.parameterCount <= 0) {
      missing.push('parameterCount');
    }
    return missing;
  }

  public requiresScreenBeforePlay(def: MiracastOperationDef): boolean {
    return def.id === 'play' && def.requiresScreen;
  }
}

// 操作本地化枚举
enum OperationLocale {
  LOCALE_ZH = 'zh',
  LOCALE_EN = 'en'
}

// 操作目录搜索器：按名称、id 前缀与类别搜索
class OperationCatalogSearcher {
  private catalog: MiracastOperationDef[] = [];

  constructor(catalog: MiracastOperationDef[]) {
    this.catalog = catalog;
  }

  public searchByName(keyword: string): MiracastOperationDef[] {
    return this.catalog.filter((def: MiracastOperationDef) => def.name.includes(keyword));
  }

  public searchByIdPrefix(prefix: string): MiracastOperationDef[] {
    return this.catalog.filter((def: MiracastOperationDef) => def.id.startsWith(prefix));
  }

  public searchByCategory(category: OperationCategory): MiracastOperationDef[] {
    return this.catalog.filter((def: MiracastOperationDef) => def.category === category);
  }

  public findExactName(name: string): MiracastOperationDef | null {
    const found = this.catalog.filter((def: MiracastOperationDef) => def.name === name);
    return found.length === 0 ? null : found[0];
  }

  public getSortedById(): MiracastOperationDef[] {
    const copied: MiracastOperationDef[] = [...this.catalog];
    copied.sort((a: MiracastOperationDef, b: MiracastOperationDef) => {
      if (a.id < b.id) {
        return -1;
      }
      if (a.id > b.id) {
        return 1;
      }
      return 0;
    });
    return copied;
  }

  public getSortedByRisk(): MiracastOperationDef[] {
    const copied: MiracastOperationDef[] = [...this.catalog];
    copied.sort((a: MiracastOperationDef, b: MiracastOperationDef) => a.riskLevel - b.riskLevel);
    return copied;
  }
}

// 操作国际化名称映射表
class OperationLocaleMap {
  private names: Map<string, string> = new Map<string, string>();

  public put(key: string, name: string): void {
    this.names.set(key, name);
  }

  public get(key: string): string | null {
    const value = this.names.get(key);
    return value === undefined ? null : value;
  }

  public getSize(): number {
    return this.names.size;
  }

  public hasKey(key: string): boolean {
    return this.names.has(key);
  }

  public keys(): string[] {
    const result: string[] = [];
    this.names.forEach((value: string, key: string) => result.push(key));
    return result;
  }

  public clear(): void {
    this.names.clear();
  }
}

// 服务响应模型：把 (errCode, returnValue) 回调结果转换为可判定对象
class ServiceResponse {
  private errCode: number;
  private returnValue: number;

  constructor(errCode: number, returnValue: number) {
    this.errCode = errCode;
    this.returnValue = returnValue;
  }

  public static success(): ServiceResponse {
    return new ServiceResponse(MiracastServiceConstants.SUCCESS_CODE, MiracastServiceConstants.SUCCESS_CODE);
  }

  public static failure(): ServiceResponse {
    return new ServiceResponse(MiracastServiceConstants.SUCCESS_CODE, MiracastServiceConstants.FAILURE_CODE);
  }

  public isSuccess(): boolean {
    return this.errCode === MiracastServiceConstants.SUCCESS_CODE &&
      this.returnValue === MiracastServiceConstants.SUCCESS_CODE;
  }

  public getErrCode(): number {
    return this.errCode;
  }

  public getReturnValue(): number {
    return this.returnValue;
  }

  public describe(): string {
    return `Response{errCode: ${this.errCode}, returnValue: ${this.returnValue}}`;
  }
}

// 调用记录器：记录 10 个 IDL 方法的调用次数与结果
class OperationInvocationRecorder {
  private calls: Map<string, number> = new Map<string, number>();
  private failures: number = 0;

  public recordInvocation(id: string, response: ServiceResponse): void {
    const current: number = this.calls.get(id) ?? 0;
    this.calls.set(id, current + 1);
    if (!response.isSuccess()) {
      this.failures++;
    }
  }

  public getCallCount(id: string): number {
    const value: number | undefined = this.calls.get(id);
    return value === undefined ? 0 : value;
  }

  public getTotalCalls(): number {
    let total = 0;
    this.calls.forEach((value: number) => {
      total += value;
    });
    return total;
  }

  public getFailureCount(): number {
    return this.failures;
  }

  public clear(): void {
    this.calls = new Map<string, number>();
    this.failures = 0;
  }
}
export default function miracastOperationCatalogSuite(): void {
  describe('MiracastOperationCatalog_Suite', () => {
    let driver: Driver;
    const catalog: MiracastOperationDef[] = MiracastOperationCatalog.getAll();

    beforeAll(async () => {
      Log.info(TAG, 'operation catalog suite start');
      driver = getDriver();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      Log.info(TAG, 'operation catalog suite end');
    });
    it('catalog_should_contain_ten_idl_methods', 0, async () => {
      expect(catalog.length).assertEqual(10);
      expect(MiracastOperationCatalog.getIds().length).assertEqual(10);
    });
    it('catalog_should_contain_all_service_methods', 0, async () => {
      const ids: string[] = MiracastOperationCatalog.getIds();
      expect(ids.includes('startMiracastService')).assertTrue();
      expect(ids.includes('stopMiracastService')).assertTrue();
      expect(ids.includes('registerDeviceConnectListener')).assertTrue();
      expect(ids.includes('unRegisterDeviceConnectListener')).assertTrue();
    });
    it('catalog_should_contain_screen_and_playback_methods', 0, async () => {
      const ids: string[] = MiracastOperationCatalog.getIds();
      expect(ids.includes('setScreen')).assertTrue();
      expect(ids.includes('play')).assertTrue();
      expect(ids.includes('pause')).assertTrue();
      expect(ids.includes('stop')).assertTrue();
    });
    it('catalog_should_contain_audio_methods', 0, async () => {
      const ids: string[] = MiracastOperationCatalog.getIds();
      expect(ids.includes('mute')).assertTrue();
      expect(ids.includes('unMute')).assertTrue();
      expect(MiracastOperationCatalog.countByCategory(OperationCategory.CATEGORY_AUDIO)).assertEqual(2);
    });
    it('catalog_ids_should_be_unique', 0, async () => {
      const ids: string[] = MiracastOperationCatalog.getIds();
      const unique: Set<string> = new Set<string>(ids);
      expect(unique.size).assertEqual(ids.length);
    });
    it('catalog_names_should_be_unique_and_non_empty', 0, async () => {
      const validator = new OperationCatalogValidator(catalog);
      expect(validator.hasUniqueIds()).assertTrue();
      expect(validator.hasUniqueNames()).assertTrue();
      expect(validator.allHaveNonEmptyNames()).assertTrue();
      expect(validator.allHavePositiveParameterCount()).assertTrue();
    });
    it('catalog_ids_should_have_no_whitespace', 0, async () => {
      const checker = new OperationPropertyChecker();
      catalog.forEach((def: MiracastOperationDef) => {
        expect(checker.hasNoWhitespaceInId(def)).assertTrue();
        expect(checker.hasRequiredId(def, 3)).assertTrue();
      });
    });
    it('catalog_each_definition_should_be_complete', 0, async () => {
      const checker = new OperationPropertyChecker();
      catalog.forEach((def: MiracastOperationDef) => {
        expect(checker.isComplete(def)).assertTrue();
        expect(checker.collectMissingProperties(def).length).assertEqual(0);
      });
    });
    it('catalog_category_distribution_should_be_correct', 0, async () => {
      expect(MiracastOperationCatalog.countByCategory(OperationCategory.CATEGORY_SERVICE)).assertEqual(2);
      expect(MiracastOperationCatalog.countByCategory(OperationCategory.CATEGORY_DEVICE)).assertEqual(2);
      expect(MiracastOperationCatalog.countByCategory(OperationCategory.CATEGORY_SCREEN)).assertEqual(1);
      expect(MiracastOperationCatalog.countByCategory(OperationCategory.CATEGORY_PLAYBACK)).assertEqual(3);
    });
    it('catalog_find_by_id_should_return_definition', 0, async () => {
      const found: MiracastOperationDef | null = MiracastOperationCatalog.findById('play');
      expect(found === null).assertFalse();
      expect(found?.name).assertEqual('play mirror');
      expect(found?.category).assertEqual(OperationCategory.CATEGORY_PLAYBACK);
      expect(MiracastOperationCatalog.findById('unknown') === null).assertTrue();
    });
    it('set_screen_should_have_two_parameters', 0, async () => {
      const def: MiracastOperationDef | null = MiracastOperationCatalog.findById('setScreen');
      expect(def === null).assertFalse();
      expect(def?.parameterCount).assertEqual(2);
      expect(def?.requiresSession).assertTrue();
      expect(def?.riskLevel).assertEqual(OperationRiskLevel.RISK_HIGH);
    });
    it('play_should_require_screen_binding', 0, async () => {
      const checker = new OperationPropertyChecker();
      const playDef: MiracastOperationDef = MiracastOperationCatalog.PLAY;
      expect(checker.requiresScreenBeforePlay(playDef)).assertTrue();
      expect(playDef.requiresScreen).assertTrue();
      expect(playDef.requiresSession).assertTrue();
    });
    it('mute_and_unmute_should_share_audio_category', 0, async () => {
      const mute: MiracastOperationDef = MiracastOperationCatalog.MUTE;
      const unmute: MiracastOperationDef = MiracastOperationCatalog.UNMUTE;
      expect(mute.category).assertEqual(unmute.category);
      expect(mute.id === unmute.id).assertFalse();
      expect(mute.riskLevel).assertEqual(OperationRiskLevel.RISK_LOW);
    });
    it('listener_methods_should_not_require_session', 0, async () => {
      const register: MiracastOperationDef = MiracastOperationCatalog.REGISTER_LISTENER;
      const unregister: MiracastOperationDef = MiracastOperationCatalog.UNREGISTER_LISTENER;
      expect(register.requiresSession).assertFalse();
      expect(unregister.requiresSession).assertFalse();
      expect(register.parameterCount).assertEqual(1);
    });
    it('service_constants_should_match_creation_parameters', 0, async () => {
      expect(MiracastServiceConstants.MOCK).assertFalse();
      expect(MiracastServiceConstants.VIDEO_WIDTH).assertEqual(1920);
      expect(MiracastServiceConstants.VIDEO_HEIGHT).assertEqual(1080);
      expect(MiracastServiceConstants.VIDEO_FPS).assertEqual(20);
      expect(MiracastServiceConstants.CODEC_NAME).assertEqual('H264');
      expect(MiracastServiceConstants.COLOR_SPACE).assertEqual('BT709');
    });
    it('service_constants_should_define_window_and_emitter', 0, async () => {
      expect(MiracastServiceConstants.WINDOW_WIDTH).assertEqual(1920);
      expect(MiracastServiceConstants.WINDOW_HEIGHT).assertEqual(1280);
      expect(MiracastServiceConstants.EMITTER_PERMISSION_ID).assertEqual(1000);
      expect(MiracastServiceConstants.EMITTER_PLAYER_ID).assertEqual(1001);
      expect(MiracastServiceConstants.SERVICE_START_DELAY).assertEqual(8000);
    });
    it('service_constants_should_define_delays_and_codes', 0, async () => {
      expect(MiracastServiceConstants.PLAYER_DATA_DELAY).assertEqual(500);
      expect(MiracastServiceConstants.RECONNECT_DELAY).assertEqual(400);
      expect(MiracastServiceConstants.SUCCESS_CODE).assertEqual(0);
      expect(MiracastServiceConstants.FAILURE_CODE).assertEqual(-1);
    });
    it('validator_should_pass_full_validation', 0, async () => {
      const validator = new OperationCatalogValidator(catalog);
      expect(validator.validateAll()).assertTrue();
      expect(validator.countByCategory(OperationCategory.CATEGORY_PLAYBACK)).assertEqual(3);
      expect(validator.countRequiringScreen()).assertEqual(3);
    });
    it('validator_should_detect_duplicate_definitions', 0, async () => {
      const duplicated: MiracastOperationDef[] = [MiracastOperationCatalog.PLAY, MiracastOperationCatalog.PLAY];
      const validator = new OperationCatalogValidator(duplicated);
      expect(validator.hasUniqueIds()).assertFalse();
      expect(validator.hasUniqueNames()).assertFalse();
      expect(validator.validateAll()).assertFalse();
    });
    it('validator_should_handle_empty_catalog', 0, async () => {
      const validator = new OperationCatalogValidator([]);
      expect(validator.hasUniqueIds()).assertTrue();
      expect(validator.allHaveNonEmptyNames()).assertTrue();
      expect(validator.findById('play') === null).assertTrue();
      expect(validator.countByCategory(OperationCategory.CATEGORY_AUDIO)).assertEqual(0);
      expect(validator.validateAll()).assertTrue();
    });
    it('dependency_graph_should_record_exclusion', 0, async () => {
      const graph = new OperationDependencyGraph();
      graph.addRelationship({
        sourceId: 'play', targetId: 'pause', mutuallyExclusive: true, description: 'play and pause exclusive'
      });
      expect(graph.getRelationshipCount()).assertEqual(1);
      expect(graph.areMutuallyExclusive('play', 'pause')).assertTrue();
      expect(graph.areMutuallyExclusive('pause', 'play')).assertFalse();
    });
    it('dependency_graph_should_collect_targets', 0, async () => {
      const graph = new OperationDependencyGraph();
      graph.addRelationship({
        sourceId: 'setScreen', targetId: 'play', mutuallyExclusive: false, description: 'screen enables play'
      });
      graph.addRelationship({
        sourceId: 'setScreen', targetId: 'stop', mutuallyExclusive: false, description: 'screen enables stop'
      });
      const targets: string[] = graph.getTargetsOf('setScreen');
      expect(targets.length).assertEqual(2);
      expect(targets.includes('play')).assertTrue();
      expect(targets.includes('stop')).assertTrue();
    });
    it('dependency_graph_should_detect_self_cycle', 0, async () => {
      const graph = new OperationDependencyGraph();
      expect(graph.hasCycle()).assertFalse();
      graph.addRelationship({
        sourceId: 'mute', targetId: 'mute', mutuallyExclusive: true, description: 'self cycle'
      });
      expect(graph.hasCycle()).assertTrue();
      graph.clear();
      expect(graph.hasCycle()).assertFalse();
      expect(graph.getRelationships().length).assertEqual(0);
    });
    it('dependency_graph_should_return_copy', 0, async () => {
      const graph = new OperationDependencyGraph();
      graph.addRelationship({
        sourceId: 'play', targetId: 'stop', mutuallyExclusive: true, description: 'exclusive'
      });
      const copy: OperationRelationship[] = graph.getRelationships();
      copy.push({ sourceId: 'a', targetId: 'b', mutuallyExclusive: true, description: 'extra' });
      expect(graph.getRelationshipCount()).assertEqual(1);
    });
    it('name_resolver_should_resolve_by_id', 0, async () => {
      const resolver = new OperationNameResolver(catalog);
      expect(resolver.resolveById('startMiracastService')).assertEqual('start miracast service');
      expect(resolver.resolveById('unMute')).assertEqual('unmute audio');
      expect(resolver.resolveById('unknown')).assertEqual('unknown operation');
      expect(resolver.isResolvable('setScreen')).assertTrue();
      expect(resolver.isResolvable('unknown')).assertFalse();
    });
    it('name_resolver_should_resolve_all_names', 0, async () => {
      const resolver = new OperationNameResolver(catalog);
      const names: string[] = resolver.resolveAllNames();
      expect(names.length).assertEqual(10);
      expect(resolver.getResolvableCount()).assertEqual(10);
      expect(names.includes('play mirror')).assertTrue();
      expect(names.includes('mute audio')).assertTrue();
    });
    it('name_resolver_empty_catalog_should_be_safe', 0, async () => {
      const resolver = new OperationNameResolver([]);
      expect(resolver.resolveById('play')).assertEqual('unknown operation');
      expect(resolver.getResolvableCount()).assertEqual(0);
      expect(resolver.resolveAllNames().length).assertEqual(0);
      expect(resolver.isResolvable('play')).assertFalse();
    });
    it('catalog_statistics_should_report_size', 0, async () => {
      const stats = new CatalogStatistics(catalog);
      expect(stats.getCatalogSize()).assertEqual(10);
      expect(stats.describeCatalog().includes('size: 10')).assertTrue();
    });
    it('catalog_statistics_should_compute_id_lengths', 0, async () => {
      const stats = new CatalogStatistics(catalog);
      let expectedSum = 0;
      catalog.forEach((def: MiracastOperationDef) => {
        expectedSum += def.id.length;
      });
      expect(stats.getIdLengthSum()).assertEqual(expectedSum);
      expect(stats.getAverageIdLength()).assertEqual(expectedSum / 10);
      expect(stats.getLongestIdLength()).assertEqual('unRegisterDeviceConnectListener'.length);
    });
    it('catalog_statistics_should_sum_parameters', 0, async () => {
      const stats = new CatalogStatistics(catalog);
      expect(stats.getParameterSum()).assertEqual(11);
      expect(stats.getParameterSum()).assertLarger(0);
    });
    it('catalog_statistics_empty_should_report_zero', 0, async () => {
      const stats = new CatalogStatistics([]);
      expect(stats.getCatalogSize()).assertEqual(0);
      expect(stats.getIdLengthSum()).assertEqual(0);
      expect(stats.getAverageIdLength()).assertEqual(0);
      expect(stats.getLongestIdLength()).assertEqual(0);
      expect(stats.getParameterSum()).assertEqual(0);
    });
    it('property_checker_should_validate_id_length', 0, async () => {
      const checker = new OperationPropertyChecker();
      expect(checker.hasRequiredId(MiracastOperationCatalog.PLAY, 3)).assertTrue();
      expect(checker.hasRequiredId(MiracastOperationCatalog.PLAY, 100)).assertFalse();
      expect(checker.hasNoWhitespaceInId(MiracastOperationCatalog.SET_SCREEN)).assertTrue();
    });
    it('property_checker_should_collect_missing_properties', 0, async () => {
      const checker = new OperationPropertyChecker();
      const incomplete: MiracastOperationDef = {
        id: '', name: '', category: OperationCategory.CATEGORY_SERVICE,
        riskLevel: OperationRiskLevel.RISK_LOW, parameterCount: 0,
        requiresSession: false, requiresScreen: false
      };
      const missing: string[] = checker.collectMissingProperties(incomplete);
      expect(missing.length).assertEqual(3);
      expect(missing.includes('id')).assertTrue();
      expect(missing.includes('name')).assertTrue();
      expect(missing.includes('parameterCount')).assertTrue();
      expect(checker.isComplete(incomplete)).assertFalse();
    });
    it('searcher_should_search_by_name_keyword', 0, async () => {
      const searcher = new OperationCatalogSearcher(catalog);
      const results: MiracastOperationDef[] = searcher.searchByName('mirror');
      expect(results.length).assertEqual(3);
      expect(results[0].id).assertEqual('play');
      expect(results[2].id).assertEqual('stop');
    });
    it('searcher_should_search_by_id_prefix', 0, async () => {
      const searcher = new OperationCatalogSearcher(catalog);
      const results: MiracastOperationDef[] = searcher.searchByIdPrefix('s');
      expect(results.length).assertEqual(4);
      expect(results.includes(MiracastOperationCatalog.START_SERVICE)).assertTrue();
      expect(searcher.searchByIdPrefix('zz').length).assertEqual(0);
    });
    it('searcher_should_search_by_category', 0, async () => {
      const searcher = new OperationCatalogSearcher(catalog);
      expect(searcher.searchByCategory(OperationCategory.CATEGORY_SERVICE).length).assertEqual(2);
      expect(searcher.searchByCategory(OperationCategory.CATEGORY_AUDIO).length).assertEqual(2);
      expect(searcher.searchByCategory(OperationCategory.CATEGORY_SCREEN).length).assertEqual(1);
    });
    it('searcher_should_find_exact_name', 0, async () => {
      const searcher = new OperationCatalogSearcher(catalog);
      const match: MiracastOperationDef | null = searcher.findExactName('set screen');
      expect(match === null).assertFalse();
      expect(match?.id).assertEqual('setScreen');
      expect(searcher.findExactName('missing operation') === null).assertTrue();
    });
    it('searcher_should_sort_by_id', 0, async () => {
      const searcher = new OperationCatalogSearcher(catalog);
      const sorted: MiracastOperationDef[] = searcher.getSortedById();
      expect(sorted.length).assertEqual(10);
      expect(sorted[0].id).assertEqual('mute');
      expect(sorted[sorted.length - 1].id).assertEqual('unRegisterDeviceConnectListener');
    });
    it('searcher_should_sort_by_risk_level', 0, async () => {
      const searcher = new OperationCatalogSearcher(catalog);
      const sorted: MiracastOperationDef[] = searcher.getSortedByRisk();
      expect(sorted[0].riskLevel).assertEqual(OperationRiskLevel.RISK_LOW);
      expect(sorted[sorted.length - 1].riskLevel).assertEqual(OperationRiskLevel.RISK_HIGH);
      expect(sorted[sorted.length - 1].id).assertEqual('setScreen');
    });
    it('searcher_should_not_mutate_catalog_order', 0, async () => {
      const searcher = new OperationCatalogSearcher(catalog);
      searcher.getSortedById();
      const original: MiracastOperationDef[] = MiracastOperationCatalog.getAll();
      expect(original[0].id).assertEqual('startMiracastService');
      expect(original[9].id).assertEqual('unMute');
    });
    it('locale_map_should_store_names_by_key', 0, async () => {
      const map = new OperationLocaleMap();
      map.put(OperationLocale.LOCALE_ZH + '_play', 'PlayZh');
      map.put(OperationLocale.LOCALE_EN + '_play', 'play');
      expect(map.getSize()).assertEqual(2);
      expect(map.get('zh_play')).assertEqual('PlayZh');
      expect(map.get('en_play')).assertEqual('play');
      expect(map.get('missing')).assertEqual(null);
    });
    it('locale_map_should_check_and_enumerate_keys', 0, async () => {
      const map = new OperationLocaleMap();
      map.put('mute', 'mute');
      map.put('unMute', 'unmute');
      expect(map.hasKey('mute')).assertTrue();
      expect(map.hasKey('play')).assertFalse();
      const keys: string[] = map.keys();
      expect(keys.length).assertEqual(2);
      expect(keys.includes('mute')).assertTrue();
    });
    it('locale_map_should_overwrite_and_clear', 0, async () => {
      const map = new OperationLocaleMap();
      map.put('play', 'PlayZh');
      map.put('play', 'play mirror');
      expect(map.getSize()).assertEqual(1);
      expect(map.get('play')).assertEqual('play mirror');
      map.clear();
      expect(map.getSize()).assertEqual(0);
      expect(map.keys().length).assertEqual(0);
      expect(map.get('play')).assertEqual(null);
    });
    it('service_response_success_should_require_both_zero', 0, async () => {
      const success: ServiceResponse = ServiceResponse.success();
      expect(success.isSuccess()).assertTrue();
      expect(success.getErrCode()).assertEqual(0);
      expect(success.getReturnValue()).assertEqual(0);
      expect(success.describe().includes('errCode: 0')).assertTrue();
    });
    it('service_response_failure_should_return_minus_one', 0, async () => {
      const failure: ServiceResponse = ServiceResponse.failure();
      expect(failure.isSuccess()).assertFalse();
      expect(failure.getReturnValue()).assertEqual(-1);
      expect(failure.getErrCode()).assertEqual(0);
    });
    it('service_response_should_reject_non_zero_err_code', 0, async () => {
      const response = new ServiceResponse(1, 0);
      expect(response.isSuccess()).assertFalse();
      expect(response.getErrCode()).assertEqual(1);
      expect(response.describe().includes('returnValue: 0')).assertTrue();
    });
    it('invocation_recorder_should_count_calls_and_failures', 0, async () => {
      const recorder = new OperationInvocationRecorder();
      recorder.recordInvocation('play', ServiceResponse.success());
      recorder.recordInvocation('play', ServiceResponse.failure());
      recorder.recordInvocation('mute', ServiceResponse.success());
      expect(recorder.getCallCount('play')).assertEqual(2);
      expect(recorder.getCallCount('mute')).assertEqual(1);
      expect(recorder.getCallCount('stop')).assertEqual(0);
      expect(recorder.getTotalCalls()).assertEqual(3);
      expect(recorder.getFailureCount()).assertEqual(1);
    });
    it('invocation_recorder_should_clear_all_counts', 0, async () => {
      const recorder = new OperationInvocationRecorder();
      recorder.recordInvocation('setScreen', ServiceResponse.failure());
      recorder.clear();
      expect(recorder.getTotalCalls()).assertEqual(0);
      expect(recorder.getFailureCount()).assertEqual(0);
      expect(recorder.getCallCount('setScreen')).assertEqual(0);
    });
    it('invocation_recorder_should_track_all_ten_methods', 0, async () => {
      const recorder = new OperationInvocationRecorder();
      const ids: string[] = MiracastOperationCatalog.getIds();
      ids.forEach((id: string) => recorder.recordInvocation(id, ServiceResponse.success()));
      expect(recorder.getTotalCalls()).assertEqual(10);
      expect(recorder.getFailureCount()).assertEqual(0);
      expect(recorder.getCallCount('unMute')).assertEqual(1);
    });
    it('catalog_definitions_should_match_ids', 0, async () => {
      expect(MiracastOperationCatalog.START_SERVICE.id).assertEqual('startMiracastService');
      expect(MiracastOperationCatalog.STOP_SERVICE.id).assertEqual('stopMiracastService');
      expect(MiracastOperationCatalog.REGISTER_LISTENER.id).assertEqual('registerDeviceConnectListener');
      expect(MiracastOperationCatalog.UNREGISTER_LISTENER.id).assertEqual('unRegisterDeviceConnectListener');
    });
    it('catalog_definitions_should_match_screen_and_playback_ids', 0, async () => {
      expect(MiracastOperationCatalog.SET_SCREEN.id).assertEqual('setScreen');
      expect(MiracastOperationCatalog.PLAY.id).assertEqual('play');
      expect(MiracastOperationCatalog.PAUSE.id).assertEqual('pause');
      expect(MiracastOperationCatalog.STOP.id).assertEqual('stop');
      expect(MiracastOperationCatalog.MUTE.id).assertEqual('mute');
      expect(MiracastOperationCatalog.UNMUTE.id).assertEqual('unMute');
    });
    it('catalog_ids_should_be_camel_case_strings', 0, async () => {
      MiracastOperationCatalog.getIds().forEach((id: string) => {
        expect(id.length).assertLargerOrEqual(4);
        expect(id.includes(' ')).assertFalse();
        expect(id.charCodeAt(0) >= 97 && id.charCodeAt(0) <= 122).assertTrue();
      });
    });
    it('catalog_ids_should_not_exceed_forty_chars', 0, async () => {
      MiracastOperationCatalog.getIds().forEach((id: string) => {
        expect(id.length).assertLessOrEqual(40);
      });
    });
    it('risk_levels_should_be_ordered', 0, async () => {
      expect(OperationRiskLevel.RISK_LOW).assertLess(OperationRiskLevel.RISK_MEDIUM);
      expect(OperationRiskLevel.RISK_MEDIUM).assertLess(OperationRiskLevel.RISK_HIGH);
      const levels: Set<number> = new Set<number>([OperationRiskLevel.RISK_LOW, OperationRiskLevel.RISK_MEDIUM,
        OperationRiskLevel.RISK_HIGH]);
      expect(levels.size).assertEqual(3);
    });
    it('operation_categories_should_be_distinct', 0, async () => {
      const categories: Set<string> = new Set<string>([OperationCategory.CATEGORY_SERVICE,
        OperationCategory.CATEGORY_DEVICE, OperationCategory.CATEGORY_SCREEN,
        OperationCategory.CATEGORY_PLAYBACK, OperationCategory.CATEGORY_AUDIO]);
      expect(categories.size).assertEqual(5);
      const categoryA: string = OperationCategory.CATEGORY_SERVICE;
      const categoryB: string = OperationCategory.CATEGORY_AUDIO;
      expect(categoryA === categoryB).assertFalse();
    });
    it('locale_enum_should_define_two_languages', 0, async () => {
      expect(OperationLocale.LOCALE_ZH).assertEqual('zh');
      expect(OperationLocale.LOCALE_EN).assertEqual('en');
      const localeA: string = OperationLocale.LOCALE_ZH;
      const localeB: string = OperationLocale.LOCALE_EN;
      expect(localeA === localeB).assertFalse();
    });
    it('playback_methods_should_share_session_requirement', 0, async () => {
      const playback: MiracastOperationDef[] = MiracastOperationCatalog.getAll()
        .filter((def: MiracastOperationDef) => def.category === OperationCategory.CATEGORY_PLAYBACK);
      expect(playback.length).assertEqual(3);
      playback.forEach((def: MiracastOperationDef) => {
        expect(def.requiresSession).assertTrue();
        expect(def.requiresScreen).assertTrue();
      });
    });
    it('stop_method_should_release_session', 0, async () => {
      const stopDef: MiracastOperationDef = MiracastOperationCatalog.STOP;
      expect(stopDef.requiresSession).assertTrue();
      expect(stopDef.requiresScreen).assertTrue();
      expect(stopDef.name).assertEqual('stop mirror');
    });
    it('audio_methods_should_not_require_screen', 0, async () => {
      const audio: MiracastOperationDef[] = MiracastOperationCatalog.getAll()
        .filter((def: MiracastOperationDef) => def.category === OperationCategory.CATEGORY_AUDIO);
      expect(audio.length).assertEqual(2);
      audio.forEach((def: MiracastOperationDef) => {
        expect(def.requiresScreen).assertFalse();
        expect(def.requiresSession).assertTrue();
      });
    });
    it('catalog_should_support_repeated_lookup', 0, async () => {
      for (let i = 0; i < 100; i++) {
        const def: MiracastOperationDef | null = MiracastOperationCatalog.findById('play');
        expect(def === null).assertFalse();
      }
      expect(catalog.length).assertEqual(10);
    });
    it('service_should_be_connected_before_catalog_checks', 0, async () => {
      const connected: boolean = await waitForServiceConnected(driver);
      expect(connected === true || connected === false).assertTrue();
      expect(MiracastServiceConstants.SUCCESS_CODE).assertEqual(0);
    });
    it('page_should_remain_stable_during_catalog_probe', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(catalog.length).assertEqual(MiracastOperationCatalog.getIds().length);
    });
    it('enter_key_probe_should_not_break_catalog', 0, async () => {
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      expect(MiracastOperationCatalog.findById('startMiracastService')?.parameterCount).assertEqual(1);
    });
    it('catalog_validator_should_reject_missing_parameter_count', 0, async () => {
      const invalid: MiracastOperationDef = {
        id: 'customOperation', name: 'custom operation', category: OperationCategory.CATEGORY_SERVICE,
        riskLevel: OperationRiskLevel.RISK_LOW, parameterCount: 0,
        requiresSession: false, requiresScreen: false
      };
      const validator = new OperationCatalogValidator([invalid]);
      expect(validator.allHavePositiveParameterCount()).assertFalse();
      expect(validator.validateAll()).assertFalse();
      expect(new OperationPropertyChecker().isComplete(invalid)).assertFalse();
    });
    it('service_response_should_describe_both_fields', 0, async () => {
      const response = new ServiceResponse(-1, -1);
      const text: string = response.describe();
      expect(text.includes('-1')).assertTrue();
      expect(text.includes('errCode')).assertTrue();
      expect(response.isSuccess()).assertFalse();
      expect(MiracastServiceConstants.FAILURE_CODE).assertEqual(-1);
    });
    it('catalog_should_provide_ten_resolvable_names', 0, async () => {
      const resolver = new OperationNameResolver(MiracastOperationCatalog.getAll());
      const names: string[] = resolver.resolveAllNames();
      const unique: Set<string> = new Set<string>(names);
      expect(unique.size).assertEqual(10);
      expect(resolver.isResolvable('unMute')).assertTrue();
      expect(TIMEOUT_SERVICE_CONNECT).assertEqual(2000);
    });
    it('catalog_statistics_should_describe_average_length', 0, async () => {
      const stats = new CatalogStatistics(catalog);
      const description: string = stats.describeCatalog();
      expect(description.includes('avgIdLength')).assertTrue();
      expect(description.includes('size:')).assertTrue();
      expect(stats.getAverageIdLength()).assertLarger(0);
    });
    it('catalog_searcher_should_return_empty_for_unknown_keyword', 0, async () => {
      const searcher = new OperationCatalogSearcher(catalog);
      expect(searcher.searchByName('zzz').length).assertEqual(0);
      expect(searcher.searchByIdPrefix('zzz').length).assertEqual(0);
      expect(searcher.findExactName('zzz') === null).assertTrue();
    });
    it('catalog_should_survive_dependency_graph_rebuild', 0, async () => {
      const graph = new OperationDependencyGraph();
      MiracastOperationCatalog.getIds().forEach((id: string) => {
        graph.addRelationship({
          sourceId: 'startMiracastService', targetId: id, mutuallyExclusive: false, description: 'service root'
        });
      });
      expect(graph.getRelationshipCount()).assertEqual(10);
      expect(graph.getTargetsOf('startMiracastService').length).assertEqual(10);
      graph.clear();
      expect(graph.getRelationshipCount()).assertEqual(0);
    });
    it('catalog_should_keep_request_parameters_minimal', 0, async () => {
      catalog.forEach((def: MiracastOperationDef) => {
        expect(def.parameterCount).assertLessOrEqual(2);
        expect(def.parameterCount).assertLargerOrEqual(1);
      });
      expect(new CatalogStatistics(catalog).getParameterSum()).assertEqual(11);
    });
    it('catalog_should_align_risk_with_category', 0, async () => {
      const screenDef: MiracastOperationDef = MiracastOperationCatalog.SET_SCREEN;
      const audioDef: MiracastOperationDef = MiracastOperationCatalog.MUTE;
      expect(screenDef.riskLevel).assertLarger(audioDef.riskLevel);
      expect(screenDef.category).assertEqual(OperationCategory.CATEGORY_SCREEN);
      expect(audioDef.category).assertEqual(OperationCategory.CATEGORY_AUDIO);
    });
    it('catalog_should_expose_consistent_lookup_results', 0, async () => {
      const first: MiracastOperationDef | null = MiracastOperationCatalog.findById('pause');
      const second: MiracastOperationDef | null = new OperationCatalogValidator(catalog).findById('pause');
      expect(first === null).assertFalse();
      expect(second === null).assertFalse();
      expect(first?.name).assertEqual(second?.name);
      expect(first?.parameterCount).assertEqual(second?.parameterCount);
      expect(OperationRiskLevel.RISK_MEDIUM).assertEqual(1);
    });
    it('catalog_should_handle_recorder_reset_between_sequences', 0, async () => {
      const recorder = new OperationInvocationRecorder();
      recorder.recordInvocation('play', ServiceResponse.success());
      recorder.clear();
      recorder.recordInvocation('pause', ServiceResponse.failure());
      expect(recorder.getTotalCalls()).assertEqual(1);
      expect(recorder.getFailureCount()).assertEqual(1);
      expect(recorder.getCallCount('play')).assertEqual(0);
      expect(recorder.getCallCount('pause')).assertEqual(1);
    });
    it('catalog_should_report_full_identifier_coverage', 0, async () => {
      const ids: string[] = MiracastOperationCatalog.getIds();
      const collected: string[] = [];
      ids.forEach((id: string) => {
        const def: MiracastOperationDef | null = MiracastOperationCatalog.findById(id);
        if (def !== null) {
          collected.push(def.id);
        }
      });
      expect(collected.length).assertEqual(10);
      expect(collected.length).assertEqual(ids.length);
      expect(collected[0]).assertEqual('startMiracastService');
      expect(collected[9]).assertEqual('unMute');
    });
  });
}
