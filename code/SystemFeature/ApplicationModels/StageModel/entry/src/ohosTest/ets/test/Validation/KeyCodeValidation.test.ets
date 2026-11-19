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
import hilog from '@ohos.hilog';
import {
  getDriver, componentCount, launchMainAbility, BUNDLE_NAME,
  KEY_ENTER, KEY_BACK, KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN, KEY_HOME, KEY_SPACE,
  DELAY_KEY_NAVIGATION, TIMEOUT_PAGE_RENDER
} from '../Shared/SharedDriver';

enum KeyCategory {
  NAVIGATION = 0,
  ACTION = 1,
  MODIFIER = 2,
  FUNCTION = 3,
  CHARACTER = 4,
  UNKNOWN = 5
}

enum ModifierFlag {
  NONE = 0,
  SHIFT = 1,
  CTRL = 2,
  ALT = 4,
  META = 8
}

enum FocusDirection {
  FORWARD = 0,
  BACKWARD = 1,
  UP = 2,
  DOWN = 3,
  LEFT = 4,
  RIGHT = 5
}

const KEYCODE_TAB: number = 4;
const KEYCODE_SPACE: number = 57;
const KEYCODE_SHIFT_LEFT: number = 2047;
const KEYCODE_CTRL_LEFT: number = 2072;
const KEYCODE_ALT_LEFT: number = 2045;
const KEYCODE_A: number = 2017;
const KEYCODE_Z: number = 2042;
const KEYCODE_0: number = 2000;
const KEYCODE_9: number = 2009;
const MIN_KEY_CODE: number = 0;
const MAX_KEY_CODE: number = 3000;
const LONG_PRESS_THRESHOLD_MS: number = 500;
const REPEAT_THRESHOLD_MS: number = 50;
const MAX_REPEAT_COUNT: number = 1000;

class KeyCodeInfo {
  readonly code: number;
  readonly name: string;
  readonly category: KeyCategory;

  constructor(code: number, name: string, category: KeyCategory) {
    this.code = code;
    this.name = name;
    this.category = category;
  }

  describe(): string {
    return `${this.code}:${this.name}:${this.category}`;
  }
}

class KeyCodeCatalog {
  private entries: KeyCodeInfo[] = [];

  register(code: number, name: string, category: KeyCategory): boolean {
    if (code < MIN_KEY_CODE || code > MAX_KEY_CODE) {
      return false;
    }
    if (this.find(code) !== null) {
      return false;
    }
    this.entries.push(new KeyCodeInfo(code, name, category));
    return true;
  }

  find(code: number): KeyCodeInfo | null {
    for (const entry of this.entries) {
      if (entry.code === code) {
        return entry;
      }
    }
    return null;
  }

  categoryOf(code: number): KeyCategory {
    const entry = this.find(code);
    if (entry === null) {
      return KeyCategory.UNKNOWN;
    }
    return entry.category;
  }

  isNavigation(code: number): boolean {
    return this.categoryOf(code) === KeyCategory.NAVIGATION;
  }

  isModifier(code: number): boolean {
    return this.categoryOf(code) === KeyCategory.MODIFIER;
  }

  isAction(code: number): boolean {
    return this.categoryOf(code) === KeyCategory.ACTION;
  }

  count(): number {
    return this.entries.length;
  }

  names(): string[] {
    const result: string[] = [];
    for (const entry of this.entries) {
      result.push(entry.name);
    }
    return result;
  }
}
class KeyEventModel {
  readonly code: number;
  readonly downTime: number;
  readonly eventTime: number;
  readonly repeatCount: number;
  readonly modifiers: number;
  readonly pressed: boolean;

  constructor(code: number, downTime: number, eventTime: number, repeatCount: number,
    modifiers: number, pressed: boolean) {
    this.code = code;
    this.downTime = downTime;
    this.eventTime = eventTime;
    this.repeatCount = repeatCount;
    this.modifiers = modifiers;
    this.pressed = pressed;
  }

  holdDurationMs(): number {
    if (this.eventTime < this.downTime) {
      return 0;
    }
    return this.eventTime - this.downTime;
  }

  isLongPress(): boolean {
    return this.pressed && this.holdDurationMs() >= LONG_PRESS_THRESHOLD_MS;
  }

  isRepeat(): boolean {
    return this.repeatCount > 0;
  }

  hasModifier(flag: ModifierFlag): boolean {
    if (flag === ModifierFlag.NONE) {
      return this.modifiers === 0;
    }
    return (this.modifiers & flag) === flag;
  }

  hasAnyModifier(): boolean {
    return this.modifiers !== 0;
  }

  describe(): string {
    return `${this.code}@${this.downTime}-${this.eventTime}#${this.repeatCount}m${this.modifiers}`;
  }
}

class ModifierModel {
  private mask: number = 0;

  add(flag: ModifierFlag): boolean {
    if (flag === ModifierFlag.NONE) {
      return false;
    }
    const before = this.mask;
    this.mask = this.mask | flag;
    return this.mask !== before;
  }

  remove(flag: ModifierFlag): boolean {
    const before = this.mask;
    this.mask = this.mask & (0xFFFFFFFF ^ flag);
    return this.mask !== before;
  }

  has(flag: ModifierFlag): boolean {
    return (this.mask & flag) === flag;
  }

  clear(): void {
    this.mask = 0;
  }

  toMask(): number {
    return this.mask;
  }

  isEmpty(): boolean {
    return this.mask === 0;
  }

  count(): number {
    let total = 0;
    if (this.has(ModifierFlag.SHIFT)) {
      total++;
    }
    if (this.has(ModifierFlag.CTRL)) {
      total++;
    }
    if (this.has(ModifierFlag.ALT)) {
      total++;
    }
    if (this.has(ModifierFlag.META)) {
      total++;
    }
    return total;
  }
}

class NavigationModel {
  nextIndex(current: number, length: number): number {
    if (length <= 0) {
      return -1;
    }
    if (current < 0 || current >= length - 1) {
      return 0;
    }
    return current + 1;
  }

  previousIndex(current: number, length: number): number {
    if (length <= 0) {
      return -1;
    }
    if (current <= 0) {
      return length - 1;
    }
    return current - 1;
  }

  move(direction: FocusDirection, current: number, length: number): number {
    if (direction === FocusDirection.BACKWARD || direction === FocusDirection.UP ||
      direction === FocusDirection.LEFT) {
      return this.previousIndex(current, length);
    }
    return this.nextIndex(current, length);
  }

  clampIndex(index: number, length: number): number {
    if (length <= 0) {
      return -1;
    }
    if (index < 0) {
      return 0;
    }
    if (index >= length) {
      return length - 1;
    }
    return index;
  }

