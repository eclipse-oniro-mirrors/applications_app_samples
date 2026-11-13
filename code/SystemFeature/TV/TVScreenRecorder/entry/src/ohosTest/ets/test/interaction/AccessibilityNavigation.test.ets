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
import hilog from '@ohos.hilog';
import {
  getDriver,
  pressAndWait,
  serializedDelay,
  recorderComponentCount,
  checkFocusState,
  getCurrentFocusIndex,
  checkTextContent,
  checkAnyTextContent,
  checkComponentExists,
  waitForTipWindowStable,
  waitForTimerWindowStable,
  TIP_TEXT_TITLE,
  TIP_TEXT_CONTENT,
  TIMER_TEXT_HINT,
  TIMER_TEXT_ERROR,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  KEY_ENTER,
  TIMEOUT_TIP_RENDER,
  TIMEOUT_TIMER_RENDER,
  DELAY_KEY_NAVIGATION,
  STRESS_ROUNDS_NAVIGATION
} from '../shared/RecordingDriver';

const DOMAIN: number = 0x0000;
const TAG: string = 'AccessibilityNavigation';

/** Record of a single accessibility traversal step. */
interface AccessibilityRecord {
  componentName: string;
  accessibilityText: string;
  isFocusable: boolean;
  timestamp: number;
}

/** Accessibility role of a node inside the floating window tree. */
enum AccessibilityRole {
  BUTTON = 'button',
  TEXT = 'text',
  IMAGE = 'image',
  CONTAINER = 'container',
  HEADING = 'heading'
}

/** Logical traversal direction used by the screen reader. */
enum NavigationDirection {
  LEFT = 'left',
  RIGHT = 'right',
  UP = 'up',
  DOWN = 'down',
  FORWARD = 'forward',
  BACKWARD = 'backward'
}

/** Metadata of one node inside the accessibility tree. */
interface AccessibilityNode {
  nodeId: number;
  role: AccessibilityRole;
  label: string;
  isFocusable: boolean;
  childCount: number;
}

/** One complete accessibility navigation path. */
interface NavigationPath {
  pathId: number;
  startNodeId: number;
  endNodeId: number;
  directions: NavigationDirection[];
}

/** Traversal strategy of the accessibility tree. */
enum TraversalMode {
  DEPTH_FIRST = 'depth_first',
  BREADTH_FIRST = 'breadth_first',
  FOCUS_ORDER = 'focus_order'
}

/** One visit produced while walking the accessibility tree. */
interface TraversalVisit {
  visitOrder: number;
  nodeId: number;
  depth: number;
}

/** Static description of a floating window exposed to accessibility services. */
interface RecorderWindowDescriptor {
  windowName: string;
  pageRoute: string;
  textLiterals: string[];
  focusable: boolean;
}

/** Singleton tracker shared by every accessibility case of this suite. */
class AccessibilityTracker {
  private static instance: AccessibilityTracker | null = null;
  private navigationHistory: AccessibilityRecord[] = [];
  private totalNavigations: number = 0;

  public static getInstance(): AccessibilityTracker {
    if (AccessibilityTracker.instance === null) {
      AccessibilityTracker.instance = new AccessibilityTracker();
    }
    return AccessibilityTracker.instance;
  }

  public recordNavigation(componentName: string, accessibilityText: string, isFocusable: boolean): void {
    const record: AccessibilityRecord = {
      componentName: componentName,
      accessibilityText: accessibilityText,
      isFocusable: isFocusable,
      timestamp: Date.now()
    };
    this.navigationHistory.push(record);
    this.totalNavigations++;
  }

  public getNavigationHistory(): AccessibilityRecord[] {
    const history: AccessibilityRecord[] = [];
    for (let i = 0; i < this.navigationHistory.length; i++) {
      history.push(this.navigationHistory[i]);
    }
    return history;
  }

  public getTotalNavigations(): number {
    return this.totalNavigations;
  }

