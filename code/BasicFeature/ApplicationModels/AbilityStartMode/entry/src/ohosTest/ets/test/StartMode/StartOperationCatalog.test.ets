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
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

// 启动模式类型枚举：三个启动模式，STANDARD 为默认值 0
enum StartModeType {
  STARTMODE_STANDARD = 0, STARTMODE_SPECIFIED = 1, STARTMODE_SINGLETON = 2
}

// 启动模式定义接口：描述单个模式的图标、名称、能力与分组信息
interface StartModeDef {
  id: string;
  name: string;
  icon: string;
  abilityName: string;
  groupIndex: number;
  modeType: number;
  sampleFood: string;
}

// 启动模式目录：静态目录保存三个启动模式的完整定义
class StartModeCatalog {
  public static readonly STANDARD: StartModeDef = {
    id: 'standard',
    name: 'standard',
    icon: 'app.media.tomato',
    abilityName: 'StandardAbility',
    groupIndex: 0,
    modeType: StartModeType.STARTMODE_STANDARD,
    sampleFood: 'Tomato'
  };
  public static readonly SPECIFIED: StartModeDef = {
    id: 'specified',
    name: 'specified',
    icon: 'app.media.walnut',
    abilityName: 'SpecifiedAbility',
    groupIndex: 1,
    modeType: StartModeType.STARTMODE_SPECIFIED,
    sampleFood: 'Walnut'
  };
  public static readonly SINGLETON: StartModeDef = {
    id: 'sinleton',
    name: 'sinleton',
    icon: 'app.media.icecream',
    abilityName: 'SingletonAbility',
    groupIndex: 2,
    modeType: StartModeType.STARTMODE_SINGLETON,
    sampleFood: 'IceCream'
  };

  public static getAll(): StartModeDef[] {
    return [StartModeCatalog.STANDARD, StartModeCatalog.SPECIFIED, StartModeCatalog.SINGLETON];
  }

  public static getIds(): string[] {
    return StartModeCatalog.getAll().map((def: StartModeDef) => def.id);
  }
}

// 主页常量：适配 Global_Constants 系列场景
class StartModeConstants {
  public static readonly FULL_WIDTH: string = '100%';
  public static readonly FULL_HEIGHT: string = '100%';
  public static readonly MODE_GROUP_COUNT: number = 3;
  public static readonly DEFAULT_GROUP_INDEX: number = 0;
  public static readonly HOME_BG_COLOR: string = '#FF1f3f5';
  public static readonly MODE_LABEL_COLOR: string = '#ff858588';
  public static readonly LIST_ITEM_HEIGHT: number = 64;
  public static readonly GROUP_HEADER_HEIGHT: number = 46;
  public static readonly DETAIL_CARD_RADIUS: number = 12;
  public static readonly DETAIL_PAGE_ID: string = 'detailPage';
}

// 启动类别枚举：描述模式所属的业务类别
enum StartCategory {
  CATEGORY_MULTI_INSTANCE = 'multi_instance', CATEGORY_DESIGNATED = 'designated', CATEGORY_SHARED = 'shared'
}

// 启动风险等级枚举：描述模式带来的实例管理复杂度
enum StartRiskLevel {
  RISK_SAFE = 0, RISK_MODERATE = 1, RISK_HIGH = 2
}

// 模式关系接口：描述两个启动模式之间的关系属性
interface StartModeRelationship {
  sourceId: string;
  targetId: string;
  mutuallyExclusive: boolean;
  description: string;
}

// 启动模式目录校验器：对目录数据进行完整性、唯一性与一致性校验
class StartModeCatalogValidator {
  private catalog: StartModeDef[] = [];

  constructor(catalog: StartModeDef[]) {
    this.catalog = catalog;
  }

  public hasUniqueIds(): boolean {
    const ids: Set<string> = new Set<string>();
    this.catalog.forEach((def: StartModeDef) => ids.add(def.id));
    return ids.size === this.catalog.length;
  }

  public hasUniqueModeTypes(): boolean {
    const types: Set<number> = new Set<number>();
    this.catalog.forEach((def: StartModeDef) => types.add(def.modeType));
    return types.size === this.catalog.length;
  }

  public allHaveNonEmptyNames(): boolean {
    return this.catalog.every((def: StartModeDef) => def.name.length > 0);
  }

  public allHaveValidAbilityNames(): boolean {
    return this.catalog.every((def: StartModeDef) => def.abilityName.endsWith('Ability'));
  }

  public findById(id: string): StartModeDef | null {
    return this.catalog.find((def: StartModeDef) => def.id === id) || null;
  }

  public countByModeType(modeType: number): number {
    return this.catalog.filter((def: StartModeDef) => def.modeType === modeType).length;
  }

  public validateAll(): boolean {
    return this.hasUniqueIds() && this.hasUniqueModeTypes() && this.allHaveNonEmptyNames() &&
      this.allHaveValidAbilityNames();
  }
}

// 模式依赖图：管理启动模式之间的互斥关系与依赖查询
class StartModeDependencyGraph {
  private relationships: StartModeRelationship[] = [];

  public addRelationship(relationship: StartModeRelationship): void {
    this.relationships.push(relationship);
  }

  public getRelationships(): StartModeRelationship[] {
    return [...this.relationships];
  }

  public getRelationshipCount(): number {
    return this.relationships.length;
  }

  public areMutuallyExclusive(sourceId: string, targetId: string): boolean {
    return this.relationships.some((rel: StartModeRelationship) => rel.sourceId === sourceId &&
      rel.targetId === targetId && rel.mutuallyExclusive);
  }

  public getTargetsOf(sourceId: string): string[] {
    return this.relationships
      .filter((rel: StartModeRelationship) => rel.sourceId === sourceId)
      .map((rel: StartModeRelationship) => rel.targetId);
  }

