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
  getDriver, startBrowserApp, componentByIdExists, pressKey, serializedDelay,
  ID_INPUT_URL, ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME,
  ID_ACTION_SUBMIT, ID_ACTION_ADD, KEY_ENTER, KEY_DPAD_UP, KEY_DPAD_DOWN,
  KEY_DPAD_LEFT, KEY_DPAD_RIGHT, TIMEOUT_FOCUS_CHANGE, DELAY_KEY_NAVIGATION,
  TOLERANCE_FOCUS_CHANGE, PAD_HOME_PAGE
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserAccessibilityNavigationTest';

/* ------------------------------------------------------------------ */
/* Accessibility contract of common/TitleBar.ets                       */
/* ------------------------------------------------------------------ */

/**
 * Tab order of the tablet title bar as exposed to accessibility services.
 *
 * The layout row renders navigation buttons, then the url field, then the
 * action buttons. A screen reader however announces the address bar first:
 * the url field is the primary task of a browser, so it owns tab stop 0 and
 * the six image buttons follow in visual order.
 */
const TAB_ORDER: string[] = [
  ID_INPUT_URL,
  ID_NAV_BACK,
  ID_NAV_FORWARD,
  ID_NAV_REFRESH,
  ID_NAV_HOME,
  ID_ACTION_SUBMIT,
  ID_ACTION_ADD
];

const NAV_IDS: string[] = [ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME];
const ACTION_IDS: string[] = [ID_ACTION_SUBMIT, ID_ACTION_ADD];

const GROUP_TITLE: string = 'titleBar';
const GROUP_NAVIGATION: string = 'navigation';
const GROUP_ACTION: string = 'action';

const ROLE_BUTTON: string = 'button';
const ROLE_TEXT_INPUT: string = 'textInput';

const LABEL_BACK: string = 'Back';
const LABEL_FORWARD: string = 'Forward';
const LABEL_REFRESH: string = 'Refresh';
const LABEL_HOME: string = 'Home';
const LABEL_SUBMIT: string = 'Go';
const LABEL_ADD: string = 'New tab';
const LABEL_URL: string = 'Address and search bar';

const DESC_BACK: string = 'Returns to the previous page in this tab';
const DESC_FORWARD: string = 'Moves to the next page in this tab';
const DESC_REFRESH: string = 'Reloads the current page';
const DESC_HOME: string = 'Opens the built in home page';
const DESC_SUBMIT: string = 'Loads the address typed in the address bar';
const DESC_ADD: string = 'Opens an additional browser tab';
const DESC_URL: string = 'Type an address or a search word, then press enter';

const ORIENTATION_PORTRAIT: string = 'portrait';
const ORIENTATION_LANDSCAPE: string = 'landscape';

/* ------------------------------------------------------------------ */
/* Focus model                                                         */
/* ------------------------------------------------------------------ */

/** One accessibility focus target of the title bar. */
class FocusNode {
  id: string;
  label: string;
  description: string;
  role: string;
  group: string;
  order: number;
  focusable: boolean;
  visible: boolean;
  focused: boolean = false;

  constructor(id: string, label: string, description: string, role: string,
    group: string, order: number, focusable: boolean = true, visible: boolean = true) {
    this.id = id;
    this.label = label;
    this.description = description;
    this.role = role;
    this.group = group;
    this.order = order;
    this.focusable = focusable;
    this.visible = visible;
  }

  hasLabel(): boolean {
    return this.label.length > 0;
  }

  hasDescription(): boolean {
    return this.description.length > 0;
  }

  isReachable(): boolean {
    return this.focusable && this.visible;
  }

  isButton(): boolean {
    return this.role === ROLE_BUTTON;
  }

  summary(): string {
    return `${this.id}|${this.label}|${this.role}`;
  }
}

/** Ordered focus ring with wrap around and boundary accounting. */
class FocusChain {
  nodes: FocusNode[] = [];
  wrap: boolean = true;
  cursor: number = -1;
  boundaryHits: number = 0;
  moveLog: string[] = [];

  constructor(nodes: FocusNode[]) {
    this.nodes = nodes;
  }

  size(): number {
    return this.nodes.length;
  }

  reachable(): FocusNode[] {
    const result: FocusNode[] = [];
    for (let index = 0; index < this.nodes.length; index++) {
      if (this.nodes[index].isReachable()) {
        result.push(this.nodes[index]);
      }
    }
    return result;
  }

  reachableIds(): string[] {
    return this.reachable().map((node: FocusNode) => node.id);
  }

  enabledCount(): number {
    return this.reachable().length;
  }

