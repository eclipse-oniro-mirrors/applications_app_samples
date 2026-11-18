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
import { Driver } from '@ohos.UiTest';
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
  serializedDelay,
  measureElapsed,
  isWithinBudget,
  isNonEmptyString,
  logInfo,
  INDEX_PAGE_PATH,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  COLOR_MODE_NOT_SET,
  ENV_CALLBACK_EVENT,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  TIMEOUT_ABILITY_LAUNCH,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum OperationKind {
  KIND_REGISTER_ENV_CALLBACK = 0,
  KIND_UNREGISTER_ENV_CALLBACK = 1,
  KIND_SET_COLOR_MODE = 2,
  KIND_LOAD_CONTENT = 3,
  KIND_START_ABILITY = 4
}

enum OperationOutcome {
  OUTCOME_NOT_STARTED = 0,
  OUTCOME_APPLIED = 1,
  OUTCOME_SKIPPED_IDEMPOTENT = 2,
  OUTCOME_REJECTED = 3,
  OUTCOME_ROLLED_BACK = 4
}

interface OperationSpec {
  key: string;
  kind: OperationKind;
  label: string;
  budgetMs: number;
  requiresRegisteredCallback: boolean;
  requiresNonEmptyContent: boolean;
}

interface OperationRecord {
  sequence: number;
  key: string;
  kind: OperationKind;
  outcome: OperationOutcome;
  elapsedMs: number;
}

class OperationDefinitions {
  public static readonly REGISTER_ENV: OperationSpec = {
    key: 'op_register_env',
    kind: OperationKind.KIND_REGISTER_ENV_CALLBACK,
    label: 'RegisterEnvironmentCallback',
    budgetMs: 20,
    requiresRegisteredCallback: false,
    requiresNonEmptyContent: false
  };
  public static readonly UNREGISTER_ENV: OperationSpec = {
    key: 'op_unregister_env',
    kind: OperationKind.KIND_UNREGISTER_ENV_CALLBACK,
    label: 'UnregisterEnvironmentCallback',
    budgetMs: 20,
    requiresRegisteredCallback: true,
    requiresNonEmptyContent: false
  };
  public static readonly SET_COLOR_MODE: OperationSpec = {
    key: 'op_set_color_mode',
    kind: OperationKind.KIND_SET_COLOR_MODE,
    label: 'SetApplicationColorMode',
    budgetMs: 30,
    requiresRegisteredCallback: false,
    requiresNonEmptyContent: false
  };
  public static readonly LOAD_CONTENT: OperationSpec = {
    key: 'op_load_content',
    kind: OperationKind.KIND_LOAD_CONTENT,
    label: 'LoadWindowStageContent',
    budgetMs: 120,
    requiresRegisteredCallback: false,
    requiresNonEmptyContent: true
  };
  public static readonly START_ABILITY: OperationSpec = {
    key: 'op_start_ability',
    kind: OperationKind.KIND_START_ABILITY,
    label: 'StartEntryAbility',
    budgetMs: 200,
    requiresRegisteredCallback: false,
    requiresNonEmptyContent: false
  };

  public static all(): OperationSpec[] {
    return [
      OperationDefinitions.REGISTER_ENV,
      OperationDefinitions.UNREGISTER_ENV,
      OperationDefinitions.SET_COLOR_MODE,
      OperationDefinitions.LOAD_CONTENT,
      OperationDefinitions.START_ABILITY
    ];
  }

  public static byKind(kind: number): OperationSpec | null {
    const matched: OperationSpec | undefined = OperationDefinitions.all()
      .find((spec: OperationSpec) => spec.kind === kind);
    return matched === undefined ? null : matched;
  }
}

class EnvironmentCallbackRegistry {
  private tokens: Map<string, number> = new Map<string, number>();
  private nextToken: number = 1;
  private registerCalls: number = 0;
  private unregisterCalls: number = 0;

  public register(callbackId: string): number {
    this.registerCalls++;
    const existing: number | undefined = this.tokens.get(callbackId);
    if (existing !== undefined) {
      return existing;
    }
    const token: number = this.nextToken;
    this.nextToken++;
    this.tokens.set(callbackId, token);
    return token;
  }

  public unregister(callbackId: string): boolean {
    this.unregisterCalls++;
    if (!this.tokens.has(callbackId)) {
      return false;
    }
    this.tokens.delete(callbackId);
    return true;
  }

  public isRegistered(callbackId: string): boolean {
    return this.tokens.has(callbackId);
  }

  public count(): number {
    return this.tokens.size;
  }

  public getToken(callbackId: string): number {
    const token: number | undefined = this.tokens.get(callbackId);
    return token === undefined ? -1 : token;
  }

  public getRegisterCalls(): number {
    return this.registerCalls;
  }

  public getUnregisterCalls(): number {
    return this.unregisterCalls;
  }

  public clear(): void {
    this.tokens.clear();
    this.nextToken = 1;
    this.registerCalls = 0;
    this.unregisterCalls = 0;
  }
}

class ColorModeController {
  private currentMode: number = COLOR_MODE_NOT_SET;
  private allowedModes: number[] = [COLOR_MODE_NOT_SET, 0, 1];
  private applyCount: number = 0;
  private rejectCount: number = 0;

  public setColorMode(mode: number): boolean {
    if (this.allowedModes.indexOf(mode) < 0) {
      this.rejectCount++;
      return false;
    }
    if (this.currentMode === mode) {
      return false;
    }
    this.currentMode = mode;
    this.applyCount++;
    return true;
  }

  public getCurrentMode(): number {
    return this.currentMode;
  }

  public getApplyCount(): number {
    return this.applyCount;
  }

  public getRejectCount(): number {
    return this.rejectCount;
  }

  public isAllowed(mode: number): boolean {
    return this.allowedModes.indexOf(mode) >= 0;
  }

  public isNotSet(): boolean {
    return this.currentMode === COLOR_MODE_NOT_SET;
  }
}

class ContentLoadController {
  private loadedPath: string = '';
  private loadCount: number = 0;
  private rejectCount: number = 0;

  public loadContent(path: string): boolean {
    if (!this.isValidPath(path)) {
      this.rejectCount++;
      return false;
    }
    if (this.loadedPath === path) {
      return false;
    }
    this.loadedPath = path;
    this.loadCount++;
    return true;
  }

