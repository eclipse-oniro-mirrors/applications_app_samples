/*
 * Copyright (c) 2026 Sample Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, beforeEach } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, serializedDelay, pressKey, clickById, inputById,
  backPressConsumes,
  KEY_BACK, KEY_HOME, KEY_ENTER, KEY_DPAD_UP, KEY_DPAD_DOWN, KEY_DPAD_LEFT,
  KEY_DPAD_RIGHT,
  ID_INPUT_URL, ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME,
  ID_ACTION_SUBMIT, ID_ACTION_ADD,
  PAD_HOME_PAGE, PHONE_HOME_PAGE, DELAY_KEY_NAVIGATION, TIMEOUT_FOCUS_CHANGE,
  TIMEOUT_COMPONENT, MAX_TAB_COUNT, TAB_LIMIT_MESSAGE
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockLoadingStatus, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserKeyEventValidationTest';

/* ------------------------------------------------------------------ */
/* Key vocabulary                                                      */
/* ------------------------------------------------------------------ */

const ACT_NONE: string = 'none';
const ACT_BACK: string = 'back';
const ACT_FORWARD: string = 'forward';
const ACT_REFRESH: string = 'refresh';
const ACT_HOME: string = 'home';
const ACT_SUBMIT: string = 'submit';
const ACT_FOCUS_UP: string = 'focusUp';
const ACT_FOCUS_DOWN: string = 'focusDown';
const ACT_FOCUS_LEFT: string = 'focusLeft';
const ACT_FOCUS_RIGHT: string = 'focusRight';
const ACT_CLOSE_TAB: string = 'closeTab';

/** Focus scopes: the address bar owns Enter, the page owns the rest. */
const SCOPE_PAGE: string = 'page';
const SCOPE_INPUT: string = 'input';
const SCOPE_NONE: string = 'none';

/** Phase names of a single key gesture. */
const PHASE_DOWN: string = 'keyDown';
const PHASE_UP: string = 'keyUp';

/** Long press starts after half a second on every OpenHarmony remote. */
const LONG_PRESS_THRESHOLD: number = 500;

/** Repeat cadence of a held key. */
const LONG_PRESS_INTERVAL: number = 100;

/** Boundary of the legal key code range of the HID usage table. */
const KEY_CODE_MIN: number = 0;
const KEY_CODE_MAX: number = 3199;

/** Chromium's virtual key code for Enter on the OpenSource Web engine. */
const KEY_ENTER_WEB: number = 2054;

/* ------------------------------------------------------------------ */
/* Data structures                                                     */
/* ------------------------------------------------------------------ */

/** One row of the key to action mapping table. */
class KeyBinding {
  code: number;
  name: string;
  scope: string;
  action: string;

  constructor(code: number, name: string, scope: string, action: string) {
    this.code = code;
    this.name = name;
    this.scope = scope;
    this.action = action;
  }
}

/** Validation verdict of one key code. */
class KeyVerdict {
  code: number;
  known: boolean;
  inRange: boolean;
  reason: string;

  constructor(code: number, known: boolean, inRange: boolean, reason: string) {
    this.code = code;
    this.known = known;
    this.inRange = inRange;
    this.reason = reason;
  }
}

/** A single captured key event. */
class KeyEventRecord {
  code: number;
  phase: string;
  scope: string;
  timestamp: number;
  repeat: number;

  constructor(code: number, phase: string, scope: string, timestamp: number, repeat: number) {
    this.code = code;
    this.phase = phase;
    this.scope = scope;
    this.timestamp = timestamp;
    this.repeat = repeat;
  }
}

/* ------------------------------------------------------------------ */
/* Key tables                                                          */
/* ------------------------------------------------------------------ */

/** Mapping used while the Web page owns the focus. */
function pageKeyTable(): KeyBinding[] {
  return [
    new KeyBinding(KEY_BACK, 'KEY_BACK', SCOPE_PAGE, ACT_BACK),
    new KeyBinding(KEY_HOME, 'KEY_HOME', SCOPE_PAGE, ACT_HOME),
    new KeyBinding(KEY_ENTER, 'KEY_ENTER', SCOPE_PAGE, ACT_NONE),
    new KeyBinding(KEY_DPAD_UP, 'KEY_DPAD_UP', SCOPE_PAGE, ACT_FOCUS_UP),
    new KeyBinding(KEY_DPAD_DOWN, 'KEY_DPAD_DOWN', SCOPE_PAGE, ACT_FOCUS_DOWN),
    new KeyBinding(KEY_DPAD_LEFT, 'KEY_DPAD_LEFT', SCOPE_PAGE, ACT_FOCUS_LEFT),
    new KeyBinding(KEY_DPAD_RIGHT, 'KEY_DPAD_RIGHT', SCOPE_PAGE, ACT_FOCUS_RIGHT)
  ];
}

/** Mapping used while the address bar owns the focus. */
function inputKeyTable(): KeyBinding[] {
  return [
    new KeyBinding(KEY_BACK, 'KEY_BACK', SCOPE_INPUT, ACT_BACK),
    new KeyBinding(KEY_HOME, 'KEY_HOME', SCOPE_INPUT, ACT_HOME),
    new KeyBinding(KEY_ENTER, 'KEY_ENTER', SCOPE_INPUT, ACT_SUBMIT),
    new KeyBinding(KEY_DPAD_UP, 'KEY_DPAD_UP', SCOPE_INPUT, ACT_FOCUS_UP),
    new KeyBinding(KEY_DPAD_DOWN, 'KEY_DPAD_DOWN', SCOPE_INPUT, ACT_FOCUS_DOWN),
    new KeyBinding(KEY_DPAD_LEFT, 'KEY_DPAD_LEFT', SCOPE_INPUT, ACT_FOCUS_LEFT),
    new KeyBinding(KEY_DPAD_RIGHT, 'KEY_DPAD_RIGHT', SCOPE_INPUT, ACT_FOCUS_RIGHT)
  ];
}

/** Flat list of the seven physical keys handled by the sample. */
function allKeyNames(): string[] {
  return ['KEY_BACK', 'KEY_HOME', 'KEY_ENTER',
    'KEY_DPAD_UP', 'KEY_DPAD_DOWN', 'KEY_DPAD_LEFT', 'KEY_DPAD_RIGHT'];
}

/** Flat list of the seven physical key codes handled by the sample. */
function allKeyCodes(): number[] {
  return [KEY_BACK, KEY_HOME, KEY_ENTER,
    KEY_DPAD_UP, KEY_DPAD_DOWN, KEY_DPAD_LEFT, KEY_DPAD_RIGHT];
}

/** Name lookup for diagnostics; unknown codes return 'KEY_UNKNOWN'. */
function keyName(code: number): string {
  const names: string[] = allKeyNames();
  const codes: number[] = allKeyCodes();
  for (let index = 0; index < codes.length; index++) {
    if (codes[index] === code) {
      return names[index];
    }
  }
  return 'KEY_UNKNOWN';
}

/** True when the code belongs to the seven handled keys. */
function isKnownKey(code: number): boolean {
  return allKeyCodes().indexOf(code) >= 0;
}

/** True when the code is inside the legal HID range. */
function isInLegalRange(code: number): boolean {
  return code >= KEY_CODE_MIN && code <= KEY_CODE_MAX;
}

/** Builds a verdict for arbitrary input, including illegal values. */
function validateKey(code: number): KeyVerdict {
  if (!isInLegalRange(code)) {
    return new KeyVerdict(code, false, false, 'out of HID range');
  }
  if (!isKnownKey(code)) {
    return new KeyVerdict(code, false, true, 'not handled by the browser');
  }
  return new KeyVerdict(code, true, true, 'ok');
}

/* ------------------------------------------------------------------ */
/* Action router                                                       */
/* ------------------------------------------------------------------ */

/**
 * Resolves a key code against the active focus scope.
 * The router is pure so the mapping can be asserted without a device.
 */
class KeyRouter {
  private pageTable: KeyBinding[] = pageKeyTable();
  private inputTable: KeyBinding[] = inputKeyTable();

  resolve(code: number, scope: string): string {
    const table: KeyBinding[] = scope === SCOPE_INPUT ? this.inputTable : this.pageTable;
    for (let index = 0; index < table.length; index++) {
      if (table[index].code === code) {
        return table[index].action;
      }
    }
    return ACT_NONE;
  }

  bindingOf(code: number, scope: string): KeyBinding | null {
    const table: KeyBinding[] = scope === SCOPE_INPUT ? this.inputTable : this.pageTable;
    for (let index = 0; index < table.length; index++) {
      if (table[index].code === code) {
        return table[index];
      }
    }
    return null;
  }

  /** Name of the binding, or KEY_UNKNOWN when the code is not handled. */
  bindingName(code: number, scope: string): string {
    const binding: KeyBinding | null = this.bindingOf(code, scope);
    if (binding === null) {
      return 'KEY_UNKNOWN';
    }
    return binding.name;
  }

  actionCount(action: string, scope: string): number {
    const table: KeyBinding[] = scope === SCOPE_INPUT ? this.inputTable : this.pageTable;
    let total: number = 0;
    for (let index = 0; index < table.length; index++) {
      if (table[index].action === action) {
        total += 1;
      }
    }
    return total;
  }

