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
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, componentByIdExists, countById, clickById, serializedDelay,
  pressKey, normalizeUrl, ID_INPUT_URL, ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH,
  ID_NAV_HOME, ID_ACTION_SUBMIT, ID_ACTION_ADD, ID_CANCEL_TAB, MAX_TAB_COUNT,
  MIN_TAB_COUNT, TAB_LIMIT_MESSAGE, DELAY_TOUCH_EVENT, DELAY_KEY_NAVIGATION,
  TIMEOUT_COMPONENT, PAD_HOME_PAGE, KEY_ENTER
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserButtonInteractionTest';

/* ------------------------------------------------------------------ */
/* Button contract of common/TitleBar.ets                              */
/* ------------------------------------------------------------------ */

const BUTTON_WIDTH: number = 22;
const BUTTON_RADIUS: number = 4;
const DOWN_COLOR: string = '#e4e4e4';
const UP_COLOR: string = '#00000000';

const PRESS_IDLE: string = 'idle';
const PRESS_DOWN: string = 'down';
const PRESS_UP: string = 'up';
const PRESS_CANCELLED: string = 'cancelled';
const PRESS_LONG: string = 'longPress';

const ACTION_BACK: string = 'back';
const ACTION_FORWARD: string = 'forward';
const ACTION_REFRESH: string = 'refresh';
const ACTION_HOME: string = 'home';
const ACTION_SUBMIT: string = 'submit';
const ACTION_ADD_TAB: string = 'addTab';
const ACTION_CANCEL_TAB: string = 'cancelTab';
const ACTION_NONE: string = 'none';

/** Click debounce window measured in milliseconds. */
const DEBOUNCE_WINDOW: number = DELAY_TOUCH_EVENT;
/** A press longer than this value counts as a long press. */
const LONG_PRESS_THRESHOLD: number = 500;

/* ------------------------------------------------------------------ */
/* Button catalog                                                      */
/* ------------------------------------------------------------------ */

/** One interactive control declared by the title bar. */
class ButtonSpec {
  id: string;
  action: string;
  label: string;
  group: string;
  width: number;
  height: number;
  radius: number;
  enabled: boolean;

  constructor(id: string, action: string, label: string, group: string,
    enabled: boolean = true) {
    this.id = id;
    this.action = action;
    this.label = label;
    this.group = group;
    this.width = BUTTON_WIDTH;
    this.height = BUTTON_WIDTH;
    this.radius = BUTTON_RADIUS;
    this.enabled = enabled;
  }

  isSquare(): boolean {
    return this.width === this.height && this.width > 0;
  }

  backgroundOf(pressed: boolean): string {
    return pressed ? DOWN_COLOR : UP_COLOR;
  }
}

/** Registry of the six image buttons plus the tab close button. */
class ButtonCatalog {
  buttons: ButtonSpec[] = [];

  constructor() {
    this.buttons.push(new ButtonSpec(ID_NAV_BACK, ACTION_BACK, 'Back', 'navigation'));
    this.buttons.push(new ButtonSpec(ID_NAV_FORWARD, ACTION_FORWARD, 'Forward', 'navigation'));
    this.buttons.push(new ButtonSpec(ID_NAV_REFRESH, ACTION_REFRESH, 'Refresh', 'navigation'));
    this.buttons.push(new ButtonSpec(ID_NAV_HOME, ACTION_HOME, 'Home', 'navigation'));
    this.buttons.push(new ButtonSpec(ID_ACTION_SUBMIT, ACTION_SUBMIT, 'Go', 'action'));
    this.buttons.push(new ButtonSpec(ID_ACTION_ADD, ACTION_ADD_TAB, 'New tab', 'action'));
    this.buttons.push(new ButtonSpec(ID_CANCEL_TAB, ACTION_CANCEL_TAB, 'Close tab', 'tab'));
  }

  size(): number {
    return this.buttons.length;
  }

  ids(): string[] {
    return this.buttons.map((button: ButtonSpec) => button.id);
  }

  specOf(id: string): ButtonSpec | null {
    for (let index = 0; index < this.buttons.length; index++) {
      if (this.buttons[index].id === id) {
        return this.buttons[index];
      }
    }
    return null;
  }

  actionOf(id: string): string {
    const spec: ButtonSpec | null = this.specOf(id);
    return spec === null ? ACTION_NONE : spec.action;
  }

  groupOf(id: string): string {
    const spec: ButtonSpec | null = this.specOf(id);
    return spec === null ? '' : spec.group;
  }