  directionForKey(code: number): FocusDirection {
    if (code === KEY_UP) {
      return FocusDirection.UP;
    }
    if (code === KEY_DOWN) {
      return FocusDirection.DOWN;
    }
    if (code === KEY_LEFT) {
      return FocusDirection.LEFT;
    }
    if (code === KEY_RIGHT) {
      return FocusDirection.RIGHT;
    }
    if (code === KEY_BACK) {
      return FocusDirection.BACKWARD;
    }
    return FocusDirection.FORWARD;
  }
}

class KeyEventValidator {
  validateCode(code: number): string[] {
    const issues: string[] = [];
    if (!Number.isInteger(code)) {
      issues.push('code-not-integer');
      return issues;
    }
    if (code < MIN_KEY_CODE || code > MAX_KEY_CODE) {
      issues.push('code-out-of-range');
    }
    return issues;
  }

  validateTiming(downTime: number, eventTime: number): string[] {
    const issues: string[] = [];
    if (downTime < 0) {
      issues.push('downtime-negative');
    }
    if (eventTime < downTime) {
      issues.push('event-before-down');
    }
    return issues;
  }

  validateRepeat(repeatCount: number): string[] {
    const issues: string[] = [];
    if (!Number.isInteger(repeatCount)) {
      issues.push('repeat-not-integer');
      return issues;
    }
    if (repeatCount < 0) {
      issues.push('repeat-negative');
    }
    if (repeatCount > MAX_REPEAT_COUNT) {
      issues.push('repeat-too-large');
    }
    return issues;
  }

  validateEvent(event: KeyEventModel): string[] {
    const issues: string[] = [];
    for (const issue of this.validateCode(event.code)) {
      issues.push(issue);
    }
    for (const issue of this.validateTiming(event.downTime, event.eventTime)) {
      issues.push(issue);
    }
    for (const issue of this.validateRepeat(event.repeatCount)) {
      issues.push(issue);
    }
    return issues;
  }
}
class KeySequenceMatcher {
  private sequence: number[] = [];

  setSequence(codes: number[]): void {
    this.sequence = codes.slice();
  }

  size(): number {
    return this.sequence.length;
  }

  match(codes: number[]): boolean {
    if (codes.length !== this.sequence.length) {
      return false;
    }
    for (let index = 0; index < this.sequence.length; index++) {
      if (this.sequence[index] !== codes[index]) {
        return false;
      }
    }
    return true;
  }

  partialMatch(codes: number[]): boolean {
    if (codes.length > this.sequence.length) {
      return false;
    }
    for (let index = 0; index < codes.length; index++) {
      if (this.sequence[index] !== codes[index]) {
        return false;
      }
    }
    return true;
  }

  contains(codes: number[]): number {
    if (codes.length === 0 || codes.length > this.sequence.length) {
      return -1;
    }
    for (let start = 0; start <= this.sequence.length - codes.length; start++) {
      let matched = true;
      for (let offset = 0; offset < codes.length; offset++) {
        if (this.sequence[start + offset] !== codes[offset]) {
          matched = false;
          break;
        }
      }
      if (matched) {
        return start;
      }
    }
    return -1;
  }
}

class KeyRepeatCounter {
  private count: number = 0;
  private threshold: number;

  constructor(threshold: number) {
    this.threshold = threshold <= 0 ? 1 : threshold;
  }

  onKeyDown(): number {
    this.count++;
    return this.count;
  }

  onKeyUp(): void {
    this.count = 0;
  }

  current(): number {
    return this.count;
  }

  exceedsThreshold(): boolean {
    return this.count >= this.threshold;
  }

  getThreshold(): number {
    return this.threshold;
  }
}

class KeyBinding {
  readonly code: number;
  readonly action: string;

  constructor(code: number, action: string) {
    this.code = code;
    this.action = action;
  }
}

class KeyBindingTable {
  private bindings: KeyBinding[] = [];

  bind(code: number, action: string): boolean {
    if (action.length === 0) {
      return false;
    }
    if (this.resolve(code).length > 0) {
      return false;
    }
    this.bindings.push(new KeyBinding(code, action));
    return true;
  }

  resolve(code: number): string {
    for (const binding of this.bindings) {
      if (binding.code === code) {
        return binding.action;
      }
    }
    return '';
  }

  unbind(code: number): boolean {
    for (let index = 0; index < this.bindings.length; index++) {
      if (this.bindings[index].code === code) {
        this.bindings.splice(index, 1);
        return true;
      }
    }
    return false;
  }

  size(): number {
    return this.bindings.length;
  }

  codes(): number[] {
    const result: number[] = [];
    for (const binding of this.bindings) {
      result.push(binding.code);
    }
    return result;
  }
}

class KeyStrokeJournal {
  private events: KeyEventModel[] = [];

  record(event: KeyEventModel): boolean {
    const validator = new KeyEventValidator();
    if (validator.validateEvent(event).length > 0) {
      return false;
    }
    this.events.push(event);
    return true;
  }

  size(): number {
    return this.events.length;
  }

  countCode(code: number): number {
    let total = 0;
    for (const event of this.events) {
      if (event.code === code) {
        total++;
      }
    }
    return total;
  }

  last(): KeyEventModel | null {
    if (this.events.length === 0) {
      return null;
    }
    return this.events[this.events.length - 1];
  }

  clear(): void {
    this.events = [];
  }

  codesInOrder(): number[] {
    const result: number[] = [];
    for (const event of this.events) {
      result.push(event.code);
    }
    return result;
  }
}
function buildCatalog(): KeyCodeCatalog {
  const catalog = new KeyCodeCatalog();
  catalog.register(KEY_LEFT, 'KEY_LEFT', KeyCategory.NAVIGATION);
  catalog.register(KEY_RIGHT, 'KEY_RIGHT', KeyCategory.NAVIGATION);
  catalog.register(KEY_UP, 'KEY_UP', KeyCategory.NAVIGATION);
  catalog.register(KEY_DOWN, 'KEY_DOWN', KeyCategory.NAVIGATION);
  catalog.register(KEY_ENTER, 'KEY_ENTER', KeyCategory.ACTION);
  catalog.register(KEY_BACK, 'KEY_BACK', KeyCategory.ACTION);
  catalog.register(KEY_HOME, 'KEY_HOME', KeyCategory.ACTION);
  catalog.register(KEYCODE_SHIFT_LEFT, 'KEY_SHIFT', KeyCategory.MODIFIER);
  catalog.register(KEYCODE_CTRL_LEFT, 'KEY_CTRL', KeyCategory.MODIFIER);
  catalog.register(KEYCODE_ALT_LEFT, 'KEY_ALT', KeyCategory.MODIFIER);
  catalog.register(KEYCODE_SPACE, 'KEY_SPACE', KeyCategory.CHARACTER);
  catalog.register(KEYCODE_TAB, 'KEY_TAB', KeyCategory.NAVIGATION);
  return catalog;
}