  indexOf(id: string): number {
    for (let index = 0; index < this.nodes.length; index++) {
      if (this.nodes[index].id === id) {
        return index;
      }
    }
    return -1;
  }

  nodeOf(id: string): FocusNode | null {
    const index: number = this.indexOf(id);
    return index < 0 ? null : this.nodes[index];
  }

  currentNode(): FocusNode | null {
    if (this.cursor < 0 || this.cursor >= this.nodes.length) {
      return null;
    }
    return this.nodes[this.cursor];
  }

  currentId(): string {
    const node: FocusNode | null = this.currentNode();
    return node === null ? '' : node.id;
  }

  focusedCount(): number {
    let total: number = 0;
    for (let index = 0; index < this.nodes.length; index++) {
      if (this.nodes[index].focused) {
        total += 1;
      }
    }
    return total;
  }

  clearFocus(): void {
    for (let index = 0; index < this.nodes.length; index++) {
      this.nodes[index].focused = false;
    }
  }

  focusIndex(index: number): FocusNode | null {
    if (index < 0 || index >= this.nodes.length) {
      return null;
    }
    if (!this.nodes[index].isReachable()) {
      return null;
    }
    this.clearFocus();
    this.cursor = index;
    this.nodes[index].focused = true;
    this.moveLog.push(this.nodes[index].id);
    return this.nodes[index];
  }

  focusById(id: string): boolean {
    const index: number = this.indexOf(id);
    if (index < 0) {
      return false;
    }
    return this.focusIndex(index) !== null;
  }

  focusFirst(): FocusNode | null {
    for (let index = 0; index < this.nodes.length; index++) {
      if (this.nodes[index].isReachable()) {
        return this.focusIndex(index);
      }
    }
    return null;
  }

  focusLast(): FocusNode | null {
    for (let index = this.nodes.length - 1; index >= 0; index--) {
      if (this.nodes[index].isReachable()) {
        return this.focusIndex(index);
      }
    }
    return null;
  }

  private step(offset: number): FocusNode | null {
    const total: number = this.nodes.length;
    if (total === 0) {
      return null;
    }
    if (this.cursor < 0) {
      return offset >= 0 ? this.focusFirst() : this.focusLast();
    }
    let next: number = this.cursor;
    for (let attempt = 0; attempt < total; attempt++) {
      next = next + offset;
      if (next >= total || next < 0) {
        if (!this.wrap) {
          this.boundaryHits += 1;
          return this.currentNode();
        }
        next = ((next % total) + total) % total;
      }
      if (this.nodes[next].isReachable()) {
        return this.focusIndex(next);
      }
    }
    return this.currentNode();
  }

  focusNext(): FocusNode | null {
    return this.step(1);
  }

  focusPrev(): FocusNode | null {
    return this.step(-1);
  }

  /** D-pad right behaves exactly like a forward tab move. */
  focusRight(): FocusNode | null {
    return this.step(1);
  }

  /** D-pad left behaves exactly like a backward tab move. */
  focusLeft(): FocusNode | null {
    return this.step(-1);
  }

  /** D-pad down jumps to the first control of the next group. */
  focusDown(): FocusNode | null {
    return this.focusGroup(1);
  }

  /** D-pad up jumps to the first control of the previous group. */
  focusUp(): FocusNode | null {
    return this.focusGroup(-1);
  }

  focusGroup(offset: number): FocusNode | null {
    const current: FocusNode | null = this.currentNode();
    if (current === null) {
      return offset >= 0 ? this.focusFirst() : this.focusLast();
    }
    const groups: string[] = this.groupOrder();
    const groupIndex: number = groups.indexOf(current.group);
    let target: number = groupIndex + offset;
    if (target >= groups.length || target < 0) {
      if (!this.wrap) {
        this.boundaryHits += 1;
        return current;
      }
      target = ((target % groups.length) + groups.length) % groups.length;
    }
    for (let index = 0; index < this.nodes.length; index++) {
      if (this.nodes[index].group === groups[target] && this.nodes[index].isReachable()) {
        return this.focusIndex(index);
      }
    }
    return current;
  }

  groupOrder(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.nodes.length; index++) {
      if (this.nodes[index].isReachable() && result.indexOf(this.nodes[index].group) < 0) {
        result.push(this.nodes[index].group);
      }
    }
    return result;
  }

  blur(): void {
    this.clearFocus();
    this.cursor = -1;
  }

  isFocused(id: string): boolean {
    const node: FocusNode | null = this.nodeOf(id);
    return node !== null && node.focused;
  }

  orderOf(id: string): number {
    const node: FocusNode | null = this.nodeOf(id);
    return node === null ? -1 : node.order;
  }

  /** Visits every reachable node once and returns the announcement order. */
  announceAll(): string[] {
    const result: string[] = [];
    const saved: number = this.cursor;
    this.focusFirst();
    for (let index = 0; index < this.enabledCount(); index++) {
      result.push(this.currentId());
      this.focusNext();
    }
    this.cursor = saved;
    return result;
  }

  resetMetrics(): void {
    this.boundaryHits = 0;
    this.moveLog = [];
  }
}