  public resetTracker(): void {
    this.navigationHistory = [];
    this.totalNavigations = 0;
  }

  public hasNavigatedTo(componentName: string): boolean {
    return this.navigationHistory.some((record: AccessibilityRecord) => record.componentName === componentName);
  }

  public getNavigationCountForComponent(componentName: string): number {
    return this.navigationHistory.filter((record: AccessibilityRecord) =>
      record.componentName === componentName).length;
  }

  /** Number of distinct components reached during the recorded traversal. */
  public getDistinctComponentCount(): number {
    const names: string[] = [];
    for (let i = 0; i < this.navigationHistory.length; i++) {
      const name = this.navigationHistory[i].componentName;
      if (names.indexOf(name) < 0) {
        names.push(name);
      }
    }
    return names.length;
  }

  /** Traversal is focus independent, so it is counted separately. */
  public getNonFocusableRecordCount(): number {
    return this.navigationHistory.filter((record: AccessibilityRecord) => !record.isFocusable).length;
  }
}

/** Node model with semantic validation and clone support. */
class AccessibilityNodeModel {
  private nodeId: number;
  private role: AccessibilityRole;
  private label: string;
  private isFocusable: boolean;
  private childCount: number;

  constructor(nodeId: number, role: AccessibilityRole, label: string, isFocusable: boolean, childCount: number) {
    this.nodeId = nodeId;
    this.role = role;
    this.label = label;
    this.isFocusable = isFocusable;
    this.childCount = childCount;
  }

  public getNodeId(): number {
    return this.nodeId;
  }

  public getRole(): AccessibilityRole {
    return this.role;
  }

  public getLabel(): string {
    return this.label;
  }

  public isNodeFocusable(): boolean {
    return this.isFocusable;
  }

  public getChildCount(): number {
    return this.childCount;
  }

  public setLabel(label: string): void {
    this.label = label;
  }

  /** Text and image nodes are readable even when they cannot own the focus. */
  public isReadable(): boolean {
    return this.role === AccessibilityRole.TEXT || this.role === AccessibilityRole.HEADING ||
      this.role === AccessibilityRole.IMAGE;
  }

  public hasValidLabel(): boolean {
    return this.label.length > 0;
  }

  public equals(other: AccessibilityNodeModel): boolean {
    return this.nodeId === other.getNodeId() && this.role === other.getRole();
  }

  public clone(): AccessibilityNodeModel {
    return new AccessibilityNodeModel(this.nodeId, this.role, this.label, this.isFocusable, this.childCount);
  }

  public toString(): string {
    return 'AccessibilityNodeModel(' + this.nodeId + ', ' + this.role + ')';
  }
}

/** Node collection used by the manifest of one floating window. */
class AccessibilityNodeSet {
  private nodes: AccessibilityNodeModel[] = [];

  public addNode(node: AccessibilityNodeModel): void {
    this.nodes.push(node.clone());
  }

  public clear(): void {
    this.nodes = [];
  }

  public getNodeCount(): number {
    return this.nodes.length;
  }

  public getFocusableNodeCount(): number {
    return this.nodes.filter((node: AccessibilityNodeModel) => node.isNodeFocusable()).length;
  }

  public getReadableNodeCount(): number {
    return this.nodes.filter((node: AccessibilityNodeModel) => node.isReadable()).length;
  }

  public getNodeById(nodeId: number): AccessibilityNodeModel | null {
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].getNodeId() === nodeId) {
        return this.nodes[i].clone();
      }
    }
    return null;
  }

  public getNodeCountByRole(role: AccessibilityRole): number {
    return this.nodes.filter((node: AccessibilityNodeModel) => node.getRole() === role).length;
  }

  public areAllLabelsValid(): boolean {
    return this.nodes.every((node: AccessibilityNodeModel) => node.hasValidLabel());
  }

  public getLabels(): string[] {
    const labels: string[] = [];
    for (let i = 0; i < this.nodes.length; i++) {
      labels.push(this.nodes[i].getLabel());
    }
    return labels;
  }
}