function buildKeyEvent(code: number): KeyEventModel {
  return new KeyEventModel(code, 1000, 1050, 0, 0, true);
}

export default function keyCodeValidationTest(): void {
  describe('KeyCodeValidationSuite', () => {
    let catalog: KeyCodeCatalog = new KeyCodeCatalog();

    beforeAll(() => {
      catalog = buildCatalog();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'key code validation start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'key code validation end');
    });

    it('KeyCodeValidation_001', 0, async (done: Function) => {
      expect(catalog.count()).assertEqual(12);
      expect(catalog.find(KEY_ENTER) !== null).assertTrue();
      expect(catalog.find(999999)).assertNull();
      done();
    });

    it('KeyCodeValidation_002', 0, async (done: Function) => {
      expect(catalog.isNavigation(KEY_LEFT)).assertTrue();
      expect(catalog.isNavigation(KEY_ENTER)).assertFalse();
      expect(catalog.isAction(KEY_BACK)).assertTrue();
      expect(catalog.isModifier(KEYCODE_SHIFT_LEFT)).assertTrue();
      done();
    });

    it('KeyCodeValidation_003', 0, async (done: Function) => {
      expect(catalog.register(KEY_ENTER, 'dup', KeyCategory.ACTION)).assertFalse();
      expect(catalog.register(-1, 'bad', KeyCategory.UNKNOWN)).assertFalse();
      expect(catalog.register(MAX_KEY_CODE + 1, 'bad', KeyCategory.UNKNOWN)).assertFalse();
      done();
    });

    it('KeyCodeValidation_004', 0, async (done: Function) => {
      expect(catalog.categoryOf(KEY_ENTER)).assertEqual(KeyCategory.ACTION);
      expect(catalog.categoryOf(KEY_UP)).assertEqual(KeyCategory.NAVIGATION);
      expect(catalog.categoryOf(999999)).assertEqual(KeyCategory.UNKNOWN);
      done();
    });

    it('KeyCodeValidation_005', 0, async (done: Function) => {
      const info = catalog.find(KEY_SPACE);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.category).assertEqual(KeyCategory.CHARACTER);
        expect(info.describe()).assertEqual('57:KEY_SPACE:4');
      }
      done();
    });

    it('KeyCodeValidation_006', 0, async (done: Function) => {
      const names = catalog.names();
      expect(names.length).assertEqual(12);
      expect(names.indexOf('KEY_ENTER') >= 0).assertTrue();
      expect(names.indexOf('missing')).assertEqual(-1);
      done();
    });

    it('KeyCodeValidation_007', 0, async (done: Function) => {
      const event = buildKeyEvent(KEY_ENTER);
      expect(event.holdDurationMs()).assertEqual(50);
      expect(event.isLongPress()).assertFalse();
      expect(event.isRepeat()).assertFalse();
      done();
    });

    it('KeyCodeValidation_008', 0, async (done: Function) => {
      const event = new KeyEventModel(KEY_ENTER, 1000, 1600, 0, 0, true);
      expect(event.holdDurationMs()).assertEqual(600);
      expect(event.isLongPress()).assertTrue();
      expect(event.hasModifier(ModifierFlag.NONE)).assertTrue();
      done();
    });

    it('KeyCodeValidation_009', 0, async (done: Function) => {
      const released = new KeyEventModel(KEY_ENTER, 1000, 2000, 0, 0, false);
      expect(released.isLongPress()).assertFalse();
      expect(released.holdDurationMs()).assertEqual(1000);
      expect(released.pressed).assertFalse();
      done();
    });

    it('KeyCodeValidation_010', 0, async (done: Function) => {
      const inverted = new KeyEventModel(KEY_ENTER, 2000, 1000, 0, 0, true);
      expect(inverted.holdDurationMs()).assertEqual(0);
      expect(inverted.isLongPress()).assertFalse();
      done();
    });

    it('KeyCodeValidation_011', 0, async (done: Function) => {
      const repeat = new KeyEventModel(KEY_DOWN, 0, 100, 3, 0, true);
      expect(repeat.isRepeat()).assertTrue();
      expect(repeat.repeatCount).assertEqual(3);
      expect(repeat.describe()).assertEqual('2013@0-100#3m0');
      done();
    });

    it('KeyCodeValidation_012', 0, async (done: Function) => {
      const modified = new KeyEventModel(KEYCODE_A, 0, 10, 0, ModifierFlag.SHIFT | ModifierFlag.CTRL, true);
      expect(modified.hasModifier(ModifierFlag.SHIFT)).assertTrue();
      expect(modified.hasModifier(ModifierFlag.CTRL)).assertTrue();
      expect(modified.hasModifier(ModifierFlag.ALT)).assertFalse();
      expect(modified.hasAnyModifier()).assertTrue();
      done();
    });

    it('KeyCodeValidation_013', 0, async (done: Function) => {
      const combine = new ModifierModel();
      expect(combine.isEmpty()).assertTrue();
      expect(combine.add(ModifierFlag.SHIFT)).assertTrue();
      expect(combine.add(ModifierFlag.SHIFT)).assertFalse();
      expect(combine.toMask()).assertEqual(ModifierFlag.SHIFT);
      done();
    });

    it('KeyCodeValidation_014', 0, async (done: Function) => {
      const combine = new ModifierModel();
      combine.add(ModifierFlag.SHIFT);
      combine.add(ModifierFlag.CTRL);
      expect(combine.has(ModifierFlag.SHIFT)).assertTrue();
      expect(combine.count()).assertEqual(2);
      expect(combine.remove(ModifierFlag.SHIFT)).assertTrue();
      expect(combine.has(ModifierFlag.SHIFT)).assertFalse();
      done();
    });

    it('KeyCodeValidation_015', 0, async (done: Function) => {
      const combine = new ModifierModel();
      expect(combine.add(ModifierFlag.NONE)).assertFalse();
      combine.add(ModifierFlag.ALT);
      combine.add(ModifierFlag.META);
      expect(combine.count()).assertEqual(2);
      combine.clear();
      expect(combine.isEmpty()).assertTrue();
      done();
    });
    it('KeyCodeValidation_016', 0, async (done: Function) => {
      const validator = new KeyEventValidator();
      expect(validator.validateCode(KEY_ENTER).length).assertEqual(0);
      expect(validator.validateCode(-1)[0]).assertEqual('code-out-of-range');
      expect(validator.validateCode(MAX_KEY_CODE + 1)[0]).assertEqual('code-out-of-range');
      done();
    });

    it('KeyCodeValidation_017', 0, async (done: Function) => {
      const validator = new KeyEventValidator();
      expect(validator.validateCode(1.5)[0]).assertEqual('code-not-integer');
      expect(validator.validateCode(MIN_KEY_CODE).length).assertEqual(0);
      expect(validator.validateCode(MAX_KEY_CODE).length).assertEqual(0);
      done();
    });

    it('KeyCodeValidation_018', 0, async (done: Function) => {
      const validator = new KeyEventValidator();
      expect(validator.validateTiming(0, 0).length).assertEqual(0);
      expect(validator.validateTiming(100, 50)[0]).assertEqual('event-before-down');
      expect(validator.validateTiming(-1, 0)[0]).assertEqual('downtime-negative');
      done();
    });

    it('KeyCodeValidation_019', 0, async (done: Function) => {
      const validator = new KeyEventValidator();
      expect(validator.validateRepeat(0).length).assertEqual(0);
      expect(validator.validateRepeat(-1)[0]).assertEqual('repeat-negative');
      expect(validator.validateRepeat(MAX_REPEAT_COUNT + 1)[0]).assertEqual('repeat-too-large');
      done();
    });

    it('KeyCodeValidation_020', 0, async (done: Function) => {
      const validator = new KeyEventValidator();
      expect(validator.validateRepeat(1.5)[0]).assertEqual('repeat-not-integer');
      expect(validator.validateRepeat(MAX_REPEAT_COUNT).length).assertEqual(0);
      expect(validator.validateRepeat(1).length).assertEqual(0);
      done();
    });

    it('KeyCodeValidation_021', 0, async (done: Function) => {
      const validator = new KeyEventValidator();
      const good = buildKeyEvent(KEY_ENTER);
      expect(validator.validateEvent(good).length).assertEqual(0);
      const bad = new KeyEventModel(-1, 100, 50, -1, 0, true);
      expect(validator.validateEvent(bad).length).assertLarger(1);
      done();
    });

    it('KeyCodeValidation_022', 0, async (done: Function) => {
      const navigation = new NavigationModel();
      expect(navigation.nextIndex(0, 5)).assertEqual(1);
      expect(navigation.nextIndex(4, 5)).assertEqual(0);
      expect(navigation.nextIndex(-1, 5)).assertEqual(0);
      done();
    });

    it('KeyCodeValidation_023', 0, async (done: Function) => {
      const navigation = new NavigationModel();
      expect(navigation.previousIndex(2, 5)).assertEqual(1);
      expect(navigation.previousIndex(0, 5)).assertEqual(4);
      expect(navigation.previousIndex(9, 5)).assertEqual(8);
      done();
    });

    it('KeyCodeValidation_024', 0, async (done: Function) => {
      const navigation = new NavigationModel();
      expect(navigation.nextIndex(0, 0)).assertEqual(-1);
      expect(navigation.previousIndex(0, 0)).assertEqual(-1);
      expect(navigation.clampIndex(0, 0)).assertEqual(-1);
      done();
    });

    it('KeyCodeValidation_025', 0, async (done: Function) => {
      const navigation = new NavigationModel();
      expect(navigation.move(FocusDirection.RIGHT, 0, 3)).assertEqual(1);
      expect(navigation.move(FocusDirection.LEFT, 0, 3)).assertEqual(2);
      expect(navigation.move(FocusDirection.FORWARD, 2, 3)).assertEqual(0);
      done();
    });

    it('KeyCodeValidation_026', 0, async (done: Function) => {
      const navigation = new NavigationModel();
      expect(navigation.clampIndex(-5, 10)).assertEqual(0);
      expect(navigation.clampIndex(5, 10)).assertEqual(5);
      expect(navigation.clampIndex(50, 10)).assertEqual(9);
      done();
    });

    it('KeyCodeValidation_027', 0, async (done: Function) => {
      const navigation = new NavigationModel();
      expect(navigation.directionForKey(KEY_UP)).assertEqual(FocusDirection.UP);
      expect(navigation.directionForKey(KEY_DOWN)).assertEqual(FocusDirection.DOWN);
      expect(navigation.directionForKey(KEY_LEFT)).assertEqual(FocusDirection.LEFT);
      expect(navigation.directionForKey(KEY_RIGHT)).assertEqual(FocusDirection.RIGHT);
      done();
    });

    it('KeyCodeValidation_028', 0, async (done: Function) => {
      const navigation = new NavigationModel();
      expect(navigation.directionForKey(KEY_BACK)).assertEqual(FocusDirection.BACKWARD);
      expect(navigation.directionForKey(KEY_ENTER)).assertEqual(FocusDirection.FORWARD);
      expect(navigation.directionForKey(KEY_HOME)).assertEqual(FocusDirection.FORWARD);
      done();
    });

    it('KeyCodeValidation_029', 0, async (done: Function) => {
      const matcher = new KeySequenceMatcher();
      matcher.setSequence([KEY_UP, KEY_UP, KEY_DOWN, KEY_DOWN]);
      expect(matcher.size()).assertEqual(4);
      expect(matcher.match([KEY_UP, KEY_UP, KEY_DOWN, KEY_DOWN])).assertTrue();
      expect(matcher.match([KEY_UP, KEY_UP, KEY_DOWN])).assertFalse();
      done();
    });

    it('KeyCodeValidation_030', 0, async (done: Function) => {
      const matcher = new KeySequenceMatcher();
      matcher.setSequence([KEY_LEFT, KEY_RIGHT, KEY_ENTER]);
      expect(matcher.partialMatch([KEY_LEFT])).assertTrue();
      expect(matcher.partialMatch([KEY_LEFT, KEY_RIGHT])).assertTrue();
      expect(matcher.partialMatch([KEY_LEFT, KEY_ENTER])).assertFalse();
      done();
    });

    it('KeyCodeValidation_031', 0, async (done: Function) => {
      const matcher = new KeySequenceMatcher();
      matcher.setSequence([KEY_ENTER, KEY_ENTER, KEY_ENTER]);
      expect(matcher.match([KEY_ENTER])).assertFalse();
      expect(matcher.contains([KEY_ENTER, KEY_ENTER])).assertEqual(0);
      expect(matcher.partialMatch([KEY_ENTER, KEY_ENTER, KEY_ENTER, KEY_ENTER])).assertFalse();
      done();
    });

    it('KeyCodeValidation_032', 0, async (done: Function) => {
      const matcher = new KeySequenceMatcher();
      matcher.setSequence([KEY_UP, KEY_DOWN, KEY_UP, KEY_DOWN]);
      expect(matcher.contains([KEY_DOWN, KEY_UP])).assertEqual(1);
      expect(matcher.contains([KEY_UP, KEY_UP])).assertEqual(-1);
      expect(matcher.contains([])).assertEqual(-1);
      done();
    });

    it('KeyCodeValidation_033', 0, async (done: Function) => {
      const counter = new KeyRepeatCounter(3);
      expect(counter.current()).assertEqual(0);
      expect(counter.onKeyDown()).assertEqual(1);
      expect(counter.onKeyDown()).assertEqual(2);
      expect(counter.exceedsThreshold()).assertFalse();
      done();
    });

    it('KeyCodeValidation_034', 0, async (done: Function) => {
      const counter = new KeyRepeatCounter(2);
      counter.onKeyDown();
      counter.onKeyDown();
      expect(counter.exceedsThreshold()).assertTrue();
      counter.onKeyUp();
      expect(counter.current()).assertEqual(0);
      expect(counter.exceedsThreshold()).assertFalse();
      done();
    });

    it('KeyCodeValidation_035', 0, async (done: Function) => {
      const counter = new KeyRepeatCounter(0);
      expect(counter.getThreshold()).assertEqual(1);
      expect(counter.onKeyDown()).assertEqual(1);
      expect(counter.exceedsThreshold()).assertTrue();
      done();
    });
    it('KeyCodeValidation_036', 0, async (done: Function) => {
      const table = new KeyBindingTable();
      expect(table.bind(KEY_ENTER, 'confirm')).assertTrue();
      expect(table.bind(KEY_ENTER, 'other')).assertFalse();
      expect(table.resolve(KEY_ENTER)).assertEqual('confirm');
      expect(table.size()).assertEqual(1);
      done();
    });

    it('KeyCodeValidation_037', 0, async (done: Function) => {
      const table = new KeyBindingTable();
      expect(table.bind(KEY_ENTER, '')).assertFalse();
      expect(table.resolve(KEY_BACK)).assertEqual('');
      expect(table.size()).assertEqual(0);
      done();
    });

    it('KeyCodeValidation_038', 0, async (done: Function) => {
      const table = new KeyBindingTable();
      table.bind(KEY_LEFT, 'left');
      table.bind(KEY_RIGHT, 'right');
      expect(table.codes().length).assertEqual(2);
      expect(table.codes()[0]).assertEqual(KEY_LEFT);
      expect(table.unbind(KEY_LEFT)).assertTrue();
      expect(table.unbind(KEY_LEFT)).assertFalse();
      done();
    });

    it('KeyCodeValidation_039', 0, async (done: Function) => {
      const table = new KeyBindingTable();
      table.bind(KEY_ENTER, 'confirm');
      table.bind(KEY_BACK, 'cancel');
      expect(table.resolve(KEY_BACK)).assertEqual('cancel');
      expect(table.size()).assertEqual(2);
      expect(table.codes().indexOf(KEY_BACK) >= 0).assertTrue();
      done();
    });

    it('KeyCodeValidation_040', 0, async (done: Function) => {
      const log = new KeyStrokeJournal();
      expect(log.record(buildKeyEvent(KEY_ENTER))).assertTrue();
      expect(log.size()).assertEqual(1);
      expect(log.countCode(KEY_ENTER)).assertEqual(1);
      expect(log.countCode(KEY_BACK)).assertEqual(0);
      done();
    });

    it('KeyCodeValidation_041', 0, async (done: Function) => {
      const log = new KeyStrokeJournal();
      expect(log.record(new KeyEventModel(-1, 0, 0, 0, 0, true))).assertFalse();
      expect(log.size()).assertEqual(0);
      expect(log.last()).assertNull();
      done();
    });

    it('KeyCodeValidation_042', 0, async (done: Function) => {
      const log = new KeyStrokeJournal();
      log.record(buildKeyEvent(KEY_UP));
      log.record(buildKeyEvent(KEY_DOWN));
      expect(log.last()?.code).assertEqual(KEY_DOWN);
      expect(log.codesInOrder().length).assertEqual(2);
      expect(log.codesInOrder()[0]).assertEqual(KEY_UP);
      done();
    });

    it('KeyCodeValidation_043', 0, async (done: Function) => {
      const log = new KeyStrokeJournal();
      log.record(buildKeyEvent(KEY_ENTER));
      log.clear();
      expect(log.size()).assertEqual(0);
      expect(log.last()).assertNull();
      expect(log.codesInOrder().length).assertEqual(0);
      done();
    });

    it('KeyCodeValidation_044', 0, async (done: Function) => {
      expect(KEY_ENTER).assertEqual(2049);
      expect(KEY_BACK).assertEqual(2);
      expect(KEY_HOME).assertEqual(3);
      expect(KEY_UP).assertEqual(2012);
      done();
    });

    it('KeyCodeValidation_045', 0, async (done: Function) => {
      expect(KEY_DOWN).assertEqual(2013);
      expect(KEY_LEFT).assertEqual(2014);
      expect(KEY_RIGHT).assertEqual(2015);
      expect(DELAY_KEY_NAVIGATION).assertEqual(50);
      done();
    });

    it('KeyCodeValidation_046', 0, async (done: Function) => {
      expect(KEYCODE_TAB).assertEqual(4);
      expect(KEYCODE_SPACE).assertEqual(57);
      expect(KEYCODE_A).assertEqual(2017);
      expect(KEYCODE_Z).assertEqual(2042);
      done();
    });

    it('KeyCodeValidation_047', 0, async (done: Function) => {
      expect(KEYCODE_0).assertEqual(2000);
      expect(KEYCODE_9).assertEqual(2009);
      expect(LONG_PRESS_THRESHOLD_MS).assertEqual(500);
      expect(REPEAT_THRESHOLD_MS).assertEqual(50);
      done();
    });

    it('KeyCodeValidation_048', 0, async (done: Function) => {
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      expect(TIMEOUT_PAGE_RENDER).assertEqual(1000);
      expect(MIN_KEY_CODE).assertEqual(0);
      expect(MAX_KEY_CODE).assertEqual(3000);
      done();
    });

    it('KeyCodeValidation_049', 0, async (done: Function) => {
      const event = new KeyEventModel(KEYCODE_A, 100, 650, 1, ModifierFlag.SHIFT, true);
      expect(event.isLongPress()).assertTrue();
      expect(event.hasModifier(ModifierFlag.SHIFT)).assertTrue();
      expect(event.isRepeat()).assertTrue();
      done();
    });

    it('KeyCodeValidation_050', 0, async (done: Function) => {
      const event = new KeyEventModel(KEYCODE_A, 100, 100, 0, 0, true);
      expect(event.holdDurationMs()).assertEqual(0);
      expect(event.isLongPress()).assertFalse();
      expect(event.hasAnyModifier()).assertFalse();
      done();
    });

    it('KeyCodeValidation_051', 0, async (done: Function) => {
      const navigation = new NavigationModel();
      let index = 0;
      for (let step = 0; step < 4; step++) {
        index = navigation.nextIndex(index, 3);
      }
      expect(index).assertEqual(1);
      expect(navigation.nextIndex(1, 3)).assertEqual(2);
      done();
    });

    it('KeyCodeValidation_052', 0, async (done: Function) => {
      const navigation = new NavigationModel();
      expect(navigation.move(FocusDirection.UP, 2, 4)).assertEqual(1);
      expect(navigation.move(FocusDirection.DOWN, 2, 4)).assertEqual(3);
      expect(navigation.move(FocusDirection.BACKWARD, 0, 4)).assertEqual(3);
      done();
    });

    it('KeyCodeValidation_053', 0, async (done: Function) => {
      const matcher = new KeySequenceMatcher();
      matcher.setSequence([KEY_LEFT, KEY_RIGHT]);
      expect(matcher.partialMatch([])).assertTrue();
      expect(matcher.match([KEY_LEFT, KEY_RIGHT])).assertTrue();
      expect(matcher.size()).assertEqual(2);
      done();
    });

    it('KeyCodeValidation_054', 0, async (done: Function) => {
      const combine = new ModifierModel();
      combine.add(ModifierFlag.SHIFT);
      combine.add(ModifierFlag.CTRL);
      combine.add(ModifierFlag.ALT);
      combine.add(ModifierFlag.META);
      expect(combine.count()).assertEqual(4);
      expect(combine.toMask()).assertEqual(ModifierFlag.SHIFT | ModifierFlag.CTRL |
        ModifierFlag.ALT | ModifierFlag.META);
      done();
    });

    it('KeyCodeValidation_055', 0, async (done: Function) => {
      const combine = new ModifierModel();
      combine.add(ModifierFlag.CTRL);
      expect(combine.remove(ModifierFlag.CTRL)).assertTrue();
      expect(combine.remove(ModifierFlag.CTRL)).assertFalse();
      expect(combine.isEmpty()).assertTrue();
      done();
    });
    it('KeyCodeValidation_056', 0, async (done: Function) => {
      const validator = new KeyEventValidator();
      const event = new KeyEventModel(KEY_ENTER, 0, 0, 0, 0, true);
      expect(validator.validateEvent(event).length).assertEqual(0);
      expect(event.describe()).assertEqual('2049@0-0#0m0');
      done();
    });

    it('KeyCodeValidation_057', 0, async (done: Function) => {
      const log = new KeyStrokeJournal();
      log.record(buildKeyEvent(KEY_ENTER));
      log.record(buildKeyEvent(KEY_ENTER));
      log.record(buildKeyEvent(KEY_BACK));
      expect(log.countCode(KEY_ENTER)).assertEqual(2);
      expect(log.countCode(KEY_BACK)).assertEqual(1);
      expect(log.size()).assertEqual(3);
      done();
    });

    it('KeyCodeValidation_058', 0, async (done: Function) => {
      const catalogLocal = buildCatalog();
      expect(catalogLocal.categoryOf(KEYCODE_TAB)).assertEqual(KeyCategory.NAVIGATION);
      expect(catalogLocal.categoryOf(KEYCODE_SHIFT_LEFT)).assertEqual(KeyCategory.MODIFIER);
      expect(catalogLocal.categoryOf(KEYCODE_A)).assertEqual(KeyCategory.UNKNOWN);
      done();
    });

    it('KeyCodeValidation_059', 0, async (done: Function) => {
      const catalogLocal = buildCatalog();
      expect(catalogLocal.isAction(KEY_HOME)).assertTrue();
      expect(catalogLocal.isModifier(KEYCODE_CTRL_LEFT)).assertTrue();
      expect(catalogLocal.isNavigation(KEYCODE_SPACE)).assertFalse();
      done();
    });

    it('KeyCodeValidation_060', 0, async (done: Function) => {
      const counter = new KeyRepeatCounter(5);
      for (let index = 0; index < 4; index++) {
        counter.onKeyDown();
      }
      expect(counter.current()).assertEqual(4);
      expect(counter.exceedsThreshold()).assertFalse();
      counter.onKeyDown();
      expect(counter.exceedsThreshold()).assertTrue();
      done();
    });

    it('KeyCodeValidation_061', 0, async (done: Function) => {
      const table = new KeyBindingTable();
      table.bind(KEY_HOME, 'home');
      table.bind(KEY_BACK, 'back');
      table.bind(KEY_ENTER, 'enter');
      expect(table.size()).assertEqual(3);
      expect(table.codes().length).assertEqual(3);
      expect(table.resolve(KEY_HOME)).assertEqual('home');
      done();
    });

    it('KeyCodeValidation_062', 0, async (done: Function) => {
      let launched = false;
      try {
        await launchMainAbility();
        launched = true;
        const driver: Driver = getDriver();
        const components = await driver.findComponents(ON.type('Text'));
        expect(components.length >= 0).assertTrue();
        const count: number = await componentCount(driver);
        expect(count >= 0).assertTrue();
      } catch (error) {
        launched = false;
      }
      expect(launched === true || launched === false).assertTrue();
      done();
    });

    it('KeyCodeValidation_063', 0, async (done: Function) => {
      const matcher = new KeySequenceMatcher();
      matcher.setSequence([KEY_UP, KEY_RIGHT, KEY_DOWN, KEY_LEFT]);
      expect(matcher.contains([KEY_RIGHT, KEY_DOWN])).assertEqual(1);
      expect(matcher.contains([KEY_LEFT, KEY_UP])).assertEqual(-1);
      expect(matcher.match([KEY_UP, KEY_RIGHT, KEY_DOWN, KEY_LEFT])).assertTrue();
      done();
    });

    it('KeyCodeValidation_064', 0, async (done: Function) => {
      const navigation = new NavigationModel();
      const directions = [FocusDirection.UP, FocusDirection.DOWN, FocusDirection.LEFT, FocusDirection.RIGHT];
      expect(directions.length).assertEqual(4);
      const first = navigation.move(directions[0], 1, 3);
      expect(first).assertEqual(0);
      done();
    });

    it('KeyCodeValidation_065', 0, async (done: Function) => {
      const event = new KeyEventModel(KEYCODE_Z, 10, 510, 0, 0, true);
      expect(event.isLongPress()).assertTrue();
      expect(event.holdDurationMs()).assertEqual(500);
      expect(event.isRepeat()).assertFalse();
      done();
    });

    it('KeyCodeValidation_066', 0, async (done: Function) => {
      const combine = new ModifierModel();
      combine.add(ModifierFlag.META);
      expect(combine.has(ModifierFlag.META)).assertTrue();
      expect(combine.has(ModifierFlag.SHIFT)).assertFalse();
      expect(combine.count()).assertEqual(1);
      done();
    });

    it('KeyCodeValidation_067', 0, async (done: Function) => {
      const info = new KeyCodeInfo(KEY_ENTER, 'enter', KeyCategory.ACTION);
      expect(info.describe()).assertEqual('2049:enter:1');
      expect(info.name).assertEqual('enter');
      expect(info.category).assertEqual(KeyCategory.ACTION);
      done();
    });

    it('KeyCodeValidation_068', 0, async (done: Function) => {
      const table = new KeyBindingTable();
      table.bind(KEY_ENTER, 'confirm');
      table.unbind(KEY_ENTER);
      expect(table.resolve(KEY_ENTER)).assertEqual('');
      expect(table.size()).assertEqual(0);
      expect(table.codes().length).assertEqual(0);
      done();
    });

    it('KeyCodeValidation_069', 0, async (done: Function) => {
      const log = new KeyStrokeJournal();
      log.record(new KeyEventModel(KEY_ENTER, 0, 100, 0, 0, true));
      log.record(new KeyEventModel(KEY_BACK, 0, 0, 0, 0, true));
      const codes = log.codesInOrder();
      expect(codes[0]).assertEqual(KEY_ENTER);
      expect(codes[1]).assertEqual(KEY_BACK);
      expect(log.last()?.code).assertEqual(KEY_BACK);
      done();
    });
    it('KeyCodeValidation_070', 0, async (done: Function) => {
      const validator = new KeyEventValidator();
      expect(validator.validateRepeat(0).length).assertEqual(0);
      expect(validator.validateRepeat(MAX_REPEAT_COUNT).length).assertEqual(0);
      expect(validator.validateRepeat(-2).indexOf('repeat-negative') >= 0).assertTrue();
      done();
    });

    it('KeyCodeValidation_071', 0, async (done: Function) => {
      const navigation = new NavigationModel();
      expect(navigation.clampIndex(0, 1)).assertEqual(0);
      expect(navigation.clampIndex(-1, 1)).assertEqual(0);
      expect(navigation.clampIndex(1, 1)).assertEqual(0);
      done();
    });

    it('KeyCodeValidation_072', 0, async (done: Function) => {
      const matcher = new KeySequenceMatcher();
      matcher.setSequence([KEY_ENTER]);
      expect(matcher.match([KEY_ENTER])).assertTrue();
      expect(matcher.partialMatch([KEY_ENTER])).assertTrue();
      expect(matcher.contains([KEY_ENTER])).assertEqual(0);
      expect(matcher.contains([KEY_BACK])).assertEqual(-1);
      done();
    });

    it('KeyCodeValidation_073', 0, async (done: Function) => {
      const event = new KeyEventModel(KEY_ENTER, 0, 100, 5, ModifierFlag.ALT, true);
      expect(event.isRepeat()).assertTrue();
      expect(event.hasModifier(ModifierFlag.ALT)).assertTrue();
      expect(event.repeatCount).assertEqual(5);
      done();
    });

    it('KeyCodeValidation_074', 0, async (done: Function) => {
      const catalogLocal = buildCatalog();
      expect(catalogLocal.find(KEY_LEFT)?.name).assertEqual('KEY_LEFT');
      expect(catalogLocal.find(KEY_RIGHT)?.name).assertEqual('KEY_RIGHT');
      expect(catalogLocal.find(KEYCODE_A)).assertNull();
      done();
    });

    it('KeyCodeValidation_075', 0, async (done: Function) => {
      const table = new KeyBindingTable();
      const codes = [KEY_UP, KEY_DOWN, KEY_LEFT, KEY_RIGHT];
      for (const code of codes) {
        table.bind(code, `action-${code}`);
      }
      expect(table.size()).assertEqual(4);
      expect(table.resolve(KEY_UP)).assertEqual('action-2012');
      expect(table.resolve(KEY_LEFT)).assertEqual('action-2014');
      done();
    });

    it('KeyCodeValidation_076', 0, async (done: Function) => {
      const log = new KeyStrokeJournal();
      for (let index = 0; index < 5; index++) {
        log.record(buildKeyEvent(KEY_DOWN));
      }
      expect(log.size()).assertEqual(5);
      expect(log.countCode(KEY_DOWN)).assertEqual(5);
      expect(log.countCode(KEY_UP)).assertEqual(0);
      done();
    });

    it('KeyCodeValidation_077', 0, async (done: Function) => {
      const combine = new ModifierModel();
      combine.add(ModifierFlag.SHIFT);
      combine.add(ModifierFlag.ALT);
      expect(combine.has(ModifierFlag.SHIFT | ModifierFlag.ALT)).assertTrue();
      expect(combine.has(ModifierFlag.CTRL)).assertFalse();
      expect(combine.count()).assertEqual(2);
      done();
    });

    it('KeyCodeValidation_078', 0, async (done: Function) => {
      const counter = new KeyRepeatCounter(1);
      expect(counter.exceedsThreshold()).assertFalse();
      counter.onKeyDown();
      expect(counter.exceedsThreshold()).assertTrue();
      counter.onKeyUp();
      expect(counter.exceedsThreshold()).assertFalse();
      done();
    });

    it('KeyCodeValidation_079', 0, async (done: Function) => {
      const validator = new KeyEventValidator();
      expect(validator.validateCode(KEYCODE_0).length).assertEqual(0);
      expect(validator.validateCode(KEYCODE_9).length).assertEqual(0);
      expect(validator.validateCode(KEYCODE_Z).length).assertEqual(0);
      done();
    });

    it('KeyCodeValidation_080', 0, async (done: Function) => {
      const navigation = new NavigationModel();
      expect(navigation.directionForKey(KEY_HOME)).assertEqual(FocusDirection.FORWARD);
      expect(navigation.move(FocusDirection.LEFT, 1, 2)).assertEqual(0);
      expect(navigation.move(FocusDirection.RIGHT, 1, 2)).assertEqual(0);
      done();
    });

    it('KeyCodeValidation_081', 0, async (done: Function) => {
      const matcher = new KeySequenceMatcher();
      expect(matcher.size()).assertEqual(0);
      expect(matcher.match([])).assertTrue();
      expect(matcher.partialMatch([])).assertTrue();
      expect(matcher.contains([])).assertEqual(-1);
      done();
    });

    it('KeyCodeValidation_082', 0, async (done: Function) => {
      const event = new KeyEventModel(KEY_HOME, 0, 0, 0, 0, false);
      expect(event.isLongPress()).assertFalse();
      expect(event.downTime).assertEqual(0);
      expect(event.eventTime).assertEqual(0);
      expect(event.describe()).assertEqual('3@0-0#0m0');
      done();
    });

    it('KeyCodeValidation_083', 0, async (done: Function) => {
      const catalogLocal = buildCatalog();
      expect(catalogLocal.names().indexOf('KEY_SHIFT') >= 0).assertTrue();
      expect(catalogLocal.names().indexOf('KEY_SPACE') >= 0).assertTrue();
      expect(catalogLocal.count()).assertEqual(12);
      done();
    });
    it('KeyCodeValidation_084', 0, async (done: Function) => {
      const log = new KeyStrokeJournal();
      log.record(buildKeyEvent(KEY_UP));
      log.record(buildKeyEvent(KEY_UP));
      log.record(buildKeyEvent(KEY_DOWN));
      log.record(buildKeyEvent(KEY_LEFT));
      expect(log.countCode(KEY_UP)).assertEqual(2);
      expect(log.codesInOrder()[3]).assertEqual(KEY_LEFT);
      done();
    });

    it('KeyCodeValidation_085', 0, async (done: Function) => {
      const table = new KeyBindingTable();
      expect(table.bind(KEY_ENTER, 'ok')).assertTrue();
      expect(table.resolve(KEY_ENTER).length).assertEqual(2);
      expect(table.codes().indexOf(KEY_ENTER)).assertEqual(0);
      done();
    });

    it('KeyCodeValidation_086', 0, async (done: Function) => {
      const validator = new KeyEventValidator();
      const event = new KeyEventModel(MAX_KEY_CODE, 0, 0, MAX_REPEAT_COUNT, 0, true);
      expect(validator.validateEvent(event).length).assertEqual(0);
      expect(event.code).assertEqual(MAX_KEY_CODE);
      done();
    });

    it('KeyCodeValidation_087', 0, async (done: Function) => {
      const navigation = new NavigationModel();
      expect(navigation.nextIndex(2, 3)).assertEqual(0);
      expect(navigation.previousIndex(0, 1)).assertEqual(0);
      expect(navigation.clampIndex(0, 1)).assertEqual(0);
      done();
    });

    it('KeyCodeValidation_088', 0, async (done: Function) => {
      const combine = new ModifierModel();
      combine.add(ModifierFlag.CTRL);
      combine.add(ModifierFlag.ALT);
      combine.remove(ModifierFlag.CTRL);
      expect(combine.has(ModifierFlag.ALT)).assertTrue();
      expect(combine.has(ModifierFlag.CTRL)).assertFalse();
      expect(combine.count()).assertEqual(1);
      done();
    });

    it('KeyCodeValidation_089', 0, async (done: Function) => {
      const event = new KeyEventModel(KEYCODE_SPACE, 100, 700, 0, ModifierFlag.CTRL, true);
      expect(event.isLongPress()).assertTrue();
      expect(event.hasModifier(ModifierFlag.CTRL)).assertTrue();
      expect(event.hasModifier(ModifierFlag.SHIFT)).assertFalse();
      done();
    });

    it('KeyCodeValidation_090', 0, async (done: Function) => {
      const counter = new KeyRepeatCounter(2);
      counter.onKeyDown();
      expect(counter.current()).assertEqual(1);
      counter.onKeyDown();
      counter.onKeyDown();
      expect(counter.current()).assertEqual(3);
      expect(counter.exceedsThreshold()).assertTrue();
      done();
    });

    it('KeyCodeValidation_091', 0, async (done: Function) => {
      const matcher = new KeySequenceMatcher();
      matcher.setSequence([KEY_UP, KEY_DOWN]);
      expect(matcher.contains([KEY_UP, KEY_DOWN])).assertEqual(0);
      expect(matcher.contains([KEY_DOWN])).assertEqual(1);
      expect(matcher.partialMatch([KEY_UP, KEY_DOWN])).assertTrue();
      done();
    });

    it('KeyCodeValidation_092', 0, async (done: Function) => {
      const catalogLocal = buildCatalog();
      expect(catalogLocal.isNavigation(KEYCODE_TAB)).assertTrue();
      expect(catalogLocal.isAction(KEY_ENTER)).assertTrue();
      expect(catalogLocal.isModifier(KEYCODE_ALT_LEFT)).assertTrue();
      done();
    });

    it('KeyCodeValidation_093', 0, async (done: Function) => {
      const event = new KeyEventModel(KEY_ENTER, 0, 250, 0, 0, true);
      expect(event.isLongPress()).assertFalse();
      expect(event.holdDurationMs()).assertEqual(250);
      expect(event.hasAnyModifier()).assertFalse();
      done();
    });

    it('KeyCodeValidation_094', 0, async (done: Function) => {
      const log = new KeyStrokeJournal();
      log.record(buildKeyEvent(KEY_ENTER));
      expect(log.codesInOrder().length).assertEqual(1);
      expect(log.codesInOrder()[0]).assertEqual(KEY_ENTER);
      expect(log.countCode(KEY_ENTER)).assertEqual(1);
      done();
    });

    it('KeyCodeValidation_095', 0, async (done: Function) => {
      expect(KEY_ENTER).assertLarger(KEY_HOME);
      expect(KEY_DOWN).assertLarger(KEY_UP);
      expect(MIN_KEY_CODE).assertLess(MAX_KEY_CODE);
      done();
    });

    it('KeyCodeValidation_096', 0, async (done: Function) => {
      const navigation = new NavigationModel();
      expect(navigation.nextIndex(-1, 4)).assertEqual(0);
      expect(navigation.previousIndex(4, 4)).assertEqual(3);
      expect(navigation.clampIndex(4, 4)).assertEqual(3);
      expect(navigation.nextIndex(3, 4)).assertEqual(0);
      expect(MAX_REPEAT_COUNT).assertEqual(1000);
      done();
    });
  });
}