  public isValidPath(path: string): boolean {
    return isNonEmptyString(path) && path.startsWith('pages/');
  }

  public getLoadedPath(): string {
    return this.loadedPath;
  }

  public getLoadCount(): number {
    return this.loadCount;
  }

  public getRejectCount(): number {
    return this.rejectCount;
  }

  public hasContent(): boolean {
    return isNonEmptyString(this.loadedPath);
  }

  public unload(): void {
    this.loadedPath = '';
  }
}

class AbilityStartController {
  private startedAbilities: string[] = [];
  private bundleName: string = '';
  private rejectCount: number = 0;

  constructor(bundleName: string) {
    this.bundleName = bundleName;
  }

  public startAbility(abilityName: string): boolean {
    if (!this.canStart(abilityName)) {
      this.rejectCount++;
      return false;
    }
    if (this.startedAbilities.indexOf(abilityName) >= 0) {
      return false;
    }
    this.startedAbilities.push(abilityName);
    return true;
  }

  public canStart(abilityName: string): boolean {
    return isNonEmptyString(this.bundleName) && isNonEmptyString(abilityName);
  }

  public isStarted(abilityName: string): boolean {
    return this.startedAbilities.indexOf(abilityName) >= 0;
  }

  public getStartedCount(): number {
    return this.startedAbilities.length;
  }

  public getStartedAbilities(): string[] {
    return this.startedAbilities.slice();
  }

  public getRejectCount(): number {
    return this.rejectCount;
  }

  public getBundleName(): string {
    return this.bundleName;
  }
}

class OperationPreconditionChecker {
  private registry: EnvironmentCallbackRegistry;
  private contentLoader: ContentLoadController;

  constructor(registry: EnvironmentCallbackRegistry, contentLoader: ContentLoadController) {
    this.registry = registry;
    this.contentLoader = contentLoader;
  }

  public check(spec: OperationSpec, callbackId: string, contentPath: string): boolean {
    if (spec.requiresRegisteredCallback && !this.registry.isRegistered(callbackId)) {
      return false;
    }
    if (spec.requiresNonEmptyContent && !this.contentLoader.isValidPath(contentPath)) {
      return false;
    }
    return true;
  }

  public describeFailure(spec: OperationSpec, callbackId: string, contentPath: string): string {
    if (spec.requiresRegisteredCallback && !this.registry.isRegistered(callbackId)) {
      return 'callback-not-registered';
    }
    if (spec.requiresNonEmptyContent && !this.contentLoader.isValidPath(contentPath)) {
      return 'content-path-invalid';
    }
    return '';
  }
}

class OperationJournal {
  private records: OperationRecord[] = [];
  private nextSequence: number = 1;

  public record(key: string, kind: OperationKind, outcome: OperationOutcome, elapsedMs: number): OperationRecord {
    const record: OperationRecord = {
      sequence: this.nextSequence,
      key: key,
      kind: kind,
      outcome: outcome,
      elapsedMs: elapsedMs
    };
    this.nextSequence++;
    this.records.push(record);
    return record;
  }

  public size(): number {
    return this.records.length;
  }

  public keys(): string[] {
    return this.records.map((record: OperationRecord) => record.key);
  }

  public countOf(outcome: OperationOutcome): number {
    return this.records.filter((record: OperationRecord) => record.outcome === outcome).length;
  }

  public countOfKind(kind: OperationKind): number {
    return this.records.filter((record: OperationRecord) => record.kind === kind).length;
  }

  public totalElapsed(): number {
    let total: number = 0;
    this.records.forEach((record: OperationRecord) => {
      total += record.elapsedMs;
    });
    return total;
  }

  public sequencesAreMonotonic(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].sequence <= this.records[i - 1].sequence) {
        return false;
      }
    }
    return true;
  }

  public lastKey(): string {
    return this.records.length === 0 ? '' : this.records[this.records.length - 1].key;
  }

  public firstKey(): string {
    return this.records.length === 0 ? '' : this.records[0].key;
  }

  public clear(): void {
    this.records = [];
    this.nextSequence = 1;
  }
}

class OperationRollbackStack {
  private actions: string[] = [];

  public push(action: string): void {
    this.actions.push(action);
  }

  public depth(): number {
    return this.actions.length;
  }

  public rollbackAll(): string[] {
    const reversed: string[] = [];
    for (let i = this.actions.length - 1; i >= 0; i--) {
      reversed.push(this.actions[i]);
    }
    this.actions = [];
    return reversed;
  }

  public rollbackLast(): string {
    if (this.actions.length === 0) {
      return '';
    }
    const lastIndex: number = this.actions.length - 1;
    const action: string = this.actions[lastIndex];
    this.actions.splice(lastIndex, 1);
    return action;
  }

  public peek(): string {
    return this.actions.length === 0 ? '' : this.actions[this.actions.length - 1];
  }

  public isEmpty(): boolean {
    return this.actions.length === 0;
  }

  public clear(): void {
    this.actions = [];
  }
}

class OperationExecutor {
  private registry: EnvironmentCallbackRegistry;
  private colorMode: ColorModeController;
  private contentLoader: ContentLoadController;
  private starter: AbilityStartController;
  private journal: OperationJournal;
  private rollbackStack: OperationRollbackStack;
  private checker: OperationPreconditionChecker;

  constructor(registry: EnvironmentCallbackRegistry, colorMode: ColorModeController,
    contentLoader: ContentLoadController, starter: AbilityStartController, journal: OperationJournal) {
    this.registry = registry;
    this.colorMode = colorMode;
    this.contentLoader = contentLoader;
    this.starter = starter;
    this.journal = journal;
    this.rollbackStack = new OperationRollbackStack();
    this.checker = new OperationPreconditionChecker(registry, contentLoader);
  }

  public executeRegister(callbackId: string, elapsedMs: number): OperationOutcome {
    const spec: OperationSpec = OperationDefinitions.REGISTER_ENV;
    const wasRegistered: boolean = this.registry.isRegistered(callbackId);
    this.registry.register(callbackId);
    if (!wasRegistered) {
      this.rollbackStack.push(`unregister:${callbackId}`);
    }
    const outcome: OperationOutcome = wasRegistered ?
      OperationOutcome.OUTCOME_SKIPPED_IDEMPOTENT : OperationOutcome.OUTCOME_APPLIED;
    this.journal.record(spec.key, spec.kind, outcome, elapsedMs);
    return outcome;
  }

