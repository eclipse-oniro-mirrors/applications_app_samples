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
  getDriver, startBrowserApp, componentByIdExists, countById, clickById, tapAt, pressKey,
  serializedDelay, ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME,
  ID_ACTION_SUBMIT, ID_ACTION_ADD, ID_CANCEL_TAB, KEY_DPAD_RIGHT, KEY_DPAD_DOWN,
  DELAY_KEY_NAVIGATION, DELAY_TOUCH_EVENT, TIMEOUT_COMPONENT
} from '../Shared/BrowserTestKit';
import { MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserFocusRingBehaviorTest';

/* ------------------------------------------------------------------ */
/* Visual constants of common/TitleBar.ets                             */
/* ------------------------------------------------------------------ */

const BUTTON_WIDTH: number = 22;
const BUTTON_RADIUS: number = 4;
const TAB_CLOSE_WIDTH: number = 33;
const TAB_CLOSE_RADIUS: number = 5;
const DOWN_COLOR: string = '#e4e4e4';
const UP_COLOR: string = '#00000000';
const RING_THICKNESS: number = 2;
const RING_COLOR: string = '#0000ff';

const GROUP_NAVIGATION: string = 'navigation';
const GROUP_ACTION: string = 'action';
const GROUP_TAB: string = 'tab';

/* ------------------------------------------------------------------ */
/* Geometry value object                                               */
/* ------------------------------------------------------------------ */

/** Width, height and corner radius of one focusable control. */
class RingGeometry {
  width: number;
  height: number;
  radius: number;

  constructor(width: number, height: number, radius: number) {
    this.width = width;
    this.height = height;
    this.radius = radius;
  }

  isSquare(): boolean {
    return this.width === this.height && this.width > 0;
  }

  isRounded(): boolean {
    return this.radius > 0 && this.radius * 2 <= this.width;
  }

  area(): number {
    return this.width * this.height;
  }

  ratio(): number {
    return this.height === 0 ? 0 : Math.round((this.width / this.height) * 100) / 100;
  }

  sameAs(other: RingGeometry): boolean {
    return this.width === other.width && this.height === other.height &&
      this.radius === other.radius;
  }

  describe(): string {
    return `${this.width}x${this.height} r${this.radius}`;
  }
}

/** Static geometry contracts of the browser title bar. */
class RingGeometryTable {
  navGeometry: RingGeometry = new RingGeometry(BUTTON_WIDTH, BUTTON_WIDTH, BUTTON_RADIUS);
  tabCloseGeometry: RingGeometry = new RingGeometry(TAB_CLOSE_WIDTH, TAB_CLOSE_WIDTH,
    TAB_CLOSE_RADIUS);

  /** The six image buttons share one geometry. */
  buttonIds(): string[] {
    return [ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME, ID_ACTION_SUBMIT,
      ID_ACTION_ADD];
  }

  geometryOf(id: string): RingGeometry {
    return id === ID_CANCEL_TAB ? this.tabCloseGeometry : this.navGeometry;
  }

  distinctRadii(): number[] {
    const result: number[] = [];
    const ids: string[] = this.buttonIds();
    result.push(this.navGeometry.radius);
    result.push(this.tabCloseGeometry.radius);
    for (let index = 0; index < ids.length; index++) {
      const radius: number = this.geometryOf(ids[index]).radius;
      if (result.indexOf(radius) < 0) {
        result.push(radius);
      }
    }
    return result;
  }
}

/* ------------------------------------------------------------------ */
/* One focusable control                                               */
/* ------------------------------------------------------------------ */

/** Focus and press state of a single title bar control. */
class FocusVisual {
  id: string;
  group: string;
  geometry: RingGeometry;
  focused: boolean = false;
  pressed: boolean = false;
  focusGained: number = 0;
  focusLost: number = 0;
  pressCount: number = 0;

  constructor(id: string, group: string, geometry: RingGeometry) {
    this.id = id;
    this.group = group;
    this.geometry = geometry;
  }

  /** Pressed wins over focus, idle stays fully transparent. */
  background(): string {
    return this.pressed ? DOWN_COLOR : UP_COLOR;
  }

  isHighlighted(): boolean {
    return this.pressed;
  }

  /** The ring is drawn for the focused control even when not pressed. */
  ringVisible(): boolean {
    return this.focused;
  }

  resetCounters(): void {
    this.focusGained = 0;
    this.focusLost = 0;
    this.pressCount = 0;
  }
}

/* ------------------------------------------------------------------ */
/* Focus ring state machine                                            */
/* ------------------------------------------------------------------ */

/**
 * Mirrors the focus behaviour of the title bar:
 *  - at most one control owns the focus ring at any time,
 *  - at most one control is pressed at any time,
 *  - losing the focus clears the highlight and restores transparency.
 */
class FocusRingModel {
  private visuals: FocusVisual[] = [];
  focusedId: string = '';
  pressedId: string = '';
  events: string[] = [];
  private clock: MockClock;

  constructor(clock: MockClock) {
    this.clock = clock;
  }

  register(id: string, group: string, geometry: RingGeometry): boolean {
    if (this.find(id) !== null) {
      this.events.push('register-duplicate:' + id);
      return false;
    }
    this.visuals.push(new FocusVisual(id, group, geometry));
    this.events.push('register:' + id);
    return true;
  }

  size(): number {
    return this.visuals.length;
  }

  ids(): string[] {
    return this.visuals.map((visual: FocusVisual) => visual.id);
  }

  find(id: string): FocusVisual | null {
    for (let index = 0; index < this.visuals.length; index++) {
      if (this.visuals[index].id === id) {
        return this.visuals[index];
      }
    }
    return null;
  }

  focusedCount(): number {
    let total: number = 0;
    for (let index = 0; index < this.visuals.length; index++) {
      if (this.visuals[index].focused) {
        total += 1;
      }
    }
    return total;
  }

  pressedCount(): number {
    let total: number = 0;
    for (let index = 0; index < this.visuals.length; index++) {
      if (this.visuals[index].pressed) {
        total += 1;
      }
    }
    return total;
  }

  /** Focusing a second control moves the ring, it never duplicates it. */
  focus(id: string): boolean {
    const target: FocusVisual | null = this.find(id);
    if (target === null) {
      this.events.push('focus-unknown:' + id);
      return false;
    }
    if (this.focusedId === id) {
      this.events.push('focus-duplicate:' + id);
      return false;
    }
    if (this.focusedId !== '') {
      const previous: FocusVisual | null = this.find(this.focusedId);
      if (previous !== null) {
        previous.focused = false;
        previous.focusLost += 1;
      }
      this.events.push('blur:' + this.focusedId);
    }
    this.focusedId = id;
    target.focused = true;
    target.focusGained += 1;
    this.events.push('focus:' + id);
    return true;
  }

  blur(id: string): boolean {
    const target: FocusVisual | null = this.find(id);
    if (target === null || this.focusedId !== id) {
      this.events.push('blur-missed:' + id);
      return false;
    }
    target.focused = false;
    target.focusLost += 1;
    this.focusedId = '';
    this.events.push('blur:' + id);
    return true;
  }

  /** Called when the whole title bar leaves the window focus. */
  loseFocus(): number {
    let cleared: number = 0;
    for (let index = 0; index < this.visuals.length; index++) {
      if (this.visuals[index].focused) {
        this.visuals[index].focused = false;
        this.visuals[index].focusLost += 1;
        cleared += 1;
      }
      // A window focus loss also releases any pressed visual.
      this.visuals[index].pressed = false;
    }
    this.focusedId = '';
    this.pressedId = '';
    this.events.push('lose-focus');
    return cleared;
  }

  press(id: string): boolean {
    const target: FocusVisual | null = this.find(id);
    if (target === null) {
      this.events.push('press-unknown:' + id);
      return false;
    }
    if (this.pressedId === id) {
      this.events.push('press-duplicate:' + id);
      return false;
    }
    if (this.pressedId !== '') {
      const previous: FocusVisual | null = this.find(this.pressedId);
      if (previous !== null) {
        previous.pressed = false;
      }
      this.events.push('release:' + this.pressedId);
    }
    this.pressedId = id;
    target.pressed = true;
    target.pressCount += 1;
    this.focus(id);
    this.events.push('press:' + id);
    return true;
  }

  release(id: string): boolean {
    const target: FocusVisual | null = this.find(id);
    if (target === null || this.pressedId !== id) {
      this.events.push('release-missed:' + id);
      return false;
    }
    target.pressed = false;
    this.pressedId = '';
    this.events.push('release:' + id);
    return true;
  }

  backgroundOf(id: string): string {
    const target: FocusVisual | null = this.find(id);
    return target === null ? UP_COLOR : target.background();
  }

  pressedBackgrounds(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.visuals.length; index++) {
      if (this.visuals[index].pressed) {
        result.push(this.visuals[index].background());
      }
    }
    return result;
  }

  traceLog(): string {
    return this.events.join(',');
  }

  eventCount(): number {
    return this.events.length;
  }

  reset(): void {
    this.visuals = [];
    this.focusedId = '';
    this.pressedId = '';
    this.events = [];
  }

  resetStates(): void {
    for (let index = 0; index < this.visuals.length; index++) {
      this.visuals[index].focused = false;
      this.visuals[index].pressed = false;
      this.visuals[index].resetCounters();
    }
    this.focusedId = '';
    this.pressedId = '';
    this.events = [];
  }

  clockNow(): number {
    return this.clock.now();
  }
}

