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
  ID_EXAM_TITLE,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  KEY_TAB,
  TIMEOUT_PAGE_TRANSITION,
  TIMEOUT_FOCUS_CHANGE,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  waitForIndexPage,
  isComponentEnabled,
  pressAndWait
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Focus geometry constants. The page cards are laid out in a single column, so a vertical
// move changes the row and a horizontal move changes the column.
const ROW_PITCH_VP: number = 108;
const COLUMN_PITCH_VP: number = 180;
const CARD_WIDTH_VP: number = 160;
const CARD_HEIGHT_VP: number = 96;
const PAGE_PADDING_VP: number = 16;

// Dijkstra style guards, they keep the arithmetic inside the safe integer range.
const MAX_INDEX: number = 1024;
const NO_TARGET: number = -1;

/**
 * Direction of a focus move.
 */
enum FocusDirection {
  LEFT = 'left',
  RIGHT = 'right',
  UP = 'up',
  DOWN = 'down',
  NONE = 'none'
}

/**
 * Strategy used when a directional move would leave the focus graph.
 */
enum WrapMode {
  CLAMP = 'clamp',
  WRAP = 'wrap',
  REFUSE = 'refuse'
}

/**
 * Geometry of one focusable node.
 */
interface FocusNode {
  index: number;
  row: number;
  column: number;
  left: number;
  top: number;
  width: number;
  height: number;
  enabled: boolean;
}

/**
 * One recorded focus change.
 */
interface FocusRecord {
  index: number;
  previousIndex: number;
  direction: FocusDirection;
  keyCode: number;
  timestamp: number;
}

/**
 * Result of a directional move.
 */
interface MoveResult {
  accepted: boolean;
  targetIndex: number;
  wrapped: boolean;
  direction: FocusDirection;
}

/**
 * Focus distance used to break ties between candidates.
 */
interface FocusDistance {
  candidate: number;
  primary: number;
  secondary: number;
}

/**
 * Focus geometry helper.
 *
 * All coordinates are in vp. The helper only knows rectangles, it never touches a real
 * component so that the arithmetic stays deterministic across devices.
 */
class FocusGeometry {
  public static centerX(node: FocusNode): number {
    return node.left + node.width / 2;
  }

  public static centerY(node: FocusNode): number {
    return node.top + node.height / 2;
  }

  public static right(node: FocusNode): number {
    return node.left + node.width;
  }

  public static bottom(node: FocusNode): number {
    return node.top + node.height;
  }

  public static overlapsVertically(left: FocusNode, right: FocusNode): boolean {
    return FocusGeometry.top(left) < FocusGeometry.bottom(right) &&
      FocusGeometry.top(right) < FocusGeometry.bottom(left);
  }

  public static top(node: FocusNode): number {
    return node.top;
  }

  public static overlapsHorizontally(left: FocusNode, right: FocusNode): boolean {
    return left.left < FocusGeometry.right(right) && right.left < FocusGeometry.right(left);
  }

  public static isRightOf(candidate: FocusNode, origin: FocusNode): boolean {
    return candidate.left >= FocusGeometry.right(origin) - 1;
  }

  public static isLeftOf(candidate: FocusNode, origin: FocusNode): boolean {
    return FocusGeometry.right(candidate) <= origin.left + 1;
  }

  public static isBelow(candidate: FocusNode, origin: FocusNode): boolean {
    return candidate.top >= FocusGeometry.bottom(origin) - 1;
  }

  public static isAbove(candidate: FocusNode, origin: FocusNode): boolean {
    return FocusGeometry.bottom(candidate) <= origin.top + 1;
  }

  public static verticalDistance(candidate: FocusNode, origin: FocusNode): number {
    return Math.abs(FocusGeometry.centerY(candidate) - FocusGeometry.centerY(origin));
  }

  public static horizontalDistance(candidate: FocusNode, origin: FocusNode): number {
    return Math.abs(FocusGeometry.centerX(candidate) - FocusGeometry.centerX(origin));
  }

  public static distance(candidate: FocusNode, origin: FocusNode): number {
    const dx: number = FocusGeometry.centerX(candidate) - FocusGeometry.centerX(origin);
    const dy: number = FocusGeometry.centerY(candidate) - FocusGeometry.centerY(origin);
    return Math.sqrt(dx * dx + dy * dy);
  }

  public static isRowAligned(left: FocusNode, right: FocusNode): boolean {
    return left.row === right.row;
  }

  public static isColumnAligned(left: FocusNode, right: FocusNode): boolean {
    return left.column === right.column;
  }
}

/**
 * Builds a focus graph of the entry page cards.
 *
 * The node list is generated from the row and column counts, every node gets a rectangle
 * derived from the row and column pitch so that the directional arithmetic is testable.
 */
class FocusGraphBuilder {
  public static buildSingleColumn(count: number): FocusNode[] {
    const nodes: FocusNode[] = [];
    for (let i = 0; i < count; i++) {
      nodes.push({
        index: i,
        row: i,
        column: 0,
        left: PAGE_PADDING_VP,
        top: PAGE_PADDING_VP + i * ROW_PITCH_VP,
        width: CARD_WIDTH_VP,
        height: CARD_HEIGHT_VP,
        enabled: true
      });
    }
    return nodes;
  }

  public static buildGrid(rows: number, columns: number): FocusNode[] {
    const nodes: FocusNode[] = [];
    let index: number = 0;
    for (let r = 0; r < rows; r++) {
      for (let c = 0; c < columns; c++) {
        nodes.push({
          index: index,
          row: r,
          column: c,
          left: PAGE_PADDING_VP + c * COLUMN_PITCH_VP,
          top: PAGE_PADDING_VP + r * ROW_PITCH_VP,
          width: CARD_WIDTH_VP,
          height: CARD_HEIGHT_VP,
          enabled: true
        });
        index++;
      }
    }
    return nodes;
  }

  public static buildRow(count: number): FocusNode[] {
    const nodes: FocusNode[] = [];
    for (let i = 0; i < count; i++) {
      nodes.push({
        index: i,
        row: 0,
        column: i,
        left: PAGE_PADDING_VP + i * COLUMN_PITCH_VP,
        top: PAGE_PADDING_VP,
        width: CARD_WIDTH_VP,
        height: CARD_HEIGHT_VP,
        enabled: true
      });
    }
    return nodes;
  }

  // A disabled node must stay disabled, the builder only adds a new disabled index to the
  // set that is already disabled.
  public static buildDisabled(nodes: FocusNode[], disabledIndex: number): FocusNode[] {
    const copy: FocusNode[] = [];
    for (let i = 0; i < nodes.length; i++) {
      const node: FocusNode = nodes[i];
      copy.push({
        index: node.index,
        row: node.row,
        column: node.column,
        left: node.left,
        top: node.top,
        width: node.width,
        height: node.height,
        enabled: node.enabled && node.index !== disabledIndex
      });
    }
    return copy;
  }
}

/**
 * Navigator over a focus graph.
 *
 * A directional move selects the nearest enabled node in the requested half plane. Ties are
 * broken by the perpendicular distance so that the result does not depend on the list order.
 */
class FocusNavigator {
  private nodes: FocusNode[];
  private wrapMode: WrapMode;

  public constructor(nodes: FocusNode[], wrapMode: WrapMode = WrapMode.CLAMP) {
    this.nodes = nodes;
    this.wrapMode = wrapMode;
  }

  public getNodes(): FocusNode[] {
    return this.nodes.slice();
  }

  public count(): number {
    return this.nodes.length;
  }

  public getWrapMode(): WrapMode {
    return this.wrapMode;
  }

  public setWrapMode(mode: WrapMode): void {
    this.wrapMode = mode;
  }

  public nodeAt(index: number): FocusNode | null {
    if (index < 0 || index >= this.nodes.length) {
      return null;
    }
    return this.nodes[index];
  }