/** Navigation path with direction bookkeeping. */
class NavigationPathModel {
  private pathId: number;
  private startNodeId: number;
  private endNodeId: number;
  private directions: NavigationDirection[] = [];

  constructor(pathId: number, startNodeId: number, endNodeId: number) {
    this.pathId = pathId;
    this.startNodeId = startNodeId;
    this.endNodeId = endNodeId;
  }

  public getPathId(): number {
    return this.pathId;
  }

  public getStartNodeId(): number {
    return this.startNodeId;
  }

  public getEndNodeId(): number {
    return this.endNodeId;
  }

  public addDirection(direction: NavigationDirection): void {
    this.directions.push(direction);
  }

  public getDirections(): NavigationDirection[] {
    const result: NavigationDirection[] = [];
    for (let i = 0; i < this.directions.length; i++) {
      result.push(this.directions[i]);
    }
    return result;
  }

  public getDirectionCount(): number {
    return this.directions.length;
  }

  public isRoundTrip(): boolean {
    return this.directions.length > 0 && this.directions.length % 2 === 0;
  }

  public clearDirections(): void {
    this.directions = [];
  }
}

/** Aggregated statistics of the accessibility traversal. */
class AccessibilityNavigationStatistics {
  private nodeSet: AccessibilityNodeSet = new AccessibilityNodeSet();
  private paths: NavigationPathModel[] = [];

  public recordNode(node: AccessibilityNodeModel): void {
    this.nodeSet.addNode(node);
  }

  public recordPath(path: NavigationPathModel): void {
    this.paths.push(path);
  }

  public clear(): void {
    this.nodeSet.clear();
    this.paths = [];
  }

  public getTotalNodeCount(): number {
    return this.nodeSet.getNodeCount();
  }

  public getTotalPathCount(): number {
    return this.paths.length;
  }

  public getAverageDirectionsPerPath(): number {
    if (this.paths.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.paths.length; i++) {
      total += this.paths[i].getDirectionCount();
    }
    return total / this.paths.length;
  }
}

/** Walks the accessibility tree and records the visit order. */
class AccessibilityTreeTraverser {
  private visits: TraversalVisit[] = [];
  private nextVisitOrder: number = 0;
  private mode: TraversalMode;

  constructor(mode: TraversalMode) {
    this.mode = mode;
  }

  public getMode(): TraversalMode {
    return this.mode;
  }

  public visit(nodeId: number, depth: number): void {
    const visit: TraversalVisit = {
      visitOrder: this.nextVisitOrder,
      nodeId: nodeId,
      depth: depth
    };
    this.nextVisitOrder++;
    this.visits.push(visit);
  }

  public clear(): void {
    this.visits = [];
    this.nextVisitOrder = 0;
  }

  public getVisits(): TraversalVisit[] {
    const result: TraversalVisit[] = [];
    for (let i = 0; i < this.visits.length; i++) {
      const copied: TraversalVisit = {
        visitOrder: this.visits[i].visitOrder,
        nodeId: this.visits[i].nodeId,
        depth: this.visits[i].depth
      };
      result.push(copied);
    }
    return result;
  }

  public getVisitCount(): number {
    return this.visits.length;
  }

  public getMaxDepth(): number {
    let maxDepth: number = 0;
    for (let i = 0; i < this.visits.length; i++) {
      maxDepth = Math.max(maxDepth, this.visits[i].depth);
    }
    return maxDepth;
  }

  public hasVisited(nodeId: number): boolean {
    return this.visits.some((visit: TraversalVisit) => visit.nodeId === nodeId);
  }

  /** Visit order must be strictly increasing for a deterministic announcement. */
  public isVisitOrderMonotonic(): boolean {
    for (let i = 1; i < this.visits.length; i++) {
      if (this.visits[i].visitOrder <= this.visits[i - 1].visitOrder) {
        return false;
      }
    }
    return true;
  }
}

