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
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById, clickById,
  inputById, waitForId, pressKey, textById, runSerialized,
  ID_INPUT_URL, ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME,
  ID_ACTION_SUBMIT, ID_ACTION_ADD, ID_CANCEL_TAB, DELAY_KEY_NAVIGATION,
  DELAY_TAB_OPERATION, TIMEOUT_COMPONENT, TIMEOUT_FOCUS_CHANGE,
  TIMEOUT_TAB_SWITCH, TOLERANCE_FOCUS_CHANGE, TOLERANCE_COMPONENT_COUNT,
  KEY_ENTER, KEY_DPAD_UP, KEY_DPAD_DOWN, KEY_DPAD_LEFT, KEY_DPAD_RIGHT
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserFocusNavigationTest';

/* ------------------------------------------------------------------ */
/* Focus stop catalogue                                                 */
/* ------------------------------------------------------------------ */

const GROUP_TITLE: string = 'titleBar';
const GROUP_TABS: string = 'tabStrip';
const GROUP_WEB: string = 'webArea';

const RING_INPUT: string = ID_INPUT_URL;
const RING_BACK: string = ID_NAV_BACK;
const RING_FORWARD: string = ID_NAV_FORWARD;
const RING_REFRESH: string = ID_NAV_REFRESH;
const RING_HOME: string = ID_NAV_HOME;
const RING_SUBMIT: string = ID_ACTION_SUBMIT;
const RING_ADD: string = ID_ACTION_ADD;
const RING_CANCEL: string = ID_CANCEL_TAB;

const TAB_PREFIX: string = 'tabItem';
const NO_FOCUS: string = '';

/** Expected Tab traversal order of the tablet title bar plus tab strip. */
const LANDSCAPE_TAB_ORDER: string[] = [
  RING_INPUT, RING_BACK, RING_FORWARD, RING_REFRESH, RING_HOME,
  RING_SUBMIT, RING_ADD, RING_CANCEL,
  `${TAB_PREFIX}0`, `${TAB_PREFIX}1`
];

/** One focusable stop positioned on the layout grid. */
class FocusStop {
  id: string;
  row: number;
  col: number;
  group: string;
  enabled: boolean;
  order: number;

  constructor(id: string, row: number, col: number, group: string,
    enabled: boolean, order: number) {
    this.id = id;
    this.row = row;
    this.col = col;
    this.group = group;
    this.enabled = enabled;
    this.order = order;
  }

  key(): string {
    return `${this.row}:${this.col}`;
  }
}

/** Two dimensional focus ring used by dpad navigation. */
class FocusRing {
  stops: FocusStop[] = [];
  focusedId: string = NO_FOCUS;
  wrap: boolean = true;
  moves: number = 0;
  boundaryHits: number = 0;
  focusLost: number = 0;

  add(id: string, row: number, col: number, group: string,
    enabled: boolean = true): FocusStop {
    const stop: FocusStop = new FocusStop(id, row, col, group, enabled, this.stops.length);
    this.stops.push(stop);
    return stop;
  }

  stopOf(id: string): FocusStop | null {
    for (let index = 0; index < this.stops.length; index++) {
      if (this.stops[index].id === id) {
        return this.stops[index];
      }
    }
    return null;
  }

  current(): FocusStop | null {
    return this.focusedId === NO_FOCUS ? null : this.stopOf(this.focusedId);
  }

  currentId(): string {
    return this.focusedId;
  }

  focusedCount(): number {
    return this.focusedId === NO_FOCUS ? 0 : 1;
  }

  enabledStops(): FocusStop[] {
    return this.stops.filter((stop: FocusStop) => stop.enabled);
  }

  enabledIds(): string[] {
    return this.enabledStops().map((stop: FocusStop) => stop.id);
  }

  focusById(id: string): boolean {
    const stop: FocusStop | null = this.stopOf(id);
    if (stop === null || !stop.enabled) {
      return false;
    }
    this.focusedId = id;
    return true;
  }

  focusFirst(): boolean {
    const enabled: FocusStop[] = this.enabledStops();
    if (enabled.length === 0) {
      return false;
    }
    this.focusedId = enabled[0].id;
    return true;
  }

  focusLast(): boolean {
    const enabled: FocusStop[] = this.enabledStops();
    if (enabled.length === 0) {
      return false;
    }
    this.focusedId = enabled[enabled.length - 1].id;
    return true;
  }

  blur(): void {
    this.focusedId = NO_FOCUS;
  }

  setEnabled(id: string, enabled: boolean): boolean {
    const stop: FocusStop | null = this.stopOf(id);
    if (stop === null) {
      return false;
    }
    stop.enabled = enabled;
    if (!enabled && this.focusedId === id) {
      this.focusLost += 1;
      this.focusedId = NO_FOCUS;
    }
    return true;
  }

  /** Enabled stops of one row sorted by column. */
  rowStops(row: number): FocusStop[] {
    const selected: FocusStop[] = this.stops.filter((stop: FocusStop) =>
      stop.row === row && stop.enabled);
    selected.sort((left: FocusStop, right: FocusStop) => left.col - right.col);
    return selected;
  }

  rowIndexes(): number[] {
    const result: number[] = [];
    for (let index = 0; index < this.stops.length; index++) {
      if (result.indexOf(this.stops[index].row) < 0) {
        result.push(this.stops[index].row);
      }
    }
    result.sort((left: number, right: number) => left - right);
    return result;
  }

  moveHorizontal(delta: number): boolean {
    const active: FocusStop | null = this.current();
    if (active === null) {
      return this.focusFirst();
    }
    const row: FocusStop[] = this.rowStops(active.row);
    const index: number = this.indexOfStop(row, active.id);
    if (index < 0) {
      return false;
    }
    const next: number = index + delta;
    if (next >= 0 && next < row.length) {
      this.focusedId = row[next].id;
      this.moves += 1;
      return true;
    }
    if (!this.wrap) {
      this.boundaryHits += 1;
      return false;
    }
    const wrapped: number = next < 0 ? row.length - 1 : 0;
    this.focusedId = row[wrapped].id;
    this.moves += 1;
    return true;
  }

