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
  ID_BUNDLE_INPUT,
  ID_ADD_BUTTON,
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  KEY_TAB,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_FOCUS_CHANGE,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  waitForIndexPage,
  pressAndWait,
  getCurrentFocusIndex,
  checkFocusState
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// A move that is computed from the geometry never produces a fractional gap smaller than this,
// the epsilon guards the strict comparisons against rounding noise of the rect arithmetic.
const GEOMETRY_EPSILON: number = 0.5;

// The orthogonal offset of a candidate node is weighted with this factor. A node that is far
// to the side must not win over a node that is aligned with the current one even when the
// aligned node is slightly farther away in the primary direction.
const ORTHOGONAL_PENALTY: number = 4;

// Capacity of the focus history ring. The stack keeps the recent six stops, which is enough
// to describe a full row of the entry page plus one item of context.
const HISTORY_CAPACITY: number = 6;

/**
 * Direction names used by the focus engine. A class of constants is used instead of an enum
 * because the values are also written into the navigation trace as plain strings.
 */
class FocusDirection {
  public static readonly UP: string = 'up';
  public static readonly DOWN: string = 'down';
  public static readonly LEFT: string = 'left';
  public static readonly RIGHT: string = 'right';
  public static readonly NONE: string = 'none';
}

/**
 * A point in vp coordinates, the origin sits in the top left corner of the page.
 */
interface FocusPoint {
  x: number;
  y: number;
}

/**
 * Axis aligned rectangle of a rendered component.
 */
interface FocusRect {
  x: number;
  y: number;
  width: number;
  height: number;
}

/**
 * Declaration of one node of the focus graph. The spec is kept separate from the node so that
 * a re-render can be simulated by building a fresh graph from the same spec list.
 */
interface FocusSpec {
  id: string;
  type: string;
  row: number;
  column: number;
  rect: FocusRect;
  focusable: boolean;
  enabled: boolean;
  visible: boolean;
}

/**
 * Result of a single directional move.
 */
interface FocusMoveResult {
  fromIndex: number;
  toIndex: number;
  direction: string;
  key: number;
  moved: boolean;
  blocked: boolean;
}

/**
 * One entry of the navigation trace.
 */
interface FocusTraceEntry {
  seq: number;
  fromIndex: number;
  toIndex: number;
  direction: string;
  key: number;
  moved: boolean;
}

/**
 * Result of a focus restoration.
 */
interface FocusRestoreResult {
  index: number;
  restoredById: boolean;
  fallbackUsed: boolean;
}

/**
 * Result of a snapshot capture.
 */
interface FocusSnapshotEntry {
  id: string;
  index: number;
}

/**
 * A single focusable or non focusable node of the entry page.
 */
class FocusNode {
  private id: string;
  private type: string;
  private index: number;
  private row: number;
  private column: number;
  private rect: FocusRect;
  private focusable: boolean;
  private enabled: boolean;
  private visible: boolean;
  private ringVisible: boolean = false;

  constructor(id: string, type: string, index: number, row: number, column: number, rect: FocusRect,
    focusable: boolean, enabled: boolean, visible: boolean) {
    this.id = id;
    this.type = type;
    this.index = index;
    this.row = row;
    this.column = column;
    this.rect = rect;
    this.focusable = focusable;
    this.enabled = enabled;
    this.visible = visible;
  }

  public getId(): string {
    return this.id;
  }

  public getType(): string {
    return this.type;
  }

  public getIndex(): number {
    return this.index;
  }

  public getRow(): number {
    return this.row;
  }

  public getColumn(): number {
    return this.column;
  }

  public getRect(): FocusRect {
    return {
      x: this.rect.x,
      y: this.rect.y,
      width: this.rect.width,
      height: this.rect.height
    };
  }

  public isFocusable(): boolean {
    return this.focusable;
  }

  public isEnabled(): boolean {
    return this.enabled;
  }

  public isVisible(): boolean {
    return this.visible;
  }

  public setEnabled(enabled: boolean): void {
    this.enabled = enabled;
  }

  public setVisible(visible: boolean): void {
    this.visible = visible;
  }

  public setFocusable(focusable: boolean): void {
    this.focusable = focusable;
  }

  public setRingVisible(visible: boolean): void {
    this.ringVisible = visible;
  }

  public isRingVisible(): boolean {
    return this.ringVisible;
  }

  public centerX(): number {
    return this.rect.x + this.rect.width / 2;
  }

  public centerY(): number {
    return this.rect.y + this.rect.height / 2;
  }

  public center(): FocusPoint {
    return {
      x: this.centerX(),
      y: this.centerY()
    };
  }

  /**
   * A node takes part in the traversal only when it is focusable, enabled and rendered.
   * The three conditions are separated so that a test can tell which one blocked a move.
   */
  public isTraversable(): boolean {
    return this.focusable && this.enabled && this.visible;
  }

  /**
   * Reports whether a point lands inside the node rectangle, the border belongs to the node.
   */
  public contains(x: number, y: number): boolean {
    const insideX: boolean = x >= this.rect.x && x <= this.rect.x + this.rect.width;
    const insideY: boolean = y >= this.rect.y && y <= this.rect.y + this.rect.height;
    return insideX && insideY;
  }

  /**
   * Euclidean distance between the centers of two nodes.
   */
  public distanceTo(other: FocusNode): number {
    const dx: number = other.centerX() - this.centerX();
    const dy: number = other.centerY() - this.centerY();
    return Math.sqrt(dx * dx + dy * dy);
  }

  public toString(): string {
    return `FocusNode{index=${this.index}, id=${this.id}, row=${this.row}, column=${this.column}}`;
  }
}

/**
 * Ordered node container. The insertion order is the DOM order of the page, which is the
 * order the focus system falls back to when the geometry does not decide a move.
 */
class FocusGraph {
  private nodes: FocusNode[] = [];
  private indexById: Map<string, number> = new Map<string, number>();

  constructor(specs: FocusSpec[]) {
    for (let i = 0; i < specs.length; i++) {
      const spec: FocusSpec = specs[i];
      const node: FocusNode = new FocusNode(spec.id, spec.type, i, spec.row, spec.column, spec.rect,
        spec.focusable, spec.enabled, spec.visible);
      this.nodes.push(node);
      this.indexById.set(spec.id, i);
    }
  }

  public size(): number {
    return this.nodes.length;
  }

  public getNodes(): FocusNode[] {
    return this.nodes.slice();
  }

  public byIndex(index: number): FocusNode | null {
    if (index < 0 || index >= this.nodes.length) {
      return null;
    }
    return this.nodes[index];
  }

  public byId(id: string): FocusNode | null {
    const index: number | undefined = this.indexById.get(id);
    if (index === undefined) {
      return null;
    }
    return this.nodes[index];
  }

  public indexOf(id: string): number {
    const index: number | undefined = this.indexById.get(id);
    if (index === undefined) {
      return -1;
    }
    return index;
  }

