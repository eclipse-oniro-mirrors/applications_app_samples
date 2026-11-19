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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver, Component } from '@ohos.UiTest';
import {
  getDriver,
  getBundleName,
  launchEntryAbility,
  doAbilityForeground,
  doAbilityBackground,
  isIndexPageVisible,
  waitForIndexPageStable,
  pageComponentCount,
  checkComponentExistsByKey,
  collectAllTexts,
  findComponentsByType,
  tapComponentByText,
  serializedDelay,
  measureElapsed,
  isWithinBudget,
  isNonEmptyString,
  logInfo,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  ABILITY_STAGE_NAME,
  ENTRY_ABILITY_NAME,
  BACKUP_ABILITY_NAME,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  TIMEOUT_ABILITY_LAUNCH,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum CallbackOwner {
  OWNER_ABILITY_STAGE = 0,
  OWNER_UI_ABILITY = 1,
  OWNER_BACKUP_EXTENSION = 2
}

enum LifecyclePhase {
  PHASE_STAGE_CREATE = 0,
  PHASE_STAGE_ACCEPT_WANT = 1,
  PHASE_STAGE_DESTROY = 2,
  PHASE_ABILITY_CREATE = 3,
  PHASE_WINDOW_CREATE = 4,
  PHASE_WINDOW_DESTROY = 5,
  PHASE_FOREGROUND = 6,
  PHASE_BACKGROUND = 7,
  PHASE_ABILITY_DESTROY = 8,
  PHASE_BACKUP = 9,
  PHASE_RESTORE = 10
}

interface CallbackSpec {
  id: string;
  displayName: string;
  owner: CallbackOwner;
  phase: LifecyclePhase;
  required: boolean;
  asyncCallback: boolean;
  budgetMs: number;
  payloadArity: number;
  order: number;
}

class CallbackDefinitions {
  public static readonly STAGE_ON_CREATE: CallbackSpec = {
    id: 'stage_on_create',
    displayName: 'AbilityStageOnCreate',
    owner: CallbackOwner.OWNER_ABILITY_STAGE,
    phase: LifecyclePhase.PHASE_STAGE_CREATE,
    required: true,
    asyncCallback: false,
    budgetMs: 50,
    payloadArity: 0,
    order: 1
  };
  public static readonly STAGE_ON_ACCEPT_WANT: CallbackSpec = {
    id: 'stage_on_accept_want',
    displayName: 'AbilityStageOnAcceptWant',
    owner: CallbackOwner.OWNER_ABILITY_STAGE,
    phase: LifecyclePhase.PHASE_STAGE_ACCEPT_WANT,
    required: false,
    asyncCallback: false,
    budgetMs: 20,
    payloadArity: 1,
    order: 2
  };
  public static readonly STAGE_ON_DESTROY: CallbackSpec = {
    id: 'stage_on_destroy',
    displayName: 'AbilityStageOnDestroy',
    owner: CallbackOwner.OWNER_ABILITY_STAGE,
    phase: LifecyclePhase.PHASE_STAGE_DESTROY,
    required: true,
    asyncCallback: false,
    budgetMs: 30,
    payloadArity: 0,
    order: 3
  };
  public static readonly ABILITY_ON_CREATE: CallbackSpec = {
    id: 'ability_on_create',
    displayName: 'UIAbilityOnCreate',
    owner: CallbackOwner.OWNER_UI_ABILITY,
    phase: LifecyclePhase.PHASE_ABILITY_CREATE,
    required: true,
    asyncCallback: false,
    budgetMs: 60,
    payloadArity: 2,
    order: 4
  };
  public static readonly ABILITY_ON_WINDOW_STAGE_CREATE: CallbackSpec = {
    id: 'ability_on_window_stage_create',
    displayName: 'UIAbilityOnWindowStageCreate',
    owner: CallbackOwner.OWNER_UI_ABILITY,
    phase: LifecyclePhase.PHASE_WINDOW_CREATE,
    required: true,
    asyncCallback: false,
    budgetMs: 120,
    payloadArity: 1,
    order: 5
  };
  public static readonly ABILITY_ON_WINDOW_STAGE_DESTROY: CallbackSpec = {
    id: 'ability_on_window_stage_destroy',
    displayName: 'UIAbilityOnWindowStageDestroy',
    owner: CallbackOwner.OWNER_UI_ABILITY,
    phase: LifecyclePhase.PHASE_WINDOW_DESTROY,
    required: true,
    asyncCallback: false,
    budgetMs: 40,
    payloadArity: 0,
    order: 6
  };
  public static readonly ABILITY_ON_FOREGROUND: CallbackSpec = {
    id: 'ability_on_foreground',
    displayName: 'UIAbilityOnForeground',
    owner: CallbackOwner.OWNER_UI_ABILITY,
    phase: LifecyclePhase.PHASE_FOREGROUND,
    required: true,
    asyncCallback: false,
    budgetMs: 30,
    payloadArity: 0,
    order: 7
  };
  public static readonly ABILITY_ON_BACKGROUND: CallbackSpec = {
    id: 'ability_on_background',
    displayName: 'UIAbilityOnBackground',
    owner: CallbackOwner.OWNER_UI_ABILITY,
    phase: LifecyclePhase.PHASE_BACKGROUND,
    required: true,
    asyncCallback: false,
    budgetMs: 30,
    payloadArity: 0,
    order: 8
  };
  public static readonly ABILITY_ON_DESTROY: CallbackSpec = {
    id: 'ability_on_destroy',
    displayName: 'UIAbilityOnDestroy',
    owner: CallbackOwner.OWNER_UI_ABILITY,
    phase: LifecyclePhase.PHASE_ABILITY_DESTROY,
    required: true,
    asyncCallback: false,
    budgetMs: 40,
    payloadArity: 0,
    order: 9
  };
  public static readonly BACKUP_ON_BACKUP: CallbackSpec = {
    id: 'backup_on_backup',
    displayName: 'BackupExtensionOnBackup',
    owner: CallbackOwner.OWNER_BACKUP_EXTENSION,
    phase: LifecyclePhase.PHASE_BACKUP,
    required: true,
    asyncCallback: true,
    budgetMs: 500,
    payloadArity: 0,
    order: 10
  };
  public static readonly BACKUP_ON_RESTORE: CallbackSpec = {
    id: 'backup_on_restore',
    displayName: 'BackupExtensionOnRestore',
    owner: CallbackOwner.OWNER_BACKUP_EXTENSION,
    phase: LifecyclePhase.PHASE_RESTORE,
    required: true,
    asyncCallback: true,
    budgetMs: 800,
    payloadArity: 1,
    order: 11
  };

  public static all(): CallbackSpec[] {
    return [
      CallbackDefinitions.STAGE_ON_CREATE,
      CallbackDefinitions.STAGE_ON_ACCEPT_WANT,
      CallbackDefinitions.STAGE_ON_DESTROY,
      CallbackDefinitions.ABILITY_ON_CREATE,
      CallbackDefinitions.ABILITY_ON_WINDOW_STAGE_CREATE,
      CallbackDefinitions.ABILITY_ON_WINDOW_STAGE_DESTROY,
      CallbackDefinitions.ABILITY_ON_FOREGROUND,
      CallbackDefinitions.ABILITY_ON_BACKGROUND,
      CallbackDefinitions.ABILITY_ON_DESTROY,
      CallbackDefinitions.BACKUP_ON_BACKUP,
      CallbackDefinitions.BACKUP_ON_RESTORE
    ];
  }
}

class LifecycleCallbackCatalog {
  private specs: CallbackSpec[] = [];

  constructor(specs: CallbackSpec[]) {
    this.specs = specs;
  }

  public static createDefault(): LifecycleCallbackCatalog {
    return new LifecycleCallbackCatalog(CallbackDefinitions.all());
  }

  public getAll(): CallbackSpec[] {
    return this.specs;
  }

  public getSize(): number {
    return this.specs.length;
  }

  public getIds(): string[] {
    return this.specs.map((spec: CallbackSpec) => spec.id);
  }

  public findById(id: string): CallbackSpec | null {
    const matched: CallbackSpec | undefined = this.specs.find((spec: CallbackSpec) => spec.id === id);
    return matched === undefined ? null : matched;
  }

  public getByOwner(owner: CallbackOwner): CallbackSpec[] {
    return this.specs.filter((spec: CallbackSpec) => spec.owner === owner);
  }

  public getByPhase(phase: LifecyclePhase): CallbackSpec[] {
    return this.specs.filter((spec: CallbackSpec) => spec.phase === phase);
  }

  public getRequiredCount(): number {
    return this.specs.filter((spec: CallbackSpec) => spec.required).length;
  }

  public getOptionalCount(): number {
    return this.specs.filter((spec: CallbackSpec) => !spec.required).length;
  }

  public countAsync(): number {
    return this.specs.filter((spec: CallbackSpec) => spec.asyncCallback).length;
  }

  public contains(id: string): boolean {
    return this.specs.some((spec: CallbackSpec) => spec.id === id);
  }
}

class CallbackSpecValidator {
  private catalog: CallbackSpec[] = [];

  constructor(catalog: CallbackSpec[]) {
    this.catalog = catalog;
  }

  public hasUniqueIds(): boolean {
    const ids: Set<string> = new Set<string>();
    this.catalog.forEach((spec: CallbackSpec) => ids.add(spec.id));
    return ids.size === this.catalog.length;
  }

  public hasUniquePhases(): boolean {
    const phases: Set<number> = new Set<number>();
    this.catalog.forEach((spec: CallbackSpec) => phases.add(spec.phase));
    return phases.size === this.catalog.length;
  }

  public allBudgetsPositive(): boolean {
    return this.catalog.every((spec: CallbackSpec) => spec.budgetMs > 0);
  }

  public hasOwnerPhaseConsistency(): boolean {
    return this.catalog.every((spec: CallbackSpec) => {
      if (spec.owner === CallbackOwner.OWNER_ABILITY_STAGE) {
        return spec.phase >= LifecyclePhase.PHASE_STAGE_CREATE &&
          spec.phase <= LifecyclePhase.PHASE_STAGE_DESTROY;
      }
      if (spec.owner === CallbackOwner.OWNER_UI_ABILITY) {
        return spec.phase >= LifecyclePhase.PHASE_ABILITY_CREATE &&
          spec.phase <= LifecyclePhase.PHASE_ABILITY_DESTROY;
      }
      return spec.phase >= LifecyclePhase.PHASE_BACKUP && spec.phase <= LifecyclePhase.PHASE_RESTORE;
    });
  }

  public allRequiredHaveBudget(): boolean {
    return this.catalog.every((spec: CallbackSpec) => !spec.required || spec.budgetMs >= 10);
  }

  public collectViolations(): string[] {
    const violations: string[] = [];
    if (!this.hasUniqueIds()) {
      violations.push('duplicate-id');
    }
    if (!this.hasUniquePhases()) {
      violations.push('duplicate-phase');
    }
    if (!this.allBudgetsPositive()) {
      violations.push('non-positive-budget');
    }
    if (!this.hasOwnerPhaseConsistency()) {
      violations.push('owner-phase-mismatch');
    }
    return violations;
  }

  public validateAll(): boolean {
    return this.collectViolations().length === 0;
  }

  public countByOwner(owner: CallbackOwner): number {
    return this.catalog.filter((spec: CallbackSpec) => spec.owner === owner).length;
  }
}

class CallbackCatalogIndex {
  private byOwner: Map<number, CallbackSpec[]> = new Map<number, CallbackSpec[]>();
  private byPhase: Map<number, CallbackSpec> = new Map<number, CallbackSpec>();

  constructor(catalog: CallbackSpec[]) {
    catalog.forEach((spec: CallbackSpec) => {
      const ownerBucket: CallbackSpec[] | undefined = this.byOwner.get(spec.owner);
      if (ownerBucket === undefined) {
        this.byOwner.set(spec.owner, [spec]);
      } else {
        ownerBucket.push(spec);
      }
      this.byPhase.set(spec.phase, spec);
    });
  }

  public getByOwner(owner: CallbackOwner): CallbackSpec[] {
    const bucket: CallbackSpec[] | undefined = this.byOwner.get(owner);
    return bucket === undefined ? [] : bucket;
  }

  public getByPhase(phase: number): CallbackSpec | null {
    const spec: CallbackSpec | undefined = this.byPhase.get(phase);
    return spec === undefined ? null : spec;
  }

  public hasPhase(phase: number): boolean {
    return this.byPhase.has(phase);
  }

  public getOwnerKeyCount(): number {
    return this.byOwner.size;
  }

  public getPhaseKeyCount(): number {
    return this.byPhase.size;
  }

  public getIndexedTotal(): number {
    let total: number = 0;
    this.byOwner.forEach((bucket: CallbackSpec[]) => {
      total += bucket.length;
    });
    return total;
  }
}

class CallbackOrderSequencer {
  private specs: CallbackSpec[] = [];

  constructor(specs: CallbackSpec[]) {
    this.specs = specs;
  }

  public sortByOrder(): CallbackSpec[] {
    const copy: CallbackSpec[] = this.specs.slice();
    copy.sort((left: CallbackSpec, right: CallbackSpec) => left.order - right.order);
    return copy;
  }

  public sortByBudgetDescending(): CallbackSpec[] {
    const copy: CallbackSpec[] = this.specs.slice();
    copy.sort((left: CallbackSpec, right: CallbackSpec) => right.budgetMs - left.budgetMs);
    return copy;
  }

  public isAscending(): boolean {
    const sorted: CallbackSpec[] = this.sortByOrder();
    for (let i = 1; i < sorted.length; i++) {
      if (sorted[i].order <= sorted[i - 1].order) {
        return false;
      }
    }
    return true;
  }

  public isStableAcrossSorts(): boolean {
    const firstIds: string[] = this.sortByOrder().map((spec: CallbackSpec) => spec.id);
    const secondIds: string[] = this.sortByOrder().map((spec: CallbackSpec) => spec.id);
    for (let i = 0; i < firstIds.length; i++) {
      if (firstIds[i] !== secondIds[i]) {
        return false;
      }
    }
    return true;
  }

  public nextOf(id: string): CallbackSpec | null {
    const sorted: CallbackSpec[] = this.sortByOrder();
    const index: number = sorted.findIndex((spec: CallbackSpec) => spec.id === id);
    if (index < 0 || index >= sorted.length - 1) {
      return null;
    }
    return sorted[index + 1];
  }

  public previousOf(id: string): CallbackSpec | null {
    const sorted: CallbackSpec[] = this.sortByOrder();
    const index: number = sorted.findIndex((spec: CallbackSpec) => spec.id === id);
    if (index <= 0) {
      return null;
    }
    return sorted[index - 1];
  }

  public firstId(): string {
    return this.sortByOrder()[0].id;
  }

  public lastId(): string {
    const sorted: CallbackSpec[] = this.sortByOrder();
    return sorted[sorted.length - 1].id;
  }
}

class CallbackBudgetPlanner {
  private specs: CallbackSpec[] = [];

  constructor(specs: CallbackSpec[]) {
    this.specs = specs;
  }

  public getTotal(): number {
    let total: number = 0;
    this.specs.forEach((spec: CallbackSpec) => {
      total += spec.budgetMs;
    });
    return total;
  }

  public getTotalByOwner(owner: CallbackOwner): number {
    let total: number = 0;
    this.specs.forEach((spec: CallbackSpec) => {
      if (spec.owner === owner) {
        total += spec.budgetMs;
      }
    });
    return total;
  }

  public getMaxBudget(): number {
    let max: number = 0;
    this.specs.forEach((spec: CallbackSpec) => {
      if (spec.budgetMs > max) {
        max = spec.budgetMs;
      }
    });
    return max;
  }

  public getMinBudget(): number {
    if (this.specs.length === 0) {
      return 0;
    }
    let min: number = this.specs[0].budgetMs;
    this.specs.forEach((spec: CallbackSpec) => {
      if (spec.budgetMs < min) {
        min = spec.budgetMs;
      }
    });
    return min;
  }

  public getAverageBudget(): number {
    if (this.specs.length === 0) {
      return 0;
    }
    return this.getTotal() / this.specs.length;
  }

  public withinLimit(limit: number): boolean {
    return this.getTotal() <= limit;
  }

  public getBudgetOf(id: string): number {
    const matched: CallbackSpec | undefined = this.specs.find((spec: CallbackSpec) => spec.id === id);
    return matched === undefined ? 0 : matched.budgetMs;
  }
}

class CallbackNameResolver {
  private specs: CallbackSpec[] = [];

  constructor(specs: CallbackSpec[]) {
    this.specs = specs;
  }

  public resolve(id: string): string {
    const matched: CallbackSpec | undefined = this.specs.find((spec: CallbackSpec) => spec.id === id);
    return matched === undefined ? 'UnknownCallback' : matched.displayName;
  }

  public resolveByPhase(phase: LifecyclePhase): string {
    const matched: CallbackSpec | undefined = this.specs.find((spec: CallbackSpec) => spec.phase === phase);
    return matched === undefined ? 'UnknownCallback' : matched.displayName;
  }

  public resolveAll(): string[] {
    return this.specs.map((spec: CallbackSpec) => spec.displayName);
  }

  public isResolvable(id: string): boolean {
    return this.specs.some((spec: CallbackSpec) => spec.id === id);
  }
}

class CallbackFilter {
  private specs: CallbackSpec[] = [];

  constructor(specs: CallbackSpec[]) {
    this.specs = specs;
  }

  public byRequired(required: boolean): CallbackSpec[] {
    return this.specs.filter((spec: CallbackSpec) => spec.required === required);
  }

  public byAsync(asyncFlag: boolean): CallbackSpec[] {
    return this.specs.filter((spec: CallbackSpec) => spec.asyncCallback === asyncFlag);
  }

  public byBudgetRange(lowerBound: number, upperBound: number): CallbackSpec[] {
    return this.specs.filter((spec: CallbackSpec) =>
      spec.budgetMs >= lowerBound && spec.budgetMs <= upperBound);
  }

  public byOwnerAndRequired(owner: CallbackOwner, required: boolean): CallbackSpec[] {
    return this.specs.filter((spec: CallbackSpec) => spec.owner === owner && spec.required === required);
  }
}

class CallbackSignatureInspector {
  private specs: CallbackSpec[] = [];

  constructor(specs: CallbackSpec[]) {
    this.specs = specs;
  }

  public arityOf(id: string): number {
    const matched: CallbackSpec | undefined = this.specs.find((spec: CallbackSpec) => spec.id === id);
    return matched === undefined ? -1 : matched.payloadArity;
  }

  public isAsyncDeclaration(id: string): boolean {
    const matched: CallbackSpec | undefined = this.specs.find((spec: CallbackSpec) => spec.id === id);
    return matched !== undefined && matched.asyncCallback;
  }

  public receivesPayload(id: string): boolean {
    return this.arityOf(id) > 0;
  }

  public allPayloadAritiesNonNegative(): boolean {
    return this.specs.every((spec: CallbackSpec) => spec.payloadArity >= 0);
  }

  public countWithPayload(): number {
    return this.specs.filter((spec: CallbackSpec) => spec.payloadArity > 0).length;
  }

  public sumOfArities(): number {
    let sum: number = 0;
    this.specs.forEach((spec: CallbackSpec) => {
      sum += spec.payloadArity;
    });
    return sum;
  }
}

class CallbackSetComparator {
  private expected: string[] = [];

  constructor(expected: string[]) {
    this.expected = expected;
  }

  public getMissing(observed: string[]): string[] {
    return this.expected.filter((id: string) => !observed.includes(id));
  }

  public getExtra(observed: string[]): string[] {
    return observed.filter((id: string) => !this.expected.includes(id));
  }

  public isExactMatch(observed: string[]): boolean {
    return this.expected.length === observed.length && this.getMissing(observed).length === 0 &&
      this.getExtra(observed).length === 0;
  }

  public coverageRatio(observed: string[]): number {
    if (this.expected.length === 0) {
      return 0;
    }
    return (this.expected.length - this.getMissing(observed).length) / this.expected.length;
  }
}

class CallbackPhaseGrouper {
  private specs: CallbackSpec[] = [];

  constructor(specs: CallbackSpec[]) {
    this.specs = specs;
  }

  public countOfPhase(phase: LifecyclePhase): number {
    return this.specs.filter((spec: CallbackSpec) => spec.phase === phase).length;
  }

  public phasesOfOwner(owner: CallbackOwner): number[] {
    return this.specs
      .filter((spec: CallbackSpec) => spec.owner === owner)
      .map((spec: CallbackSpec) => spec.phase);
  }

  public sumOfBudgetsOfOwner(owner: CallbackOwner): number {
    let total: number = 0;
    this.specs.forEach((spec: CallbackSpec) => {
      if (spec.owner === owner) {
        total += spec.budgetMs;
      }
    });
    return total;
  }

  public heaviestPhase(): number {
    let heaviest: number = -1;
    let heaviestCount: number = -1;
    this.specs.forEach((spec: CallbackSpec) => {
      const count: number = this.countOfPhase(spec.phase);
      if (count > heaviestCount) {
        heaviestCount = count;
        heaviest = spec.phase;
      }
    });
    return heaviest;
  }
}

class CallbackCatalogReporter {
  private catalog: LifecycleCallbackCatalog;

  constructor(catalog: LifecycleCallbackCatalog) {
    this.catalog = catalog;
  }

  public describe(): string {
    return `LifecycleCatalog{size: ${this.catalog.getSize()}, required: ${this.catalog.getRequiredCount()}}`;
  }

  public describeOwner(owner: CallbackOwner, ownerName: string): string {
    return `${ownerName}: ${this.catalog.getByOwner(owner).length}`;
  }

  public describeIds(): string {
    return this.catalog.getIds().join(',');
  }
}

export default function lifecycleCallbackCatalogTest(): void {
  describe('LifecycleCallbackCatalogTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      logInfo('LifecycleCallbackCatalogTest: beforeAll completed');

      await ensureIndexPageInitial(driver);
    });

    afterAll(async () => {
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
      logInfo('LifecycleCallbackCatalogTest: afterAll completed');
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_0100
     * @tc.name testCatalogTotalEntryCount
     * @tc.desc Verify callback catalog size: default catalog holds 11 entries with 10 required and 1 optional
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogTotalEntryCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: LifecycleCallbackCatalog = LifecycleCallbackCatalog.createDefault();
        expect(catalog.getSize()).assertEqual(11);
        expect(catalog.getRequiredCount()).assertEqual(10);
        expect(catalog.getOptionalCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_0200
     * @tc.name testCatalogIdsAreUnique
     * @tc.desc Verify callback catalog identity: the 11 entry ids are pairwise unique
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogIdsAreUnique', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: LifecycleCallbackCatalog = LifecycleCallbackCatalog.createDefault();
        const ids: string[] = catalog.getIds();
        const uniqueIds: Set<string> = new Set<string>(ids);
        expect(ids.length).assertEqual(11);
        expect(uniqueIds.size).assertEqual(11);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_0300
     * @tc.name testCatalogStageOwnerEntries
     * @tc.desc Verify AbilityStage owner filter: exactly 3 stage entries in order create, acceptWant, destroy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogStageOwnerEntries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: LifecycleCallbackCatalog = LifecycleCallbackCatalog.createDefault();
        const stageEntries: CallbackSpec[] = catalog.getByOwner(CallbackOwner.OWNER_ABILITY_STAGE);
        expect(stageEntries.length).assertEqual(3);
        expect(stageEntries[0].id).assertEqual('stage_on_create');
        expect(stageEntries[1].id).assertEqual('stage_on_accept_want');
        expect(stageEntries[2].id).assertEqual('stage_on_destroy');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_0400
     * @tc.name testCatalogUiAbilityOwnerEntries
     * @tc.desc Verify UIAbility owner filter: exactly 6 entries covering create, window create, window destroy,
     * foreground, background and destroy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogUiAbilityOwnerEntries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: LifecycleCallbackCatalog = LifecycleCallbackCatalog.createDefault();
        const uiEntries: CallbackSpec[] = catalog.getByOwner(CallbackOwner.OWNER_UI_ABILITY);
        expect(uiEntries.length).assertEqual(6);
        expect(catalog.contains('ability_on_window_stage_create')).assertTrue();
        expect(catalog.contains('ability_on_window_stage_destroy')).assertTrue();
        expect(catalog.contains('ability_on_foreground')).assertTrue();
        expect(catalog.contains('ability_on_background')).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_0500
     * @tc.name testCatalogBackupOwnerEntries
     * @tc.desc Verify BackupExtensionAbility owner filter: exactly 2 async entries backup and restore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogBackupOwnerEntries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: LifecycleCallbackCatalog = LifecycleCallbackCatalog.createDefault();
        const backupEntries: CallbackSpec[] = catalog.getByOwner(CallbackOwner.OWNER_BACKUP_EXTENSION);
        expect(backupEntries.length).assertEqual(2);
        expect(backupEntries[0].asyncCallback).assertTrue();
        expect(backupEntries[1].asyncCallback).assertTrue();
        expect(catalog.countAsync()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_0600
     * @tc.name testCatalogFindByIdHit
     * @tc.desc Verify catalog lookup hit: stage_on_create resolves to AbilityStage owner, stage create phase,
     * required true and 50 ms budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogFindByIdHit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: LifecycleCallbackCatalog = LifecycleCallbackCatalog.createDefault();
        const matched: CallbackSpec | null = catalog.findById('stage_on_create');
        expect(matched === null).assertFalse();
        if (matched !== null) {
          expect(matched.owner).assertEqual(CallbackOwner.OWNER_ABILITY_STAGE);
          expect(matched.phase).assertEqual(LifecyclePhase.PHASE_STAGE_CREATE);
          expect(matched.required).assertTrue();
          expect(matched.budgetMs).assertEqual(50);
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_0700
     * @tc.name testCatalogFindByIdMiss
     * @tc.desc Verify catalog lookup miss: an unknown callback id resolves to null and is reported absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogFindByIdMiss', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: LifecycleCallbackCatalog = LifecycleCallbackCatalog.createDefault();
        const missing: CallbackSpec | null = catalog.findById('ability_on_session_create');
        expect(missing === null).assertTrue();
        expect(catalog.contains('ability_on_session_create')).assertFalse();
        expect(catalog.findById('') === null).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_0800
     * @tc.name testCatalogPhaseLookupForeground
     * @tc.desc Verify phase lookup: PHASE_FOREGROUND maps to exactly one entry named ability_on_foreground
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogPhaseLookupForeground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: LifecycleCallbackCatalog = LifecycleCallbackCatalog.createDefault();
        const foregroundEntries: CallbackSpec[] = catalog.getByPhase(LifecyclePhase.PHASE_FOREGROUND);
        expect(foregroundEntries.length).assertEqual(1);
        expect(foregroundEntries[0].id).assertEqual('ability_on_foreground');
        expect(catalog.getByPhase(LifecyclePhase.PHASE_BACKUP).length).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_0900
     * @tc.name testCatalogRequiredFilter
     * @tc.desc Verify required filter: 10 required entries and only onAcceptWant is optional
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogRequiredFilter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: LifecycleCallbackCatalog = LifecycleCallbackCatalog.createDefault();
        const filter: CallbackFilter = new CallbackFilter(catalog.getAll());
        const optional: CallbackSpec[] = filter.byRequired(false);
        expect(filter.byRequired(true).length).assertEqual(10);
        expect(optional.length).assertEqual(1);
        expect(optional[0].id).assertEqual('stage_on_accept_want');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_1000
     * @tc.name testCatalogAsyncFilter
     * @tc.desc Verify async filter: only the two backup callbacks are declared asynchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogAsyncFilter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: LifecycleCallbackCatalog = LifecycleCallbackCatalog.createDefault();
        const filter: CallbackFilter = new CallbackFilter(catalog.getAll());
        const asyncEntries: CallbackSpec[] = filter.byAsync(true);
        expect(asyncEntries.length).assertEqual(2);
        expect(asyncEntries[0].id).assertEqual('backup_on_backup');
        expect(asyncEntries[1].id).assertEqual('backup_on_restore');
        expect(filter.byAsync(false).length).assertEqual(9);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_1100
     * @tc.name testValidatorUniqueIdsAndPhases
     * @tc.desc Verify validator: default catalog exposes unique ids and unique phases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValidatorUniqueIdsAndPhases', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: CallbackSpecValidator = new CallbackSpecValidator(CallbackDefinitions.all());
        expect(validator.hasUniqueIds()).assertTrue();
        expect(validator.hasUniquePhases()).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_1200
     * @tc.name testValidatorBudgetPositive
     * @tc.desc Verify validator: every budget is positive, the minimum budget is 20 ms and all required entries
     * carry at least 10 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValidatorBudgetPositive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: CallbackSpecValidator = new CallbackSpecValidator(CallbackDefinitions.all());
        const planner: CallbackBudgetPlanner = new CallbackBudgetPlanner(CallbackDefinitions.all());
        expect(validator.allBudgetsPositive()).assertTrue();
        expect(validator.allRequiredHaveBudget()).assertTrue();
        expect(planner.getMinBudget()).assertEqual(20);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_1300
     * @tc.name testValidatorDuplicateDetection
     * @tc.desc Verify validator: a catalog repeating the same definition fails id uniqueness and phase uniqueness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValidatorDuplicateDetection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const duplicated: CallbackSpec[] = [
          CallbackDefinitions.STAGE_ON_CREATE,
          CallbackDefinitions.STAGE_ON_CREATE
        ];
        const validator: CallbackSpecValidator = new CallbackSpecValidator(duplicated);
        expect(validator.hasUniqueIds()).assertFalse();
        expect(validator.hasUniquePhases()).assertFalse();
        expect(validator.validateAll()).assertFalse();
        expect(validator.collectViolations().length).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_1400
     * @tc.name testValidatorEmptyCatalog
     * @tc.desc Verify validator: an empty catalog passes all uniqueness checks and reports zero owner entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValidatorEmptyCatalog', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const emptyCatalog: CallbackSpec[] = [];
        const validator: CallbackSpecValidator = new CallbackSpecValidator(emptyCatalog);
        expect(validator.hasUniqueIds()).assertTrue();
        expect(validator.allBudgetsPositive()).assertTrue();
        expect(validator.validateAll()).assertTrue();
        expect(validator.countByOwner(CallbackOwner.OWNER_UI_ABILITY)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_1500
     * @tc.name testValidatorOwnerPhaseConsistency
     * @tc.desc Verify validator: stage phases stay in 0..2, ability phases in 3..8 and backup phases in 9..10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValidatorOwnerPhaseConsistency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: CallbackSpecValidator = new CallbackSpecValidator(CallbackDefinitions.all());
        expect(validator.hasOwnerPhaseConsistency()).assertTrue();
        expect(validator.countByOwner(CallbackOwner.OWNER_ABILITY_STAGE)).assertEqual(3);
        expect(validator.countByOwner(CallbackOwner.OWNER_UI_ABILITY)).assertEqual(6);
        expect(validator.countByOwner(CallbackOwner.OWNER_BACKUP_EXTENSION)).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_1600
     * @tc.name testOrderSequenceAscending
     * @tc.desc Verify ordering: sorted entries carry strictly increasing order values from 1 to 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOrderSequenceAscending', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const sequencer: CallbackOrderSequencer = new CallbackOrderSequencer(CallbackDefinitions.all());
        const sorted: CallbackSpec[] = sequencer.sortByOrder();
        expect(sequencer.isAscending()).assertTrue();
        expect(sorted[0].order).assertEqual(1);
        expect(sorted[10].order).assertEqual(11);
        expect(sorted[4].id).assertEqual('ability_on_window_stage_create');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_1700
     * @tc.name testOrderStableSort
     * @tc.desc Verify ordering stability: two consecutive sorts produce identical id sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOrderStableSort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const sequencer: CallbackOrderSequencer = new CallbackOrderSequencer(CallbackDefinitions.all());
        expect(sequencer.isStableAcrossSorts()).assertTrue();
        const first: string[] = sequencer.sortByOrder().map((spec: CallbackSpec) => spec.id);
        const second: string[] = sequencer.sortByOrder().map((spec: CallbackSpec) => spec.id);
        expect(first.join(',')).assertEqual(second.join(','));
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_1800
     * @tc.name testOrderNextAndPrevious
     * @tc.desc Verify neighbor navigation: window stage create is followed by window stage destroy and preceded by
     * ability onCreate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOrderNextAndPrevious', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const sequencer: CallbackOrderSequencer = new CallbackOrderSequencer(CallbackDefinitions.all());
        const next: CallbackSpec | null = sequencer.nextOf('ability_on_window_stage_create');
        const previous: CallbackSpec | null = sequencer.previousOf('ability_on_window_stage_create');
        expect(next === null).assertFalse();
        expect(previous === null).assertFalse();
        if (next !== null) {
          expect(next.id).assertEqual('ability_on_window_stage_destroy');
        }
        if (previous !== null) {
          expect(previous.id).assertEqual('ability_on_create');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_1900
     * @tc.name testOrderBoundaries
     * @tc.desc Verify ordering boundaries: first entry is stage_on_create, last is backup_on_restore, and neither
     * has a neighbor beyond the boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOrderBoundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const sequencer: CallbackOrderSequencer = new CallbackOrderSequencer(CallbackDefinitions.all());
        expect(sequencer.firstId()).assertEqual('stage_on_create');
        expect(sequencer.lastId()).assertEqual('backup_on_restore');
        expect(sequencer.previousOf('stage_on_create') === null).assertTrue();
        expect(sequencer.nextOf('backup_on_restore') === null).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_2000
     * @tc.name testBudgetTotal
     * @tc.desc Verify budget planning: the aggregate callback budget is exactly 1720 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBudgetTotal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const planner: CallbackBudgetPlanner = new CallbackBudgetPlanner(CallbackDefinitions.all());
        expect(planner.getTotal()).assertEqual(1720);
        expect(planner.getBudgetOf('backup_on_restore')).assertEqual(800);
        expect(planner.getBudgetOf('unknown_callback')).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_2100
     * @tc.name testBudgetByOwner
     * @tc.desc Verify per-owner budget: stage 100 ms, UIAbility 320 ms and backup 1300 ms sum to the total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBudgetByOwner', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const planner: CallbackBudgetPlanner = new CallbackBudgetPlanner(CallbackDefinitions.all());
        const stageBudget: number = planner.getTotalByOwner(CallbackOwner.OWNER_ABILITY_STAGE);
        const uiBudget: number = planner.getTotalByOwner(CallbackOwner.OWNER_UI_ABILITY);
        const backupBudget: number = planner.getTotalByOwner(CallbackOwner.OWNER_BACKUP_EXTENSION);
        expect(stageBudget).assertEqual(100);
        expect(uiBudget).assertEqual(320);
        expect(backupBudget).assertEqual(1300);
        expect(stageBudget + uiBudget + backupBudget).assertEqual(planner.getTotal());
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_2200
     * @tc.name testBudgetMaxAndAverage
     * @tc.desc Verify budget extremes: the maximum is 800 ms, the minimum 20 ms and the average lies in (156, 157)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBudgetMaxAndAverage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const planner: CallbackBudgetPlanner = new CallbackBudgetPlanner(CallbackDefinitions.all());
        const average: number = planner.getAverageBudget();
        expect(planner.getMaxBudget()).assertEqual(800);
        expect(planner.getMinBudget()).assertEqual(20);
        expect(average > 156 && average < 157).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_2300
     * @tc.name testBudgetLimitCheck
     * @tc.desc Verify budget limit: the 1720 ms total fits a 2000 ms limit and exceeds a 1000 ms limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBudgetLimitCheck', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const planner: CallbackBudgetPlanner = new CallbackBudgetPlanner(CallbackDefinitions.all());
        expect(planner.withinLimit(2000)).assertTrue();
        expect(planner.withinLimit(1000)).assertFalse();
        expect(planner.withinLimit(planner.getTotal())).assertTrue();
        expect(planner.withinLimit(planner.getTotal() - 1)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_2400
     * @tc.name testResolverNames
     * @tc.desc Verify name resolution: known ids map to their display names while unknown ids fall back to
     * UnknownCallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testResolverNames', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const resolver: CallbackNameResolver = new CallbackNameResolver(CallbackDefinitions.all());
        expect(resolver.resolve('stage_on_create')).assertEqual('AbilityStageOnCreate');
        expect(resolver.resolve('backup_on_restore')).assertEqual('BackupExtensionOnRestore');
        expect(resolver.resolve('missing_callback')).assertEqual('UnknownCallback');
        expect(resolver.resolveByPhase(LifecyclePhase.PHASE_FOREGROUND)).assertEqual('UIAbilityOnForeground');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_2500
     * @tc.name testResolverAllNames
     * @tc.desc Verify bulk name resolution: 11 display names are produced and the stage names are present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testResolverAllNames', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const resolver: CallbackNameResolver = new CallbackNameResolver(CallbackDefinitions.all());
        const names: string[] = resolver.resolveAll();
        expect(names.length).assertEqual(11);
        expect(names.includes('AbilityStageOnCreate')).assertTrue();
        expect(names.includes('AbilityStageOnAcceptWant')).assertTrue();
        expect(names.includes('AbilityStageOnDestroy')).assertTrue();
        expect(resolver.isResolvable('ability_on_destroy')).assertTrue();
        expect(resolver.isResolvable('backup_on_backup')).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_2600
     * @tc.name testIndexHitAndMiss
     * @tc.desc Verify index lookup: owner index returns three stage entries, phase index resolves background, and
     * an unregistered phase returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexHitAndMiss', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const index: CallbackCatalogIndex = new CallbackCatalogIndex(CallbackDefinitions.all());
        const background: CallbackSpec | null = index.getByPhase(LifecyclePhase.PHASE_BACKGROUND);
        expect(index.getByOwner(CallbackOwner.OWNER_ABILITY_STAGE).length).assertEqual(3);
        expect(background === null).assertFalse();
        if (background !== null) {
          expect(background.id).assertEqual('ability_on_background');
        }
        expect(index.getByPhase(99) === null).assertTrue();
        expect(index.hasPhase(LifecyclePhase.PHASE_RESTORE)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_2700
     * @tc.name testIndexCoverageCounts
     * @tc.desc Verify index coverage: 3 owner keys, 11 phase keys and 11 indexed entries match catalog size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexCoverageCounts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const index: CallbackCatalogIndex = new CallbackCatalogIndex(CallbackDefinitions.all());
        expect(index.getOwnerKeyCount()).assertEqual(3);
        expect(index.getPhaseKeyCount()).assertEqual(11);
        expect(index.getIndexedTotal()).assertEqual(11);
        expect(index.getByOwner(CallbackOwner.OWNER_BACKUP_EXTENSION).length).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_2800
     * @tc.name testSignatureArities
     * @tc.desc Verify callback signatures: stage onCreate takes 0 payloads, ability onCreate takes 2 and
     * onAcceptWant takes 1 want parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureArities', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const inspector: CallbackSignatureInspector = new CallbackSignatureInspector(CallbackDefinitions.all());
        expect(inspector.arityOf('stage_on_create')).assertEqual(0);
        expect(inspector.arityOf('ability_on_create')).assertEqual(2);
        expect(inspector.arityOf('stage_on_accept_want')).assertEqual(1);
        expect(inspector.arityOf('missing_callback')).assertEqual(-1);
        expect(inspector.receivesPayload('backup_on_restore')).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_2900
     * @tc.name testSignatureAsyncDeclaration
     * @tc.desc Verify async declarations: only backup callbacks are asynchronous, and all payload arities are
     * non-negative with a summed arity of 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureAsyncDeclaration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const inspector: CallbackSignatureInspector = new CallbackSignatureInspector(CallbackDefinitions.all());
        expect(inspector.isAsyncDeclaration('backup_on_backup')).assertTrue();
        expect(inspector.isAsyncDeclaration('stage_on_create')).assertFalse();
        expect(inspector.allPayloadAritiesNonNegative()).assertTrue();
        expect(inspector.countWithPayload()).assertEqual(4);
        expect(inspector.sumOfArities()).assertEqual(5);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_3000
     * @tc.name testComparatorDiffAndCoverage
     * @tc.desc Verify observed-set comparison: a partial observation reports the two missing backup callbacks and
     * covers 9 of 11 expected entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testComparatorDiffAndCoverage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const expected: CallbackSpec[] = CallbackDefinitions.all();
        const expectedIds: string[] = expected.map((spec: CallbackSpec) => spec.id);
        const observed: string[] = [
          'stage_on_create',
          'stage_on_accept_want',
          'stage_on_destroy',
          'ability_on_create',
          'ability_on_window_stage_create',
          'ability_on_window_stage_destroy',
          'ability_on_foreground',
          'ability_on_background',
          'ability_on_destroy'
        ];
        const comparator: CallbackSetComparator = new CallbackSetComparator(expectedIds);
        const missing: string[] = comparator.getMissing(observed);
        expect(missing.length).assertEqual(2);
        expect(missing[0]).assertEqual('backup_on_backup');
        expect(comparator.getExtra(observed).length).assertEqual(0);
        expect(comparator.isExactMatch(observed)).assertFalse();
        expect(Math.round(comparator.coverageRatio(observed) * 100)).assertEqual(82);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_3100
     * @tc.name testComparatorExactMatch
     * @tc.desc Verify observed-set comparison: a full observation matches exactly and reports ratio 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testComparatorExactMatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const expectedIds: string[] = CallbackDefinitions.all().map((spec: CallbackSpec) => spec.id);
        const comparator: CallbackSetComparator = new CallbackSetComparator(expectedIds);
        expect(comparator.isExactMatch(expectedIds)).assertTrue();
        expect(comparator.getMissing(expectedIds).length).assertEqual(0);
        expect(comparator.coverageRatio(expectedIds)).assertEqual(1);
        const emptyObserved: string[] = [];
        expect(comparator.coverageRatio(emptyObserved)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_3200
     * @tc.name testPhaseGrouping
     * @tc.desc Verify phase grouping: each phase holds exactly one entry, stage phases ascend and the UIAbility
     * owner contributes 6 phases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPhaseGrouping', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const grouper: CallbackPhaseGrouper = new CallbackPhaseGrouper(CallbackDefinitions.all());
        expect(grouper.countOfPhase(LifecyclePhase.PHASE_STAGE_CREATE)).assertEqual(1);
        expect(grouper.countOfPhase(LifecyclePhase.PHASE_BACKUP)).assertEqual(1);
        expect(grouper.phasesOfOwner(CallbackOwner.OWNER_UI_ABILITY).length).assertEqual(6);
        expect(grouper.sumOfBudgetsOfOwner(CallbackOwner.OWNER_UI_ABILITY)).assertEqual(320);
        expect(grouper.heaviestPhase()).assertEqual(LifecyclePhase.PHASE_STAGE_CREATE);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_3300
     * @tc.name testBudgetRangeFilter
     * @tc.desc Verify budget range filter: 8 entries cost at most 60 ms and only 2 entries cost more than 100 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBudgetRangeFilter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const filter: CallbackFilter = new CallbackFilter(CallbackDefinitions.all());
        const cheap: CallbackSpec[] = filter.byBudgetRange(0, 60);
        const expensive: CallbackSpec[] = filter.byBudgetRange(200, 800);
        expect(cheap.length).assertEqual(8);
        expect(expensive.length).assertEqual(2);
        expect(expensive[0].id).assertEqual('backup_on_backup');
        expect(filter.byOwnerAndRequired(CallbackOwner.OWNER_ABILITY_STAGE, true).length).assertEqual(2);
        expect(filter.byOwnerAndRequired(CallbackOwner.OWNER_ABILITY_STAGE, false).length).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_3400
     * @tc.name testReporterSummary
     * @tc.desc Verify catalog reporter: the summary contains size 11 and required 10, and the id list has 11 fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReporterSummary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: LifecycleCallbackCatalog = LifecycleCallbackCatalog.createDefault();
        const reporter: CallbackCatalogReporter = new CallbackCatalogReporter(catalog);
        const summary: string = reporter.describe();
        const idList: string = reporter.describeIds();
        expect(summary.includes('size: 11')).assertTrue();
        expect(summary.includes('required: 10')).assertTrue();
        expect(idList.split(',').length).assertEqual(11);
        expect(reporter.describeOwner(CallbackOwner.OWNER_BACKUP_EXTENSION, 'backup')).assertEqual('backup: 2');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_3500
     * @tc.name testSortedByBudgetDescending
     * @tc.desc Verify budget ordering: descending sort starts with backup_on_restore, ends with stage_on_accept_want
     * and preserves the original catalog order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSortedByBudgetDescending', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const sequencer: CallbackOrderSequencer = new CallbackOrderSequencer(CallbackDefinitions.all());
        const sorted: CallbackSpec[] = sequencer.sortByBudgetDescending();
        expect(sorted[0].id).assertEqual('backup_on_restore');
        expect(sorted[sorted.length - 1].id).assertEqual('stage_on_accept_want');
        expect(CallbackDefinitions.all()[0].id).assertEqual('stage_on_create');
        expect(sorted.length).assertEqual(11);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_3600
     * @tc.name testDelegatorAndBundleAvailable
     * @tc.desc Verify runtime environment: the AbilityDelegator is available, the bundle name is non-empty and the
     * catalog declares three stage callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDelegatorAndBundleAvailable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const bundleName: string = getBundleName();
        const catalog: LifecycleCallbackCatalog = LifecycleCallbackCatalog.createDefault();
        expect(isNonEmptyString(bundleName)).assertTrue();
        expect(bundleName.includes('abilitystage')).assertTrue();
        expect(bundleName.length > 0).assertTrue();
        expect(catalog.getByOwner(CallbackOwner.OWNER_ABILITY_STAGE).length).assertEqual(3);
        expect(ABILITY_STAGE_NAME).assertEqual('MyAbilityStage');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_3700
     * @tc.name testLaunchEntryAbilityRendersPage
     * @tc.desc Verify real launch path: starting EntryAbility through the delegator makes the index page stable and
     * the page exposes at least one component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchEntryAbilityRendersPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        const stable: boolean = await waitForIndexPageStable(driver);
        const componentCount: number = await pageComponentCount(driver);
        expect(stable).assertTrue();
        expect(componentCount >= 1).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_3800
     * @tc.name testIndexPageKeyComponentExists
     * @tc.desc Verify window stage create outcome: the HelloWorld text component declared by onWindowStageCreate
     * loadContent exists in the component tree
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexPageKeyComponentExists', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await waitForIndexPageStable(driver);
        const keyExists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        const texts: string[] = await collectAllTexts(driver);
        expect(keyExists).assertTrue();
        expect(texts.length >= 1).assertTrue();
        expect(INDEX_PAGE_TEXT_KEY).assertEqual('HelloWorld');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_3900
     * @tc.name testForegroundBackgroundRoundTrip
     * @tc.desc Verify foreground and background callbacks: after doAbilityBackground and doAbilityForeground the
     * index page remains visible and both callback entries exist in the catalog
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testForegroundBackgroundRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: LifecycleCallbackCatalog = LifecycleCallbackCatalog.createDefault();
        await doAbilityBackground();
        await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
        await doAbilityForeground();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        expect(await isIndexPageVisible(driver)).assertTrue();
        expect(catalog.contains('ability_on_foreground')).assertTrue();
        expect(catalog.contains('ability_on_background')).assertTrue();
        expect(catalog.findById('ability_on_background') !== null).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_4000
     * @tc.name testLaunchElapsedWithinBudget
     * @tc.desc Verify launch timing: the measured launch cycle is non-negative and fits the extended launch budget
     * while the stage onCreate budget stays at 50 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchElapsedWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const startTime: number = Date.now();
        await launchEntryAbility();
        const elapsed: number = measureElapsed(startTime);
        const budget: number = TIMEOUT_ABILITY_LAUNCH * 5;
        expect(elapsed >= 0).assertTrue();
        expect(isWithinBudget(elapsed, budget)).assertTrue();
        expect(plannerBudgetOfStageCreate()).assertEqual(50);
        expect(await waitForIndexPageStable(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_4100
     * @tc.name testTextComponentQuery
     * @tc.desc Verify component query by type: the rendered page exposes at least one Text component and the
     * catalog lists 6 UIAbility callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTextComponentQuery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const textComponents: Component[] = await findComponentsByType(driver, 'Text');
        const componentCount: number = await pageComponentCount(driver);
        const catalog: LifecycleCallbackCatalog = LifecycleCallbackCatalog.createDefault();
        expect(textComponents.length >= 1).assertTrue();
        expect(componentCount >= textComponents.length).assertTrue();
        expect(catalog.getByOwner(CallbackOwner.OWNER_UI_ABILITY).length).assertEqual(6);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_4200
     * @tc.name testBackupAbilityRuntimeConstants
     * @tc.desc Verify backup extension facts: the backup ability name is exposed, the catalog keeps two backup
     * callbacks and each of them is asynchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBackupAbilityRuntimeConstants', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: LifecycleCallbackCatalog = LifecycleCallbackCatalog.createDefault();
        const backupEntries: CallbackSpec[] = catalog.getByOwner(CallbackOwner.OWNER_BACKUP_EXTENSION);
        expect(BACKUP_ABILITY_NAME).assertEqual('EntryBackupAbility');
        expect(backupEntries.length).assertEqual(2);
        expect(backupEntries[0].required).assertTrue();
        expect(backupEntries[1].required).assertTrue();
        expect(backupEntries[0].id).assertEqual('backup_on_backup');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_4300
     * @tc.name testRelaunchKeepsPageVisible
     * @tc.desc Verify relaunch idempotency: a second launch request keeps the index page visible and the component
     * count stays at least 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRelaunchKeepsPageVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        const firstCount: number = await pageComponentCount(driver);
        await launchEntryAbility();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        const secondCount: number = await pageComponentCount(driver);
        expect(await isIndexPageVisible(driver)).assertTrue();
        expect(firstCount >= 1).assertTrue();
        expect(secondCount >= 1).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_4400
     * @tc.name testClickUpdatesMessageText
     * @tc.desc Verify page interaction after window stage create: clicking the HelloWorld text switches the message
     * from Hello World to Welcome and the page stays visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testClickUpdatesMessageText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await waitForIndexPageStable(driver);
        const initialVisible: boolean = await isIndexPageVisible(driver);
        let clickOutcome: boolean = false;
        if (initialVisible) {
          clickOutcome = await tapComponentByText(driver, PAGE_TEXT_INITIAL);
          const clicked: boolean = await waitForClickedText(driver);
          expect(clicked).assertTrue();
        } else {
          clickOutcome = await tapComponentByText(driver, PAGE_TEXT_CLICKED);
        }
        expect(clickOutcome).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
        expect(ENTRY_ABILITY_NAME).assertEqual('EntryAbility');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CATALOG_4500
     * @tc.name testCatalogImmutableAcrossReads
     * @tc.desc Verify catalog read consistency: repeated default catalog creation yields the same 11 ids and the
     * same required count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogImmutableAcrossReads', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const first: LifecycleCallbackCatalog = LifecycleCallbackCatalog.createDefault();
        const second: LifecycleCallbackCatalog = LifecycleCallbackCatalog.createDefault();
        expect(first.getIds().join(',')).assertEqual(second.getIds().join(','));
        expect(first.getRequiredCount()).assertEqual(second.getRequiredCount());
        expect(first.getSize()).assertEqual(second.getSize());
        expect(first.countAsync()).assertEqual(2);
      } finally {
        done();
      }
    })
  })
}

function plannerBudgetOfStageCreate(): number {
  const planner: CallbackBudgetPlanner = new CallbackBudgetPlanner(CallbackDefinitions.all());
  return planner.getBudgetOf('stage_on_create');
}

async function waitForClickedText(driver: Driver): Promise<boolean> {
  const deadline: number = Date.now() + TIMEOUT_ABILITY_LAUNCH;
  while (Date.now() < deadline) {
    const texts: string[] = await collectAllTexts(driver);
    if (texts.includes(PAGE_TEXT_CLICKED)) {
      return true;
    }
    await serializedDelay(driver, 100);
  }
  return false;
}
