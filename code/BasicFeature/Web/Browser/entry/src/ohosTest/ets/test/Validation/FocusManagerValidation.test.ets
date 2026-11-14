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
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById,
  pressKey, waitForId,
  ID_INPUT_URL, ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME,
  ID_ACTION_SUBMIT, ID_ACTION_ADD, ID_CANCEL_TAB,
  KEY_DPAD_UP, KEY_DPAD_DOWN, KEY_DPAD_LEFT, KEY_DPAD_RIGHT,
  TIMEOUT_COMPONENT, TIMEOUT_FOCUS_CHANGE, DELAY_KEY_NAVIGATION,
  TOLERANCE_FOCUS_CHANGE
} from '../Shared/BrowserTestKit';
import { MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserFocusManagerValidationTest';

/* ------------------------------------------------------------------ */
/* Focus vocabulary of the browser layouts                             */
/* ------------------------------------------------------------------ */

const GROUP_TITLE: string = 'titleBar';
const GROUP_TABS: string = 'tabStrip';
const GROUP_WEB: string = 'webArea';
const GROUP_OVERLAY: string = 'overlay';

const NODE_INPUT: string = ID_INPUT_URL;
const NODE_BACK: string = ID_NAV_BACK;
const NODE_FORWARD: string = ID_NAV_FORWARD;
const NODE_REFRESH: string = ID_NAV_REFRESH;
const NODE_HOME: string = ID_NAV_HOME;
const NODE_SUBMIT: string = ID_ACTION_SUBMIT;
const NODE_ADD: string = ID_ACTION_ADD;
const NODE_CANCEL: string = ID_CANCEL_TAB;
const NODE_TAB_PREFIX: string = 'tabItem';
const NODE_MENU: string = 'menuPanel';
const NODE_OVERLAY_OK: string = 'overlayConfirm';

const DIR_LEFT: string = 'left';
const DIR_RIGHT: string = 'right';
const DIR_UP: string = 'up';
const DIR_DOWN: string = 'down';

const EVT_FOCUS: string = 'focus';
const EVT_BLUR: string = 'blur';
const EVT_DENY: string = 'deny';
const EVT_DISABLE: string = 'disable';
const EVT_RESTORE: string = 'restore';
const EVT_UNREGISTER: string = 'unregister';
const EVT_MOVE: string = 'move';

const ISSUE_DUPLICATE_ID: string = 'duplicate-id';
const ISSUE_FOCUSED_MISSING: string = 'focused-missing';
const ISSUE_FOCUSED_DISABLED: string = 'focused-disabled';
const ISSUE_DANGLING_STACK: string = 'dangling-stack';
const ISSUE_EMPTY_GROUP: string = 'empty-group';
const ISSUE_UI_DESYNC: string = 'ui-desync';

const NO_FOCUS: string = '';
const MAX_EVENT_LOG: number = 128;
const MAX_STACK_DEPTH: number = 8;
const NO_DISTANCE: number = 1000000;

/* ------------------------------------------------------------------ */
/* Local focus model                                                   */
/* ------------------------------------------------------------------ */

/** One focusable stop of the current layout. */
class FocusNode {
  id: string;
  group: string;
  row: number;
  col: number;
  order: number;
  enabled: boolean;
  visible: boolean;

  constructor(id: string, group: string, row: number, col: number, order: number,
    enabled: boolean = true, visible: boolean = true) {
    this.id = id;
    this.group = group;
    this.row = row;
    this.col = col;
    this.order = order;
    this.enabled = enabled;
    this.visible = visible;
  }

  isFocusable(): boolean {
    return this.enabled && this.visible;
  }

  cell(): string {
    return `${this.row}:${this.col}`;
  }

  describe(): string {
    return `${this.id}@${this.group}[${this.row},${this.col}]`;
  }
}

/** One focus transition, kept for ordering assertions. */
class FocusEvent {
  type: string;
  fromId: string;
  toId: string;
  reason: string;
  timestamp: number;

  constructor(type: string, fromId: string, toId: string, reason: string,
    timestamp: number) {
    this.type = type;
    this.fromId = fromId;
    this.toId = toId;
    this.reason = reason;
    this.timestamp = timestamp;
  }

  describe(): string {
    return `${this.type}:${this.fromId}->${this.toId}(${this.reason})`;
  }
}

/** Saved focus used to restore the ring after a transient surface closes. */
class FocusStackEntry {
  id: string;
  reason: string;

  constructor(id: string, reason: string) {
    this.id = id;
    this.reason = reason;
  }
}
/* ------------------------------------------------------------------ */
/* Focus manager under validation                                      */
/* ------------------------------------------------------------------ */

/**
 * Deterministic mirror of the focus behaviour used by the browser shell.
 *
 * The manager owns the focus ring, the directional movement policy, the
 * overlay focus stack and the focus event log. Every mutation is validated so
 * that a disabled or unregistered node can never become the focused node and
 * leave the highlight of the UI pointing at a dead component.
 */
class LocalFocusManager {
  nodes: FocusNode[] = [];
  focusedId: string = NO_FOCUS;
  uiFocusedId: string = NO_FOCUS;
  wrap: boolean = true;
  crossGroup: boolean = true;
  stack: FocusStackEntry[] = [];
  events: FocusEvent[] = [];
  moves: number = 0;
  boundaryHits: number = 0;
  groupBoundaryHits: number = 0;
  deniedCount: number = 0;
  restoreCount: number = 0;
  relocationCount: number = 0;
  private nextOrder: number = 0;
  private listeners: string[] = [];
  private delivered: number = 0;
  private clock: MockClock;

  constructor(clock: MockClock = new MockClock(1700000000000)) {
    this.clock = clock;
  }

  /* ---------------- registration ---------------- */

  /** Registers one stop; duplicate ids and empty ids are refused. */
  register(id: string, group: string, row: number, col: number,
    enabled: boolean = true, visible: boolean = true): boolean {
    if (id === null || id === undefined || id.length === 0) {
      return false;
    }
    if (group === null || group === undefined || group.length === 0) {
      return false;
    }
    if (this.nodeOf(id) !== null) {
      return false;
    }
    this.nodes.push(new FocusNode(id, group, row, col, this.nextOrder, enabled, visible));
    this.nextOrder += 1;
    return true;
  }

  registerMany(ids: string[], group: string, row: number,
    startCol: number = 0): number {
    let registered: number = 0;
    for (let index = 0; index < ids.length; index++) {
      if (this.register(ids[index], group, row, startCol + index)) {
        registered += 1;
      }
    }
    return registered;
  }

  nodeOf(id: string): FocusNode | null {
    for (let index = 0; index < this.nodes.length; index++) {
      if (this.nodes[index].id === id) {
        return this.nodes[index];
      }
    }
    return null;
  }

  has(id: string): boolean {
    return this.nodeOf(id) !== null;
  }

  size(): number {
    return this.nodes.length;
  }

  /** Removes a stop and repairs focus plus overlay stack references. */
  unregister(id: string): boolean {
    const index: number = this.indexOf(id);
    if (index < 0) {
      return false;
    }
    const wasFocused: boolean = this.focusedId === id;
    this.nodes.splice(index, 1);
    const kept: FocusStackEntry[] = [];
    for (let cursor = 0; cursor < this.stack.length; cursor++) {
      if (this.stack[cursor].id !== id) {
        kept.push(this.stack[cursor]);
      }
    }
    this.stack = kept;
    if (wasFocused) {
      const from: string = this.focusedId;
      this.focusedId = NO_FOCUS;
      this.uiFocusedId = NO_FOCUS;
      this.record(new FocusEvent(EVT_UNREGISTER, from, NO_FOCUS, 'unregister',
        this.clock.now()));
    }
    return true;
  }

  private indexOf(id: string): number {
    for (let index = 0; index < this.nodes.length; index++) {
      if (this.nodes[index].id === id) {
        return index;
      }
    }
    return -1;
  }

  /* ---------------- groups ---------------- */

  groupMembers(group: string): FocusNode[] {
    return this.nodes.filter((node: FocusNode) => node.group === group);
  }

  groupIds(group: string): string[] {
    return this.groupMembers(group).map((node: FocusNode) => node.id);
  }

  groups(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.nodes.length; index++) {
      if (result.indexOf(this.nodes[index].group) < 0) {
        result.push(this.nodes[index].group);
      }
    }
    return result;
  }

  groupCount(): number {
    return this.groups().length;
  }

  focusableIds(): string[] {
    return this.nodes.filter((node: FocusNode) => node.isFocusable())
      .map((node: FocusNode) => node.id);
  }

  /* ---------------- focus transitions ---------------- */

  private record(event: FocusEvent): void {
    this.events.push(event);
    while (this.events.length > MAX_EVENT_LOG) {
      this.events.shift();
    }
    this.delivered += this.listeners.length;
  }

  private applyFocus(node: FocusNode, type: string, reason: string): void {
    const from: string = this.focusedId;
    this.focusedId = node.id;
    this.uiFocusedId = node.id;
    this.record(new FocusEvent(type, from, node.id, reason, this.clock.now()));
    this.moves += 1;
  }

  focusById(id: string, reason: string = 'api'): boolean {
    const node: FocusNode | null = this.nodeOf(id);
    if (node === null) {
      this.deniedCount += 1;
      this.record(new FocusEvent(EVT_DENY, this.focusedId, id, 'missing',
        this.clock.now()));
      return false;
    }
    if (!node.isFocusable()) {
      this.deniedCount += 1;
      this.record(new FocusEvent(EVT_DENY, this.focusedId, id, 'not-focusable',
        this.clock.now()));
      return false;
    }
    this.applyFocus(node, EVT_FOCUS, reason);
    return true;
  }

  focusFirst(): boolean {
    const ids: string[] = this.focusableIds();
    if (ids.length === 0) {
      return false;
    }
    return this.focusById(ids[0], 'first');
  }

  focusLast(): boolean {
    const ids: string[] = this.focusableIds();
    if (ids.length === 0) {
      return false;
    }
    return this.focusById(ids[ids.length - 1], 'last');
  }

  blur(reason: string = 'api'): boolean {
    if (this.focusedId === NO_FOCUS) {
      return false;
    }
    const from: string = this.focusedId;
    this.focusedId = NO_FOCUS;
    this.uiFocusedId = NO_FOCUS;
    this.record(new FocusEvent(EVT_BLUR, from, NO_FOCUS, reason, this.clock.now()));
    return true;
  }

  current(): FocusNode | null {
    return this.focusedId === NO_FOCUS ? null : this.nodeOf(this.focusedId);
  }

  currentId(): string {
    return this.focusedId;
  }

  hasFocus(): boolean {
    return this.focusedId !== NO_FOCUS;
  }

  focusedCount(): number {
    return this.focusedId === NO_FOCUS ? 0 : 1;
  }

  /* ---------------- enable / visible ---------------- */

  private fallbackFrom(node: FocusNode): FocusNode | null {
    const members: FocusNode[] = this.groupMembers(node.group)
      .filter((candidate: FocusNode) => candidate.isFocusable() && candidate.id !== node.id);
    if (members.length === 0) {
      return null;
    }
    for (let index = 0; index < members.length; index++) {
      if (members[index].order > node.order) {
        return members[index];
      }
    }
    return members[members.length - 1];
  }

  setEnabled(id: string, enabled: boolean): boolean {
    const node: FocusNode | null = this.nodeOf(id);
    if (node === null) {
      return false;
    }
    if (node.enabled === enabled) {
      return true;
    }
    node.enabled = enabled;
    if (!enabled && this.focusedId === id) {
      this.relocate(node, 'disabled');
    }
    return true;
  }

  setVisible(id: string, visible: boolean): boolean {
    const node: FocusNode | null = this.nodeOf(id);
    if (node === null) {
      return false;
    }
    if (node.visible === visible) {
      return true;
    }
    node.visible = visible;
    if (!visible && this.focusedId === id) {
      this.relocate(node, 'hidden');
    }
    return true;
  }

  /** Moves focus away from a stop that just became unusable. */
  private relocate(node: FocusNode, reason: string): void {
    this.relocationCount += 1;
    const fallback: FocusNode | null = this.fallbackFrom(node);
    this.record(new FocusEvent(EVT_DISABLE, node.id, NO_FOCUS, reason, this.clock.now()));
    if (fallback !== null) {
      this.applyFocus(fallback, EVT_FOCUS, reason);
      return;
    }
    const ids: string[] = this.focusableIds();
    if (ids.length > 0) {
      this.focusById(ids[0], reason);
      return;
    }
    this.focusedId = NO_FOCUS;
    this.uiFocusedId = NO_FOCUS;
  }

  /* ---------------- ordered traversal ---------------- */

  tabOrder(): string[] {
    return this.focusableIds();
  }

  nextInOrder(id: string): string {
    const ids: string[] = this.tabOrder();
    const index: number = ids.indexOf(id);
    if (index < 0) {
      return ids.length === 0 ? NO_FOCUS : ids[0];
    }
    return index + 1 < ids.length ? ids[index + 1] : NO_FOCUS;
  }

  previousInOrder(id: string): string {
    const ids: string[] = this.tabOrder();
    const index: number = ids.indexOf(id);
    if (index < 0) {
      return ids.length === 0 ? NO_FOCUS : ids[ids.length - 1];
    }
    return index > 0 ? ids[index - 1] : NO_FOCUS;
  }

  focusNext(): boolean {
    const target: string = this.nextInOrder(this.focusedId);
    if (target === NO_FOCUS) {
      return this.wrap ? this.focusFirst() : false;
    }
    return this.focusById(target, 'tab-next');
  }

  focusPrevious(): boolean {
    const target: string = this.previousInOrder(this.focusedId);
    if (target === NO_FOCUS) {
      return this.wrap ? this.focusLast() : false;
    }
    return this.focusById(target, 'tab-previous');
  }
  /* ---------------- directional movement ---------------- */

  /** Geometric distance used to choose the next stop for a direction. */
  private distanceOf(from: FocusNode, to: FocusNode, direction: string): number {
    const dx: number = to.col - from.col;
    const dy: number = to.row - from.row;
    if (direction === DIR_RIGHT) {
      return dx > 0 ? dx + Math.abs(dy) * 2 : NO_DISTANCE;
    }
    if (direction === DIR_LEFT) {
      return dx < 0 ? Math.abs(dx) + Math.abs(dy) * 2 : NO_DISTANCE;
    }
    if (direction === DIR_DOWN) {
      return dy > 0 ? dy + Math.abs(dx) * 2 : NO_DISTANCE;
    }
    if (direction === DIR_UP) {
      return dy < 0 ? Math.abs(dy) + Math.abs(dx) * 2 : NO_DISTANCE;
    }
    return NO_DISTANCE;
  }

  private pick(pool: FocusNode[], from: FocusNode, direction: string): FocusNode | null {
    let best: FocusNode | null = null;
    let bestDistance: number = NO_DISTANCE;
    let bestSameGroup: boolean = false;
    for (let index = 0; index < pool.length; index++) {
      const candidate: FocusNode = pool[index];
      if (candidate.id === from.id || !candidate.isFocusable()) {
        continue;
      }
      const distance: number = this.distanceOf(from, candidate, direction);
      if (distance >= NO_DISTANCE) {
        continue;
      }
      const sameGroup: boolean = candidate.group === from.group;
      if (distance < bestDistance ||
        (distance === bestDistance && sameGroup && !bestSameGroup)) {
        best = candidate;
        bestDistance = distance;
        bestSameGroup = sameGroup;
      }
    }
    return best;
  }

  /**
   * Moves focus one stop in the given direction.
   *
   * Group local candidates always win over remote ones at equal distance, the
   * cross group hop is only taken when the group itself has no neighbour.
   */
  move(direction: string): boolean {
    const active: FocusNode | null = this.current();
    if (active === null) {
      return this.focusFirst();
    }
    const pool: FocusNode[] = this.crossGroup ?
      this.nodes : this.groupMembers(active.group);
    const target: FocusNode | null = this.pick(pool, active, direction);
    if (target === null) {
      this.boundaryHits += 1;
      this.record(new FocusEvent(EVT_DENY, active.id, NO_FOCUS, `boundary-${direction}`,
        this.clock.now()));
      if (!this.wrap) {
        return false;
      }
      const wrapped: boolean = direction === DIR_LEFT || direction === DIR_UP ?
        this.focusLast() : this.focusFirst();
      return wrapped;
    }
    this.applyFocus(target, EVT_MOVE, direction);
    return true;
  }

  /** Movement restricted to one group; used by the tab strip. */
  moveInGroup(direction: string): boolean {
    const active: FocusNode | null = this.current();
    if (active === null) {
      const members: FocusNode[] = this.groupMembers(GROUP_TABS)
        .filter((node: FocusNode) => node.isFocusable());
      return members.length > 0 ? this.focusById(members[0].id, 'group-first') : false;
    }
    const target: FocusNode | null = this.pick(this.groupMembers(active.group), active,
      direction);
    if (target === null) {
      this.groupBoundaryHits += 1;
      this.record(new FocusEvent(EVT_DENY, active.id, NO_FOCUS,
        `group-boundary-${direction}`, this.clock.now()));
      return false;
    }
    this.applyFocus(target, EVT_MOVE, `group-${direction}`);
    return true;
  }

  moveCount(): number {
    return this.moves;
  }

  boundaryCount(): number {
    return this.boundaryHits;
  }

  groupBoundaryCount(): number {
    return this.groupBoundaryHits;
  }

  denied(): number {
    return this.deniedCount;
  }

  relocations(): number {
    return this.relocationCount;
  }

  /* ---------------- overlay focus stack ---------------- */

  pushOverlay(id: string, reason: string = 'overlay'): boolean {
    if (this.stack.length >= MAX_STACK_DEPTH) {
      return false;
    }
    const node: FocusNode | null = this.nodeOf(id);
    if (node === null || !node.isFocusable()) {
      this.deniedCount += 1;
      this.record(new FocusEvent(EVT_DENY, this.focusedId, id, 'overlay-missing',
        this.clock.now()));
      return false;
    }
    this.stack.push(new FocusStackEntry(this.focusedId, reason));
    return this.focusById(id, reason);
  }

  /** Closes the top overlay and restores the focus saved when it opened. */
  popOverlay(): boolean {
    if (this.stack.length === 0) {
      return false;
    }
    const entry: FocusStackEntry = this.stack[this.stack.length - 1];
    this.stack.pop();
    this.restoreCount += 1;
    const saved: FocusNode | null = this.nodeOf(entry.id);
    if (saved !== null && saved.isFocusable()) {
      this.focusedId = NO_FOCUS;
      return this.focusById(saved.id, 'restore');
    }
    const ids: string[] = this.focusableIds();
    if (ids.length > 0) {
      return this.focusById(ids[0], 'restore-fallback');
    }
    this.focusedId = NO_FOCUS;
    this.uiFocusedId = NO_FOCUS;
    this.record(new FocusEvent(EVT_RESTORE, NO_FOCUS, NO_FOCUS, 'empty',
      this.clock.now()));
    return true;
  }

  stackDepth(): number {
    return this.stack.length;
  }

  stackIds(): string[] {
    return this.stack.map((entry: FocusStackEntry) => entry.id);
  }

  restoreCountValue(): number {
    return this.restoreCount;
  }

  clearStack(): void {
    this.stack = [];
  }

  /* ---------------- event log ---------------- */

  eventCount(): number {
    return this.events.length;
  }

  lastEvent(): FocusEvent | null {
    if (this.events.length === 0) {
      return null;
    }
    return this.events[this.events.length - 1];
  }

  eventsOfType(type: string): FocusEvent[] {
    return this.events.filter((event: FocusEvent) => event.type === type);
  }

  eventSequence(): string {
    return this.events.map((event: FocusEvent) => event.type).join('>');
  }

  containsTransition(fromId: string, toId: string): boolean {
    return this.events.some((event: FocusEvent) =>
      event.fromId === fromId && event.toId === toId);
  }

  clearEvents(): void {
    this.events = [];
  }

  subscribe(name: string): boolean {
    if (name === null || name === undefined || name.length === 0) {
      return false;
    }
    if (this.listeners.indexOf(name) >= 0) {
      return false;
    }
    this.listeners.push(name);
    return true;
  }

  unsubscribe(name: string): boolean {
    const index: number = this.listeners.indexOf(name);
    if (index < 0) {
      return false;
    }
    this.listeners.splice(index, 1);
    return true;
  }

  listenerCount(): number {
    return this.listeners.length;
  }

  deliveredCount(): number {
    return this.delivered;
  }

  /* ---------------- UI synchronisation ---------------- */

  /** The UI highlight must follow the logical focus exactly. */
  uiInSync(): boolean {
    return this.uiFocusedId === this.focusedId;
  }

  syncUi(): boolean {
    if (this.uiInSync()) {
      return false;
    }
    this.uiFocusedId = this.focusedId;
    return true;
  }

  /** Simulates a highlight that drifted away from the logical focus. */
  forceUiFocus(id: string): void {
    this.uiFocusedId = id;
  }

  uiFocusId(): string {
    return this.uiFocusedId;
  }

  /* ---------------- consistency ---------------- */

  validate(): string[] {
    const issues: string[] = [];
    const seen: string[] = [];
    for (let index = 0; index < this.nodes.length; index++) {
      const node: FocusNode = this.nodes[index];
      if (seen.indexOf(node.id) >= 0 && issues.indexOf(ISSUE_DUPLICATE_ID) < 0) {
        issues.push(ISSUE_DUPLICATE_ID);
      }
      seen.push(node.id);
      if (node.group === null || node.group === undefined || node.group.length === 0) {
        if (issues.indexOf(ISSUE_EMPTY_GROUP) < 0) {
          issues.push(ISSUE_EMPTY_GROUP);
        }
      }
    }
    if (this.focusedId !== NO_FOCUS && this.nodeOf(this.focusedId) === null) {
      issues.push(ISSUE_FOCUSED_MISSING);
    }
    if (this.focusedId !== NO_FOCUS) {
      const node: FocusNode | null = this.nodeOf(this.focusedId);
      if (node !== null && !node.isFocusable()) {
        issues.push(ISSUE_FOCUSED_DISABLED);
      }
    }
    for (let index = 0; index < this.stack.length; index++) {
      const id: string = this.stack[index].id;
      if (id !== NO_FOCUS && this.nodeOf(id) === null && issues.indexOf(ISSUE_DANGLING_STACK) < 0) {
        issues.push(ISSUE_DANGLING_STACK);
      }
    }
    if (!this.uiInSync() && issues.indexOf(ISSUE_UI_DESYNC) < 0) {
      issues.push(ISSUE_UI_DESYNC);
    }
    return issues;
  }

  isConsistent(): boolean {
    return this.validate().length === 0;
  }

  describe(): string {
    return `nodes=${this.nodes.length}|groups=${this.groupCount()}` +
      `|focus=${this.focusedId === NO_FOCUS ? 'none' : this.focusedId}` +
      `|stack=${this.stack.length}|moves=${this.moves}` +
      `|boundary=${this.boundaryHits}`;
  }

  reset(): void {
    this.nodes = [];
    this.focusedId = NO_FOCUS;
    this.uiFocusedId = NO_FOCUS;
    this.stack = [];
    this.events = [];
    this.moves = 0;
    this.boundaryHits = 0;
    this.groupBoundaryHits = 0;
    this.deniedCount = 0;
    this.restoreCount = 0;
    this.relocationCount = 0;
    this.nextOrder = 0;
  }
}