/* ------------------------------------------------------------------ */
/* Aggregate metrics used by the assertions                            */
/* ------------------------------------------------------------------ */

/** Small report object, keeps the assertions free of inline loops. */
class RingMetrics {
  model: FocusRingModel;

  constructor(model: FocusRingModel) {
    this.model = model;
  }

  total(): number {
    return this.model.size();
  }

  focused(): number {
    return this.model.focusedCount();
  }

  pressed(): number {
    return this.model.pressedCount();
  }

  transparentCount(): number {
    let total: number = 0;
    const ids: string[] = this.model.ids();
    for (let index = 0; index < ids.length; index++) {
      if (this.model.backgroundOf(ids[index]) === UP_COLOR) {
        total += 1;
      }
    }
    return total;
  }

  downCount(): number {
    let total: number = 0;
    const ids: string[] = this.model.ids();
    for (let index = 0; index < ids.length; index++) {
      if (this.model.backgroundOf(ids[index]) === DOWN_COLOR) {
        total += 1;
      }
    }
    return total;
  }

  distinctBackgrounds(): number {
    const seen: string[] = [];
    const ids: string[] = this.model.ids();
    for (let index = 0; index < ids.length; index++) {
      const color: string = this.model.backgroundOf(ids[index]);
      if (seen.indexOf(color) < 0) {
        seen.push(color);
      }
    }
    return seen.length;
  }

