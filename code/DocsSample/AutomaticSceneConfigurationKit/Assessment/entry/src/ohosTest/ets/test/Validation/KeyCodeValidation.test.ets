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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  ID_INDEX_TITLE,
  ID_EXAM_TITLE,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  KEY_HOME,
  KEY_TAB,
  KEY_ESCAPE,
  TIMEOUT_PAGE_TRANSITION,
  serializedDelay,
  triggerSerializedKey,
  getDriver,
  launchAssessmentApp,
  findById,
  waitForIndexPage,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Repeat policy of a key, it mirrors how the exam page treats a held key.
const REPEAT_DELAY_MS: number = 400;
const REPEAT_INTERVAL_MS: number = 80;
const MAX_REPEAT_COUNT: number = 8;
const LONG_PRESS_THRESHOLD_MS: number = 600;

// Sentinel for an unknown key code.
const UNKNOWN_KEY: number = -1;

/**
 * Category of a key, it drives the handler that the page chooses.
 */
enum KeyCategory {
  DIRECTION = 'direction',
  CONFIRM = 'confirm',
  CANCEL = 'cancel',
  SYSTEM = 'system',
  TRAVERSAL = 'traversal',
  MEDIA = 'media',
  VOLUME = 'volume',
  UNKNOWN = 'unknown'
}

/**
 * Action that a key resolves to inside the sample.
 */
enum NavigationAction {
  NONE = 'none',
  FOCUS_LEFT = 'focus_left',
  FOCUS_RIGHT = 'focus_right',
  FOCUS_UP = 'focus_up',
  FOCUS_DOWN = 'focus_down',
  ACTIVATE = 'activate',
  LEAVE_PAGE = 'leave_page',
  LEAVE_APP = 'leave_app',
  MOVE_TRAVERSAL = 'move_traversal',
  IGNORE = 'ignore'
}

/**
 * Outcome of a key press.
 */
enum PressOutcome {
  HANDLED = 'handled',
  IGNORED = 'ignored',
  REPEAT_SUPPRESSED = 'repeat_suppressed',
  UNKNOWN_KEY = 'unknown_key'
}

/**
 * Static description of one key.
 */
interface KeyDescriptor {
  code: number;
  name: string;
  category: KeyCategory;
  action: NavigationAction;
  repeatable: boolean;
  printable: boolean;
}

/**
 * One recorded key event.
 */
interface KeyEventRecord {
  code: number;
  outcome: PressOutcome;
  action: NavigationAction;
  repeatCount: number;
  timestamp: number;
}

/**
 * Result of a key dispatch.
 */
interface DispatchResult {
  outcome: PressOutcome;
  action: NavigationAction;
  handled: boolean;
  description: string;
}

/**
 * Result of the repeat policy evaluation.
 */
interface RepeatDecision {
  allowed: boolean;
  effectiveCount: number;
  suppressedCount: number;
}

/**
 * Aggregated key statistics.
 */
interface KeyStatistics {
  totalEvents: number;
  handledEvents: number;
  ignoredEvents: number;
  unknownEvents: number;
  distinctKeys: number;
}

/**
 * Catalogue of the key codes used by the sample.
 *
 * The catalogue is the single source of truth for the name, the category and the action of
 * a key. Every lookup of the page goes through it.
 */
class KeyCatalog {
  private static readonly DESCRIPTORS: KeyDescriptor[] = [
    {
      code: KEY_LEFT, name: 'KEYCODE_DPAD_LEFT', category: KeyCategory.DIRECTION,
      action: NavigationAction.FOCUS_LEFT, repeatable: true, printable: false
    },
    {
      code: KEY_RIGHT, name: 'KEYCODE_DPAD_RIGHT', category: KeyCategory.DIRECTION,
      action: NavigationAction.FOCUS_RIGHT, repeatable: true, printable: false
    },
    {
      code: KEY_UP, name: 'KEYCODE_DPAD_UP', category: KeyCategory.DIRECTION,
      action: NavigationAction.FOCUS_UP, repeatable: true, printable: false
    },
    {
      code: KEY_DOWN, name: 'KEYCODE_DPAD_DOWN', category: KeyCategory.DIRECTION,
      action: NavigationAction.FOCUS_DOWN, repeatable: true, printable: false
    },
    {
      code: KEY_ENTER, name: 'KEYCODE_ENTER', category: KeyCategory.CONFIRM,
      action: NavigationAction.ACTIVATE, repeatable: false, printable: false
    },
    {
      code: KEY_BACK, name: 'KEYCODE_BACK', category: KeyCategory.CANCEL,
      action: NavigationAction.LEAVE_PAGE, repeatable: false, printable: false
    },
    {
      code: KEY_HOME, name: 'KEYCODE_HOME', category: KeyCategory.SYSTEM,
      action: NavigationAction.LEAVE_APP, repeatable: false, printable: false
    },
    {
      code: KEY_TAB, name: 'KEYCODE_TAB', category: KeyCategory.TRAVERSAL,
      action: NavigationAction.MOVE_TRAVERSAL, repeatable: true, printable: false
    },
    {
      code: KEY_ESCAPE, name: 'KEYCODE_ESCAPE', category: KeyCategory.CANCEL,
      action: NavigationAction.LEAVE_PAGE, repeatable: false, printable: false
    }
  ];

  public static all(): KeyDescriptor[] {
    return KeyCatalog.DESCRIPTORS.slice();
  }

  public static count(): number {
    return KeyCatalog.DESCRIPTORS.length;
  }

  public static find(code: number): KeyDescriptor | null {
    for (let i = 0; i < KeyCatalog.DESCRIPTORS.length; i++) {
      if (KeyCatalog.DESCRIPTORS[i].code === code) {
        return KeyCatalog.DESCRIPTORS[i];
      }
    }
    return null;
  }

  public static nameOf(code: number): string {
    const descriptor: KeyDescriptor | null = KeyCatalog.find(code);
    if (descriptor === null) {
      return 'KEYCODE_UNKNOWN';
    }
    return descriptor.name;
  }

  public static categoryOf(code: number): KeyCategory {
    const descriptor: KeyDescriptor | null = KeyCatalog.find(code);
    if (descriptor === null) {
      return KeyCategory.UNKNOWN;
    }
    return descriptor.category;
  }

  public static actionOf(code: number): NavigationAction {
    const descriptor: KeyDescriptor | null = KeyCatalog.find(code);
    if (descriptor === null) {
      return NavigationAction.NONE;
    }
    return descriptor.action;
  }

  public static isRepeatable(code: number): boolean {
    const descriptor: KeyDescriptor | null = KeyCatalog.find(code);
    if (descriptor === null) {
      return false;
    }
    return descriptor.repeatable;
  }

  public static isPrintable(code: number): boolean {
    const descriptor: KeyDescriptor | null = KeyCatalog.find(code);
    if (descriptor === null) {
      return false;
    }
    return descriptor.printable;
  }

  public static contains(code: number): boolean {
    return KeyCatalog.find(code) !== null;
  }

  public static codes(): number[] {
    const result: number[] = [];
    for (let i = 0; i < KeyCatalog.DESCRIPTORS.length; i++) {
      result.push(KeyCatalog.DESCRIPTORS[i].code);
    }
    return result;
  }

  public static codesOfCategory(category: KeyCategory): number[] {
    const result: number[] = [];
    for (let i = 0; i < KeyCatalog.DESCRIPTORS.length; i++) {
      if (KeyCatalog.DESCRIPTORS[i].category === category) {
        result.push(KeyCatalog.DESCRIPTORS[i].code);
      }
    }
    return result;
  }

  public static distinctCodes(): number {
    const seen: number[] = [];
    for (let i = 0; i < KeyCatalog.DESCRIPTORS.length; i++) {
      if (seen.indexOf(KeyCatalog.DESCRIPTORS[i].code) < 0) {
        seen.push(KeyCatalog.DESCRIPTORS[i].code);
      }
    }
    return seen.length;
  }

  public static duplicateCodes(): number[] {
    const result: number[] = [];
    const seen: number[] = [];
    for (let i = 0; i < KeyCatalog.DESCRIPTORS.length; i++) {
      const code: number = KeyCatalog.DESCRIPTORS[i].code;
      if (seen.indexOf(code) >= 0 && result.indexOf(code) < 0) {
        result.push(code);
      } else {
        seen.push(code);
      }
    }
    return result;
  }
}

/**
 * Resolves a key code to the navigation action of the page.
 *
 * The resolver adds the context of the current page: the back key on the entry page leaves
 * the ability while the back key on the exam page ends the assessment first.
 */
class KeyActionResolver {
  private onExamPage: boolean;

  public constructor(onExamPage: boolean = false) {
    this.onExamPage = onExamPage;
  }

  public setOnExamPage(value: boolean): void {
    this.onExamPage = value;
  }

  public isOnExamPage(): boolean {
    return this.onExamPage;
  }