/* ------------------------------------------------------------------ */
/* Accessibility catalog                                               */
/* ------------------------------------------------------------------ */

/** Label and description registry, mirroring the accessibility props. */
class A11yCatalog {
  private labels: Map<string, string> = new Map<string, string>();
  private descriptions: Map<string, string> = new Map<string, string>();
  private roles: Map<string, string> = new Map<string, string>();

  constructor() {
    this.register(ID_INPUT_URL, LABEL_URL, DESC_URL, ROLE_TEXT_INPUT);
    this.register(ID_NAV_BACK, LABEL_BACK, DESC_BACK, ROLE_BUTTON);
    this.register(ID_NAV_FORWARD, LABEL_FORWARD, DESC_FORWARD, ROLE_BUTTON);
    this.register(ID_NAV_REFRESH, LABEL_REFRESH, DESC_REFRESH, ROLE_BUTTON);
    this.register(ID_NAV_HOME, LABEL_HOME, DESC_HOME, ROLE_BUTTON);
    this.register(ID_ACTION_SUBMIT, LABEL_SUBMIT, DESC_SUBMIT, ROLE_BUTTON);
    this.register(ID_ACTION_ADD, LABEL_ADD, DESC_ADD, ROLE_BUTTON);
  }

  register(id: string, label: string, description: string, role: string): void {
    this.labels.set(id, label);
    this.descriptions.set(id, description);
    this.roles.set(id, role);
  }

  hasEntry(id: string): boolean {
    return this.labels.has(id) && this.descriptions.has(id);
  }

  labelOf(id: string): string {
    const value: string | undefined = this.labels.get(id);
    return value === undefined ? '' : value;
  }

  descriptionOf(id: string): string {
    const value: string | undefined = this.descriptions.get(id);
    return value === undefined ? '' : value;
  }

  roleOf(id: string): string {
    const value: string | undefined = this.roles.get(id);
    return value === undefined ? '' : value;
  }

  size(): number {
    return this.labels.size;
  }

  missingEntries(ids: string[]): string[] {
    const result: string[] = [];
    for (let index = 0; index < ids.length; index++) {
      if (!this.hasEntry(ids[index])) {
        result.push(ids[index]);
      }
    }
    return result;
  }

  /** Returns every id whose label collides with another id. */
  duplicateLabels(): string[] {
    const result: string[] = [];
    const seen: Map<string, string> = new Map<string, string>();
    this.labels.forEach((label: string, id: string) => {
      const owner: string | undefined = seen.get(label);
      if (owner !== undefined) {
        result.push(owner);
        result.push(id);
      } else {
        seen.set(label, id);
      }
    });
    return result;
  }

  /** Full accessibility audit of a focus chain, empty means clean. */
  audit(chain: FocusChain): string[] {
    const violations: string[] = [];
    const nodes: FocusNode[] = chain.reachable();
    for (let index = 0; index < nodes.length; index++) {
      const node: FocusNode = nodes[index];
      if (!node.hasLabel()) {
        violations.push(`missing label: ${node.id}`);
      }
      if (!node.hasDescription()) {
        violations.push(`missing description: ${node.id}`);
      }
      if (node.label !== this.labelOf(node.id)) {
        violations.push(`label mismatch: ${node.id}`);
      }
      if (node.description !== this.descriptionOf(node.id)) {
        violations.push(`description mismatch: ${node.id}`);
      }
    }
    const duplicates: string[] = this.duplicateLabels();
    for (let index = 0; index < duplicates.length; index++) {
      violations.push(`duplicate label: ${duplicates[index]}`);
    }
    return violations;
  }
}

/* ------------------------------------------------------------------ */
/* Key routing                                                         */
/* ------------------------------------------------------------------ */

/** Translates hardware key codes into focus ring operations. */
class KeyRouter {
  chain: FocusChain;
  activations: string[] = [];
  ignoredKeys: number[] = [];

  constructor(chain: FocusChain) {
    this.chain = chain;
  }