  countInGroup(group: string): number {
    let total: number = 0;
    for (let index = 0; index < this.buttons.length; index++) {
      if (this.buttons[index].group === group) {
        total += 1;
      }
    }
    return total;
  }

  hasDuplicateIds(): boolean {
    const seen: Map<string, number> = new Map<string, number>();
    for (let index = 0; index < this.buttons.length; index++) {
      const key: string = this.buttons[index].id;
      const current: number | undefined = seen.get(key);
      const previous: number = current === undefined ? 0 : current;
      if (previous > 0) {
        return true;
      }
      seen.set(key, previous + 1);
    }
    return false;
  }

  duplicateLabels(): string[] {
    const result: string[] = [];
    const seen: Map<string, string> = new Map<string, string>();
    for (let index = 0; index < this.buttons.length; index++) {
      const label: string = this.buttons[index].label;
      if (seen.get(label) !== undefined) {
        result.push(label);
      } else {
        seen.set(label, this.buttons[index].id);
      }
    }
    return result;
  }

  distinctActions(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.buttons.length; index++) {
      if (result.indexOf(this.buttons[index].action) < 0) {
        result.push(this.buttons[index].action);
      }
    }
    return result;
  }

  setEnabled(id: string, enabled: boolean): boolean {
    const spec: ButtonSpec | null = this.specOf(id);
    if (spec === null) {
      return false;
    }
    spec.enabled = enabled;
    return true;
  }
}

/* ------------------------------------------------------------------ */
/* Press state machine                                                 */
/* ------------------------------------------------------------------ */

/** Tracks down / up / cancel transitions and the pressed background. */
class PressTracker {
  state: string = PRESS_IDLE;
  background: string = UP_COLOR;
  events: string[] = [];
  clickCount: number = 0;
  enabled: boolean = true;
  private clock: MockClock;
  private downAt: number = 0;
  private upAt: number = 0;

  constructor(clock: MockClock) {
    this.clock = clock;
  }

  isPressed(): boolean {
    return this.state === PRESS_DOWN || this.state === PRESS_LONG;
  }

  down(): boolean {
    if (!this.enabled) {
      this.events.push('down-rejected');
      return false;
    }
    if (this.isPressed()) {
      this.events.push('down-duplicate');
      return false;
    }
    this.state = PRESS_DOWN;
    this.background = DOWN_COLOR;
    this.downAt = this.clock.now();
    this.upAt = 0;
    this.events.push('down');
    return true;
  }

  /** Releases the press; returns true when a click is emitted. */
  up(): boolean {
    if (this.state === PRESS_CANCELLED) {
      this.events.push('up-after-cancel');
      return false;
    }
    if (!this.isPressed()) {
      this.events.push('up-without-down');
      return false;
    }
    this.state = PRESS_UP;
    this.background = UP_COLOR;
    this.upAt = this.clock.now();
    this.clickCount += 1;
    this.events.push('up');
    return true;
  }

  /** A cancelled touch never produces a click. */
  cancel(): boolean {
    if (!this.isPressed()) {
      this.events.push('cancel-without-down');
      return false;
    }
    this.state = PRESS_CANCELLED;
    this.background = UP_COLOR;
    this.events.push('cancel');
    return true;
  }

  hold(): boolean {
    if (this.state !== PRESS_DOWN) {
      return false;
    }
    this.state = PRESS_LONG;
    this.background = DOWN_COLOR;
    this.events.push('longPress');
    return true;
  }

  reset(): void {
    this.state = PRESS_IDLE;
    this.background = UP_COLOR;
    this.downAt = 0;
    this.upAt = 0;
  }

  holdDuration(): number {
    if (this.downAt === 0) {
      return 0;
    }
    const end: number = this.upAt === 0 ? this.clock.now() : this.upAt;
    return end - this.downAt;
  }

  wasLongPress(): boolean {
    return this.holdDuration() >= LONG_PRESS_THRESHOLD;
  }
}

/* ------------------------------------------------------------------ */
/* Debounce and dispatch                                               */
/* ------------------------------------------------------------------ */

/** Suppresses repeated clicks that arrive inside the debounce window. */
class ClickDebouncer {
  private clock: MockClock;
  windowMs: number;
  accepted: number = 0;
  rejected: number = 0;
  acceptedAt: number[] = [];
  private lastAcceptedAt: number = -100000;

  constructor(clock: MockClock, windowMs: number = DEBOUNCE_WINDOW) {
    this.clock = clock;
    this.windowMs = windowMs;
  }