  public resolve(code: number): NavigationAction {
    const action: NavigationAction = KeyCatalog.actionOf(code);
    if (action === NavigationAction.LEAVE_PAGE) {
      return this.onExamPage ? NavigationAction.LEAVE_PAGE : NavigationAction.LEAVE_APP;
    }
    return action;
  }

  public isNavigationAction(action: NavigationAction): boolean {
    return action === NavigationAction.FOCUS_LEFT || action === NavigationAction.FOCUS_RIGHT ||
      action === NavigationAction.FOCUS_UP || action === NavigationAction.FOCUS_DOWN;
  }

  public movesFocus(code: number): boolean {
    return this.isNavigationAction(this.resolve(code));
  }

  public isCancelAction(action: NavigationAction): boolean {
    return action === NavigationAction.LEAVE_PAGE || action === NavigationAction.LEAVE_APP;
  }

  public isActivation(code: number): boolean {
    return this.resolve(code) === NavigationAction.ACTIVATE;
  }

  // The directional action of a key is turned into a delta on the focus grid. The exam page
  // uses the delta to step through the questions.
  public columnDelta(code: number): number {
    const action: NavigationAction = this.resolve(code);
    if (action === NavigationAction.FOCUS_LEFT) {
      return -1;
    }
    if (action === NavigationAction.FOCUS_RIGHT) {
      return 1;
    }
    return 0;
  }

  public rowDelta(code: number): number {
    const action: NavigationAction = this.resolve(code);
    if (action === NavigationAction.FOCUS_UP) {
      return -1;
    }
    if (action === NavigationAction.FOCUS_DOWN) {
      return 1;
    }
    return 0;
  }

  public describe(code: number): string {
    const action: NavigationAction = this.resolve(code);
    if (this.isNavigationAction(action)) {
      return `move focus ${action.substring('focus_'.length)}`;
    }
    if (action === NavigationAction.ACTIVATE) {
      return 'activate the focused control';
    }
    if (action === NavigationAction.LEAVE_PAGE) {
      return 'leave the current page';
    }
    if (action === NavigationAction.LEAVE_APP) {
      return 'leave the application';
    }
    if (action === NavigationAction.MOVE_TRAVERSAL) {
      return 'traverse to the next control';
    }
    return 'no action';
  }
}

/**
 * Repeat policy of a held key.
 *
 * A held direction key repeats until the key is released, a held confirm key is treated as
 * a single activation and a held cancel key is dropped after the first event.
 */
class KeyRepeatPolicy {
  private pressedSince: Map<number, number> = new Map<number, number>();
  private repeatCounts: Map<number, number> = new Map<number, number>();

  public press(code: number, timestamp: number): void {
    this.pressedSince.set(code, timestamp);
    this.repeatCounts.set(code, 0);
  }

  public release(code: number): void {
    this.pressedSince.delete(code);
    this.repeatCounts.delete(code);
  }

  public isPressed(code: number): boolean {
    return this.pressedSince.has(code);
  }

  public heldFor(code: number, timestamp: number): number {
    const since: number | undefined = this.pressedSince.get(code);
    if (since === undefined) {
      return 0;
    }
    return timestamp - since;
  }

  public evaluate(code: number, timestamp: number): RepeatDecision {
    if (!this.isPressed(code)) {
      const notPressed: RepeatDecision = {
        allowed: false,
        effectiveCount: 0,
        suppressedCount: 0
      };
      return notPressed;
    }
    const held: number = this.heldFor(code, timestamp);
    if (held < REPEAT_DELAY_MS) {
      const early: RepeatDecision = {
        allowed: false,
        effectiveCount: 0,
        suppressedCount: 1
      };
      return early;
    }
    if (!KeyCatalog.isRepeatable(code)) {
      const notRepeatable: RepeatDecision = {
        allowed: false,
        effectiveCount: 0,
        suppressedCount: 1
      };
      return notRepeatable;
    }
    const current: number = this.repeatCounts.get(code) ?? 0;
    if (current >= MAX_REPEAT_COUNT) {
      const capped: RepeatDecision = {
        allowed: false,
        effectiveCount: current,
        suppressedCount: 1
      };
      return capped;
    }
    this.repeatCounts.set(code, current + 1);
    const allowed: RepeatDecision = {
      allowed: true,
      effectiveCount: current + 1,
      suppressedCount: 0
    };
    return allowed;
  }

  public countOf(code: number): number {
    return this.repeatCounts.get(code) ?? 0;
  }

  public pressedCount(): number {
    return this.pressedSince.size;
  }

  public reset(): void {
    this.pressedSince = new Map<number, number>();
    this.repeatCounts = new Map<number, number>();
  }
}

/**
 * Dispatcher of key events of a page.
 *
 * The dispatcher consults the catalogue, the resolver and the repeat policy, then records
 * the outcome in its journal so that the cases can verify the full chain.
 */
class KeyDispatcher {
  private resolver: KeyActionResolver;
  private repeatPolicy: KeyRepeatPolicy;
  private journal: KeyEventRecord[] = [];
  private capacity: number;

  public constructor(resolver: KeyActionResolver, capacity: number = 64) {
    this.resolver = resolver;
    this.repeatPolicy = new KeyRepeatPolicy();
    this.capacity = capacity > 0 ? capacity : 64;
  }

  public getResolver(): KeyActionResolver {
    return this.resolver;
  }

  public getRepeatPolicy(): KeyRepeatPolicy {
    return this.repeatPolicy;
  }

  public dispatch(code: number): DispatchResult {
    const descriptor: KeyDescriptor | null = KeyCatalog.find(code);
    if (descriptor === null) {
      const unknown: DispatchResult = {
        outcome: PressOutcome.UNKNOWN_KEY,
        action: NavigationAction.NONE,
        handled: false,
        description: 'unknown key code'
      };
      this.record(code, unknown);
      return unknown;
    }
    const action: NavigationAction = this.resolver.resolve(code);
    if (action === NavigationAction.NONE || action === NavigationAction.IGNORE) {
      const ignored: DispatchResult = {
        outcome: PressOutcome.IGNORED,
        action: action,
        handled: false,
        description: 'no handler for the key'
      };
      this.record(code, ignored);
      return ignored;
    }
    const handled: DispatchResult = {
      outcome: PressOutcome.HANDLED,
      action: action,
      handled: true,
      description: this.resolver.describe(code)
    };
    this.record(code, handled);
    return handled;
  }

  // A repeat is only handled when the repeat policy allows it, the key must have been
  // pressed before the repeat event arrives.
  public dispatchRepeat(code: number, timestamp: number): DispatchResult {
    const decision: RepeatDecision = this.repeatPolicy.evaluate(code, timestamp);
    if (!decision.allowed) {
      const suppressed: DispatchResult = {
        outcome: PressOutcome.REPEAT_SUPPRESSED,
        action: NavigationAction.NONE,
        handled: false,
        description: 'the repeat was suppressed'
      };
      this.record(code, suppressed);
      return suppressed;
    }
    return this.dispatch(code);
  }

  private record(code: number, result: DispatchResult): void {
    const record: KeyEventRecord = {
      code: code,
      outcome: result.outcome,
      action: result.action,
      repeatCount: this.repeatPolicy.countOf(code),
      timestamp: Date.now()
    };
    this.journal.push(record);
    while (this.journal.length > this.capacity) {
      this.journal.shift();
    }
  }

  public getJournal(): KeyEventRecord[] {
    return this.journal.slice();
  }

  public journalSize(): number {
    return this.journal.length;
  }

  public latest(): KeyEventRecord | null {
    if (this.journal.length === 0) {
      return null;
    }
    return this.journal[this.journal.length - 1];
  }

  public countOutcome(outcome: PressOutcome): number {
    let count: number = 0;
    for (let i = 0; i < this.journal.length; i++) {
      if (this.journal[i].outcome === outcome) {
        count++;
      }
    }
    return count;
  }

  public countOfCode(code: number): number {
    let count: number = 0;
    for (let i = 0; i < this.journal.length; i++) {
      if (this.journal[i].code === code) {
        count++;
      }
    }
    return count;
  }

  public clear(): void {
    this.journal = [];
    this.repeatPolicy.reset();
  }

  public statistics(): KeyStatistics {
    const distinct: number[] = [];
    for (let i = 0; i < this.journal.length; i++) {
      if (distinct.indexOf(this.journal[i].code) < 0) {
        distinct.push(this.journal[i].code);
      }
    }
    const stats: KeyStatistics = {
      totalEvents: this.journal.length,
      handledEvents: this.countOutcome(PressOutcome.HANDLED),
      ignoredEvents: this.countOutcome(PressOutcome.IGNORED),
      unknownEvents: this.countOutcome(PressOutcome.UNKNOWN_KEY),
      distinctKeys: distinct.length
    };
    return stats;
  }
}