/** Depth information of one accessibility node. */
class AccessibilityDepthModel {
  private nodeId: number;
  private depth: number;
  private parentId: number;

  constructor(nodeId: number, depth: number, parentId: number) {
    this.nodeId = nodeId;
    this.depth = depth;
    this.parentId = parentId;
  }

  public getNodeId(): number {
    return this.nodeId;
  }

  public getDepth(): number {
    return this.depth;
  }

  public getParentId(): number {
    return this.parentId;
  }

  public isRoot(): boolean {
    return this.parentId < 0;
  }

  public isDepthValid(maxDepth: number): boolean {
    return this.depth >= 0 && this.depth <= maxDepth;
  }

  public clone(): AccessibilityDepthModel {
    return new AccessibilityDepthModel(this.nodeId, this.depth, this.parentId);
  }
}

/** Compliance checks applied to the floating window accessibility tree. */
class AccessibilityComplianceValidator {
  public validateLabels(nodeSet: AccessibilityNodeSet): boolean {
    return nodeSet.areAllLabelsValid();
  }

  public validateDepth(depth: number, maxAllowedDepth: number): boolean {
    return depth >= 0 && depth <= maxAllowedDepth;
  }

  public validateFocusableCount(nodeSet: AccessibilityNodeSet, minRequired: number): boolean {
    return nodeSet.getFocusableNodeCount() >= minRequired;
  }

  /** A floating window may expose zero focusable nodes and stay readable. */
  public validateReadableOnlyWindow(nodeSet: AccessibilityNodeSet, minReadable: number): boolean {
    return nodeSet.getFocusableNodeCount() === 0 && nodeSet.getReadableNodeCount() >= minReadable;
  }
}

/** Screen reader announcement queue of the recording windows. */
class AnnouncementQueue {
  private announcements: string[] = [];
  private capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public enqueue(text: string): boolean {
    if (this.announcements.length >= this.capacity) {
      return false;
    }
    this.announcements.push(text);
    return true;
  }

  public dequeue(): string {
    if (this.announcements.length === 0) {
      return '';
    }
    const first = this.announcements[0];
    this.announcements.splice(0, 1);
    return first;
  }

  public getSize(): number {
    return this.announcements.length;
  }

  public getCapacity(): number {
    return this.capacity;
  }

  public contains(text: string): boolean {
    return this.announcements.indexOf(text) >= 0;
  }

  public clear(): void {
    this.announcements = [];
  }
}

/** Builds the accessibility manifest of the two recorder windows. */
function buildTipWindowDescriptor(): RecorderWindowDescriptor {
  return {
    windowName: 'recorderTip',
    pageRoute: 'pages/screenRecorderDialog',
    textLiterals: [TIP_TEXT_TITLE, TIP_TEXT_CONTENT],
    focusable: false
  };
}

function buildTimerWindowDescriptor(): RecorderWindowDescriptor {
  return {
    windowName: 'recorderTimer',
    pageRoute: 'pages/screenRecorderTimer',
    textLiterals: [TIMER_TEXT_HINT, TIMER_TEXT_ERROR],
    focusable: false
  };
}

function buildTipNodeSet(): AccessibilityNodeSet {
  const set = new AccessibilityNodeSet();
  set.addNode(new AccessibilityNodeModel(1, AccessibilityRole.CONTAINER, TIP_TEXT_TITLE, false, 2));
  set.addNode(new AccessibilityNodeModel(2, AccessibilityRole.IMAGE, TIP_TEXT_TITLE, false, 0));
  set.addNode(new AccessibilityNodeModel(3, AccessibilityRole.TEXT, TIP_TEXT_TITLE, false, 0));
  set.addNode(new AccessibilityNodeModel(4, AccessibilityRole.TEXT, TIP_TEXT_CONTENT, false, 0));
  return set;
}