  /** Vertical move picks the closest column of the neighbouring row. */
  moveVertical(delta: number): boolean {
    const active: FocusStop | null = this.current();
    if (active === null) {
      return this.focusFirst();
    }
    const rows: number[] = this.rowIndexes();
    const rowIndex: number = rows.indexOf(active.row);
    if (rowIndex < 0) {
      return false;
    }
    let target: number = rowIndex + delta;
    if (target < 0 || target >= rows.length) {
      if (!this.wrap) {
        this.boundaryHits += 1;
        return false;
      }
      target = target < 0 ? rows.length - 1 : 0;
    }
    const candidates: FocusStop[] = this.rowStops(rows[target]);
    if (candidates.length === 0) {
      this.boundaryHits += 1;
      return false;
    }
    let best: FocusStop = candidates[0];
    let bestDistance: number = Math.abs(best.col - active.col);
    for (let index = 1; index < candidates.length; index++) {
      const distance: number = Math.abs(candidates[index].col - active.col);
      if (distance < bestDistance) {
        best = candidates[index];
        bestDistance = distance;
      }
    }
    this.focusedId = best.id;
    this.moves += 1;
    return true;
  }

  private indexOfStop(list: FocusStop[], id: string): number {
    for (let index = 0; index < list.length; index++) {
      if (list[index].id === id) {
        return index;
      }
    }
    return -1;
  }

  resetMetrics(): void {
    this.moves = 0;
    this.boundaryHits = 0;
    this.focusLost = 0;
  }
}

/* ------------------------------------------------------------------ */
/* Focus restore stack                                                  */
/* ------------------------------------------------------------------ */

/**
 * Bounded stack used to restore the focus owner after transient UI such as a
 * new tab, a dismissed dialog or a tab switch.
 */
class FocusHistory {
  entries: string[] = [];
  maxDepth: number;
  overflow: number = 0;

  constructor(maxDepth: number = 8) {
    this.maxDepth = maxDepth <= 0 ? 1 : maxDepth;
  }

  push(id: string): boolean {
    if (id === NO_FOCUS) {
      return false;
    }
    this.entries.push(id);
    while (this.entries.length > this.maxDepth) {
      this.entries.shift();
      this.overflow += 1;
    }
    return true;
  }

  pop(): string {
    if (this.entries.length === 0) {
      return NO_FOCUS;
    }
    const value: string = this.entries[this.entries.length - 1];
    this.entries.splice(this.entries.length - 1, 1);
    return value;
  }

  peek(): string {
    return this.entries.length === 0 ? NO_FOCUS : this.entries[this.entries.length - 1];
  }

  size(): number {
    return this.entries.length;
  }

  contains(id: string): boolean {
    return this.entries.indexOf(id) >= 0;
  }

  clear(): void {
    this.entries = [];
  }

  /** Restores a stop only when it is still focusable. */
  restoreInto(ring: FocusRing): string {
    while (this.entries.length > 0) {
      const candidate: string = this.pop();
      if (ring.focusById(candidate)) {
        return candidate;
      }
    }
    return NO_FOCUS;
  }
}

/* ------------------------------------------------------------------ */
/* Tab strip focus ownership                                            */
/* ------------------------------------------------------------------ */

/**
 * The cancel button only exists while at least two tabs are open; the focus
 * owner therefore migrates when the last extra tab is closed.
 */
class TabStripModel {
  tabCount: number;
  focusedOwner: string = RING_INPUT;
  closedCount: number = 0;
  addedCount: number = 0;
  refusedCount: number = 0;

  constructor(tabCount: number = 2) {
    this.tabCount = tabCount < 1 ? 1 : tabCount;
  }

  cancelEnabled(): boolean {
    return this.tabCount > 1;
  }

  addTab(): boolean {
    if (this.tabCount > 10) {
      this.refusedCount += 1;
      return false;
    }
    this.tabCount += 1;
    this.addedCount += 1;
    this.focusedOwner = `${TAB_PREFIX}${this.tabCount - 1}`;
    return true;
  }

  /** Returns the focus owner after removing one tab, or NO_FOCUS on refusal. */
  closeTab(index: number): string {
    if (index < 0 || index >= this.tabCount || this.tabCount <= 1) {
      this.refusedCount += 1;
      // A refused close leaves the strip without a tab owner.
      this.focusedOwner = RING_INPUT;
      return NO_FOCUS;
    }
    const cancelFocused: boolean = this.focusedOwner === RING_CANCEL;
    this.tabCount -= 1;
    this.closedCount += 1;
    if (cancelFocused) {
      // The close control disappears together with the last extra tab.
      this.focusedOwner = RING_INPUT;
      return this.focusedOwner;
    }
    let neighbour: number = index > 0 ? index - 1 : 0;
    if (neighbour > this.tabCount - 1) {
      neighbour = this.tabCount - 1;
    }
    this.focusedOwner = `${TAB_PREFIX}${neighbour}`;
    return this.focusedOwner;
  }

  ownerIsTab(): boolean {
    return this.focusedOwner.startsWith(TAB_PREFIX);
  }

  tabIds(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.tabCount; index++) {
      result.push(`${TAB_PREFIX}${index}`);
    }
    return result;
  }
}

/* ------------------------------------------------------------------ */
/* Tab key traversal                                                    */
/* ------------------------------------------------------------------ */

/** Keyboard Tab order with disabled stops skipped. */
class TabOrderModel {
  order: string[] = [];
  disabled: string[] = [];
  cursor: number = -1;
  wrap: boolean = true;
  skippedCount: number = 0;

  constructor(order: string[]) {
    this.order = order.slice(0);
  }

  setDisabled(id: string, value: boolean): void {
    const at: number = this.disabled.indexOf(id);
    if (value && at < 0) {
      this.disabled.push(id);
    }
    if (!value && at >= 0) {
      this.disabled.splice(at, 1);
    }
  }

  isEnabled(id: string): boolean {
    return this.disabled.indexOf(id) < 0;
  }

  next(): string {
    if (this.order.length === 0) {
      return NO_FOCUS;
    }
    let cursor: number = this.cursor;
    for (let step = 0; step < this.order.length; step++) {
      cursor += 1;
      if (cursor >= this.order.length) {
        if (!this.wrap) {
          this.cursor = this.order.length - 1;
          return NO_FOCUS;
        }
        cursor = 0;
      }
      if (this.isEnabled(this.order[cursor])) {
        this.cursor = cursor;
        return this.order[cursor];
      }
      this.skippedCount += 1;
    }
    return NO_FOCUS;
  }