  public firstEnabled(): number {
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].enabled) {
        return this.nodes[i].index;
      }
    }
    return NO_TARGET;
  }

  public lastEnabled(): number {
    for (let i = this.nodes.length - 1; i >= 0; i--) {
      if (this.nodes[i].enabled) {
        return this.nodes[i].index;
      }
    }
    return NO_TARGET;
  }

  // Selects the nearest enabled node in the requested direction, the distance is measured
  // between the node centres.
  public findCandidate(from: number, direction: FocusDirection): number {
    const origin: FocusNode | null = this.nodeAt(from);
    if (origin === null) {
      return NO_TARGET;
    }
    let best: number = NO_TARGET;
    let bestDistance: FocusDistance | null = null;
    for (let i = 0; i < this.nodes.length; i++) {
      const candidate: FocusNode = this.nodes[i];
      if (candidate.index === origin.index || !candidate.enabled) {
        continue;
      }
      if (!this.isInDirection(candidate, origin, direction)) {
        continue;
      }
      const distance: FocusDistance = this.measure(candidate, origin, direction);
      if (bestDistance === null || this.isCloser(distance, bestDistance)) {
        bestDistance = distance;
        best = candidate.index;
      }
    }
    return best;
  }

  // A candidate only counts when it lies in the requested half plane of the origin. The
  // nearest candidate of that half plane then wins, which reproduces the nearest neighbour
  // rule the pages rely on.
  private isInDirection(candidate: FocusNode, origin: FocusNode, direction: FocusDirection): boolean {
    if (direction === FocusDirection.RIGHT) {
      return FocusGeometry.isRightOf(candidate, origin);
    }
    if (direction === FocusDirection.LEFT) {
      return FocusGeometry.isLeftOf(candidate, origin);
    }
    if (direction === FocusDirection.DOWN) {
      return FocusGeometry.isBelow(candidate, origin);
    }
    if (direction === FocusDirection.UP) {
      return FocusGeometry.isAbove(candidate, origin);
    }
    return false;
  }

  private measure(candidate: FocusNode, origin: FocusNode, direction: FocusDirection): FocusDistance {
    const isVertical: boolean = direction === FocusDirection.UP || direction === FocusDirection.DOWN;
    const primary: number = isVertical ?
      FocusGeometry.verticalDistance(candidate, origin) : FocusGeometry.horizontalDistance(candidate, origin);
    const secondary: number = isVertical ?
      FocusGeometry.horizontalDistance(candidate, origin) : FocusGeometry.verticalDistance(candidate, origin);
    const distance: FocusDistance = {
      candidate: candidate.index,
      primary: primary,
      secondary: secondary
    };
    return distance;
  }

  private isCloser(candidate: FocusDistance, current: FocusDistance): boolean {
    if (candidate.primary < current.primary) {
      return true;
    }
    if (candidate.primary > current.primary) {
      return false;
    }
    return candidate.secondary < current.secondary;
  }

  // Resolves a directional move including the wrap policy of the navigator.
  public move(from: number, direction: FocusDirection): MoveResult {
    if (direction === FocusDirection.NONE) {
      return this.refused(from, direction);
    }
    const candidate: number = this.findCandidate(from, direction);
    if (candidate !== NO_TARGET) {
      const direct: MoveResult = {
        accepted: true,
        targetIndex: candidate,
        wrapped: false,
        direction: direction
      };
      return direct;
    }
    if (this.wrapMode === WrapMode.REFUSE) {
      return this.refused(from, direction);
    }
    if (this.wrapMode === WrapMode.CLAMP) {
      return this.refused(from, direction);
    }
    const wrapped: number = this.wrapTarget(from, direction);
    if (wrapped === NO_TARGET) {
      return this.refused(from, direction);
    }
    const result: MoveResult = {
      accepted: true,
      targetIndex: wrapped,
      wrapped: true,
      direction: direction
    };
    return result;
  }

  private refused(from: number, direction: FocusDirection): MoveResult {
    const result: MoveResult = {
      accepted: false,
      targetIndex: from,
      wrapped: false,
      direction: direction
    };
    return result;
  }

  // Wrapping walks the graph in reading order, right and down continue with the first node
  // and left and up continue with the last node.
  private wrapTarget(from: number, direction: FocusDirection): number {
    if (direction === FocusDirection.RIGHT || direction === FocusDirection.DOWN) {
      const first: number = this.firstEnabled();
      return first === from ? NO_TARGET : first;
    }
    if (direction === FocusDirection.LEFT || direction === FocusDirection.UP) {
      const last: number = this.lastEnabled();
      return last === from ? NO_TARGET : last;
    }
    return NO_TARGET;
  }

  // The clamped target is the edge node of the graph, it is used by the clamp policy of the
  // exam page where a move never leaves the paper.
  public clampTarget(direction: FocusDirection): number {
    if (direction === FocusDirection.RIGHT || direction === FocusDirection.DOWN) {
      return this.lastEnabled();
    }
    if (direction === FocusDirection.LEFT || direction === FocusDirection.UP) {
      return this.firstEnabled();
    }
    return NO_TARGET;
  }

  public hasDirectionalNeighbour(from: number, direction: FocusDirection): boolean {
    return this.findCandidate(from, direction) !== NO_TARGET;
  }
}

/**
 * Focus history of the entry page.
 *
 * The history keeps the last accepted focus target so that the page can restore the focus
 * after a card is rebuilt.
 */
class FocusHistory {
  private records: FocusRecord[] = [];
  private capacity: number;

  public constructor(capacity: number = 32) {
    this.capacity = capacity > 0 ? capacity : 32;
  }

  // Appends a record and enforces the capacity, older records are dropped from the head.
  public record(record: FocusRecord): void {
    this.records.push(record);
    while (this.records.length > this.capacity) {
      this.records.shift();
    }
  }

  public size(): number {
    return this.records.length;
  }

  public capacityLimit(): number {
    return this.capacity;
  }

  public getAll(): FocusRecord[] {
    return this.records.slice();
  }

  public at(index: number): FocusRecord | null {
    if (index < 0 || index >= this.records.length) {
      return null;
    }
    return this.records[index];
  }

  public latest(): FocusRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[this.records.length - 1];
  }

  public lastIndex(): number {
    const latest: FocusRecord | null = this.latest();
    if (latest === null) {
      return NO_TARGET;
    }
    return latest.index;
  }

  public indexBefore(n: number): number {
    const position: number = this.records.length - 1 - n;
    if (position < 0 || position >= this.records.length) {
      return NO_TARGET;
    }
    return this.records[position].index;
  }

  public countOfDirection(direction: FocusDirection): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].direction === direction) {
        count++;
      }
    }
    return count;
  }

  public clear(): void {
    this.records = [];
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].timestamp < this.records[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }
}

/**
 * Maps a key code to a focus direction.
 */
class KeyDirectionMapper {
  public static directionOf(keyCode: number): FocusDirection {
    if (keyCode === KEY_LEFT) {
      return FocusDirection.LEFT;
    }
    if (keyCode === KEY_RIGHT) {
      return FocusDirection.RIGHT;
    }
    if (keyCode === KEY_UP) {
      return FocusDirection.UP;
    }
    if (keyCode === KEY_DOWN) {
      return FocusDirection.DOWN;
    }
    return FocusDirection.NONE;
  }

  public static isMoveKey(keyCode: number): boolean {
    return KeyDirectionMapper.directionOf(keyCode) !== FocusDirection.NONE;
  }

  public static isConfirmKey(keyCode: number): boolean {
    return keyCode === KEY_ENTER;
  }

  public static isBackKey(keyCode: number): boolean {
    return keyCode === KEY_BACK;
  }

  public static isTraversalKey(keyCode: number): boolean {
    return keyCode === KEY_TAB;
  }

  public static isNoOpKey(keyCode: number): boolean {
    return !KeyDirectionMapper.isMoveKey(keyCode) && !KeyDirectionMapper.isConfirmKey(keyCode) &&
      !KeyDirectionMapper.isBackKey(keyCode) && !KeyDirectionMapper.isTraversalKey(keyCode);
  }

  public static codeOf(direction: FocusDirection): number {
    if (direction === FocusDirection.LEFT) {
      return KEY_LEFT;
    }
    if (direction === FocusDirection.RIGHT) {
      return KEY_RIGHT;
    }
    if (direction === FocusDirection.UP) {
      return KEY_UP;
    }
    if (direction === FocusDirection.DOWN) {
      return KEY_DOWN;
    }
    return 0;
  }

  public static nameOf(direction: FocusDirection): string {
    if (direction === FocusDirection.LEFT) {
      return 'LEFT';
    }
    if (direction === FocusDirection.RIGHT) {
      return 'RIGHT';
    }
    if (direction === FocusDirection.UP) {
      return 'UP';
    }
    if (direction === FocusDirection.DOWN) {
      return 'DOWN';
    }
    return 'NONE';
  }
}

/**
 * Focus controller of a page.
 *
 * The controller wraps the navigator and the history, it is the unit that the pages of the
 * sample would own if the focus graph were explicit.
 */
class FocusManager {
  private navigator: FocusNavigator;
  private history: FocusHistory;
  private currentIndex: number;

  public constructor(nodes: FocusNode[], wrapMode: WrapMode = WrapMode.CLAMP, historyCapacity: number = 32) {
    this.navigator = new FocusNavigator(nodes, wrapMode);
    this.history = new FocusHistory(historyCapacity);
    this.currentIndex = this.navigator.firstEnabled();
  }

  public getCurrentIndex(): number {
    return this.currentIndex;
  }

  public getHistory(): FocusHistory {
    return this.history;
  }