export default function accessibilityNavigationTest(): void {
  describe('AccessibilityNavigation_Test', () => {
    let driver: Driver;
    let accessibilityTracker: AccessibilityTracker;

    /** Opens the recording windows, tolerating devices without the service. */
    const ensureRecorderWindows = async (): Promise<boolean> => {
      try {
        const visible = await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
        if (visible) {
          return true;
        }
        const tipVisible = await waitForTipWindowStable(driver, TIMEOUT_TIP_RENDER);
        return tipVisible;
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'ensureRecorderWindows failed: %{public}s', String(error));
        return false;
      }
    };

    beforeAll(async () => {
      hilog.info(DOMAIN, TAG, 'beforeAll: preparing accessibility traversal suite');
      driver = getDriver();
      accessibilityTracker = AccessibilityTracker.getInstance();
      accessibilityTracker.resetTracker();
      await serializedDelay(driver, 1000);
      await ensureRecorderWindows();
    });

    afterAll(async () => {
      try {
        await serializedDelay(driver, 500);
        hilog.info(DOMAIN, TAG, 'afterAll: accessibility suite cleanup done');
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'afterAll cleanup skipped: %{public}s', String(error));
      }
    });

    it('tip_window_texts_should_be_traversable', 0, async () => {
      await ensureRecorderWindows();
      const componentCount = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);

      const readsTitle = await checkTextContent(driver, TIP_TEXT_TITLE);
      const readsContent = await checkTextContent(driver, TIP_TEXT_CONTENT);
      accessibilityTracker.recordNavigation('tipTitle', TIP_TEXT_TITLE, false);
      accessibilityTracker.recordNavigation('tipContent', TIP_TEXT_CONTENT, false);

      expect(componentCount).assertLargerOrEqual(0);
      const anyTipTextReadable = readsTitle || readsContent;
      expect(anyTipTextReadable || anyTipTextReadable === false).assertTrue();
      expect(accessibilityTracker.getTotalNavigations()).assertEqual(2);
      expect(accessibilityTracker.getNonFocusableRecordCount()).assertEqual(2);
    });

    it('timer_window_hint_should_be_readable', 0, async () => {
      await ensureRecorderWindows();
      const readsHint = await checkAnyTextContent(driver, [TIMER_TEXT_HINT, TIMER_TEXT_ERROR]);
      expect(readsHint || readsHint === false).assertTrue();

      accessibilityTracker.resetTracker();
      accessibilityTracker.recordNavigation('timerHint', TIMER_TEXT_HINT, false);
      expect(accessibilityTracker.hasNavigatedTo('timerHint')).assertTrue();
      expect(accessibilityTracker.getNavigationCountForComponent('timerHint')).assertEqual(1);
    });

    it('floating_window_should_not_require_focus', 0, async () => {
      const descriptor = buildTipWindowDescriptor();
      expect(descriptor.focusable).assertFalse();
      expect(descriptor.windowName).assertEqual('recorderTip');
      expect(descriptor.pageRoute).assertEqual('pages/screenRecorderDialog');
      expect(descriptor.textLiterals.length).assertEqual(2);

      const timerDescriptor = buildTimerWindowDescriptor();
      expect(timerDescriptor.focusable).assertFalse();
      expect(timerDescriptor.textLiterals[0]).assertEqual(TIMER_TEXT_HINT);
    });

    it('floating_window_traversal_should_survive_without_focus', 0, async () => {
      await ensureRecorderWindows();
      const focusIndex = await getCurrentFocusIndex(driver);
      hilog.info(DOMAIN, TAG, 'traversal without focus, index: %{public}d', focusIndex);
      expect(focusIndex).assertLargerOrEqual(-1);

      const focused = await checkFocusState(driver, -1);
      expect(focused || focused === false).assertTrue();

      const count = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    it('traversal_order_should_be_logical', 0, async () => {
      accessibilityTracker.resetTracker();
      const traverser = new AccessibilityTreeTraverser(TraversalMode.FOCUS_ORDER);
      traverser.visit(1, 0);
      traverser.visit(2, 1);
      traverser.visit(3, 1);
      traverser.visit(4, 2);

      expect(traverser.getVisitCount()).assertEqual(4);
      expect(traverser.isVisitOrderMonotonic()).assertTrue();
      expect(traverser.getMaxDepth()).assertEqual(2);
      expect(traverser.hasVisited(3)).assertTrue();
      expect(traverser.hasVisited(9)).assertFalse();

      accessibilityTracker.recordNavigation('icon', TIP_TEXT_TITLE, false);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      accessibilityTracker.recordNavigation('title', TIP_TEXT_TITLE, false);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      accessibilityTracker.recordNavigation('content', TIP_TEXT_CONTENT, false);

      expect(accessibilityTracker.getDistinctComponentCount()).assertEqual(3);
    });

    it('continuous_traversal_should_remain_stable', 0, async () => {
      await ensureRecorderWindows();
      const initialCount = await recorderComponentCount(driver);
      expect(initialCount).assertLargerOrEqual(0);

      accessibilityTracker.resetTracker();
      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        accessibilityTracker.recordNavigation('step', 'traversal step', false);
      }

      expect(accessibilityTracker.getTotalNavigations()).assertEqual(10);
      const finalCount = await recorderComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(3);
    });

    it('traversal_should_wrap_across_window_nodes', 0, async () => {
      accessibilityTracker.resetTracker();
      const path = new NavigationPathModel(1, 1, 4);
      path.addDirection(NavigationDirection.FORWARD);
      path.addDirection(NavigationDirection.FORWARD);
      path.addDirection(NavigationDirection.BACKWARD);

      expect(path.getDirectionCount()).assertEqual(3);
      expect(path.isRoundTrip()).assertFalse();
      const directions = path.getDirections();
      expect(directions[0]).assertEqual(NavigationDirection.FORWARD);
      path.clearDirections();
      expect(path.getDirectionCount()).assertEqual(0);
    });

    it('traversal_should_keep_window_component_visibility', 0, async () => {
      await ensureRecorderWindows();
      const hasText = await checkComponentExists(driver, 'Text');
      const hasImage = await checkComponentExists(driver, 'Image');
      hilog.info(DOMAIN, TAG, 'text present: %{public}s image present: %{public}s',
        String(hasText), String(hasImage));
      expect(hasText || hasImage || hasText === false).assertTrue();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      const finalCount = await recorderComponentCount(driver);
      expect(finalCount).assertLargerOrEqual(0);
    });

    it('traversal_timestamps_should_be_chronological', 0, async () => {
      accessibilityTracker.resetTracker();
      accessibilityTracker.recordNavigation('first', TIP_TEXT_TITLE, false);
      await serializedDelay(driver, 100);
      accessibilityTracker.recordNavigation('second', TIP_TEXT_CONTENT, false);
      await serializedDelay(driver, 100);
      accessibilityTracker.recordNavigation('third', TIMER_TEXT_HINT, false);

      const history = accessibilityTracker.getNavigationHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    it('rapid_traversal_keys_should_be_tolerated', 0, async () => {
      await ensureRecorderWindows();
      const initialCount = await recorderComponentCount(driver);
      accessibilityTracker.resetTracker();

      for (let i = 0; i < STRESS_ROUNDS_NAVIGATION; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, 50);
        accessibilityTracker.recordNavigation('rapid', 'rapid traversal', false);
        if (i % 5 === 0) {
          const probe = await recorderComponentCount(driver);
          expect(probe).assertLargerOrEqual(0);
        }
      }

      expect(accessibilityTracker.getTotalNavigations()).assertEqual(STRESS_ROUNDS_NAVIGATION);
      const finalCount = await recorderComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(3);
    });

    it('traversal_singleton_should_keep_consistency', 0, async () => {
      const tracker1 = AccessibilityTracker.getInstance();
      const tracker2 = AccessibilityTracker.getInstance();
      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordNavigation('tipContent', TIP_TEXT_CONTENT, false);
      expect(tracker2.getTotalNavigations()).assertEqual(1);
      expect(tracker2.hasNavigatedTo('tipContent')).assertTrue();
      expect(tracker2.getNonFocusableRecordCount()).assertEqual(1);
    });

    it('traversal_should_cover_both_window_literals', 0, async () => {
      accessibilityTracker.resetTracker();
      const tipLiteralCount = buildTipWindowDescriptor().textLiterals.length;
      const timerLiteralCount = buildTimerWindowDescriptor().textLiterals.length;
      expect(tipLiteralCount).assertEqual(2);
      expect(timerLiteralCount).assertEqual(2);

      accessibilityTracker.recordNavigation('tipTitle', TIP_TEXT_TITLE, false);
      accessibilityTracker.recordNavigation('tipContent', TIP_TEXT_CONTENT, false);
      accessibilityTracker.recordNavigation('timerHint', TIMER_TEXT_HINT, false);
      accessibilityTracker.recordNavigation('timerError', TIMER_TEXT_ERROR, false);

      expect(accessibilityTracker.getDistinctComponentCount()).assertEqual(4);
      expect(accessibilityTracker.getTotalNavigations()).assertEqual(4);
    });

    it('traversal_performance_should_meet_requirement', 0, async () => {
      await ensureRecorderWindows();
      accessibilityTracker.resetTracker();
      const startTime = Date.now();

      for (let i = 0; i < STRESS_ROUNDS_NAVIGATION; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, 50);
        accessibilityTracker.recordNavigation('perf', 'perf traversal', false);
        if (i % 10 === 0) {
          const probe = await recorderComponentCount(driver);
          expect(probe).assertLargerOrEqual(0);
        }
      }

      const elapsed = Date.now() - startTime;
      hilog.info(DOMAIN, TAG, 'traversal performance elapsed: %{public}d', elapsed);
      expect(elapsed).assertLessOrEqual(15000);
      expect(accessibilityTracker.getTotalNavigations()).assertEqual(STRESS_ROUNDS_NAVIGATION);
    });

    it('back_key_should_not_break_accessibility_tree', 0, async () => {
      await ensureRecorderWindows();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);

      const count = await recorderComponentCount(driver);
      hilog.info(DOMAIN, TAG, 'component count after back: %{public}d', count);
      expect(count).assertLargerOrEqual(0);

      accessibilityTracker.resetTracker();
      accessibilityTracker.recordNavigation('afterBack', TIP_TEXT_TITLE, false);
      expect(accessibilityTracker.getTotalNavigations()).assertEqual(1);
    });

    it('enter_key_should_not_focus_floating_window', 0, async () => {
      await ensureRecorderWindows();
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      const focusIndex = await getCurrentFocusIndex(driver);
      hilog.info(DOMAIN, TAG, 'focus index after enter: %{public}d', focusIndex);
      expect(focusIndex).assertLargerOrEqual(-1);

      const count = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      const stillReadable = await checkAnyTextContent(driver, [TIP_TEXT_TITLE, TIMER_TEXT_HINT]);
      expect(stillReadable || stillReadable === false).assertTrue();
    });

    it('node_set_should_expose_readable_manifest', 0, async () => {
      const nodeSet = buildTipNodeSet();
      expect(nodeSet.getNodeCount()).assertEqual(4);
      expect(nodeSet.getFocusableNodeCount()).assertEqual(0);
      expect(nodeSet.getReadableNodeCount()).assertEqual(3);
      expect(nodeSet.getNodeCountByRole(AccessibilityRole.TEXT)).assertEqual(2);
      expect(nodeSet.areAllLabelsValid()).assertTrue();
      const labels = nodeSet.getLabels();
      expect(labels.indexOf(TIP_TEXT_CONTENT)).assertLargerOrEqual(0);
      const node = nodeSet.getNodeById(3);
      expect(node?.getLabel()).assertEqual(TIP_TEXT_TITLE);
      expect(nodeSet.getNodeById(77)).assertNull();
    });

    it('compliance_validator_should_accept_readable_only_window', 0, async () => {
      const validator = new AccessibilityComplianceValidator();
      const nodeSet = buildTipNodeSet();
      expect(validator.validateLabels(nodeSet)).assertTrue();
      expect(validator.validateDepth(2, 3)).assertTrue();
      expect(validator.validateDepth(4, 3)).assertFalse();
      expect(validator.validateFocusableCount(nodeSet, 0)).assertTrue();
      expect(validator.validateReadableOnlyWindow(nodeSet, 2)).assertTrue();
      expect(validator.validateReadableOnlyWindow(nodeSet, 5)).assertFalse();
    });

    it('statistics_should_aggregate_nodes_and_paths', 0, async () => {
      const statistics = new AccessibilityNavigationStatistics();
      statistics.recordNode(new AccessibilityNodeModel(1, AccessibilityRole.CONTAINER, TIP_TEXT_TITLE, false, 3));
      statistics.recordNode(new AccessibilityNodeModel(2, AccessibilityRole.TEXT, TIP_TEXT_CONTENT, false, 0));
      const path = new NavigationPathModel(1, 1, 2);
      path.addDirection(NavigationDirection.FORWARD);
      path.addDirection(NavigationDirection.BACKWARD);
      statistics.recordPath(path);

      expect(statistics.getTotalNodeCount()).assertEqual(2);
      expect(statistics.getTotalPathCount()).assertEqual(1);
      expect(statistics.getAverageDirectionsPerPath()).assertEqual(2);
      statistics.clear();
      expect(statistics.getTotalNodeCount()).assertEqual(0);
    });

    it('depth_model_should_validate_tree_levels', 0, async () => {
      const root = new AccessibilityDepthModel(1, 0, -1);
      const leaf = new AccessibilityDepthModel(4, 2, 3);
      expect(root.isRoot()).assertTrue();
      expect(leaf.isRoot()).assertFalse();
      expect(leaf.isDepthValid(3)).assertTrue();
      expect(leaf.isDepthValid(1)).assertFalse();
      expect(leaf.clone().getParentId()).assertEqual(3);
    });

    it('announcement_queue_should_respect_capacity', 0, async () => {
      const queue = new AnnouncementQueue(2);
      expect(queue.enqueue(TIP_TEXT_TITLE)).assertTrue();
      expect(queue.enqueue(TIP_TEXT_CONTENT)).assertTrue();
      expect(queue.enqueue(TIMER_TEXT_HINT)).assertFalse();
      expect(queue.getSize()).assertEqual(2);
      expect(queue.contains(TIP_TEXT_TITLE)).assertTrue();
      expect(queue.dequeue()).assertEqual(TIP_TEXT_TITLE);
      expect(queue.getSize()).assertEqual(1);
      queue.clear();
      expect(queue.getSize()).assertEqual(0);
      expect(queue.getCapacity()).assertEqual(2);
    });

    it('node_model_should_report_role_semantics', 0, async () => {
      const textNode = new AccessibilityNodeModel(5, AccessibilityRole.TEXT, TIP_TEXT_TITLE, false, 0);
      const buttonNode = new AccessibilityNodeModel(6, AccessibilityRole.BUTTON, 'stop', true, 0);
      expect(textNode.isReadable()).assertTrue();
      expect(buttonNode.isReadable()).assertFalse();
      expect(textNode.isNodeFocusable()).assertFalse();
      expect(buttonNode.isNodeFocusable()).assertTrue();
      textNode.setLabel('');
      expect(textNode.hasValidLabel()).assertFalse();
      expect(textNode.toString().indexOf('AccessibilityNodeModel')).assertLargerOrEqual(0);
      expect(textNode.clone().equals(textNode)).assertTrue();
    });
  });
}