  /**
   * Indices of the nodes that can receive the focus, in DOM order.
   */
  public traversableIndices(): number[] {
    const indices: number[] = [];
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].isTraversable()) {
        indices.push(i);
      }
    }
    return indices;
  }

  public firstTraversableIndex(): number {
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].isTraversable()) {
        return i;
      }
    }
    return -1;
  }

  public lastTraversableIndex(): number {
    for (let i = this.nodes.length - 1; i >= 0; i--) {
      if (this.nodes[i].isTraversable()) {
        return i;
      }
    }
    return -1;
  }

  /**
   * Index of the node with the largest vertical center, the bottom edge of the page.
   */
  public bottomEdgeIndex(): number {
    let bestIndex: number = -1;
    let bestY: number = -Number.MAX_VALUE;
    for (let i = 0; i < this.nodes.length; i++) {
      if (!this.nodes[i].isTraversable()) {
        continue;
      }
      if (this.nodes[i].centerY() > bestY) {
        bestY = this.nodes[i].centerY();
        bestIndex = i;
      }
    }
    return bestIndex;
  }

  /**
   * Index of the node with the smallest vertical center, the top edge of the page.
   */
  public topEdgeIndex(): number {
    let bestIndex: number = -1;
    let bestY: number = Number.MAX_VALUE;
    for (let i = 0; i < this.nodes.length; i++) {
      if (!this.nodes[i].isTraversable()) {
        continue;
      }
      if (this.nodes[i].centerY() < bestY) {
        bestY = this.nodes[i].centerY();
        bestIndex = i;
      }
    }
    return bestIndex;
  }

  /**
   * Index of the node with the smallest horizontal center, the left edge of the page.
   */
  public leftEdgeIndex(): number {
    let bestIndex: number = -1;
    let bestX: number = Number.MAX_VALUE;
    for (let i = 0; i < this.nodes.length; i++) {
      if (!this.nodes[i].isTraversable()) {
        continue;
      }
      if (this.nodes[i].centerX() < bestX) {
        bestX = this.nodes[i].centerX();
        bestIndex = i;
      }
    }
    return bestIndex;
  }

  /**
   * Index of the node with the largest horizontal center, the right edge of the page.
   */
  public rightEdgeIndex(): number {
    let bestIndex: number = -1;
    let bestX: number = -Number.MAX_VALUE;
    for (let i = 0; i < this.nodes.length; i++) {
      if (!this.nodes[i].isTraversable()) {
        continue;
      }
      if (this.nodes[i].centerX() > bestX) {
        bestX = this.nodes[i].centerX();
        bestIndex = i;
      }
    }
    return bestIndex;
  }

  public enabledCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].isEnabled()) {
        count++;
      }
    }
    return count;
  }

  public visibleCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].isVisible()) {
        count++;
      }
    }
    return count;
  }

  public ids(): string[] {
    const values: string[] = [];
    for (let i = 0; i < this.nodes.length; i++) {
      values.push(this.nodes[i].getId());
    }
    return values;
  }

  public toString(): string {
    return `FocusGraph{nodes=${this.nodes.length}, traversable=${this.traversableIndices().length}}`;
  }
}

/**
 * Directional move computation over a focus graph.
 *
 * The engine scores every candidate with the gap along the requested axis plus a weighted
 * offset along the other axis, which reproduces the behaviour of the ArkUI focus system on a
 * card layout: the nearest aligned neighbour wins, a diagonal neighbour only wins when no
 * aligned neighbour exists. The wrap policy is off by default, an edge move keeps the focus.
 */
class FocusNavigator {
  private graph: FocusGraph;
  private wrapEnabled: boolean = false;
  private blockedMoves: number = 0;
  private moveCounts: Map<string, number> = new Map<string, number>();

  constructor(graph: FocusGraph) {
    this.graph = graph;
    const directions: string[] = [
      FocusDirection.UP,
      FocusDirection.DOWN,
      FocusDirection.LEFT,
      FocusDirection.RIGHT
    ];
    for (let i = 0; i < directions.length; i++) {
      this.moveCounts.set(directions[i], 0);
    }
  }

  public setWrapEnabled(enabled: boolean): void {
    this.wrapEnabled = enabled;
  }

  public isWrapEnabled(): boolean {
    return this.wrapEnabled;
  }

  public getBlockedMoves(): number {
    return this.blockedMoves;
  }

  public getMoveCount(direction: string): number {
    return this.moveCounts.get(direction) ?? 0;
  }

  /**
   * Computes the next focus index for a direction. The current index is returned unchanged
   * when the move is blocked, so a caller can always keep driving the page.
   */
  public move(currentIndex: number, direction: string): number {
    const current: FocusNode | null = this.graph.byIndex(currentIndex);
    if (current === null || !current.isTraversable()) {
      this.blockedMoves++;
      return currentIndex;
    }
    let bestIndex: number = -1;
    let bestScore: number = Number.MAX_VALUE;
    const nodes: FocusNode[] = this.graph.getNodes();
    for (let i = 0; i < nodes.length; i++) {
      if (i === currentIndex) {
        continue;
      }
      if (!nodes[i].isTraversable()) {
        continue;
      }
      const score: number = this.scoreCandidate(current, nodes[i], direction);
      if (score < 0) {
        continue;
      }
      if (score < bestScore) {
        bestScore = score;
        bestIndex = i;
      }
    }
    if (bestIndex < 0) {
      this.blockedMoves++;
      if (this.wrapEnabled) {
        const wrappedIndex: number = this.wrapTarget(direction);
        if (wrappedIndex >= 0 && wrappedIndex !== currentIndex) {
          this.recordMove(direction);
          return wrappedIndex;
        }
      }
      return currentIndex;
    }
    this.recordMove(direction);
    return bestIndex;
  }

  /**
   * Score of one candidate, a negative score means that the candidate is not in the requested
   * direction at all. The score is never zero for an accepted candidate.
   */
  private scoreCandidate(from: FocusNode, to: FocusNode, direction: string): number {
    const dx: number = to.centerX() - from.centerX();
    const dy: number = to.centerY() - from.centerY();
    if (direction === FocusDirection.RIGHT) {
      if (dx <= GEOMETRY_EPSILON) {
        return -1;
      }
      return dx + Math.abs(dy) * ORTHOGONAL_PENALTY;
    }
    if (direction === FocusDirection.LEFT) {
      if (dx >= -GEOMETRY_EPSILON) {
        return -1;
      }
      return Math.abs(dx) + Math.abs(dy) * ORTHOGONAL_PENALTY;
    }
    if (direction === FocusDirection.DOWN) {
      if (dy <= GEOMETRY_EPSILON) {
        return -1;
      }
      return dy + Math.abs(dx) * ORTHOGONAL_PENALTY;
    }
    if (direction === FocusDirection.UP) {
      if (dy >= -GEOMETRY_EPSILON) {
        return -1;
      }
      return Math.abs(dy) + Math.abs(dx) * ORTHOGONAL_PENALTY;
    }
    return -1;
  }

  /**
   * Entry point used when the wrap policy is enabled and the move ran off the page.
   */
  private wrapTarget(direction: string): number {
    if (direction === FocusDirection.UP) {
      return this.graph.bottomEdgeIndex();
    }
    if (direction === FocusDirection.DOWN) {
      return this.graph.topEdgeIndex();
    }
    if (direction === FocusDirection.LEFT) {
      return this.graph.rightEdgeIndex();
    }
    if (direction === FocusDirection.RIGHT) {
      return this.graph.leftEdgeIndex();
    }
    return -1;
  }

  private recordMove(direction: string): void {
    const current: number = this.moveCounts.get(direction) ?? 0;
    this.moveCounts.set(direction, current + 1);
  }

  public resetCounters(): void {
    this.blockedMoves = 0;
    const directions: string[] = [
      FocusDirection.UP,
      FocusDirection.DOWN,
      FocusDirection.LEFT,
      FocusDirection.RIGHT
    ];
    for (let i = 0; i < directions.length; i++) {
      this.moveCounts.set(directions[i], 0);
    }
  }
}

/**
 * Tab key cycler. Unlike the arrow keys the Tab key always wraps, and it skips every node
 * that cannot receive the focus.
 */
class FocusCycler {
  private graph: FocusGraph;
  private wraps: number = 0;
  private steps: number = 0;