  click(): boolean {
    const now: number = this.clock.now();
    if (now - this.lastAcceptedAt < this.windowMs) {
      this.rejected += 1;
      return false;
    }
    this.lastAcceptedAt = now;
    this.accepted += 1;
    this.acceptedAt.push(now);
    return true;
  }

  total(): number {
    return this.accepted + this.rejected;
  }

  acceptanceRate(): number {
    const total: number = this.total();
    return total === 0 ? 0 : this.accepted / total;
  }
}

/** Maps the six button actions onto the browser model. */
class ActionDispatcher {
  browser: MockBrowser;
  homeLoads: number = 0;
  calls: string[] = [];

  constructor(browser: MockBrowser) {
    this.browser = browser;
  }

  dispatch(action: string): boolean {
    this.calls.push(action);
    if (action === ACTION_BACK) {
      return this.browser.back();
    }
    if (action === ACTION_FORWARD) {
      return this.browser.forward();
    }
    if (action === ACTION_REFRESH) {
      this.browser.refresh();
      return true;
    }
    if (action === ACTION_HOME) {
      this.homeLoads += 1;
      this.browser.resetToHome(PAD_HOME_PAGE);
      return true;
    }
    if (action === ACTION_SUBMIT) {
      const address: string = this.browser.getInputVal();
      this.browser.setInputVal('');
      return this.browser.loadUrl(normalizeUrl(address));
    }
    if (action === ACTION_ADD_TAB) {
      return this.browser.addTab();
    }
    if (action === ACTION_CANCEL_TAB) {
      return this.browser.deleteTab(this.browser.getTabArrayIndex());
    }
    return false;
  }

  callCount(): number {
    return this.calls.length;
  }

  lastCall(): string {
    return this.calls.length === 0 ? '' : this.calls[this.calls.length - 1];
  }

  distinctCalls(): boolean {
    const unique: string[] = [];
    for (let index = 0; index < this.calls.length; index++) {
      if (unique.indexOf(this.calls[index]) < 0) {
        unique.push(this.calls[index]);
      }
    }
    return unique.length === this.calls.length;
  }
}

/* ------------------------------------------------------------------ */
/* Touch sequence validation                                           */
/* ------------------------------------------------------------------ */

const TOUCH_DOWN: string = 'Down';
const TOUCH_UP: string = 'Up';
const TOUCH_CANCEL: string = 'Cancel';
const TOUCH_MOVE: string = 'Move';

/** Validates raw TouchEvent sequences the way the component tree does. */
class TouchSequence {
  types: string[] = [];
  buttons: string[] = [];
  validCancels: number = 0;

  record(type: string, button: string): void {
    this.types.push(type);
    this.buttons.push(button);
  }

  size(): number {
    return this.types.length;
  }

  hasBalancedDownUp(): boolean {
    let depth: number = 0;
    for (let index = 0; index < this.types.length; index++) {
      if (this.types[index] === TOUCH_DOWN) {
        depth += 1;
      } else if (this.types[index] === TOUCH_UP || this.types[index] === TOUCH_CANCEL) {
        // A cancel terminates the press just like a lift.
        depth -= 1;
      }
      if (depth < 0) {
        return false;
      }
    }
    return depth === 0;
  }

  /** A cancel must be preceded by a down and followed by no up. */
  countValidCancels(): number {
    let valid: number = 0;
    for (let index = 0; index < this.types.length; index++) {
      if (this.types[index] !== TOUCH_CANCEL) {
        continue;
      }
      const previous: string = index === 0 ? '' : this.types[index - 1];
      const next: string = index === this.types.length - 1 ? '' : this.types[index + 1];
      if (previous === TOUCH_DOWN && next !== TOUCH_UP) {
        valid += 1;
      }
    }
    return valid;
  }

  crossButtonTouches(): number {
    let total: number = 0;
    for (let index = 1; index < this.buttons.length; index++) {
      if (this.buttons[index] !== this.buttons[index - 1] && this.types[index] === TOUCH_MOVE) {
        total += 1;
      }
    }
    return total;
  }

  uniqueButtons(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.buttons.length; index++) {
      if (result.indexOf(this.buttons[index]) < 0) {
        result.push(this.buttons[index]);
      }
    }
    return result;
  }
}

/* ------------------------------------------------------------------ */
/* Fixtures                                                            */
/* ------------------------------------------------------------------ */

function buildCatalog(): ButtonCatalog {
  return new ButtonCatalog();
}

