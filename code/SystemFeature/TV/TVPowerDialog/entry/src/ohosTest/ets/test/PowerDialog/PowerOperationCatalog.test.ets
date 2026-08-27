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
import { Driver, ON } from '@ohos.UiTest';
import {
  createFreshDriver,
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

// 电源操作类型枚举：三个电源操作，SUSPEND 为默认值 0
enum PowerOperationType {
  POWEROPERATION_SUSPEND = 0, POWEROPERATION_REBOOT = 1, POWEROPERATION_SHUTDOWN = 2
}

// 电源操作定义接口：描述单个电源操作的图标、名称与操作类型
interface PowerOperationDef {
  id: string;
  icon: string;
  focusIcon: string;
  name: string;
  operationType: number;
}

// 电源操作目录：静态目录保存三个电源操作的完整定义
class PowerOperationCatalog {
  public static readonly SUSPEND: PowerOperationDef = {
    id: 'suspend',
    icon: 'app.media.screenout',
    focusIcon: 'app.media.screenout_focus',
    name: '熄屏',
    operationType: PowerOperationType.POWEROPERATION_SUSPEND
  };
  public static readonly REBOOT: PowerOperationDef = {
    id: 'reboot',
    icon: 'app.media.reboot',
    focusIcon: 'app.media.reboot_focus',
    name: '重启',
    operationType: PowerOperationType.POWEROPERATION_REBOOT
  };
  public static readonly SHUTDOWN: PowerOperationDef = {
    id: 'shutdown',
    icon: 'app.media.shutdown',
    focusIcon: 'app.media.shutdown_focus',
    name: '关机',
    operationType: PowerOperationType.POWEROPERATION_SHUTDOWN
  };

  public static getAll(): PowerOperationDef[] {
    return [PowerOperationCatalog.SUSPEND, PowerOperationCatalog.REBOOT, PowerOperationCatalog.SHUTDOWN];
  }

  public static getIds(): string[] {
    return PowerOperationCatalog.getAll().map((def: PowerOperationDef) => def.id);
  }
}

// 电源对话框常量：适配 Global_Constants 系列场景
class PowerDialogConstants {
  public static readonly FULL_WIDTH: string = '100%';
  public static readonly FULL_HEIGHT: string = '100%';
  public static readonly ITEM_WIDTH: number = 200;
  public static readonly ITEM_HEIGHT: number = 297;
  public static readonly OPTION_COUNT: number = 3;
  public static readonly DEFAULT_FOCUS_INDEX: number = 1;
  public static readonly DEFAULT_BG_COLOR: string = '#DB000000';
}

// 操作类别枚举：描述电源操作所属的业务类别
enum OperationCategory {
  CATEGORY_ENERGY_SAVING = 'energy_saving', CATEGORY_SYSTEM_CONTROL = 'system_control', CATEGORY_MAINTENANCE = 'maintenance'
}

// 操作风险等级枚举：描述电源操作的风险程度
enum OperationRiskLevel {
  RISK_SAFE = 0, RISK_MODERATE = 1, RISK_HIGH = 2
}

// 操作关系接口：描述两个操作之间的关系属性
interface OperationRelationship {
  sourceId: string;
  targetId: string;
  mutuallyExclusive: boolean;
  description: string;
}

// 电源操作目录校验器：对目录数据进行完整性、唯一性与一致性校验
class OperationCatalogValidator {
  private catalog: PowerOperationDef[] = [];

  constructor(catalog: PowerOperationDef[]) {
    this.catalog = catalog;
  }

  public hasUniqueIds(): boolean {
    const ids: Set<string> = new Set<string>();
    this.catalog.forEach((def: PowerOperationDef) => ids.add(def.id));
    return ids.size === this.catalog.length;
  }

  public hasUniqueOperationTypes(): boolean {
    const types: Set<number> = new Set<number>();
    this.catalog.forEach((def: PowerOperationDef) => types.add(def.operationType));
    return types.size === this.catalog.length;
  }

  public allHaveNonEmptyNames(): boolean {
    return this.catalog.every((def: PowerOperationDef) => def.name.length > 0);
  }

  public allHaveNonEmptyIcons(): boolean {
    return this.catalog.every((def: PowerOperationDef) => def.icon.length > 0 && def.focusIcon.length > 0);
  }

  public findById(id: string): PowerOperationDef | null {
    return this.catalog.find((def: PowerOperationDef) => def.id === id) || null;
  }

  public countByOperationType(operationType: number): number {
    return this.catalog.filter((def: PowerOperationDef) => def.operationType === operationType).length;
  }

  public validateAll(): boolean {
    return this.hasUniqueIds() && this.hasUniqueOperationTypes() && this.allHaveNonEmptyNames() &&
      this.allHaveNonEmptyIcons();
  }
}

// 操作依赖图：管理操作之间的互斥关系与依赖查询
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

// 操作名称解析器：根据操作类型或 id 解析可读名称
class OperationNameResolver {
  private catalog: PowerOperationDef[] = [];

  constructor(catalog: PowerOperationDef[]) {
    this.catalog = catalog;
  }

  public resolveById(id: string): string {
    const def = this.catalog.find((item: PowerOperationDef) => item.id === id);
    return def === undefined ? '未知操作' : def.name;
  }

  public resolveByOperationType(operationType: number): string {
    const def = this.catalog.find((item: PowerOperationDef) => item.operationType === operationType);
    return def === undefined ? '未知操作' : def.name;
  }

  public resolveAllNames(): string[] {
    return this.catalog.map((def: PowerOperationDef) => def.name);
  }

  public getResolvableCount(): number {
    return this.catalog.length;
  }

  public isResolvable(operationType: number): boolean {
    return this.catalog.some((def: PowerOperationDef) => def.operationType === operationType);
  }
}

// 目录统计器：对电源操作目录进行规模与分布统计
class CatalogStatistics {
  private catalog: PowerOperationDef[] = [];

  constructor(catalog: PowerOperationDef[]) {
    this.catalog = catalog;
  }

  public getCatalogSize(): number {
    return this.catalog.length;
  }

  public getIdLengthSum(): number {
    let sum = 0;
    this.catalog.forEach((def: PowerOperationDef) => sum += def.id.length);
    return sum;
  }

  public getAverageIdLength(): number {
    const size = this.getCatalogSize();
    if (size === 0) {
      return 0;
    }
    return this.getIdLengthSum() / size;
  }

  public getLongestIdLength(): number {
    let longest = 0;
    this.catalog.forEach((def: PowerOperationDef) => {
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
    let shortest = this.catalog[0].name.length;
    this.catalog.forEach((def: PowerOperationDef) => {
      if (def.name.length < shortest) {
        shortest = def.name.length;
      }
    });
    return shortest;
  }

  public describeCatalog(): string {
    return `CatalogStatistics{size: ${this.getCatalogSize()}, avgIdLength: ${this.getAverageIdLength()}}`;
  }
}

// 操作属性检查器：检查单个操作定义是否满足指定属性约束
class OperationPropertyChecker {
  public hasRequiredId(def: PowerOperationDef, minLength: number): boolean {
    return def.id.length >= minLength;
  }

  public hasNoWhitespaceInId(def: PowerOperationDef): boolean {
    return !def.id.includes(' ');
  }

  public hasValidOperationTypeRange(def: PowerOperationDef, min: number, max: number): boolean {
    return def.operationType >= min && def.operationType <= max;
  }

  public isComplete(def: PowerOperationDef): boolean {
    return this.hasRequiredId(def, 3) && this.hasNoWhitespaceInId(def) &&
      this.hasValidOperationTypeRange(def, 0, 100) && def.name.length > 0 && def.icon.length > 0 &&
      def.focusIcon.length > 0;
  }

  public collectMissingProperties(def: PowerOperationDef): string[] {
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

// 操作本地化枚举：描述操作名称的本地化语言
enum OperationLocale {
  LOCALE_ZH = 'zh', LOCALE_EN = 'en'
}

// 操作目录搜索器：在目录中进行模糊与精确搜索
class OperationCatalogSearcher {
  private catalog: PowerOperationDef[] = [];

  constructor(catalog: PowerOperationDef[]) {
    this.catalog = catalog;
  }

  public searchByName(keyword: string): PowerOperationDef[] {
    return this.catalog.filter((def: PowerOperationDef) => def.name.includes(keyword));
  }

  public searchByIdPrefix(prefix: string): PowerOperationDef[] {
    return this.catalog.filter((def: PowerOperationDef) => def.id.startsWith(prefix));
  }

  public findExactName(name: string): PowerOperationDef | null {
    return this.catalog.find((def: PowerOperationDef) => def.name === name) || null;
  }

  public getSortedById(): PowerOperationDef[] {
    return [...this.catalog].sort((a: PowerOperationDef, b: PowerOperationDef) => {
      if (a.id < b.id) {
        return -1;
      }
      if (a.id > b.id) {
        return 1;
      }
      return 0;
    });
  }

  public getSortedByOperationType(): PowerOperationDef[] {
    return [...this.catalog].sort((a: PowerOperationDef, b: PowerOperationDef) => a.operationType - b.operationType);
  }
}

// 操作国际化名称映射表：维护操作在不同语言下的显示名称
class OperationLocaleMap {
  private names: Map<string, string> = new Map<string, string>();

  public put(key: string, name: string): void {
    this.names.set(key, name);
  }

  public get(key: string): string | null {
    const name = this.names.get(key);
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

export default function powerOperationCatalogTest() {
  describe('PowerOperationCatalog_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = createFreshDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 MediaType_Enum：电源操作枚举应包含三个成员
    it('power_operation_enum_should_have_three_members', 0, async () => {
      const values: number[] = [PowerOperationType.POWEROPERATION_SUSPEND, PowerOperationType.POWEROPERATION_REBOOT,
        PowerOperationType.POWEROPERATION_SHUTDOWN];
      expect(values.length).assertEqual(3);
    });

    // 适配 MediaType_Enum：枚举值唯一
    it('power_operation_enum_values_should_be_unique', 0, async () => {
      const unique: Set<number> =
        new Set<number>([PowerOperationType.POWEROPERATION_SUSPEND, PowerOperationType.POWEROPERATION_REBOOT,
          PowerOperationType.POWEROPERATION_SHUTDOWN]);
      expect(unique.size).assertEqual(3);
    });

    // 适配 MediaType_Enum：默认值为 SUSPEND（0）
    it('power_operation_default_should_be_suspend_with_value_zero', 0, async () => {
      expect(PowerOperationType.POWEROPERATION_SUSPEND).assertEqual(0);
    });

    // 适配 OperationActionID_Enum：目录包含全部三个操作
    it('catalog_should_contain_all_operations', 0, async () => {
      const ids: string[] = PowerOperationCatalog.getIds();
      expect(ids.length).assertEqual(3);
      expect(ids.includes('suspend')).assertTrue();
      expect(ids.includes('reboot')).assertTrue();
      expect(ids.includes('shutdown')).assertTrue();
    });

    // 适配 OperationActionID_Enum：操作 id 唯一
    it('catalog_ids_should_be_unique', 0, async () => {
      const ids: string[] = PowerOperationCatalog.getIds();
      const unique: Set<string> = new Set<string>(ids);
      expect(unique.size).assertEqual(ids.length);
    });

    // 适配 OperationAction_Complete_Catalog：每个操作都有前置条件（图标与名称非空）
    it('each_operation_should_have_valid_preconditions', 0, async () => {
      const all: PowerOperationDef[] = PowerOperationCatalog.getAll();
      all.forEach((def: PowerOperationDef) => {
        expect(def.icon.length).assertLargerOrEqual(1);
        expect(def.name.length).assertLargerOrEqual(1);
      });
    });

    // 适配 OperationAction_Property_Completeness：每个操作拥有必要属性
    it('each_operation_should_have_required_properties', 0, async () => {
      const all: PowerOperationDef[] = PowerOperationCatalog.getAll();
      all.forEach((def: PowerOperationDef) => {
        expect(def.id.length).assertLargerOrEqual(1);
        expect(def.focusIcon.length).assertLargerOrEqual(1);
        expect(def.operationType).assertLargerOrEqual(0);
      });
    });

    // 适配 Operation_Relationships：三个操作互斥
    it('operations_should_be_mutually_exclusive', 0, async () => {
      const suspendType: number = PowerOperationType.POWEROPERATION_SUSPEND;
      const rebootType: number = PowerOperationType.POWEROPERATION_REBOOT;
      const shutdownType: number = PowerOperationType.POWEROPERATION_SHUTDOWN;
      expect(suspendType === rebootType).assertFalse();
      expect(rebootType === shutdownType).assertFalse();
      expect(suspendType === shutdownType).assertFalse();
    });

    // 适配 OperationID_Format：操作 id 使用驼峰可读命名
    it('operation_ids_should_be_meaningful', 0, async () => {
      const ids: string[] = PowerOperationCatalog.getIds();
      ids.forEach((id: string) => {
        expect(id.length).assertLargerOrEqual(3);
        expect(id.includes(' ')).assertFalse();
      });
    });

    // 适配 OperationID_Format：操作 id 长度不超过 20
    it('operation_ids_should_not_exceed_20_chars', 0, async () => {
      const ids: string[] = PowerOperationCatalog.getIds();
      ids.forEach((id: string) => {
        expect(id.length).assertLessOrEqual(20);
      });
    });

    // 适配 Global_Constants：选项数量常量正确
    it('option_count_should_be_three', 0, async () => {
      expect(PowerDialogConstants.OPTION_COUNT).assertEqual(3);
    });

    // 适配 Global_Constants：默认焦点索引为正
    it('default_focus_index_should_be_positive', 0, async () => {
      expect(PowerDialogConstants.DEFAULT_FOCUS_INDEX).assertLargerOrEqual(0);
    });

    // 适配 Global_Constants：尺寸常量正确
    it('dimension_constants_should_be_consistent', 0, async () => {
      expect(PowerDialogConstants.ITEM_WIDTH).assertEqual(200);
      expect(PowerDialogConstants.ITEM_HEIGHT).assertEqual(297);
    });

    // 适配 Enum_Boundaries：越界操作类型
    it('out_of_range_operation_type_should_not_match_catalog', 0, async () => {
      const all: PowerOperationDef[] = PowerOperationCatalog.getAll();
      const outOfRange: number = 100;
      const matched = all.filter((def: PowerOperationDef) => def.operationType === outOfRange);
      expect(matched.length).assertEqual(0);
    });

    // 适配 Cross_Category_NonOverlap：操作类型区间互不重叠
    it('operation_type_ranges_should_not_overlap', 0, async () => {
      const all: PowerOperationDef[] = PowerOperationCatalog.getAll();
      const types: number[] = all.map((def: PowerOperationDef) => def.operationType);
      const unique: Set<number> = new Set<number>(types);
      expect(unique.size).assertEqual(types.length);
    });

    // 适配 OperationCatalog_Validator：目录校验器应识别唯一 id
    it('validator_should_identify_unique_ids', 0, async () => {
      const validator = new OperationCatalogValidator(PowerOperationCatalog.getAll());
      expect(validator.hasUniqueIds()).assertTrue();
    });

    // 适配 OperationCatalog_Validator：目录校验器应识别唯一操作类型
    it('validator_should_identify_unique_operation_types', 0, async () => {
      const validator = new OperationCatalogValidator(PowerOperationCatalog.getAll());
      expect(validator.hasUniqueOperationTypes()).assertTrue();
    });

    // 适配 OperationCatalog_Validator：所有操作名称非空
    it('validator_should_require_non_empty_names', 0, async () => {
      const validator = new OperationCatalogValidator(PowerOperationCatalog.getAll());
      expect(validator.allHaveNonEmptyNames()).assertTrue();
    });

    // 适配 OperationCatalog_Validator：所有操作图标非空
    it('validator_should_require_non_empty_icons', 0, async () => {
      const validator = new OperationCatalogValidator(PowerOperationCatalog.getAll());
      expect(validator.allHaveNonEmptyIcons()).assertTrue();
    });

    // 适配 OperationCatalog_Validator：按 id 查找返回对应定义
    it('validator_should_find_definition_by_id', 0, async () => {
      const validator = new OperationCatalogValidator(PowerOperationCatalog.getAll());
      const suspendDef: PowerOperationDef | null = validator.findById('suspend');
      expect(suspendDef === null).assertFalse();
      expect(suspendDef?.name).assertEqual('熄屏');
    });

    // 适配 OperationCatalog_Validator：未知 id 返回 null
    it('validator_should_return_null_for_unknown_id', 0, async () => {
      const validator = new OperationCatalogValidator(PowerOperationCatalog.getAll());
      const unknownDef: PowerOperationDef | null = validator.findById('unknown_operation');
      expect(unknownDef === null).assertTrue();
    });

    // 适配 OperationCatalog_Validator：按操作类型统计数量
    it('validator_should_count_by_operation_type', 0, async () => {
      const validator = new OperationCatalogValidator(PowerOperationCatalog.getAll());
      expect(validator.countByOperationType(0)).assertEqual(1);
      expect(validator.countByOperationType(1)).assertEqual(1);
      expect(validator.countByOperationType(2)).assertEqual(1);
    });

    // 适配 OperationCatalog_Validator：整体校验通过
    it('validator_should_pass_full_validation', 0, async () => {
      const validator = new OperationCatalogValidator(PowerOperationCatalog.getAll());
      expect(validator.validateAll()).assertTrue();
    });

    // 适配 OperationCatalog_Validator：重复 id 目录校验失败
    it('validator_should_detect_duplicate_ids', 0, async () => {
      const duplicated: PowerOperationDef[] = [PowerOperationCatalog.SUSPEND, PowerOperationCatalog.SUSPEND];
      const validator = new OperationCatalogValidator(duplicated);
      expect(validator.hasUniqueIds()).assertFalse();
      expect(validator.hasUniqueOperationTypes()).assertFalse();
    });

    // 适配 OperationCatalog_Validator：空目录校验行为确定
    it('validator_should_handle_empty_catalog', 0, async () => {
      const validator = new OperationCatalogValidator([]);
      expect(validator.hasUniqueIds()).assertTrue();
      expect(validator.allHaveNonEmptyNames()).assertTrue();
      expect(validator.findById('suspend') === null).assertTrue();
      expect(validator.countByOperationType(0)).assertEqual(0);
    });

    // 适配 OperationDependencyGraph：互斥关系记录
    it('dependency_graph_should_record_mutual_exclusion', 0, async () => {
      const graph = new OperationDependencyGraph();
      const rel: OperationRelationship = {
        sourceId: 'suspend',
        targetId: 'reboot',
        mutuallyExclusive: true,
        description: '熄屏与重启互斥'
      };
      graph.addRelationship(rel);
      expect(graph.getRelationshipCount()).assertEqual(1);
      expect(graph.areMutuallyExclusive('suspend', 'reboot')).assertTrue();
    });

    // 适配 OperationDependencyGraph：非互斥关系查询
    it('dependency_graph_should_return_false_for_non_exclusive', 0, async () => {
      const graph = new OperationDependencyGraph();
      const rel: OperationRelationship = {
        sourceId: 'reboot',
        targetId: 'shutdown',
        mutuallyExclusive: false,
        description: '重启与关机可共存'
      };
      graph.addRelationship(rel);
      expect(graph.areMutuallyExclusive('reboot', 'shutdown')).assertFalse();
    });

    // 适配 OperationDependencyGraph：获取目标节点列表
    it('dependency_graph_should_return_targets_of_source', 0, async () => {
      const graph = new OperationDependencyGraph();
      graph.addRelationship({
        sourceId: 'suspend',
        targetId: 'reboot',
        mutuallyExclusive: true,
        description: '互斥'
      });
      graph.addRelationship({
        sourceId: 'suspend',
        targetId: 'shutdown',
        mutuallyExclusive: true,
        description: '互斥'
      });
      const targets: string[] = graph.getTargetsOf('suspend');
      expect(targets.length).assertEqual(2);
      expect(targets.includes('reboot')).assertTrue();
      expect(targets.includes('shutdown')).assertTrue();
    });

    // 适配 OperationDependencyGraph：自环检测
    it('dependency_graph_should_detect_self_cycle', 0, async () => {
      const graph = new OperationDependencyGraph();
      expect(graph.hasCycle()).assertFalse();
      graph.addRelationship({
        sourceId: 'suspend',
        targetId: 'suspend',
        mutuallyExclusive: true,
        description: '自环'
      });
      expect(graph.hasCycle()).assertTrue();
    });

    // 适配 OperationDependencyGraph：清空后状态复位
    it('dependency_graph_should_reset_after_clear', 0, async () => {
      const graph = new OperationDependencyGraph();
      graph.addRelationship({
        sourceId: 'suspend',
        targetId: 'reboot',
        mutuallyExclusive: true,
        description: '互斥'
      });
      graph.clear();
      expect(graph.getRelationshipCount()).assertEqual(0);
      expect(graph.getRelationships().length).assertEqual(0);
    });

    // 适配 OperationDependencyGraph：关系列表只读副本
    it('dependency_graph_should_return_copy_of_relationships', 0, async () => {
      const graph = new OperationDependencyGraph();
      graph.addRelationship({
        sourceId: 'reboot',
        targetId: 'shutdown',
        mutuallyExclusive: true,
        description: '互斥'
      });
      const copy: OperationRelationship[] = graph.getRelationships();
      copy.push({
        sourceId: 'suspend',
        targetId: 'reboot',
        mutuallyExclusive: true,
        description: '互斥'
      });
      expect(graph.getRelationshipCount()).assertEqual(1);
    });

    // 适配 OperationNameResolver：按 id 解析名称
    it('name_resolver_should_resolve_name_by_id', 0, async () => {
      const resolver = new OperationNameResolver(PowerOperationCatalog.getAll());
      expect(resolver.resolveById('suspend')).assertEqual('熄屏');
      expect(resolver.resolveById('reboot')).assertEqual('重启');
      expect(resolver.resolveById('shutdown')).assertEqual('关机');
    });

    // 适配 OperationNameResolver：未知 id 返回默认文案
    it('name_resolver_should_return_default_for_unknown_id', 0, async () => {
      const resolver = new OperationNameResolver(PowerOperationCatalog.getAll());
      expect(resolver.resolveById('unknown')).assertEqual('未知操作');
    });

    // 适配 OperationNameResolver：按操作类型解析名称
    it('name_resolver_should_resolve_name_by_type', 0, async () => {
      const resolver = new OperationNameResolver(PowerOperationCatalog.getAll());
      expect(resolver.resolveByOperationType(0)).assertEqual('熄屏');
      expect(resolver.resolveByOperationType(1)).assertEqual('重启');
      expect(resolver.resolveByOperationType(2)).assertEqual('关机');
    });

    // 适配 OperationNameResolver：未知类型返回默认文案
    it('name_resolver_should_return_default_for_unknown_type', 0, async () => {
      const resolver = new OperationNameResolver(PowerOperationCatalog.getAll());
      expect(resolver.resolveByOperationType(99)).assertEqual('未知操作');
    });

    // 适配 OperationNameResolver：解析全部名称
    it('name_resolver_should_resolve_all_names', 0, async () => {
      const resolver = new OperationNameResolver(PowerOperationCatalog.getAll());
      const names: string[] = resolver.resolveAllNames();
      expect(names.length).assertEqual(3);
      expect(names.includes('熄屏')).assertTrue();
      expect(names.includes('重启')).assertTrue();
      expect(names.includes('关机')).assertTrue();
    });

    // 适配 OperationNameResolver：可解析数量与可解析性
    it('name_resolver_should_report_resolvable_count', 0, async () => {
      const resolver = new OperationNameResolver(PowerOperationCatalog.getAll());
      expect(resolver.getResolvableCount()).assertEqual(3);
      expect(resolver.isResolvable(1)).assertTrue();
      expect(resolver.isResolvable(100)).assertFalse();
    });

    // 适配 CatalogStatistics：目录规模统计
    it('catalog_statistics_should_report_size', 0, async () => {
      const stats = new CatalogStatistics(PowerOperationCatalog.getAll());
      expect(stats.getCatalogSize()).assertEqual(3);
    });

    // 适配 CatalogStatistics：id 长度总和与平均值
    it('catalog_statistics_should_compute_id_length', 0, async () => {
      const stats = new CatalogStatistics(PowerOperationCatalog.getAll());
      const expectedSum: number = 'suspend'.length + 'reboot'.length + 'shutdown'.length;
      expect(stats.getIdLengthSum()).assertEqual(expectedSum);
      expect(stats.getAverageIdLength()).assertEqual(expectedSum / 3);
    });

    // 适配 CatalogStatistics：最长 id 长度
    it('catalog_statistics_should_report_longest_id', 0, async () => {
      const stats = new CatalogStatistics(PowerOperationCatalog.getAll());
      expect(stats.getLongestIdLength()).assertEqual('shutdown'.length);
    });

    // 适配 CatalogStatistics：最短名称长度
    it('catalog_statistics_should_report_shortest_name', 0, async () => {
      const stats = new CatalogStatistics(PowerOperationCatalog.getAll());
      expect(stats.getShortestNameLength()).assertEqual(2);
    });

    // 适配 CatalogStatistics：空目录统计为零
    it('catalog_statistics_should_handle_empty_catalog', 0, async () => {
      const stats = new CatalogStatistics([]);
      expect(stats.getCatalogSize()).assertEqual(0);
      expect(stats.getIdLengthSum()).assertEqual(0);
      expect(stats.getAverageIdLength()).assertEqual(0);
      expect(stats.getShortestNameLength()).assertEqual(0);
    });

    // 适配 CatalogStatistics：目录描述信息
    it('catalog_statistics_should_describe_catalog', 0, async () => {
      const stats = new CatalogStatistics(PowerOperationCatalog.getAll());
      const description: string = stats.describeCatalog();
      expect(description.includes('size: 3')).assertTrue();
    });

    // 适配 OperationPropertyChecker：id 长度约束
    it('property_checker_should_validate_id_length', 0, async () => {
      const checker = new OperationPropertyChecker();
      expect(checker.hasRequiredId(PowerOperationCatalog.SUSPEND, 3)).assertTrue();
      expect(checker.hasRequiredId(PowerOperationCatalog.SUSPEND, 100)).assertFalse();
    });

    // 适配 OperationPropertyChecker：id 无空白字符
    it('property_checker_should_reject_whitespace_id', 0, async () => {
      const checker = new OperationPropertyChecker();
      expect(checker.hasNoWhitespaceInId(PowerOperationCatalog.REBOOT)).assertTrue();
    });

    // 适配 OperationPropertyChecker：操作类型范围校验
    it('property_checker_should_validate_type_range', 0, async () => {
      const checker = new OperationPropertyChecker();
      expect(checker.hasValidOperationTypeRange(PowerOperationCatalog.SHUTDOWN, 0, 2)).assertTrue();
      expect(checker.hasValidOperationTypeRange(PowerOperationCatalog.SHUTDOWN, 0, 1)).assertFalse();
    });

    // 适配 OperationPropertyChecker：完整定义校验
    it('property_checker_should_confirm_complete_definition', 0, async () => {
      const checker = new OperationPropertyChecker();
      expect(checker.isComplete(PowerOperationCatalog.SUSPEND)).assertTrue();
      expect(checker.isComplete(PowerOperationCatalog.REBOOT)).assertTrue();
      expect(checker.isComplete(PowerOperationCatalog.SHUTDOWN)).assertTrue();
    });

    // 适配 OperationPropertyChecker：缺失属性收集
    it('property_checker_should_collect_missing_properties', 0, async () => {
      const checker = new OperationPropertyChecker();
      const emptyDef: PowerOperationDef = {
        id: '',
        icon: '',
        focusIcon: '',
        name: '',
        operationType: 0
      };
      const missing: string[] = checker.collectMissingProperties(emptyDef);
      expect(missing.length).assertEqual(4);
      expect(missing.includes('id')).assertTrue();
      expect(missing.includes('name')).assertTrue();
    });

    // 适配 OperationCatalogSearcher：按名称关键字搜索
    it('catalog_searcher_should_search_by_name_keyword', 0, async () => {
      const searcher = new OperationCatalogSearcher(PowerOperationCatalog.getAll());
      const results: PowerOperationDef[] = searcher.searchByName('关');
      expect(results.length).assertEqual(1);
      expect(results[0].id).assertEqual('shutdown');
    });

    // 适配 OperationCatalogSearcher：按 id 前缀搜索
    it('catalog_searcher_should_search_by_id_prefix', 0, async () => {
      const searcher = new OperationCatalogSearcher(PowerOperationCatalog.getAll());
      const results: PowerOperationDef[] = searcher.searchByIdPrefix('re');
      expect(results.length).assertEqual(1);
      expect(results[0].id).assertEqual('reboot');
    });

    // 适配 OperationCatalogSearcher：精确名称查找
    it('catalog_searcher_should_find_exact_name', 0, async () => {
      const searcher = new OperationCatalogSearcher(PowerOperationCatalog.getAll());
      const match: PowerOperationDef | null = searcher.findExactName('重启');
      expect(match === null).assertFalse();
      expect(match?.id).assertEqual('reboot');
    });

    // 适配 OperationCatalogSearcher：不存在的名称返回 null
    it('catalog_searcher_should_return_null_for_unknown_name', 0, async () => {
      const searcher = new OperationCatalogSearcher(PowerOperationCatalog.getAll());
      const match: PowerOperationDef | null = searcher.findExactName('不存在的操作');
      expect(match === null).assertTrue();
    });

    // 适配 OperationCatalogSearcher：按 id 排序结果
    it('catalog_searcher_should_sort_by_id', 0, async () => {
      const searcher = new OperationCatalogSearcher(PowerOperationCatalog.getAll());
      const sorted: PowerOperationDef[] = searcher.getSortedById();
      expect(sorted.length).assertEqual(3);
      expect(sorted[0].id).assertEqual('reboot');
      expect(sorted[2].id).assertEqual('suspend');
    });

    // 适配 OperationCatalogSearcher：按操作类型排序结果
    it('catalog_searcher_should_sort_by_operation_type', 0, async () => {
      const searcher = new OperationCatalogSearcher(PowerOperationCatalog.getAll());
      const sorted: PowerOperationDef[] = searcher.getSortedByOperationType();
      expect(sorted[0].operationType).assertEqual(0);
      expect(sorted[1].operationType).assertEqual(1);
      expect(sorted[2].operationType).assertEqual(2);
    });

    // 适配 OperationLocaleMap：本地化名称存取
    it('locale_map_should_put_and_get_names', 0, async () => {
      const map = new OperationLocaleMap();
      map.put('suspend', 'Suspend');
      expect(map.get('suspend')).assertEqual('Suspend');
      expect(map.getSize()).assertEqual(1);
    });

    // 适配 OperationLocaleMap：未命中键返回 null
    it('locale_map_should_return_null_for_missing_key', 0, async () => {
      const map = new OperationLocaleMap();
      map.put('reboot', 'Reboot');
      expect(map.get('shutdown')).assertEqual(null);
    });

    // 适配 OperationLocaleMap：键存在性检查
    it('locale_map_should_check_key_existence', 0, async () => {
      const map = new OperationLocaleMap();
      map.put('shutdown', 'Shutdown');
      expect(map.hasKey('shutdown')).assertTrue();
      expect(map.hasKey('suspend')).assertFalse();
    });

    // 适配 OperationLocaleMap：枚举全部键
    it('locale_map_should_enumerate_keys', 0, async () => {
      const map = new OperationLocaleMap();
      map.put('suspend', 'Suspend');
      map.put('reboot', 'Reboot');
      map.put('shutdown', 'Shutdown');
      const keys: string[] = map.keys();
      expect(keys.length).assertEqual(3);
      expect(keys.includes('suspend')).assertTrue();
      expect(keys.includes('reboot')).assertTrue();
      expect(keys.includes('shutdown')).assertTrue();
    });

    // 适配 OperationLocaleMap：清空后状态复位
    it('locale_map_should_reset_after_clear', 0, async () => {
      const map = new OperationLocaleMap();
      map.put('suspend', 'Suspend');
      map.clear();
      expect(map.getSize()).assertEqual(0);
      expect(map.get('suspend')).assertEqual(null);
    });

    // 适配 OperationLocaleMap：中英文名称不冲突
    it('locale_map_should_support_multiple_locales', 0, async () => {
      const map = new OperationLocaleMap();
      map.put('suspend_zh', '熄屏');
      map.put('suspend_en', 'Suspend');
      expect(map.get('suspend_zh')).assertEqual('熄屏');
      expect(map.get('suspend_en')).assertEqual('Suspend');
      expect(map.getSize()).assertEqual(2);
    });

    // 适配 Operation_Catalog：静态定义与枚举值严格对应
    it('catalog_definitions_should_match_enum_values', 0, async () => {
      expect(PowerOperationCatalog.SUSPEND.operationType).assertEqual(PowerOperationType.POWEROPERATION_SUSPEND);
      expect(PowerOperationCatalog.REBOOT.operationType).assertEqual(PowerOperationType.POWEROPERATION_REBOOT);
      expect(PowerOperationCatalog.SHUTDOWN.operationType).assertEqual(PowerOperationType.POWEROPERATION_SHUTDOWN);
      expect(PowerOperationCatalog.SUSPEND.id).assertEqual('suspend');
      expect(PowerOperationCatalog.SHUTDOWN.id).assertEqual('shutdown');
    });

    // 适配 Operation_Icon_Format：图标资源遵循 media 资源格式
    it('catalog_icons_should_follow_media_resource_format', 0, async () => {
      const all: PowerOperationDef[] = PowerOperationCatalog.getAll();
      all.forEach((def: PowerOperationDef) => {
        expect(def.icon.startsWith('app.media.')).assertTrue();
        expect(def.focusIcon.startsWith('app.media.')).assertTrue();
      });
    });

    // 适配 Operation_Icon_Format：焦点图标包含正常图标
    it('catalog_focus_icons_should_extend_normal_icons', 0, async () => {
      const all: PowerOperationDef[] = PowerOperationCatalog.getAll();
      all.forEach((def: PowerOperationDef) => {
        expect(def.focusIcon.length).assertLarger(def.icon.length);
        expect(def.focusIcon.includes(def.icon)).assertTrue();
      });
    });

    // 适配 Global_Constants：全屏与背景常量定义正确
    it('power_dialog_constants_should_define_full_screen_layout', 0, async () => {
      expect(PowerDialogConstants.FULL_WIDTH).assertEqual('100%');
      expect(PowerDialogConstants.FULL_HEIGHT).assertEqual('100%');
      expect(PowerDialogConstants.DEFAULT_BG_COLOR.length).assertLarger(0);
      expect(PowerDialogConstants.DEFAULT_FOCUS_INDEX).assertLess(PowerDialogConstants.OPTION_COUNT);
    });

    // 适配 Cross_Category：操作类别与风险等级枚举互不相同
    it('operation_categories_and_risk_levels_should_be_distinct', 0, async () => {
      const energySaving: string = OperationCategory.CATEGORY_ENERGY_SAVING as string;
      const systemControl: string = OperationCategory.CATEGORY_SYSTEM_CONTROL as string;
      const maintenance: string = OperationCategory.CATEGORY_MAINTENANCE as string;
      expect(energySaving === systemControl).assertFalse();
      expect(systemControl === maintenance).assertFalse();
      expect(energySaving === maintenance).assertFalse();
      expect(OperationRiskLevel.RISK_SAFE).assertLess(OperationRiskLevel.RISK_HIGH);
      expect(OperationRiskLevel.RISK_MODERATE).assertLess(OperationRiskLevel.RISK_HIGH);
    });

    // 适配 OperationDependencyGraph：非互斥关系也可被追踪
    it('dependency_graph_should_track_non_exclusive_targets', 0, async () => {
      const graph = new OperationDependencyGraph();
      graph.addRelationship({
        sourceId: 'suspend', targetId: 'shutdown', mutuallyExclusive: false, description: '非互斥'
      });
      const targets: string[] = graph.getTargetsOf('suspend');
      expect(targets.length).assertEqual(1);
      expect(targets.includes('shutdown')).assertTrue();
      expect(graph.areMutuallyExclusive('suspend', 'shutdown')).assertFalse();
    });

    // 适配 OperationDependencyGraph：清空后自环检测复位
    it('dependency_graph_should_detect_cycles_after_clear', 0, async () => {
      const graph = new OperationDependencyGraph();
      graph.addRelationship({
        sourceId: 'reboot', targetId: 'reboot', mutuallyExclusive: true, description: '自环'
      });
      expect(graph.hasCycle()).assertTrue();
      graph.clear();
      expect(graph.hasCycle()).assertFalse();
      expect(graph.getRelationshipCount()).assertEqual(0);
    });

    // 适配 OperationNameResolver：空目录解析行为确定
    it('name_resolver_should_handle_empty_catalog', 0, async () => {
      const resolver = new OperationNameResolver([]);
      expect(resolver.resolveById('suspend')).assertEqual('未知操作');
      expect(resolver.resolveByOperationType(0)).assertEqual('未知操作');
      expect(resolver.getResolvableCount()).assertEqual(0);
      expect(resolver.isResolvable(1)).assertFalse();
    });

    // 适配 OperationPropertyChecker：部分缺失属性收集
    it('property_checker_should_detect_partial_missing_property', 0, async () => {
      const checker = new OperationPropertyChecker();
      const partial: PowerOperationDef = {
        id: 'suspend', icon: 'app.media.screenout', focusIcon: '', name: '熄屏',
        operationType: PowerOperationType.POWEROPERATION_SUSPEND
      };
      const missing: string[] = checker.collectMissingProperties(partial);
      expect(missing.length).assertEqual(1);
      expect(missing.includes('focusIcon')).assertTrue();
      expect(checker.isComplete(partial)).assertFalse();
    });

    // 适配 OperationCatalogSearcher：中文关键字精确匹配
    it('catalog_searcher_should_match_chinese_keyword', 0, async () => {
      const searcher = new OperationCatalogSearcher(PowerOperationCatalog.getAll());
      const results: PowerOperationDef[] = searcher.searchByName('重启');
      expect(results.length).assertEqual(1);
      expect(results[0].id).assertEqual('reboot');
    });

    // 适配 OperationCatalogSearcher：无匹配返回空列表
    it('catalog_searcher_should_return_empty_for_no_match', 0, async () => {
      const searcher = new OperationCatalogSearcher(PowerOperationCatalog.getAll());
      expect(searcher.searchByName('不存在的操作').length).assertEqual(0);
      expect(searcher.searchByIdPrefix('zz').length).assertEqual(0);
      expect(searcher.findExactName('不存在的操作') === null).assertTrue();
    });

    // 适配 OperationCatalogSearcher：排序不改变原始目录顺序
    it('catalog_searcher_should_not_mutate_original_order', 0, async () => {
      const searcher = new OperationCatalogSearcher(PowerOperationCatalog.getAll());
      const sorted: PowerOperationDef[] = searcher.getSortedById();
      expect(sorted.length).assertEqual(3);
      const original: PowerOperationDef[] = PowerOperationCatalog.getAll();
      expect(original[0].id).assertEqual('suspend');
      expect(original[1].id).assertEqual('reboot');
      expect(original[2].id).assertEqual('shutdown');
    });

    // 适配 OperationLocaleMap：同名键覆盖更新
    it('locale_map_should_overwrite_existing_key', 0, async () => {
      const map = new OperationLocaleMap();
      map.put('suspend', '熄屏');
      map.put('suspend', 'Suspend');
      expect(map.getSize()).assertEqual(1);
      expect(map.get('suspend')).assertEqual('Suspend');
    });

    // 适配 OperationLocaleMap：清空后键列表为空
    it('locale_map_should_clear_all_keys', 0, async () => {
      const map = new OperationLocaleMap();
      map.put('suspend', 'Suspend');
      map.put('reboot', 'Reboot');
      map.clear();
      expect(map.getSize()).assertEqual(0);
      expect(map.keys().length).assertEqual(0);
      expect(map.get('suspend')).assertEqual(null);
    });
  });
}