/**
 * Interrupt tracker of a key sequence.
 *
 * The exam page treats a cancel key as an interrupt of the running interaction, after the
 * interrupt every buffered move is dropped.
 */
class KeyInterruptTracker {
  private interrupted: boolean = false;
  private buffered: number[] = [];
  private interruptCount: number = 0;

  public buffer(code: number): void {
    if (this.interrupted) {
      return;
    }
    this.buffered.push(code);
  }

  public interrupt(): void {
    this.interrupted = true;
    this.interruptCount++;
    this.buffered = [];
  }

  public resume(): void {
    this.interrupted = false;
  }

  public isInterrupted(): boolean {
    return this.interrupted;
  }

  public bufferSize(): number {
    return this.buffered.length;
  }

  public getBuffered(): number[] {
    return this.buffered.slice();
  }

  public count(): number {
    return this.interruptCount;
  }

  public consume(): number[] {
    const result: number[] = this.buffered.slice();
    this.buffered = [];
    return result;
  }

  public reset(): void {
    this.interrupted = false;
    this.buffered = [];
    this.interruptCount = 0;
  }
}

/**
 * Builds synthetic key streams for the repeat cases.
 */
class KeyStreamBuilder {
  public static repeat(code: number, count: number): number[] {
    const stream: number[] = [];
    for (let i = 0; i < count; i++) {
      stream.push(code);
    }
    return stream;
  }

  public static mixed(codeA: number, countA: number, codeB: number, countB: number): number[] {
    const stream: number[] = [];
    for (let i = 0; i < countA; i++) {
      stream.push(codeA);
    }
    for (let i = 0; i < countB; i++) {
      stream.push(codeB);
    }
    return stream;
  }

  public static uniqueCodes(codes: number[]): number {
    const seen: number[] = [];
    for (let i = 0; i < codes.length; i++) {
      if (seen.indexOf(codes[i]) < 0) {
        seen.push(codes[i]);
      }
    }
    return seen.length;
  }

  public static contains(codes: number[], code: number): boolean {
    return codes.indexOf(code) >= 0;
  }
}

/**
 * Clamps a value into the inclusive bounds.
 *
 * The helper is a free function so that the grid walk case can reuse it without building a
 * manager first.
 *
 * @param value value to clamp.
 * @param minimum lower bound.
 * @param maximum upper bound.
 * @returns the clamped value.
 */
function clampValue(value: number, minimum: number, maximum: number): number {
  if (value < minimum) {
    return minimum;
  }
  if (value > maximum) {
    return maximum;
  }
  return value;
}