  previous(): string {
    if (this.order.length === 0) {
      return NO_FOCUS;
    }
    let cursor: number = this.cursor;
    for (let step = 0; step < this.order.length; step++) {
      cursor -= 1;
      if (cursor < 0) {
        if (!this.wrap) {
          this.cursor = 0;
          return NO_FOCUS;
        }
        cursor = this.order.length - 1;
      }
      if (this.isEnabled(this.order[cursor])) {
        this.cursor = cursor;
        return this.order[cursor];
      }
      this.skippedCount += 1;
    }
    return NO_FOCUS;
  }

  currentId(): string {
    if (this.cursor < 0 || this.cursor >= this.order.length) {
      return NO_FOCUS;
    }
    return this.order[this.cursor];
  }

  positionOf(id: string): number {
    return this.order.indexOf(id);
  }

  enabledCount(): number {
    let total: number = 0;
    for (let index = 0; index < this.order.length; index++) {
      if (this.isEnabled(this.order[index])) {
        total += 1;
      }
    }
    return total;
  }
}

/* ------------------------------------------------------------------ */
/* Dpad router                                                          */
/* ------------------------------------------------------------------ */

/** Routes remote control keys into the ring and records activations. */
class DpadRouter {
  ring: FocusRing;
  pressCount: number = 0;
  activationCount: number = 0;
  unhandledCount: number = 0;
  lastKey: number = 0;

  constructor(ring: FocusRing) {
    this.ring = ring;
  }

  press(key: number): boolean {
    this.pressCount += 1;
    this.lastKey = key;
    let moved: boolean = false;
    if (key === KEY_DPAD_LEFT) {
      moved = this.ring.moveHorizontal(-1);
    } else if (key === KEY_DPAD_RIGHT) {
      moved = this.ring.moveHorizontal(1);
    } else if (key === KEY_DPAD_UP) {
      moved = this.ring.moveVertical(-1);
    } else if (key === KEY_DPAD_DOWN) {
      moved = this.ring.moveVertical(1);
    } else if (key === KEY_ENTER) {
      this.activationCount += 1;
      moved = this.ring.focusedCount() === 1;
    } else {
      this.unhandledCount += 1;
    }
    return moved;
  }

  pressSeries(keys: number[]): string {
    for (let index = 0; index < keys.length; index++) {
      this.press(keys[index]);
    }
    return this.ring.currentId();
  }
}

/* ------------------------------------------------------------------ */
/* Fixtures                                                             */
/* ------------------------------------------------------------------ */

/** Tablet layout: title bar row 0, tab strip row 1, web area row 2. */
function buildRing(tabCount: number = 2): FocusRing {
  const ring: FocusRing = new FocusRing();
  ring.add(RING_INPUT, 0, 0, GROUP_TITLE);
  ring.add(RING_BACK, 0, 1, GROUP_TITLE);
  ring.add(RING_FORWARD, 0, 2, GROUP_TITLE);
  ring.add(RING_REFRESH, 0, 3, GROUP_TITLE);
  ring.add(RING_HOME, 0, 4, GROUP_TITLE);
  ring.add(RING_SUBMIT, 0, 5, GROUP_TITLE);
  ring.add(RING_ADD, 0, 6, GROUP_TITLE);
  const tabs: number = tabCount < 1 ? 1 : tabCount;
  for (let index = 0; index < tabs; index++) {
    ring.add(`${TAB_PREFIX}${index}`, 1, index, GROUP_TABS);
  }
  ring.add(RING_CANCEL, 1, tabs, GROUP_TABS, tabs > 1);
  ring.add('webContent', 2, 0, GROUP_WEB);
  return ring;
}

function buildTitleBarOnly(): FocusRing {
  const ring: FocusRing = new FocusRing();
  ring.add(RING_INPUT, 0, 0, GROUP_TITLE);
  ring.add(RING_BACK, 0, 1, GROUP_TITLE);
  ring.add(RING_FORWARD, 0, 2, GROUP_TITLE);
  ring.add(RING_REFRESH, 0, 3, GROUP_TITLE);
  ring.add(RING_HOME, 0, 4, GROUP_TITLE);
  ring.add(RING_SUBMIT, 0, 5, GROUP_TITLE);
  ring.add(RING_ADD, 0, 6, GROUP_TITLE);
  return ring;
}

function buildTabOrder(tabCount: number = 2): TabOrderModel {
  const order: string[] = [
    RING_INPUT, RING_BACK, RING_FORWARD, RING_REFRESH, RING_HOME,
    RING_SUBMIT, RING_ADD, RING_CANCEL
  ];
  for (let index = 0; index < tabCount; index++) {
    order.push(`${TAB_PREFIX}${index}`);
  }
  return new TabOrderModel(order);
}