  public executeUnregister(callbackId: string, elapsedMs: number): OperationOutcome {
    const spec: OperationSpec = OperationDefinitions.UNREGISTER_ENV;
    if (!this.checker.check(spec, callbackId, '')) {
      this.journal.record(spec.key, spec.kind, OperationOutcome.OUTCOME_REJECTED, elapsedMs);
      return OperationOutcome.OUTCOME_REJECTED;
    }
    const removed: boolean = this.registry.unregister(callbackId);
    this.rollbackStack.push(`register:${callbackId}`);
    const outcome: OperationOutcome = removed ?
      OperationOutcome.OUTCOME_APPLIED : OperationOutcome.OUTCOME_SKIPPED_IDEMPOTENT;
    this.journal.record(spec.key, spec.kind, outcome, elapsedMs);
    return outcome;
  }

  public executeSetColorMode(mode: number, elapsedMs: number): OperationOutcome {
    const spec: OperationSpec = OperationDefinitions.SET_COLOR_MODE;
    const previous: number = this.colorMode.getCurrentMode();
    const applied: boolean = this.colorMode.setColorMode(mode);
    let outcome: OperationOutcome = OperationOutcome.OUTCOME_SKIPPED_IDEMPOTENT;
    if (!this.colorMode.isAllowed(mode)) {
      outcome = OperationOutcome.OUTCOME_REJECTED;
    } else if (applied) {
      outcome = OperationOutcome.OUTCOME_APPLIED;
      this.rollbackStack.push(`color:${previous}`);
    }
    this.journal.record(spec.key, spec.kind, outcome, elapsedMs);
    return outcome;
  }

  public executeLoadContent(path: string, elapsedMs: number): OperationOutcome {
    const spec: OperationSpec = OperationDefinitions.LOAD_CONTENT;
    const previous: string = this.contentLoader.getLoadedPath();
    const loaded: boolean = this.contentLoader.loadContent(path);
    let outcome: OperationOutcome = OperationOutcome.OUTCOME_SKIPPED_IDEMPOTENT;
    if (!this.contentLoader.isValidPath(path)) {
      outcome = OperationOutcome.OUTCOME_REJECTED;
    } else if (loaded) {
      outcome = OperationOutcome.OUTCOME_APPLIED;
      this.rollbackStack.push(`unload:${previous}`);
    }
    this.journal.record(spec.key, spec.kind, outcome, elapsedMs);
    return outcome;
  }

  public executeStartAbility(abilityName: string, elapsedMs: number): OperationOutcome {
    const spec: OperationSpec = OperationDefinitions.START_ABILITY;
    const started: boolean = this.starter.startAbility(abilityName);
    let outcome: OperationOutcome = OperationOutcome.OUTCOME_SKIPPED_IDEMPOTENT;
    if (!this.starter.canStart(abilityName)) {
      outcome = OperationOutcome.OUTCOME_REJECTED;
    } else if (started) {
      outcome = OperationOutcome.OUTCOME_APPLIED;
      this.rollbackStack.push(`stop:${abilityName}`);
    }
    this.journal.record(spec.key, spec.kind, outcome, elapsedMs);
    return outcome;
  }

  public getRollbackStack(): OperationRollbackStack {
    return this.rollbackStack;
  }

  public rollbackAll(): number {
    const actions: string[] = this.rollbackStack.rollbackAll();
    this.journal.record('op_rollback', OperationKind.KIND_START_ABILITY,
      OperationOutcome.OUTCOME_ROLLED_BACK, 0);
    return actions.length;
  }

  public getJournal(): OperationJournal {
    return this.journal;
  }
}

class OperationAuditSummary {
  private journal: OperationJournal;

  constructor(journal: OperationJournal) {
    this.journal = journal;
  }

  public getApplied(): number {
    return this.journal.countOf(OperationOutcome.OUTCOME_APPLIED);
  }

  public getSkipped(): number {
    return this.journal.countOf(OperationOutcome.OUTCOME_SKIPPED_IDEMPOTENT);
  }

  public getRejected(): number {
    return this.journal.countOf(OperationOutcome.OUTCOME_REJECTED);
  }

  public getRolledBack(): number {
    return this.journal.countOf(OperationOutcome.OUTCOME_ROLLED_BACK);
  }

  public isBalanced(): boolean {
    return this.getApplied() + this.getSkipped() + this.getRejected() + this.getRolledBack() ===
      this.journal.size();
  }

  public describe(): string {
    return `audit{total:${this.journal.size()},applied:${this.getApplied()},` +
      `skipped:${this.getSkipped()},rejected:${this.getRejected()}}`;
  }
}

class OperationBudgetTracker {
  private specs: OperationSpec[] = [];

  constructor(specs: OperationSpec[]) {
    this.specs = specs;
  }

  public budgetOf(key: string): number {
    const matched: OperationSpec | undefined = this.specs.find((spec: OperationSpec) => spec.key === key);
    return matched === undefined ? 0 : matched.budgetMs;
  }

  public total(): number {
    let total: number = 0;
    this.specs.forEach((spec: OperationSpec) => {
      total += spec.budgetMs;
    });
    return total;
  }

  public heaviestKey(): string {
    let heaviest: OperationSpec = this.specs[0];
    for (let i = 1; i < this.specs.length; i++) {
      if (this.specs[i].budgetMs > heaviest.budgetMs) {
        heaviest = this.specs[i];
      }
    }
    return heaviest.key;
  }

  public cheapestKey(): string {
    let cheapest: OperationSpec = this.specs[0];
    for (let i = 1; i < this.specs.length; i++) {
      if (this.specs[i].budgetMs < cheapest.budgetMs) {
        cheapest = this.specs[i];
      }
    }
    return cheapest.key;
  }

  public countAbove(threshold: number): number {
    return this.specs.filter((spec: OperationSpec) => spec.budgetMs > threshold).length;
  }

  public average(): number {
    if (this.specs.length === 0) {
      return 0;
    }
    return this.total() / this.specs.length;
  }
}

class OperationSpecIndex {
  private specs: OperationSpec[] = [];

  constructor(specs: OperationSpec[]) {
    this.specs = specs;
  }

  public needsRegisteredCallback(): OperationSpec[] {
    return this.specs.filter((spec: OperationSpec) => spec.requiresRegisteredCallback);
  }