export default function keyCodeValidationTest() {
  describe('KeyCodeValidation_Test', () => {
    let driver: Driver;
    let resolver: KeyActionResolver;

    beforeAll(async () => {
      driver = getDriver();
      resolver = new KeyActionResolver(false);
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_TRANSITION);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the catalogue size and the documented catalogued codes.
     * Expectation: nine keys are catalogued and every documented code is present.
     */
    it('Assessment_KeyCodeCatalogSize_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogSize_001, begin');
      expect(KeyCatalog.count()).assertEqual(9);
      expect(KeyCatalog.contains(KEY_LEFT)).assertTrue();
      expect(KeyCatalog.contains(KEY_RIGHT)).assertTrue();
      expect(KeyCatalog.contains(KEY_UP)).assertTrue();
      expect(KeyCatalog.contains(KEY_DOWN)).assertTrue();
      expect(KeyCatalog.contains(KEY_ENTER)).assertTrue();
      expect(KeyCatalog.contains(KEY_BACK)).assertTrue();
      expect(KeyCatalog.contains(KEY_HOME)).assertTrue();
      expect(KeyCatalog.contains(KEY_TAB)).assertTrue();
      expect(KeyCatalog.contains(KEY_ESCAPE)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogSize_001, end');
    });

    /**
     * Scenario: the numeric values of the documented key codes.
     * Expectation: the codes follow the OpenHarmony key code table.
     */
    it('Assessment_KeyCodeCatalogValues_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogValues_002, begin');
      expect(KEY_LEFT).assertEqual(2014);
      expect(KEY_RIGHT).assertEqual(2015);
      expect(KEY_UP).assertEqual(2012);
      expect(KEY_DOWN).assertEqual(2013);
      expect(KEY_ENTER).assertEqual(2049);
      expect(KEY_BACK).assertEqual(2);
      expect(KEY_HOME).assertEqual(3);
      expect(KEY_TAB).assertEqual(4);
      expect(KEY_ESCAPE).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogValues_002, end');
    });

    /**
     * Scenario: the names of the catalogued keys.
     * Expectation: every key answers its documented symbolic name.
     */
    it('Assessment_KeyCodeCatalogNames_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogNames_003, begin');
      expect(KeyCatalog.nameOf(KEY_LEFT)).assertEqual('KEYCODE_DPAD_LEFT');
      expect(KeyCatalog.nameOf(KEY_RIGHT)).assertEqual('KEYCODE_DPAD_RIGHT');
      expect(KeyCatalog.nameOf(KEY_UP)).assertEqual('KEYCODE_DPAD_UP');
      expect(KeyCatalog.nameOf(KEY_DOWN)).assertEqual('KEYCODE_DPAD_DOWN');
      expect(KeyCatalog.nameOf(KEY_ENTER)).assertEqual('KEYCODE_ENTER');
      expect(KeyCatalog.nameOf(KEY_BACK)).assertEqual('KEYCODE_BACK');
      expect(KeyCatalog.nameOf(KEY_HOME)).assertEqual('KEYCODE_HOME');
      expect(KeyCatalog.nameOf(KEY_TAB)).assertEqual('KEYCODE_TAB');
      expect(KeyCatalog.nameOf(KEY_ESCAPE)).assertEqual('KEYCODE_ESCAPE');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogNames_003, end');
    });

    /**
     * Scenario: the name of an uncatalogued key code.
     * Expectation: the catalogue answers the unknown placeholder.
     */
    it('Assessment_KeyCodeCatalogUnknownName_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogUnknownName_004, begin');
      expect(KeyCatalog.nameOf(UNKNOWN_KEY)).assertEqual('KEYCODE_UNKNOWN');
      expect(KeyCatalog.nameOf(9999)).assertEqual('KEYCODE_UNKNOWN');
      expect(KeyCatalog.nameOf(0)).assertEqual('KEYCODE_UNKNOWN');
      expect(KeyCatalog.contains(9999)).assertFalse();
      expect(KeyCatalog.find(9999) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogUnknownName_004, end');
    });

    /**
     * Scenario: the categories of the catalogued keys.
     * Expectation: the direction keys are the only direction category members.
     */
    it('Assessment_KeyCodeCatalogCategories_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogCategories_005, begin');
      expect(KeyCatalog.categoryOf(KEY_LEFT)).assertEqual(KeyCategory.DIRECTION);
      expect(KeyCatalog.categoryOf(KEY_RIGHT)).assertEqual(KeyCategory.DIRECTION);
      expect(KeyCatalog.categoryOf(KEY_UP)).assertEqual(KeyCategory.DIRECTION);
      expect(KeyCatalog.categoryOf(KEY_DOWN)).assertEqual(KeyCategory.DIRECTION);
      expect(KeyCatalog.categoryOf(KEY_ENTER)).assertEqual(KeyCategory.CONFIRM);
      expect(KeyCatalog.categoryOf(KEY_BACK)).assertEqual(KeyCategory.CANCEL);
      expect(KeyCatalog.categoryOf(KEY_ESCAPE)).assertEqual(KeyCategory.CANCEL);
      expect(KeyCatalog.categoryOf(KEY_HOME)).assertEqual(KeyCategory.SYSTEM);
      expect(KeyCatalog.categoryOf(KEY_TAB)).assertEqual(KeyCategory.TRAVERSAL);
      expect(KeyCatalog.categoryOf(9999)).assertEqual(KeyCategory.UNKNOWN);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogCategories_005, end');
    });

    /**
     * Scenario: the codes of one category.
     * Expectation: the direction category holds exactly four codes in catalog order.
     */
    it('Assessment_KeyCodeCatalogCategoryCodes_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogCategoryCodes_006, begin');
      const directions: number[] = KeyCatalog.codesOfCategory(KeyCategory.DIRECTION);
      expect(directions.length).assertEqual(4);
      expect(directions[0]).assertEqual(KEY_LEFT);
      expect(directions[1]).assertEqual(KEY_RIGHT);
      expect(directions[2]).assertEqual(KEY_UP);
      expect(directions[3]).assertEqual(KEY_DOWN);
      const cancels: number[] = KeyCatalog.codesOfCategory(KeyCategory.CANCEL);
      expect(cancels.length).assertEqual(2);
      expect(KeyCatalog.codesOfCategory(KeyCategory.MEDIA).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogCategoryCodes_006, end');
    });

    /**
     * Scenario: the flat code list of the catalogue.
     * Expectation: the list has one entry per catalogued key.
     */
    it('Assessment_KeyCodeCatalogCodes_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogCodes_007, begin');
      const codes: number[] = KeyCatalog.codes();
      expect(codes.length).assertEqual(9);
      expect(codes[0]).assertEqual(KEY_LEFT);
      expect(codes[8]).assertEqual(KEY_ESCAPE);
      expect(KeyStreamBuilder.contains(codes, KEY_ENTER)).assertTrue();
      expect(KeyStreamBuilder.uniqueCodes(codes)).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogCodes_007, end');
    });

    /**
     * Scenario: the duplicate detector of the catalogue.
     * Expectation: the documented catalogue holds no duplicated code.
     */
    it('Assessment_KeyCodeCatalogNoDuplicates_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogNoDuplicates_008, begin');
      expect(KeyCatalog.distinctCodes()).assertEqual(9);
      expect(KeyCatalog.duplicateCodes().length).assertEqual(0);
      expect(KeyCatalog.count()).assertEqual(KeyCatalog.distinctCodes());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogNoDuplicates_008, end');
    });

    /**
     * Scenario: the repeatability flag of every catalogued key.
     * Expectation: direction and traversal keys repeat, confirm and cancel keys do not.
     */
    it('Assessment_KeyCodeRepeatableFlags_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeRepeatableFlags_009, begin');
      expect(KeyCatalog.isRepeatable(KEY_LEFT)).assertTrue();
      expect(KeyCatalog.isRepeatable(KEY_RIGHT)).assertTrue();
      expect(KeyCatalog.isRepeatable(KEY_UP)).assertTrue();
      expect(KeyCatalog.isRepeatable(KEY_DOWN)).assertTrue();
      expect(KeyCatalog.isRepeatable(KEY_TAB)).assertTrue();
      expect(KeyCatalog.isRepeatable(KEY_ENTER)).assertFalse();
      expect(KeyCatalog.isRepeatable(KEY_BACK)).assertFalse();
      expect(KeyCatalog.isRepeatable(KEY_HOME)).assertFalse();
      expect(KeyCatalog.isRepeatable(9999)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeRepeatableFlags_009, end');
    });

    /**
     * Scenario: the printable flag of the catalogue.
     * Expectation: none of the navigation keys is printable.
     */
    it('Assessment_KeyCodePrintableFlags_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodePrintableFlags_010, begin');
      const codes: number[] = KeyCatalog.codes();
      let printable: number = 0;
      for (let i = 0; i < codes.length; i++) {
        if (KeyCatalog.isPrintable(codes[i])) {
          printable++;
        }
      }
      expect(printable).assertEqual(0);
      expect(KeyCatalog.isPrintable(KEY_TAB)).assertFalse();
      expect(KeyCatalog.isPrintable(KEY_ENTER)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodePrintableFlags_010, end');
    });

    /**
     * Scenario: the action of every direction key.
     * Expectation: the action names the focus direction exactly once.
     */
    it('Assessment_KeyCodeDirectionActions_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDirectionActions_011, begin');
      expect(KeyCatalog.actionOf(KEY_LEFT)).assertEqual(NavigationAction.FOCUS_LEFT);
      expect(KeyCatalog.actionOf(KEY_RIGHT)).assertEqual(NavigationAction.FOCUS_RIGHT);
      expect(KeyCatalog.actionOf(KEY_UP)).assertEqual(NavigationAction.FOCUS_UP);
      expect(KeyCatalog.actionOf(KEY_DOWN)).assertEqual(NavigationAction.FOCUS_DOWN);
      expect(KeyCatalog.actionOf(9999)).assertEqual(NavigationAction.NONE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDirectionActions_011, end');
    });

    /**
     * Scenario: the action of the non movement keys.
     * Expectation: confirm activates, cancel leaves and traversal moves the focus onward.
     */
    it('Assessment_KeyCodeNonMovementActions_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeNonMovementActions_012, begin');
      expect(KeyCatalog.actionOf(KEY_ENTER)).assertEqual(NavigationAction.ACTIVATE);
      expect(KeyCatalog.actionOf(KEY_BACK)).assertEqual(NavigationAction.LEAVE_PAGE);
      expect(KeyCatalog.actionOf(KEY_ESCAPE)).assertEqual(NavigationAction.LEAVE_PAGE);
      expect(KeyCatalog.actionOf(KEY_HOME)).assertEqual(NavigationAction.LEAVE_APP);
      expect(KeyCatalog.actionOf(KEY_TAB)).assertEqual(NavigationAction.MOVE_TRAVERSAL);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeNonMovementActions_012, end');
    });

    /**
     * Scenario: the descriptor lookup of the catalogue.
     * Expectation: a found descriptor carries every documented field.
     */
    it('Assessment_KeyCodeDescriptorFields_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDescriptorFields_013, begin');
      const descriptor: KeyDescriptor | null = KeyCatalog.find(KEY_ENTER);
      expect(descriptor !== null).assertTrue();
      if (descriptor !== null) {
        expect(descriptor.code).assertEqual(KEY_ENTER);
        expect(descriptor.name).assertEqual('KEYCODE_ENTER');
        expect(descriptor.category).assertEqual(KeyCategory.CONFIRM);
        expect(descriptor.action).assertEqual(NavigationAction.ACTIVATE);
        expect(descriptor.repeatable).assertFalse();
        expect(descriptor.printable).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDescriptorFields_013, end');
    });

    /**
     * Scenario: the descriptor list getter of the catalogue.
     * Expectation: the list is a defensive copy.
     */
    it('Assessment_KeyCodeDescriptorCopy_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDescriptorCopy_014, begin');
      const copy: KeyDescriptor[] = KeyCatalog.all();
      copy.push({
        code: 4242,
        name: 'KEYCODE_INJECTED',
        category: KeyCategory.UNKNOWN,
        action: NavigationAction.NONE,
        repeatable: false,
        printable: false
      });
      expect(KeyCatalog.count()).assertEqual(9);
      expect(KeyCatalog.contains(4242)).assertFalse();
      expect(KeyCatalog.all().length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDescriptorCopy_014, end');
    });

    /**
     * Scenario: the action resolver on the entry page.
     * Expectation: the back key leaves the application because no page sits on top.
     */
    it('Assessment_KeyCodeResolverEntryPage_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeResolverEntryPage_015, begin');
      const entryResolver: KeyActionResolver = new KeyActionResolver(false);
      expect(entryResolver.isOnExamPage()).assertFalse();
      expect(entryResolver.resolve(KEY_BACK)).assertEqual(NavigationAction.LEAVE_APP);
      expect(entryResolver.resolve(KEY_ESCAPE)).assertEqual(NavigationAction.LEAVE_APP);
      expect(entryResolver.isCancelAction(entryResolver.resolve(KEY_BACK))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeResolverEntryPage_015, end');
    });

    /**
     * Scenario: the action resolver on the exam page.
     * Expectation: the back key stays on the page action so the assessment ends first.
     */
    it('Assessment_KeyCodeResolverExamPage_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeResolverExamPage_016, begin');
      const examResolver: KeyActionResolver = new KeyActionResolver(true);
      expect(examResolver.isOnExamPage()).assertTrue();
      expect(examResolver.resolve(KEY_BACK)).assertEqual(NavigationAction.LEAVE_PAGE);
      expect(examResolver.resolve(KEY_HOME)).assertEqual(NavigationAction.LEAVE_APP);
      examResolver.setOnExamPage(false);
      expect(examResolver.resolve(KEY_BACK)).assertEqual(NavigationAction.LEAVE_APP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeResolverExamPage_016, end');
    });

    /**
     * Scenario: the focus movement predicate of the resolver.
     * Expectation: only the four direction keys move the focus.
     */
    it('Assessment_KeyCodeResolverMovement_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeResolverMovement_017, begin');
      expect(resolver.movesFocus(KEY_LEFT)).assertTrue();
      expect(resolver.movesFocus(KEY_RIGHT)).assertTrue();
      expect(resolver.movesFocus(KEY_UP)).assertTrue();
      expect(resolver.movesFocus(KEY_DOWN)).assertTrue();
      expect(resolver.movesFocus(KEY_ENTER)).assertFalse();
      expect(resolver.movesFocus(KEY_BACK)).assertFalse();
      expect(resolver.movesFocus(KEY_TAB)).assertFalse();
      expect(resolver.movesFocus(9999)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeResolverMovement_017, end');
    });

    /**
     * Scenario: the activation predicate of the resolver.
     * Expectation: only the enter key activates the focused control.
     */
    it('Assessment_KeyCodeResolverActivation_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeResolverActivation_018, begin');
      expect(resolver.isActivation(KEY_ENTER)).assertTrue();
      expect(resolver.isActivation(KEY_LEFT)).assertFalse();
      expect(resolver.isActivation(KEY_BACK)).assertFalse();
      expect(resolver.isActivation(9999)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeResolverActivation_018, end');
    });

    /**
     * Scenario: the column delta of the horizontal keys.
     * Expectation: left is minus one, right is plus one and the rest is zero.
     */
    it('Assessment_KeyCodeResolverColumnDelta_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeResolverColumnDelta_019, begin');
      expect(resolver.columnDelta(KEY_LEFT)).assertEqual(-1);
      expect(resolver.columnDelta(KEY_RIGHT)).assertEqual(1);
      expect(resolver.columnDelta(KEY_UP)).assertEqual(0);
      expect(resolver.columnDelta(KEY_DOWN)).assertEqual(0);
      expect(resolver.columnDelta(KEY_ENTER)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeResolverColumnDelta_019, end');
    });

    /**
     * Scenario: the row delta of the vertical keys.
     * Expectation: up is minus one, down is plus one and the rest is zero.
     */
    it('Assessment_KeyCodeResolverRowDelta_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeResolverRowDelta_020, begin');
      expect(resolver.rowDelta(KEY_UP)).assertEqual(-1);
      expect(resolver.rowDelta(KEY_DOWN)).assertEqual(1);
      expect(resolver.rowDelta(KEY_LEFT)).assertEqual(0);
      expect(resolver.rowDelta(KEY_RIGHT)).assertEqual(0);
      expect(resolver.rowDelta(KEY_TAB)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeResolverRowDelta_020, end');
    });

    /**
     * Scenario: the resolver descriptions.
     * Expectation: every action answers a non empty English description.
     */
    it('Assessment_KeyCodeResolverDescriptions_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeResolverDescriptions_021, begin');
      expect(resolver.describe(KEY_LEFT)).assertEqual('move focus left');
      expect(resolver.describe(KEY_RIGHT)).assertEqual('move focus right');
      expect(resolver.describe(KEY_UP)).assertEqual('move focus up');
      expect(resolver.describe(KEY_DOWN)).assertEqual('move focus down');
      expect(resolver.describe(KEY_ENTER)).assertEqual('activate the focused control');
      expect(resolver.describe(KEY_BACK)).assertEqual('leave the application');
      expect(resolver.describe(KEY_TAB)).assertEqual('traverse to the next control');
      expect(resolver.describe(9999)).assertEqual('no action');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeResolverDescriptions_021, end');
    });

    /**
     * Scenario: a dispatcher on the entry page.
     * Expectation: the direction keys are handled and record their action.
     */
    it('Assessment_KeyCodeDispatchDirection_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchDirection_022, begin');
      const dispatcher: KeyDispatcher = new KeyDispatcher(new KeyActionResolver(false));
      const down: DispatchResult = dispatcher.dispatch(KEY_DOWN);
      expect(down.outcome).assertEqual(PressOutcome.HANDLED);
      expect(down.handled).assertTrue();
      expect(down.action).assertEqual(NavigationAction.FOCUS_DOWN);
      expect(down.description).assertEqual('move focus down');
      expect(dispatcher.journalSize()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchDirection_022, end');
    });

    /**
     * Scenario: dispatching every direction key.
     * Expectation: each key answers its own action and the journal keeps the order.
     */
    it('Assessment_KeyCodeDispatchAllDirections_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchAllDirections_023, begin');
      const dispatcher: KeyDispatcher = new KeyDispatcher(new KeyActionResolver(false));
      dispatcher.dispatch(KEY_LEFT);
      dispatcher.dispatch(KEY_RIGHT);
      dispatcher.dispatch(KEY_UP);
      dispatcher.dispatch(KEY_DOWN);
      const journal: KeyEventRecord[] = dispatcher.getJournal();
      expect(journal.length).assertEqual(4);
      expect(journal[0].action).assertEqual(NavigationAction.FOCUS_LEFT);
      expect(journal[1].action).assertEqual(NavigationAction.FOCUS_RIGHT);
      expect(journal[2].action).assertEqual(NavigationAction.FOCUS_UP);
      expect(journal[3].action).assertEqual(NavigationAction.FOCUS_DOWN);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchAllDirections_023, end');
    });

    /**
     * Scenario: dispatching the confirm key.
     * Expectation: the activation action is recorded and the event is handled.
     */
    it('Assessment_KeyCodeDispatchConfirm_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchConfirm_024, begin');
      const dispatcher: KeyDispatcher = new KeyDispatcher(new KeyActionResolver(false));
      const result: DispatchResult = dispatcher.dispatch(KEY_ENTER);
      expect(result.outcome).assertEqual(PressOutcome.HANDLED);
      expect(result.action).assertEqual(NavigationAction.ACTIVATE);
      expect(dispatcher.countOfCode(KEY_ENTER)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchConfirm_024, end');
    });

    /**
     * Scenario: dispatching the cancel key on the exam page.
     * Expectation: the leave page action is produced, not the leave app action.
     */
    it('Assessment_KeyCodeDispatchCancelExam_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchCancelExam_025, begin');
      const dispatcher: KeyDispatcher = new KeyDispatcher(new KeyActionResolver(true));
      const result: DispatchResult = dispatcher.dispatch(KEY_BACK);
      expect(result.outcome).assertEqual(PressOutcome.HANDLED);
      expect(result.action).assertEqual(NavigationAction.LEAVE_PAGE);
      expect(result.description).assertEqual('leave the current page');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchCancelExam_025, end');
    });

    /**
     * Scenario: dispatching the home key.
     * Expectation: the leave app action is produced on every page.
     */
    it('Assessment_KeyCodeDispatchHome_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchHome_026, begin');
      const entry: KeyDispatcher = new KeyDispatcher(new KeyActionResolver(false));
      const exam: KeyDispatcher = new KeyDispatcher(new KeyActionResolver(true));
      expect(entry.dispatch(KEY_HOME).action).assertEqual(NavigationAction.LEAVE_APP);
      expect(exam.dispatch(KEY_HOME).action).assertEqual(NavigationAction.LEAVE_APP);
      expect(entry.dispatch(KEY_HOME).description).assertEqual('leave the application');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchHome_026, end');
    });

    /**
     * Scenario: dispatching an uncatalogued key.
     * Expectation: the event is reported as unknown and nothing is handled.
     */
    it('Assessment_KeyCodeDispatchUnknown_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchUnknown_027, begin');
      const dispatcher: KeyDispatcher = new KeyDispatcher(new KeyActionResolver(false));
      const result: DispatchResult = dispatcher.dispatch(9999);
      expect(result.outcome).assertEqual(PressOutcome.UNKNOWN_KEY);
      expect(result.handled).assertFalse();
      expect(result.action).assertEqual(NavigationAction.NONE);
      expect(result.description).assertEqual('unknown key code');
      expect(dispatcher.countOutcome(PressOutcome.UNKNOWN_KEY)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchUnknown_027, end');
    });

    /**
     * Scenario: repeated unknown key codes.
     * Expectation: every unknown event is counted separately in the journal.
     */
    it('Assessment_KeyCodeDispatchUnknownRepeated_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchUnknownRepeated_028, begin');
      const dispatcher: KeyDispatcher = new KeyDispatcher(new KeyActionResolver(false));
      const unknownCodes: number[] = [-1, 0, 42, 9999];
      for (let i = 0; i < unknownCodes.length; i++) {
        dispatcher.dispatch(unknownCodes[i]);
      }
      expect(dispatcher.countOutcome(PressOutcome.UNKNOWN_KEY)).assertEqual(4);
      expect(dispatcher.statistics().unknownEvents).assertEqual(4);
      expect(dispatcher.statistics().handledEvents).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchUnknownRepeated_028, end');
    });

    /**
     * Scenario: the journal latest accessor.
     * Expectation: the newest event is the last dispatched one.
     */
    it('Assessment_KeyCodeDispatchLatest_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchLatest_029, begin');
      const dispatcher: KeyDispatcher = new KeyDispatcher(new KeyActionResolver(false));
      expect(dispatcher.latest() === null).assertTrue();
      dispatcher.dispatch(KEY_LEFT);
      dispatcher.dispatch(KEY_RIGHT);
      const latest: KeyEventRecord | null = dispatcher.latest();
      expect(latest !== null).assertTrue();
      if (latest !== null) {
        expect(latest.code).assertEqual(KEY_RIGHT);
        expect(latest.action).assertEqual(NavigationAction.FOCUS_RIGHT);
        expect(latest.outcome).assertEqual(PressOutcome.HANDLED);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchLatest_029, end');
    });

    /**
     * Scenario: the journal capacity of the dispatcher.
     * Expectation: older events are dropped once the capacity is reached.
     */
    it('Assessment_KeyCodeDispatchJournalCapacity_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchJournalCapacity_030, begin');
      const dispatcher: KeyDispatcher = new KeyDispatcher(new KeyActionResolver(false), 5);
      const stream: number[] = KeyStreamBuilder.repeat(KEY_DOWN, 12);
      for (let i = 0; i < stream.length; i++) {
        dispatcher.dispatch(stream[i]);
      }
      expect(dispatcher.journalSize()).assertEqual(5);
      expect(dispatcher.getJournal().length).assertEqual(5);
      expect(dispatcher.countOfCode(KEY_DOWN)).assertEqual(5);
      const stats: KeyStatistics = dispatcher.statistics();
      expect(stats.totalEvents).assertEqual(5);
      expect(stats.distinctKeys).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchJournalCapacity_030, end');
    });

    /**
     * Scenario: clearing the dispatcher.
     * Expectation: the journal and the repeat counters are both dropped.
     */
    it('Assessment_KeyCodeDispatchClear_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchClear_031, begin');
      const dispatcher: KeyDispatcher = new KeyDispatcher(new KeyActionResolver(false));
      dispatcher.getRepeatPolicy().press(KEY_DOWN, 0);
      dispatcher.dispatch(KEY_DOWN);
      expect(dispatcher.journalSize()).assertEqual(1);
      dispatcher.clear();
      expect(dispatcher.journalSize()).assertEqual(0);
      expect(dispatcher.latest() === null).assertTrue();
      expect(dispatcher.getRepeatPolicy().isPressed(KEY_DOWN)).assertFalse();
      expect(dispatcher.getRepeatPolicy().pressedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchClear_031, end');
    });

    /**
     * Scenario: the statistics of a mixed key stream.
     * Expectation: handled, ignored and unknown events are counted per outcome.
     */
    it('Assessment_KeyCodeDispatchStatistics_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchStatistics_032, begin');
      const dispatcher: KeyDispatcher = new KeyDispatcher(new KeyActionResolver(false));
      dispatcher.dispatch(KEY_LEFT);
      dispatcher.dispatch(KEY_RIGHT);
      dispatcher.dispatch(KEY_ENTER);
      dispatcher.dispatch(9999);
      dispatcher.dispatch(4242);
      const stats: KeyStatistics = dispatcher.statistics();
      expect(stats.totalEvents).assertEqual(5);
      expect(stats.handledEvents).assertEqual(3);
      expect(stats.unknownEvents).assertEqual(2);
      expect(stats.distinctKeys).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchStatistics_032, end');
    });

    /**
     * Scenario: a fresh repeat policy.
     * Expectation: nothing is pressed and every repeat is suppressed.
     */
    it('Assessment_KeyCodeRepeatPolicyFresh_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeRepeatPolicyFresh_033, begin');
      const policy: KeyRepeatPolicy = new KeyRepeatPolicy();
      expect(policy.isPressed(KEY_DOWN)).assertFalse();
      expect(policy.pressedCount()).assertEqual(0);
      expect(policy.heldFor(KEY_DOWN, 1000)).assertEqual(0);
      const decision: RepeatDecision = policy.evaluate(KEY_DOWN, 1000);
      expect(decision.allowed).assertFalse();
      expect(decision.suppressedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeRepeatPolicyFresh_033, end');
    });

    /**
     * Scenario: a repeat before the delay elapsed.
     * Expectation: the repeat is suppressed and counted as suppressed.
     */
    it('Assessment_KeyCodeRepeatPolicyEarly_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeRepeatPolicyEarly_034, begin');
      const policy: KeyRepeatPolicy = new KeyRepeatPolicy();
      policy.press(KEY_DOWN, 1000);
      expect(policy.isPressed(KEY_DOWN)).assertTrue();
      expect(policy.heldFor(KEY_DOWN, 1100)).assertEqual(100);
      const decision: RepeatDecision = policy.evaluate(KEY_DOWN, 1100);
      expect(decision.allowed).assertFalse();
      expect(decision.suppressedCount).assertEqual(1);
      expect(decision.effectiveCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeRepeatPolicyEarly_034, end');
    });

    /**
     * Scenario: a repeat after the delay elapsed.
     * Expectation: the repeat is allowed and the counter increases.
     */
    it('Assessment_KeyCodeRepeatPolicyAllowed_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeRepeatPolicyAllowed_035, begin');
      const policy: KeyRepeatPolicy = new KeyRepeatPolicy();
      policy.press(KEY_DOWN, 1000);
      const decision: RepeatDecision = policy.evaluate(KEY_DOWN, 1000 + REPEAT_DELAY_MS + 10);
      expect(decision.allowed).assertTrue();
      expect(decision.effectiveCount).assertEqual(1);
      expect(decision.suppressedCount).assertEqual(0);
      expect(policy.countOf(KEY_DOWN)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeRepeatPolicyAllowed_035, end');
    });

    /**
     * Scenario: the repeat cap of a held direction key.
     * Expectation: the repeat stops at the cap and every further repeat is suppressed.
     */
    it('Assessment_KeyCodeRepeatPolicyCap_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeRepeatPolicyCap_036, begin');
      const policy: KeyRepeatPolicy = new KeyRepeatPolicy();
      policy.press(KEY_RIGHT, 0);
      let allowed: number = 0;
      for (let i = 0; i < MAX_REPEAT_COUNT + 5; i++) {
        if (policy.evaluate(KEY_RIGHT, REPEAT_DELAY_MS + i * REPEAT_INTERVAL_MS).allowed) {
          allowed++;
        }
      }
      expect(allowed).assertEqual(MAX_REPEAT_COUNT);
      expect(policy.countOf(KEY_RIGHT)).assertEqual(MAX_REPEAT_COUNT);
      expect(policy.evaluate(KEY_RIGHT, 100000).allowed).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeRepeatPolicyCap_036, end');
    });

    /**
     * Scenario: a repeat of a non repeatable key.
     * Expectation: the confirm key never repeats even when it is held.
     */
    it('Assessment_KeyCodeRepeatPolicyNonRepeatable_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeRepeatPolicyNonRepeatable_037, begin');
      const policy: KeyRepeatPolicy = new KeyRepeatPolicy();
      policy.press(KEY_ENTER, 0);
      const decision: RepeatDecision = policy.evaluate(KEY_ENTER, REPEAT_DELAY_MS + 100);
      expect(decision.allowed).assertFalse();
      expect(decision.suppressedCount).assertEqual(1);
      expect(policy.countOf(KEY_ENTER)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeRepeatPolicyNonRepeatable_037, end');
    });

    /**
     * Scenario: releasing a held key.
     * Expectation: the press state and the repeat counter are both dropped.
     */
    it('Assessment_KeyCodeRepeatPolicyRelease_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeRepeatPolicyRelease_038, begin');
      const policy: KeyRepeatPolicy = new KeyRepeatPolicy();
      policy.press(KEY_DOWN, 0);
      policy.evaluate(KEY_DOWN, REPEAT_DELAY_MS + 10);
      expect(policy.countOf(KEY_DOWN)).assertEqual(1);
      policy.release(KEY_DOWN);
      expect(policy.isPressed(KEY_DOWN)).assertFalse();
      expect(policy.countOf(KEY_DOWN)).assertEqual(0);
      expect(policy.evaluate(KEY_DOWN, 10000).allowed).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeRepeatPolicyRelease_038, end');
    });

    /**
     * Scenario: two keys held at the same time.
     * Expectation: every key keeps its own repeat counter.
     */
    it('Assessment_KeyCodeRepeatPolicyMultiKey_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeRepeatPolicyMultiKey_039, begin');
      const policy: KeyRepeatPolicy = new KeyRepeatPolicy();
      policy.press(KEY_DOWN, 0);
      policy.press(KEY_RIGHT, 0);
      policy.evaluate(KEY_DOWN, REPEAT_DELAY_MS + 10);
      policy.evaluate(KEY_DOWN, REPEAT_DELAY_MS + 20);
      policy.evaluate(KEY_RIGHT, REPEAT_DELAY_MS + 30);
      expect(policy.pressedCount()).assertEqual(2);
      expect(policy.countOf(KEY_DOWN)).assertEqual(2);
      expect(policy.countOf(KEY_RIGHT)).assertEqual(1);
      policy.release(KEY_DOWN);
      expect(policy.pressedCount()).assertEqual(1);
      expect(policy.isPressed(KEY_RIGHT)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeRepeatPolicyMultiKey_039, end');
    });

    /**
     * Scenario: the reset of the repeat policy.
     * Expectation: every held key and counter is dropped.
     */
    it('Assessment_KeyCodeRepeatPolicyReset_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeRepeatPolicyReset_040, begin');
      const policy: KeyRepeatPolicy = new KeyRepeatPolicy();
      policy.press(KEY_DOWN, 0);
      policy.press(KEY_UP, 0);
      policy.evaluate(KEY_DOWN, REPEAT_DELAY_MS + 10);
      expect(policy.pressedCount()).assertEqual(2);
      policy.reset();
      expect(policy.pressedCount()).assertEqual(0);
      expect(policy.isPressed(KEY_DOWN)).assertFalse();
      expect(policy.countOf(KEY_DOWN)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeRepeatPolicyReset_040, end');
    });

    /**
     * Scenario: a repeat dispatched before the key was pressed.
     * Expectation: the dispatcher suppresses the repeat and records it.
     */
    it('Assessment_KeyCodeDispatchRepeatUnpressed_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchRepeatUnpressed_041, begin');
      const dispatcher: KeyDispatcher = new KeyDispatcher(new KeyActionResolver(false));
      const result: DispatchResult = dispatcher.dispatchRepeat(KEY_DOWN, 1000);
      expect(result.outcome).assertEqual(PressOutcome.REPEAT_SUPPRESSED);
      expect(result.handled).assertFalse();
      expect(dispatcher.countOutcome(PressOutcome.REPEAT_SUPPRESSED)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchRepeatUnpressed_041, end');
    });

    /**
     * Scenario: a repeat dispatched while the key is held.
     * Expectation: the repeat is handled once the delay passed.
     */
    it('Assessment_KeyCodeDispatchRepeatHeld_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchRepeatHeld_042, begin');
      const dispatcher: KeyDispatcher = new KeyDispatcher(new KeyActionResolver(false));
      dispatcher.getRepeatPolicy().press(KEY_DOWN, 0);
      const early: DispatchResult = dispatcher.dispatchRepeat(KEY_DOWN, REPEAT_DELAY_MS - 10);
      expect(early.outcome).assertEqual(PressOutcome.REPEAT_SUPPRESSED);
      const accepted: DispatchResult = dispatcher.dispatchRepeat(KEY_DOWN, REPEAT_DELAY_MS + 10);
      expect(accepted.outcome).assertEqual(PressOutcome.HANDLED);
      expect(accepted.action).assertEqual(NavigationAction.FOCUS_DOWN);
      expect(dispatcher.countOutcome(PressOutcome.HANDLED)).assertEqual(1);
      expect(dispatcher.countOutcome(PressOutcome.REPEAT_SUPPRESSED)).assertEqual(1);
      expect(dispatcher.countOfCode(KEY_DOWN)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchRepeatHeld_042, end');
    });

    /**
     * Scenario: a repeat cap reached by the dispatcher.
     * Expectation: no further handled event is recorded once the cap is reached.
     */
    it('Assessment_KeyCodeDispatchRepeatCap_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchRepeatCap_043, begin');
      const dispatcher: KeyDispatcher = new KeyDispatcher(new KeyActionResolver(false));
      dispatcher.getRepeatPolicy().press(KEY_RIGHT, 0);
      let handled: number = 0;
      for (let i = 0; i < MAX_REPEAT_COUNT + 4; i++) {
        if (dispatcher.dispatchRepeat(KEY_RIGHT, REPEAT_DELAY_MS + i * REPEAT_INTERVAL_MS).handled) {
          handled++;
        }
      }
      expect(handled).assertEqual(MAX_REPEAT_COUNT);
      expect(dispatcher.countOutcome(PressOutcome.HANDLED)).assertEqual(MAX_REPEAT_COUNT);
      expect(dispatcher.countOutcome(PressOutcome.REPEAT_SUPPRESSED)).assertEqual(4);
      expect(dispatcher.countOfCode(KEY_RIGHT)).assertEqual(MAX_REPEAT_COUNT + 4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchRepeatCap_043, end');
    });

    /**
     * Scenario: a fresh interrupt tracker.
     * Expectation: nothing is buffered, the tracker is not interrupted and the counter is zero.
     */
    it('Assessment_KeyCodeInterruptFresh_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeInterruptFresh_044, begin');
      const tracker: KeyInterruptTracker = new KeyInterruptTracker();
      expect(tracker.isInterrupted()).assertFalse();
      expect(tracker.bufferSize()).assertEqual(0);
      expect(tracker.count()).assertEqual(0);
      tracker.buffer(KEY_DOWN);
      expect(tracker.bufferSize()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeInterruptFresh_044, end');
    });

    /**
     * Scenario: an interrupt drops the buffered moves.
     * Expectation: after the interrupt the buffer is empty and further moves are dropped too.
     */
    it('Assessment_KeyCodeInterruptDropsBuffer_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeInterruptDropsBuffer_045, begin');
      const tracker: KeyInterruptTracker = new KeyInterruptTracker();
      tracker.buffer(KEY_DOWN);
      tracker.buffer(KEY_RIGHT);
      tracker.buffer(KEY_ENTER);
      expect(tracker.bufferSize()).assertEqual(3);
      tracker.interrupt();
      expect(tracker.isInterrupted()).assertTrue();
      expect(tracker.bufferSize()).assertEqual(0);
      expect(tracker.count()).assertEqual(1);
      tracker.buffer(KEY_UP);
      expect(tracker.bufferSize()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeInterruptDropsBuffer_045, end');
    });

    /**
     * Scenario: resuming after an interrupt.
     * Expectation: the buffer accepts moves again while the interrupt counter is preserved.
     */
    it('Assessment_KeyCodeInterruptResume_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeInterruptResume_046, begin');
      const tracker: KeyInterruptTracker = new KeyInterruptTracker();
      tracker.buffer(KEY_DOWN);
      tracker.interrupt();
      expect(tracker.isInterrupted()).assertTrue();
      tracker.resume();
      expect(tracker.isInterrupted()).assertFalse();
      tracker.buffer(KEY_UP);
      expect(tracker.bufferSize()).assertEqual(1);
      expect(tracker.count()).assertEqual(1);
      expect(tracker.getBuffered()[0]).assertEqual(KEY_UP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeInterruptResume_046, end');
    });

    /**
     * Scenario: consuming the buffer.
     * Expectation: the consume returns the buffered keys and empties the buffer.
     */
    it('Assessment_KeyCodeInterruptConsume_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeInterruptConsume_047, begin');
      const tracker: KeyInterruptTracker = new KeyInterruptTracker();
      tracker.buffer(KEY_DOWN);
      tracker.buffer(KEY_DOWN);
      tracker.buffer(KEY_ENTER);
      const consumed: number[] = tracker.consume();
      expect(consumed.length).assertEqual(3);
      expect(consumed[2]).assertEqual(KEY_ENTER);
      expect(tracker.bufferSize()).assertEqual(0);
      expect(tracker.consume().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeInterruptConsume_047, end');
    });

    /**
     * Scenario: the buffered getter is a defensive copy.
     * Expectation: mutating the copy leaves the tracker untouched.
     */
    it('Assessment_KeyCodeInterruptDefensiveCopy_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeInterruptDefensiveCopy_048, begin');
      const tracker: KeyInterruptTracker = new KeyInterruptTracker();
      tracker.buffer(KEY_DOWN);
      const copy: number[] = tracker.getBuffered();
      copy.push(KEY_UP);
      expect(tracker.bufferSize()).assertEqual(1);
      expect(tracker.getBuffered().length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeInterruptDefensiveCopy_048, end');
    });

    /**
     * Scenario: resetting the interrupt tracker.
     * Expectation: the buffer, the flag and the counter all return to the initial values.
     */
    it('Assessment_KeyCodeInterruptReset_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeInterruptReset_049, begin');
      const tracker: KeyInterruptTracker = new KeyInterruptTracker();
      tracker.buffer(KEY_DOWN);
      tracker.interrupt();
      tracker.buffer(KEY_UP);
      expect(tracker.count()).assertEqual(1);
      tracker.reset();
      expect(tracker.isInterrupted()).assertFalse();
      expect(tracker.bufferSize()).assertEqual(0);
      expect(tracker.count()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeInterruptReset_049, end');
    });

    /**
     * Scenario: a repeated interrupt counter.
     * Expectation: every interrupt increments the counter exactly once.
     */
    it('Assessment_KeyCodeInterruptCounter_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeInterruptCounter_050, begin');
      const tracker: KeyInterruptTracker = new KeyInterruptTracker();
      for (let i = 0; i < 4; i++) {
        tracker.interrupt();
        tracker.resume();
      }
      expect(tracker.count()).assertEqual(4);
      expect(tracker.isInterrupted()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeInterruptCounter_050, end');
    });

    /**
     * Scenario: the repeat stream builder.
     * Expectation: the stream holds the requested number of copies of one code.
     */
    it('Assessment_KeyCodeStreamRepeat_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeStreamRepeat_051, begin');
      const stream: number[] = KeyStreamBuilder.repeat(KEY_DOWN, 6);
      expect(stream.length).assertEqual(6);
      expect(stream[0]).assertEqual(KEY_DOWN);
      expect(stream[5]).assertEqual(KEY_DOWN);
      expect(KeyStreamBuilder.uniqueCodes(stream)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeStreamRepeat_051, end');
    });

    /**
     * Scenario: the mixed stream builder.
     * Expectation: the first block holds the first code and the second block the second code.
     */
    it('Assessment_KeyCodeStreamMixed_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeStreamMixed_052, begin');
      const stream: number[] = KeyStreamBuilder.mixed(KEY_DOWN, 3, KEY_RIGHT, 2);
      expect(stream.length).assertEqual(5);
      expect(stream[0]).assertEqual(KEY_DOWN);
      expect(stream[2]).assertEqual(KEY_DOWN);
      expect(stream[3]).assertEqual(KEY_RIGHT);
      expect(stream[4]).assertEqual(KEY_RIGHT);
      expect(KeyStreamBuilder.uniqueCodes(stream)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeStreamMixed_052, end');
    });

    /**
     * Scenario: the contains helper of the stream builder.
     * Expectation: only present codes are reported.
     */
    it('Assessment_KeyCodeStreamContains_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeStreamContains_053, begin');
      const stream: number[] = [KEY_DOWN, KEY_ENTER, KEY_BACK];
      expect(KeyStreamBuilder.contains(stream, KEY_DOWN)).assertTrue();
      expect(KeyStreamBuilder.contains(stream, KEY_ENTER)).assertTrue();
      expect(KeyStreamBuilder.contains(stream, KEY_LEFT)).assertFalse();
      expect(KeyStreamBuilder.contains([], KEY_DOWN)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeStreamContains_053, end');
    });

    /**
     * Scenario: the unique code counter of an empty stream.
     * Expectation: an empty stream holds no distinct code.
     */
    it('Assessment_KeyCodeStreamEmpty_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeStreamEmpty_054, begin');
      expect(KeyStreamBuilder.uniqueCodes([])).assertEqual(0);
      expect(KeyStreamBuilder.contains([], KEY_LEFT)).assertFalse();
      expect(KeyStreamBuilder.repeat(KEY_LEFT, 0).length).assertEqual(0);
      expect(KeyStreamBuilder.mixed(KEY_LEFT, 0, KEY_RIGHT, 0).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeStreamEmpty_054, end');
    });

    /**
     * Scenario: a dispatch of a full documented stream.
     * Expectation: the handled event count equals the stream length.
     */
    it('Assessment_KeyCodeDispatchStream_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchStream_055, begin');
      const dispatcher: KeyDispatcher = new KeyDispatcher(new KeyActionResolver(false), 128);
      const stream: number[] = KeyCatalog.codes();
      for (let i = 0; i < stream.length; i++) {
        expect(dispatcher.dispatch(stream[i]).handled).assertTrue();
      }
      expect(dispatcher.journalSize()).assertEqual(stream.length);
      expect(dispatcher.statistics().handledEvents).assertEqual(stream.length);
      expect(dispatcher.statistics().unknownEvents).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchStream_055, end');
    });

    /**
     * Scenario: the action chain of a stream.
     * Expectation: the recorded actions follow the catalogue order.
     */
    it('Assessment_KeyCodeDispatchStreamActions_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchStreamActions_056, begin');
      const dispatcher: KeyDispatcher = new KeyDispatcher(new KeyActionResolver(false), 32);
      const directions: number[] = KeyCatalog.codesOfCategory(KeyCategory.DIRECTION);
      for (let i = 0; i < directions.length; i++) {
        dispatcher.dispatch(directions[i]);
      }
      const journal: KeyEventRecord[] = dispatcher.getJournal();
      expect(journal.length).assertEqual(4);
      expect(journal[0].action).assertEqual(NavigationAction.FOCUS_LEFT);
      expect(journal[3].action).assertEqual(NavigationAction.FOCUS_DOWN);
      expect(journal[0].code).assertEqual(KEY_LEFT);
      expect(journal[3].code).assertEqual(KEY_DOWN);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeDispatchStreamActions_056, end');
    });

    /**
     * Scenario: a programmatic grid walk driven by key deltas.
     * Expectation: the deltas keep the cursor inside the grid bounds.
     */
    it('Assessment_KeyCodeGridWalk_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeGridWalk_057, begin');
      const rows: number = 3;
      const columns: number = 4;
      let row: number = 0;
      let column: number = 0;
      const keys: number[] = [KEY_RIGHT, KEY_RIGHT, KEY_DOWN, KEY_LEFT, KEY_DOWN, KEY_RIGHT];
      for (let i = 0; i < keys.length; i++) {
        row = clampValue(row + resolver.rowDelta(keys[i]), 0, rows - 1);
        column = clampValue(column + resolver.columnDelta(keys[i]), 0, columns - 1);
      }
      expect(row).assertEqual(2);
      expect(column).assertEqual(2);
      expect(row < rows).assertTrue();
      expect(column < columns).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeGridWalk_057, end');
    });

    /**
     * Scenario: the clamp helper used by the grid walk.
     * Expectation: values below and above the bounds collapse onto the bounds.
     */
    it('Assessment_KeyCodeGridClamp_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeGridClamp_058, begin');
      expect(clampValue(-5, 0, 3)).assertEqual(0);
      expect(clampValue(0, 0, 3)).assertEqual(0);
      expect(clampValue(2, 0, 3)).assertEqual(2);
      expect(clampValue(9, 0, 3)).assertEqual(3);
      expect(clampValue(1, 1, 1)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeGridClamp_058, end');
    });

    /**
     * Scenario: the long press threshold of the repeat policy.
     * Expectation: the threshold is larger than the initial repeat delay.
     */
    it('Assessment_KeyCodeThresholds_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeThresholds_059, begin');
      expect(LONG_PRESS_THRESHOLD_MS > REPEAT_DELAY_MS).assertTrue();
      expect(REPEAT_INTERVAL_MS < REPEAT_DELAY_MS).assertTrue();
      expect(MAX_REPEAT_COUNT).assertEqual(8);
      expect(REPEAT_DELAY_MS).assertEqual(400);
      expect(REPEAT_INTERVAL_MS).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeThresholds_059, end');
    });

    /**
     * Scenario: an end to end key scenario.
     * Expectation: press, repeat, interrupt and release leave a consistent dispatcher.
     */
    it('Assessment_KeyCodeComprehensive_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeComprehensive_061, begin');
      const pageResolver: KeyActionResolver = new KeyActionResolver(true);
      const dispatcher: KeyDispatcher = new KeyDispatcher(pageResolver, 64);
      const tracker: KeyInterruptTracker = new KeyInterruptTracker();
      expect(dispatcher.dispatch(KEY_DOWN).action).assertEqual(NavigationAction.FOCUS_DOWN);
      dispatcher.getRepeatPolicy().press(KEY_DOWN, 0);
      expect(dispatcher.dispatchRepeat(KEY_DOWN, REPEAT_DELAY_MS + 10).handled).assertTrue();
      expect(dispatcher.dispatch(KEY_ENTER).action).assertEqual(NavigationAction.ACTIVATE);
      tracker.buffer(KEY_DOWN);
      tracker.buffer(KEY_ENTER);
      tracker.interrupt();
      expect(tracker.bufferSize()).assertEqual(0);
      expect(dispatcher.dispatch(KEY_BACK).action).assertEqual(NavigationAction.LEAVE_PAGE);
      expect(dispatcher.countOutcome(PressOutcome.HANDLED)).assertEqual(4);
      expect(dispatcher.statistics().distinctKeys).assertEqual(3);
      dispatcher.getRepeatPolicy().release(KEY_DOWN);
      expect(dispatcher.getRepeatPolicy().pressedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeComprehensive_061, end');
    });

    /**
     * Scenario: the dispatcher actions never contradict the catalogue.
     * Expectation: every catalogued code answers the action the catalogue declares.
     */
    it('Assessment_KeyCodeCatalogDispatcherAgreement_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogDispatcherAgreement_068, begin');
      const entryResolver: KeyActionResolver = new KeyActionResolver(false);
      const codes: number[] = KeyCatalog.codes();
      for (let i = 0; i < codes.length; i++) {
        const catalogAction: NavigationAction = KeyCatalog.actionOf(codes[i]);
        const resolvedAction: NavigationAction = entryResolver.resolve(codes[i]);
        if (catalogAction === NavigationAction.LEAVE_PAGE) {
          expect(resolvedAction).assertEqual(NavigationAction.LEAVE_APP);
        } else {
          expect(resolvedAction).assertEqual(catalogAction);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogDispatcherAgreement_068, end');
    });

    /**
     * Scenario: the same code keeps a stable name across lookups.
     * Expectation: repeated name lookups answer the same string.
     */
    it('Assessment_KeyCodeCatalogStableNames_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogStableNames_069, begin');
      const first: string = KeyCatalog.nameOf(KEY_DOWN);
      const second: string = KeyCatalog.nameOf(KEY_DOWN);
      expect(first).assertEqual(second);
      expect(first).assertEqual('KEYCODE_DPAD_DOWN');
      expect(first.length > 0).assertTrue();
      expect(KeyCatalog.actionOf(KEY_DOWN)).assertEqual(KeyCatalog.actionOf(KEY_DOWN));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyCodeCatalogStableNames_069, end');
    });
  });
}