  handle(key: number): string {
    if (key === KEY_DPAD_RIGHT) {
      this.chain.focusRight();
      return 'right';
    }
    if (key === KEY_DPAD_LEFT) {
      this.chain.focusLeft();
      return 'left';
    }
    if (key === KEY_DPAD_DOWN) {
      this.chain.focusDown();
      return 'down';
    }
    if (key === KEY_DPAD_UP) {
      this.chain.focusUp();
      return 'up';
    }
    if (key === KEY_ENTER) {
      const id: string = this.chain.currentId();
      if (id.length > 0) {
        this.activations.push(id);
        return `activate:${id}`;
      }
      return 'activate:none';
    }
    this.ignoredKeys.push(key);
    return 'ignored';
  }

  press(key: number, times: number): void {
    for (let index = 0; index < times; index++) {
      this.handle(key);
    }
  }

  activationCount(): number {
    return this.activations.length;
  }

  lastActivation(): string {
    return this.activations.length === 0 ? '' : this.activations[this.activations.length - 1];
  }

  reset(): void {
    this.activations = [];
    this.ignoredKeys = [];
  }
}

/* ------------------------------------------------------------------ */
/* Fixtures                                                            */
/* ------------------------------------------------------------------ */

function buildFocusChain(catalog: A11yCatalog, orientation: string = ORIENTATION_LANDSCAPE): FocusChain {
  const nodes: FocusNode[] = [];
  for (let index = 0; index < TAB_ORDER.length; index++) {
    const id: string = TAB_ORDER[index];
    let group: string = GROUP_NAVIGATION;
    if (id === ID_INPUT_URL) {
      group = GROUP_TITLE;
    } else if (ACTION_IDS.indexOf(id) >= 0) {
      group = GROUP_ACTION;
    }
    const role: string = id === ID_INPUT_URL ? ROLE_TEXT_INPUT : ROLE_BUTTON;
    nodes.push(new FocusNode(id, catalog.labelOf(id), catalog.descriptionOf(id),
      role, group, index, true, true));
  }
  return new FocusChain(nodes);
}

/** Portrait keeps the same stops but hides the tab strip add button. */
function buildPortraitChain(catalog: A11yCatalog): FocusChain {
  const chain: FocusChain = buildFocusChain(catalog, ORIENTATION_PORTRAIT);
  const add: FocusNode | null = chain.nodeOf(ID_ACTION_ADD);
  if (add !== null) {
    add.visible = false;
  }
  return chain;
}