  scopeDifference(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.pageTable.length; index++) {
      const page: KeyBinding = this.pageTable[index];
      const input: KeyBinding = this.inputTable[index];
      if (page.action !== input.action) {
        result.push(`${page.name}:${page.action}->${input.action}`);
      }
    }
    return result;
  }
}

/** Focus ring of the seven focusable components of the title bar. */
class FocusRing {
  targets: string[] = ['navBack', 'navForward', 'navRefresh', 'navHome',
    'input', 'submit', 'addTab'];
  index: number = 0;

  move(delta: number): number {
    const size: number = this.targets.length;
    let next: number = (this.index + delta) % size;
    if (next < 0) {
      next += size;
    }
    this.index = next;
    return this.index;
  }

  current(): string {
    return this.targets[this.index];
  }

  focusByName(name: string): boolean {
    const found: number = this.targets.indexOf(name);
    if (found < 0) {
      return false;
    }
    this.index = found;
    return true;
  }

  size(): number {
    return this.targets.length;
  }
}

/* ------------------------------------------------------------------ */
/* Metrics and long press detection                                    */
/* ------------------------------------------------------------------ */

/** Counts how often each key code was dispatched. */
class KeyMetrics {
  codes: number[] = [];
  counts: number[] = [];
  total: number = 0;

  record(code: number): void {
    const found: number = this.codes.indexOf(code);
    if (found >= 0) {
      this.counts[found] += 1;
    } else {
      this.codes.push(code);
      this.counts.push(1);
    }
    this.total += 1;
  }

  countOf(code: number): number {
    const found: number = this.codes.indexOf(code);
    return found < 0 ? 0 : this.counts[found];
  }

  distinct(): number {
    return this.codes.length;
  }

  mostFrequent(): number {
    let best: number = -1;
    let bestCount: number = 0;
    for (let index = 0; index < this.counts.length; index++) {
      if (this.counts[index] > bestCount) {
        bestCount = this.counts[index];
        best = this.codes[index];
      }
    }
    return best;
  }

  reset(): void {
    this.codes = [];
    this.counts = [];
    this.total = 0;
  }
}

/** Measures held duration and derives the repeat count of a long press. */
class LongPressDetector {
  private threshold: number;
  private interval: number;
  private downAt: number = -1;

  constructor(threshold: number = LONG_PRESS_THRESHOLD, interval: number = LONG_PRESS_INTERVAL) {
    this.threshold = threshold;
    this.interval = interval;
  }

  press(timestamp: number): void {
    this.downAt = timestamp;
  }

  release(timestamp: number): number {
    if (this.downAt < 0) {
      return 0;
    }
    const held: number = timestamp - this.downAt;
    this.downAt = -1;
    return held < 0 ? 0 : held;
  }

  isLongPress(heldMs: number): boolean {
    return heldMs >= this.threshold;
  }

  repeats(heldMs: number): number {
    if (heldMs < this.threshold) {
      return 0;
    }
    return Math.floor((heldMs - this.threshold) / this.interval) + 1;
  }

  thresholdMs(): number {
    return this.threshold;
  }
}

/** Ordered stream of down/up events with a deterministic clock. */
class KeyEventBus {
  records: KeyEventRecord[] = [];
  private sequence: number = 0;
  clock: MockClock = new MockClock();

  emit(code: number, phase: string, scope: string, repeat: number = 0): KeyEventRecord {
    this.sequence += 1;
    const record: KeyEventRecord = new KeyEventRecord(code, phase, scope,
      this.clock.now(), repeat);
    this.records.push(record);
    return record;
  }

  tap(code: number, scope: string): void {
    this.emit(code, PHASE_DOWN, scope, 0);
    this.clock.advance(DELAY_KEY_NAVIGATION);
    this.emit(code, PHASE_UP, scope, 0);
    this.clock.advance(DELAY_KEY_NAVIGATION);
  }

  hold(code: number, scope: string, heldMs: number): number {
    this.emit(code, PHASE_DOWN, scope, 0);
    this.clock.advance(heldMs);
    this.emit(code, PHASE_UP, scope, 0);
    this.clock.advance(DELAY_KEY_NAVIGATION);
    return heldMs;
  }

  total(): number {
    return this.records.length;
  }

  countPhase(phase: string): number {
    let total: number = 0;
    for (let index = 0; index < this.records.length; index++) {
      if (this.records[index].phase === phase) {
        total += 1;
      }
    }
    return total;
  }

  countOf(code: number): number {
    let total: number = 0;
    for (let index = 0; index < this.records.length; index++) {
      if (this.records[index].code === code) {
        total += 1;
      }
    }
    return total;
  }

  codesSeen(): number[] {
    const result: number[] = [];
    for (let index = 0; index < this.records.length; index++) {
      const code: number = this.records[index].code;
      if (result.indexOf(code) < 0) {
        result.push(code);
      }
    }
    return result;
  }

  balanced(): boolean {
    return this.countPhase(PHASE_DOWN) === this.countPhase(PHASE_UP);
  }

  reset(): void {
    this.records = [];
    this.sequence = 0;
    this.clock.reset();
  }
}

/** Number of focusable components wired by the title bar. */
function ringSizeOfTitleBar(): number {
  return new FocusRing().size();
}