  public getNavigator(): FocusNavigator {
    return this.navigator;
  }

  public hasFocus(): boolean {
    return this.currentIndex !== NO_TARGET;
  }

  public requestFocus(index: number, direction: FocusDirection = FocusDirection.NONE): boolean {
    const node: FocusNode | null = this.navigator.nodeAt(index);
    if (node === null || !node.enabled) {
      return false;
    }
    if (index === this.currentIndex) {
      return false;
    }
    this.commit(index, direction, 0);
    return true;
  }

  private commit(index: number, direction: FocusDirection, keyCode: number): void {
    const record: FocusRecord = {
      index: index,
      previousIndex: this.currentIndex,
      direction: direction,
      keyCode: keyCode,
      timestamp: Date.now()
    };
    this.history.record(record);
    this.currentIndex = index;
  }

  public handleKey(keyCode: number): MoveResult {
    const direction: FocusDirection = KeyDirectionMapper.directionOf(keyCode);
    if (direction === FocusDirection.NONE) {
      const refused: MoveResult = {
        accepted: false,
        targetIndex: this.currentIndex,
        wrapped: false,
        direction: FocusDirection.NONE
      };
      return refused;
    }
    const result: MoveResult = this.navigator.move(this.currentIndex, direction);
    if (result.accepted) {
      this.commit(result.targetIndex, result.direction, keyCode);
    }
    return result;
  }

  public move(direction: FocusDirection): MoveResult {
    return this.handleKey(KeyDirectionMapper.codeOf(direction));
  }

  // Restores the focus target that was active before the last accepted move. The target is
  // only restored when the node still exists and is still enabled.
  public restore(): boolean {
    const latest: FocusRecord | null = this.history.latest();
    if (latest === null) {
      return false;
    }
    const index: number = latest.previousIndex;
    if (index === NO_TARGET || index === this.currentIndex) {
      return false;
    }
    const node: FocusNode | null = this.navigator.nodeAt(index);
    if (node === null || !node.enabled) {
      return false;
    }
    this.commit(index, FocusDirection.NONE, 0);
    return true;
  }

  public reset(): void {
    this.history.clear();
    this.currentIndex = this.navigator.firstEnabled();
  }

  public moveCount(): number {
    return this.history.size();
  }

  public isAtEdge(direction: FocusDirection): boolean {
    return !this.navigator.hasDirectionalNeighbour(this.currentIndex, direction);
  }
}

/**
 * Statistics over a focus history.
 */
class FocusStatistics {
  private records: FocusRecord[];

  public constructor(records: FocusRecord[]) {
    this.records = records;
  }

  public total(): number {
    return this.records.length;
  }

  public countOf(direction: FocusDirection): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].direction === direction) {
        count++;
      }
    }
    return count;
  }

  public horizontalMoves(): number {
    return this.countOf(FocusDirection.LEFT) + this.countOf(FocusDirection.RIGHT);
  }

  public verticalMoves(): number {
    return this.countOf(FocusDirection.UP) + this.countOf(FocusDirection.DOWN);
  }

  public distinctTargets(): number {
    const seen: number[] = [];
    for (let i = 0; i < this.records.length; i++) {
      if (seen.indexOf(this.records[i].index) < 0) {
        seen.push(this.records[i].index);
      }
    }
    return seen.length;
  }

  public averageInterval(): number {
    if (this.records.length < 2) {
      return 0;
    }
    let sum: number = 0;
    for (let i = 1; i < this.records.length; i++) {
      sum += this.records[i].timestamp - this.records[i - 1].timestamp;
    }
    return sum / (this.records.length - 1);
  }

  public mostFrequentTarget(): number {
    if (this.records.length === 0) {
      return NO_TARGET;
    }
    let bestIndex: number = NO_TARGET;
    let bestCount: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      let count: number = 0;
      for (let j = 0; j < this.records.length; j++) {
        if (this.records[j].index === this.records[i].index) {
          count++;
        }
      }
      if (count > bestCount) {
        bestCount = count;
        bestIndex = this.records[i].index;
      }
    }
    return bestIndex;
  }
}