/** Builds the three group focus ring of the tablet browser shell. */
function buildTabletRing(manager: LocalFocusManager): LocalFocusManager {
  manager.register(NODE_INPUT, GROUP_TITLE, 0, 0);
  manager.register(NODE_BACK, GROUP_TITLE, 0, 1);
  manager.register(NODE_FORWARD, GROUP_TITLE, 0, 2);
  manager.register(NODE_REFRESH, GROUP_TITLE, 0, 3);
  manager.register(NODE_HOME, GROUP_TITLE, 0, 4);
  manager.register(NODE_SUBMIT, GROUP_TITLE, 1, 0);
  manager.register(NODE_ADD, GROUP_TITLE, 1, 1);
  manager.register(NODE_CANCEL, GROUP_TITLE, 1, 2);
  manager.register(`${NODE_TAB_PREFIX}0`, GROUP_TABS, 2, 0);
  manager.register(`${NODE_TAB_PREFIX}1`, GROUP_TABS, 2, 1);
  manager.register(`${NODE_TAB_PREFIX}2`, GROUP_TABS, 2, 2);
  manager.register(NODE_MENU, GROUP_WEB, 3, 0);
  return manager;
}

/** Builds the phone ring plus one modal focus stop. */
function buildPhoneRing(manager: LocalFocusManager): LocalFocusManager {
  manager.register(NODE_INPUT, GROUP_TITLE, 0, 0);
  manager.register(NODE_BACK, GROUP_TITLE, 0, 1);
  manager.register(NODE_FORWARD, GROUP_TITLE, 0, 2);
  manager.register(NODE_REFRESH, GROUP_TITLE, 0, 3);
  manager.register(NODE_HOME, GROUP_TITLE, 0, 4);
  manager.register(NODE_SUBMIT, GROUP_TITLE, 1, 0);
  manager.register(NODE_ADD, GROUP_TITLE, 1, 1);
  manager.register(NODE_MENU, GROUP_WEB, 2, 0);
  manager.register(NODE_OVERLAY_OK, GROUP_OVERLAY, 4, 0);
  return manager;
}
export default function focusManagerValidationTest() {
  describe('focusManagerValidationTest', () => {
    const driver: Driver = getDriver();
    const clock: MockClock = new MockClock(1700000000000);

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      TestLogger.step(TAG, 'launch browser application');
      await startBrowserApp();
      await serializedDelay(driver, 300);
    });

    afterAll(() => {
      TestLogger.info(TAG, `suite end, ${TestLogger.summary(TAG)}`);
    });

    it('Focus_Register_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Focus_Register_001');
      TestLogger.step(TAG, 'register the tablet focus ring');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      expect(manager.size()).assertEqual(12);
      expect(manager.groupCount()).assertEqual(3);
      expect(manager.has(NODE_INPUT)).assertTrue();
      expect(manager.has(NODE_OVERLAY_OK)).assertFalse();
      const input: FocusNode | null = manager.nodeOf(NODE_INPUT);
      expect(input === null).assertFalse();
      if (input !== null) {
        expect(input.group).assertEqual(GROUP_TITLE);
        expect(input.cell()).assertEqual('0:0');
        expect(input.isFocusable()).assertTrue();
      }
      expect(manager.focusedCount()).assertEqual(0);
      expect(manager.isConsistent()).assertTrue();
      TestLogger.info(TAG, `ring ${manager.describe()}`);
      TestLogger.pass(TAG, 'Focus_Register_001');
    });

    it('Focus_Register_002', 0, async () => {
      TestLogger.step(TAG, 'reject duplicate and malformed registrations');
      const manager: LocalFocusManager = new LocalFocusManager(clock);
      expect(manager.register(NODE_INPUT, GROUP_TITLE, 0, 0)).assertTrue();
      expect(manager.register(NODE_INPUT, GROUP_TITLE, 0, 1)).assertFalse();
      expect(manager.register('', GROUP_TITLE, 0, 1)).assertFalse();
      expect(manager.register(NODE_BACK, '', 0, 1)).assertFalse();
      expect(manager.size()).assertEqual(1);
      expect(manager.has('')).assertFalse();
      expect(manager.nodeOf('unknown') === null).assertTrue();
      TestLogger.pass(TAG, 'Focus_Register_002');
    });

    it('Focus_Register_003', 0, async () => {
      TestLogger.step(TAG, 'bulk registration of a tab strip group');
      const manager: LocalFocusManager = new LocalFocusManager(clock);
      const ids: string[] = [`${NODE_TAB_PREFIX}0`, `${NODE_TAB_PREFIX}1`,
        `${NODE_TAB_PREFIX}2`];
      expect(manager.registerMany(ids, GROUP_TABS, 2)).assertEqual(3);
      expect(manager.registerMany(ids, GROUP_TABS, 3)).assertEqual(0);
      expect(manager.groupIds(GROUP_TABS).length).assertEqual(3);
      expect(manager.groups()[0]).assertEqual(GROUP_TABS);
      expect(manager.groupCount()).assertEqual(1);
      const members: FocusNode[] = manager.groupMembers(GROUP_TABS);
      expect(members[2].col).assertEqual(2);
      expect(members[2].order).assertEqual(2);
      TestLogger.pass(TAG, 'Focus_Register_003');
    });

    it('Focus_Unregister_004', 0, async () => {
      TestLogger.step(TAG, 'unregistering the focused node clears the focus');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      manager.focusById(NODE_FORWARD);
      expect(manager.currentId()).assertEqual(NODE_FORWARD);
      expect(manager.unregister(NODE_FORWARD)).assertTrue();
      expect(manager.has(NODE_FORWARD)).assertFalse();
      expect(manager.hasFocus()).assertFalse();
      expect(manager.uiInSync()).assertTrue();
      expect(manager.size()).assertEqual(11);
      expect(manager.eventsOfType(EVT_UNREGISTER).length).assertEqual(1);
      expect(manager.containsTransition(NODE_FORWARD, NO_FOCUS)).assertTrue();
      expect(manager.unregister(NODE_FORWARD)).assertFalse();
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'Focus_Unregister_004');
    });

    it('Focus_Unregister_005', 0, async () => {
      TestLogger.step(TAG, 'unregistering drops matching overlay stack entries');
      const manager: LocalFocusManager = buildPhoneRing(new LocalFocusManager(clock));
      manager.focusById(NODE_INPUT);
      expect(manager.pushOverlay(NODE_OVERLAY_OK)).assertTrue();
      expect(manager.stackIds().length).assertEqual(1);
      expect(manager.stackIds()[0]).assertEqual(NODE_INPUT);
      expect(manager.unregister(NODE_INPUT)).assertTrue();
      expect(manager.stackDepth()).assertEqual(0);
      expect(manager.currentId()).assertEqual(NODE_OVERLAY_OK);
      expect(manager.unregister(NODE_OVERLAY_OK)).assertTrue();
      expect(manager.hasFocus()).assertFalse();
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'Focus_Unregister_005');
    });

    it('Focus_FocusById_006', 0, async () => {
      TestLogger.step(TAG, 'focus a registered stop by id');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      expect(manager.focusById(NODE_REFRESH, 'test')).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_REFRESH);
      expect(manager.focusedCount()).assertEqual(1);
      expect(manager.uiInSync()).assertTrue();
      const active: FocusNode | null = manager.current();
      expect(active === null).assertFalse();
      if (active !== null) {
        expect(active.id).assertEqual(NODE_REFRESH);
      }
      expect(manager.containsTransition(NO_FOCUS, NODE_REFRESH)).assertTrue();
      expect(manager.lastEvent() !== null).assertTrue();
      expect(manager.moveCount()).assertEqual(1);
      TestLogger.pass(TAG, 'Focus_FocusById_006');
    });

    it('Focus_FocusDisabled_007', 0, async () => {
      TestLogger.step(TAG, 'a disabled node refuses focus');
      const manager: LocalFocusManager = new LocalFocusManager(clock);
      manager.register(NODE_INPUT, GROUP_TITLE, 0, 0);
      manager.register(NODE_BACK, GROUP_TITLE, 0, 1, false);
      manager.register(NODE_FORWARD, GROUP_TITLE, 0, 2, true, false);
      expect(manager.focusById(NODE_BACK)).assertFalse();
      expect(manager.focusById(NODE_FORWARD)).assertFalse();
      expect(manager.denied()).assertEqual(2);
      expect(manager.focusedCount()).assertEqual(0);
      expect(manager.eventsOfType(EVT_DENY).length).assertEqual(2);
      expect(manager.focusableIds().length).assertEqual(1);
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'Focus_FocusDisabled_007');
    });

    it('Focus_FocusMissing_008', 0, async () => {
      TestLogger.step(TAG, 'an unknown id is reported as a denial');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      expect(manager.focusById('ghostNode')).assertFalse();
      expect(manager.currentId()).assertEqual(NO_FOCUS);
      expect(manager.denied()).assertEqual(1);
      const denied: FocusEvent[] = manager.eventsOfType(EVT_DENY);
      expect(denied.length).assertEqual(1);
      expect(denied[0].reason).assertEqual('missing');
      expect(denied[0].describe().indexOf('ghostNode') >= 0).assertTrue();
      TestLogger.pass(TAG, 'Focus_FocusMissing_008');
    });

    it('Focus_FirstLast_009', 0, async () => {
      TestLogger.step(TAG, 'focus first and last stops of the ring');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      expect(manager.focusFirst()).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_INPUT);
      expect(manager.focusLast()).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_MENU);
      expect(manager.focusableIds().length).assertEqual(12);
      const empty: LocalFocusManager = new LocalFocusManager(clock);
      expect(empty.focusFirst()).assertFalse();
      expect(empty.focusLast()).assertFalse();
      expect(empty.focusedCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Focus_FirstLast_009');
    });
    it('Focus_Blur_010', 0, async () => {
      TestLogger.step(TAG, 'blur clears the active focus');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      expect(manager.blur()).assertFalse();
      manager.focusById(NODE_BACK);
      expect(manager.hasFocus()).assertTrue();
      expect(manager.blur('escape')).assertTrue();
      expect(manager.currentId()).assertEqual(NO_FOCUS);
      expect(manager.current() === null).assertTrue();
      expect(manager.hasFocus()).assertFalse();
      expect(manager.eventsOfType(EVT_BLUR).length).assertEqual(1);
      expect(manager.blur()).assertFalse();
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'Focus_Blur_010');
    });

    it('Focus_MoveRight_011', 0, async () => {
      TestLogger.step(TAG, 'move one stop to the right');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      manager.focusById(NODE_INPUT);
      expect(manager.move(DIR_RIGHT)).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_BACK);
      expect(manager.move(DIR_RIGHT)).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_FORWARD);
      expect(manager.containsTransition(NODE_INPUT, NODE_BACK)).assertTrue();
      expect(manager.containsTransition(NODE_BACK, NODE_FORWARD)).assertTrue();
      expect(manager.boundaryCount()).assertEqual(0);
      expect(manager.eventsOfType(EVT_MOVE).length).assertEqual(2);
      TestLogger.pass(TAG, 'Focus_MoveRight_011');
    });

    it('Focus_MoveLeftBoundary_012', 0, async () => {
      TestLogger.step(TAG, 'left move stops at the ring edge without wrap');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      manager.wrap = false;
      manager.focusById(NODE_INPUT);
      expect(manager.move(DIR_LEFT)).assertFalse();
      expect(manager.currentId()).assertEqual(NODE_INPUT);
      expect(manager.boundaryCount()).assertEqual(1);
      expect(manager.containsTransition(NODE_INPUT, NO_FOCUS)).assertTrue();
      const denied: FocusEvent[] = manager.eventsOfType(EVT_DENY);
      expect(denied[denied.length - 1].reason).assertEqual('boundary-left');
      TestLogger.pass(TAG, 'Focus_MoveLeftBoundary_012');
    });

    it('Focus_MoveDown_014', 0, async () => {
      TestLogger.step(TAG, 'vertical move reaches the second title row');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      manager.focusById(NODE_INPUT);
      expect(manager.move(DIR_DOWN)).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_SUBMIT);
      expect(manager.move(DIR_UP)).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_INPUT);
      expect(manager.containsTransition(NODE_SUBMIT, NODE_INPUT)).assertTrue();
      expect(manager.boundaryCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Focus_MoveDown_014');
    });

    it('Focus_MoveUpBoundary_015', 0, async () => {
      TestLogger.step(TAG, 'up move at the first row is a boundary hit');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      manager.wrap = false;
      manager.focusById(NODE_HOME);
      expect(manager.move(DIR_UP)).assertFalse();
      expect(manager.currentId()).assertEqual(NODE_HOME);
      expect(manager.boundaryCount()).assertEqual(1);
      manager.focusById(NODE_INPUT);
      expect(manager.move(DIR_DOWN)).assertTrue();
      expect(manager.move(DIR_UP)).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_INPUT);
      TestLogger.pass(TAG, 'Focus_MoveUpBoundary_015');
    });

    it('Focus_MoveInGroup_017', 0, async () => {
      TestLogger.step(TAG, 'group local move stays inside the tab strip');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      manager.focusById(`${NODE_TAB_PREFIX}0`);
      expect(manager.moveInGroup(DIR_RIGHT)).assertTrue();
      expect(manager.currentId()).assertEqual(`${NODE_TAB_PREFIX}1`);
      expect(manager.moveInGroup(DIR_RIGHT)).assertTrue();
      expect(manager.currentId()).assertEqual(`${NODE_TAB_PREFIX}2`);
      expect(manager.groupBoundaryCount()).assertEqual(0);
      expect(manager.lastEvent() !== null).assertTrue();
      TestLogger.pass(TAG, 'Focus_MoveInGroup_017');
    });

    it('Focus_MoveInGroup_019', 0, async () => {
      TestLogger.step(TAG, 'group move without focus enters the tab strip');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      expect(manager.moveInGroup(DIR_RIGHT)).assertTrue();
      expect(manager.currentId()).assertEqual(`${NODE_TAB_PREFIX}0`);
      expect(manager.hasFocus()).assertTrue();
      const empty: LocalFocusManager = new LocalFocusManager(clock);
      expect(empty.moveInGroup(DIR_LEFT)).assertFalse();
      expect(empty.hasFocus()).assertFalse();
      TestLogger.pass(TAG, 'Focus_MoveInGroup_019');
    });

    it('Focus_SkipDisabled_020', 0, async () => {
      TestLogger.step(TAG, 'directional move skips a disabled neighbour');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      expect(manager.setEnabled(NODE_BACK, false)).assertTrue();
      manager.focusById(NODE_INPUT);
      expect(manager.move(DIR_RIGHT)).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_FORWARD);
      expect(manager.containsTransition(NODE_INPUT, NODE_BACK)).assertFalse();
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'Focus_SkipDisabled_020');
    });

    it('Focus_DisableFocused_021', 0, async () => {
      TestLogger.step(TAG, 'disabling the focused node relocates the focus');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      manager.focusById(NODE_BACK);
      expect(manager.setEnabled(NODE_BACK, false)).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_FORWARD);
      expect(manager.relocations()).assertEqual(1);
      expect(manager.eventsOfType(EVT_DISABLE).length).assertEqual(1);
      expect(manager.setEnabled(NODE_BACK, false)).assertTrue();
      expect(manager.relocations()).assertEqual(1);
      expect(manager.isConsistent()).assertTrue();
      TestLogger.info(TAG, `relocation target=${manager.currentId()}`);
      TestLogger.pass(TAG, 'Focus_DisableFocused_021');
    });

    it('Focus_HideFocused_022', 0, async () => {
      TestLogger.step(TAG, 'hiding the focused node relocates the focus');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      manager.focusById(NODE_CANCEL);
      expect(manager.setVisible(NODE_CANCEL, false)).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_ADD);
      expect(manager.focusableIds().indexOf(NODE_CANCEL) < 0).assertTrue();
      expect(manager.relocations()).assertEqual(1);
      expect(manager.uiInSync()).assertTrue();
      expect(manager.setVisible(NODE_CANCEL, true)).assertTrue();
      expect(manager.focusableIds().indexOf(NODE_CANCEL) >= 0).assertTrue();
      expect(manager.setVisible('unknown', false)).assertFalse();
      TestLogger.pass(TAG, 'Focus_HideFocused_022');
    });

    it('Focus_DisableAll_023', 0, async () => {
      TestLogger.step(TAG, 'disabling the last focusable node clears focus');
      const manager: LocalFocusManager = new LocalFocusManager(clock);
      manager.register(NODE_MENU, GROUP_WEB, 0, 0);
      manager.focusById(NODE_MENU);
      expect(manager.setEnabled(NODE_MENU, false)).assertTrue();
      expect(manager.hasFocus()).assertFalse();
      expect(manager.focusableIds().length).assertEqual(0);
      expect(manager.current() === null).assertTrue();
      expect(manager.moveCount() > 0).assertTrue();
      expect(manager.isConsistent()).assertTrue();
      expect(manager.focusFirst()).assertFalse();
      TestLogger.pass(TAG, 'Focus_DisableAll_023');
    });

    it('Focus_Overlay_024', 0, async () => {
      TestLogger.step(TAG, 'overlay push saves and restores the focus');
      const manager: LocalFocusManager = buildPhoneRing(new LocalFocusManager(clock));
      manager.focusById(NODE_INPUT);
      expect(manager.pushOverlay(NODE_OVERLAY_OK, 'overlay')).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_OVERLAY_OK);
      expect(manager.stackDepth()).assertEqual(1);
      expect(manager.stackIds()[0]).assertEqual(NODE_INPUT);
      expect(manager.popOverlay()).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_INPUT);
      expect(manager.stackDepth()).assertEqual(0);
      expect(manager.restoreCountValue()).assertEqual(1);
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'Focus_Overlay_024');
    });

    it('Focus_OverlayLifo_025', 0, async () => {
      TestLogger.step(TAG, 'nested overlays restore in LIFO order');
      const manager: LocalFocusManager = buildPhoneRing(new LocalFocusManager(clock));
      manager.focusById(NODE_INPUT);
      expect(manager.pushOverlay(NODE_OVERLAY_OK, 'overlay')).assertTrue();
      expect(manager.pushOverlay(NODE_MENU, 'menu')).assertTrue();
      expect(manager.stackDepth()).assertEqual(2);
      expect(manager.currentId()).assertEqual(NODE_MENU);
      expect(manager.popOverlay()).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_OVERLAY_OK);
      expect(manager.popOverlay()).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_INPUT);
      expect(manager.stackDepth()).assertEqual(0);
      expect(manager.restoreCountValue()).assertEqual(2);
      TestLogger.pass(TAG, 'Focus_OverlayLifo_025');
    });

    it('Focus_OverlayEmpty_026', 0, async () => {
      TestLogger.step(TAG, 'popping an empty overlay stack is refused');
      const manager: LocalFocusManager = buildPhoneRing(new LocalFocusManager(clock));
      expect(manager.popOverlay()).assertFalse();
      expect(manager.restoreCountValue()).assertEqual(0);
      expect(manager.stackDepth()).assertEqual(0);
      expect(manager.pushOverlay('ghostOverlay')).assertFalse();
      expect(manager.denied()).assertEqual(1);
      expect(manager.stackDepth()).assertEqual(0);
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'Focus_OverlayEmpty_026');
    });

    it('Focus_OverlayFallback_027', 0, async () => {
      TestLogger.step(TAG, 'unusable saved focus falls back to the ring head');
      const manager: LocalFocusManager = buildPhoneRing(new LocalFocusManager(clock));
      manager.focusById(NODE_INPUT);
      expect(manager.pushOverlay(NODE_OVERLAY_OK)).assertTrue();
      expect(manager.setEnabled(NODE_INPUT, false)).assertTrue();
      expect(manager.popOverlay()).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_BACK);
      expect(manager.restoreCountValue()).assertEqual(1);
      expect(manager.uiInSync()).assertTrue();
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'Focus_OverlayFallback_027');
    });
    it('Focus_Events_028', 0, async () => {
      TestLogger.step(TAG, 'event log records ordered transitions');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      manager.focusById(NODE_INPUT);
      manager.move(DIR_RIGHT);
      manager.blur('test');
      expect(manager.eventCount()).assertEqual(3);
      expect(manager.eventSequence()).assertEqual(`${EVT_FOCUS}>${EVT_MOVE}>${EVT_BLUR}`);
      expect(manager.eventsOfType(EVT_FOCUS).length).assertEqual(1);
      expect(manager.eventsOfType(EVT_MOVE).length).assertEqual(1);
      expect(manager.eventsOfType(EVT_BLUR).length).assertEqual(1);
      const last: FocusEvent | null = manager.lastEvent();
      expect(last === null).assertFalse();
      if (last !== null) {
        expect(last.type).assertEqual(EVT_BLUR);
        expect(last.fromId).assertEqual(NODE_BACK);
        expect(last.toId).assertEqual(NO_FOCUS);
        expect(last.reason).assertEqual('test');
        expect(last.timestamp).assertEqual(clock.now());
      }
      manager.clearEvents();
      expect(manager.eventCount()).assertEqual(0);
      expect(manager.lastEvent() === null).assertTrue();
      TestLogger.pass(TAG, 'Focus_Events_028');
    });

    it('Focus_EventsBound_029', 0, async () => {
      TestLogger.step(TAG, 'event log keeps a bounded history');
      const manager: LocalFocusManager = new LocalFocusManager(clock);
      manager.register(NODE_INPUT, GROUP_TITLE, 0, 0);
      manager.register(NODE_BACK, GROUP_TITLE, 0, 1);
      manager.register(NODE_FORWARD, GROUP_TITLE, 0, 2);
      for (let index = 0; index < 200; index++) {
        const target: string = index % 2 === 0 ? NODE_BACK : NODE_INPUT;
        manager.focusById(target);
      }
      expect(manager.eventCount()).assertEqual(MAX_EVENT_LOG);
      expect(manager.eventsOfType(EVT_FOCUS).length).assertEqual(MAX_EVENT_LOG);
      expect(manager.moveCount()).assertEqual(200);
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'Focus_EventsBound_029');
    });

    it('Focus_Subscribe_030', 0, async () => {
      TestLogger.step(TAG, 'listeners receive every focus record');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      expect(manager.subscribe('titleBar')).assertTrue();
      expect(manager.subscribe('tabStrip')).assertTrue();
      expect(manager.subscribe('titleBar')).assertFalse();
      expect(manager.subscribe('')).assertFalse();
      expect(manager.listenerCount()).assertEqual(2);
      manager.focusById(NODE_INPUT);
      expect(manager.deliveredCount()).assertEqual(2);
      manager.move(DIR_RIGHT);
      expect(manager.deliveredCount()).assertEqual(4);
      expect(manager.unsubscribe('tabStrip')).assertTrue();
      manager.blur();
      expect(manager.deliveredCount()).assertEqual(5);
      expect(manager.unsubscribe('tabStrip')).assertFalse();
      TestLogger.pass(TAG, 'Focus_Subscribe_030');
    });

    it('Focus_Validate_031', 0, async () => {
      TestLogger.step(TAG, 'validator reports duplicate ids and dangling focus');
      const duplicated: LocalFocusManager = new LocalFocusManager(clock);
      duplicated.register(NODE_INPUT, GROUP_TITLE, 0, 0);
      duplicated.register(NODE_BACK, GROUP_TITLE, 0, 1);
      duplicated.nodes.push(new FocusNode(NODE_INPUT, GROUP_TITLE, 0, 2, 90));
      expect(duplicated.validate().indexOf(ISSUE_DUPLICATE_ID) >= 0).assertTrue();
      const missing: LocalFocusManager = new LocalFocusManager(clock);
      missing.register(NODE_INPUT, GROUP_TITLE, 0, 0);
      missing.focusedId = 'ghostNode';
      missing.uiFocusedId = 'ghostNode';
      expect(missing.validate().indexOf(ISSUE_FOCUSED_MISSING) >= 0).assertTrue();
      expect(missing.isConsistent()).assertFalse();
      missing.focusedId = NO_FOCUS;
      missing.uiFocusedId = NO_FOCUS;
      expect(missing.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'Focus_Validate_031');
    });

    it('Focus_Validate_032', 0, async () => {
      TestLogger.step(TAG, 'validator reports focus on a dead node and UI drift');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      manager.focusById(NODE_INPUT);
      const active: FocusNode | null = manager.nodeOf(NODE_INPUT);
      expect(active === null).assertFalse();
      if (active !== null) {
        active.enabled = false;
      }
      expect(manager.validate().indexOf(ISSUE_FOCUSED_DISABLED) >= 0).assertTrue();
      manager.forceUiFocus(NODE_HOME);
      expect(manager.uiInSync()).assertFalse();
      expect(manager.validate().indexOf(ISSUE_UI_DESYNC) >= 0).assertTrue();
      expect(manager.syncUi()).assertTrue();
      expect(manager.uiInSync()).assertTrue();
      expect(manager.syncUi()).assertFalse();
      expect(manager.uiFocusId()).assertEqual(NODE_INPUT);
      TestLogger.pass(TAG, 'Focus_Validate_032');
    });

    it('Focus_TabOrder_033', 0, async () => {
      TestLogger.step(TAG, 'tab order traversal follows registration');
      const manager: LocalFocusManager = buildTabletRing(new LocalFocusManager(clock));
      manager.focusById(NODE_INPUT);
      expect(manager.tabOrder().length).assertEqual(12);
      expect(manager.nextInOrder(NODE_INPUT)).assertEqual(NODE_BACK);
      expect(manager.previousInOrder(NODE_INPUT)).assertEqual(NO_FOCUS);
      expect(manager.nextInOrder(NODE_MENU)).assertEqual(NO_FOCUS);
      expect(manager.focusNext()).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_BACK);
      expect(manager.focusPrevious()).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_INPUT);
      manager.focusById(NODE_MENU);
      expect(manager.focusNext()).assertTrue();
      expect(manager.currentId()).assertEqual(NODE_INPUT);
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'Focus_TabOrder_033');
    });

    it('Focus_UI_035', 0, async () => {
      TestLogger.caseBegin(TAG, 'Focus_UI_035');
      TestLogger.step(TAG, 'dpad traversal keeps the title bar alive');
      await pressKey(driver, KEY_DPAD_DOWN, 1, DELAY_KEY_NAVIGATION);
      await pressKey(driver, KEY_DPAD_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressKey(driver, KEY_DPAD_UP, 1, TOLERANCE_FOCUS_CHANGE);
      await pressKey(driver, KEY_DPAD_LEFT, 1, TOLERANCE_FOCUS_CHANGE);
      await serializedDelay(driver, 100);
      const inputExists: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_COMPONENT);
      expect(inputExists).assertTrue();
      const homeExists: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      expect(homeExists).assertTrue();
      TestLogger.pass(TAG, 'Focus_UI_035');
    });
  });
}