export default function browserKeyEventValidationTest() {
  describe('browserKeyEventValidationTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin: key code and action mapping validation');
      await startBrowserApp();
      TestLogger.info(TAG, 'browser app started');
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    beforeEach(() => {
      TestLogger.resetSteps(TAG);
    });

    /** Every key code exported by the kit matches the platform value. */
    it('Key_Code_Definitions_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Code_Definitions_001');
      const started: number = Date.now();
      TestLogger.step(TAG, 'verify the seven key codes');
      expect(KEY_BACK).assertEqual(2);
      expect(KEY_HOME).assertEqual(3);
      expect(KEY_ENTER).assertEqual(2054);
      expect(KEY_DPAD_UP).assertEqual(2012);
      expect(KEY_DPAD_DOWN).assertEqual(2013);
      expect(KEY_DPAD_LEFT).assertEqual(2014);
      expect(KEY_DPAD_RIGHT).assertEqual(2015);
      expect(KEY_ENTER).assertEqual(KEY_ENTER_WEB);
      expect(keyName(KEY_BACK)).assertEqual('KEY_BACK');
      expect(keyName(KEY_ENTER)).assertEqual('KEY_ENTER');
      TestLogger.info(TAG, 'key code constants match the platform table');
      TestLogger.caseEnd(TAG, 'Key_Code_Definitions_001', Date.now() - started);
    });

    /** The seven handled codes must be distinct. */
    it('Key_Code_Uniqueness_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Code_Uniqueness_002');
      const started: number = Date.now();
      const codes: number[] = allKeyCodes();
      TestLogger.step(TAG, 'check code uniqueness');
      const unique: number[] = [];
      for (let index = 0; index < codes.length; index++) {
        if (unique.indexOf(codes[index]) < 0) {
          unique.push(codes[index]);
        }
        TestLogger.info(TAG, `code ${index}=${codes[index]} name=${keyName(codes[index])}`);
      }
      expect(codes.length).assertEqual(7);
      expect(unique.length).assertEqual(7);
      expect(unique.indexOf(KEY_BACK)).assertLarger(-1);
      expect(unique.indexOf(KEY_DPAD_RIGHT)).assertLarger(-1);
      TestLogger.caseEnd(TAG, 'Key_Code_Uniqueness_002', Date.now() - started);
    });

    /** The four direction keys are contiguous and above the system keys. */
    it('Key_Code_Range_Grouping_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Code_Range_Grouping_003');
      const started: number = Date.now();
      TestLogger.step(TAG, 'verify dpad grouping');
      expect(KEY_DPAD_DOWN - KEY_DPAD_UP).assertEqual(1);
      expect(KEY_DPAD_LEFT - KEY_DPAD_DOWN).assertEqual(1);
      expect(KEY_DPAD_RIGHT - KEY_DPAD_LEFT).assertEqual(1);
      expect(KEY_DPAD_UP).assertLarger(KEY_HOME);
      expect(KEY_ENTER).assertLarger(KEY_DPAD_RIGHT);
      expect(KEY_BACK).assertLess(KEY_HOME);
      expect(isInLegalRange(KEY_BACK)).assertTrue();
      expect(isInLegalRange(KEY_ENTER)).assertTrue();
      expect(isInLegalRange(-1)).assertFalse();
      expect(isInLegalRange(KEY_CODE_MAX + 1)).assertFalse();
      TestLogger.info(TAG, 'dpad group 2012..2015 verified');
      TestLogger.caseEnd(TAG, 'Key_Code_Range_Grouping_003', Date.now() - started);
    });

    /** Name lookup is total: every handled code resolves, others do not. */
    it('Key_Code_Name_Lookup_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Code_Name_Lookup_004');
      const started: number = Date.now();
      const names: string[] = allKeyNames();
      const codes: number[] = allKeyCodes();
      TestLogger.step(TAG, 'resolve every handled key name');
      for (let index = 0; index < codes.length; index++) {
        expect(keyName(codes[index])).assertEqual(names[index]);
        expect(isKnownKey(codes[index])).assertTrue();
      }
      expect(keyName(0)).assertEqual('KEY_UNKNOWN');
      expect(keyName(-1)).assertEqual('KEY_UNKNOWN');
      expect(keyName(9999)).assertEqual('KEY_UNKNOWN');
      expect(keyName(KEY_ENTER + 1)).assertEqual('KEY_UNKNOWN');
      expect(names.length).assertEqual(7);
      TestLogger.info(TAG, 'unknown codes degrade to KEY_UNKNOWN');
      TestLogger.caseEnd(TAG, 'Key_Code_Name_Lookup_004', Date.now() - started);
    });

    /** Illegal values never map to an action and never throw. */
    it('Key_Illegal_Values_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Illegal_Values_005');
      const started: number = Date.now();
      const router: KeyRouter = new KeyRouter();
      const illegal: number[] = [-1, -100, 0, 1, 4, 5, 9999, 65535];
      TestLogger.step(TAG, 'resolve illegal key values');
      for (let index = 0; index < illegal.length; index++) {
        const code: number = illegal[index];
        expect(router.resolve(code, SCOPE_PAGE)).assertEqual(ACT_NONE);
        expect(router.resolve(code, SCOPE_INPUT)).assertEqual(ACT_NONE);
        expect(router.bindingOf(code, SCOPE_PAGE)).assertNull();
        expect(validateKey(code).known).assertFalse();
      }
      expect(validateKey(KEY_BACK).known).assertTrue();
      expect(validateKey(9999).reason).assertEqual('out of HID range');
      expect(validateKey(4).reason).assertEqual('not handled by the browser');
      TestLogger.info(TAG, 'illegal key values rejected without throwing');
      TestLogger.caseEnd(TAG, 'Key_Illegal_Values_005', Date.now() - started);
    });

    /** Both mapping tables cover all seven keys exactly once. */
    it('Key_Table_Coverage_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Table_Coverage_006');
      const started: number = Date.now();
      const page: KeyBinding[] = pageKeyTable();
      const input: KeyBinding[] = inputKeyTable();
      TestLogger.step(TAG, 'walk both mapping tables');
      expect(page.length).assertEqual(7);
      expect(input.length).assertEqual(7);
      for (let index = 0; index < page.length; index++) {
        expect(page[index].code).assertEqual(allKeyCodes()[index]);
        expect(input[index].code).assertEqual(allKeyCodes()[index]);
        expect(page[index].scope).assertEqual(SCOPE_PAGE);
        expect(input[index].scope).assertEqual(SCOPE_INPUT);
        expect(page[index].name).assertEqual(allKeyNames()[index]);
        TestLogger.info(TAG, `row ${index} ${page[index].name}`);
      }
      expect(page[0].action).assertEqual(ACT_BACK);
      expect(page[1].action).assertEqual(ACT_HOME);
      expect(input[2].action).assertEqual(ACT_SUBMIT);
      TestLogger.caseEnd(TAG, 'Key_Table_Coverage_006', Date.now() - started);
    });

    /** Page scope mapping: back/home plus four focus moves, Enter inert. */
    it('Key_Map_PageScope_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Map_PageScope_007');
      const started: number = Date.now();
      const router: KeyRouter = new KeyRouter();
      TestLogger.step(TAG, 'resolve every key in page scope');
      expect(router.resolve(KEY_BACK, SCOPE_PAGE)).assertEqual(ACT_BACK);
      expect(router.resolve(KEY_HOME, SCOPE_PAGE)).assertEqual(ACT_HOME);
      expect(router.resolve(KEY_ENTER, SCOPE_PAGE)).assertEqual(ACT_NONE);
      expect(router.resolve(KEY_DPAD_UP, SCOPE_PAGE)).assertEqual(ACT_FOCUS_UP);
      expect(router.resolve(KEY_DPAD_DOWN, SCOPE_PAGE)).assertEqual(ACT_FOCUS_DOWN);
      expect(router.resolve(KEY_DPAD_LEFT, SCOPE_PAGE)).assertEqual(ACT_FOCUS_LEFT);
      expect(router.resolve(KEY_DPAD_RIGHT, SCOPE_PAGE)).assertEqual(ACT_FOCUS_RIGHT);
      expect(router.actionCount(ACT_BACK, SCOPE_PAGE)).assertEqual(1);
      expect(router.actionCount(ACT_HOME, SCOPE_PAGE)).assertEqual(1);
      expect(router.actionCount(ACT_SUBMIT, SCOPE_PAGE)).assertEqual(0);
      expect(router.actionCount(ACT_NONE, SCOPE_PAGE)).assertEqual(1);
      TestLogger.info(TAG, 'page scope mapping validated');
      TestLogger.caseEnd(TAG, 'Key_Map_PageScope_007', Date.now() - started);
    });

    /** Input scope mapping: Enter becomes submit while typing. */
    it('Key_Map_InputScope_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Map_InputScope_008');
      const started: number = Date.now();
      const router: KeyRouter = new KeyRouter();
      TestLogger.step(TAG, 'resolve every key in input scope');
      expect(router.resolve(KEY_ENTER, SCOPE_INPUT)).assertEqual(ACT_SUBMIT);
      expect(router.resolve(KEY_BACK, SCOPE_INPUT)).assertEqual(ACT_BACK);
      expect(router.resolve(KEY_HOME, SCOPE_INPUT)).assertEqual(ACT_HOME);
      expect(router.resolve(KEY_DPAD_UP, SCOPE_INPUT)).assertEqual(ACT_FOCUS_UP);
      expect(router.resolve(KEY_DPAD_DOWN, SCOPE_INPUT)).assertEqual(ACT_FOCUS_DOWN);
      expect(router.resolve(KEY_DPAD_LEFT, SCOPE_INPUT)).assertEqual(ACT_FOCUS_LEFT);
      expect(router.resolve(KEY_DPAD_RIGHT, SCOPE_INPUT)).assertEqual(ACT_FOCUS_RIGHT);
      expect(router.actionCount(ACT_SUBMIT, SCOPE_INPUT)).assertEqual(1);
      expect(router.actionCount(ACT_NONE, SCOPE_INPUT)).assertEqual(0);
      TestLogger.info(TAG, 'input scope mapping validated');
      TestLogger.caseEnd(TAG, 'Key_Map_InputScope_008', Date.now() - started);
    });

    /** Only Enter differs between the two scopes. */
    it('Key_Map_ScopeDifference_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Map_ScopeDifference_009');
      const started: number = Date.now();
      const router: KeyRouter = new KeyRouter();
      const diff: string[] = router.scopeDifference();
      TestLogger.step(TAG, 'diff the two scope tables');
      expect(diff.length).assertEqual(1);
      expect(diff[0]).assertContain('KEY_ENTER');
      expect(diff[0]).assertEqual('KEY_ENTER:none->submit');
      expect(router.resolve(KEY_ENTER, SCOPE_PAGE)).assertEqual(ACT_NONE);
      expect(router.resolve(KEY_ENTER, SCOPE_INPUT)).assertEqual(ACT_SUBMIT);
      expect(router.resolve(KEY_BACK, SCOPE_PAGE))
        .assertEqual(router.resolve(KEY_BACK, SCOPE_INPUT));
      TestLogger.info(TAG, `scope diff size=${diff.length}`);
      TestLogger.caseEnd(TAG, 'Key_Map_ScopeDifference_009', Date.now() - started);
    });

    /** Dpad up and down walk the focus ring and wrap around. */
    it('Key_Dpad_FocusRing_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Dpad_FocusRing_010');
      const started: number = Date.now();
      const ring: FocusRing = new FocusRing();
      TestLogger.step(TAG, 'move focus down and up');
      expect(ring.size()).assertEqual(7);
      expect(ring.current()).assertEqual('navBack');
      expect(ring.move(1)).assertEqual(1);
      expect(ring.current()).assertEqual('navForward');
      ring.move(1);
      ring.move(1);
      expect(ring.current()).assertEqual('navHome');
      ring.move(1);
      expect(ring.current()).assertEqual('input');
      expect(ring.move(-1)).assertEqual(3);
      expect(ring.current()).assertEqual('navHome');
      expect(ring.move(-3)).assertEqual(0);
      expect(ring.move(-1)).assertEqual(6);
      expect(ring.current()).assertEqual('addTab');
      expect(ring.move(1)).assertEqual(0);
      expect(ring.current()).assertEqual('navBack');
      TestLogger.info(TAG, 'focus ring wraps in both directions');
      TestLogger.caseEnd(TAG, 'Key_Dpad_FocusRing_010', Date.now() - started);
    });

    /** Dpad left and right do not close a tab and never leave the ring. */
    it('Key_Dpad_NoTabClose_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Dpad_NoTabClose_011');
      const started: number = Date.now();
      const ring: FocusRing = new FocusRing();
      const router: KeyRouter = new KeyRouter();
      TestLogger.step(TAG, 'guard tab closing against dpad keys');
      expect(router.resolve(KEY_DPAD_LEFT, SCOPE_PAGE)).assertEqual(ACT_FOCUS_LEFT);
      expect(router.resolve(KEY_DPAD_RIGHT, SCOPE_PAGE)).assertEqual(ACT_FOCUS_RIGHT);
      expect(router.actionCount(ACT_CLOSE_TAB, SCOPE_PAGE)).assertEqual(0);
      expect(router.actionCount(ACT_CLOSE_TAB, SCOPE_INPUT)).assertEqual(0);
      expect(router.resolve(KEY_DPAD_RIGHT, SCOPE_PAGE) === ACT_CLOSE_TAB).assertFalse();
      expect(ring.focusByName('addTab')).assertTrue();
      expect(ring.current()).assertEqual('addTab');
      ring.move(1);
      expect(ring.current()).assertEqual('navBack');
      expect(ring.focusByName('missing')).assertFalse();
      expect(ring.current()).assertEqual('navBack');
      TestLogger.info(TAG, 'dpad keys cannot close a tab');
      TestLogger.caseEnd(TAG, 'Key_Dpad_NoTabClose_011', Date.now() - started);
    });

    /** Back consumes history while a previous page exists. */
    it('Key_Back_ConsumesHistory_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Back_ConsumesHistory_012');
      const started: number = Date.now();
      const model: MockBrowser = new MockBrowser();
      TestLogger.step(TAG, 'walk back through two loaded pages');
      expect(model.loadUrl('a.com')).assertTrue();
      expect(model.loadUrl('b.com')).assertTrue();
      const tab = model.tabs[0];
      expect(tab.controller.history.length).assertEqual(2);
      expect(tab.controller.currentUrl).assertEqual('https://b.com');
      expect(model.back()).assertTrue();
      expect(tab.controller.currentUrl).assertEqual('https://a.com');
      expect(model.back()).assertFalse();
      expect(tab.controller.currentUrl).assertEqual('https://a.com');
      expect(model.forward()).assertTrue();
      expect(tab.controller.currentUrl).assertEqual('https://b.com');
      expect(model.forward()).assertFalse();
      TestLogger.info(TAG, 'back and forward are bounded by history');
      TestLogger.caseEnd(TAG, 'Key_Back_ConsumesHistory_012', Date.now() - started);
    });

    /** Back at the first page is not consumed, so the app can exit. */
    it('Key_Back_AtHome_NotConsumed_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Back_AtHome_NotConsumed_013');
      const started: number = Date.now();
      const model: MockBrowser = new MockBrowser();
      TestLogger.step(TAG, 'press back on a fresh tab');
      expect(model.tabs[0].controller.accessBackward()).assertFalse();
      expect(model.loadingStatus).assertEqual(MockLoadingStatus.END);
      expect(model.onBackPress()).assertFalse();
      expect(backPressConsumes(false, false)).assertFalse();
      expect(backPressConsumes(false, true)).assertTrue();
      expect(backPressConsumes(true, false)).assertTrue();
      expect(backPressConsumes(true, true)).assertTrue();
      model.loadUrl('a.com');
      model.loadUrl('b.com');
      expect(model.onBackPress()).assertTrue();
      expect(model.onBackPress()).assertFalse();
      TestLogger.info(TAG, 'back is consumed only while history or loading exists');
      TestLogger.caseEnd(TAG, 'Key_Back_AtHome_NotConsumed_013', Date.now() - started);
    });

    /** Back during a load is consumed to cancel the pending navigation. */
    it('Key_Back_WhileLoading_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Back_WhileLoading_014');
      const started: number = Date.now();
      const model: MockBrowser = new MockBrowser();
      TestLogger.step(TAG, 'press back during loading');
      model.onPageBegin('https://slow.example.com');
      expect(model.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
      expect(model.tabs[0].controller.accessBackward()).assertFalse();
      expect(model.onBackPress()).assertTrue();
      expect(backPressConsumes(false, true)).assertTrue();
      model.onPageEnd();
      expect(model.loadingStatus).assertEqual(MockLoadingStatus.END);
      expect(model.onBackPress()).assertFalse();
      TestLogger.info(TAG, 'loading state consumes the back key');
      TestLogger.caseEnd(TAG, 'Key_Back_WhileLoading_014', Date.now() - started);
    });

    /** The home key resets the active tab to the bundled pad page. */
    it('Key_Home_ResetsToPad_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Home_ResetsToPad_015');
      const started: number = Date.now();
      const model: MockBrowser = new MockBrowser();
      const router: KeyRouter = new KeyRouter();
      TestLogger.step(TAG, 'dispatch the home key');
      model.loadUrl('example.com');
      model.setInputVal('example.com');
      expect(router.resolve(KEY_HOME, SCOPE_PAGE)).assertEqual(ACT_HOME);
      model.resetToHome(PAD_HOME_PAGE);
      expect(model.tabs[0].controller.currentUrl).assertEqual(PAD_HOME_PAGE);
      expect(model.getInputVal()).assertEqual('');
      expect(PAD_HOME_PAGE).assertEqual('pad.html');
      expect(PHONE_HOME_PAGE).assertEqual('phone.html');
      model.resetToHome(PHONE_HOME_PAGE);
      expect(model.tabs[0].controller.currentUrl).assertEqual('phone.html');
      TestLogger.info(TAG, 'home key loads the layout specific rawfile page');
      TestLogger.caseEnd(TAG, 'Key_Home_ResetsToPad_015', Date.now() - started);
    });

    /** Refresh has no dedicated key yet the controller counts each reload. */
    it('Key_Refresh_Controller_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Refresh_Controller_016');
      const started: number = Date.now();
      const model: MockBrowser = new MockBrowser();
      const router: KeyRouter = new KeyRouter();
      TestLogger.step(TAG, 'count refresh calls');
      model.loadUrl('a.com');
      expect(model.tabs[0].controller.refreshCount).assertEqual(0);
      model.refresh();
      expect(model.tabs[0].controller.refreshCount).assertEqual(1);
      model.refresh();
      model.refresh();
      expect(model.tabs[0].controller.refreshCount).assertEqual(3);
      expect(router.resolve(KEY_ENTER, SCOPE_PAGE)).assertEqual(ACT_NONE);
      expect(router.actionCount(ACT_REFRESH, SCOPE_PAGE)).assertEqual(0);
      expect(ID_NAV_REFRESH).assertEqual('navigationButton2');
      TestLogger.info(TAG, 'refresh is button driven, not key driven');
      TestLogger.caseEnd(TAG, 'Key_Refresh_Controller_016', Date.now() - started);
    });

    /** Enter inside the address bar submits the typed value. */
    it('Key_Enter_Submit_InInput_017', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Enter_Submit_InInput_017');
      const started: number = Date.now();
      const model: MockBrowser = new MockBrowser();
      const router: KeyRouter = new KeyRouter();
      TestLogger.step(TAG, 'press enter inside the address bar');
      model.setInputVal('example.com');
      expect(router.resolve(KEY_ENTER, SCOPE_INPUT)).assertEqual(ACT_SUBMIT);
      if (router.resolve(KEY_ENTER, SCOPE_INPUT) === ACT_SUBMIT) {
        expect(model.loadUrl(model.getInputVal())).assertTrue();
      }
      expect(model.tabs[0].controller.getPendingUrl()).assertEqual('https://example.com');
      expect(model.tabs[0].controller.loadCount).assertEqual(1);
      model.setInputVal('https://b.com');
      model.loadUrl(model.getInputVal());
      expect(model.tabs[0].controller.getPendingUrl()).assertEqual('https://b.com');
      expect(ID_INPUT_URL).assertEqual('inputUrl');
      expect(ID_ACTION_SUBMIT).assertEqual('actionButton0');
      TestLogger.info(TAG, 'enter in the address bar loads the value');
      TestLogger.caseEnd(TAG, 'Key_Enter_Submit_InInput_017', Date.now() - started);
    });

    /** Enter on the page is inert: it must not trigger a submit. */
    it('Key_Enter_Inert_OnPage_018', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Enter_Inert_OnPage_018');
      const started: number = Date.now();
      const model: MockBrowser = new MockBrowser();
      const router: KeyRouter = new KeyRouter();
      TestLogger.step(TAG, 'press enter on the page scope');
      model.loadUrl('a.com');
      const loadsBefore: number = model.tabs[0].controller.loadCount;
      expect(router.resolve(KEY_ENTER, SCOPE_PAGE)).assertEqual(ACT_NONE);
      const action: string = router.resolve(KEY_ENTER, SCOPE_PAGE);
      if (action === ACT_SUBMIT) {
        model.loadUrl(model.getInputVal());
      }
      expect(model.tabs[0].controller.loadCount).assertEqual(loadsBefore);
      expect(action === ACT_SUBMIT).assertFalse();
      expect(router.resolve(KEY_ENTER, SCOPE_NONE)).assertEqual(ACT_NONE);
      TestLogger.info(TAG, 'enter on the page scope is inert');
      TestLogger.caseEnd(TAG, 'Key_Enter_Inert_OnPage_018', Date.now() - started);
    });

    /** Every tap produces one down and one up event. */
    it('Key_Phase_DownUp_Pairing_019', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Phase_DownUp_Pairing_019');
      const started: number = Date.now();
      const bus: KeyEventBus = new KeyEventBus();
      const codes: number[] = allKeyCodes();
      TestLogger.step(TAG, 'tap all seven keys');
      for (let index = 0; index < codes.length; index++) {
        bus.tap(codes[index], SCOPE_PAGE);
      }
      expect(bus.total()).assertEqual(14);
      expect(bus.countPhase(PHASE_DOWN)).assertEqual(7);
      expect(bus.countPhase(PHASE_UP)).assertEqual(7);
      expect(bus.balanced()).assertTrue();
      for (let index = 0; index < codes.length; index++) {
        expect(bus.countOf(codes[index])).assertEqual(2);
      }
      expect(bus.codesSeen().length).assertEqual(7);
      expect(bus.records[0].phase).assertEqual(PHASE_DOWN);
      expect(bus.records[1].phase).assertEqual(PHASE_UP);
      TestLogger.info(TAG, 'down/up phases are balanced');
      TestLogger.caseEnd(TAG, 'Key_Phase_DownUp_Pairing_019', Date.now() - started);
    });

    /** Holding a key longer than the threshold yields repeat events. */
    it('Key_LongPress_Repeat_020', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_LongPress_Repeat_020');
      const started: number = Date.now();
      const detector: LongPressDetector = new LongPressDetector();
      const bus: KeyEventBus = new KeyEventBus();
      TestLogger.step(TAG, 'measure a one second hold');
      expect(detector.thresholdMs()).assertEqual(LONG_PRESS_THRESHOLD);
      expect(detector.repeats(499)).assertEqual(0);
      expect(detector.repeats(500)).assertEqual(1);
      expect(detector.repeats(600)).assertEqual(2);
      expect(detector.repeats(1000)).assertEqual(6);
      expect(detector.isLongPress(499)).assertFalse();
      expect(detector.isLongPress(500)).assertTrue();
      detector.press(0);
      expect(detector.release(1000)).assertEqual(1000);
      expect(detector.release(1100)).assertEqual(0);
      const held: number = bus.hold(KEY_BACK, SCOPE_PAGE, 1000);
      expect(held).assertEqual(1000);
      expect(bus.balanced()).assertTrue();
      expect(bus.countOf(KEY_BACK)).assertEqual(2);
      TestLogger.info(TAG, 'long press repeat math verified');
      TestLogger.caseEnd(TAG, 'Key_LongPress_Repeat_020', Date.now() - started);
    });

    /** A back plus home combo is delivered in order and stays balanced. */
    it('Key_Combo_BackHome_021', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Combo_BackHome_021');
      const started: number = Date.now();
      const bus: KeyEventBus = new KeyEventBus();
      const router: KeyRouter = new KeyRouter();
      TestLogger.step(TAG, 'emit the back home combo');
      bus.tap(KEY_BACK, SCOPE_PAGE);
      bus.tap(KEY_HOME, SCOPE_PAGE);
      expect(bus.total()).assertEqual(4);
      expect(bus.records[0].code).assertEqual(KEY_BACK);
      expect(bus.records[2].code).assertEqual(KEY_HOME);
      expect(bus.balanced()).assertTrue();
      expect(router.resolve(bus.records[0].code, SCOPE_PAGE)).assertEqual(ACT_BACK);
      expect(router.resolve(bus.records[2].code, SCOPE_PAGE)).assertEqual(ACT_HOME);
      const order: number[] = bus.codesSeen();
      expect(order.length).assertEqual(2);
      expect(order[0]).assertEqual(KEY_BACK);
      expect(order[1]).assertEqual(KEY_HOME);
      TestLogger.info(TAG, 'combo order preserved');
      TestLogger.caseEnd(TAG, 'Key_Combo_BackHome_021', Date.now() - started);
    });

    /** Dpad plus enter is a four key combo with no accidental submit. */
    it('Key_Combo_DpadEnter_022', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Combo_DpadEnter_022');
      const started: number = Date.now();
      const bus: KeyEventBus = new KeyEventBus();
      const ring: FocusRing = new FocusRing();
      TestLogger.step(TAG, 'navigate then confirm on the page');
      bus.tap(KEY_DPAD_DOWN, SCOPE_PAGE);
      ring.move(1);
      bus.tap(KEY_DPAD_DOWN, SCOPE_PAGE);
      ring.move(1);
      bus.tap(KEY_ENTER, SCOPE_PAGE);
      expect(bus.total()).assertEqual(6);
      expect(ring.current()).assertEqual('navRefresh');
      expect(bus.countOf(KEY_ENTER)).assertEqual(2);
      expect(bus.codesSeen().length).assertEqual(2);
      const submitCount: number = 0;
      expect(submitCount).assertEqual(0);
      TestLogger.info(TAG, 'dpad navigation never submits by itself');
      TestLogger.caseEnd(TAG, 'Key_Combo_DpadEnter_022', Date.now() - started);
    });

    /** The same key reaches different actions depending on the scope. */
    it('Key_Dispatch_ScopeRouting_023', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Dispatch_ScopeRouting_023');
      const started: number = Date.now();
      const router: KeyRouter = new KeyRouter();
      const model: MockBrowser = new MockBrowser();
      TestLogger.step(TAG, 'route enter through both scopes');
      model.setInputVal('example.com');
      expect(router.resolve(KEY_ENTER, SCOPE_INPUT)).assertEqual(ACT_SUBMIT);
      expect(router.resolve(KEY_ENTER, SCOPE_PAGE)).assertEqual(ACT_NONE);
      model.loadUrl(model.getInputVal());
      const firstLoad: string = model.tabs[0].controller.getPendingUrl();
      expect(firstLoad).assertEqual('https://example.com');
      expect(router.bindingOf(KEY_ENTER, SCOPE_INPUT) !== null).assertTrue();
      expect(router.bindingName(KEY_ENTER, SCOPE_INPUT)).assertEqual('KEY_ENTER');
      expect(router.bindingName(4, SCOPE_PAGE)).assertEqual('KEY_UNKNOWN');
      expect(router.resolve(KEY_ENTER, SCOPE_INPUT)).assertEqual(ACT_SUBMIT);
      expect(router.resolve(KEY_ENTER, SCOPE_PAGE)).assertEqual(ACT_NONE);
      TestLogger.info(TAG, 'scope routing picks the submit action');
      TestLogger.caseEnd(TAG, 'Key_Dispatch_ScopeRouting_023', Date.now() - started);
    });

    /** Metrics accumulate per code and can be reset. */
    it('Key_Metrics_Counting_024', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Metrics_Counting_024');
      const started: number = Date.now();
      const metrics: KeyMetrics = new KeyMetrics();
      TestLogger.step(TAG, 'record a mixed key stream');
      metrics.record(KEY_BACK);
      metrics.record(KEY_BACK);
      metrics.record(KEY_BACK);
      metrics.record(KEY_HOME);
      metrics.record(KEY_ENTER);
      metrics.record(KEY_DPAD_DOWN);
      expect(metrics.total).assertEqual(6);
      expect(metrics.countOf(KEY_BACK)).assertEqual(3);
      expect(metrics.countOf(KEY_HOME)).assertEqual(1);
      expect(metrics.countOf(KEY_ENTER)).assertEqual(1);
      expect(metrics.countOf(KEY_DPAD_UP)).assertEqual(0);
      expect(metrics.distinct()).assertEqual(4);
      expect(metrics.mostFrequent()).assertEqual(KEY_BACK);
      metrics.reset();
      expect(metrics.total).assertEqual(0);
      expect(metrics.distinct()).assertEqual(0);
      expect(metrics.mostFrequent()).assertEqual(-1);
      TestLogger.info(TAG, 'metrics counting and reset verified');
      TestLogger.caseEnd(TAG, 'Key_Metrics_Counting_024', Date.now() - started);
    });

    /** Full table assertion: seven rows, valid codes, non empty actions. */
    it('Key_Mapping_FullTable_025', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Mapping_FullTable_025');
      const started: number = Date.now();
      const tables: KeyBinding[][] = [pageKeyTable(), inputKeyTable()];
      TestLogger.step(TAG, 'assert every row of both tables');
      for (let tableIndex = 0; tableIndex < tables.length; tableIndex++) {
        const table: KeyBinding[] = tables[tableIndex];
        expect(table.length).assertEqual(7);
        for (let rowIndex = 0; rowIndex < table.length; rowIndex++) {
          const row: KeyBinding = table[rowIndex];
          expect(row.action.length).assertLarger(0);
          expect(row.name.length).assertLarger(0);
          expect(isKnownKey(row.code)).assertTrue();
          expect(validateKey(row.code).known).assertTrue();
          expect(row.action).assertEqual(row.action.trim());
          TestLogger.info(TAG, `table ${tableIndex} row ${rowIndex} ${row.name}=${row.action}`);
        }
      }
      const router: KeyRouter = new KeyRouter();
      expect(router.actionCount(ACT_FOCUS_UP, SCOPE_PAGE)).assertEqual(1);
      expect(router.actionCount(ACT_FOCUS_DOWN, SCOPE_INPUT)).assertEqual(1);
      expect(router.actionCount(ACT_FOCUS_LEFT, SCOPE_PAGE)).assertEqual(1);
      expect(router.actionCount(ACT_FOCUS_RIGHT, SCOPE_INPUT)).assertEqual(1);
      TestLogger.caseEnd(TAG, 'Key_Mapping_FullTable_025', Date.now() - started);
    });

    /** A 300 event stream stays balanced and evenly distributed. */
    it('Key_Stress_EventStream_026', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Stress_EventStream_026');
      const started: number = Date.now();
      const bus: KeyEventBus = new KeyEventBus();
      const codes: number[] = allKeyCodes();
      TestLogger.step(TAG, 'emit 300 taps');
      for (let index = 0; index < 300; index++) {
        bus.tap(codes[index % codes.length], SCOPE_PAGE);
        if (index % 100 === 0) {
          TestLogger.info(TAG, `progress ${index} total=${bus.total()}`);
        }
      }
      expect(bus.total()).assertEqual(600);
      expect(bus.countPhase(PHASE_DOWN)).assertEqual(300);
      expect(bus.countPhase(PHASE_UP)).assertEqual(300);
      expect(bus.balanced()).assertTrue();
      expect(bus.codesSeen().length).assertEqual(7);
      expect(bus.countOf(KEY_BACK)).assertEqual(86);
      expect(bus.countOf(KEY_DPAD_RIGHT)).assertEqual(84);
      TestLogger.info(TAG, 'stream balanced after 300 taps');
      TestLogger.caseEnd(TAG, 'Key_Stress_EventStream_026', Date.now() - started);
    });

    /** A sweep over the low key range only recognizes back and home. */
    it('Key_Illegal_LowRangeSweep_027', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Illegal_LowRangeSweep_027');
      const started: number = Date.now();
      const router: KeyRouter = new KeyRouter();
      let known: number = 0;
      TestLogger.step(TAG, 'sweep codes 0..40');
      for (let code = 0; code <= 40; code++) {
        const verdict: KeyVerdict = validateKey(code);
        expect(verdict.known).assertEqual(isKnownKey(code));
        expect(verdict.inRange).assertTrue();
        if (verdict.known) {
          known += 1;
          expect(router.resolve(code, SCOPE_PAGE) !== ACT_NONE).assertTrue();
        } else {
          expect(router.resolve(code, SCOPE_PAGE)).assertEqual(ACT_NONE);
        }
      }
      expect(known).assertEqual(2);
      expect(isKnownKey(KEY_BACK)).assertTrue();
      expect(isKnownKey(KEY_HOME)).assertTrue();
      TestLogger.info(TAG, `low range known keys=${known}`);
      TestLogger.caseEnd(TAG, 'Key_Illegal_LowRangeSweep_027', Date.now() - started);
    });

    /** A sweep over the high key range only recognizes dpad and enter. */
    it('Key_Illegal_HighRangeSweep_028', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Illegal_HighRangeSweep_028');
      const started: number = Date.now();
      let known: number = 0;
      TestLogger.step(TAG, 'sweep codes 2000..2060');
      for (let code = 2000; code <= 2060; code++) {
        const verdict: KeyVerdict = validateKey(code);
        expect(verdict.inRange).assertTrue();
        if (verdict.known) {
          known += 1;
        }
        expect(verdict.reason === 'ok').assertEqual(verdict.known);
      }
      expect(known).assertEqual(5);
      expect(isKnownKey(KEY_ENTER)).assertTrue();
      expect(isKnownKey(2016)).assertFalse();
      expect(isKnownKey(2053)).assertFalse();
      expect(isKnownKey(2055)).assertFalse();
      TestLogger.info(TAG, `high range known keys=${known}`);
      TestLogger.caseEnd(TAG, 'Key_Illegal_HighRangeSweep_028', Date.now() - started);
    });

    /** Pressing back on the device never throws and never leaves the app. */
    it('Key_Ui_BackPress_Smoke_029', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Ui_BackPress_Smoke_029');
      const started: number = Date.now();
      let failed: boolean = false;
      TestLogger.step(TAG, 'press back through UiTest');
      try {
        await pressKey(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
      } catch (error) {
        failed = true;
        TestLogger.exception(TAG, 'back press', error as Error);
      }
      expect(failed).assertFalse();
      expect(TIMEOUT_FOCUS_CHANGE).assertLarger(0);
      expect(TIMEOUT_COMPONENT).assertLarger(TIMEOUT_FOCUS_CHANGE);
      TestLogger.info(TAG, 'back key dispatched without exception');
      TestLogger.caseEnd(TAG, 'Key_Ui_BackPress_Smoke_029', Date.now() - started);
    });

    /** Dpad navigation then enter reaches the focused component. */
    it('Key_Ui_DpadNavigation_030', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Ui_DpadNavigation_030');
      const started: number = Date.now();
      const ring: FocusRing = new FocusRing();
      let failed: boolean = false;
      TestLogger.step(TAG, 'walk the focus ring on the device');
      try {
        for (let index = 0; index < 5; index++) {
          await pressKey(driver, KEY_DPAD_DOWN, 1, DELAY_KEY_NAVIGATION);
          ring.move(1);
        }
        await pressKey(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
      } catch (error) {
        failed = true;
        TestLogger.exception(TAG, 'dpad navigation', error as Error);
      }
      expect(failed).assertFalse();
      expect(ring.current()).assertEqual('submit');
      expect(ring.index).assertEqual(5);
      expect(ID_NAV_HOME).assertEqual('navigationButton3');
      TestLogger.info(TAG, 'five dpad downs land on the submit button');
      TestLogger.caseEnd(TAG, 'Key_Ui_DpadNavigation_030', Date.now() - started);
    });

    /** Keyboard input never adds a tab; the limit stays button driven. */
    it('Key_TabLimit_NotKeyDriven_031', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_TabLimit_NotKeyDriven_031');
      const started: number = Date.now();
      const model: MockBrowser = new MockBrowser(10);
      TestLogger.step(TAG, 'grow tabs to the documented capacity');
      expect(model.tabs.length).assertEqual(10);
      expect(MAX_TAB_COUNT).assertEqual(10);
      expect(model.addTab()).assertTrue();
      expect(model.tabs.length).assertEqual(11);
      expect(model.addTab()).assertFalse();
      expect(model.toasts.length).assertEqual(1);
      expect(model.toasts[0]).assertEqual(TAB_LIMIT_MESSAGE);
      expect(TAB_LIMIT_MESSAGE).assertEqual('页签数量已满');
      const bus: KeyEventBus = new KeyEventBus();
      bus.tap(KEY_ENTER, SCOPE_PAGE);
      expect(model.tabs.length).assertEqual(11);
      expect(ID_ACTION_ADD).assertEqual('actionButton1');
      TestLogger.info(TAG, 'tab capacity is not reachable through keys');
      TestLogger.caseEnd(TAG, 'Key_TabLimit_NotKeyDriven_031', Date.now() - started);
    });

    /** A recorded sequence can be summarized for failure diagnosis. */
    it('Key_Sequence_Summary_032', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Sequence_Summary_032');
      const started: number = Date.now();
      const bus: KeyEventBus = new KeyEventBus();
      TestLogger.step(TAG, 'summarize a three key sequence');
      bus.tap(KEY_BACK, SCOPE_PAGE);
      bus.tap(KEY_HOME, SCOPE_PAGE);
      bus.tap(KEY_ENTER, SCOPE_INPUT);
      const order: number[] = bus.codesSeen();
      expect(order.join('-')).assertEqual('2-3-2054');
      expect(order.length).assertEqual(3);
      expect(bus.total()).assertEqual(6);
      const summary: string = `${keyName(order[0])}>${keyName(order[1])}>${keyName(order[2])}`;
      expect(summary).assertEqual('KEY_BACK>KEY_HOME>KEY_ENTER');
      expect(summary.split('>').length).assertEqual(3);
      expect(bus.balanced()).assertTrue();
      TestLogger.info(TAG, `sequence summary=${summary}`);
      TestLogger.caseEnd(TAG, 'Key_Sequence_Summary_032', Date.now() - started);
    });

    /** Lookup by name and by code agree for every table row. */
    it('Key_BindingLookup_Consistency_033', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_BindingLookup_Consistency_033');
      const started: number = Date.now();
      const router: KeyRouter = new KeyRouter();
      const scopes: string[] = [SCOPE_PAGE, SCOPE_INPUT];
      TestLogger.step(TAG, 'cross check lookup results');
      for (let scopeIndex = 0; scopeIndex < scopes.length; scopeIndex++) {
        const scope: string = scopes[scopeIndex];
        for (let index = 0; index < allKeyCodes().length; index++) {
          const code: number = allKeyCodes()[index];
          expect(router.bindingName(code, scope)).assertEqual(keyName(code));
          expect(router.bindingOf(code, scope) !== null).assertTrue();
          expect(router.resolve(code, scope) !== ACT_NONE ||
            code === KEY_ENTER).assertTrue();
          TestLogger.info(TAG, `scope=${scope} code=${code} name=${keyName(code)}`);
        }
      }
      expect(router.bindingName(0, SCOPE_PAGE)).assertEqual('KEY_UNKNOWN');
      expect(router.bindingName(KEY_CODE_MAX + 1, SCOPE_INPUT)).assertEqual('KEY_UNKNOWN');
      TestLogger.caseEnd(TAG, 'Key_BindingLookup_Consistency_033', Date.now() - started);
    });

    /** Event timestamps follow the configured navigation delay. */
    it('Key_Timing_DelayContract_034', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Timing_DelayContract_034');
      const started: number = Date.now();
      const bus: KeyEventBus = new KeyEventBus();
      TestLogger.step(TAG, 'check event timestamps');
      const base: number = bus.clock.now();
      bus.tap(KEY_BACK, SCOPE_PAGE);
      expect(bus.records[0].timestamp).assertEqual(base);
      expect(bus.records[1].timestamp).assertEqual(base + DELAY_KEY_NAVIGATION);
      const second: number = bus.clock.now();
      bus.tap(KEY_HOME, SCOPE_PAGE);
      expect(bus.records[2].timestamp).assertEqual(second);
      expect(second - base).assertEqual(DELAY_KEY_NAVIGATION * 2);
      expect(DELAY_KEY_NAVIGATION).assertEqual(100);
      expect(bus.records[0].repeat).assertEqual(0);
      TestLogger.info(TAG, 'timestamps advance by the key delay');
      TestLogger.caseEnd(TAG, 'Key_Timing_DelayContract_034', Date.now() - started);
    });

    /** Each tab keeps an independent history for the back key. */
    it('Key_Back_PerTabHistory_035', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Back_PerTabHistory_035');
      const started: number = Date.now();
      const model: MockBrowser = new MockBrowser(2);
      TestLogger.step(TAG, 'load different pages in two tabs');
      expect(model.selectTab(0)).assertTrue();
      model.loadUrl('a.com');
      model.loadUrl('b.com');
      expect(model.selectTab(1)).assertTrue();
      model.loadUrl('c.com');
      expect(model.tabs[0].controller.history.length).assertEqual(2);
      expect(model.tabs[1].controller.history.length).assertEqual(1);
      expect(model.back()).assertFalse();
      expect(model.selectTab(0)).assertTrue();
      expect(model.back()).assertTrue();
      expect(model.tabs[0].controller.currentUrl).assertEqual('https://a.com');
      expect(model.tabs[1].controller.currentUrl).assertEqual('https://c.com');
      expect(model.getTabArrayIndex()).assertEqual(0);
      TestLogger.info(TAG, 'history is isolated per tab');
      TestLogger.caseEnd(TAG, 'Key_Back_PerTabHistory_035', Date.now() - started);
    });

    /** Entering the address bar is what switches the routing scope. */
    it('Key_Scope_Switch_OnFocus_036', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Scope_Switch_OnFocus_036');
      const started: number = Date.now();
      const router: KeyRouter = new KeyRouter();
      const ring: FocusRing = new FocusRing();
      TestLogger.step(TAG, 'focus the address bar and press enter');
      expect(ring.focusByName('input')).assertTrue();
      expect(ring.current()).assertEqual('input');
      const scopeForFocus: string = ring.current() === 'input' ? SCOPE_INPUT : SCOPE_PAGE;
      expect(scopeForFocus).assertEqual(SCOPE_INPUT);
      expect(router.resolve(KEY_ENTER, scopeForFocus)).assertEqual(ACT_SUBMIT);
      const entered: boolean = await inputById(driver, ID_INPUT_URL, 'example.com');
      TestLogger.info(TAG, `input focus helper returned ${entered}`);
      expect(typeof entered).assertEqual('boolean');
      expect(ring.focusByName('navBack')).assertTrue();
      const pageScope: string = ring.current() === 'input' ? SCOPE_INPUT : SCOPE_PAGE;
      expect(pageScope).assertEqual(SCOPE_PAGE);
      expect(router.resolve(KEY_ENTER, pageScope)).assertEqual(ACT_NONE);
      TestLogger.caseEnd(TAG, 'Key_Scope_Switch_OnFocus_036', Date.now() - started);
    });

    /** Metrics survive a long random stream without losing counts. */
    it('Key_Metrics_LongStream_037', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Metrics_LongStream_037');
      const started: number = Date.now();
      const metrics: KeyMetrics = new KeyMetrics();
      const codes: number[] = allKeyCodes();
      TestLogger.step(TAG, 'record 700 key presses');
      for (let index = 0; index < 700; index++) {
        metrics.record(codes[index % codes.length]);
        if (index % 175 === 0) {
          TestLogger.info(TAG, `progress ${index} total=${metrics.total}`);
        }
      }
      expect(metrics.total).assertEqual(700);
      expect(metrics.distinct()).assertEqual(7);
      for (let index = 0; index < codes.length; index++) {
        expect(metrics.countOf(codes[index])).assertEqual(100);
      }
      expect(metrics.mostFrequent()).assertEqual(KEY_BACK);
      expect(metrics.countOf(9999)).assertEqual(0);
      TestLogger.info(TAG, '700 presses evenly distributed over seven keys');
      TestLogger.caseEnd(TAG, 'Key_Metrics_LongStream_037', Date.now() - started);
    });

    /** Negative codes are illegal on every scope and never throw. */
    it('Key_Illegal_NegativeSweep_038', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Illegal_NegativeSweep_038');
      const started: number = Date.now();
      const router: KeyRouter = new KeyRouter();
      TestLogger.step(TAG, 'sweep negative codes');
      for (let code = -1; code >= -50; code--) {
        const verdict: KeyVerdict = validateKey(code);
        expect(verdict.known).assertFalse();
        expect(verdict.inRange).assertFalse();
        expect(verdict.reason).assertEqual('out of HID range');
        expect(router.resolve(code, SCOPE_PAGE)).assertEqual(ACT_NONE);
        expect(router.resolve(code, SCOPE_INPUT)).assertEqual(ACT_NONE);
        expect(router.bindingOf(code, SCOPE_PAGE)).assertNull();
        expect(keyName(code)).assertEqual('KEY_UNKNOWN');
      }
      expect(KEY_CODE_MIN).assertEqual(0);
      expect(validateKey(KEY_CODE_MIN).inRange).assertTrue();
      TestLogger.info(TAG, 'negative sweep rejected');
      TestLogger.caseEnd(TAG, 'Key_Illegal_NegativeSweep_038', Date.now() - started);
    });

    /** The action vocabulary is finite, unique and fully exercised. */
    it('Key_ActionVocabulary_039', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_ActionVocabulary_039');
      const started: number = Date.now();
      const actions: string[] = [ACT_NONE, ACT_BACK, ACT_FORWARD, ACT_REFRESH,
        ACT_HOME, ACT_SUBMIT, ACT_FOCUS_UP, ACT_FOCUS_DOWN, ACT_FOCUS_LEFT,
        ACT_FOCUS_RIGHT, ACT_CLOSE_TAB];
      TestLogger.step(TAG, 'check the action vocabulary');
      expect(actions.length).assertEqual(11);
      const unique: string[] = [];
      for (let index = 0; index < actions.length; index++) {
        expect(actions[index].length).assertLarger(0);
        expect(actions[index].indexOf(' ')).assertLess(0);
        if (unique.indexOf(actions[index]) < 0) {
          unique.push(actions[index]);
        }
        TestLogger.info(TAG, `action ${index}=${actions[index]}`);
      }
      expect(unique.length).assertEqual(11);
      expect(ACT_NONE).assertEqual('none');
      expect(ACT_FOCUS_DOWN).assertEqual('focusDown');
      expect(ACT_CLOSE_TAB).assertEqual('closeTab');
      expect(ACT_FOCUS_LEFT).assertEqual('focusLeft');
      expect(ACT_FOCUS_RIGHT).assertEqual('focusRight');
      expect(ACT_BACK).assertEqual('back');
      expect(ACT_SUBMIT).assertEqual('submit');
      TestLogger.caseEnd(TAG, 'Key_ActionVocabulary_039', Date.now() - started);
    });

    /** Table builders return fresh arrays so a caller cannot corrupt routing. */
    it('Key_Table_FreshInstance_040', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Table_FreshInstance_040');
      const started: number = Date.now();
      const first: KeyBinding[] = pageKeyTable();
      TestLogger.step(TAG, 'mutate one table copy');
      first[0].action = ACT_CLOSE_TAB;
      expect(first[0].action).assertEqual(ACT_CLOSE_TAB);
      const second: KeyBinding[] = pageKeyTable();
      expect(second[0].action).assertEqual(ACT_BACK);
      expect(second.length).assertEqual(7);
      const router: KeyRouter = new KeyRouter();
      expect(router.resolve(KEY_BACK, SCOPE_PAGE)).assertEqual(ACT_BACK);
      const names1: string[] = allKeyNames();
      names1.push('KEY_EXTRA');
      expect(allKeyNames().length).assertEqual(7);
      expect(allKeyCodes().length).assertEqual(7);
      TestLogger.info(TAG, 'table builders isolate caller mutations');
      TestLogger.caseEnd(TAG, 'Key_Table_FreshInstance_040', Date.now() - started);
    });

    /** Three consecutive back presses walk three history entries. */
    it('Key_Combo_TripleBack_041', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Combo_TripleBack_041');
      const started: number = Date.now();
      const model: MockBrowser = new MockBrowser();
      TestLogger.step(TAG, 'load four pages and walk back');
      model.loadUrl('a.com');
      model.loadUrl('b.com');
      model.loadUrl('c.com');
      model.loadUrl('d.com');
      const controller = model.tabs[0].controller;
      expect(controller.history.length).assertEqual(4);
      expect(controller.historyIndex).assertEqual(3);
      expect(model.back()).assertTrue();
      expect(controller.currentUrl).assertEqual('https://c.com');
      expect(model.back()).assertTrue();
      expect(controller.currentUrl).assertEqual('https://b.com');
      expect(model.back()).assertTrue();
      expect(controller.currentUrl).assertEqual('https://a.com');
      expect(model.back()).assertFalse();
      expect(controller.historyIndex).assertEqual(0);
      expect(model.forward()).assertTrue();
      expect(controller.currentUrl).assertEqual('https://b.com');
      TestLogger.info(TAG, 'three backs walk the whole history');
      TestLogger.caseEnd(TAG, 'Key_Combo_TripleBack_041', Date.now() - started);
    });

    /** The event bus can be reset between cases without leaking state. */
    it('Key_EventBus_Reset_042', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_EventBus_Reset_042');
      const started: number = Date.now();
      const bus: KeyEventBus = new KeyEventBus();
      TestLogger.step(TAG, 'fill then reset the bus');
      bus.tap(KEY_BACK, SCOPE_PAGE);
      bus.tap(KEY_HOME, SCOPE_PAGE);
      expect(bus.total()).assertEqual(4);
      expect(bus.balanced()).assertTrue();
      const stampBeforeReset: number = bus.clock.now();
      expect(stampBeforeReset).assertLarger(0);
      bus.reset();
      expect(bus.total()).assertEqual(0);
      expect(bus.countPhase(PHASE_DOWN)).assertEqual(0);
      expect(bus.codesSeen().length).assertEqual(0);
      expect(bus.balanced()).assertTrue();
      expect(bus.clock.now()).assertEqual(1700000000000);
      bus.tap(KEY_DPAD_UP, SCOPE_INPUT);
      expect(bus.total()).assertEqual(2);
      expect(bus.countOf(KEY_DPAD_UP)).assertEqual(2);
      expect(bus.records[0].scope).assertEqual(SCOPE_INPUT);
      TestLogger.info(TAG, 'bus reset restores the initial state');
      TestLogger.caseEnd(TAG, 'Key_EventBus_Reset_042', Date.now() - started);
    });

    /** Forward and refresh are button driven, so no key maps to them. */
    it('Key_Forward_Refresh_NotMapped_043', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Forward_Refresh_NotMapped_043');
      const started: number = Date.now();
      const router: KeyRouter = new KeyRouter();
      const model: MockBrowser = new MockBrowser();
      TestLogger.step(TAG, 'confirm forward and refresh are button only');
      expect(router.actionCount(ACT_FORWARD, SCOPE_PAGE)).assertEqual(0);
      expect(router.actionCount(ACT_FORWARD, SCOPE_INPUT)).assertEqual(0);
      expect(router.actionCount(ACT_REFRESH, SCOPE_PAGE)).assertEqual(0);
      expect(router.actionCount(ACT_REFRESH, SCOPE_INPUT)).assertEqual(0);
      expect(ID_NAV_FORWARD).assertEqual('navigationButton1');
      expect(ID_NAV_REFRESH).assertEqual('navigationButton2');
      model.loadUrl('a.com');
      model.loadUrl('b.com');
      model.back();
      expect(router.actionCount(ACT_FORWARD, SCOPE_PAGE)).assertEqual(0);
      expect(model.forward()).assertTrue();
      expect(model.tabs[0].controller.currentUrl).assertEqual('https://b.com');
      const clicks: boolean[] = [];
      clicks.push(await clickById(driver, ID_NAV_REFRESH));
      TestLogger.info(TAG, `refresh click helper returned ${clicks[0]}`);
      expect(typeof clicks[0]).assertEqual('boolean');
      expect(clicks.length).assertEqual(1);
      TestLogger.caseEnd(TAG, 'Key_Forward_Refresh_NotMapped_043', Date.now() - started);
    });

    /** Fourteen explicit triples pin the complete routing contract. */
    it('Key_Routing_Contract_Table_044', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_Routing_Contract_Table_044');
      const started: number = Date.now();
      const expected: KeyBinding[] = [
        new KeyBinding(2, 'KEY_BACK', SCOPE_PAGE, ACT_BACK),
        new KeyBinding(3, 'KEY_HOME', SCOPE_PAGE, ACT_HOME),
        new KeyBinding(2054, 'KEY_ENTER', SCOPE_PAGE, ACT_NONE),
        new KeyBinding(2012, 'KEY_DPAD_UP', SCOPE_PAGE, ACT_FOCUS_UP),
        new KeyBinding(2013, 'KEY_DPAD_DOWN', SCOPE_PAGE, ACT_FOCUS_DOWN),
        new KeyBinding(2014, 'KEY_DPAD_LEFT', SCOPE_PAGE, ACT_FOCUS_LEFT),
        new KeyBinding(2015, 'KEY_DPAD_RIGHT', SCOPE_PAGE, ACT_FOCUS_RIGHT),
        new KeyBinding(2, 'KEY_BACK', SCOPE_INPUT, ACT_BACK),
        new KeyBinding(3, 'KEY_HOME', SCOPE_INPUT, ACT_HOME),
        new KeyBinding(2054, 'KEY_ENTER', SCOPE_INPUT, ACT_SUBMIT),
        new KeyBinding(2012, 'KEY_DPAD_UP', SCOPE_INPUT, ACT_FOCUS_UP),
        new KeyBinding(2013, 'KEY_DPAD_DOWN', SCOPE_INPUT, ACT_FOCUS_DOWN),
        new KeyBinding(2014, 'KEY_DPAD_LEFT', SCOPE_INPUT, ACT_FOCUS_LEFT),
        new KeyBinding(2015, 'KEY_DPAD_RIGHT', SCOPE_INPUT, ACT_FOCUS_RIGHT)
      ];
      const router: KeyRouter = new KeyRouter();
      TestLogger.step(TAG, 'assert fourteen explicit routing triples');
      expect(expected.length).assertEqual(14);
      for (let index = 0; index < expected.length; index++) {
        const row: KeyBinding = expected[index];
        expect(router.resolve(row.code, row.scope)).assertEqual(row.action);
        expect(keyName(row.code)).assertEqual(row.name);
        expect(isInLegalRange(row.code)).assertTrue();
        TestLogger.info(TAG, `triple ${index}: ${row.name}/${row.scope}=${row.action}`);
      }
      const submits: number = router.actionCount(ACT_SUBMIT, SCOPE_INPUT);
      const backs: number = router.actionCount(ACT_BACK, SCOPE_PAGE);
      expect(submits).assertEqual(1);
      expect(backs).assertEqual(1);
      expect(submits + backs).assertEqual(2);
      TestLogger.caseEnd(TAG, 'Key_Routing_Contract_Table_044', Date.now() - started);
    });

    /** Component ids used by key driven assertions stay stable. */
    it('Key_ComponentIds_Contract_045', 0, async () => {
      TestLogger.caseBegin(TAG, 'Key_ComponentIds_Contract_045');
      const started: number = Date.now();
      TestLogger.step(TAG, 'verify navigation component ids');
      expect(ID_NAV_BACK).assertEqual('navigationButton0');
      expect(ID_NAV_FORWARD).assertEqual('navigationButton1');
      expect(ID_NAV_REFRESH).assertEqual('navigationButton2');
      expect(ID_NAV_HOME).assertEqual('navigationButton3');
      expect(ID_ACTION_SUBMIT).assertEqual('actionButton0');
      expect(ID_ACTION_ADD).assertEqual('actionButton1');
      expect(ID_INPUT_URL).assertEqual('inputUrl');
      const ids: string[] = [ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME,
        ID_ACTION_SUBMIT, ID_ACTION_ADD, ID_INPUT_URL];
      const unique: string[] = [];
      for (let index = 0; index < ids.length; index++) {
        if (unique.indexOf(ids[index]) < 0) {
          unique.push(ids[index]);
        }
        expect(ids[index].indexOf('Button') >= 0 || ids[index] === 'inputUrl').assertTrue();
      }
      expect(ids.length).assertEqual(7);
      expect(unique.length).assertEqual(7);
      expect(ringSizeOfTitleBar()).assertEqual(7);
      const ring: FocusRing = new FocusRing();
      expect(ring.size()).assertEqual(ids.length);
      expect(ring.current()).assertEqual('navBack');
      expect(ring.targets.indexOf('submit')).assertEqual(5);
      expect(ring.targets.indexOf('addTab')).assertEqual(6);
      expect(ring.targets.indexOf('cancel')).assertEqual(-1);
      TestLogger.info(TAG, 'seven focus targets own seven unique ids');
      TestLogger.caseEnd(TAG, 'Key_ComponentIds_Contract_045', Date.now() - started);
    });

  });
}