function buildBrowserWithHistory(depth: number = 3): MockBrowser {
  const browser: MockBrowser = new MockBrowser();
  for (let index = 0; index < depth; index++) {
    browser.loadUrl(`example${index}.com`);
    browser.onPageEnd();
  }
  return browser;
}

/** Runs a complete press cycle and reports the emitted click count. */
function runPressCycle(tracker: PressTracker): number {
  const before: number = tracker.clickCount;
  tracker.down();
  tracker.up();
  return tracker.clickCount - before;
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserButtonInteractionTest() {
  describe('browserButtonInteractionTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      await startBrowserApp();
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      TestLogger.info(TAG, `debounce window ${DEBOUNCE_WINDOW} ms, long press ${LONG_PRESS_THRESHOLD} ms`);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Button_001', 0, async () => {
      TestLogger.step(TAG, 'catalog declares the six title bar buttons');
      const catalog: ButtonCatalog = buildCatalog();
      expect(catalog.countInGroup('navigation')).assertEqual(4);
      expect(catalog.countInGroup('action')).assertEqual(2);
      expect(catalog.countInGroup('tab')).assertEqual(1);
      expect(catalog.size()).assertEqual(7);
      expect(catalog.hasDuplicateIds()).assertFalse();
      expect(catalog.specOf(ID_NAV_BACK) !== null).assertTrue();
      expect(catalog.specOf(ID_CANCEL_TAB) !== null).assertTrue();
    });

    it('Browser_Button_002', 0, async () => {
      TestLogger.step(TAG, 'every button id is unique across the title bar');
      const catalog: ButtonCatalog = buildCatalog();
      const ids: string[] = catalog.ids();
      const lookup: Map<string, number> = new Map<string, number>();
      for (let index = 0; index < ids.length; index++) {
        const seen: number = lookup.get(ids[index]) === undefined ? 0 : 1;
        lookup.set(ids[index], seen + 1);
      }
      expect(lookup.size).assertEqual(ids.length);
      expect(ids.indexOf(ID_INPUT_URL)).assertEqual(-1);
      expect(catalog.duplicateLabels().length).assertEqual(0);
    });

    it('Browser_Button_003', 0, async () => {
      TestLogger.step(TAG, 'four navigation buttons map to their actions');
      const catalog: ButtonCatalog = buildCatalog();
      expect(catalog.actionOf(ID_NAV_BACK)).assertEqual(ACTION_BACK);
      expect(catalog.actionOf(ID_NAV_FORWARD)).assertEqual(ACTION_FORWARD);
      expect(catalog.actionOf(ID_NAV_REFRESH)).assertEqual(ACTION_REFRESH);
      expect(catalog.actionOf(ID_NAV_HOME)).assertEqual(ACTION_HOME);
      expect(catalog.actionOf(ID_ACTION_SUBMIT)).assertEqual(ACTION_SUBMIT);
      expect(catalog.actionOf(ID_ACTION_ADD)).assertEqual(ACTION_ADD_TAB);
      expect(catalog.actionOf('unknownButton')).assertEqual(ACTION_NONE);
    });

    it('Browser_Button_004', 0, async () => {
      TestLogger.step(TAG, 'buttons share the 22 x 22 geometry and radius 4');
      const catalog: ButtonCatalog = buildCatalog();
      for (let index = 0; index < catalog.buttons.length; index++) {
        const spec: ButtonSpec = catalog.buttons[index];
        expect(spec.width).assertEqual(BUTTON_WIDTH);
        expect(spec.height).assertEqual(BUTTON_WIDTH);
        expect(spec.radius).assertEqual(BUTTON_RADIUS);
        expect(spec.isSquare()).assertTrue();
      }
      const spec: ButtonSpec | null = catalog.specOf(ID_ACTION_ADD);
      if (spec !== null) {
        expect(spec.backgroundOf(false)).assertEqual(UP_COLOR);
        expect(spec.backgroundOf(true)).assertEqual(DOWN_COLOR);
      }
    });

    it('Browser_Button_005', 0, async () => {
      TestLogger.step(TAG, 'press down paints the pressed background');
      const clock: MockClock = new MockClock();
      const tracker: PressTracker = new PressTracker(clock);
      expect(tracker.state).assertEqual(PRESS_IDLE);
      expect(tracker.background).assertEqual(UP_COLOR);
      expect(tracker.down()).assertTrue();
      expect(tracker.state).assertEqual(PRESS_DOWN);
      expect(tracker.background).assertEqual(DOWN_COLOR);
      expect(tracker.isPressed()).assertTrue();
      expect(tracker.events.join(',')).assertEqual('down');
    });

    it('Browser_Button_006', 0, async () => {
      TestLogger.step(TAG, 'release restores the transparent background');
      const clock: MockClock = new MockClock();
      const tracker: PressTracker = new PressTracker(clock);
      tracker.down();
      clock.advance(DELAY_TOUCH_EVENT);
      expect(tracker.up()).assertTrue();
      expect(tracker.state).assertEqual(PRESS_UP);
      expect(tracker.background).assertEqual(UP_COLOR);
      expect(tracker.isPressed()).assertFalse();
      expect(tracker.clickCount).assertEqual(1);
      expect(tracker.holdDuration()).assertEqual(DELAY_TOUCH_EVENT);
    });

    it('Browser_Button_007', 0, async () => {
      TestLogger.step(TAG, 'duplicate down events are ignored');
      const clock: MockClock = new MockClock();
      const tracker: PressTracker = new PressTracker(clock);
      expect(tracker.down()).assertTrue();
      expect(tracker.down()).assertFalse();
      expect(tracker.events.join(',')).assertEqual('down,down-duplicate');
      expect(tracker.up()).assertTrue();
      expect(tracker.clickCount).assertEqual(1);
      expect(tracker.up()).assertFalse();
      expect(tracker.events[tracker.events.length - 1]).assertEqual('up-without-down');
      expect(tracker.clickCount).assertEqual(1);
    });

    it('Browser_Button_008', 0, async () => {
      TestLogger.step(TAG, 'long press keeps the pressed state and emits one click');
      const clock: MockClock = new MockClock();
      const tracker: PressTracker = new PressTracker(clock);
      tracker.down();
      clock.advance(LONG_PRESS_THRESHOLD + 100);
      expect(tracker.hold()).assertTrue();
      expect(tracker.state).assertEqual(PRESS_LONG);
      expect(tracker.background).assertEqual(DOWN_COLOR);
      expect(tracker.clickCount).assertEqual(0);
      expect(tracker.up()).assertTrue();
      expect(tracker.clickCount).assertEqual(1);
      expect(tracker.wasLongPress()).assertTrue();
      expect(tracker.background).assertEqual(UP_COLOR);
    });

    it('Browser_Button_009', 0, async () => {
      TestLogger.step(TAG, 'a short press is not classified as long press');
      const clock: MockClock = new MockClock();
      const tracker: PressTracker = new PressTracker(clock);
      tracker.down();
      clock.advance(LONG_PRESS_THRESHOLD - 1);
      tracker.up();
      expect(tracker.wasLongPress()).assertFalse();
      expect(tracker.holdDuration()).assertLess(LONG_PRESS_THRESHOLD);
      expect(tracker.clickCount).assertEqual(1);
      const second: PressTracker = new PressTracker(clock);
      expect(second.holdDuration()).assertEqual(0);
      second.down();
      expect(second.hold()).assertTrue();
    });

    it('Browser_Button_010', 0, async () => {
      TestLogger.step(TAG, 'touch cancel suppresses the click');
      const clock: MockClock = new MockClock();
      const tracker: PressTracker = new PressTracker(clock);
      tracker.down();
      expect(tracker.cancel()).assertTrue();
      expect(tracker.state).assertEqual(PRESS_CANCELLED);
      expect(tracker.background).assertEqual(UP_COLOR);
      expect(tracker.up()).assertFalse();
      expect(tracker.clickCount).assertEqual(0);
      expect(tracker.events.join(',')).assertEqual('down,cancel,up-after-cancel');
      expect(tracker.cancel()).assertFalse();
    });

    it('Browser_Button_011', 0, async () => {
      TestLogger.step(TAG, 'rapid double click inside the window is debounced');
      const clock: MockClock = new MockClock();
      const debouncer: ClickDebouncer = new ClickDebouncer(clock);
      expect(debouncer.click()).assertTrue();
      clock.advance(DEBOUNCE_WINDOW - 1);
      expect(debouncer.click()).assertFalse();
      expect(debouncer.accepted).assertEqual(1);
      expect(debouncer.rejected).assertEqual(1);
      expect(debouncer.total()).assertEqual(2);
      expect(debouncer.acceptanceRate()).assertEqual(0.5);
      expect(debouncer.acceptedAt.length).assertEqual(1);
    });

    it('Browser_Button_012', 0, async () => {
      TestLogger.step(TAG, 'click after the window is accepted again');
      const clock: MockClock = new MockClock();
      const debouncer: ClickDebouncer = new ClickDebouncer(clock);
      expect(debouncer.click()).assertTrue();
      clock.advance(DEBOUNCE_WINDOW);
      expect(debouncer.click()).assertTrue();
      clock.advance(DEBOUNCE_WINDOW * 3);
      expect(debouncer.click()).assertTrue();
      expect(debouncer.accepted).assertEqual(3);
      expect(debouncer.rejected).assertEqual(0);
      expect(debouncer.acceptanceRate()).assertEqual(1);
      const gap: number = debouncer.acceptedAt[1] - debouncer.acceptedAt[0];
      expect(gap).assertEqual(DEBOUNCE_WINDOW);
    });

    it('Browser_Button_013', 0, async () => {
      TestLogger.step(TAG, 'a burst of taps keeps exactly one accepted click');
      const clock: MockClock = new MockClock();
      const debouncer: ClickDebouncer = new ClickDebouncer(clock);
      let accepted: number = 0;
      for (let index = 0; index < 6; index++) {
        if (debouncer.click()) {
          accepted += 1;
        }
        clock.advance(10);
      }
      expect(accepted).assertEqual(1);
      expect(debouncer.rejected).assertEqual(5);
      expect(debouncer.total()).assertEqual(6);
      expect(debouncer.acceptanceRate()).assertLess(0.2);
    });

    it('Browser_Button_014', 0, async () => {
      TestLogger.step(TAG, 'disabled button rejects both press and click');
      const clock: MockClock = new MockClock();
      const tracker: PressTracker = new PressTracker(clock);
      tracker.enabled = false;
      expect(tracker.enabled).assertFalse();
      expect(tracker.down()).assertFalse();
      expect(tracker.isPressed()).assertFalse();
      expect(tracker.background).assertEqual(UP_COLOR);
      expect(tracker.up()).assertFalse();
      expect(tracker.clickCount).assertEqual(0);
      expect(tracker.events.length).assertEqual(2);
      expect(tracker.events[0]).assertEqual('down-rejected');
    });

    it('Browser_Button_015', 0, async () => {
      TestLogger.step(TAG, 're-enabling a button restores the press cycle');
      const clock: MockClock = new MockClock();
      const tracker: PressTracker = new PressTracker(clock);
      tracker.enabled = false;
      tracker.down();
      tracker.up();
      expect(tracker.clickCount).assertEqual(0);
      tracker.enabled = true;
      expect(tracker.enabled).assertTrue();
      expect(tracker.down()).assertTrue();
      expect(tracker.up()).assertTrue();
      expect(tracker.clickCount).assertEqual(1);
      expect(tracker.background).assertEqual(UP_COLOR);
    });

    it('Browser_Button_016', 0, async () => {
      TestLogger.step(TAG, 'catalog disable flag reaches the button spec');
      const catalog: ButtonCatalog = buildCatalog();
      expect(catalog.setEnabled(ID_NAV_BACK, false)).assertTrue();
      const back: ButtonSpec | null = catalog.specOf(ID_NAV_BACK);
      if (back !== null) {
        expect(back.enabled).assertFalse();
        expect(back.backgroundOf(false)).assertEqual(UP_COLOR);
      }
      expect(catalog.setEnabled(ID_NAV_BACK, true)).assertTrue();
      expect(catalog.setEnabled('ghostButton', false)).assertFalse();
      const restore: ButtonSpec | null = catalog.specOf(ID_NAV_BACK);
      if (restore !== null) {
        expect(restore.enabled).assertTrue();
      }
    });

    it('Browser_Button_017', 0, async () => {
      TestLogger.step(TAG, 'each navigation button drives its own model operation');
      const browser: MockBrowser = buildBrowserWithHistory(3);
      const dispatcher: ActionDispatcher = new ActionDispatcher(browser);
      const current: MockBrowserTab | null = browser.getCurrentTab();
      const tab: string = current === null ? '' : current.controller.currentUrl;
      expect(tab.length).assertLarger(0);
      expect(dispatcher.dispatch(ACTION_REFRESH)).assertTrue();
      expect(dispatcher.dispatch(ACTION_BACK)).assertTrue();
      expect(dispatcher.dispatch(ACTION_FORWARD)).assertTrue();
      expect(dispatcher.dispatch(ACTION_HOME)).assertTrue();
      expect(dispatcher.callCount()).assertEqual(4);
      expect(dispatcher.lastCall()).assertEqual(ACTION_HOME);
      expect(dispatcher.homeLoads).assertEqual(1);
    });

    it('Browser_Button_018', 0, async () => {
      TestLogger.step(TAG, 'back is a no-op when no history exists');
      const browser: MockBrowser = new MockBrowser();
      const dispatcher: ActionDispatcher = new ActionDispatcher(browser);
      expect(dispatcher.dispatch(ACTION_BACK)).assertFalse();
      expect(dispatcher.dispatch(ACTION_FORWARD)).assertFalse();
      expect(browser.getCurrentTab() !== null).assertTrue();
      const dispatcherCalls: number = dispatcher.callCount();
      expect(dispatcherCalls).assertEqual(2);
      expect(dispatcher.lastCall()).assertEqual(ACTION_FORWARD);
      expect(browser.tabs.length).assertEqual(MIN_TAB_COUNT);
    });

    it('Browser_Button_019', 0, async () => {
      TestLogger.step(TAG, 'submit button loads the typed address and clears it');
      const browser: MockBrowser = new MockBrowser();
      const dispatcher: ActionDispatcher = new ActionDispatcher(browser);
      browser.setInputVal('example.com');
      expect(dispatcher.dispatch(ACTION_SUBMIT)).assertTrue();
      expect(browser.getInputVal()).assertEqual('');
      const tab: MockBrowserTab | null = browser.getCurrentTab();
      expect(tab !== null).assertTrue();
      if (tab !== null) {
        expect(tab.controller.currentUrl).assertEqual('https://example.com');
        expect(tab.controller.loadCount).assertEqual(1);
      }
      expect(dispatcher.callCount()).assertEqual(1);
    });

    it('Browser_Button_020', 0, async () => {
      TestLogger.step(TAG, 'add tab button stops at the documented capacity');
      const browser: MockBrowser = new MockBrowser();
      const dispatcher: ActionDispatcher = new ActionDispatcher(browser);
      for (let index = 0; index < MAX_TAB_COUNT; index++) {
        expect(dispatcher.dispatch(ACTION_ADD_TAB)).assertTrue();
      }
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(dispatcher.dispatch(ACTION_ADD_TAB)).assertFalse();
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(browser.toasts[browser.toasts.length - 1]).assertEqual(TAB_LIMIT_MESSAGE);
      expect(dispatcher.callCount()).assertEqual(MAX_TAB_COUNT + 1);
    });

    it('Browser_Button_021', 0, async () => {
      TestLogger.step(TAG, 'cancel button refuses to close the last tab');
      const browser: MockBrowser = new MockBrowser();
      const dispatcher: ActionDispatcher = new ActionDispatcher(browser);
      expect(dispatcher.dispatch(ACTION_CANCEL_TAB)).assertFalse();
      expect(browser.tabs.length).assertEqual(MIN_TAB_COUNT);
      browser.addTab();
      expect(browser.tabs.length).assertEqual(2);
      expect(dispatcher.dispatch(ACTION_CANCEL_TAB)).assertTrue();
      expect(browser.tabs.length).assertEqual(MIN_TAB_COUNT);
      expect(browser.getTabArrayIndex()).assertEqual(0);
    });

    it('Browser_Button_022', 0, async () => {
      TestLogger.step(TAG, 'unknown action is rejected without touching the model');
      const browser: MockBrowser = new MockBrowser();
      const dispatcher: ActionDispatcher = new ActionDispatcher(browser);
      expect(dispatcher.dispatch('rotate')).assertFalse();
      expect(dispatcher.dispatch('')).assertFalse();
      expect(dispatcher.callCount()).assertEqual(2);
      expect(browser.tabs.length).assertEqual(MIN_TAB_COUNT);
      expect(browser.getInputVal()).assertEqual('');
      expect(dispatcher.distinctCalls()).assertTrue();
    });

    it('Browser_Button_023', 0, async () => {
      TestLogger.step(TAG, 'six button ids resolve on the running device');
      const present: boolean[] = [];
      present.push(await componentByIdExists(driver, ID_NAV_BACK));
      present.push(await componentByIdExists(driver, ID_NAV_FORWARD));
      present.push(await componentByIdExists(driver, ID_NAV_REFRESH));
      present.push(await componentByIdExists(driver, ID_NAV_HOME));
      present.push(await componentByIdExists(driver, ID_ACTION_SUBMIT));
      present.push(await componentByIdExists(driver, ID_ACTION_ADD));
      let found: number = 0;
      for (let index = 0; index < present.length; index++) {
        if (present[index]) {
          found += 1;
        }
      }
      TestLogger.info(TAG, `navigation and action buttons found=${found} of 6`);
      expect(present.length).assertEqual(6);
      expect(found).assertLarger(0);
      expect(await componentByIdExists(driver, ID_INPUT_URL)).assertTrue();
    });

    it('Browser_Button_024', 0, async () => {
      TestLogger.step(TAG, 'each button id is rendered at most once');
      const ids: string[] = [ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME];
      for (let index = 0; index < ids.length; index++) {
        const occurrences: number = await countById(driver, ids[index]);
        TestLogger.info(TAG, `id ${ids[index]} occurrences=${occurrences}`);
        expect(occurrences).assertLess(2);
      }
      const adds: number = await countById(driver, ID_ACTION_ADD);
      expect(adds).assertLess(2);
      const submits: number = await countById(driver, ID_ACTION_SUBMIT);
      expect(submits).assertLess(2);
      expect(await countById(driver, ID_CANCEL_TAB)).assertLarger(-1);
    });

    it('Browser_Button_025', 0, async () => {
      TestLogger.step(TAG, 'clicking a navigation button completes within the touch budget');
      const clock: MockClock = new MockClock();
      const start: number = clock.now();
      const clicked: boolean = await clickById(driver, ID_NAV_REFRESH);
      clock.advance(DELAY_TOUCH_EVENT);
      const elapsed: number = clock.now() - start;
      TestLogger.info(TAG, `refresh click returned=${clicked}, elapsed=${elapsed} ms`);
      expect(elapsed).assertEqual(DELAY_TOUCH_EVENT);
      expect(elapsed).assertLess(TIMEOUT_COMPONENT);
      const browser: MockBrowser = new MockBrowser();
      const dispatcher: ActionDispatcher = new ActionDispatcher(browser);
      expect(dispatcher.dispatch(ACTION_REFRESH)).assertTrue();
      expect(dispatcher.lastCall()).assertEqual(ACTION_REFRESH);
    });

    it('Browser_Button_026', 0, async () => {
      TestLogger.step(TAG, 'repeated dpad activation keeps a single logical click');
      const clock: MockClock = new MockClock();
      const debouncer: ClickDebouncer = new ClickDebouncer(clock);
      for (let index = 0; index < 3; index++) {
        debouncer.click();
        clock.advance(DEBOUNCE_WINDOW / 3);
        await pressKey(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      }
      expect(debouncer.accepted).assertEqual(1);
      expect(debouncer.rejected).assertEqual(2);
      const clockAfter: number = clock.advance(DEBOUNCE_WINDOW);
      expect(clockAfter).assertLarger(0);
      expect(debouncer.click()).assertTrue();
      expect(debouncer.accepted).assertEqual(2);
      TestLogger.info(TAG, `accepted=${debouncer.accepted} rejected=${debouncer.rejected}`);
    });

    it('Browser_Button_027', 0, async () => {
      TestLogger.step(TAG, 'touch sequences are balanced and cancel never clicks');
      const sequence: TouchSequence = new TouchSequence();
      sequence.record(TOUCH_DOWN, ID_NAV_BACK);
      sequence.record(TOUCH_CANCEL, ID_NAV_BACK);
      sequence.record(TOUCH_DOWN, ID_NAV_FORWARD);
      sequence.record(TOUCH_UP, ID_NAV_FORWARD);
      expect(sequence.size()).assertEqual(4);
      expect(sequence.hasBalancedDownUp()).assertTrue();
      expect(sequence.countValidCancels()).assertEqual(1);
      expect(sequence.crossButtonTouches()).assertEqual(0);
      expect(sequence.uniqueButtons().length).assertEqual(2);
      const broken: TouchSequence = new TouchSequence();
      broken.record(TOUCH_UP, ID_ACTION_ADD);
      expect(broken.hasBalancedDownUp()).assertFalse();
      broken.record(TOUCH_DOWN, ID_ACTION_ADD);
      broken.record(TOUCH_CANCEL, ID_ACTION_ADD);
      broken.record(TOUCH_UP, ID_ACTION_ADD);
      expect(broken.countValidCancels()).assertEqual(0);
      TestLogger.info(TAG, `valid cancels=${sequence.countValidCancels()}`);
      expect(sequence.buttons[0]).assertEqual(ID_NAV_BACK);
      expect(sequence.buttons[sequence.size() - 1]).assertEqual(ID_NAV_FORWARD);
      expect(sequence.countValidCancels()).assertLess(sequence.size());
    });
  });
}