function measureFocusLatency(clock: MockClock, samples: number): number[] {
  const durations: number[] = [];
  for (let index = 0; index < samples; index++) {
    const start: number = clock.now();
    clock.advance(DELAY_KEY_NAVIGATION + (index % 3) * 20);
    durations.push(clock.now() - start);
  }
  return durations;
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserAccessibilityNavigationTest() {
  describe('browserAccessibilityNavigationTest', () => {
    let driver: Driver = getDriver();
    let catalog: A11yCatalog = new A11yCatalog();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE / 2);
      TestLogger.info(TAG, `tab order: ${TAB_ORDER.join(' -> ')}`);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_A11y_Nav_001', 0, async () => {
      TestLogger.step(TAG, 'address bar owns the first tab stop');
      const chain: FocusChain = buildFocusChain(catalog);
      expect(chain.reachableIds().join(',')).assertEqual(TAB_ORDER.join(','));
      expect(chain.reachableIds()[0]).assertEqual(ID_INPUT_URL);
      expect(chain.orderOf(ID_INPUT_URL)).assertEqual(0);
      expect(chain.orderOf(ID_NAV_BACK)).assertEqual(1);
      expect(chain.orderOf(ID_NAV_BACK)).assertLarger(chain.orderOf(ID_INPUT_URL));
    });

    it('Browser_A11y_Nav_002', 0, async () => {
      TestLogger.step(TAG, 'navigation buttons follow the address bar');
      const chain: FocusChain = buildFocusChain(catalog);
      expect(chain.enabledCount()).assertEqual(TAB_ORDER.length);
      expect(chain.enabledCount()).assertEqual(7);
      expect(NAV_IDS.length).assertEqual(4);
      for (let index = 0; index < NAV_IDS.length; index++) {
        expect(chain.indexOf(NAV_IDS[index])).assertLarger(0);
        expect(chain.orderOf(NAV_IDS[index])).assertLess(chain.orderOf(ID_ACTION_SUBMIT));
      }
      expect(chain.orderOf(ID_NAV_BACK)).assertLess(chain.orderOf(ID_NAV_FORWARD));
      expect(chain.orderOf(ID_NAV_REFRESH)).assertLess(chain.orderOf(ID_NAV_HOME));
    });

    it('Browser_A11y_Nav_003', 0, async () => {
      TestLogger.step(TAG, 'action buttons close the tab sequence');
      const chain: FocusChain = buildFocusChain(catalog);
      expect(ACTION_IDS.length).assertEqual(2);
      expect(chain.orderOf(ID_ACTION_SUBMIT)).assertEqual(5);
      expect(chain.orderOf(ID_ACTION_ADD)).assertEqual(6);
      expect(chain.orderOf(ID_ACTION_SUBMIT)).assertLarger(chain.orderOf(ID_NAV_HOME));
      expect(chain.orderOf(ID_ACTION_ADD)).assertLarger(chain.orderOf(ID_ACTION_SUBMIT));
      const last: FocusNode | null = chain.nodes[chain.nodes.length - 1];
      expect(last !== null).assertTrue();
    });

    it('Browser_A11y_Nav_004', 0, async () => {
      TestLogger.step(TAG, 'every focus stop carries a unique id');
      const chain: FocusChain = buildFocusChain(catalog);
      const ids: string[] = chain.reachableIds();
      const unique: Map<string, number> = new Map<string, number>();
      for (let index = 0; index < ids.length; index++) {
        const seen: number = unique.get(ids[index]) === undefined ? 0 : 1;
        unique.set(ids[index], seen + 1);
      }
      expect(unique.size).assertEqual(ids.length);
      unique.forEach((count: number, id: string) => {
        expect(count).assertEqual(1);
        expect(id.length).assertLarger(0);
      });
      expect(chain.indexOf(ID_INPUT_URL)).assertEqual(0);
    });

    it('Browser_A11y_Nav_005', 0, async () => {
      TestLogger.step(TAG, 'every focus stop carries label and description');
      const chain: FocusChain = buildFocusChain(catalog);
      const violations: string[] = catalog.audit(chain);
      TestLogger.info(TAG, `audit violations: ${violations.length}`);
      expect(violations.length).assertEqual(0);
      expect(catalog.size()).assertEqual(7);
      expect(catalog.missingEntries(TAB_ORDER).length).assertEqual(0);
      expect(catalog.duplicateLabels().length).assertEqual(0);
      for (let index = 0; index < TAB_ORDER.length; index++) {
        expect(catalog.labelOf(TAB_ORDER[index]).length).assertLarger(0);
        expect(catalog.descriptionOf(TAB_ORDER[index]).length).assertLarger(0);
      }
    });

    it('Browser_A11y_Nav_006', 0, async () => {
      TestLogger.step(TAG, 'right key advances focus one stop');
      const chain: FocusChain = buildFocusChain(catalog);
      chain.focusFirst();
      expect(chain.currentId()).assertEqual(ID_INPUT_URL);
      chain.focusRight();
      expect(chain.currentId()).assertEqual(ID_NAV_BACK);
      chain.focusRight();
      expect(chain.currentId()).assertEqual(ID_NAV_FORWARD);
      chain.focusRight();
      expect(chain.currentId()).assertEqual(ID_NAV_REFRESH);
      expect(chain.focusedCount()).assertEqual(1);
    });

    it('Browser_A11y_Nav_007', 0, async () => {
      TestLogger.step(TAG, 'left key rewinds focus one stop');
      const chain: FocusChain = buildFocusChain(catalog);
      chain.focusById(ID_NAV_REFRESH);
      expect(chain.currentId()).assertEqual(ID_NAV_REFRESH);
      chain.focusLeft();
      expect(chain.currentId()).assertEqual(ID_NAV_FORWARD);
      chain.focusLeft();
      expect(chain.currentId()).assertEqual(ID_NAV_BACK);
      chain.focusLeft();
      expect(chain.currentId()).assertEqual(ID_INPUT_URL);
      expect(chain.focusedCount()).assertEqual(1);
    });

    it('Browser_A11y_Nav_008', 0, async () => {
      TestLogger.step(TAG, 'focus wraps forward from the last stop to the first');
      const chain: FocusChain = buildFocusChain(catalog);
      expect(chain.wrap).assertTrue();
      chain.focusLast();
      expect(chain.currentId()).assertEqual(ID_ACTION_ADD);
      chain.focusRight();
      expect(chain.currentId()).assertEqual(ID_INPUT_URL);
      expect(chain.boundaryHits).assertEqual(0);
      chain.focusLeft();
      expect(chain.currentId()).assertEqual(ID_ACTION_ADD);
      expect(chain.boundaryHits).assertEqual(0);
    });

    it('Browser_A11y_Nav_009', 0, async () => {
      TestLogger.step(TAG, 'clamped focus reports boundary hits instead of wrapping');
      const chain: FocusChain = buildFocusChain(catalog);
      chain.wrap = false;
      chain.focusLast();
      expect(chain.currentId()).assertEqual(ID_ACTION_ADD);
      chain.focusRight();
      expect(chain.currentId()).assertEqual(ID_ACTION_ADD);
      expect(chain.boundaryHits).assertEqual(1);
      chain.focusRight();
      expect(chain.boundaryHits).assertEqual(2);
      chain.focusFirst();
      chain.focusLeft();
      expect(chain.currentId()).assertEqual(ID_INPUT_URL);
      expect(chain.boundaryHits).assertEqual(3);
    });

    it('Browser_A11y_Nav_010', 0, async () => {
      TestLogger.step(TAG, 'focusById moves the ring and keeps exactly one selection');
      const chain: FocusChain = buildFocusChain(catalog);
      for (let index = 0; index < TAB_ORDER.length; index++) {
        const moved: boolean = chain.focusById(TAB_ORDER[index]);
        expect(moved).assertTrue();
        expect(chain.currentId()).assertEqual(TAB_ORDER[index]);
        expect(chain.focusedCount()).assertEqual(1);
        expect(chain.isFocused(TAB_ORDER[index])).assertTrue();
      }
      expect(chain.focusById('missingButton')).assertFalse();
      expect(chain.focusedCount()).assertEqual(1);
      expect(chain.currentId()).assertEqual(ID_ACTION_ADD);
    });

    it('Browser_A11y_Nav_011', 0, async () => {
      TestLogger.step(TAG, 'blur clears the ring without moving the cursor order');
      const chain: FocusChain = buildFocusChain(catalog);
      chain.focusById(ID_NAV_FORWARD);
      expect(chain.focusedCount()).assertEqual(1);
      chain.blur();
      expect(chain.focusedCount()).assertEqual(0);
      expect(chain.currentId()).assertEqual('');
      expect(chain.currentNode() === null).assertTrue();
      expect(chain.enabledCount()).assertEqual(7);
      chain.focusNext();
      expect(chain.currentId()).assertEqual(ID_INPUT_URL);
    });

    it('Browser_A11y_Nav_012', 0, async () => {
      TestLogger.step(TAG, 'down key jumps to the next accessibility group');
      const chain: FocusChain = buildFocusChain(catalog);
      expect(chain.groupOrder().join(',')).assertEqual('titleBar,navigation,action');
      chain.focusFirst();
      expect(chain.currentId()).assertEqual(ID_INPUT_URL);
      chain.focusDown();
      expect(chain.currentId()).assertEqual(ID_NAV_BACK);
      chain.focusDown();
      expect(chain.currentId()).assertEqual(ID_ACTION_SUBMIT);
      chain.focusDown();
      expect(chain.currentId()).assertEqual(ID_INPUT_URL);
      expect(chain.boundaryHits).assertEqual(0);
    });

    it('Browser_A11y_Nav_013', 0, async () => {
      TestLogger.step(TAG, 'up key walks the accessibility groups backwards');
      const chain: FocusChain = buildFocusChain(catalog);
      chain.focusById(ID_ACTION_ADD);
      expect(chain.currentId()).assertEqual(ID_ACTION_ADD);
      chain.focusUp();
      expect(chain.currentId()).assertEqual(ID_NAV_BACK);
      chain.focusUp();
      expect(chain.currentId()).assertEqual(ID_INPUT_URL);
      chain.focusUp();
      expect(chain.currentId()).assertEqual(ID_ACTION_SUBMIT);
      const groups: string[] = chain.groupOrder();
      expect(groups.length).assertEqual(3);
    });

    it('Browser_A11y_Nav_014', 0, async () => {
      TestLogger.step(TAG, 'invisible controls are skipped by the ring');
      const chain: FocusChain = buildPortraitChain(catalog);
      expect(chain.enabledCount()).assertEqual(6);
      expect(chain.reachableIds().indexOf(ID_ACTION_ADD)).assertEqual(-1);
      chain.focusLast();
      expect(chain.currentId()).assertEqual(ID_ACTION_SUBMIT);
      chain.focusRight();
      expect(chain.currentId()).assertEqual(ID_INPUT_URL);
      expect(chain.focusById(ID_ACTION_ADD)).assertFalse();
      expect(chain.focusedCount()).assertEqual(1);
    });

    it('Browser_A11y_Nav_015', 0, async () => {
      TestLogger.step(TAG, 'focus order is stable across re-renders');
      const first: FocusChain = buildFocusChain(catalog);
      const second: FocusChain = buildFocusChain(catalog);
      expect(first.reachableIds().join(',')).assertEqual(second.reachableIds().join(','));
      const firstOrders: number[] = [];
      const secondOrders: number[] = [];
      for (let index = 0; index < TAB_ORDER.length; index++) {
        firstOrders.push(first.orderOf(TAB_ORDER[index]));
        secondOrders.push(second.orderOf(TAB_ORDER[index]));
      }
      expect(firstOrders.join(',')).assertEqual(secondOrders.join(','));
      expect(firstOrders[0]).assertEqual(0);
      expect(firstOrders[firstOrders.length - 1]).assertEqual(6);
    });

    it('Browser_A11y_Nav_016', 0, async () => {
      TestLogger.step(TAG, 'enter activates the focused control only');
      const chain: FocusChain = buildFocusChain(catalog);
      const router: KeyRouter = new KeyRouter(chain);
      chain.focusById(ID_NAV_REFRESH);
      expect(router.handle(KEY_ENTER)).assertEqual(`activate:${ID_NAV_REFRESH}`);
      expect(router.lastActivation()).assertEqual(ID_NAV_REFRESH);
      expect(router.activationCount()).assertEqual(1);
      chain.blur();
      expect(router.handle(KEY_ENTER)).assertEqual('activate:none');
      expect(router.activationCount()).assertEqual(1);
    });

    it('Browser_A11y_Nav_017', 0, async () => {
      TestLogger.step(TAG, 'dpad keys are routed and unknown keys are ignored');
      const chain: FocusChain = buildFocusChain(catalog);
      const router: KeyRouter = new KeyRouter(chain);
      chain.focusFirst();
      expect(router.handle(KEY_DPAD_RIGHT)).assertEqual('right');
      expect(chain.currentId()).assertEqual(ID_NAV_BACK);
      expect(router.handle(KEY_DPAD_RIGHT)).assertEqual('right');
      expect(chain.currentId()).assertEqual(ID_NAV_FORWARD);
      expect(router.handle(KEY_DPAD_LEFT)).assertEqual('left');
      expect(chain.currentId()).assertEqual(ID_NAV_BACK);
      expect(router.handle(KEY_DPAD_DOWN)).assertEqual('down');
      expect(router.handle(KEY_DPAD_UP)).assertEqual('up');
      expect(router.handle(9999)).assertEqual('ignored');
      expect(router.ignoredKeys.length).assertEqual(1);
      expect(router.activationCount()).assertEqual(0);

    });

    it('Browser_A11y_Nav_018', 0, async () => {
      TestLogger.step(TAG, 'announceAll reports every stop exactly once');
      const chain: FocusChain = buildFocusChain(catalog);
      const announced: string[] = chain.announceAll();
      expect(announced.length).assertEqual(7);
      expect(announced[0]).assertEqual(ID_INPUT_URL);
      expect(announced[announced.length - 1]).assertEqual(ID_ACTION_ADD);
      const lookup: Map<string, number> = new Map<string, number>();
      for (let index = 0; index < announced.length; index++) {
        lookup.set(announced[index], 1);
      }
      expect(lookup.size).assertEqual(7);
      TestLogger.info(TAG, `announcement order: ${announced.join(' > ')}`);
    });

    it('Browser_A11y_Nav_019', 0, async () => {
      TestLogger.step(TAG, 'home button announces the built in entry page');
      const chain: FocusChain = buildFocusChain(catalog);
      const home: FocusNode | null = chain.nodeOf(ID_NAV_HOME);
      expect(home !== null).assertTrue();
      if (home !== null) {
        expect(home.label).assertEqual(LABEL_HOME);
        expect(home.description).assertEqual(DESC_HOME);
        expect(home.hasLabel()).assertTrue();
        expect(home.isButton()).assertTrue();
        expect(home.summary()).assertContain(ID_NAV_HOME);
      }
      expect(PAD_HOME_PAGE).assertEqual('pad.html');
      expect(catalog.roleOf(ID_INPUT_URL)).assertEqual(ROLE_TEXT_INPUT);
      expect(catalog.roleOf(ID_ACTION_ADD)).assertEqual(ROLE_BUTTON);
    });

    it('Browser_A11y_Nav_020', 0, async () => {
      TestLogger.step(TAG, 'url input is present on the device at launch');
      const inputPresent: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      const backPresent: boolean = await componentByIdExists(driver, ID_NAV_BACK);
      TestLogger.info(TAG, `url input present=${inputPresent}, back button present=${backPresent}`);
      expect(inputPresent).assertTrue();
      const chain: FocusChain = buildFocusChain(catalog);
      expect(chain.reachableIds()[0]).assertEqual(ID_INPUT_URL);
    });

    it('Browser_A11y_Nav_021', 0, async () => {
      TestLogger.step(TAG, 'dpad presses on device keep the model cursor in range');
      const chain: FocusChain = buildFocusChain(catalog);
      chain.focusFirst();
      for (let index = 0; index < 4; index++) {
        await pressKey(driver, KEY_DPAD_RIGHT, 1, DELAY_KEY_NAVIGATION);
        chain.focusRight();
        await serializedDelay(driver, TOLERANCE_FOCUS_CHANGE);
      }
      TestLogger.info(TAG, `cursor after four dpad presses: ${chain.currentId()}`);
      expect(chain.currentId()).assertEqual(ID_NAV_HOME);
      expect(chain.focusedCount()).assertEqual(1);
      const ids: string[] = chain.reachableIds();
      expect(ids.indexOf(chain.currentId())).assertLarger(-1);
    });

    it('Browser_A11y_Nav_022', 0, async () => {
      TestLogger.step(TAG, 'focus latency stays inside the navigation budget');
      const clock: MockClock = new MockClock();
      const samples: number[] = measureFocusLatency(clock, 8);
      expect(samples.length).assertEqual(8);
      let worst: number = 0;
      for (let index = 0; index < samples.length; index++) {
        expect(samples[index]).assertLarger(0);
        if (samples[index] > worst) {
          worst = samples[index];
        }
      }
      TestLogger.info(TAG, `worst focus latency: ${worst} ms, budget ${TIMEOUT_FOCUS_CHANGE} ms`);
      expect(worst).assertLess(TIMEOUT_FOCUS_CHANGE);
      expect(clock.now()).assertLarger(0);
    });

    it('Browser_A11y_Nav_023', 0, async () => {
      TestLogger.step(TAG, 'focus ring survives tab switching without stale ids');
      const chain: FocusChain = buildFocusChain(catalog);
      const browser: MockBrowser = new MockBrowser(2);
      chain.focusById(ID_NAV_HOME);
      const before: string = chain.currentId();
      browser.selectTab(1);
      expect(browser.getTabArrayIndex()).assertEqual(1);
      expect(chain.currentId()).assertEqual(before);
      chain.resetMetrics();
      expect(chain.boundaryHits).assertEqual(0);
      expect(chain.moveLog.length).assertEqual(0);
      expect(chain.focusedCount()).assertEqual(1);
      expect(browser.getTabKeys().join(',')).assertEqual('0,1');
    });

    it('Browser_A11y_Nav_024', 0, async () => {
      TestLogger.step(TAG, 'focus ring re-entry restores the previous stop');
      const chain: FocusChain = buildFocusChain(catalog);
      const router: KeyRouter = new KeyRouter(chain);
      chain.focusById(ID_ACTION_SUBMIT);
      const parked: string = chain.currentId();
      expect(parked).assertEqual(ID_ACTION_SUBMIT);
      chain.blur();
      expect(chain.focusedCount()).assertEqual(0);
      router.press(KEY_DPAD_RIGHT, 3);
      expect(chain.currentId()).assertEqual(ID_NAV_FORWARD);
      expect(router.activationCount()).assertEqual(0);
      chain.focusById(parked);
      expect(chain.currentId()).assertEqual(ID_ACTION_SUBMIT);
      expect(chain.focusedCount()).assertEqual(1);
      expect(chain.moveLog.length).assertEqual(5);
      TestLogger.info(TAG, `focus re-entry restored stop ${parked}`);
    });

    it('Browser_A11y_Nav_025', 0, async () => {
      TestLogger.step(TAG, 'role census separates input from the six buttons');
      const localCatalog: A11yCatalog = new A11yCatalog();
      let buttons: number = 0;
      let inputs: number = 0;
      for (let index = 0; index < TAB_ORDER.length; index++) {
        const role: string = localCatalog.roleOf(TAB_ORDER[index]);
        if (role === ROLE_BUTTON) {
          buttons += 1;
        } else if (role === ROLE_TEXT_INPUT) {
          inputs += 1;
        }
      }
      expect(buttons).assertEqual(6);
      expect(inputs).assertEqual(1);
      expect(localCatalog.roleOf(ID_NAV_HOME)).assertEqual(ROLE_BUTTON);
      expect(localCatalog.roleOf(ID_INPUT_URL)).assertEqual(ROLE_TEXT_INPUT);
      expect(localCatalog.descriptionOf(ID_NAV_HOME).indexOf('home') >= 0).assertTrue();
      TestLogger.info(TAG, `role census buttons=${buttons} inputs=${inputs}`);
    });
  });
}