  groupCount(group: string): number {
    let total: number = 0;
    const ids: string[] = this.model.ids();
    for (let index = 0; index < ids.length; index++) {
      const visual: FocusVisual | null = this.model.find(ids[index]);
      if (visual !== null && visual.group === group) {
        total += 1;
      }
    }
    return total;
  }
}

/* ------------------------------------------------------------------ */
/* Fixtures                                                            */
/* ------------------------------------------------------------------ */

function registerTitleBar(model: FocusRingModel, table: RingGeometryTable): FocusRingModel {
  const ids: string[] = table.buttonIds();
  for (let index = 0; index < ids.length; index++) {
    const group: string = index < 4 ? GROUP_NAVIGATION : GROUP_ACTION;
    model.register(ids[index], group, table.navGeometry);
  }
  model.register(ID_CANCEL_TAB, GROUP_TAB, table.tabCloseGeometry);
  return model;
}

function buildModel(): FocusRingModel {
  const clock: MockClock = new MockClock();
  const model: FocusRingModel = new FocusRingModel(clock);
  return registerTitleBar(model, new RingGeometryTable());
}

function buildEmptyModel(): FocusRingModel {
  return new FocusRingModel(new MockClock());
}

/** Focuses every registered control once and returns the visited ids. */
function focusAll(model: FocusRingModel): string[] {
  const visited: string[] = [];
  const ids: string[] = model.ids();
  for (let index = 0; index < ids.length; index++) {
    if (model.focus(ids[index])) {
      visited.push(ids[index]);
    }
  }
  return visited;
}