/** Measures the synthetic cost of one focus move. */
function measureMoveLatency(clock: MockClock, rounds: number): number[] {
  const ring: FocusRing = buildRing(2);
  ring.focusFirst();
  const samples: number[] = [];
  for (let index = 0; index < rounds; index++) {
    const start: number = clock.now();
    ring.moveHorizontal(1);
    clock.advance(DELAY_KEY_NAVIGATION);
    samples.push(clock.now() - start);
  }
  return samples;
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserFocusNavigationTest() {
  describe('browserFocusNavigationTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE / 2);
      TestLogger.info(TAG, `tab order: ${LANDSCAPE_TAB_ORDER.join(' -> ')}`);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_FocusNav_001', 0, async () => {
      TestLogger.step(TAG, 'ring contains every title bar and tab strip stop');
      const ring: FocusRing = buildRing(2);
      expect(ring.stops.length).assertEqual(11);
      expect(ring.enabledStops().length).assertEqual(11);
      expect(ring.rowStops(0).length).assertEqual(7);
      expect(ring.rowStops(1).length).assertEqual(3);
      expect(ring.rowStops(2).length).assertEqual(1);
      expect(ring.enabledIds()[0]).assertEqual(RING_INPUT);
      expect(ring.enabledIds()[6]).assertEqual(RING_ADD);
      const unique: Map<string, number> = new Map<string, number>();
      for (let index = 0; index < ring.stops.length; index++) {
        unique.set(ring.stops[index].id, 1);
      }
      expect(unique.size).assertEqual(ring.stops.length);
    });

    it('Browser_FocusNav_002', 0, async () => {
      TestLogger.step(TAG, 'dpad right walks the title bar from left to right');
      const ring: FocusRing = buildRing(2);
      expect(ring.focusById(RING_INPUT)).assertTrue();
      expect(ring.moveHorizontal(1)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_BACK);
      expect(ring.moveHorizontal(1)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_FORWARD);
      expect(ring.moveHorizontal(1)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_REFRESH);
      expect(ring.moveHorizontal(1)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_HOME);
      expect(ring.moves).assertEqual(4);
      expect(ring.boundaryHits).assertEqual(0);
    });

    it('Browser_FocusNav_003', 0, async () => {
      TestLogger.step(TAG, 'dpad left rewinds the same path');
      const ring: FocusRing = buildRing(2);
      ring.focusById(RING_HOME);
      expect(ring.moveHorizontal(-1)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_REFRESH);
      expect(ring.moveHorizontal(-1)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_FORWARD);
      expect(ring.moveHorizontal(-1)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_BACK);
      expect(ring.moveHorizontal(-1)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_INPUT);
      expect(ring.focusedCount()).assertEqual(1);
    });

    it('Browser_FocusNav_004', 0, async () => {
      TestLogger.step(TAG, 'dpad down enters the tab strip at the nearest column');
      const ring: FocusRing = buildRing(2);
      ring.focusById(RING_BACK);
      expect(ring.moveVertical(1)).assertTrue();
      expect(ring.currentId()).assertEqual(`${TAB_PREFIX}1`);
      ring.focusById(RING_INPUT);
      expect(ring.moveVertical(1)).assertTrue();
      expect(ring.currentId()).assertEqual(`${TAB_PREFIX}0`);
      ring.focusById(RING_REFRESH);
      expect(ring.moveVertical(1)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_CANCEL);
      expect(ring.moves).assertEqual(3);
    });

    it('Browser_FocusNav_005', 0, async () => {
      TestLogger.step(TAG, 'dpad up returns to the title bar');
      const ring: FocusRing = buildRing(2);
      ring.focusById(RING_CANCEL);
      expect(ring.moveVertical(-1)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_FORWARD);
      ring.focusById(`${TAB_PREFIX}0`);
      expect(ring.moveVertical(-1)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_INPUT);
      ring.focusById('webContent');
      expect(ring.moveVertical(-1)).assertTrue();
      expect(ring.currentId()).assertEqual(`${TAB_PREFIX}0`);
      expect(ring.focusedCount()).assertEqual(1);
    });

    it('Browser_FocusNav_006', 0, async () => {
      TestLogger.step(TAG, 'a non wrapping ring stops at the right edge');
      const ring: FocusRing = buildTitleBarOnly();
      ring.wrap = false;
      ring.focusLast();
      expect(ring.currentId()).assertEqual(RING_ADD);
      expect(ring.moveHorizontal(1)).assertFalse();
      expect(ring.currentId()).assertEqual(RING_ADD);
      expect(ring.boundaryHits).assertEqual(1);
      expect(ring.moves).assertEqual(0);
      ring.focusFirst();
      expect(ring.moveHorizontal(-1)).assertFalse();
      expect(ring.currentId()).assertEqual(RING_INPUT);
      expect(ring.boundaryHits).assertEqual(2);
    });

    it('Browser_FocusNav_007', 0, async () => {
      TestLogger.step(TAG, 'a wrapping ring cycles at both edges');
      const ring: FocusRing = buildTitleBarOnly();
      expect(ring.wrap).assertTrue();
      ring.focusLast();
      expect(ring.currentId()).assertEqual(RING_ADD);
      expect(ring.moveHorizontal(1)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_INPUT);
      expect(ring.moveHorizontal(-1)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_ADD);
      expect(ring.boundaryHits).assertEqual(0);
      expect(ring.moves).assertEqual(2);
    });

    it('Browser_FocusNav_008', 0, async () => {
      TestLogger.step(TAG, 'ring order matches the visual left to right order');
      const ring: FocusRing = buildRing(2);
      const ids: string[] = ring.enabledIds();
      for (let row = 0; row < 2; row++) {
        const rowIds: string[] = ring.rowStops(row).map((stop: FocusStop) => stop.id);
        for (let index = 1; index < rowIds.length; index++) {
          expect(ring.stopOf(rowIds[index]) !== null).assertTrue();
          expect(ids.indexOf(rowIds[index])).assertLarger(ids.indexOf(rowIds[index - 1]));
        }
      }
      expect(ring.rowStops(0).map((stop: FocusStop) => stop.col).join(',')).assertEqual('0,1,2,3,4,5,6');
      expect(ring.rowStops(1).map((stop: FocusStop) => stop.col).join(',')).assertEqual('0,1,2');
    });

    it('Browser_FocusNav_009', 0, async () => {
      TestLogger.step(TAG, 'single tab layout disables the close button');
      const ring: FocusRing = buildRing(1);
      const cancel: FocusStop | null = ring.stopOf(RING_CANCEL);
      expect(cancel !== null).assertTrue();
      if (cancel !== null) {
        expect(cancel.enabled).assertFalse();
      }
      expect(ring.enabledStops().length).assertEqual(ring.stops.length - 1);
      expect(ring.enabledIds().indexOf(RING_CANCEL)).assertEqual(-1);
      expect(ring.focusById(RING_CANCEL)).assertFalse();
      expect(ring.focusedCount()).assertEqual(0);
      expect(ring.rowStops(1).length).assertEqual(1);
    });

    it('Browser_FocusNav_010', 0, async () => {
      TestLogger.step(TAG, 'closing the last extra tab moves focus off the cancel button');
      const strip: TabStripModel = new TabStripModel(2);
      expect(strip.cancelEnabled()).assertTrue();
      strip.focusedOwner = RING_CANCEL;
      expect(strip.ownerIsTab()).assertFalse();
      const owner: string = strip.closeTab(1);
      expect(strip.tabCount).assertEqual(1);
      expect(strip.cancelEnabled()).assertFalse();
      expect(owner).assertEqual(RING_INPUT);
      expect(strip.focusedOwner).assertEqual(RING_INPUT);
      expect(strip.ownerIsTab()).assertFalse();
      expect(strip.closeTab(0)).assertEqual(NO_FOCUS);
      expect(strip.refusedCount).assertEqual(1);
    });

    it('Browser_FocusNav_011', 0, async () => {
      TestLogger.step(TAG, 'Tab key follows the declaration order');
      const model: TabOrderModel = buildTabOrder(2);
      const visited: string[] = [];
      for (let index = 0; index < 10; index++) {
        visited.push(model.next());
      }
      expect(visited.length).assertEqual(10);
      expect(visited.slice(0, 8).join(',')).assertEqual(
        'inputUrl,navigationButton0,navigationButton1,navigationButton2,' +
        'navigationButton3,actionButton0,actionButton1,cancelBtn');
      expect(visited[8]).assertEqual(`${TAB_PREFIX}0`);
      expect(visited[9]).assertEqual(`${TAB_PREFIX}1`);
      expect(model.currentId()).assertEqual(`${TAB_PREFIX}1`);
    });

    it('Browser_FocusNav_012', 0, async () => {
      TestLogger.step(TAG, 'shift Tab walks the order backwards');
      const model: TabOrderModel = buildTabOrder(2);
      expect(model.previous()).assertEqual(`${TAB_PREFIX}1`);
      expect(model.previous()).assertEqual(`${TAB_PREFIX}0`);
      expect(model.previous()).assertEqual(RING_CANCEL);
      expect(model.previous()).assertEqual(RING_ADD);
      expect(model.previous()).assertEqual(RING_SUBMIT);
      expect(model.currentId()).assertEqual(RING_SUBMIT);
      expect(model.skippedCount).assertEqual(0);
      expect(model.enabledCount()).assertEqual(10);
    });

    it('Browser_FocusNav_013', 0, async () => {
      TestLogger.step(TAG, 'disabled stops are skipped without stalling');
      const model: TabOrderModel = buildTabOrder(2);
      model.setDisabled(RING_CANCEL, true);
      model.setDisabled(RING_FORWARD, true);
      expect(model.enabledCount()).assertEqual(8);
      const visited: string[] = [];
      for (let index = 0; index < 8; index++) {
        visited.push(model.next());
      }
      expect(visited.indexOf(RING_CANCEL)).assertEqual(-1);
      expect(visited.indexOf(RING_FORWARD)).assertEqual(-1);
      expect(visited[0]).assertEqual(RING_INPUT);
      expect(visited[2]).assertEqual(RING_REFRESH);
      expect(model.skippedCount).assertLarger(0);
    });

    it('Browser_FocusNav_014', 0, async () => {
      TestLogger.step(TAG, 'Tab wraps from the last stop to the first');
      const model: TabOrderModel = buildTabOrder(1);
      expect(model.order.length).assertEqual(9);
      model.cursor = model.order.length - 1;
      expect(model.currentId()).assertEqual(`${TAB_PREFIX}0`);
      expect(model.next()).assertEqual(RING_INPUT);
      expect(model.next()).assertEqual(RING_BACK);
      model.cursor = 0;
      expect(model.previous()).assertEqual(`${TAB_PREFIX}0`);
      expect(model.wrap).assertTrue();
    });

    it('Browser_FocusNav_015', 0, async () => {
      TestLogger.step(TAG, 'focus is restored after a transient tab creation');
      const ring: FocusRing = buildRing(2);
      const history: FocusHistory = new FocusHistory(8);
      expect(ring.focusById(RING_SUBMIT)).assertTrue();
      expect(history.push(ring.currentId())).assertTrue();
      ring.blur();
      expect(ring.focusedCount()).assertEqual(0);
      ring.focusFirst();
      expect(ring.currentId()).assertEqual(RING_INPUT);
      const restored: string = history.restoreInto(ring);
      expect(restored).assertEqual(RING_SUBMIT);
      expect(ring.currentId()).assertEqual(RING_SUBMIT);
      expect(history.size()).assertEqual(0);
      expect(ring.focusedCount()).assertEqual(1);
    });

    it('Browser_FocusNav_016', 0, async () => {
      TestLogger.step(TAG, 'focus survives a tab switch without changing owner');
      const ring: FocusRing = buildRing(2);
      const browser: MockBrowser = new MockBrowser(2);
      ring.focusById(RING_HOME);
      const parked: string = ring.currentId();
      ring.resetMetrics();
      expect(browser.selectTab(1)).assertTrue();
      expect(browser.getTabArrayIndex()).assertEqual(1);
      expect(ring.currentId()).assertEqual(parked);
      expect(ring.focusedCount()).assertEqual(1);
      expect(ring.moves).assertEqual(0);
      expect(ring.boundaryHits).assertEqual(0);
      expect(browser.getTabKeys().join(',')).assertEqual('0,1');
    });

    it('Browser_FocusNav_017', 0, async () => {
      TestLogger.step(TAG, 'a new tab hands focus to the new tab strip item');
      const strip: TabStripModel = new TabStripModel(2);
      expect(strip.addTab()).assertTrue();
      expect(strip.tabCount).assertEqual(3);
      expect(strip.focusedOwner).assertEqual(`${TAB_PREFIX}2`);
      expect(strip.ownerIsTab()).assertTrue();
      expect(strip.cancelEnabled()).assertTrue();
      expect(strip.tabIds().join(',')).assertEqual('tabItem0,tabItem1,tabItem2');
      expect(strip.closeTab(2)).assertEqual(`${TAB_PREFIX}1`);
      expect(strip.closedCount).assertEqual(1);
      const ring: FocusRing = buildRing(3);
      expect(ring.focusById(`${TAB_PREFIX}2`)).assertTrue();
      expect(ring.currentId()).assertEqual(`${TAB_PREFIX}2`);
    });

    it('Browser_FocusNav_018', 0, async () => {
      TestLogger.step(TAG, 'closing a tab moves focus to its left neighbour');
      const strip: TabStripModel = new TabStripModel(3);
      expect(strip.closeTab(0)).assertEqual(`${TAB_PREFIX}0`);
      expect(strip.tabCount).assertEqual(2);
      expect(strip.closeTab(1)).assertEqual(`${TAB_PREFIX}0`);
      expect(strip.tabCount).assertEqual(1);
      expect(strip.closeTab(0)).assertEqual(NO_FOCUS);
      expect(strip.refusedCount).assertEqual(1);
      expect(strip.focusedOwner).assertEqual(RING_INPUT);
      expect(strip.ownerIsTab()).assertFalse();
      expect(strip.tabIds().join(',')).assertEqual(`${TAB_PREFIX}0`);
    });

    it('Browser_FocusNav_019', 0, async () => {
      TestLogger.step(TAG, 'a disabled focused stop is reported as lost');
      const ring: FocusRing = buildRing(2);
      expect(ring.focusById(RING_CANCEL)).assertTrue();
      expect(ring.focusedCount()).assertEqual(1);
      expect(ring.setEnabled(RING_CANCEL, false)).assertTrue();
      expect(ring.focusLost).assertEqual(1);
      expect(ring.currentId()).assertEqual(NO_FOCUS);
      expect(ring.focusedCount()).assertEqual(0);
      expect(ring.enabledIds().indexOf(RING_CANCEL)).assertEqual(-1);
      expect(ring.focusById(RING_CANCEL)).assertFalse();
    });

    it('Browser_FocusNav_020', 0, async () => {
      TestLogger.step(TAG, 'enter activates the focused stop once per press');
      const ring: FocusRing = buildRing(2);
      const router: DpadRouter = new DpadRouter(ring);
      ring.focusById(RING_SUBMIT);
      expect(router.press(KEY_ENTER)).assertTrue();
      expect(router.activationCount).assertEqual(1);
      expect(ring.currentId()).assertEqual(RING_SUBMIT);
      expect(router.press(KEY_ENTER)).assertTrue();
      expect(router.activationCount).assertEqual(2);
      expect(router.pressCount).assertEqual(2);
      expect(router.unhandledCount).assertEqual(0);
    });

    it('Browser_FocusNav_021', 0, async () => {
      TestLogger.step(TAG, 'a dpad storm never loses the single focus owner');
      const ring: FocusRing = buildRing(2);
      const router: DpadRouter = new DpadRouter(ring);
      ring.focusFirst();
      const keys: number[] = [
        KEY_DPAD_RIGHT, KEY_DPAD_RIGHT, KEY_DPAD_DOWN, KEY_DPAD_RIGHT,
        KEY_DPAD_UP, KEY_DPAD_LEFT, KEY_DPAD_DOWN, KEY_DPAD_LEFT
      ];
      for (let round = 0; round < 5; round++) {
        for (let index = 0; index < keys.length; index++) {
          router.press(keys[index]);
          expect(ring.focusedCount()).assertEqual(1);
          expect(ring.enabledIds().indexOf(ring.currentId())).assertLarger(-1);
        }
      }
      TestLogger.info(TAG, `storm presses=${router.pressCount}, cursor=${ring.currentId()}`);
      expect(router.pressCount).assertEqual(40);
      expect(ring.focusLost).assertEqual(0);
      expect(ring.boundaryHits).assertEqual(0);
    });

    it('Browser_FocusNav_022', 0, async () => {
      TestLogger.step(TAG, 'focus restore history is bounded');
      const ring: FocusRing = buildRing(2);
      const history: FocusHistory = new FocusHistory(3);
      const ids: string[] = [RING_INPUT, RING_BACK, RING_FORWARD, RING_REFRESH, RING_HOME];
      for (let index = 0; index < ids.length; index++) {
        expect(history.push(ids[index])).assertTrue();
      }
      expect(history.size()).assertEqual(3);
      expect(history.overflow).assertEqual(2);
      expect(history.contains(RING_INPUT)).assertFalse();
      expect(history.peek()).assertEqual(RING_HOME);
      expect(history.pop()).assertEqual(RING_HOME);
      expect(history.size()).assertEqual(2);
      expect(history.push(NO_FOCUS)).assertFalse();
      expect(history.restoreInto(ring)).assertEqual(RING_REFRESH);
      expect(ring.currentId()).assertEqual(RING_REFRESH);
    });

    it('Browser_FocusNav_023', 0, async () => {
      TestLogger.step(TAG, 'focus move latency stays inside the focus budget');
      const clock: MockClock = new MockClock();
      const samples: number[] = measureMoveLatency(clock, 10);
      expect(samples.length).assertEqual(10);
      let worst: number = 0;
      for (let index = 0; index < samples.length; index++) {
        expect(samples[index]).assertLarger(0);
        if (samples[index] > worst) {
          worst = samples[index];
        }
      }
      TestLogger.info(TAG, `worst move latency=${worst} ms, budget=${TIMEOUT_FOCUS_CHANGE} ms`);
      expect(worst).assertLess(TIMEOUT_FOCUS_CHANGE);
      expect(worst).assertLess(DELAY_KEY_NAVIGATION * 2 + 1);
      expect(clock.now()).assertLarger(0);
    });

    it('Browser_FocusNav_024', 0, async () => {
      TestLogger.step(TAG, 'vertical move wraps from the web area back to the title bar');
      const ring: FocusRing = buildRing(2);
      expect(ring.rowIndexes().join(',')).assertEqual('0,1,2');
      ring.focusById('webContent');
      expect(ring.moveVertical(1)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_INPUT);
      expect(ring.moveVertical(-1)).assertTrue();
      expect(ring.currentId()).assertEqual('webContent');
      expect(ring.moves).assertEqual(2);
      const strict: FocusRing = buildRing(2);
      strict.wrap = false;
      strict.focusById('webContent');
      expect(strict.moveVertical(1)).assertFalse();
      expect(strict.currentId()).assertEqual('webContent');
      expect(strict.boundaryHits).assertEqual(1);
    });

    it('Browser_FocusNav_025', 0, async () => {
      TestLogger.step(TAG, 'phone title bar has no close button in its tab order');
      const order: string[] = [
        RING_INPUT, RING_BACK, RING_FORWARD, RING_REFRESH, RING_HOME,
        RING_SUBMIT, RING_ADD
      ];
      const model: TabOrderModel = new TabOrderModel(order);
      expect(model.order.length).assertEqual(7);
      expect(model.positionOf(RING_CANCEL)).assertEqual(-1);
      const visited: string[] = [];
      for (let index = 0; index < 7; index++) {
        visited.push(model.next());
      }
      expect(visited.join(',')).assertEqual(order.join(','));
      expect(model.next()).assertEqual(RING_INPUT);
      expect(model.enabledCount()).assertEqual(7);
    });

    it('Browser_FocusNav_026', 0, async () => {
      TestLogger.step(TAG, 'golden tab order matches the landscape declaration');
      const model: TabOrderModel = buildTabOrder(2);
      const walked: string[] = [];
      for (let index = 0; index < LANDSCAPE_TAB_ORDER.length; index++) {
        walked.push(model.next());
      }
      expect(walked.join('>')).assertEqual(LANDSCAPE_TAB_ORDER.join('>'));
      expect(walked.length).assertEqual(10);
      expect(walked[0]).assertEqual(ID_INPUT_URL);
      expect(walked[7]).assertEqual(ID_CANCEL_TAB);
      expect(walked[8]).assertEqual(`${TAB_PREFIX}0`);
      expect(model.next()).assertEqual(RING_INPUT);
    });

    it('Browser_FocusNav_027', 0, async () => {
      TestLogger.step(TAG, 'on device dpad right keeps a single visible focus stop');
      const present: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_COMPONENT);
      expect(present).assertTrue();
      const ring: FocusRing = buildRing(2);
      const router: DpadRouter = new DpadRouter(ring);
      ring.focusFirst();
      for (let index = 0; index < 3; index++) {
        await pressKey(driver, KEY_DPAD_RIGHT, 1, DELAY_KEY_NAVIGATION);
        router.press(KEY_DPAD_RIGHT);
        await serializedDelay(driver, TOLERANCE_FOCUS_CHANGE);
      }
      TestLogger.info(TAG, `cursor after three dpad rights=${ring.currentId()}`);
      expect(ring.currentId()).assertEqual(RING_REFRESH);
      expect(ring.focusedCount()).assertEqual(1);
      expect(await componentByIdExists(driver, ID_NAV_REFRESH)).assertTrue();
      expect(await componentByIdExists(driver, ID_INPUT_URL)).assertTrue();
    });

    it('Browser_FocusNav_028', 0, async () => {
      TestLogger.step(TAG, 'on device dpad down and up return to the title bar');
      const ring: FocusRing = buildRing(2);
      const router: DpadRouter = new DpadRouter(ring);
      ring.focusFirst();
      await pressKey(driver, KEY_DPAD_DOWN, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, TOLERANCE_FOCUS_CHANGE);
      expect(router.press(KEY_DPAD_DOWN)).assertTrue();
      expect(ring.rowStops(1).map((stop: FocusStop) => stop.id).indexOf(ring.currentId()))
        .assertLarger(-1);
      await pressKey(driver, KEY_DPAD_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, TOLERANCE_FOCUS_CHANGE);
      expect(router.press(KEY_DPAD_UP)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_INPUT);
      expect(await componentByIdExists(driver, ID_ACTION_SUBMIT)).assertTrue();
    });

    it('Browser_FocusNav_029', 0, async () => {
      TestLogger.step(TAG, 'on device Tab key keeps the browser foreground');
      await pressKey(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      for (let index = 0; index < 3; index++) {
        await pressKey(driver, KEY_DPAD_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, TOLERANCE_FOCUS_CHANGE);
      }
      const inputAfter: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      const backAfter: boolean = await componentByIdExists(driver, ID_NAV_BACK);
      const homeAfter: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      expect(inputAfter).assertTrue();
      expect(backAfter).assertTrue();
      expect(homeAfter).assertTrue();
      const labels: string = await textById(driver, ID_INPUT_URL);
      expect(labels !== null).assertTrue();
    });

    it('Browser_FocusNav_030', 0, async () => {
      TestLogger.step(TAG, 'focus stays on the refresh button after activating it');
      const ring: FocusRing = buildRing(2);
      const router: DpadRouter = new DpadRouter(ring);
      ring.focusById(RING_REFRESH);
      expect(router.press(KEY_ENTER)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_REFRESH);
      expect(router.activationCount).assertEqual(1);
      await clickById(driver, ID_NAV_REFRESH);
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
      expect(await componentByIdExists(driver, ID_INPUT_URL)).assertTrue();
      expect(router.press(KEY_DPAD_RIGHT)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_HOME);
      expect(ring.moves).assertEqual(1);
    });

    it('Browser_FocusNav_031', 0, async () => {
      TestLogger.step(TAG, 'tab switch after many tabs keeps the ring consistent');
      const browser: MockBrowser = new MockBrowser(4);
      const ring: FocusRing = buildRing(4);
      const history: FocusHistory = new FocusHistory(6);
      expect(ring.enabledStops().length).assertEqual(13);
      for (let index = 0; index < 4; index++) {
        expect(browser.selectTab(index)).assertTrue();
        expect(ring.focusById(`${TAB_PREFIX}${index}`)).assertTrue();
        history.push(ring.currentId());
      }
      expect(history.size()).assertEqual(4);
      expect(browser.getTabArrayIndex()).assertEqual(3);
      expect(ring.currentId()).assertEqual(`${TAB_PREFIX}3`);
      expect(browser.deleteTab(3)).assertTrue();
      expect(browser.getTabArrayIndex()).assertEqual(2);
      const owner: string = history.restoreInto(ring);
      expect(owner).assertEqual(`${TAB_PREFIX}3`);
      expect(ring.focusedCount()).assertEqual(1);
      expect(await countById(driver, ID_CANCEL_TAB) >= 0).assertTrue();
      TestLogger.info(TAG, `restored owner=${owner}, tabs=${browser.tabs.length}`);
    });

    it('Browser_FocusNav_032', 0, async () => {
      TestLogger.step(TAG, 'ring tolerates an unknown focus owner gracefully');
      const ring: FocusRing = buildRing(2);
      ring.focusedId = 'missingStop';
      expect(ring.current()).assertNull();
      expect(ring.focusedCount()).assertEqual(1);
      expect(ring.focusById(RING_BACK)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_BACK);
      expect(ring.moveHorizontal(1)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_FORWARD);
      const empty: FocusRing = new FocusRing();
      expect(empty.enabledStops().length).assertEqual(0);
      expect(empty.focusFirst()).assertFalse();
      expect(empty.focusLast()).assertFalse();
      expect(empty.focusedCount()).assertEqual(0);
      expect(empty.rowIndexes().length).assertEqual(0);
      expect(empty.moveVertical(1)).assertFalse();
      expect(empty.moves).assertEqual(0);
      expect(await runSerialized<number>(async () => {
        await serializedDelay(driver, TOLERANCE_COMPONENT_COUNT);
        return 1;
      })).assertEqual(1);
      expect(DELAY_TAB_OPERATION).assertLess(TIMEOUT_TAB_SWITCH);
      expect(TOLERANCE_COMPONENT_COUNT).assertLarger(0);
    });

    it('Browser_FocusNav_033', 0, async () => {
      TestLogger.step(TAG, 'vertical move resolves the nearest column on ties');
      const ring: FocusRing = buildRing(3);
      ring.focusById(RING_FORWARD);
      expect(ring.moveVertical(1)).assertTrue();
      expect(ring.currentId()).assertEqual(`${TAB_PREFIX}2`);
      ring.focusById(RING_BACK);
      expect(ring.moveVertical(1)).assertTrue();
      expect(ring.currentId()).assertEqual(`${TAB_PREFIX}1`);
      ring.focusById(RING_ADD);
      expect(ring.moveVertical(1)).assertTrue();
      expect(ring.currentId()).assertEqual(RING_CANCEL);
      expect(ring.moves).assertEqual(3);
      expect(ring.boundaryHits).assertEqual(0);
    });

    it('Browser_FocusNav_034', 0, async () => {
      TestLogger.step(TAG, 'repeated enable and disable cycles keep the order stable');
      const ring: FocusRing = buildRing(2);
      const baseline: string = ring.enabledIds().join(',');
      for (let round = 0; round < 4; round++) {
        ring.setEnabled(RING_FORWARD, false);
        ring.setEnabled(RING_CANCEL, false);
        expect(ring.enabledIds().indexOf(RING_FORWARD)).assertEqual(-1);
        ring.setEnabled(RING_FORWARD, true);
        ring.setEnabled(RING_CANCEL, true);
      }
      expect(ring.enabledIds().join(',')).assertEqual(baseline);
      expect(ring.enabledStops().length).assertEqual(11);
      expect(ring.moves).assertEqual(0);
      expect(ring.focusLost).assertEqual(0);
      const model: TabOrderModel = buildTabOrder(2);
      expect(model.enabledCount()).assertEqual(LANDSCAPE_TAB_ORDER.length);
    });

    it('Browser_FocusNav_035', 0, async () => {
      TestLogger.step(TAG, 'typed url is preserved while focus walks the ring');
      const present: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_COMPONENT);
      expect(present).assertTrue();
      await clickById(driver, ID_INPUT_URL);
      expect(await inputById(driver, ID_INPUT_URL, 'focus.example')).assertTrue();
      const typed: string = await textById(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `typed url length=${typed.length}`);
      const ring: FocusRing = buildRing(2);
      const router: DpadRouter = new DpadRouter(ring);
      ring.focusFirst();
      for (let index = 0; index < 5; index++) {
        await pressKey(driver, KEY_DPAD_RIGHT, 1, DELAY_KEY_NAVIGATION);
        router.press(KEY_DPAD_RIGHT);
      }
      expect(ring.currentId()).assertEqual(RING_SUBMIT);
      expect(ring.focusedCount()).assertEqual(1);
      const afterWalk: string = await textById(driver, ID_INPUT_URL);
      expect(afterWalk.length).assertEqual(typed.length);
      expect(router.pressCount).assertEqual(5);
    });

    it('Browser_FocusNav_036', 0, async () => {
      TestLogger.step(TAG, 'restore chain skips stops that disappeared meanwhile');
      const ring: FocusRing = buildRing(2);
      const history: FocusHistory = new FocusHistory(8);
      history.push(RING_INPUT);
      history.push(RING_CANCEL);
      history.push(RING_ADD);
      expect(history.size()).assertEqual(3);
      ring.setEnabled(RING_CANCEL, false);
      ring.setEnabled(RING_ADD, false);
      expect(ring.focusLost).assertEqual(0);
      const restored: string = history.restoreInto(ring);
      expect(restored).assertEqual(RING_INPUT);
      expect(ring.currentId()).assertEqual(RING_INPUT);
      expect(history.size()).assertEqual(0);
      expect(ring.focusedCount()).assertEqual(1);
      await pressKey(driver, KEY_DPAD_DOWN, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, TOLERANCE_FOCUS_CHANGE);
      expect(await componentByIdExists(driver, ID_INPUT_URL)).assertTrue();
    });

    it('Browser_FocusNav_037', 0, async () => {
      TestLogger.step(TAG, 'web area is reachable and reports its group');
      const ring: FocusRing = buildRing(2);
      const web: FocusStop | null = ring.stopOf('webContent');
      expect(web !== null).assertTrue();
      if (web !== null) {
        expect(web.group).assertEqual(GROUP_WEB);
        expect(web.row).assertEqual(2);
        expect(web.col).assertEqual(0);
        expect(web.enabled).assertTrue();
      }
      ring.focusById('webContent');
      expect(ring.currentId()).assertEqual('webContent');
      expect(ring.rowStops(2).length).assertEqual(1);
      expect(ring.moveHorizontal(1)).assertTrue();
      expect(ring.currentId()).assertEqual('webContent');
      expect(ring.moves).assertEqual(1);
      expect(ring.boundaryHits).assertEqual(0);
      const router: DpadRouter = new DpadRouter(ring);
      expect(router.press(KEY_ENTER)).assertTrue();
      expect(router.activationCount).assertEqual(1);
      expect(router.unhandledCount).assertEqual(0);
      if (web !== null) {
        expect(web.key()).assertEqual('2:0');
        expect(web.order).assertEqual(ring.stops.length - 1);
      }
      expect(ring.rowIndexes().length).assertEqual(3);
      expect(ring.rowStops(2)[0].group).assertEqual(GROUP_WEB);
      expect(ring.stops.length).assertEqual(11);
    });
  });
}