  constructor(graph: FocusGraph) {
    this.graph = graph;
  }

  public next(currentIndex: number, forward: boolean): number {
    const traversable: number[] = this.graph.traversableIndices();
    if (traversable.length === 0) {
      return currentIndex;
    }
    if (traversable.length === 1) {
      return traversable[0];
    }
    let position: number = traversable.indexOf(currentIndex);
    if (position < 0) {
      return traversable[0];
    }
    this.steps++;
    let nextPosition: number = forward ? position + 1 : position - 1;
    if (nextPosition >= traversable.length) {
      nextPosition = 0;
      this.wraps++;
    }
    if (nextPosition < 0) {
      nextPosition = traversable.length - 1;
      this.wraps++;
    }
    return traversable[nextPosition];
  }

  public getWrapCount(): number {
    return this.wraps;
  }

  public getStepCount(): number {
    return this.steps;
  }

  public reset(): void {
    this.wraps = 0;
    this.steps = 0;
  }
}

/**
 * Bounded history of the visited focus ids. The most recent id sits at the top, the oldest
 * id falls out when the capacity is exceeded.
 */
class FocusHistory {
  private items: string[] = [];
  private capacity: number;

  constructor(capacity: number = HISTORY_CAPACITY) {
    this.capacity = capacity > 0 ? capacity : 1;
  }

  public push(id: string): void {
    if (id.length === 0) {
      return;
    }
    if (this.items.length > 0 && this.items[this.items.length - 1] === id) {
      return;
    }
    this.items.push(id);
    while (this.items.length > this.capacity) {
      this.items.shift();
    }
  }

  public pop(): string {
    if (this.items.length === 0) {
      return '';
    }
    const value: string = this.items[this.items.length - 1];
    this.items.pop();
    return value;
  }

  public peek(): string {
    if (this.items.length === 0) {
      return '';
    }
    return this.items[this.items.length - 1];
  }

  public previous(): string {
    if (this.items.length < 2) {
      return '';
    }
    return this.items[this.items.length - 2];
  }

  public size(): number {
    return this.items.length;
  }

  public getCapacity(): number {
    return this.capacity;
  }

  public contains(id: string): boolean {
    return this.items.indexOf(id) >= 0;
  }

  public depthOf(id: string): number {
    const position: number = this.items.indexOf(id);
    if (position < 0) {
      return -1;
    }
    return this.items.length - 1 - position;
  }

  public toArray(): string[] {
    return this.items.slice();
  }

  public clear(): void {
    this.items = [];
  }

  public toString(): string {
    return `FocusHistory{size=${this.items.length}, capacity=${this.capacity}}`;
  }
}

/**
 * Chronological record of the computed moves, it is the evidence used by the live cases to
 * prove that a key sequence was actually translated into a navigation.
 */
class FocusTrace {
  private entries: FocusTraceEntry[] = [];
  private sequence: number = 0;

  public record(fromIndex: number, toIndex: number, direction: string, key: number, moved: boolean): void {
    this.sequence++;
    this.entries.push({
      seq: this.sequence,
      fromIndex: fromIndex,
      toIndex: toIndex,
      direction: direction,
      key: key,
      moved: moved
    });
  }

  public size(): number {
    return this.entries.length;
  }

  public getEntries(): FocusTraceEntry[] {
    return this.entries.slice();
  }

  public movedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].moved) {
        count++;
      }
    }
    return count;
  }

  public blockedCount(): number {
    return this.entries.length - this.movedCount();
  }

  public directionCount(direction: string): number {
    let count: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].direction === direction) {
        count++;
      }
    }
    return count;
  }

  public last(): FocusTraceEntry | null {
    if (this.entries.length === 0) {
      return null;
    }
    return this.entries[this.entries.length - 1];
  }

  public lastTo(): number {
    const entry: FocusTraceEntry | null = this.last();
    return entry === null ? -1 : entry.toIndex;
  }

  public visitedIndices(): number[] {
    const values: number[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      if (values.indexOf(this.entries[i].toIndex) < 0) {
        values.push(this.entries[i].toIndex);
      }
    }
    return values;
  }

  public asLine(): string {
    const parts: string[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      parts.push(`${this.entries[i].fromIndex}>${this.entries[i].toIndex}`);
    }
    return parts.join(',');
  }

  public clear(): void {
    this.entries = [];
    this.sequence = 0;
  }

  public toString(): string {
    return `FocusTrace{entries=${this.entries.length}, moved=${this.movedCount()}}`;
  }
}

/**
 * A focus driving session: it owns the current focus index, the navigator, the Tab cycler,
 * the history and the trace, and applies the key to direction mapping.
 */
class FocusSession {
  private graph: FocusGraph;
  private navigator: FocusNavigator;
  private cycler: FocusCycler;
  private history: FocusHistory;
  private trace: FocusTrace;
  private currentIndex: number;

  constructor(graph: FocusGraph) {
    this.graph = graph;
    this.navigator = new FocusNavigator(graph);
    this.cycler = new FocusCycler(graph);
    this.history = new FocusHistory();
    this.trace = new FocusTrace();
    this.currentIndex = graph.firstTraversableIndex();
    this.recordCurrentInHistory();
  }

  public getCurrentIndex(): number {
    return this.currentIndex;
  }

  public setCurrentIndex(index: number): void {
    this.currentIndex = index;
    this.recordCurrentInHistory();
  }

  public focusById(id: string): boolean {
    const index: number = this.graph.indexOf(id);
    if (index < 0) {
      return false;
    }
    const node: FocusNode | null = this.graph.byIndex(index);
    if (node === null || !node.isTraversable()) {
      return false;
    }
    this.currentIndex = index;
    this.recordCurrentInHistory();
    return true;
  }

  public getGraph(): FocusGraph {
    return this.graph;
  }

  public getNavigator(): FocusNavigator {
    return this.navigator;
  }

  public getCycler(): FocusCycler {
    return this.cycler;
  }

  public getHistory(): FocusHistory {
    return this.history;
  }

  public getTrace(): FocusTrace {
    return this.trace;
  }

  /**
   * Applies a direction and records the outcome in the history and the trace.
   */
  public move(direction: string): FocusMoveResult {
    const fromIndex: number = this.currentIndex;
    const toIndex: number = this.navigator.move(fromIndex, direction);
    const moved: boolean = toIndex !== fromIndex;
    this.currentIndex = toIndex;
    if (moved) {
      this.recordCurrentInHistory();
    }
    this.trace.record(fromIndex, toIndex, direction, -1, moved);
    return {
      fromIndex: fromIndex,
      toIndex: toIndex,
      direction: direction,
      key: -1,
      moved: moved,
      blocked: !moved
    };
  }

  /**
   * Translates a key code into a direction and applies it. Tab is delegated to the cycler,
   * every key without a navigation meaning produces a blocked result and no trace noise.
   */
  public pressKey(key: number): FocusMoveResult {
    const direction: string = FocusSession.directionOfKey(key);
    if (direction === FocusDirection.NONE) {
      if (key === KEY_TAB) {
        const fromIndex: number = this.currentIndex;
        const toIndex: number = this.cycler.next(fromIndex, true);
        const tabMoved: boolean = toIndex !== fromIndex;
        this.currentIndex = toIndex;
        if (tabMoved) {
          this.recordCurrentInHistory();
        }
        this.trace.record(fromIndex, toIndex, FocusDirection.DOWN, key, tabMoved);
        return {
          fromIndex: fromIndex,
          toIndex: toIndex,
          direction: FocusDirection.DOWN,
          key: key,
          moved: tabMoved,
          blocked: !tabMoved
        };
      }
      return {
        fromIndex: this.currentIndex,
        toIndex: this.currentIndex,
        direction: FocusDirection.NONE,
        key: key,
        moved: false,
        blocked: true
      };
    }
    const fromIndex: number = this.currentIndex;
    const toIndex: number = this.navigator.move(fromIndex, direction);
    const moved: boolean = toIndex !== fromIndex;
    this.currentIndex = toIndex;
    if (moved) {
      this.recordCurrentInHistory();
    }
    this.trace.record(fromIndex, toIndex, direction, key, moved);
    return {
      fromIndex: fromIndex,
      toIndex: toIndex,
      direction: direction,
      key: key,
      moved: moved,
      blocked: !moved
    };
  }