  public hasCycle(): boolean {
    return this.relationships.some((rel: StartModeRelationship) => rel.sourceId === rel.targetId);
  }

  public clear(): void {
    this.relationships = [];
  }
}

// 模式名称解析器：根据模式类型或 id 解析可读名称
class StartModeNameResolver {
  private catalog: StartModeDef[] = [];

  constructor(catalog: StartModeDef[]) {
    this.catalog = catalog;
  }

  public resolveById(id: string): string {
    const def: StartModeDef | undefined = this.catalog.find((item: StartModeDef) => item.id === id);
    return def === undefined ? 'Unknown mode' : def.name;
  }

  public resolveByModeType(modeType: number): string {
    const def: StartModeDef | undefined = this.catalog.find((item: StartModeDef) => item.modeType === modeType);
    return def === undefined ? 'Unknown mode' : def.name;
  }

  public resolveAllNames(): string[] {
    return this.catalog.map((def: StartModeDef) => def.name);
  }

  public getResolvableCount(): number {
    return this.catalog.length;
  }

  public isResolvable(modeType: number): boolean {
    return this.catalog.some((def: StartModeDef) => def.modeType === modeType);
  }
}

// 目录统计器：对启动模式目录进行规模与分布统计
class StartModeCatalogStatistics {
  private catalog: StartModeDef[] = [];

  constructor(catalog: StartModeDef[]) {
    this.catalog = catalog;
  }

  public getCatalogSize(): number {
    return this.catalog.length;
  }

  public getIdLengthSum(): number {
    let sum: number = 0;
    this.catalog.forEach((def: StartModeDef) => sum += def.id.length);
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
    this.catalog.forEach((def: StartModeDef) => {
      if (def.id.length > longest) {
        longest = def.id.length;
      }
    });
    return longest;
  }

  public getShortestNameLength(): number {
    if (this.catalog.length === 0) {
      return 0;
    }
    let shortest: number = this.catalog[0].name.length;
    this.catalog.forEach((def: StartModeDef) => {
      if (def.name.length < shortest) {
        shortest = def.name.length;
      }
    });
    return shortest;
  }

  public describeCatalog(): string {
    return `StartModeCatalogStatistics{size: ${this.getCatalogSize()}, avgIdLength: ${this.getAverageIdLength()}}`;
  }
}

// 模式属性检查器：检查单个模式定义是否满足指定属性约束
class StartModePropertyChecker {
  public hasRequiredId(def: StartModeDef, minLength: number): boolean {
    return def.id.length >= minLength;
  }

  public hasNoWhitespaceInId(def: StartModeDef): boolean {
    return !def.id.includes(' ');
  }

  public hasValidModeTypeRange(def: StartModeDef, min: number, max: number): boolean {
    return def.modeType >= min && def.modeType <= max;
  }

  public isComplete(def: StartModeDef): boolean {
    return this.hasRequiredId(def, 3) && this.hasNoWhitespaceInId(def) &&
      this.hasValidModeTypeRange(def, 0, 2) && def.name.length > 0 && def.icon.length > 0 &&
      def.abilityName.endsWith('Ability') && def.groupIndex >= 0 && def.groupIndex <= 2;
  }

  public collectMissingProperties(def: StartModeDef): string[] {
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
    if (def.abilityName.length === 0) {
      missing.push('abilityName');
    }
    return missing;
  }

  public hasConsistentGroupIndex(def: StartModeDef): boolean {
    return def.groupIndex === def.modeType;
  }
}

// 模式本地化枚举：描述模式名称的本地化语言
enum StartModeLocale {
  LOCALE_ZH = 'zh', LOCALE_EN = 'en'
}

// 模式目录搜索器：在目录中进行模糊与精确搜索
class StartModeCatalogSearcher {
  private catalog: StartModeDef[] = [];

  constructor(catalog: StartModeDef[]) {
    this.catalog = catalog;
  }

  public searchByName(keyword: string): StartModeDef[] {
    return this.catalog.filter((def: StartModeDef) => def.name.includes(keyword));
  }

  public searchByIdPrefix(prefix: string): StartModeDef[] {
    return this.catalog.filter((def: StartModeDef) => def.id.startsWith(prefix));
  }

  public findExactName(name: string): StartModeDef | null {
    return this.catalog.find((def: StartModeDef) => def.name === name) || null;
  }

  public getSortedById(): StartModeDef[] {
    return [...this.catalog].sort((a: StartModeDef, b: StartModeDef) => {
      if (a.id < b.id) {
        return -1;
      }
      if (a.id > b.id) {
        return 1;
      }
      return 0;
    });
  }

  public getSortedByModeType(): StartModeDef[] {
    return [...this.catalog].sort((a: StartModeDef, b: StartModeDef) => a.modeType - b.modeType);
  }
}

// 模式国际化名称映射表：维护模式在不同语言下的显示名称
class StartModeLocaleMap {
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
    this.names.forEach((value: string, key: string) => result.push(key));
    return result;
  }

  public clear(): void {
    this.names.clear();
  }
}