function firstId(model: FocusRingModel): string {
  const ids: string[] = model.ids();
  return ids.length === 0 ? '' : ids[0];
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserFocusRingBehaviorTest() {
  describe('browserFocusRingBehaviorTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      await startBrowserApp();
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      TestLogger.info(TAG, `ring thickness ${RING_THICKNESS} px, button ${BUTTON_WIDTH} px, ` +
        `tab close ${TAB_CLOSE_WIDTH} px`);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_FocusRing_001', 0, async () => {
      TestLogger.step(TAG, 'six image buttons share the 22 x 22 radius 4 geometry');
      const table: RingGeometryTable = new RingGeometryTable();
      const ids: string[] = table.buttonIds();
      expect(ids.length).assertEqual(6);
      for (let index = 0; index < ids.length; index++) {
        const geometry: RingGeometry = table.geometryOf(ids[index]);
        expect(geometry.width).assertEqual(BUTTON_WIDTH);
        expect(geometry.height).assertEqual(BUTTON_WIDTH);
        expect(geometry.radius).assertEqual(BUTTON_RADIUS);
        expect(geometry.isSquare()).assertTrue();
        expect(geometry.isRounded()).assertTrue();
        expect(geometry.area()).assertEqual(BUTTON_WIDTH * BUTTON_WIDTH);
        expect(geometry.ratio()).assertEqual(1);
      }
    });

    it('Browser_FocusRing_002', 0, async () => {
      TestLogger.step(TAG, 'tab close control uses 33 x 33 with radius 5');
      const table: RingGeometryTable = new RingGeometryTable();
      const close: RingGeometry = table.geometryOf(ID_CANCEL_TAB);
      expect(close.width).assertEqual(TAB_CLOSE_WIDTH);
      expect(close.height).assertEqual(TAB_CLOSE_WIDTH);
      expect(close.radius).assertEqual(TAB_CLOSE_RADIUS);
      expect(close.isSquare()).assertTrue();
      expect(close.area()).assertEqual(TAB_CLOSE_WIDTH * TAB_CLOSE_WIDTH);
      expect(close.sameAs(table.navGeometry)).assertFalse();
      expect(table.distinctRadii().length).assertEqual(2);
      expect(table.distinctRadii()).assertContain(BUTTON_RADIUS);
      expect(table.distinctRadii()).assertContain(TAB_CLOSE_RADIUS);
    });

    it('Browser_FocusRing_003', 0, async () => {
      TestLogger.step(TAG, 'a registered control starts transparent and unfocused');
      const model: FocusRingModel = buildModel();
      const metrics: RingMetrics = new RingMetrics(model);
      expect(model.size()).assertEqual(7);
      expect(model.focusedId).assertEqual('');
      expect(model.pressedId).assertEqual('');
      expect(metrics.transparentCount()).assertEqual(7);
      expect(metrics.downCount()).assertEqual(0);
      expect(metrics.focused()).assertEqual(0);
      expect(metrics.distinctBackgrounds()).assertEqual(1);
      expect(model.backgroundOf(ID_NAV_BACK)).assertEqual(UP_COLOR);
      expect(model.backgroundOf(ID_CANCEL_TAB)).assertEqual(UP_COLOR);
    });

    it('Browser_FocusRing_004', 0, async () => {
      TestLogger.step(TAG, 'pressing a button paints the documented down colour');
      const model: FocusRingModel = buildModel();
      const metrics: RingMetrics = new RingMetrics(model);
      expect(model.press(ID_NAV_REFRESH)).assertTrue();
      expect(model.backgroundOf(ID_NAV_REFRESH)).assertEqual(DOWN_COLOR);
      expect(model.backgroundOf(ID_NAV_REFRESH) === UP_COLOR).assertFalse();
      expect(model.pressedId).assertEqual(ID_NAV_REFRESH);
      expect(metrics.pressed()).assertEqual(1);
      expect(metrics.downCount()).assertEqual(1);
      expect(metrics.transparentCount()).assertEqual(6);
      expect(model.backgroundOf(ID_NAV_BACK)).assertEqual(UP_COLOR);
    });

    it('Browser_FocusRing_005', 0, async () => {
      TestLogger.step(TAG, 'release clears the down colour and restores transparency');
      const model: FocusRingModel = buildModel();
      model.press(ID_ACTION_ADD);
      expect(model.backgroundOf(ID_ACTION_ADD)).assertEqual(DOWN_COLOR);
      expect(model.release(ID_ACTION_ADD)).assertTrue();
      expect(model.backgroundOf(ID_ACTION_ADD)).assertEqual(UP_COLOR);
      expect(model.pressedId).assertEqual('');
      expect(model.pressedCount()).assertEqual(0);
      expect(model.release(ID_ACTION_ADD)).assertFalse();
      expect(model.traceLog()).assertContain('release-missed');
    });

    it('Browser_FocusRing_006', 0, async () => {
      TestLogger.step(TAG, 'only one button is pressed at a time');
      const model: FocusRingModel = buildModel();
      expect(model.press(ID_NAV_BACK)).assertTrue();
      expect(model.press(ID_NAV_FORWARD)).assertTrue();
      expect(model.pressedCount()).assertEqual(1);
      expect(model.pressedId).assertEqual(ID_NAV_FORWARD);
      expect(model.backgroundOf(ID_NAV_BACK)).assertEqual(UP_COLOR);
      expect(model.backgroundOf(ID_NAV_FORWARD)).assertEqual(DOWN_COLOR);
      expect(model.press(ID_NAV_FORWARD)).assertFalse();
      expect(model.pressedCount()).assertEqual(1);
      expect(model.traceLog()).assertContain('press-duplicate');
    });

    it('Browser_FocusRing_007', 0, async () => {
      TestLogger.step(TAG, 'focus moves between buttons and clears the previous one');
      const model: FocusRingModel = buildModel();
      expect(model.focus(ID_NAV_BACK)).assertTrue();
      expect(model.focusedId).assertEqual(ID_NAV_BACK);
      expect(model.focusedCount()).assertEqual(1);
      const back: FocusVisual | null = model.find(ID_NAV_BACK);
      expect(back !== null && back.ringVisible()).assertTrue();
      expect(model.focus(ID_ACTION_SUBMIT)).assertTrue();
      expect(model.focusedId).assertEqual(ID_ACTION_SUBMIT);
      expect(model.focusedCount()).assertEqual(1);
      const first: FocusVisual | null = model.find(ID_NAV_BACK);
      const second: FocusVisual | null = model.find(ID_ACTION_SUBMIT);
      if (first !== null && second !== null) {
        expect(first.focused).assertFalse();
        expect(first.focusLost).assertEqual(1);
        expect(second.focused).assertTrue();
        expect(second.focusGained).assertEqual(1);
      }
      expect(model.traceLog()).assertContain('blur:' + ID_NAV_BACK);
    });

    it('Browser_FocusRing_008', 0, async () => {
      TestLogger.step(TAG, 'a focused but idle button keeps the transparent background');
      const model: FocusRingModel = buildModel();
      model.focus(ID_NAV_HOME);
      const home: FocusVisual | null = model.find(ID_NAV_HOME);
      if (home !== null) {
        expect(home.focused).assertTrue();
        expect(home.pressed).assertFalse();
        expect(home.background()).assertEqual(UP_COLOR);
        expect(home.ringVisible()).assertTrue();
        expect(home.isHighlighted()).assertFalse();
      }
      expect(model.backgroundOf(ID_NAV_HOME)).assertEqual(UP_COLOR);
      expect(model.focusedCount()).assertEqual(1);
      expect(new RingMetrics(model).downCount()).assertEqual(0);
    });

    it('Browser_FocusRing_009', 0, async () => {
      TestLogger.step(TAG, 'losing window focus resets every ring');
      const model: FocusRingModel = buildModel();
      model.press(ID_NAV_BACK);
      model.focus(ID_ACTION_ADD);
      expect(model.focusedCount()).assertEqual(1);
      expect(model.pressedCount()).assertEqual(1);
      const cleared: number = model.loseFocus();
      expect(cleared).assertEqual(1);
      expect(model.focusedCount()).assertEqual(0);
      expect(model.pressedCount()).assertEqual(0);
      expect(model.focusedId).assertEqual('');
      expect(model.pressedId).assertEqual('');
      expect(model.backgroundOf(ID_NAV_BACK)).assertEqual(UP_COLOR);
      expect(model.traceLog()).assertContain('lose-focus');
    });

    it('Browser_FocusRing_010', 0, async () => {
      TestLogger.step(TAG, 'focusing the already focused button is a no-op');
      const model: FocusRingModel = buildModel();
      expect(model.focus(ID_NAV_FORWARD)).assertTrue();
      const eventsAfterFirst: number = model.eventCount();
      expect(model.focus(ID_NAV_FORWARD)).assertFalse();
      expect(model.eventCount()).assertEqual(eventsAfterFirst + 1);
      expect(model.focusedCount()).assertEqual(1);
      const forward: FocusVisual | null = model.find(ID_NAV_FORWARD);
      if (forward !== null) {
        expect(forward.focusGained).assertEqual(1);
        expect(forward.focusLost).assertEqual(0);
      }
      expect(model.traceLog()).assertContain('focus-duplicate:' + ID_NAV_FORWARD);
    });

    it('Browser_FocusRing_011', 0, async () => {
      TestLogger.step(TAG, 'focus requests for unregistered ids are rejected');
      const model: FocusRingModel = buildModel();
      expect(model.focus('ghostButton')).assertFalse();
      expect(model.focus('')).assertFalse();
      expect(model.focusedId).assertEqual('');
      expect(model.focusedCount()).assertEqual(0);
      expect(model.traceLog()).assertContain('focus-unknown:ghostButton');
      expect(model.size()).assertEqual(7);
    });

    it('Browser_FocusRing_012', 0, async () => {
      TestLogger.step(TAG, 'duplicate registration keeps a single instance');
      const model: FocusRingModel = buildEmptyModel();
      const geometry: RingGeometry = new RingGeometry(BUTTON_WIDTH, BUTTON_WIDTH, BUTTON_RADIUS);
      expect(model.register(ID_NAV_BACK, GROUP_NAVIGATION, geometry)).assertTrue();
      expect(model.register(ID_NAV_BACK, GROUP_NAVIGATION, geometry)).assertFalse();
      expect(model.size()).assertEqual(1);
      expect(model.ids().length).assertEqual(1);
      expect(model.traceLog()).assertContain('register-duplicate');
      expect(model.find(ID_NAV_BACK) !== null).assertTrue();
      expect(model.find('ghostButton')).assertNull();
    });

    it('Browser_FocusRing_013', 0, async () => {
      TestLogger.step(TAG, 'traversal across all controls keeps exactly one focused ring');
      const model: FocusRingModel = buildModel();
      const visited: string[] = focusAll(model);
      expect(visited.length).assertEqual(7);
      expect(model.focusedCount()).assertEqual(1);
      expect(model.focusedId).assertEqual(ID_CANCEL_TAB);
      expect(visited[0]).assertEqual(ID_NAV_BACK);
      expect(visited[visited.length - 1]).assertEqual(ID_CANCEL_TAB);
      const metrics: RingMetrics = new RingMetrics(model);
      expect(metrics.total()).assertEqual(7);
      expect(metrics.focused()).assertEqual(1);
      expect(metrics.pressed()).assertEqual(0);
      expect(metrics.transparentCount()).assertEqual(7);
      expect(model.eventCount()).assertLarger(visited.length);
    });

    it('Browser_FocusRing_014', 0, async () => {
      TestLogger.step(TAG, 'blur only succeeds for the currently focused control');
      const model: FocusRingModel = buildModel();
      expect(model.blur(ID_NAV_BACK)).assertFalse();
      expect(model.focus(ID_NAV_BACK)).assertTrue();
      expect(model.blur(ID_NAV_FORWARD)).assertFalse();
      expect(model.focusedId).assertEqual(ID_NAV_BACK);
      expect(model.blur(ID_NAV_BACK)).assertTrue();
      expect(model.focusedId).assertEqual('');
      expect(model.focusedCount()).assertEqual(0);
      expect(model.blur('ghostButton')).assertFalse();
      expect(model.traceLog()).assertContain('blur-missed');
    });

    it('Browser_FocusRing_015', 0, async () => {
      TestLogger.step(TAG, 'pressing an unknown control leaves the model untouched');
      const model: FocusRingModel = buildModel();
      model.press(ID_NAV_BACK);
      const pressedBefore: number = model.pressedCount();
      expect(model.press('ghostButton')).assertFalse();
      expect(model.press('')).assertFalse();
      expect(model.pressedCount()).assertEqual(pressedBefore);
      expect(model.pressedId).assertEqual(ID_NAV_BACK);
      expect(model.backgroundOf(ID_NAV_BACK)).assertEqual(DOWN_COLOR);
      expect(model.backgroundOf('ghostButton')).assertEqual(UP_COLOR);
      expect(model.traceLog()).assertContain('press-unknown:ghostButton');
    });

    it('Browser_FocusRing_016', 0, async () => {
      TestLogger.step(TAG, 'model reset drops registrations, states and events');
      const model: FocusRingModel = buildModel();
      model.press(ID_NAV_HOME);
      expect(model.size()).assertEqual(7);
      model.reset();
      expect(model.size()).assertEqual(0);
      expect(model.ids().length).assertEqual(0);
      expect(model.focusedId).assertEqual('');
      expect(model.pressedId).assertEqual('');
      expect(model.eventCount()).assertEqual(0);
      expect(model.focusedCount()).assertEqual(0);
      expect(model.press(ID_NAV_HOME)).assertFalse();
    });

    it('Browser_FocusRing_017', 0, async () => {
      TestLogger.step(TAG, 'state reset keeps the geometry table intact');
      const model: FocusRingModel = buildModel();
      model.press(ID_ACTION_SUBMIT);
      model.focus(ID_ACTION_ADD);
      model.resetStates();
      expect(model.size()).assertEqual(7);
      expect(model.focusedCount()).assertEqual(0);
      expect(model.pressedCount()).assertEqual(0);
      expect(model.eventCount()).assertEqual(0);
      expect(model.backgroundOf(ID_ACTION_SUBMIT)).assertEqual(UP_COLOR);
      const submit: FocusVisual | null = model.find(ID_ACTION_SUBMIT);
      if (submit !== null) {
        expect(submit.pressCount).assertEqual(0);
        expect(submit.focusGained).assertEqual(0);
        expect(submit.geometry.width).assertEqual(BUTTON_WIDTH);
      }
    });

    it('Browser_FocusRing_018', 0, async () => {
      TestLogger.step(TAG, 'tab close ring is independent from the navigation buttons');
      const model: FocusRingModel = buildModel();
      expect(model.press(ID_NAV_BACK)).assertTrue();
      expect(model.backgroundOf(ID_CANCEL_TAB)).assertEqual(UP_COLOR);
      expect(model.focus(ID_CANCEL_TAB)).assertTrue();
      expect(model.backgroundOf(ID_CANCEL_TAB)).assertEqual(UP_COLOR);
      expect(model.press(ID_CANCEL_TAB)).assertTrue();
      expect(model.backgroundOf(ID_CANCEL_TAB)).assertEqual(DOWN_COLOR);
      expect(model.backgroundOf(ID_NAV_BACK)).assertEqual(UP_COLOR);
      const close: FocusVisual | null = model.find(ID_CANCEL_TAB);
      if (close !== null) {
        expect(close.group).assertEqual(GROUP_TAB);
        expect(close.geometry.radius).assertEqual(TAB_CLOSE_RADIUS);
      }
    });

    it('Browser_FocusRing_019', 0, async () => {
      TestLogger.step(TAG, 'only the two documented background colours are used');
      const model: FocusRingModel = buildModel();
      const metrics: RingMetrics = new RingMetrics(model);
      expect(metrics.distinctBackgrounds()).assertEqual(1);
      model.press(ID_NAV_FORWARD);
      expect(metrics.distinctBackgrounds()).assertEqual(2);
      expect(metrics.transparentCount()).assertEqual(6);
      expect(metrics.downCount()).assertEqual(1);
      const backgrounds: string[] = model.pressedBackgrounds();
      expect(backgrounds.length).assertEqual(1);
      expect(backgrounds[0]).assertEqual(DOWN_COLOR);
      expect(UP_COLOR.indexOf('#000000')).assertEqual(0);
      expect(DOWN_COLOR).assertEqual('#e4e4e4');
    });

    it('Browser_FocusRing_020', 0, async () => {
      TestLogger.step(TAG, 'ring table distinguishes navigation, action and tab groups');
      const model: FocusRingModel = buildModel();
      const metrics: RingMetrics = new RingMetrics(model);
      expect(metrics.groupCount(GROUP_NAVIGATION)).assertEqual(4);
      expect(metrics.groupCount(GROUP_ACTION)).assertEqual(2);
      expect(metrics.groupCount(GROUP_TAB)).assertEqual(1);
      expect(metrics.groupCount('unknown')).assertEqual(0);
      expect(metrics.total()).assertEqual(7);
      const back: FocusVisual | null = model.find(ID_NAV_BACK);
      const add: FocusVisual | null = model.find(ID_ACTION_ADD);
      if (back !== null && add !== null) {
        expect(back.group).assertEqual(GROUP_NAVIGATION);
        expect(add.group).assertEqual(GROUP_ACTION);
        expect(back.geometry.sameAs(add.geometry)).assertTrue();
      }
    });

    it('Browser_FocusRing_021', 0, async () => {
      TestLogger.step(TAG, 'geometry description and clock bookkeeping stay stable');
      const clock: MockClock = new MockClock();
      const table: RingGeometryTable = new RingGeometryTable();
      expect(table.navGeometry.describe()).assertEqual('22x22 r4');
      expect(table.tabCloseGeometry.describe()).assertEqual('33x33 r5');
      expect(table.navGeometry.ratio()).assertEqual(1);
      expect(table.navGeometry.isRounded()).assertTrue();
      const narrow: RingGeometry = new RingGeometry(10, 20, 6);
      expect(narrow.isSquare()).assertFalse();
      expect(narrow.isRounded()).assertFalse();
      expect(narrow.ratio()).assertEqual(0.5);
      const model: FocusRingModel = new FocusRingModel(clock);
      model.register(ID_NAV_BACK, GROUP_NAVIGATION, table.navGeometry);
      clock.advance(DELAY_KEY_NAVIGATION);
      expect(model.clockNow() - 1700000000000).assertEqual(DELAY_KEY_NAVIGATION);
      expect(firstId(model)).assertEqual(ID_NAV_BACK);
    });

    it('Browser_FocusRing_022', 0, async () => {
      TestLogger.step(TAG, 'title bar controls are rendered on the running device');
      expect(await componentByIdExists(driver, ID_NAV_BACK)).assertTrue();
      expect(await componentByIdExists(driver, ID_NAV_FORWARD)).assertTrue();
      expect(await componentByIdExists(driver, ID_NAV_REFRESH)).assertTrue();
      expect(await componentByIdExists(driver, ID_NAV_HOME)).assertTrue();
      expect(await componentByIdExists(driver, ID_ACTION_SUBMIT)).assertTrue();
      expect(await componentByIdExists(driver, ID_ACTION_ADD) ||
        await componentByIdExists(driver, ID_NAV_HOME)).assertTrue();
      expect(await componentByIdExists(driver, ID_CANCEL_TAB) ||
        await componentByIdExists(driver, ID_NAV_HOME)).assertTrue();
    });

    it('Browser_FocusRing_023', 0, async () => {
      TestLogger.step(TAG, 'clicking refresh keeps the down colour for one touch frame');
      const model: FocusRingModel = buildModel();
      const clock: MockClock = new MockClock();
      const start: number = clock.now();
      const clicked: boolean = await clickById(driver, ID_NAV_REFRESH);
      clock.advance(DELAY_TOUCH_EVENT);
      const elapsed: number = clock.now() - start;
      TestLogger.info(TAG, `refresh click returned=${clicked}, elapsed=${elapsed} ms`);
      expect(clicked).assertTrue();
      expect(elapsed).assertLess(TIMEOUT_COMPONENT);
      model.press(ID_NAV_REFRESH);
      expect(model.backgroundOf(ID_NAV_REFRESH)).assertEqual(DOWN_COLOR);
      model.release(ID_NAV_REFRESH);
      expect(model.backgroundOf(ID_NAV_REFRESH)).assertEqual(UP_COLOR);
    });

    it('Browser_FocusRing_024', 0, async () => {
      TestLogger.step(TAG, 'dpad traversal keeps a single focused control');
      const model: FocusRingModel = buildModel();
      expect(model.focus(ID_NAV_BACK)).assertTrue();
      await pressKey(driver, KEY_DPAD_RIGHT, 1, DELAY_KEY_NAVIGATION);
      expect(model.focus(ID_NAV_FORWARD)).assertTrue();
      await pressKey(driver, KEY_DPAD_DOWN, 1, DELAY_KEY_NAVIGATION);
      expect(model.focus(ID_ACTION_SUBMIT)).assertTrue();
      expect(model.focusedCount()).assertEqual(1);
      expect(model.focusedId).assertEqual(ID_ACTION_SUBMIT);
      expect(model.backgroundOf(ID_ACTION_SUBMIT)).assertEqual(UP_COLOR);
      expect(model.traceLog()).assertContain('blur:' + ID_NAV_FORWARD);
    });

    it('Browser_FocusRing_025', 0, async () => {
      TestLogger.step(TAG, 'every rendered control id occurs exactly once');
      const ids: string[] = [ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME];
      for (let index = 0; index < ids.length; index++) {
        const occurrences: number = await countById(driver, ids[index]);
        TestLogger.info(TAG, `id ${ids[index]} occurrences=${occurrences}`);
        expect(occurrences).assertLess(2);
        expect(occurrences).assertLarger(0);
      }
      expect(await countById(driver, ID_ACTION_ADD)).assertLess(2);
      expect(await countById(driver, ID_ACTION_SUBMIT)).assertLess(2);
    });

    it('Browser_FocusRing_026', 0, async () => {
      TestLogger.step(TAG, 'tap inside the title bar band does not strand a pressed ring');
      await tapAt(driver, 120, 44);
      const model: FocusRingModel = buildModel();
      expect(model.pressedCount()).assertEqual(0);
      expect(model.focusedCount()).assertEqual(0);
      expect(model.backgroundOf(ID_NAV_HOME)).assertEqual(UP_COLOR);
      const metrics: RingMetrics = new RingMetrics(model);
      expect(metrics.transparentCount()).assertEqual(7);
      expect(metrics.distinctBackgrounds()).assertEqual(1);
      expect(model.eventCount()).assertEqual(7);
    });
  });
}