  /**
   * Maps an OpenHarmony key code onto a direction, the arrow keys are the only navigation
   * keys of the entry page.
   */
  public static directionOfKey(key: number): string {
    if (key === KEY_UP) {
      return FocusDirection.UP;
    }
    if (key === KEY_DOWN) {
      return FocusDirection.DOWN;
    }
    if (key === KEY_LEFT) {
      return FocusDirection.LEFT;
    }
    if (key === KEY_RIGHT) {
      return FocusDirection.RIGHT;
    }
    return FocusDirection.NONE;
  }

  public reset(): void {
    this.currentIndex = this.graph.firstTraversableIndex();
    this.history.clear();
    this.trace.clear();
    this.navigator.resetCounters();
    this.cycler.reset();
    this.recordCurrentInHistory();
  }

  private recordCurrentInHistory(): void {
    const node: FocusNode | null = this.graph.byIndex(this.currentIndex);
    if (node !== null) {
      this.history.push(node.getId());
    }
  }

  public toString(): string {
    return `FocusSession{index=${this.currentIndex}, history=${this.history.size()}, trace=${this.trace.size()}}`;
  }
}

/**
 * Snapshot of the focus at a point in time, it is the input of the restoration after a
 * re-render of the page.
 */
class FocusSnapshot {
  private entries: FocusSnapshotEntry[] = [];
  private activeId: string = '';
  private activeIndex: number = -1;

  public static capture(graph: FocusGraph, activeIndex: number): FocusSnapshot {
    const snapshot: FocusSnapshot = new FocusSnapshot();
    const nodes: FocusNode[] = graph.getNodes();
    for (let i = 0; i < nodes.length; i++) {
      snapshot.entries.push({
        id: nodes[i].getId(),
        index: i
      });
    }
    const active: FocusNode | null = graph.byIndex(activeIndex);
    if (active !== null) {
      snapshot.activeId = active.getId();
      snapshot.activeIndex = activeIndex;
    }
    return snapshot;
  }

  public getActiveId(): string {
    return this.activeId;
  }

  public getActiveIndex(): number {
    return this.activeIndex;
  }

  public size(): number {
    return this.entries.length;
  }

  public hasId(id: string): boolean {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].id === id) {
        return true;
      }
    }
    return false;
  }

  /**
   * Restores the focus by identifier. When the identifier disappeared from the new graph the
   * closest index of the old snapshot is used instead and the fallback flag is reported.
   */
  public restore(graph: FocusGraph): FocusRestoreResult {
    const restoredIndex: number = graph.indexOf(this.activeId);
    if (restoredIndex >= 0) {
      const node: FocusNode | null = graph.byIndex(restoredIndex);
      if (node !== null && node.isTraversable()) {
        return {
          index: restoredIndex,
          restoredById: true,
          fallbackUsed: false
        };
      }
    }
    let fallbackIndex: number = this.activeIndex;
    if (fallbackIndex < 0) {
      fallbackIndex = graph.firstTraversableIndex();
    }
    if (fallbackIndex >= graph.size()) {
      fallbackIndex = graph.size() - 1;
    }
    let candidate: FocusNode | null = graph.byIndex(fallbackIndex);
    if (candidate === null || !candidate.isTraversable()) {
      fallbackIndex = graph.firstTraversableIndex();
      candidate = graph.byIndex(fallbackIndex);
    }
    return {
      index: fallbackIndex,
      restoredById: false,
      fallbackUsed: true
    };
  }

  public toString(): string {
    return `FocusSnapshot{entries=${this.entries.length}, active=${this.activeId}}`;
  }
}

/**
 * Deterministic pseudo random generator of the stress case, it keeps the case reproducible
 * so that a failure can be replayed with the same sequence of keys.
 */
function nextPseudoRandom(state: number): number {
  return (state * 48271) % 2147483647;
}

/**
 * Builds the focus graph of the entry page.
 *
 * The coordinates mirror the card layout of pages/Index.ets on a 360 vp wide viewport. The
 * texts are part of the graph but they are not focusable, exactly like the ArkUI default for
 * a Text component without a focusable modifier.
 */
function buildEntryPageGraph(): FocusGraph {
  const specs: FocusSpec[] = [
    {
      id: ID_INDEX_TITLE, type: 'Text', row: 0, column: 0,
      rect: { x: 0, y: 0, width: 300, height: 32 },
      focusable: false, enabled: true, visible: true
    },
    {
      id: 'assessment_index_intro', type: 'Text', row: 1, column: 0,
      rect: { x: 0, y: 40, width: 340, height: 40 },
      focusable: false, enabled: true, visible: true
    },
    {
      id: 'assessment_duration_default', type: 'Text', row: 2, column: 0,
      rect: { x: 0, y: 96, width: 80, height: 28 },
      focusable: false, enabled: true, visible: true
    },
    {
      id: 'assessment_duration_ten', type: 'Text', row: 2, column: 1,
      rect: { x: 88, y: 96, width: 60, height: 28 },
      focusable: false, enabled: true, visible: true
    },
    {
      id: 'assessment_duration_thirty', type: 'Text', row: 2, column: 2,
      rect: { x: 156, y: 96, width: 60, height: 28 },
      focusable: false, enabled: true, visible: true
    },
    {
      id: 'assessment_duration_sixty', type: 'Text', row: 2, column: 3,
      rect: { x: 224, y: 96, width: 60, height: 28 },
      focusable: false, enabled: true, visible: true
    },
    {
      id: ID_BUNDLE_INPUT, type: 'TextInput', row: 3, column: 0,
      rect: { x: 0, y: 136, width: 260, height: 40 },
      focusable: true, enabled: true, visible: true
    },
    {
      id: ID_ADD_BUTTON, type: 'Button', row: 3, column: 1,
      rect: { x: 268, y: 136, width: 80, height: 40 },
      focusable: true, enabled: true, visible: true
    },
    {
      id: ID_BEGIN_BUTTON, type: 'Button', row: 4, column: 0,
      rect: { x: 0, y: 188, width: 164, height: 44 },
      focusable: true, enabled: true, visible: true
    },
    {
      id: ID_END_BUTTON, type: 'Button', row: 4, column: 1,
      rect: { x: 172, y: 188, width: 164, height: 44 },
      focusable: true, enabled: false, visible: true
    },
    {
      id: ID_QUERY_STATE_BUTTON, type: 'Button', row: 5, column: 0,
      rect: { x: 0, y: 244, width: 164, height: 44 },
      focusable: true, enabled: true, visible: true
    },
    {
      id: ID_QUERY_CONFIG_BUTTON, type: 'Button', row: 5, column: 1,
      rect: { x: 172, y: 244, width: 164, height: 44 },
      focusable: true, enabled: true, visible: true
    },
    {
      id: 'assessment_status_title', type: 'Text', row: 6, column: 0,
      rect: { x: 0, y: 300, width: 120, height: 24 },
      focusable: false, enabled: true, visible: true
    },
    {
      id: 'assessment_status_text', type: 'Text', row: 7, column: 0,
      rect: { x: 0, y: 328, width: 260, height: 24 },
      focusable: false, enabled: true, visible: true
    },
    {
      id: 'assessment_config_label', type: 'Text', row: 8, column: 0,
      rect: { x: 0, y: 360, width: 140, height: 20 },
      focusable: false, enabled: true, visible: true
    },
    {
      id: 'assessment_config_value', type: 'Text', row: 9, column: 0,
      rect: { x: 0, y: 384, width: 300, height: 24 },
      focusable: false, enabled: true, visible: true
    },
    {
      id: 'assessment_event_label', type: 'Text', row: 10, column: 0,
      rect: { x: 0, y: 416, width: 120, height: 20 },
      focusable: false, enabled: true, visible: true
    },
    {
      id: 'assessment_event_entry', type: 'Text', row: 11, column: 0,
      rect: { x: 0, y: 440, width: 320, height: 20 },
      focusable: false, enabled: true, visible: true
    }
  ];
  return new FocusGraph(specs);
}