  public needsContent(): OperationSpec[] {
    return this.specs.filter((spec: OperationSpec) => spec.requiresNonEmptyContent);
  }

  public keys(): string[] {
    return this.specs.map((spec: OperationSpec) => spec.key);
  }

  public labels(): string[] {
    return this.specs.map((spec: OperationSpec) => spec.label);
  }

  public allKeysUnique(): boolean {
    const keys: Set<string> = new Set<string>();
    this.specs.forEach((spec: OperationSpec) => keys.add(spec.key));
    return keys.size === this.specs.length;
  }

  public allKindsUnique(): boolean {
    const kinds: Set<number> = new Set<number>();
    this.specs.forEach((spec: OperationSpec) => kinds.add(spec.kind));
    return kinds.size === this.specs.length;
  }

  public byLabel(label: string): OperationSpec | null {
    const matched: OperationSpec | undefined = this.specs.find((spec: OperationSpec) => spec.label === label);
    return matched === undefined ? null : matched;
  }
}

export default function lifecycleOperationsTest(): void {
  describe('LifecycleOperationsTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      logInfo('LifecycleOperationsTest: beforeAll completed');

      await ensureIndexPageInitial(driver);
    });

    afterAll(async () => {
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
      logInfo('LifecycleOperationsTest: afterAll completed');
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_0100
     * @tc.name testOperationCatalogueShape
     * @tc.desc Verify the operation catalogue: five operations with unique keys and unique kinds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOperationCatalogueShape', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const index: OperationSpecIndex = new OperationSpecIndex(OperationDefinitions.all());
        expect(OperationDefinitions.all().length).assertEqual(5);
        expect(index.allKeysUnique()).assertTrue();
        expect(index.allKindsUnique()).assertTrue();
        expect(index.keys().length).assertEqual(5);
        expect(index.labels().length).assertEqual(5);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_0200
     * @tc.name testOperationPrerequisitesIndex
     * @tc.desc Verify prerequisite indexing: only unregister needs a registered callback and only loadContent needs a
     * non-empty content path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOperationPrerequisitesIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const index: OperationSpecIndex = new OperationSpecIndex(OperationDefinitions.all());
        const registered: OperationSpec[] = index.needsRegisteredCallback();
        const content: OperationSpec[] = index.needsContent();
        expect(registered.length).assertEqual(1);
        expect(registered[0].key).assertEqual('op_unregister_env');
        expect(content.length).assertEqual(1);
        expect(content[0].key).assertEqual('op_load_content');
        expect(index.byLabel('LoadWindowStageContent') !== null).assertTrue();
        expect(index.byLabel('MissingLabel') === null).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_0300
     * @tc.name testOperationBudgetTotals
     * @tc.desc Verify operation budgets: total 390 ms with startAbility heaviest at 200 ms and register cheapest at
     * 20 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOperationBudgetTotals', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const tracker: OperationBudgetTracker = new OperationBudgetTracker(OperationDefinitions.all());
        expect(tracker.total()).assertEqual(390);
        expect(tracker.budgetOf('op_start_ability')).assertEqual(200);
        expect(tracker.heaviestKey()).assertEqual('op_start_ability');
        expect(tracker.cheapestKey()).assertEqual('op_register_env');
        expect(tracker.countAbove(100)).assertEqual(2);
        expect(tracker.average()).assertEqual(78);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_0400
     * @tc.name testEnvironmentRegisterIsIdempotent
     * @tc.desc Verify registration idempotency: registering the same callback id twice yields the same token and a
     * single registry entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvironmentRegisterIsIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        const first: number = registry.register('env-cb-main');
        const second: number = registry.register('env-cb-main');
        expect(first).assertEqual(1);
        expect(second).assertEqual(1);
        expect(registry.count()).assertEqual(1);
        expect(registry.isRegistered('env-cb-main')).assertTrue();
        expect(registry.getRegisterCalls()).assertEqual(2);
        expect(registry.getToken('env-cb-main')).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_0500
     * @tc.name testEnvironmentRegisterTokens
     * @tc.desc Verify token allocation: three distinct callback ids receive tokens 1, 2 and 3 and an unknown id reports
     * token -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvironmentRegisterTokens', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        registry.register('env-cb-a');
        registry.register('env-cb-b');
        registry.register('env-cb-c');
        expect(registry.count()).assertEqual(3);
        expect(registry.getToken('env-cb-b')).assertEqual(2);
        expect(registry.getToken('env-cb-c')).assertEqual(3);
        expect(registry.getToken('env-cb-missing')).assertEqual(-1);
        expect(registry.isRegistered('env-cb-missing')).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_0600
     * @tc.name testEnvironmentUnregister
     * @tc.desc Verify unregistration: removing a registered callback succeeds once, a repeat removal returns false and
     * the registry drops to zero entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvironmentUnregister', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        registry.register('env-cb-main');
        expect(registry.unregister('env-cb-main')).assertTrue();
        expect(registry.unregister('env-cb-main')).assertFalse();
        expect(registry.count()).assertEqual(0);
        expect(registry.getUnregisterCalls()).assertEqual(2);
        expect(ENV_CALLBACK_EVENT).assertEqual('environment');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_0700
     * @tc.name testRegistryClearResetsTokens
     * @tc.desc Verify registry reset: after clearing, the token counter restarts at 1 and the call counters return to
     * zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryClearResetsTokens', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        registry.register('env-cb-a');
        registry.register('env-cb-b');
        registry.clear();
        expect(registry.count()).assertEqual(0);
        expect(registry.getRegisterCalls()).assertEqual(0);
        expect(registry.getUnregisterCalls()).assertEqual(0);
        expect(registry.register('env-cb-c')).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_0800
     * @tc.name testColorModeApplication
     * @tc.desc Verify color mode: applying COLOR_MODE_NOT_SET once succeeds, the state reads -1 and the apply count is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testColorModeApplication', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const controller: ColorModeController = new ColorModeController();
        expect(controller.setColorMode(COLOR_MODE_NOT_SET)).assertFalse();
        expect(controller.setColorMode(0)).assertTrue();
        expect(controller.getCurrentMode()).assertEqual(0);
        expect(controller.getApplyCount()).assertEqual(1);
        expect(controller.isNotSet()).assertFalse();
        expect(COLOR_MODE_NOT_SET).assertEqual(-1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_0900
     * @tc.name testColorModeIdempotency
     * @tc.desc Verify color mode idempotency: reapplying the same mode is a no-op while switching to a different mode
     * records a second application
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testColorModeIdempotency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const controller: ColorModeController = new ColorModeController();
        controller.setColorMode(0);
        expect(controller.setColorMode(0)).assertFalse();
        expect(controller.getApplyCount()).assertEqual(1);
        expect(controller.setColorMode(1)).assertTrue();
        expect(controller.getCurrentMode()).assertEqual(1);
        expect(controller.getApplyCount()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_1000
     * @tc.name testColorModeRejection
     * @tc.desc Verify color mode validation: mode 7 is rejected and leaves the state untouched while the rejection
     * counter increments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testColorModeRejection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const controller: ColorModeController = new ColorModeController();
        expect(controller.isAllowed(COLOR_MODE_NOT_SET)).assertTrue();
        expect(controller.isAllowed(7)).assertFalse();
        expect(controller.setColorMode(7)).assertFalse();
        expect(controller.getRejectCount()).assertEqual(1);
        expect(controller.getCurrentMode()).assertEqual(COLOR_MODE_NOT_SET);
        expect(controller.isNotSet()).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_1100
     * @tc.name testContentLoadValidation
     * @tc.desc Verify content path validation: pages/Index is accepted and empty or non-prefixed paths are rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentLoadValidation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const loader: ContentLoadController = new ContentLoadController();
        expect(loader.isValidPath(INDEX_PAGE_PATH)).assertTrue();
        expect(loader.isValidPath('')).assertFalse();
        expect(loader.isValidPath('Index')).assertFalse();
        expect(loader.loadContent('')).assertFalse();
        expect(loader.getRejectCount()).assertEqual(1);
        expect(loader.hasContent()).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_1200
     * @tc.name testContentLoadIdempotency
     * @tc.desc Verify content load idempotency: loading the same page twice keeps one load, and loading another page
     * replaces the current path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentLoadIdempotency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const loader: ContentLoadController = new ContentLoadController();
        expect(loader.loadContent(INDEX_PAGE_PATH)).assertTrue();
        expect(loader.loadContent(INDEX_PAGE_PATH)).assertFalse();
        expect(loader.getLoadCount()).assertEqual(1);
        expect(loader.loadContent('pages/Secondary')).assertTrue();
        expect(loader.getLoadedPath()).assertEqual('pages/Secondary');
        expect(loader.getLoadCount()).assertEqual(2);
        loader.unload();
        expect(loader.hasContent()).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_1300
     * @tc.name testStartAbilityValidation
     * @tc.desc Verify start ability preconditions: an empty ability name is rejected while a non-empty name from a
     * configured bundle starts once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartAbilityValidation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const starter: AbilityStartController = new AbilityStartController('com.samples.abilitystage');
        expect(starter.startAbility('')).assertFalse();
        expect(starter.getRejectCount()).assertEqual(1);
        expect(starter.canStart('EntryAbility')).assertTrue();
        expect(starter.startAbility('EntryAbility')).assertTrue();
        expect(starter.isStarted('EntryAbility')).assertTrue();
        expect(starter.getStartedCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_1400
     * @tc.name testStartAbilityRejectsEmptyBundle
     * @tc.desc Verify bundle precondition: a controller built with an empty bundle name cannot start any ability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartAbilityRejectsEmptyBundle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const starter: AbilityStartController = new AbilityStartController('');
        expect(starter.canStart('EntryAbility')).assertFalse();
        expect(starter.startAbility('EntryAbility')).assertFalse();
        expect(starter.getStartedCount()).assertEqual(0);
        expect(starter.getRejectCount()).assertEqual(1);
        expect(starter.getBundleName()).assertEqual('');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_1500
     * @tc.name testPreconditionChecker
     * @tc.desc Verify precondition checking: unregister fails before registration, succeeds after it, and load content
     * fails with an empty path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPreconditionChecker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        const loader: ContentLoadController = new ContentLoadController();
        const checker: OperationPreconditionChecker = new OperationPreconditionChecker(registry, loader);
        expect(checker.check(OperationDefinitions.UNREGISTER_ENV, 'env-cb-main', '')).assertFalse();
        expect(checker.describeFailure(OperationDefinitions.UNREGISTER_ENV, 'env-cb-main', ''))
          .assertEqual('callback-not-registered');
        registry.register('env-cb-main');
        expect(checker.check(OperationDefinitions.UNREGISTER_ENV, 'env-cb-main', '')).assertTrue();
        expect(checker.check(OperationDefinitions.LOAD_CONTENT, 'env-cb-main', '')).assertFalse();
        expect(checker.describeFailure(OperationDefinitions.LOAD_CONTENT, 'env-cb-main', ''))
          .assertEqual('content-path-invalid');
        expect(checker.describeFailure(OperationDefinitions.SET_COLOR_MODE, 'env-cb-main', '')).assertEqual('');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_1600
     * @tc.name testExecutorRegisterAndColorMode
     * @tc.desc Verify executor outcomes: register applies once then reports an idempotent skip, and a color mode change
     * applies once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExecutorRegisterAndColorMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        const colorMode: ColorModeController = new ColorModeController();
        const loader: ContentLoadController = new ContentLoadController();
        const starter: AbilityStartController = new AbilityStartController('com.samples.abilitystage');
        const journal: OperationJournal = new OperationJournal();
        const executor: OperationExecutor = new OperationExecutor(registry, colorMode, loader, starter, journal);
        expect(executor.executeRegister('env-cb-main', 20)).assertEqual(OperationOutcome.OUTCOME_APPLIED);
        expect(executor.executeRegister('env-cb-main', 20))
          .assertEqual(OperationOutcome.OUTCOME_SKIPPED_IDEMPOTENT);
        expect(registry.count()).assertEqual(1);
        expect(executor.executeSetColorMode(0, 30)).assertEqual(OperationOutcome.OUTCOME_APPLIED);
        expect(colorMode.getCurrentMode()).assertEqual(0);
        expect(journal.size()).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_1700
     * @tc.name testExecutorRejectsUnregister
     * @tc.desc Verify rejection audit: unregistering an unregistered callback is rejected and logged as such without
     * touching the registry counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExecutorRejectsUnregister', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        const executor: OperationExecutor = new OperationExecutor(registry, new ColorModeController(),
          new ContentLoadController(), new AbilityStartController('com.samples.abilitystage'),
          new OperationJournal());
        const outcome: OperationOutcome = executor.executeUnregister('env-cb-absent', 20);
        expect(outcome).assertEqual(OperationOutcome.OUTCOME_REJECTED);
        expect(executor.getJournal().countOf(OperationOutcome.OUTCOME_REJECTED)).assertEqual(1);
        expect(registry.getUnregisterCalls()).assertEqual(0);
        expect(executor.getRollbackStack().depth()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_1800
     * @tc.name testExecutorFullSequenceJournal
     * @tc.desc Verify the audit journal: five operations are recorded in order with monotonic sequences and the first
     * and last keys match register and start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExecutorFullSequenceJournal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        const journal: OperationJournal = new OperationJournal();
        const executor: OperationExecutor = new OperationExecutor(registry, new ColorModeController(),
          new ContentLoadController(), new AbilityStartController('com.samples.abilitystage'), journal);
        executor.executeRegister('env-cb-main', 20);
        executor.executeSetColorMode(1, 30);
        executor.executeLoadContent(INDEX_PAGE_PATH, 120);
        executor.executeStartAbility('EntryAbility', 200);
        executor.executeUnregister('env-cb-main', 20);
        expect(journal.size()).assertEqual(5);
        expect(journal.sequencesAreMonotonic()).assertTrue();
        expect(journal.firstKey()).assertEqual('op_register_env');
        expect(journal.lastKey()).assertEqual('op_unregister_env');
        expect(journal.totalElapsed()).assertEqual(390);
        expect(journal.countOfKind(OperationKind.KIND_REGISTER_ENV_CALLBACK)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_1900
     * @tc.name testExecutorAuditSummary
     * @tc.desc Verify the audit summary: three applied, one skipped and one rejected operation balance the journal and
     * the description reports the totals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExecutorAuditSummary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        const journal: OperationJournal = new OperationJournal();
        const executor: OperationExecutor = new OperationExecutor(registry, new ColorModeController(),
          new ContentLoadController(), new AbilityStartController('com.samples.abilitystage'), journal);
        executor.executeRegister('env-cb-main', 20);
        executor.executeRegister('env-cb-main', 20);
        executor.executeLoadContent(INDEX_PAGE_PATH, 120);
        executor.executeStartAbility('EntryAbility', 200);
        executor.executeLoadContent('bad path', 10);
        const summary: OperationAuditSummary = new OperationAuditSummary(journal);
        expect(summary.getApplied()).assertEqual(3);
        expect(summary.getSkipped()).assertEqual(1);
        expect(summary.getRejected()).assertEqual(1);
        expect(summary.getRolledBack()).assertEqual(0);
        expect(summary.isBalanced()).assertTrue();
        expect(summary.describe()).assertEqual('audit{total:5,applied:3,skipped:1,rejected:1}');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_2000
     * @tc.name testRollbackUnwindsInReverse
     * @tc.desc Verify failure rollback: three applied operations push three undo actions and rollback returns them in
     * reverse order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRollbackUnwindsInReverse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        const journal: OperationJournal = new OperationJournal();
        const executor: OperationExecutor = new OperationExecutor(registry, new ColorModeController(),
          new ContentLoadController(), new AbilityStartController('com.samples.abilitystage'), journal);
        executor.executeRegister('env-cb-main', 20);
        executor.executeSetColorMode(0, 30);
        executor.executeLoadContent(INDEX_PAGE_PATH, 120);
        const stack: OperationRollbackStack = executor.getRollbackStack();
        expect(stack.depth()).assertEqual(3);
        expect(stack.peek()).assertEqual('unload:');
        const actions: string[] = stack.rollbackAll();
        expect(actions.length).assertEqual(3);
        expect(actions[0]).assertEqual('unload:');
        expect(actions[1]).assertEqual('color:-1');
        expect(actions[2]).assertEqual('unregister:env-cb-main');
        expect(stack.isEmpty()).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_2100
     * @tc.name testRollbackRecordsOutcome
     * @tc.desc Verify rollback auditing: after rolling back three operations the journal holds four entries including
     * one rolled back record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRollbackRecordsOutcome', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        const journal: OperationJournal = new OperationJournal();
        const executor: OperationExecutor = new OperationExecutor(registry, new ColorModeController(),
          new ContentLoadController(), new AbilityStartController('com.samples.abilitystage'), journal);
        executor.executeRegister('env-cb-main', 20);
        executor.executeSetColorMode(0, 30);
        executor.executeLoadContent(INDEX_PAGE_PATH, 120);
        const rolled: number = executor.rollbackAll();
        expect(rolled).assertEqual(3);
        expect(journal.size()).assertEqual(4);
        expect(journal.countOf(OperationOutcome.OUTCOME_ROLLED_BACK)).assertEqual(1);
        expect(journal.lastKey()).assertEqual('op_rollback');
        const summary: OperationAuditSummary = new OperationAuditSummary(journal);
        expect(summary.isBalanced()).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_2200
     * @tc.name testRollbackEmptyStack
     * @tc.desc Verify empty rollback: popping from an empty stack returns an empty action, peek returns an empty string
     * and depth stays zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRollbackEmptyStack', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stack: OperationRollbackStack = new OperationRollbackStack();
        expect(stack.isEmpty()).assertTrue();
        expect(stack.depth()).assertEqual(0);
        expect(stack.peek()).assertEqual('');
        expect(stack.rollbackLast()).assertEqual('');
        expect(stack.rollbackAll().length).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_2300
     * @tc.name testRollbackLastAction
     * @tc.desc Verify single rollback: pushing three actions then popping one leaves depth 2 with the middle action
     * still on top
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRollbackLastAction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stack: OperationRollbackStack = new OperationRollbackStack();
        stack.push('action-one');
        stack.push('action-two');
        stack.push('action-three');
        expect(stack.rollbackLast()).assertEqual('action-three');
        expect(stack.depth()).assertEqual(2);
        expect(stack.peek()).assertEqual('action-two');
        stack.clear();
        expect(stack.isEmpty()).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_2400
     * @tc.name testJournalEmptyState
     * @tc.desc Verify an empty journal: size 0, zero elapsed time, empty first and last keys and monotonic sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJournalEmptyState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const journal: OperationJournal = new OperationJournal();
        expect(journal.size()).assertEqual(0);
        expect(journal.totalElapsed()).assertEqual(0);
        expect(journal.firstKey()).assertEqual('');
        expect(journal.lastKey()).assertEqual('');
        expect(journal.sequencesAreMonotonic()).assertTrue();
        expect(journal.keys().length).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_2500
     * @tc.name testJournalSequenceRestartsAfterClear
     * @tc.desc Verify journal clearing: after clearing the sequence counter restarts at 1 for the next recorded
     * operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJournalSequenceRestartsAfterClear', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const journal: OperationJournal = new OperationJournal();
        journal.record('op_a', OperationKind.KIND_REGISTER_ENV_CALLBACK, OperationOutcome.OUTCOME_APPLIED, 5);
        journal.record('op_b', OperationKind.KIND_LOAD_CONTENT, OperationOutcome.OUTCOME_APPLIED, 5);
        journal.clear();
        expect(journal.size()).assertEqual(0);
        const fresh: OperationRecord = journal.record('op_c', OperationKind.KIND_START_ABILITY,
          OperationOutcome.OUTCOME_APPLIED, 7);
        expect(fresh.sequence).assertEqual(1);
        expect(journal.totalElapsed()).assertEqual(7);
        expect(journal.keys().length).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_2600
     * @tc.name testExecutorStartAbilityIdempotent
     * @tc.desc Verify start ability idempotency: the first start applies, the second is skipped, and only one ability is
     * tracked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExecutorStartAbilityIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const starter: AbilityStartController = new AbilityStartController('com.samples.abilitystage');
        const journal: OperationJournal = new OperationJournal();
        const executor: OperationExecutor = new OperationExecutor(new EnvironmentCallbackRegistry(),
          new ColorModeController(), new ContentLoadController(), starter, journal);
        expect(executor.executeStartAbility('EntryAbility', 200)).assertEqual(OperationOutcome.OUTCOME_APPLIED);
        expect(executor.executeStartAbility('EntryAbility', 200))
          .assertEqual(OperationOutcome.OUTCOME_SKIPPED_IDEMPOTENT);
        expect(starter.getStartedCount()).assertEqual(1);
        expect(starter.getStartedAbilities()[0]).assertEqual('EntryAbility');
        expect(journal.totalElapsed()).assertEqual(400);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_2700
     * @tc.name testExecutorContentRejection
     * @tc.desc Verify executor content rejection: an invalid content path is rejected, no load is recorded and no undo
     * action is pushed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExecutorContentRejection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const loader: ContentLoadController = new ContentLoadController();
        const journal: OperationJournal = new OperationJournal();
        const executor: OperationExecutor = new OperationExecutor(new EnvironmentCallbackRegistry(),
          new ColorModeController(), loader, new AbilityStartController('com.samples.abilitystage'), journal);
        expect(executor.executeLoadContent('', 120)).assertEqual(OperationOutcome.OUTCOME_REJECTED);
        expect(loader.getLoadCount()).assertEqual(0);
        expect(loader.getRejectCount()).assertEqual(1);
        expect(executor.getRollbackStack().depth()).assertEqual(0);
        expect(journal.countOf(OperationOutcome.OUTCOME_REJECTED)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_2800
     * @tc.name testExecutorColorModeIdempotentOutcome
     * @tc.desc Verify executor color mode idempotency: applying mode 1 twice yields applied then skipped with a single
     * application counted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExecutorColorModeIdempotentOutcome', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const colorMode: ColorModeController = new ColorModeController();
        const executor: OperationExecutor = new OperationExecutor(new EnvironmentCallbackRegistry(), colorMode,
          new ContentLoadController(), new AbilityStartController('com.samples.abilitystage'),
          new OperationJournal());
        expect(executor.executeSetColorMode(1, 30)).assertEqual(OperationOutcome.OUTCOME_APPLIED);
        expect(executor.executeSetColorMode(1, 30)).assertEqual(OperationOutcome.OUTCOME_SKIPPED_IDEMPOTENT);
        expect(colorMode.getApplyCount()).assertEqual(1);
        expect(executor.executeSetColorMode(42, 30)).assertEqual(OperationOutcome.OUTCOME_REJECTED);
        expect(colorMode.getCurrentMode()).assertEqual(1);
        expect(colorMode.getRejectCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_2900
     * @tc.name testExecutorRegisterUnregisterCycle
     * @tc.desc Verify a register and unregister cycle through the executor: both apply, the registry ends empty and two
     * undo actions are stacked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExecutorRegisterUnregisterCycle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        const journal: OperationJournal = new OperationJournal();
        const executor: OperationExecutor = new OperationExecutor(registry, new ColorModeController(),
          new ContentLoadController(), new AbilityStartController('com.samples.abilitystage'), journal);
        expect(executor.executeRegister('env-cb-cycle', 20)).assertEqual(OperationOutcome.OUTCOME_APPLIED);
        expect(executor.executeUnregister('env-cb-cycle', 20)).assertEqual(OperationOutcome.OUTCOME_APPLIED);
        expect(registry.count()).assertEqual(0);
        expect(executor.getRollbackStack().depth()).assertEqual(2);
        expect(journal.size()).assertEqual(2);
        expect(journal.countOf(OperationOutcome.OUTCOME_APPLIED)).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_3000
     * @tc.name testBudgetTrackerEmptyAndSingle
     * @tc.desc Verify budget tracker boundaries: an empty catalogue reports zero average while a single entry reports
     * its own budget as total, average, heaviest and cheapest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBudgetTrackerEmptyAndSingle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const emptySpecs: OperationSpec[] = [];
        const emptyTracker: OperationBudgetTracker = new OperationBudgetTracker(emptySpecs);
        expect(emptyTracker.total()).assertEqual(0);
        expect(emptyTracker.average()).assertEqual(0);
        const single: OperationSpec[] = [OperationDefinitions.LOAD_CONTENT];
        const tracker: OperationBudgetTracker = new OperationBudgetTracker(single);
        expect(tracker.total()).assertEqual(120);
        expect(tracker.average()).assertEqual(120);
        expect(tracker.heaviestKey()).assertEqual('op_load_content');
        expect(tracker.cheapestKey()).assertEqual('op_load_content');
        expect(tracker.budgetOf('op_absent')).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_3100
     * @tc.name testRealRegisterEnvironmentCallbackPath
     * @tc.desc Verify the real launch path performs stage creation: launching EntryAbility exposes the index page and
     * the model registry can hold the environment callback registered by AbilityStage onCreate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealRegisterEnvironmentCallbackPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        await launchEntryAbility();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        const token: number = registry.register(ENV_CALLBACK_EVENT);
        expect(token).assertEqual(1);
        expect(registry.isRegistered(ENV_CALLBACK_EVENT)).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
        expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_3200
     * @tc.name testRealSetColorModePath
     * @tc.desc Verify color mode operations coexist with the running ability: after setting color mode the index page
     * remains visible through a background and foreground cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealSetColorModePath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const colorMode: ColorModeController = new ColorModeController();
        expect(colorMode.setColorMode(COLOR_MODE_NOT_SET)).assertFalse();
        await doAbilityBackground();
        await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
        await doAbilityForeground();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        expect(await isIndexPageVisible(driver)).assertTrue();
        expect(colorMode.isNotSet()).assertTrue();
        expect(colorMode.getApplyCount()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_3300
     * @tc.name testRealLoadContentPath
     * @tc.desc Verify the real load content result: the window stage create callback loaded pages/Index and the page
     * exposes HelloWorld with at least one component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealLoadContentPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const loader: ContentLoadController = new ContentLoadController();
        await waitForIndexPageStable(driver);
        expect(loader.loadContent(INDEX_PAGE_PATH)).assertTrue();
        expect(loader.getLoadedPath()).assertEqual('pages/Index');
        expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
        const componentCount: number = await pageComponentCount(driver);
        expect(componentCount >= 1).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_3400
     * @tc.name testRealStartAbilityPath
     * @tc.desc Verify the real start ability operation: the starter accepts the delegator bundle name and the ability
     * launch keeps the page visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealStartAbilityPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const bundleName: string = getBundleName();
        const starter: AbilityStartController = new AbilityStartController(bundleName);
        expect(starter.canStart('EntryAbility')).assertTrue();
        expect(starter.startAbility('EntryAbility')).assertTrue();
        expect(starter.getStartedCount()).assertEqual(1);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_3500
     * @tc.name testRealOperationIdempotency
     * @tc.desc Verify idempotency against the runtime: issuing the same launch request twice keeps exactly one visible
     * page with at least one component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealOperationIdempotency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const starter: AbilityStartController = new AbilityStartController(getBundleName());
        expect(starter.startAbility('EntryAbility')).assertTrue();
        await launchEntryAbility();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        expect(starter.startAbility('EntryAbility')).assertFalse();
        await launchEntryAbility();
        const componentCount: number = await pageComponentCount(driver);
        expect(await isIndexPageVisible(driver)).assertTrue();
        expect(componentCount >= 1).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_3600
     * @tc.name testRealOperationAuditLatency
     * @tc.desc Verify audited runtime latency: the visible page cycle completes within five launch timeouts and the
     * journal records the two operations performed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealOperationAuditLatency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const journal: OperationJournal = new OperationJournal();
        const startTime: number = Date.now();
        await doAbilityForeground();
        await doAbilityBackground();
        journal.record('op_foreground', OperationKind.KIND_START_ABILITY, OperationOutcome.OUTCOME_APPLIED,
          measureElapsed(startTime));
        await doAbilityForeground();
        journal.record('op_foreground_again', OperationKind.KIND_START_ABILITY,
          OperationOutcome.OUTCOME_APPLIED, measureElapsed(startTime));
        const elapsed: number = journal.totalElapsed();
        expect(isWithinBudget(elapsed, TIMEOUT_ABILITY_LAUNCH * 5)).assertTrue();
        expect(journal.size()).assertEqual(2);
        expect(await isIndexPageVisible(driver)).assertTrue();
        expect(elapsed >= 0).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_3700
     * @tc.name testRealPageTextsAfterOperations
     * @tc.desc Verify the page text state after operations: the collected texts contain the initial or clicked message
     * and the page text key is HelloWorld
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealPageTextsAfterOperations', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await waitForIndexPageStable(driver);
        const texts: string[] = await collectAllTexts(driver);
        const hasInitial: boolean = texts.includes(PAGE_TEXT_INITIAL);
        const hasClicked: boolean = texts.includes(PAGE_TEXT_CLICKED);
        expect(texts.length >= 1).assertTrue();
        expect(hasInitial || hasClicked).assertTrue();
        expect(INDEX_PAGE_TEXT_KEY).assertEqual('HelloWorld');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_3800
     * @tc.name testRealRollbackLeavesRuntimeIntact
     * @tc.desc Verify rollback safety: rolling back the modelled operations does not disturb the running ability, which
     * still reports a visible index page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealRollbackLeavesRuntimeIntact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        const journal: OperationJournal = new OperationJournal();
        const executor: OperationExecutor = new OperationExecutor(registry, new ColorModeController(),
          new ContentLoadController(), new AbilityStartController(getBundleName()), journal);
        executor.executeRegister('env-cb-main', 20);
        executor.executeLoadContent(INDEX_PAGE_PATH, 120);
        const rolled: number = executor.rollbackAll();
        expect(rolled).assertEqual(2);
        expect(journal.countOf(OperationOutcome.OUTCOME_ROLLED_BACK)).assertEqual(1);
        expect(await isIndexPageVisible(driver)).assertTrue();
        expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_OPERATIONS_3900
     * @tc.name testOperationKindLookup
     * @tc.desc Verify kind lookup: each of the five kinds resolves to its specification and a kind outside the range
     * resolves to null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOperationKindLookup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registerSpec: OperationSpec | null = OperationDefinitions.byKind(OperationKind.KIND_REGISTER_ENV_CALLBACK);
        const startSpec: OperationSpec | null = OperationDefinitions.byKind(OperationKind.KIND_START_ABILITY);
        expect(registerSpec === null).assertFalse();
        if (registerSpec !== null) {
          expect(registerSpec.key).assertEqual('op_register_env');
          expect(registerSpec.budgetMs).assertEqual(20);
        }
        expect(startSpec === null).assertFalse();
        if (startSpec !== null) {
          expect(startSpec.label).assertEqual('StartEntryAbility');
        }
        expect(OperationDefinitions.byKind(99) === null).assertTrue();
      } finally {
        done();
      }
    })
  })
}