export default function focusManagerValidationTest() {
  describe('FocusManagerValidation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_TRANSITION);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the geometry helper of a single node.
     * Expectation: centre, right and bottom are derived from the rectangle.
     */
    it('Assessment_FocusGeometryBasics_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGeometryBasics_001, begin');
      const node: FocusNode = FocusGraphBuilder.buildSingleColumn(1)[0];
      expect(FocusGeometry.centerX(node)).assertEqual(PAGE_PADDING_VP + CARD_WIDTH_VP / 2);
      expect(FocusGeometry.centerY(node)).assertEqual(PAGE_PADDING_VP + CARD_HEIGHT_VP / 2);
      expect(FocusGeometry.right(node)).assertEqual(PAGE_PADDING_VP + CARD_WIDTH_VP);
      expect(FocusGeometry.bottom(node)).assertEqual(PAGE_PADDING_VP + CARD_HEIGHT_VP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGeometryBasics_001, end');
    });

    /**
     * Scenario: vertical overlap of two cards in the same column.
     * Expectation: stacked cards do not overlap vertically and their centres differ.
     */
    it('Assessment_FocusGeometryVerticalOverlap_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGeometryVerticalOverlap_002, begin');
      const nodes: FocusNode[] = FocusGraphBuilder.buildSingleColumn(3);
      expect(FocusGeometry.overlapsVertically(nodes[0], nodes[1])).assertFalse();
      expect(FocusGeometry.overlapsHorizontally(nodes[0], nodes[1])).assertTrue();
      expect(FocusGeometry.verticalDistance(nodes[0], nodes[1])).assertEqual(ROW_PITCH_VP);
      expect(FocusGeometry.verticalDistance(nodes[0], nodes[2])).assertEqual(ROW_PITCH_VP * 2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGeometryVerticalOverlap_002, end');
    });

    /**
     * Scenario: horizontal overlap of two cards in the same row.
     * Expectation: side by side cards do not overlap horizontally and their centres differ.
     */
    it('Assessment_FocusGeometryHorizontalOverlap_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGeometryHorizontalOverlap_003, begin');
      const nodes: FocusNode[] = FocusGraphBuilder.buildRow(3);
      expect(FocusGeometry.overlapsHorizontally(nodes[0], nodes[1])).assertFalse();
      expect(FocusGeometry.overlapsVertically(nodes[0], nodes[1])).assertTrue();
      expect(FocusGeometry.horizontalDistance(nodes[0], nodes[1])).assertEqual(COLUMN_PITCH_VP);
      expect(FocusGeometry.horizontalDistance(nodes[0], nodes[2])).assertEqual(COLUMN_PITCH_VP * 2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGeometryHorizontalOverlap_003, end');
    });

    /**
     * Scenario: the half plane predicates of the geometry helper.
     * Expectation: each predicate only accepts the documented side.
     */
    it('Assessment_FocusGeometryHalfPlanes_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGeometryHalfPlanes_004, begin');
      const nodes: FocusNode[] = FocusGraphBuilder.buildRow(2);
      const left: FocusNode = nodes[0];
      const right: FocusNode = nodes[1];
      expect(FocusGeometry.isRightOf(right, left)).assertTrue();
      expect(FocusGeometry.isRightOf(left, right)).assertFalse();
      expect(FocusGeometry.isLeftOf(left, right)).assertTrue();
      expect(FocusGeometry.isLeftOf(right, left)).assertFalse();
      expect(FocusGeometry.isAbove(left, right)).assertFalse();
      expect(FocusGeometry.isBelow(left, right)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGeometryHalfPlanes_004, end');
    });

    /**
     * Scenario: the row and column alignment helpers.
     * Expectation: nodes of the same row and the same column are recognized.
     */
    it('Assessment_FocusGeometryAlignment_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGeometryAlignment_005, begin');
      const grid: FocusNode[] = FocusGraphBuilder.buildGrid(3, 3);
      expect(FocusGeometry.isRowAligned(grid[0], grid[1])).assertTrue();
      expect(FocusGeometry.isRowAligned(grid[0], grid[3])).assertFalse();
      expect(FocusGeometry.isColumnAligned(grid[0], grid[3])).assertTrue();
      expect(FocusGeometry.isColumnAligned(grid[0], grid[1])).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGeometryAlignment_005, end');
    });

    /**
     * Scenario: the Euclidean distance between two card centres.
     * Expectation: the distance follows the pitch of the grid.
     */
    it('Assessment_FocusGeometryDistance_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGeometryDistance_006, begin');
      const grid: FocusNode[] = FocusGraphBuilder.buildGrid(2, 2);
      const horizontal: number = FocusGeometry.distance(grid[0], grid[1]);
      const vertical: number = FocusGeometry.distance(grid[0], grid[2]);
      const diagonal: number = FocusGeometry.distance(grid[0], grid[3]);
      expect(horizontal).assertEqual(COLUMN_PITCH_VP);
      expect(vertical).assertEqual(ROW_PITCH_VP);
      expect(diagonal > horizontal).assertTrue();
      expect(diagonal > vertical).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGeometryDistance_006, end');
    });

    /**
     * Scenario: the grid builder of the focus graph.
     * Expectation: indices follow the reading order and the grid dimensions are exact.
     */
    it('Assessment_FocusGraphGrid_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGraphGrid_008, begin');
      const grid: FocusNode[] = FocusGraphBuilder.buildGrid(2, 3);
      expect(grid.length).assertEqual(6);
      expect(grid[0].row).assertEqual(0);
      expect(grid[0].column).assertEqual(0);
      expect(grid[2].row).assertEqual(0);
      expect(grid[2].column).assertEqual(2);
      expect(grid[3].row).assertEqual(1);
      expect(grid[3].column).assertEqual(0);
      expect(grid[5].row).assertEqual(1);
      expect(grid[5].column).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGraphGrid_008, end');
    });

    /**
     * Scenario: the disabled node builder.
     * Expectation: exactly one node is disabled and every other node is untouched.
     */
    it('Assessment_FocusGraphDisabled_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGraphDisabled_009, begin');
      const nodes: FocusNode[] = FocusGraphBuilder.buildSingleColumn(3);
      const disabled: FocusNode[] = FocusGraphBuilder.buildDisabled(nodes, 1);
      expect(disabled[0].enabled).assertTrue();
      expect(disabled[1].enabled).assertFalse();
      expect(disabled[2].enabled).assertTrue();
      expect(nodes[1].enabled).assertTrue();
      expect(disabled.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGraphDisabled_009, end');
    });

    /**
     * Scenario: a navigator over an empty graph.
     * Expectation: every lookup answers the sentinel and no move is accepted.
     */
    it('Assessment_FocusNavigatorEmpty_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorEmpty_010, begin');
      const navigator: FocusNavigator = new FocusNavigator([]);
      expect(navigator.count()).assertEqual(0);
      expect(navigator.nodeAt(0) === null).assertTrue();
      expect(navigator.firstEnabled()).assertEqual(NO_TARGET);
      expect(navigator.lastEnabled()).assertEqual(NO_TARGET);
      expect(navigator.findCandidate(0, FocusDirection.RIGHT)).assertEqual(NO_TARGET);
      expect(navigator.move(0, FocusDirection.RIGHT).accepted).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorEmpty_010, end');
    });

    /**
     * Scenario: the first and last enabled node of a full graph.
     * Expectation: they are the graph edges.
     */
    it('Assessment_FocusNavigatorBoundaries_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorBoundaries_011, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildSingleColumn(5));
      expect(navigator.firstEnabled()).assertEqual(0);
      expect(navigator.lastEnabled()).assertEqual(4);
      expect(navigator.count()).assertEqual(5);
      expect(navigator.getWrapMode()).assertEqual(WrapMode.CLAMP);
      navigator.setWrapMode(WrapMode.WRAP);
      expect(navigator.getWrapMode()).assertEqual(WrapMode.WRAP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorBoundaries_011, end');
    });

    /**
     * Scenario: the boundary search skips disabled nodes.
     * Expectation: a disabled edge never becomes the first or last target.
     */
    it('Assessment_FocusNavigatorSkipsDisabled_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorSkipsDisabled_012, begin');
      const nodes: FocusNode[] = FocusGraphBuilder.buildDisabled(FocusGraphBuilder.buildSingleColumn(4), 0);
      const navigator: FocusNavigator = new FocusNavigator(nodes);
      expect(navigator.firstEnabled()).assertEqual(1);
      expect(navigator.lastEnabled()).assertEqual(3);
      const lastDisabled: FocusNode[] =
        FocusGraphBuilder.buildDisabled(FocusGraphBuilder.buildSingleColumn(4), 3);
      const other: FocusNavigator = new FocusNavigator(lastDisabled);
      expect(other.lastEnabled()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorSkipsDisabled_012, end');
    });

    /**
     * Scenario: a down move in a single column layout.
     * Expectation: the next row is selected and the target is adjacent.
     */
    it('Assessment_FocusNavigatorMoveDown_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorMoveDown_013, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildSingleColumn(4));
      expect(navigator.findCandidate(0, FocusDirection.DOWN)).assertEqual(1);
      expect(navigator.findCandidate(1, FocusDirection.DOWN)).assertEqual(2);
      expect(navigator.findCandidate(2, FocusDirection.DOWN)).assertEqual(3);
      const move: MoveResult = navigator.move(0, FocusDirection.DOWN);
      expect(move.accepted).assertTrue();
      expect(move.targetIndex).assertEqual(1);
      expect(move.wrapped).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorMoveDown_013, end');
    });

    /**
     * Scenario: an up move in a single column layout.
     * Expectation: the previous row is selected.
     */
    it('Assessment_FocusNavigatorMoveUp_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorMoveUp_014, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildSingleColumn(4));
      expect(navigator.findCandidate(3, FocusDirection.UP)).assertEqual(2);
      expect(navigator.findCandidate(2, FocusDirection.UP)).assertEqual(1);
      const move: MoveResult = navigator.move(3, FocusDirection.UP);
      expect(move.accepted).assertTrue();
      expect(move.targetIndex).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorMoveUp_014, end');
    });

    /**
     * Scenario: horizontal moves inside a row.
     * Expectation: the neighbour column is selected on both sides.
     */
    it('Assessment_FocusNavigatorMoveHorizontal_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorMoveHorizontal_015, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildRow(4));
      expect(navigator.findCandidate(0, FocusDirection.RIGHT)).assertEqual(1);
      expect(navigator.findCandidate(3, FocusDirection.LEFT)).assertEqual(2);
      expect(navigator.findCandidate(2, FocusDirection.RIGHT)).assertEqual(3);
      expect(navigator.findCandidate(1, FocusDirection.LEFT)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorMoveHorizontal_015, end');
    });

    /**
     * Scenario: the clamp policy at the right edge of a row.
     * Expectation: the move is refused because no node exists to the right.
     */
    it('Assessment_FocusNavigatorClampRight_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorClampRight_016, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildRow(3), WrapMode.CLAMP);
      const move: MoveResult = navigator.move(2, FocusDirection.RIGHT);
      expect(move.accepted).assertFalse();
      expect(move.targetIndex).assertEqual(2);
      expect(move.wrapped).assertFalse();
      expect(navigator.clampTarget(FocusDirection.RIGHT)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorClampRight_016, end');
    });

    /**
     * Scenario: the clamp policy at the left edge of a row.
     * Expectation: the move is refused and the clamp target is the first node.
     */
    it('Assessment_FocusNavigatorClampLeft_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorClampLeft_017, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildRow(3), WrapMode.CLAMP);
      const move: MoveResult = navigator.move(0, FocusDirection.LEFT);
      expect(move.accepted).assertFalse();
      expect(move.targetIndex).assertEqual(0);
      expect(navigator.clampTarget(FocusDirection.LEFT)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorClampLeft_017, end');
    });

    /**
     * Scenario: the wrap policy at the right edge.
     * Expectation: the focus jumps to the first node and the result is marked as wrapped.
     */
    it('Assessment_FocusNavigatorWrapRight_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorWrapRight_018, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildRow(3), WrapMode.WRAP);
      const move: MoveResult = navigator.move(2, FocusDirection.RIGHT);
      expect(move.accepted).assertTrue();
      expect(move.targetIndex).assertEqual(0);
      expect(move.wrapped).assertTrue();
      expect(move.direction).assertEqual(FocusDirection.RIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorWrapRight_018, end');
    });

    /**
     * Scenario: the wrap policy at the left edge.
     * Expectation: the focus jumps to the last node.
     */
    it('Assessment_FocusNavigatorWrapLeft_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorWrapLeft_019, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildRow(3), WrapMode.WRAP);
      const move: MoveResult = navigator.move(0, FocusDirection.LEFT);
      expect(move.accepted).assertTrue();
      expect(move.targetIndex).assertEqual(2);
      expect(move.wrapped).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorWrapLeft_019, end');
    });

    /**
     * Scenario: the wrap policy at the bottom edge of a column.
     * Expectation: the focus jumps to the first node of the graph.
     */
    it('Assessment_FocusNavigatorWrapDown_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorWrapDown_020, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildSingleColumn(4), WrapMode.WRAP);
      const move: MoveResult = navigator.move(3, FocusDirection.DOWN);
      expect(move.accepted).assertTrue();
      expect(move.targetIndex).assertEqual(0);
      expect(move.wrapped).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorWrapDown_020, end');
    });

    /**
     * Scenario: the wrap policy at the top edge of a column.
     * Expectation: the focus jumps to the last node of the graph.
     */
    it('Assessment_FocusNavigatorWrapUp_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorWrapUp_021, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildSingleColumn(4), WrapMode.WRAP);
      const move: MoveResult = navigator.move(0, FocusDirection.UP);
      expect(move.accepted).assertTrue();
      expect(move.targetIndex).assertEqual(3);
      expect(move.wrapped).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorWrapUp_021, end');
    });

    /**
     * Scenario: the refuse policy at an edge.
     * Expectation: no target is produced and the origin index is preserved.
     */
    it('Assessment_FocusNavigatorRefuse_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorRefuse_022, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildRow(3), WrapMode.REFUSE);
      const move: MoveResult = navigator.move(2, FocusDirection.RIGHT);
      expect(move.accepted).assertFalse();
      expect(move.targetIndex).assertEqual(2);
      expect(move.wrapped).assertFalse();
      expect(navigator.move(0, FocusDirection.RIGHT).accepted).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorRefuse_022, end');
    });

    /**
     * Scenario: a wrap over a single node graph.
     * Expectation: wrapping onto itself is refused because the target would not change.
     */
    it('Assessment_FocusNavigatorWrapSingle_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorWrapSingle_023, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildRow(1), WrapMode.WRAP);
      const move: MoveResult = navigator.move(0, FocusDirection.RIGHT);
      expect(move.accepted).assertFalse();
      expect(navigator.count()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorWrapSingle_023, end');
    });

    /**
     * Scenario: a directionless move.
     * Expectation: the none direction is always refused.
     */
    it('Assessment_FocusNavigatorNoneDirection_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorNoneDirection_024, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildRow(3), WrapMode.WRAP);
      const move: MoveResult = navigator.move(1, FocusDirection.NONE);
      expect(move.accepted).assertFalse();
      expect(move.direction).assertEqual(FocusDirection.NONE);
      expect(move.targetIndex).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorNoneDirection_024, end');
    });

    /**
     * Scenario: a down move in a grid prefers the aligned column.
     * Expectation: the node directly below wins over the diagonal neighbours.
     */
    it('Assessment_FocusNavigatorGridDown_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorGridDown_025, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildGrid(3, 3));
      expect(navigator.findCandidate(0, FocusDirection.DOWN)).assertEqual(3);
      expect(navigator.findCandidate(1, FocusDirection.DOWN)).assertEqual(4);
      expect(navigator.findCandidate(2, FocusDirection.DOWN)).assertEqual(5);
      expect(navigator.findCandidate(4, FocusDirection.DOWN)).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorGridDown_025, end');
    });

    /**
     * Scenario: an up move in a grid prefers the aligned column.
     * Expectation: the node directly above wins over the diagonal neighbours.
     */
    it('Assessment_FocusNavigatorGridUp_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorGridUp_026, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildGrid(3, 3));
      expect(navigator.findCandidate(7, FocusDirection.UP)).assertEqual(4);
      expect(navigator.findCandidate(8, FocusDirection.UP)).assertEqual(5);
      expect(navigator.findCandidate(5, FocusDirection.UP)).assertEqual(2);
      expect(navigator.findCandidate(3, FocusDirection.UP)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorGridUp_026, end');
    });

    /**
     * Scenario: a right move in a grid.
     * Expectation: the nearest node of the same row is selected.
     */
    it('Assessment_FocusNavigatorGridRight_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorGridRight_027, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildGrid(3, 3));
      expect(navigator.findCandidate(0, FocusDirection.RIGHT)).assertEqual(1);
      expect(navigator.findCandidate(3, FocusDirection.RIGHT)).assertEqual(4);
      expect(navigator.findCandidate(6, FocusDirection.RIGHT)).assertEqual(7);
      expect(navigator.hasDirectionalNeighbour(2, FocusDirection.RIGHT)).assertFalse();
      expect(navigator.hasDirectionalNeighbour(0, FocusDirection.RIGHT)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorGridRight_027, end');
    });

    /**
     * Scenario: a left move in a grid.
     * Expectation: the nearest node of the same row is selected and the first column refuses.
     */
    it('Assessment_FocusNavigatorGridLeft_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorGridLeft_028, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildGrid(3, 3));
      expect(navigator.findCandidate(2, FocusDirection.LEFT)).assertEqual(1);
      expect(navigator.findCandidate(5, FocusDirection.LEFT)).assertEqual(4);
      expect(navigator.findCandidate(8, FocusDirection.LEFT)).assertEqual(7);
      expect(navigator.hasDirectionalNeighbour(0, FocusDirection.LEFT)).assertFalse();
      expect(navigator.findCandidate(0, FocusDirection.LEFT)).assertEqual(NO_TARGET);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorGridLeft_028, end');
    });

    /**
     * Scenario: a diagonal neighbour is preferred when no aligned node exists.
     * Expectation: the candidate with the larger primary distance still wins over nothing.
     */
    it('Assessment_FocusNavigatorDiagonal_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorDiagonal_029, begin');
      const nodes: FocusNode[] = [
        { index: 0, row: 0, column: 0, left: 16, top: 16, width: 100, height: 50, enabled: true },
        { index: 1, row: 1, column: 1, left: 216, top: 116, width: 100, height: 50, enabled: true }
      ];
      const navigator: FocusNavigator = new FocusNavigator(nodes);
      expect(navigator.findCandidate(0, FocusDirection.DOWN)).assertEqual(1);
      expect(navigator.findCandidate(0, FocusDirection.RIGHT)).assertEqual(1);
      expect(navigator.findCandidate(1, FocusDirection.UP)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorDiagonal_029, end');
    });

    /**
     * Scenario: the disabled node is skipped by the navigator.
     * Expectation: the move lands on the next enabled node in the direction.
     */
    it('Assessment_FocusNavigatorDisabledSkipped_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorDisabledSkipped_030, begin');
      const nodes: FocusNode[] = FocusGraphBuilder.buildDisabled(FocusGraphBuilder.buildSingleColumn(4), 1);
      const navigator: FocusNavigator = new FocusNavigator(nodes);
      expect(navigator.findCandidate(0, FocusDirection.DOWN)).assertEqual(2);
      expect(navigator.findCandidate(2, FocusDirection.UP)).assertEqual(0);
      expect(navigator.firstEnabled()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorDisabledSkipped_030, end');
    });

    /**
     * Scenario: every node of a row is disabled except one.
     * Expectation: the remaining node is the only target and the others are unreachable.
     */
    it('Assessment_FocusNavigatorOnlyOneEnabled_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorOnlyOneEnabled_031, begin');
      let nodes: FocusNode[] = FocusGraphBuilder.buildRow(3);
      nodes = FocusGraphBuilder.buildDisabled(nodes, 0);
      nodes = FocusGraphBuilder.buildDisabled(nodes, 2);
      const navigator: FocusNavigator = new FocusNavigator(nodes);
      expect(navigator.firstEnabled()).assertEqual(1);
      expect(navigator.lastEnabled()).assertEqual(1);
      expect(navigator.findCandidate(1, FocusDirection.RIGHT)).assertEqual(NO_TARGET);
      expect(navigator.findCandidate(1, FocusDirection.LEFT)).assertEqual(NO_TARGET);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorOnlyOneEnabled_031, end');
    });

    /**
     * Scenario: the node getter of the navigator.
     * Expectation: valid indices answer the node and invalid ones answer null.
     */
    it('Assessment_FocusNavigatorNodeAccess_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorNodeAccess_032, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildSingleColumn(3));
      const node: FocusNode | null = navigator.nodeAt(1);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(node.index).assertEqual(1);
        expect(node.row).assertEqual(1);
        expect(node.enabled).assertTrue();
      }
      expect(navigator.nodeAt(3) === null).assertTrue();
      expect(navigator.nodeAt(-1) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorNodeAccess_032, end');
    });

    /**
     * Scenario: the nodes getter of the navigator.
     * Expectation: the returned list is a defensive copy.
     */
    it('Assessment_FocusNavigatorDefensiveCopy_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorDefensiveCopy_033, begin');
      const navigator: FocusNavigator = new FocusNavigator(FocusGraphBuilder.buildRow(2));
      const copy: FocusNode[] = navigator.getNodes();
      copy.push({
        index: 9, row: 9, column: 9, left: 0, top: 0, width: 10, height: 10, enabled: true
      });
      expect(navigator.count()).assertEqual(2);
      expect(navigator.getNodes().length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusNavigatorDefensiveCopy_033, end');
    });

    /**
     * Scenario: the history of a fresh manager.
     * Expectation: the initial focus is the first enabled node and the history is empty.
     */
    it('Assessment_FocusManagerInitial_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerInitial_034, begin');
      const manager: FocusManager = new FocusManager(FocusGraphBuilder.buildSingleColumn(4));
      expect(manager.getCurrentIndex()).assertEqual(0);
      expect(manager.hasFocus()).assertTrue();
      expect(manager.moveCount()).assertEqual(0);
      expect(manager.getHistory().latest() === null).assertTrue();
      expect(manager.getHistory().lastIndex()).assertEqual(NO_TARGET);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerInitial_034, end');
    });

    /**
     * Scenario: a manager over an empty graph.
     * Expectation: no node holds the focus and the request is refused.
     */
    it('Assessment_FocusManagerEmptyGraph_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerEmptyGraph_035, begin');
      const manager: FocusManager = new FocusManager([]);
      expect(manager.getCurrentIndex()).assertEqual(NO_TARGET);
      expect(manager.hasFocus()).assertFalse();
      expect(manager.requestFocus(0)).assertFalse();
      expect(manager.handleKey(KEY_DOWN).accepted).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerEmptyGraph_035, end');
    });

    /**
     * Scenario: a direct focus request.
     * Expectation: the target index is committed and the history records it.
     */
    it('Assessment_FocusManagerRequestFocus_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerRequestFocus_036, begin');
      const manager: FocusManager = new FocusManager(FocusGraphBuilder.buildSingleColumn(4));
      expect(manager.requestFocus(2)).assertTrue();
      expect(manager.getCurrentIndex()).assertEqual(2);
      expect(manager.moveCount()).assertEqual(1);
      const latest: FocusRecord | null = manager.getHistory().latest();
      expect(latest !== null).assertTrue();
      if (latest !== null) {
        expect(latest.index).assertEqual(2);
        expect(latest.previousIndex).assertEqual(0);
        expect(latest.direction).assertEqual(FocusDirection.NONE);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerRequestFocus_036, end');
    });

    /**
     * Scenario: a focus request on the current index.
     * Expectation: the request is refused and no history entry is created.
     */
    it('Assessment_FocusManagerRequestSame_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerRequestSame_037, begin');
      const manager: FocusManager = new FocusManager(FocusGraphBuilder.buildSingleColumn(3));
      expect(manager.requestFocus(1)).assertTrue();
      expect(manager.requestFocus(1)).assertFalse();
      expect(manager.moveCount()).assertEqual(1);
      expect(manager.getCurrentIndex()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerRequestSame_037, end');
    });

    /**
     * Scenario: a focus request on a disabled or missing node.
     * Expectation: both are refused without touching the history.
     */
    it('Assessment_FocusManagerRequestInvalid_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerRequestInvalid_038, begin');
      const nodes: FocusNode[] = FocusGraphBuilder.buildDisabled(FocusGraphBuilder.buildSingleColumn(3), 2);
      const manager: FocusManager = new FocusManager(nodes);
      expect(manager.requestFocus(2)).assertFalse();
      expect(manager.requestFocus(9)).assertFalse();
      expect(manager.requestFocus(-1)).assertFalse();
      expect(manager.getCurrentIndex()).assertEqual(0);
      expect(manager.moveCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerRequestInvalid_038, end');
    });

    /**
     * Scenario: a key driven move through the manager.
     * Expectation: the key code is translated and recorded with the direction.
     */
    it('Assessment_FocusManagerKeyMove_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerKeyMove_039, begin');
      const manager: FocusManager = new FocusManager(FocusGraphBuilder.buildSingleColumn(4));
      const result: MoveResult = manager.handleKey(KEY_DOWN);
      expect(result.accepted).assertTrue();
      expect(result.targetIndex).assertEqual(1);
      expect(manager.getCurrentIndex()).assertEqual(1);
      const latest: FocusRecord | null = manager.getHistory().latest();
      expect(latest !== null).assertTrue();
      if (latest !== null) {
        expect(latest.keyCode).assertEqual(KEY_DOWN);
        expect(latest.direction).assertEqual(FocusDirection.DOWN);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerKeyMove_039, end');
    });

    /**
     * Scenario: a key that is not a movement key.
     * Expectation: the manager does not move and records nothing.
     */
    it('Assessment_FocusManagerKeyIgnored_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerKeyIgnored_040, begin');
      const manager: FocusManager = new FocusManager(FocusGraphBuilder.buildSingleColumn(4));
      expect(manager.handleKey(KEY_ENTER).accepted).assertFalse();
      expect(manager.handleKey(KEY_BACK).accepted).assertFalse();
      expect(manager.handleKey(KEY_TAB).accepted).assertFalse();
      expect(manager.getCurrentIndex()).assertEqual(0);
      expect(manager.moveCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerKeyIgnored_040, end');
    });

    /**
     * Scenario: a direction based move through the manager.
     * Expectation: the helper resolves the key code and records the direction.
     */
    it('Assessment_FocusManagerDirectionMove_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerDirectionMove_041, begin');
      const manager: FocusManager = new FocusManager(FocusGraphBuilder.buildRow(3));
      expect(manager.move(FocusDirection.RIGHT).targetIndex).assertEqual(1);
      expect(manager.move(FocusDirection.RIGHT).targetIndex).assertEqual(2);
      expect(manager.getCurrentIndex()).assertEqual(2);
      expect(manager.getHistory().countOfDirection(FocusDirection.RIGHT)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerDirectionMove_041, end');
    });

    /**
     * Scenario: a refused move at an edge.
     * Expectation: the manager keeps the focus and records nothing.
     */
    it('Assessment_FocusManagerEdgeRefusal_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerEdgeRefusal_042, begin');
      const manager: FocusManager = new FocusManager(FocusGraphBuilder.buildRow(2), WrapMode.CLAMP);
      manager.move(FocusDirection.RIGHT);
      expect(manager.getCurrentIndex()).assertEqual(1);
      const before: number = manager.moveCount();
      expect(manager.move(FocusDirection.RIGHT).accepted).assertFalse();
      expect(manager.moveCount()).assertEqual(before);
      expect(manager.isAtEdge(FocusDirection.RIGHT)).assertTrue();
      expect(manager.isAtEdge(FocusDirection.LEFT)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerEdgeRefusal_042, end');
    });

    /**
     * Scenario: the focus restoration after a rebuild.
     * Expectation: restore returns to the index that was focused before the last move.
     */
    it('Assessment_FocusManagerRestore_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerRestore_043, begin');
      const manager: FocusManager = new FocusManager(FocusGraphBuilder.buildSingleColumn(5));
      manager.requestFocus(2);
      manager.move(FocusDirection.DOWN);
      expect(manager.getCurrentIndex()).assertEqual(3);
      expect(manager.restore()).assertTrue();
      expect(manager.getCurrentIndex()).assertEqual(2);
      expect(manager.getHistory().lastIndex()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerRestore_043, end');
    });

    /**
     * Scenario: restoring without history.
     * Expectation: the restore is refused because there is nothing to restore.
     */
    it('Assessment_FocusManagerRestoreEmpty_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerRestoreEmpty_044, begin');
      const manager: FocusManager = new FocusManager(FocusGraphBuilder.buildSingleColumn(3));
      expect(manager.restore()).assertFalse();
      expect(manager.getCurrentIndex()).assertEqual(0);
      manager.requestFocus(2);
      expect(manager.restore()).assertTrue();
      expect(manager.getCurrentIndex()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerRestoreEmpty_044, end');
    });

    /**
     * Scenario: restoring after a refused focus request.
     * Expectation: the refused request records nothing, so the restore returns to the target
     * that was focused before the last accepted request.
     */
    it('Assessment_FocusManagerRestoreAfterRefusal_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerRestoreAfterRefusal_045, begin');
      const manager: FocusManager = new FocusManager(FocusGraphBuilder.buildSingleColumn(4));
      manager.requestFocus(2);
      expect(manager.requestFocus(9)).assertFalse();
      expect(manager.getCurrentIndex()).assertEqual(2);
      expect(manager.moveCount()).assertEqual(1);
      expect(manager.restore()).assertTrue();
      expect(manager.getCurrentIndex()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerRestoreAfterRefusal_045, end');
    });

    /**
     * Scenario: the reset of the manager.
     * Expectation: the focus returns to the first node and the history is cleared.
     */
    it('Assessment_FocusManagerReset_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerReset_046, begin');
      const manager: FocusManager = new FocusManager(FocusGraphBuilder.buildSingleColumn(4));
      manager.requestFocus(3);
      expect(manager.moveCount()).assertEqual(1);
      manager.reset();
      expect(manager.getCurrentIndex()).assertEqual(0);
      expect(manager.moveCount()).assertEqual(0);
      expect(manager.getHistory().latest() === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerReset_046, end');
    });

    /**
     * Scenario: the history capacity of the manager.
     * Expectation: the records are truncated from the head once the capacity is reached.
     */
    it('Assessment_FocusManagerHistoryCapacity_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerHistoryCapacity_047, begin');
      const manager: FocusManager = new FocusManager(FocusGraphBuilder.buildSingleColumn(20), WrapMode.WRAP, 5);
      for (let i = 0; i < 12; i++) {
        manager.move(FocusDirection.DOWN);
      }
      expect(manager.getHistory().capacityLimit()).assertEqual(5);
      expect(manager.getHistory().size()).assertEqual(5);
      expect(manager.getHistory().lastIndex()).assertEqual(12);
      expect(manager.getHistory().isChronological()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusManagerHistoryCapacity_047, end');
    });

    /**
     * Scenario: the index lookup inside the history.
     * Expectation: indexBefore walks backwards through the accepted moves.
     */
    it('Assessment_FocusHistoryIndexBefore_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusHistoryIndexBefore_048, begin');
      const manager: FocusManager = new FocusManager(FocusGraphBuilder.buildSingleColumn(6));
      manager.requestFocus(1);
      manager.move(FocusDirection.DOWN);
      manager.move(FocusDirection.DOWN);
      const history: FocusHistory = manager.getHistory();
      expect(history.indexBefore(0)).assertEqual(3);
      expect(history.indexBefore(1)).assertEqual(2);
      expect(history.indexBefore(2)).assertEqual(1);
      expect(history.indexBefore(3)).assertEqual(NO_TARGET);
      expect(history.at(0)?.index).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusHistoryIndexBefore_048, end');
    });

    /**
     * Scenario: the record accessor of the history.
     * Expectation: out of range indices answer null.
     */
    it('Assessment_FocusHistoryRecordAccess_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusHistoryRecordAccess_049, begin');
      const history: FocusHistory = new FocusHistory();
      expect(history.at(0) === null).assertTrue();
      expect(history.latest() === null).assertTrue();
      history.record({
        index: 1, previousIndex: 0, direction: FocusDirection.DOWN, keyCode: KEY_DOWN, timestamp: 10
      });
      const record: FocusRecord | null = history.at(0);
      expect(record !== null).assertTrue();
      if (record !== null) {
        expect(record.index).assertEqual(1);
        expect(record.previousIndex).assertEqual(0);
        expect(record.keyCode).assertEqual(KEY_DOWN);
      }
      expect(history.at(1) === null).assertTrue();
      expect(history.at(-1) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusHistoryRecordAccess_049, end');
    });

    /**
     * Scenario: clearing and reusing the history.
     * Expectation: the clear drops everything and the history accepts new records.
     */
    it('Assessment_FocusHistoryClear_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusHistoryClear_050, begin');
      const history: FocusHistory = new FocusHistory(3);
      history.record({
        index: 1, previousIndex: 0, direction: FocusDirection.DOWN, keyCode: KEY_DOWN, timestamp: 1
      });
      history.record({
        index: 2, previousIndex: 1, direction: FocusDirection.DOWN, keyCode: KEY_DOWN, timestamp: 2
      });
      expect(history.size()).assertEqual(2);
      history.clear();
      expect(history.size()).assertEqual(0);
      expect(history.latest() === null).assertTrue();
      expect(history.lastIndex()).assertEqual(NO_TARGET);
      history.record({
        index: 5, previousIndex: 0, direction: FocusDirection.UP, keyCode: KEY_UP, timestamp: 3
      });
      expect(history.lastIndex()).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusHistoryClear_050, end');
    });

    /**
     * Scenario: the direction counter of the history.
     * Expectation: every direction is counted separately.
     */
    it('Assessment_FocusHistoryDirectionCount_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusHistoryDirectionCount_051, begin');
      const manager: FocusManager = new FocusManager(FocusGraphBuilder.buildGrid(3, 3), WrapMode.CLAMP, 32);
      manager.move(FocusDirection.RIGHT);
      manager.move(FocusDirection.DOWN);
      manager.move(FocusDirection.LEFT);
      manager.move(FocusDirection.UP);
      manager.move(FocusDirection.RIGHT);
      const history: FocusHistory = manager.getHistory();
      expect(history.countOfDirection(FocusDirection.RIGHT)).assertEqual(2);
      expect(history.countOfDirection(FocusDirection.LEFT)).assertEqual(1);
      expect(history.countOfDirection(FocusDirection.UP)).assertEqual(1);
      expect(history.countOfDirection(FocusDirection.DOWN)).assertEqual(1);
      expect(history.countOfDirection(FocusDirection.NONE)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusHistoryDirectionCount_051, end');
    });

    /**
     * Scenario: the key code to direction mapper.
     * Expectation: every documented movement key maps to its direction.
     */
    it('Assessment_FocusKeyMapper_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusKeyMapper_052, begin');
      expect(KeyDirectionMapper.directionOf(KEY_LEFT)).assertEqual(FocusDirection.LEFT);
      expect(KeyDirectionMapper.directionOf(KEY_RIGHT)).assertEqual(FocusDirection.RIGHT);
      expect(KeyDirectionMapper.directionOf(KEY_UP)).assertEqual(FocusDirection.UP);
      expect(KeyDirectionMapper.directionOf(KEY_DOWN)).assertEqual(FocusDirection.DOWN);
      expect(KeyDirectionMapper.directionOf(KEY_ENTER)).assertEqual(FocusDirection.NONE);
      expect(KeyDirectionMapper.isMoveKey(KEY_LEFT)).assertTrue();
      expect(KeyDirectionMapper.isMoveKey(KEY_ENTER)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusKeyMapper_052, end');
    });

    /**
     * Scenario: the confirm, back and traversal classifiers.
     * Expectation: the keys are classified exactly once.
     */
    it('Assessment_FocusKeyClassifiers_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusKeyClassifiers_053, begin');
      expect(KeyDirectionMapper.isConfirmKey(KEY_ENTER)).assertTrue();
      expect(KeyDirectionMapper.isConfirmKey(KEY_LEFT)).assertFalse();
      expect(KeyDirectionMapper.isBackKey(KEY_BACK)).assertTrue();
      expect(KeyDirectionMapper.isBackKey(KEY_ENTER)).assertFalse();
      expect(KeyDirectionMapper.isTraversalKey(KEY_TAB)).assertTrue();
      expect(KeyDirectionMapper.isTraversalKey(KEY_BACK)).assertFalse();
      expect(KeyDirectionMapper.isNoOpKey(9999)).assertTrue();
      expect(KeyDirectionMapper.isNoOpKey(KEY_ENTER)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusKeyClassifiers_053, end');
    });

    /**
     * Scenario: the round trip of the direction and key code mapping.
     * Expectation: the direction of a code derived from a direction is that direction.
     */
    it('Assessment_FocusKeyRoundTrip_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusKeyRoundTrip_054, begin');
      const directions: FocusDirection[] =
        [FocusDirection.LEFT, FocusDirection.RIGHT, FocusDirection.UP, FocusDirection.DOWN];
      for (let i = 0; i < directions.length; i++) {
        const code: number = KeyDirectionMapper.codeOf(directions[i]);
        expect(KeyDirectionMapper.directionOf(code)).assertEqual(directions[i]);
        expect(KeyDirectionMapper.nameOf(directions[i])).assertEqual(directions[i].toUpperCase());
      }
      expect(KeyDirectionMapper.codeOf(FocusDirection.NONE)).assertEqual(0);
      expect(KeyDirectionMapper.nameOf(FocusDirection.NONE)).assertEqual('NONE');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusKeyRoundTrip_054, end');
    });

    /**
     * Scenario: statistics over a mixed focus history.
     * Expectation: the per direction counters and the distinct targets are correct.
     */
    it('Assessment_FocusStatisticsMixed_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusStatisticsMixed_055, begin');
      const records: FocusRecord[] = [
        { index: 1, previousIndex: 0, direction: FocusDirection.RIGHT, keyCode: KEY_RIGHT, timestamp: 0 },
        { index: 2, previousIndex: 1, direction: FocusDirection.RIGHT, keyCode: KEY_RIGHT, timestamp: 100 },
        { index: 1, previousIndex: 2, direction: FocusDirection.LEFT, keyCode: KEY_LEFT, timestamp: 250 },
        { index: 3, previousIndex: 1, direction: FocusDirection.DOWN, keyCode: KEY_DOWN, timestamp: 400 }
      ];
      const stats: FocusStatistics = new FocusStatistics(records);
      expect(stats.total()).assertEqual(4);
      expect(stats.countOf(FocusDirection.RIGHT)).assertEqual(2);
      expect(stats.horizontalMoves()).assertEqual(3);
      expect(stats.verticalMoves()).assertEqual(1);
      expect(stats.distinctTargets()).assertEqual(3);
      expect(stats.mostFrequentTarget()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusStatisticsMixed_055, end');
    });

    /**
     * Scenario: the average interval between two accepted moves.
     * Expectation: the interval is the mean of the timestamp deltas.
     */
    it('Assessment_FocusStatisticsInterval_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusStatisticsInterval_056, begin');
      const records: FocusRecord[] = [
        { index: 1, previousIndex: 0, direction: FocusDirection.RIGHT, keyCode: KEY_RIGHT, timestamp: 0 },
        { index: 2, previousIndex: 1, direction: FocusDirection.RIGHT, keyCode: KEY_RIGHT, timestamp: 100 },
        { index: 3, previousIndex: 2, direction: FocusDirection.RIGHT, keyCode: KEY_RIGHT, timestamp: 300 }
      ];
      const stats: FocusStatistics = new FocusStatistics(records);
      expect(stats.averageInterval()).assertEqual(150);
      expect(stats.averageInterval() > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusStatisticsInterval_056, end');
    });

    /**
     * Scenario: statistics over an empty or single record history.
     * Expectation: every aggregate answers zero or the sentinel.
     */
    it('Assessment_FocusStatisticsDegenerate_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusStatisticsDegenerate_057, begin');
      const empty: FocusStatistics = new FocusStatistics([]);
      expect(empty.total()).assertEqual(0);
      expect(empty.averageInterval()).assertEqual(0);
      expect(empty.mostFrequentTarget()).assertEqual(NO_TARGET);
      expect(empty.distinctTargets()).assertEqual(0);
      const single: FocusStatistics = new FocusStatistics([{
        index: 4, previousIndex: 0, direction: FocusDirection.DOWN, keyCode: KEY_DOWN, timestamp: 5
      }]);
      expect(single.total()).assertEqual(1);
      expect(single.averageInterval()).assertEqual(0);
      expect(single.mostFrequentTarget()).assertEqual(4);
      expect(single.verticalMoves()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusStatisticsDegenerate_057, end');
    });

    /**
     * Scenario: a full traversal of a single column page.
     * Expectation: repeated down moves reach the last card and then stop under clamp.
     */
    it('Assessment_FocusTraversalColumn_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusTraversalColumn_058, begin');
      const manager: FocusManager = new FocusManager(FocusGraphBuilder.buildSingleColumn(4));
      for (let i = 0; i < 3; i++) {
        expect(manager.move(FocusDirection.DOWN).accepted).assertTrue();
      }
      expect(manager.getCurrentIndex()).assertEqual(3);
      expect(manager.move(FocusDirection.DOWN).accepted).assertFalse();
      for (let i = 0; i < 3; i++) {
        expect(manager.move(FocusDirection.UP).accepted).assertTrue();
      }
      expect(manager.getCurrentIndex()).assertEqual(0);
      expect(manager.moveCount()).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusTraversalColumn_058, end');
    });

    /**
     * Scenario: a zigzag traversal of a grid.
     * Expectation: the focus follows the applied direction sequence exactly.
     */
    it('Assessment_FocusTraversalZigzag_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusTraversalZigzag_059, begin');
      const manager: FocusManager = new FocusManager(FocusGraphBuilder.buildGrid(3, 3));
      expect(manager.move(FocusDirection.RIGHT).targetIndex).assertEqual(1);
      expect(manager.move(FocusDirection.DOWN).targetIndex).assertEqual(4);
      expect(manager.move(FocusDirection.LEFT).targetIndex).assertEqual(3);
      expect(manager.move(FocusDirection.DOWN).targetIndex).assertEqual(6);
      expect(manager.move(FocusDirection.RIGHT).targetIndex).assertEqual(7);
      expect(manager.getCurrentIndex()).assertEqual(7);
      expect(manager.moveCount()).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusTraversalZigzag_059, end');
    });

    /**
     * Scenario: a wrap traversal of a row.
     * Expectation: the focus cycles through the row and returns to the first node.
     */
    it('Assessment_FocusTraversalWrapCycle_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusTraversalWrapCycle_060, begin');
      const manager: FocusManager = new FocusManager(FocusGraphBuilder.buildRow(3), WrapMode.WRAP);
      expect(manager.move(FocusDirection.RIGHT).targetIndex).assertEqual(1);
      expect(manager.move(FocusDirection.RIGHT).targetIndex).assertEqual(2);
      const wrapped: MoveResult = manager.move(FocusDirection.RIGHT);
      expect(wrapped.targetIndex).assertEqual(0);
      expect(wrapped.wrapped).assertTrue();
      expect(manager.getCurrentIndex()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusTraversalWrapCycle_060, end');
    });

    /**
     * Scenario: an end to end focus scenario over the entry page graph.
     * Expectation: request, move, restore and statistics agree with each other.
     */
    it('Assessment_FocusComprehensive_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusComprehensive_063, begin');
      const nodes: FocusNode[] = FocusGraphBuilder.buildGrid(3, 3);
      const manager: FocusManager = new FocusManager(nodes, WrapMode.WRAP, 32);
      expect(manager.requestFocus(4)).assertTrue();
      expect(manager.getCurrentIndex()).assertEqual(4);
      expect(manager.move(FocusDirection.RIGHT).targetIndex).assertEqual(5);
      expect(manager.move(FocusDirection.DOWN).targetIndex).assertEqual(8);
      const stats: FocusStatistics = new FocusStatistics(manager.getHistory().getAll());
      expect(stats.total()).assertEqual(3);
      expect(stats.countOf(FocusDirection.RIGHT)).assertEqual(1);
      expect(stats.countOf(FocusDirection.DOWN)).assertEqual(1);
      expect(stats.countOf(FocusDirection.NONE)).assertEqual(1);
      expect(manager.restore()).assertTrue();
      expect(manager.getCurrentIndex()).assertEqual(5);
      expect(manager.getHistory().isChronological()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusComprehensive_063, end');
    });

    /**
     * Scenario: the focus history is monotonic in its timestamps.
     * Expectation: every recorded move is chronological.
     */
    it('Assessment_FocusComprehensiveChronology_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusComprehensiveChronology_064, begin');
      const manager: FocusManager = new FocusManager(FocusGraphBuilder.buildSingleColumn(8));
      for (let i = 0; i < 7; i++) {
        manager.move(FocusDirection.DOWN);
      }
      expect(manager.getHistory().isChronological()).assertTrue();
      expect(manager.getCurrentIndex()).assertEqual(7);
      expect(manager.moveCount()).assertEqual(7);
      const latest: FocusRecord | null = manager.getHistory().latest();
      expect(latest !== null).assertTrue();
      if (latest !== null) {
        expect(latest.previousIndex).assertEqual(6);
        expect(latest.keyCode).assertEqual(KEY_DOWN);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusComprehensiveChronology_064, end');
    });

    /**
     * Scenario: a key driven traversal with a disabled card in the middle.
     * Expectation: the disabled card is skipped in both directions.
     */
    it('Assessment_FocusComprehensiveSkipDisabled_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusComprehensiveSkipDisabled_065, begin');
      const nodes: FocusNode[] = FocusGraphBuilder.buildDisabled(FocusGraphBuilder.buildSingleColumn(5), 2);
      const manager: FocusManager = new FocusManager(nodes);
      expect(manager.handleKey(KEY_DOWN).targetIndex).assertEqual(1);
      expect(manager.handleKey(KEY_DOWN).targetIndex).assertEqual(3);
      expect(manager.handleKey(KEY_DOWN).targetIndex).assertEqual(4);
      expect(manager.handleKey(KEY_UP).targetIndex).assertEqual(3);
      expect(manager.handleKey(KEY_UP).targetIndex).assertEqual(1);
      expect(manager.getCurrentIndex()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusComprehensiveSkipDisabled_065, end');
    });

    /**
     * Scenario: the focus graph arithmetic uses only finite values.
     * Expectation: the maximum index guard is respected by every builder.
     */
    it('Assessment_FocusGuardBounds_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGuardBounds_072, begin');
      const grid: FocusNode[] = FocusGraphBuilder.buildGrid(4, 4);
      expect(grid.length).assertEqual(16);
      expect(grid.length <= MAX_INDEX).assertTrue();
      for (let i = 0; i < grid.length; i++) {
        expect(grid[i].left >= 0).assertTrue();
        expect(grid[i].top >= 0).assertTrue();
        expect(grid[i].width > 0).assertTrue();
        expect(grid[i].height > 0).assertTrue();
        expect(grid[i].index < MAX_INDEX).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusGuardBounds_072, end');
    });
  });
}