/**
 * Starts the sample and waits until the entry page is rendered, a case that cannot reach the
 * page logs a warning and returns instead of failing the whole suite.
 */
async function ensureIndexPage(driver: Driver): Promise<boolean> {
  const title: Component | null = await findById(driver, ID_INDEX_TITLE);
  if (title !== null) {
    return true;
  }
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'ensureIndexPage: the entry page is not rendered');
  }
  return rendered;
}

/**
 * Reads the focus index and normalizes the driver failure to -1.
 */
async function safeFocusIndex(driver: Driver): Promise<number> {
  const index: number = await getCurrentFocusIndex(driver);
  if (index < -1) {
    hilog.warn(DOMAIN, TAG, 'safeFocusIndex: unexpected index %{public}d', index);
    return -1;
  }
  return index;
}

export default function focusNavigationTest() {
  describe('FocusNavigation_Test', () => {
    let driver: Driver;
    let graph: FocusGraph;
    let session: FocusSession;
    let cycler: FocusCycler;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      graph = buildEntryPageGraph();
      session = new FocusSession(graph);
      cycler = new FocusCycler(graph);
      hilog.info(DOMAIN, TAG, 'FocusNavigation_Test beforeAll, %{public}s', graph.toString());
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: build the focus graph of the entry page.
     * Expectation: the graph carries one node per rendered element and the DOM order is kept.
     */
    it('Assessment_FocusGraphNodeCount_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGraphNodeCount_001, begin');
      expect(graph.size()).assertEqual(18);
      expect(graph.ids().length).assertEqual(18);
      expect(graph.byIndex(0) !== null).assertTrue();
      expect(graph.byIndex(17) !== null).assertTrue();
      expect(graph.byIndex(18) === null).assertTrue();
      expect(graph.byIndex(-1) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s nodes: %{public}d', BUNDLE + 'FocusGraphNodeCount_001', graph.size());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGraphNodeCount_001, end');
    });

    /**
     * Scenario: the DOM order of the graph.
     * Expectation: the first node is the page title and the last node is the event log entry,
     * which is the order the List builder declares its items in.
     */
    it('Assessment_FocusGraphDomOrder_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGraphDomOrder_002, begin');
      const ids: string[] = graph.ids();
      expect(ids[0]).assertEqual(ID_INDEX_TITLE);
      expect(ids[17]).assertEqual('assessment_event_entry');
      expect(ids.indexOf(ID_BUNDLE_INPUT)).assertEqual(6);
      expect(ids.indexOf(ID_ADD_BUTTON)).assertEqual(7);
      expect(ids.indexOf(ID_BEGIN_BUTTON)).assertEqual(8);
      expect(ids.indexOf(ID_END_BUTTON)).assertEqual(9);
      expect(ids.indexOf(ID_QUERY_STATE_BUTTON)).assertEqual(10);
      expect(ids.indexOf(ID_QUERY_CONFIG_BUTTON)).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGraphDomOrder_002, end');
    });

    /**
     * Scenario: the focusable node list of the entry page.
     * Expectation: only the input box and the five buttons take part in the traversal, the
     * texts are rendered but skipped by the focus system.
     */
    it('Assessment_FocusableIndices_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusableIndices_003, begin');
      const indices: number[] = graph.traversableIndices();
      expect(indices.length).assertEqual(5);
      expect(indices[0]).assertEqual(6);
      expect(indices[1]).assertEqual(7);
      expect(indices[2]).assertEqual(8);
      expect(indices[3]).assertEqual(10);
      expect(indices[4]).assertEqual(11);
      expect(indices.indexOf(9)).assertEqual(-1);
      expect(graph.firstTraversableIndex()).assertEqual(6);
      expect(graph.lastTraversableIndex()).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusableIndices_003, end');
    });

    /**
     * Scenario: the end button starts disabled because no assessment session is active.
     * Expectation: the node is present in the graph but excluded from the traversal, and the
     * enabled and visible counters stay independent from the focusable counter.
     */
    it('Assessment_DisabledNodeExcluded_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DisabledNodeExcluded_004, begin');
      const endNode: FocusNode | null = graph.byId(ID_END_BUTTON);
      expect(endNode !== null).assertTrue();
      if (endNode !== null) {
        expect(endNode.isFocusable()).assertTrue();
        expect(endNode.isEnabled()).assertFalse();
        expect(endNode.isTraversable()).assertFalse();
        expect(endNode.getRow()).assertEqual(4);
        expect(endNode.getColumn()).assertEqual(1);
      }
      expect(graph.enabledCount()).assertEqual(17);
      expect(graph.visibleCount()).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DisabledNodeExcluded_004, end');
    });

    /**
     * Scenario: center point arithmetic of a node.
     * Expectation: the center of the begin button is half of its width and height away from
     * the top left corner.
     */
    it('Assessment_NodeCenterComputation_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NodeCenterComputation_005, begin');
      const beginNode: FocusNode | null = graph.byId(ID_BEGIN_BUTTON);
      expect(beginNode !== null).assertTrue();
      if (beginNode !== null) {
        expect(beginNode.centerX()).assertEqual(82);
        expect(beginNode.centerY()).assertEqual(210);
        const center: FocusPoint = beginNode.center();
        expect(center.x).assertEqual(82);
        expect(center.y).assertEqual(210);
        const rect: FocusRect = beginNode.getRect();
        expect(rect.width).assertEqual(164);
        expect(rect.height).assertEqual(44);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NodeCenterComputation_005, end');
    });

    /**
     * Scenario: hit testing of a node rectangle.
     * Expectation: the center hits, the top left corner hits, a point beyond the right edge
     * misses and a negative coordinate misses.
     */
    it('Assessment_NodeContainsPoint_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NodeContainsPoint_006, begin');
      const beginNode: FocusNode | null = graph.byId(ID_BEGIN_BUTTON);
      expect(beginNode !== null).assertTrue();
      if (beginNode !== null) {
        expect(beginNode.contains(82, 210)).assertTrue();
        expect(beginNode.contains(0, 188)).assertTrue();
        expect(beginNode.contains(164, 232)).assertTrue();
        expect(beginNode.contains(165, 210)).assertFalse();
        expect(beginNode.contains(-1, 210)).assertFalse();
        expect(beginNode.contains(82, 300)).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NodeContainsPoint_006, end');
    });

    /**
     * Scenario: distance between two nodes.
     * Expectation: the two buttons of the same row are one hundred seventy two vp apart and
     * the distance is symmetric.
     */
    it('Assessment_NodeDistance_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NodeDistance_007, begin');
      const beginNode: FocusNode | null = graph.byId(ID_BEGIN_BUTTON);
      const endNode: FocusNode | null = graph.byId(ID_END_BUTTON);
      expect(beginNode !== null).assertTrue();
      expect(endNode !== null).assertTrue();
      if (beginNode !== null && endNode !== null) {
        expect(beginNode.distanceTo(endNode)).assertEqual(172);
        expect(endNode.distanceTo(beginNode)).assertEqual(172);
        expect(beginNode.distanceTo(beginNode)).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NodeDistance_007, end');
    });

    /**
     * Scenario: a move to the right from the input box.
     * Expectation: the focus lands on the add button of the same row.
     */
    it('Assessment_MoveRight_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MoveRight_008, begin');
      session.reset();
      session.setCurrentIndex(6);
      const result: FocusMoveResult = session.move(FocusDirection.RIGHT);
      expect(result.fromIndex).assertEqual(6);
      expect(result.toIndex).assertEqual(7);
      expect(result.moved).assertTrue();
      expect(result.blocked).assertFalse();
      expect(session.getCurrentIndex()).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MoveRight_008, end');
    });

    /**
     * Scenario: a move to the left commits from the add button.
     * Expectation: the focus returns to the input box.
     */
    it('Assessment_MoveLeft_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MoveLeft_009, begin');
      session.reset();
      session.setCurrentIndex(7);
      const result: FocusMoveResult = session.move(FocusDirection.LEFT);
      expect(result.toIndex).assertEqual(6);
      expect(result.moved).assertTrue();
      expect(session.getCurrentIndex()).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MoveLeft_009, end');
    });

    /**
     * Scenario: a move down from the input box.
     * Expectation: the focus lands on the begin button, the aligned candidate wins over the
     * diagonal query configuration button.
     */
    it('Assessment_MoveDown_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MoveDown_010, begin');
      session.reset();
      session.setCurrentIndex(6);
      const result: FocusMoveResult = session.move(FocusDirection.DOWN);
      expect(result.toIndex).assertEqual(8);
      expect(result.moved).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MoveDown_010, end');
    });

    /**
     * Scenario: a move up from the begin button.
     * Expectation: the focus returns to the input box although the add button is closer to
     * the begin button in straight line distance.
     */
    it('Assessment_MoveUp_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MoveUp_011, begin');
      session.reset();
      session.setCurrentIndex(8);
      const result: FocusMoveResult = session.move(FocusDirection.UP);
      expect(result.toIndex).assertEqual(6);
      expect(result.moved).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MoveUp_011, end');
    });

    /**
     * Scenario: a move to the right from the add button.
     * Expectation: there is no candidate on the right edge, the focus is clamped and the
     * blocked counter of the navigator grows.
     */
    it('Assessment_MoveRightBoundaryClamp_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MoveRightBoundaryClamp_012, begin');
      session.reset();
      session.setCurrentIndex(7);
      const blockedBefore: number = session.getNavigator().getBlockedMoves();
      const result: FocusMoveResult = session.move(FocusDirection.RIGHT);
      expect(result.toIndex).assertEqual(7);
      expect(result.moved).assertFalse();
      expect(result.blocked).assertTrue();
      expect(session.getNavigator().getBlockedMoves()).assertEqual(blockedBefore + 1);
      expect(session.getCurrentIndex()).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MoveRightBoundaryClamp_012, end');
    });

    /**
     * Scenario: a move up from the first focusable node.
     * Expectation: clamp at the top edge, the input box keeps the focus.
     */
    it('Assessment_MoveUpBoundaryClamp_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MoveUpBoundaryClamp_013, begin');
      session.reset();
      session.setCurrentIndex(6);
      const result: FocusMoveResult = session.move(FocusDirection.UP);
      expect(result.toIndex).assertEqual(6);
      expect(result.blocked).assertTrue();
      expect(session.getHistory().size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MoveUpBoundaryClamp_013, end');
    });

    /**
     * Scenario: a move down from the query row.
     * Expectation: the last focusable row keeps the focus, the text nodes below never receive
     * it because they are not focusable.
     */
    it('Assessment_MoveDownBeyondLastRow_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MoveDownBeyondLastRow_014, begin');
      session.reset();
      session.setCurrentIndex(11);
      const result: FocusMoveResult = session.move(FocusDirection.DOWN);
      expect(result.toIndex).assertEqual(11);
      expect(result.blocked).assertTrue();
      const stateResult: FocusMoveResult = session.move(FocusDirection.DOWN);
      expect(stateResult.toIndex).assertEqual(11);
      expect(session.getNavigator().getMoveCount(FocusDirection.DOWN)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MoveDownBeyondLastRow_014, end');
    });

    /**
     * Scenario: key to direction mapping.
     * Expectation: the four arrow codes map onto the four directions and the Enter code maps
     * onto the none direction.
     */
    it('Assessment_KeyDirectionMapping_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyDirectionMapping_017, begin');
      expect(FocusSession.directionOfKey(KEY_UP)).assertEqual(FocusDirection.UP);
      expect(FocusSession.directionOfKey(KEY_DOWN)).assertEqual(FocusDirection.DOWN);
      expect(FocusSession.directionOfKey(KEY_LEFT)).assertEqual(FocusDirection.LEFT);
      expect(FocusSession.directionOfKey(KEY_RIGHT)).assertEqual(FocusDirection.RIGHT);
      expect(FocusSession.directionOfKey(KEY_ENTER)).assertEqual(FocusDirection.NONE);
      expect(FocusSession.directionOfKey(KEY_TAB)).assertEqual(FocusDirection.NONE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyDirectionMapping_017, end');
    });

    /**
     * Scenario: press the down key through the session.
     * Expectation: the trace records the arrow key code and marks the move as moved.
     */
    it('Assessment_KeyPressDown_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyPressDown_018, begin');
      session.reset();
      session.setCurrentIndex(6);
      const result: FocusMoveResult = session.pressKey(KEY_DOWN);
      expect(result.key).assertEqual(KEY_DOWN);
      expect(result.direction).assertEqual(FocusDirection.DOWN);
      expect(result.toIndex).assertEqual(8);
      const entry: FocusTraceEntry | null = session.getTrace().last();
      expect(entry !== null).assertTrue();
      if (entry !== null) {
        expect(entry.key).assertEqual(KEY_DOWN);
        expect(entry.moved).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyPressDown_018, end');
    });

    /**
     * Scenario: press the right and the left key in sequence.
     * Expectation: the focus returns to the start node and the trace holds two entries.
     */
    it('Assessment_KeyPressRightLeft_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyPressRightLeft_019, begin');
      session.reset();
      session.setCurrentIndex(6);
      const rightResult: FocusMoveResult = session.pressKey(KEY_RIGHT);
      expect(rightResult.toIndex).assertEqual(7);
      const leftResult: FocusMoveResult = session.pressKey(KEY_LEFT);
      expect(leftResult.toIndex).assertEqual(6);
      expect(session.getTrace().size()).assertEqual(2);
      expect(session.getTrace().movedCount()).assertEqual(2);
      expect(session.getTrace().asLine()).assertEqual('6>7,7>6');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyPressRightLeft_019, end');
    });

    /**
     * Scenario: press the up and the down key in sequence.
     * Expectation: the focus walks the first column of the operation card and returns.
     */
    it('Assessment_KeyPressUpDown_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyPressUpDown_020, begin');
      session.reset();
      session.setCurrentIndex(8);
      const downResult: FocusMoveResult = session.pressKey(KEY_DOWN);
      expect(downResult.toIndex).assertEqual(10);
      const upResult: FocusMoveResult = session.pressKey(KEY_UP);
      expect(upResult.toIndex).assertEqual(8);
      expect(session.getTrace().directionCount(FocusDirection.DOWN)).assertEqual(1);
      expect(session.getTrace().directionCount(FocusDirection.UP)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyPressUpDown_020, end');
    });

    /**
     * Scenario: press the enter key.
     * Expectation: Enter does not move the focus and does not create a trace entry, it is
     * consumed by the component that owns the focus.
     */
    it('Assessment_KeyPressEnterIgnored_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyPressEnterIgnored_021, begin');
      session.reset();
      session.setCurrentIndex(8);
      const traceBefore: number = session.getTrace().size();
      const result: FocusMoveResult = session.pressKey(KEY_ENTER);
      expect(result.direction).assertEqual(FocusDirection.NONE);
      expect(result.toIndex).assertEqual(8);
      expect(result.blocked).assertTrue();
      expect(session.getTrace().size()).assertEqual(traceBefore);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyPressEnterIgnored_021, end');
    });

    /**
     * Scenario: press an unknown key code.
     * Expectation: the key is ignored, the current index is preserved and the history does
     * not grow.
     */
    it('Assessment_KeyPressUnknownIgnored_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyPressUnknownIgnored_022, begin');
      session.reset();
      session.setCurrentIndex(10);
      const historyBefore: number = session.getHistory().size();
      const result: FocusMoveResult = session.pressKey(9999);
      expect(result.direction).assertEqual(FocusDirection.NONE);
      expect(result.toIndex).assertEqual(10);
      expect(result.moved).assertFalse();
      expect(session.getHistory().size()).assertEqual(historyBefore);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyPressUnknownIgnored_022, end');
    });

    /**
     * Scenario: Tab cycles forward.
     * Expectation: the focus visits every traversable node in DOM order and wraps from the
     * last one back to the first one.
     */
    it('Assessment_TabForwardCycle_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TabForwardCycle_023, begin');
      const localGraph: FocusGraph = buildEntryPageGraph();
      const localCycler: FocusCycler = new FocusCycler(localGraph);
      let index: number = 6;
      const visited: number[] = [];
      for (let i = 0; i < 5; i++) {
        index = localCycler.next(index, true);
        visited.push(index);
      }
      expect(visited[0]).assertEqual(7);
      expect(visited[1]).assertEqual(8);
      expect(visited[2]).assertEqual(10);
      expect(visited[3]).assertEqual(11);
      expect(visited[4]).assertEqual(6);
      expect(localCycler.getWrapCount()).assertEqual(1);
      expect(localCycler.getStepCount()).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TabForwardCycle_023, end');
    });

    /**
     * Scenario: Tab cycles backward.
     * Expectation: the first node wraps to the last traversable node and the walk descends
     * the DOM order.
     */
    it('Assessment_TabBackwardCycle_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TabBackwardCycle_024, begin');
      const localCycler: FocusCycler = new FocusCycler(buildEntryPageGraph());
      const first: number = localCycler.next(6, false);
      expect(first).assertEqual(11);
      expect(localCycler.getWrapCount()).assertEqual(1);
      const second: number = localCycler.next(first, false);
      expect(second).assertEqual(10);
      const third: number = localCycler.next(second, false);
      expect(third).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TabBackwardCycle_024, end');
    });

    /**
     * Scenario: Tab skips a disabled node.
     * Expectation: the walk from the begin button goes straight to the query state button
     * because the end button is disabled.
     */
    it('Assessment_TabSkipsDisabled_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TabSkipsDisabled_025, begin');
      const localCycler: FocusCycler = new FocusCycler(buildEntryPageGraph());
      const fromBegin: number = localCycler.next(8, true);
      expect(fromBegin).assertEqual(10);
      const fromBeginBack: number = localCycler.next(8, false);
      expect(fromBeginBack).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TabSkipsDisabled_025, end');
    });

    /**
     * Scenario: Tab skips an invisible node.
     * Expectation: hiding the query state button removes it from the cycle, the walk from the
     * begin button lands on the query configuration button.
     */
    it('Assessment_TabSkipsInvisible_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TabSkipsInvisible_026, begin');
      const localGraph: FocusGraph = buildEntryPageGraph();
      const hidden: FocusNode | null = localGraph.byId(ID_QUERY_STATE_BUTTON);
      expect(hidden !== null).assertTrue();
      if (hidden !== null) {
        hidden.setVisible(false);
        expect(hidden.isTraversable()).assertFalse();
      }
      const localCycler: FocusCycler = new FocusCycler(localGraph);
      expect(localCycler.next(8, true)).assertEqual(11);
      expect(localGraph.traversableIndices().length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TabSkipsInvisible_026, end');
    });

    /**
     * Scenario: every focusable node is disabled.
     * Expectation: the cycler cannot move and returns the current index unchanged, so an
     * empty traversal never produces a negative index.
     */
    it('Assessment_TabAllDisabledStays_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TabAllDisabledStays_027, begin');
      const localGraph: FocusGraph = buildEntryPageGraph();
      const nodes: FocusNode[] = localGraph.getNodes();
      for (let i = 0; i < nodes.length; i++) {
        nodes[i].setEnabled(false);
      }
      const localCycler: FocusCycler = new FocusCycler(localGraph);
      expect(localGraph.traversableIndices().length).assertEqual(0);
      expect(localCycler.next(6, true)).assertEqual(6);
      expect(localCycler.next(11, false)).assertEqual(11);
      expect(localCycler.getStepCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TabAllDisabledStays_027, end');
    });

    /**
     * Scenario: a full forward and backward Tab round.
     * Expectation: five forward steps from the input box return to the input box.
     */
    it('Assessment_TabRoundTrip_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TabRoundTrip_028, begin');
      const localCycler: FocusCycler = new FocusCycler(buildEntryPageGraph());
      let index: number = 6;
      for (let i = 0; i < 5; i++) {
        index = localCycler.next(index, true);
      }
      expect(index).assertEqual(6);
      for (let i = 0; i < 5; i++) {
        index = localCycler.next(index, false);
      }
      expect(index).assertEqual(6);
      expect(localCycler.getWrapCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TabRoundTrip_028, end');
    });

    /**
     * Scenario: press Tab through the session.
     * Expectation: the session advances the focus and records the tab key in the trace.
     */
    it('Assessment_SessionTabKey_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionTabKey_029, begin');
      session.reset();
      session.setCurrentIndex(6);
      const result: FocusMoveResult = session.pressKey(KEY_TAB);
      expect(result.key).assertEqual(KEY_TAB);
      expect(result.toIndex).assertEqual(7);
      expect(result.moved).assertTrue();
      const entry: FocusTraceEntry | null = session.getTrace().last();
      expect(entry !== null).assertTrue();
      if (entry !== null) {
        expect(entry.key).assertEqual(KEY_TAB);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionTabKey_029, end');
    });

    /**
     * Scenario: the focus history starts with the initial node.
     * Expectation: the input box is the first history entry and nothing sits below it.
     */
    it('Assessment_HistoryInitialState_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HistoryInitialState_030, begin');
      session.reset();
      expect(session.getHistory().size()).assertEqual(1);
      expect(session.getHistory().peek()).assertEqual(ID_BUNDLE_INPUT);
      expect(session.getHistory().previous()).assertEqual('');
      expect(session.getHistory().getCapacity()).assertEqual(HISTORY_CAPACITY);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HistoryInitialState_030, end');
    });

    /**
     * Scenario: the history suppresses a duplicated consecutive entry.
     * Expectation: a blocked move does not push the same id twice.
     */
    it('Assessment_HistoryDuplicateSuppressed_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HistoryDuplicateSuppressed_032, begin');
      const localHistory: FocusHistory = new FocusHistory();
      localHistory.push('a');
      localHistory.push('a');
      localHistory.push('a');
      expect(localHistory.size()).assertEqual(1);
      localHistory.push('b');
      localHistory.push('a');
      expect(localHistory.size()).assertEqual(3);
      localHistory.push('');
      expect(localHistory.size()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HistoryDuplicateSuppressed_032, end');
    });

    /**
     * Scenario: the history respects its capacity.
     * Expectation: the oldest entry is evicted when the capacity is exceeded, the size never
     * grows beyond the capacity.
     */
    it('Assessment_HistoryCapacityEviction_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HistoryCapacityEviction_033, begin');
      const localHistory: FocusHistory = new FocusHistory(3);
      localHistory.push('a');
      localHistory.push('b');
      localHistory.push('c');
      localHistory.push('d');
      expect(localHistory.size()).assertEqual(3);
      expect(localHistory.contains('a')).assertFalse();
      expect(localHistory.contains('d')).assertTrue();
      expect(localHistory.toArray()[0]).assertEqual('b');
      expect(localHistory.peek()).assertEqual('d');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HistoryCapacityEviction_033, end');
    });

    /**
     * Scenario: popping the history.
     * Expectation: the most recent entry is returned first and an empty history answers with
     * an empty string instead of an undefined value.
     */
    it('Assessment_HistoryPopOrder_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HistoryPopOrder_034, begin');
      const localHistory: FocusHistory = new FocusHistory();
      localHistory.push('a');
      localHistory.push('b');
      expect(localHistory.pop()).assertEqual('b');
      expect(localHistory.pop()).assertEqual('a');
      expect(localHistory.pop()).assertEqual('');
      expect(localHistory.size()).assertEqual(0);
      expect(localHistory.peek()).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HistoryPopOrder_034, end');
    });

    /**
     * Scenario: clear the history.
     * Expectation: clearing drops every entry, the following walk starts from scratch.
     */
    it('Assessment_HistoryClear_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HistoryClear_035, begin');
      const localHistory: FocusHistory = new FocusHistory();
      localHistory.push('a');
      localHistory.push('b');
      expect(localHistory.size()).assertEqual(2);
      localHistory.clear();
      expect(localHistory.size()).assertEqual(0);
      expect(localHistory.contains('a')).assertFalse();
      localHistory.push('c');
      expect(localHistory.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HistoryClear_035, end');
    });

    /**
     * Scenario: capture the focus snapshot of the entry page.
     * Expectation: the snapshot mirrors the graph size and remembers the active identifier.
     */
    it('Assessment_SnapshotCapture_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SnapshotCapture_036, begin');
      const snapshot: FocusSnapshot = FocusSnapshot.capture(graph, 8);
      expect(snapshot.size()).assertEqual(graph.size());
      expect(snapshot.getActiveId()).assertEqual(ID_BEGIN_BUTTON);
      expect(snapshot.getActiveIndex()).assertEqual(8);
      expect(snapshot.hasId(ID_QUERY_CONFIG_BUTTON)).assertTrue();
      expect(snapshot.hasId('assessment_unknown')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SnapshotCapture_036, end');
    });

    /**
     * Scenario: restore the focus after a re-render.
     * Expectation: the same identifier is found in the rebuilt graph, no fallback is used.
     */
    it('Assessment_RestoreById_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RestoreById_037, begin');
      const snapshot: FocusSnapshot = FocusSnapshot.capture(graph, 10);
      const rebuilt: FocusGraph = buildEntryPageGraph();
      const result: FocusRestoreResult = snapshot.restore(rebuilt);
      expect(result.index).assertEqual(10);
      expect(result.restoredById).assertTrue();
      expect(result.fallbackUsed).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RestoreById_037, end');
    });

    /**
     * Scenario: the snapshot does not hold an active node at all.
     * Expectation: the restore returns the first traversable index of the new graph.
     */
    it('Assessment_RestoreWithoutActive_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RestoreWithoutActive_039, begin');
      const snapshot: FocusSnapshot = FocusSnapshot.capture(graph, -1);
      expect(snapshot.getActiveId()).assertEqual('');
      expect(snapshot.getActiveIndex()).assertEqual(-1);
      const rebuilt: FocusGraph = buildEntryPageGraph();
      const result: FocusRestoreResult = snapshot.restore(rebuilt);
      expect(result.restoredById).assertFalse();
      expect(result.fallbackUsed).assertTrue();
      expect(result.index).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RestoreWithoutActive_039, end');
    });

    /**
     * Scenario: the trace separates moved from blocked attempts.
     * Expectation: a clamped move is recorded as blocked and the counters add up to the size.
     */
    it('Assessment_TraceBlockedCount_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TraceBlockedCount_041, begin');
      session.reset();
      session.setCurrentIndex(6);
      session.move(FocusDirection.UP);
      session.move(FocusDirection.RIGHT);
      session.move(FocusDirection.UP);
      const trace: FocusTrace = session.getTrace();
      expect(trace.size()).assertEqual(3);
      expect(trace.movedCount()).assertEqual(1);
      expect(trace.blockedCount()).assertEqual(2);
      expect(trace.movedCount() + trace.blockedCount()).assertEqual(trace.size());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TraceBlockedCount_041, end');
    });

    /**
     * Scenario: direction specific statistics of the trace.
     * Expectation: the count per direction matches the pressed keys and an unused direction
     * answers with zero.
     */
    it('Assessment_TraceDirectionCount_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TraceDirectionCount_042, begin');
      session.reset();
      session.setCurrentIndex(6);
      session.pressKey(KEY_DOWN);
      session.pressKey(KEY_DOWN);
      session.pressKey(KEY_UP);
      const trace: FocusTrace = session.getTrace();
      expect(trace.directionCount(FocusDirection.DOWN)).assertEqual(2);
      expect(trace.directionCount(FocusDirection.UP)).assertEqual(1);
      expect(trace.directionCount(FocusDirection.LEFT)).assertEqual(0);
      expect(trace.directionCount(FocusDirection.RIGHT)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TraceDirectionCount_042, end');
    });

    /**
     * Scenario: visited indices are de-duplicated.
     * Expectation: a bounce between two nodes keeps the visited list at two entries.
     */
    it('Assessment_TraceVisitedDedupe_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TraceVisitedDedupe_044, begin');
      session.reset();
      session.setCurrentIndex(6);
      for (let i = 0; i < 4; i++) {
        session.move(FocusDirection.RIGHT);
        session.move(FocusDirection.LEFT);
      }
      const trace: FocusTrace = session.getTrace();
      expect(trace.size()).assertEqual(8);
      expect(trace.visitedIndices().length).assertEqual(2);
      expect(trace.movedCount()).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TraceVisitedDedupe_044, end');
    });

    /**
     * Scenario: the session can focus a node by identifier.
     * Expectation: an existing traversable id is accepted, a disabled or unknown id is not.
     */
    it('Assessment_FocusById_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusById_045, begin');
      session.reset();
      expect(session.focusById(ID_QUERY_CONFIG_BUTTON)).assertTrue();
      expect(session.getCurrentIndex()).assertEqual(11);
      expect(session.focusById(ID_END_BUTTON)).assertFalse();
      expect(session.getCurrentIndex()).assertEqual(11);
      expect(session.focusById('assessment_unknown')).assertFalse();
      expect(session.getCurrentIndex()).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusById_045, end');
    });