export default function startOperationCatalogTest() {
  describe('StartOperationCatalog_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 StartModeType_Enum：启动模式枚举应包含三个成员
    it('start_mode_enum_should_have_three_members', 0, async () => {
      const values: number[] = [StartModeType.STARTMODE_STANDARD, StartModeType.STARTMODE_SPECIFIED,
        StartModeType.STARTMODE_SINGLETON];
      expect(values.length).assertEqual(3);
    });

    // 适配 StartModeType_Enum：枚举值唯一
    it('start_mode_enum_values_should_be_unique', 0, async () => {
      const unique: Set<number> =
        new Set<number>([StartModeType.STARTMODE_STANDARD, StartModeType.STARTMODE_SPECIFIED,
          StartModeType.STARTMODE_SINGLETON]);
      expect(unique.size).assertEqual(3);
    });

    // 适配 StartModeType_Enum：默认值为 STANDARD（0）
    it('start_mode_default_should_be_standard_with_value_zero', 0, async () => {
      expect(StartModeType.STARTMODE_STANDARD).assertEqual(0);
      expect(StartModeType.STARTMODE_SPECIFIED).assertEqual(1);
      expect(StartModeType.STARTMODE_SINGLETON).assertEqual(2);
    });

    // 适配 StartMode_Catalog：目录包含全部三个启动模式
    it('catalog_should_contain_all_modes', 0, async () => {
      const ids: string[] = StartModeCatalog.getIds();
      expect(ids.length).assertEqual(3);
      expect(ids.includes('standard')).assertTrue();
      expect(ids.includes('specified')).assertTrue();
      expect(ids.includes('sinleton')).assertTrue();
    });

    // 适配 StartMode_Catalog：模式 id 唯一
    it('catalog_ids_should_be_unique', 0, async () => {
      const ids: string[] = StartModeCatalog.getIds();
      const unique: Set<string> = new Set<string>(ids);
      expect(unique.size).assertEqual(ids.length);
    });

    // 适配 StartMode_Catalog：每个模式都有图标与示例食物
    it('each_mode_should_have_valid_icons', 0, async () => {
      const all: StartModeDef[] = StartModeCatalog.getAll();
      all.forEach((def: StartModeDef) => {
        expect(def.icon.length).assertLargerOrEqual(1);
        expect(def.sampleFood.length).assertLargerOrEqual(1);
      });
    });

    // 适配 StartMode_Property_Completeness：每个模式拥有必要属性
    it('each_mode_should_have_required_properties', 0, async () => {
      const all: StartModeDef[] = StartModeCatalog.getAll();
      all.forEach((def: StartModeDef) => {
        expect(def.id.length).assertLargerOrEqual(1);
        expect(def.abilityName.endsWith('Ability')).assertTrue();
        expect(def.modeType).assertLargerOrEqual(0);
        expect(def.groupIndex).assertLargerOrEqual(0);
      });
    });

    // 适配 Mode_Relationships：三个模式互斥
    it('modes_should_be_mutually_exclusive', 0, async () => {
      const standardType: number = StartModeType.STARTMODE_STANDARD;
      const specifiedType: number = StartModeType.STARTMODE_SPECIFIED;
      const singletonType: number = StartModeType.STARTMODE_SINGLETON;
      expect(standardType === specifiedType).assertFalse();
      expect(specifiedType === singletonType).assertFalse();
      expect(standardType === singletonType).assertFalse();
    });

    // 适配 ModeID_Format：模式 id 使用有意义的小写命名
    it('mode_ids_should_be_meaningful', 0, async () => {
      const ids: string[] = StartModeCatalog.getIds();
      ids.forEach((id: string) => {
        expect(id.length).assertLargerOrEqual(3);
        expect(id.includes(' ')).assertFalse();
      });
    });

    // 适配 ModeID_Format：模式 id 长度不超过 20
    it('mode_ids_should_not_exceed_20_chars', 0, async () => {
      const ids: string[] = StartModeCatalog.getIds();
      ids.forEach((id: string) => {
        expect(id.length).assertLessOrEqual(20);
      });
    });

    // 适配 Global_Constants：模式分组数量常量正确
    it('mode_group_count_should_be_three', 0, async () => {
      expect(StartModeConstants.MODE_GROUP_COUNT).assertEqual(3);
    });

    // 适配 Global_Constants：默认分组索引为 0
    it('default_group_index_should_be_zero', 0, async () => {
      expect(StartModeConstants.DEFAULT_GROUP_INDEX).assertEqual(0);
      expect(StartModeConstants.DEFAULT_GROUP_INDEX).assertLess(StartModeConstants.MODE_GROUP_COUNT);
    });

    // 适配 Global_Constants：尺寸常量正确
    it('dimension_constants_should_be_consistent', 0, async () => {
      expect(StartModeConstants.LIST_ITEM_HEIGHT).assertEqual(64);
      expect(StartModeConstants.GROUP_HEADER_HEIGHT).assertEqual(46);
      expect(StartModeConstants.DETAIL_CARD_RADIUS).assertEqual(12);
    });

    // 适配 Enum_Boundaries：越界模式类型
    it('out_of_range_mode_type_should_not_match_catalog', 0, async () => {
      const all: StartModeDef[] = StartModeCatalog.getAll();
      const outOfRange: number = 100;
      const matched: StartModeDef[] = all.filter((def: StartModeDef) => def.modeType === outOfRange);
      expect(matched.length).assertEqual(0);
    });

    // 适配 Cross_Category_NonOverlap：模式类型区间互不重叠
    it('mode_type_ranges_should_not_overlap', 0, async () => {
      const all: StartModeDef[] = StartModeCatalog.getAll();
      const types: number[] = all.map((def: StartModeDef) => def.modeType);
      const unique: Set<number> = new Set<number>(types);
      expect(unique.size).assertEqual(types.length);
    });

    // 适配 StartModeCatalog_Validator：目录校验器应识别唯一 id
    it('validator_should_identify_unique_ids', 0, async () => {
      const validator = new StartModeCatalogValidator(StartModeCatalog.getAll());
      expect(validator.hasUniqueIds()).assertTrue();
    });

    // 适配 StartModeCatalog_Validator：目录校验器应识别唯一模式类型
    it('validator_should_identify_unique_mode_types', 0, async () => {
      const validator = new StartModeCatalogValidator(StartModeCatalog.getAll());
      expect(validator.hasUniqueModeTypes()).assertTrue();
    });

    // 适配 StartModeCatalog_Validator：所有模式名称非空
    it('validator_should_require_non_empty_names', 0, async () => {
      const validator = new StartModeCatalogValidator(StartModeCatalog.getAll());
      expect(validator.allHaveNonEmptyNames()).assertTrue();
    });

    // 适配 StartModeCatalog_Validator：所有能力名以 Ability 结尾
    it('validator_should_require_valid_ability_names', 0, async () => {
      const validator = new StartModeCatalogValidator(StartModeCatalog.getAll());
      expect(validator.allHaveValidAbilityNames()).assertTrue();
    });

    // 适配 StartModeCatalog_Validator：按 id 查找返回对应定义
    it('validator_should_find_definition_by_id', 0, async () => {
      const validator = new StartModeCatalogValidator(StartModeCatalog.getAll());
      const standardDef: StartModeDef | null = validator.findById('standard');
      expect(standardDef === null).assertFalse();
      expect(standardDef?.name).assertEqual('standard');
      expect(standardDef?.abilityName).assertEqual('StandardAbility');
    });

    // 适配 StartModeCatalog_Validator：未知 id 返回 null
    it('validator_should_return_null_for_unknown_id', 0, async () => {
      const validator = new StartModeCatalogValidator(StartModeCatalog.getAll());
      const unknownDef: StartModeDef | null = validator.findById('unknown_mode');
      expect(unknownDef === null).assertTrue();
    });

    // 适配 StartModeCatalog_Validator：按模式类型统计数量
    it('validator_should_count_by_mode_type', 0, async () => {
      const validator = new StartModeCatalogValidator(StartModeCatalog.getAll());
      expect(validator.countByModeType(0)).assertEqual(1);
      expect(validator.countByModeType(1)).assertEqual(1);
      expect(validator.countByModeType(2)).assertEqual(1);
    });

    // 适配 StartModeCatalog_Validator：整体校验通过
    it('validator_should_pass_full_validation', 0, async () => {
      const validator = new StartModeCatalogValidator(StartModeCatalog.getAll());
      expect(validator.validateAll()).assertTrue();
    });

    // 适配 StartModeCatalog_Validator：重复 id 目录校验失败
    it('validator_should_detect_duplicate_ids', 0, async () => {
      const duplicated: StartModeDef[] = [StartModeCatalog.STANDARD, StartModeCatalog.STANDARD];
      const validator = new StartModeCatalogValidator(duplicated);
      expect(validator.hasUniqueIds()).assertFalse();
      expect(validator.hasUniqueModeTypes()).assertFalse();
    });

    // 适配 StartModeCatalog_Validator：空目录校验行为确定
    it('validator_should_handle_empty_catalog', 0, async () => {
      const validator = new StartModeCatalogValidator([]);
      expect(validator.hasUniqueIds()).assertTrue();
      expect(validator.allHaveNonEmptyNames()).assertTrue();
      expect(validator.findById('standard') === null).assertTrue();
      expect(validator.countByModeType(0)).assertEqual(0);
    });

    // 适配 StartModeDependencyGraph：互斥关系记录
    it('dependency_graph_should_record_mutual_exclusion', 0, async () => {
      const graph = new StartModeDependencyGraph();
      const rel: StartModeRelationship = {
        sourceId: 'standard',
        targetId: 'specified',
        mutuallyExclusive: true,
        description: 'standard 与 specified 互斥'
      };
      graph.addRelationship(rel);
      expect(graph.getRelationshipCount()).assertEqual(1);
      expect(graph.areMutuallyExclusive('standard', 'specified')).assertTrue();
    });

    // 适配 StartModeDependencyGraph：非互斥关系查询
    it('dependency_graph_should_return_false_for_non_exclusive', 0, async () => {
      const graph = new StartModeDependencyGraph();
      const rel: StartModeRelationship = {
        sourceId: 'specified',
        targetId: 'sinleton',
        mutuallyExclusive: false,
        description: 'specified 与 sinleton 可共存'
      };
      graph.addRelationship(rel);
      expect(graph.areMutuallyExclusive('specified', 'sinleton')).assertFalse();
    });

    // 适配 StartModeDependencyGraph：获取目标节点列表
    it('dependency_graph_should_return_targets_of_source', 0, async () => {
      const graph = new StartModeDependencyGraph();
      graph.addRelationship({
        sourceId: 'standard',
        targetId: 'specified',
        mutuallyExclusive: true,
        description: '互斥'
      });
      graph.addRelationship({
        sourceId: 'standard',
        targetId: 'sinleton',
        mutuallyExclusive: true,
        description: '互斥'
      });
      const targets: string[] = graph.getTargetsOf('standard');
      expect(targets.length).assertEqual(2);
      expect(targets.includes('specified')).assertTrue();
      expect(targets.includes('sinleton')).assertTrue();
    });

    // 适配 StartModeDependencyGraph：自环检测
    it('dependency_graph_should_detect_self_cycle', 0, async () => {
      const graph = new StartModeDependencyGraph();
      expect(graph.hasCycle()).assertFalse();
      graph.addRelationship({
        sourceId: 'standard',
        targetId: 'standard',
        mutuallyExclusive: true,
        description: '自环'
      });
      expect(graph.hasCycle()).assertTrue();
    });

    // 适配 StartModeDependencyGraph：清空后状态复位
    it('dependency_graph_should_reset_after_clear', 0, async () => {
      const graph = new StartModeDependencyGraph();
      graph.addRelationship({
        sourceId: 'standard',
        targetId: 'specified',
        mutuallyExclusive: true,
        description: '互斥'
      });
      graph.clear();
      expect(graph.getRelationshipCount()).assertEqual(0);
      expect(graph.getRelationships().length).assertEqual(0);
    });

    // 适配 StartModeDependencyGraph：关系列表只读副本
    it('dependency_graph_should_return_copy_of_relationships', 0, async () => {
      const graph = new StartModeDependencyGraph();
      graph.addRelationship({
        sourceId: 'specified',
        targetId: 'sinleton',
        mutuallyExclusive: true,
        description: '互斥'
      });
      const copy: StartModeRelationship[] = graph.getRelationships();
      copy.push({
        sourceId: 'standard',
        targetId: 'specified',
        mutuallyExclusive: true,
        description: '互斥'
      });
      expect(graph.getRelationshipCount()).assertEqual(1);
    });

    // 适配 StartModeDependencyGraph：非互斥关系也可被追踪
    it('dependency_graph_should_track_non_exclusive_targets', 0, async () => {
      const graph = new StartModeDependencyGraph();
      graph.addRelationship({
        sourceId: 'standard', targetId: 'sinleton', mutuallyExclusive: false, description: '非互斥'
      });
      const targets: string[] = graph.getTargetsOf('standard');
      expect(targets.length).assertEqual(1);
      expect(targets.includes('sinleton')).assertTrue();
      expect(graph.areMutuallyExclusive('standard', 'sinleton')).assertFalse();
    });

    // 适配 StartModeDependencyGraph：清空后自环检测复位
    it('dependency_graph_should_detect_cycles_after_clear', 0, async () => {
      const graph = new StartModeDependencyGraph();
      graph.addRelationship({
        sourceId: 'specified', targetId: 'specified', mutuallyExclusive: true, description: '自环'
      });
      expect(graph.hasCycle()).assertTrue();
      graph.clear();
      expect(graph.hasCycle()).assertFalse();
      expect(graph.getRelationshipCount()).assertEqual(0);
    });

    // 适配 StartModeNameResolver：按 id 解析名称
    it('name_resolver_should_resolve_name_by_id', 0, async () => {
      const resolver = new StartModeNameResolver(StartModeCatalog.getAll());
      expect(resolver.resolveById('standard')).assertEqual('standard');
      expect(resolver.resolveById('specified')).assertEqual('specified');
      expect(resolver.resolveById('sinleton')).assertEqual('sinleton');
    });

    // 适配 StartModeNameResolver：未知 id 返回默认文案
    it('name_resolver_should_return_default_for_unknown_id', 0, async () => {
      const resolver = new StartModeNameResolver(StartModeCatalog.getAll());
      expect(resolver.resolveById('unknown')).assertEqual('Unknown mode');
    });

    // 适配 StartModeNameResolver：按模式类型解析名称
    it('name_resolver_should_resolve_name_by_type', 0, async () => {
      const resolver = new StartModeNameResolver(StartModeCatalog.getAll());
      expect(resolver.resolveByModeType(0)).assertEqual('standard');
      expect(resolver.resolveByModeType(1)).assertEqual('specified');
      expect(resolver.resolveByModeType(2)).assertEqual('sinleton');
    });

    // 适配 StartModeNameResolver：未知类型返回默认文案
    it('name_resolver_should_return_default_for_unknown_type', 0, async () => {
      const resolver = new StartModeNameResolver(StartModeCatalog.getAll());
      expect(resolver.resolveByModeType(99)).assertEqual('Unknown mode');
    });

    // 适配 StartModeNameResolver：解析全部名称
    it('name_resolver_should_resolve_all_names', 0, async () => {
      const resolver = new StartModeNameResolver(StartModeCatalog.getAll());
      const names: string[] = resolver.resolveAllNames();
      expect(names.length).assertEqual(3);
      expect(names.includes('standard')).assertTrue();
      expect(names.includes('specified')).assertTrue();
      expect(names.includes('sinleton')).assertTrue();
    });

    // 适配 StartModeNameResolver：可解析数量与可解析性
    it('name_resolver_should_report_resolvable_count', 0, async () => {
      const resolver = new StartModeNameResolver(StartModeCatalog.getAll());
      expect(resolver.getResolvableCount()).assertEqual(3);
      expect(resolver.isResolvable(1)).assertTrue();
      expect(resolver.isResolvable(100)).assertFalse();
    });

    // 适配 StartModeNameResolver：空目录解析行为确定
    it('name_resolver_should_handle_empty_catalog', 0, async () => {
      const resolver = new StartModeNameResolver([]);
      expect(resolver.resolveById('standard')).assertEqual('Unknown mode');
      expect(resolver.resolveByModeType(0)).assertEqual('Unknown mode');
      expect(resolver.getResolvableCount()).assertEqual(0);
      expect(resolver.isResolvable(1)).assertFalse();
    });

    // 适配 StartModeCatalogStatistics：目录规模统计
    it('catalog_statistics_should_report_size', 0, async () => {
      const stats = new StartModeCatalogStatistics(StartModeCatalog.getAll());
      expect(stats.getCatalogSize()).assertEqual(3);
    });

    // 适配 StartModeCatalogStatistics：id 长度总和与平均值
    it('catalog_statistics_should_compute_id_length', 0, async () => {
      const stats = new StartModeCatalogStatistics(StartModeCatalog.getAll());
      const expectedSum: number = 'standard'.length + 'specified'.length + 'sinleton'.length;
      expect(stats.getIdLengthSum()).assertEqual(expectedSum);
      expect(stats.getAverageIdLength()).assertEqual(expectedSum / 3);
    });

    // 适配 StartModeCatalogStatistics：最长 id 长度
    it('catalog_statistics_should_report_longest_id', 0, async () => {
      const stats = new StartModeCatalogStatistics(StartModeCatalog.getAll());
      expect(stats.getLongestIdLength()).assertEqual('specified'.length);
    });

    // 适配 StartModeCatalogStatistics：最短名称长度
    it('catalog_statistics_should_report_shortest_name', 0, async () => {
      const stats = new StartModeCatalogStatistics(StartModeCatalog.getAll());
      expect(stats.getShortestNameLength()).assertEqual(8);
    });

    // 适配 StartModeCatalogStatistics：空目录统计为零
    it('catalog_statistics_should_handle_empty_catalog', 0, async () => {
      const stats = new StartModeCatalogStatistics([]);
      expect(stats.getCatalogSize()).assertEqual(0);
      expect(stats.getIdLengthSum()).assertEqual(0);
      expect(stats.getAverageIdLength()).assertEqual(0);
      expect(stats.getShortestNameLength()).assertEqual(0);
    });

    // 适配 StartModeCatalogStatistics：目录描述信息
    it('catalog_statistics_should_describe_catalog', 0, async () => {
      const stats = new StartModeCatalogStatistics(StartModeCatalog.getAll());
      const description: string = stats.describeCatalog();
      expect(description.includes('size: 3')).assertTrue();
      expect(description.includes('StartModeCatalogStatistics')).assertTrue();
    });

    // 适配 StartModePropertyChecker：id 长度约束
    it('property_checker_should_validate_id_length', 0, async () => {
      const checker = new StartModePropertyChecker();
      expect(checker.hasRequiredId(StartModeCatalog.STANDARD, 3)).assertTrue();
      expect(checker.hasRequiredId(StartModeCatalog.STANDARD, 100)).assertFalse();
    });

    // 适配 StartModePropertyChecker：id 无空白字符
    it('property_checker_should_reject_whitespace_id', 0, async () => {
      const checker = new StartModePropertyChecker();
      expect(checker.hasNoWhitespaceInId(StartModeCatalog.SPECIFIED)).assertTrue();
      const blankDef: StartModeDef = {
        id: 'wrong id',
        name: 'wrong',
        icon: 'app.media.tomato',
        abilityName: 'StandardAbility',
        groupIndex: 0,
        modeType: 0,
        sampleFood: 'Tomato'
      };
      expect(checker.hasNoWhitespaceInId(blankDef)).assertFalse();
    });

    // 适配 StartModePropertyChecker：模式类型范围校验
    it('property_checker_should_validate_type_range', 0, async () => {
      const checker = new StartModePropertyChecker();
      expect(checker.hasValidModeTypeRange(StartModeCatalog.SINGLETON, 0, 2)).assertTrue();
      expect(checker.hasValidModeTypeRange(StartModeCatalog.SINGLETON, 0, 1)).assertFalse();
    });

    // 适配 StartModePropertyChecker：完整定义校验
    it('property_checker_should_confirm_complete_definition', 0, async () => {
      const checker = new StartModePropertyChecker();
      expect(checker.isComplete(StartModeCatalog.STANDARD)).assertTrue();
      expect(checker.isComplete(StartModeCatalog.SPECIFIED)).assertTrue();
      expect(checker.isComplete(StartModeCatalog.SINGLETON)).assertTrue();
    });

    // 适配 StartModePropertyChecker：缺失属性收集
    it('property_checker_should_collect_missing_properties', 0, async () => {
      const checker = new StartModePropertyChecker();
      const emptyDef: StartModeDef = {
        id: '',
        name: '',
        icon: '',
        abilityName: '',
        groupIndex: 0,
        modeType: 0,
        sampleFood: ''
      };
      const missing: string[] = checker.collectMissingProperties(emptyDef);
      expect(missing.length).assertEqual(4);
      expect(missing.includes('id')).assertTrue();
      expect(missing.includes('name')).assertTrue();
      expect(missing.includes('abilityName')).assertTrue();
    });

    // 适配 StartModePropertyChecker：部分缺失属性收集
    it('property_checker_should_detect_partial_missing_property', 0, async () => {
      const checker = new StartModePropertyChecker();
      const partial: StartModeDef = {
        id: 'standard', name: 'standard', icon: '', abilityName: 'StandardAbility',
        groupIndex: 0, modeType: StartModeType.STARTMODE_STANDARD, sampleFood: 'Tomato'
      };
      const missing: string[] = checker.collectMissingProperties(partial);
      expect(missing.length).assertEqual(1);
      expect(missing.includes('icon')).assertTrue();
      expect(checker.isComplete(partial)).assertFalse();
    });

    // 适配 StartModePropertyChecker：分组索引与模式类型一致
    it('property_checker_should_validate_group_index_consistency', 0, async () => {
      const checker = new StartModePropertyChecker();
      expect(checker.hasConsistentGroupIndex(StartModeCatalog.STANDARD)).assertTrue();
      expect(checker.hasConsistentGroupIndex(StartModeCatalog.SPECIFIED)).assertTrue();
      expect(checker.hasConsistentGroupIndex(StartModeCatalog.SINGLETON)).assertTrue();
    });

    // 适配 StartModeCatalogSearcher：按名称关键字搜索
    it('catalog_searcher_should_search_by_name_keyword', 0, async () => {
      const searcher = new StartModeCatalogSearcher(StartModeCatalog.getAll());
      const results: StartModeDef[] = searcher.searchByName('specified');
      expect(results.length).assertEqual(1);
      expect(results[0].id).assertEqual('specified');
    });

    // 适配 StartModeCatalogSearcher：按 id 前缀搜索
    it('catalog_searcher_should_search_by_id_prefix', 0, async () => {
      const searcher = new StartModeCatalogSearcher(StartModeCatalog.getAll());
      const results: StartModeDef[] = searcher.searchByIdPrefix('spec');
      expect(results.length).assertEqual(1);
      expect(results[0].id).assertEqual('specified');
      expect(searcher.searchByIdPrefix('s').length).assertEqual(3);
    });

    // 适配 StartModeCatalogSearcher：精确名称查找
    it('catalog_searcher_should_find_exact_name', 0, async () => {
      const searcher = new StartModeCatalogSearcher(StartModeCatalog.getAll());
      const match: StartModeDef | null = searcher.findExactName('sinleton');
      expect(match === null).assertFalse();
      expect(match?.id).assertEqual('sinleton');
      expect(match?.abilityName).assertEqual('SingletonAbility');
    });

    // 适配 StartModeCatalogSearcher：不存在的名称返回 null
    it('catalog_searcher_should_return_null_for_unknown_name', 0, async () => {
      const searcher = new StartModeCatalogSearcher(StartModeCatalog.getAll());
      const match: StartModeDef | null = searcher.findExactName('unknown_mode');
      expect(match === null).assertTrue();
    });

    // 适配 StartModeCatalogSearcher：按 id 排序结果
    it('catalog_searcher_should_sort_by_id', 0, async () => {
      const searcher = new StartModeCatalogSearcher(StartModeCatalog.getAll());
      const sorted: StartModeDef[] = searcher.getSortedById();
      expect(sorted.length).assertEqual(3);
      expect(sorted[0].id).assertEqual('sinleton');
      expect(sorted[1].id).assertEqual('specified');
      expect(sorted[2].id).assertEqual('standard');
    });

    // 适配 StartModeCatalogSearcher：按模式类型排序结果
    it('catalog_searcher_should_sort_by_mode_type', 0, async () => {
      const searcher = new StartModeCatalogSearcher(StartModeCatalog.getAll());
      const sorted: StartModeDef[] = searcher.getSortedByModeType();
      expect(sorted[0].modeType).assertEqual(0);
      expect(sorted[1].modeType).assertEqual(1);
      expect(sorted[2].modeType).assertEqual(2);
    });

    // 适配 StartModeCatalogSearcher：无匹配返回空列表
    it('catalog_searcher_should_return_empty_for_no_match', 0, async () => {
      const searcher = new StartModeCatalogSearcher(StartModeCatalog.getAll());
      expect(searcher.searchByName('unknown_mode').length).assertEqual(0);
      expect(searcher.searchByIdPrefix('zz').length).assertEqual(0);
      expect(searcher.findExactName('unknown_mode') === null).assertTrue();
    });

    // 适配 StartModeCatalogSearcher：排序不改变原始目录顺序
    it('catalog_searcher_should_not_mutate_original_order', 0, async () => {
      const searcher = new StartModeCatalogSearcher(StartModeCatalog.getAll());
      const sorted: StartModeDef[] = searcher.getSortedById();
      expect(sorted.length).assertEqual(3);
      const original: StartModeDef[] = StartModeCatalog.getAll();
      expect(original[0].id).assertEqual('standard');
      expect(original[1].id).assertEqual('specified');
      expect(original[2].id).assertEqual('sinleton');
    });

    // 适配 StartModeLocaleMap：本地化名称存取
    it('locale_map_should_put_and_get_names', 0, async () => {
      const map = new StartModeLocaleMap();
      map.put('standard', 'Standard mode');
      expect(map.get('standard')).assertEqual('Standard mode');
      expect(map.getSize()).assertEqual(1);
    });

    // 适配 StartModeLocaleMap：未命中键返回 null
    it('locale_map_should_return_null_for_missing_key', 0, async () => {
      const map = new StartModeLocaleMap();
      map.put('specified', 'Specified mode');
      expect(map.get('sinleton')).assertEqual(null);
    });

    // 适配 StartModeLocaleMap：键存在性检查
    it('locale_map_should_check_key_existence', 0, async () => {
      const map = new StartModeLocaleMap();
      map.put('sinleton', 'Singleton mode');
      expect(map.hasKey('sinleton')).assertTrue();
      expect(map.hasKey('standard')).assertFalse();
    });

    // 适配 StartModeLocaleMap：枚举全部键
    it('locale_map_should_enumerate_keys', 0, async () => {
      const map = new StartModeLocaleMap();
      map.put('standard', 'Standard mode');
      map.put('specified', 'Specified mode');
      map.put('sinleton', 'Singleton mode');
      const keys: string[] = map.keys();
      expect(keys.length).assertEqual(3);
      expect(keys.includes('standard')).assertTrue();
      expect(keys.includes('specified')).assertTrue();
      expect(keys.includes('sinleton')).assertTrue();
    });

    // 适配 StartModeLocaleMap：清空后状态复位
    it('locale_map_should_reset_after_clear', 0, async () => {
      const map = new StartModeLocaleMap();
      map.put('standard', 'Standard mode');
      map.clear();
      expect(map.getSize()).assertEqual(0);
      expect(map.get('standard')).assertEqual(null);
    });

    // 适配 StartModeLocaleMap：中英文名称不冲突
    it('locale_map_should_support_multiple_locales', 0, async () => {
      const map = new StartModeLocaleMap();
      map.put('standard_zh', '普通多实例');
      map.put('standard_en', 'Standard mode');
      expect(map.get('standard_zh')).assertEqual('普通多实例');
      expect(map.get('standard_en')).assertEqual('Standard mode');
      expect(map.getSize()).assertEqual(2);
      expect(StartModeLocale.LOCALE_ZH).assertEqual('zh');
      expect(StartModeLocale.LOCALE_EN).assertEqual('en');
    });

    // 适配 StartModeLocaleMap：同名键覆盖更新
    it('locale_map_should_overwrite_existing_key', 0, async () => {
      const map = new StartModeLocaleMap();
      map.put('standard', '普通多实例');
      map.put('standard', 'Standard mode');
      expect(map.getSize()).assertEqual(1);
      expect(map.get('standard')).assertEqual('Standard mode');
    });

    // 适配 StartModeLocaleMap：清空后键列表为空
    it('locale_map_should_clear_all_keys', 0, async () => {
      const map = new StartModeLocaleMap();
      map.put('standard', 'Standard mode');
      map.put('specified', 'Specified mode');
      map.clear();
      expect(map.getSize()).assertEqual(0);
      expect(map.keys().length).assertEqual(0);
      expect(map.get('standard')).assertEqual(null);
    });

    // 适配 StartMode_Catalog：静态定义与枚举值严格对应
    it('catalog_definitions_should_match_enum_values', 0, async () => {
      expect(StartModeCatalog.STANDARD.modeType).assertEqual(StartModeType.STARTMODE_STANDARD);
      expect(StartModeCatalog.SPECIFIED.modeType).assertEqual(StartModeType.STARTMODE_SPECIFIED);
      expect(StartModeCatalog.SINGLETON.modeType).assertEqual(StartModeType.STARTMODE_SINGLETON);
      expect(StartModeCatalog.STANDARD.id).assertEqual('standard');
      expect(StartModeCatalog.SPECIFIED.abilityName).assertEqual('SpecifiedAbility');
      expect(StartModeCatalog.SINGLETON.groupIndex).assertEqual(2);
    });

    // 适配 Mode_Icon_Format：图标资源遵循 media 资源格式
    it('catalog_icons_should_follow_media_resource_format', 0, async () => {
      const all: StartModeDef[] = StartModeCatalog.getAll();
      all.forEach((def: StartModeDef) => {
        expect(def.icon.startsWith('app.media.')).assertTrue();
        expect(def.icon.length).assertLarger('app.media.'.length);
      });
      expect(all[0].icon).assertEqual('app.media.tomato');
    });

    // 适配 Mode_Icon_Format：示例食物与分组食物一致
    it('catalog_sample_foods_should_match_groups', 0, async () => {
      expect(StartModeCatalog.STANDARD.sampleFood).assertEqual('Tomato');
      expect(StartModeCatalog.SPECIFIED.sampleFood).assertEqual('Walnut');
      expect(StartModeCatalog.SINGLETON.sampleFood).assertEqual('IceCream');
    });

    // 适配 Global_Constants：全屏与背景常量定义正确
    it('start_mode_constants_should_define_full_screen_layout', 0, async () => {
      expect(StartModeConstants.FULL_WIDTH).assertEqual('100%');
      expect(StartModeConstants.FULL_HEIGHT).assertEqual('100%');
      expect(StartModeConstants.HOME_BG_COLOR.length).assertLarger(0);
      expect(StartModeConstants.MODE_LABEL_COLOR).assertEqual('#ff858588');
      expect(StartModeConstants.DETAIL_PAGE_ID).assertEqual('detailPage');
    });

    // 适配 Cross_Category：模式类别与风险等级枚举互不相同
    it('start_categories_and_risk_levels_should_be_distinct', 0, async () => {
      const multi: string = StartCategory.CATEGORY_MULTI_INSTANCE as string;
      const designated: string = StartCategory.CATEGORY_DESIGNATED as string;
      const shared: string = StartCategory.CATEGORY_SHARED as string;
      expect(multi === designated).assertFalse();
      expect(designated === shared).assertFalse();
      expect(multi === shared).assertFalse();
      expect(StartRiskLevel.RISK_SAFE).assertLess(StartRiskLevel.RISK_HIGH);
      expect(StartRiskLevel.RISK_MODERATE).assertLess(StartRiskLevel.RISK_HIGH);
    });

    // 适配 Mode_Catalog：模式类型按分组顺序递增
    it('catalog_mode_types_should_follow_group_order', 0, async () => {
      const all: StartModeDef[] = StartModeCatalog.getAll();
      for (let i = 0; i < all.length; i++) {
        expect(all[i].groupIndex).assertEqual(i);
        expect(all[i].modeType).assertEqual(i);
      }
    });

    // 适配 Mode_Catalog：目录按分组索引稳定排序
    it('catalog_group_indexes_should_be_contiguous', 0, async () => {
      const all: StartModeDef[] = StartModeCatalog.getAll();
      const indexes: number[] = all.map((def: StartModeDef) => def.groupIndex);
      expect(indexes[0]).assertEqual(0);
      expect(indexes[1]).assertEqual(1);
      expect(indexes[2]).assertEqual(2);
      expect(indexes.length).assertEqual(StartModeConstants.MODE_GROUP_COUNT);
    });

    // 适配 Mode_Ability_Mapping：模式与能力一一对应
    it('catalog_abilities_should_map_to_modes', 0, async () => {
      expect(StartModeCatalog.STANDARD.abilityName).assertEqual('StandardAbility');
      expect(StartModeCatalog.SPECIFIED.abilityName).assertEqual('SpecifiedAbility');
      expect(StartModeCatalog.SINGLETON.abilityName).assertEqual('SingletonAbility');
      expect(StartModeCatalog.STANDARD.abilityName === StartModeCatalog.SPECIFIED.abilityName).assertFalse();
    });

    // 适配 StartModeCatalogValidator：能力名唯一
    it('validator_should_identify_unique_ability_names', 0, async () => {
      const all: StartModeDef[] = StartModeCatalog.getAll();
      const abilities: string[] = all.map((def: StartModeDef) => def.abilityName);
      const unique: Set<string> = new Set<string>(abilities);
      expect(unique.size).assertEqual(abilities.length);
    });

    // 适配 StartModePropertyChecker：示例食物非空且首字母大写
    it('catalog_sample_foods_should_start_with_uppercase', 0, async () => {
      const all: StartModeDef[] = StartModeCatalog.getAll();
      all.forEach((def: StartModeDef) => {
        expect(def.sampleFood.length).assertLarger(0);
        const first: string = def.sampleFood.substring(0, 1);
        expect(first).assertEqual(first.toUpperCase());
      });
    });
  });
}


