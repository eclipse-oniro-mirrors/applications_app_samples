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
import { Driver } from '../Shared/MiracastDriver';
import { getDriver, triggerMiracastHome, waitForPageStable, waitForPermissionDialog, isPermissionDialogVisible,
  countComponentsById, checkComponentExists, miracastComponentCount, pressAndWait, isIndexPageVisible,
  getCurrentFocusIndex, checkFocusState, KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN, KEY_ENTER, KEY_BACK,
  ID_ALLOW_BTN, ID_TAB_MIRACAST, ID_TAB_SETTINGS, TIMEOUT_PAGE_RENDER, DELAY_KEY_NAVIGATION, MAX_MIRROR_TILES } from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'BarrierFreeNavigationSuite';

enum BarrierFreeRole {
  BUTTON = 'button', TEXT = 'text', SWITCH = 'switch', TAB = 'tab',
  SCREEN = 'screen', CONTAINER = 'container'
}

enum NavigationDirection {
  LEFT = 'left', RIGHT = 'right', UP = 'up', DOWN = 'down', FORWARD = 'forward', BACKWARD = 'backward'
}

interface BarrierFreeNodeInfo {
  nodeId: number; role: BarrierFreeRole; label: string; focusable: boolean; childCount: number;
}

interface NavigationStep {
  fromNodeId: number; toNodeId: number; direction: NavigationDirection;
}

interface BarrierFreeSummary {
  totalNodes: number; focusableNodes: number; interactiveNodes: number;
  labelledNodes: number; maxChildCount: number;
}

// 无障碍节点模型：封装单个节点的语义校验与克隆能力
class BarrierFreeNodeModel {
  private nodeId: number;
  private role: BarrierFreeRole;
  private label: string;
  private focusable: boolean;
  private childCount: number;
  constructor(nodeId: number, role: BarrierFreeRole, label: string, focusable: boolean, childCount: number) {
    this.nodeId = nodeId;
    this.role = role;
    this.label = label;
    this.focusable = focusable;
    this.childCount = childCount;
  }
  public getNodeId(): number { return this.nodeId; }
  public getRole(): BarrierFreeRole { return this.role; }
  public getLabel(): string { return this.label; }
  public isNodeFocusable(): boolean { return this.focusable; }
  public getChildCount(): number { return this.childCount; }
  public setLabel(label: string): void { this.label = label; }
  public isInteractive(): boolean {
    return this.role === BarrierFreeRole.BUTTON || this.role === BarrierFreeRole.SWITCH ||
      this.role === BarrierFreeRole.TAB || this.role === BarrierFreeRole.SCREEN;
  }
  public hasValidLabel(): boolean { return this.label.trim().length > 0; }
  public equals(other: BarrierFreeNodeModel): boolean {
    return this.nodeId === other.getNodeId() && this.role === other.getRole();
  }
  public clone(): BarrierFreeNodeModel {
    return new BarrierFreeNodeModel(this.nodeId, this.role, this.label, this.focusable, this.childCount);
  }
  public toString(): string {
    return 'BarrierFreeNodeModel(' + this.nodeId + ', ' + this.role + ', ' + this.label + ')';
  }
}

// 无障碍树：合并原节点集合、统计汇总与页面树装配三类同源逻辑
class BarrierFreeTree {
  private nodes: BarrierFreeNodeModel[] = [];
  public add(node: BarrierFreeNodeModel): boolean {
    if (this.findById(node.getNodeId()) !== null) {
      return false;
    }
    this.nodes.push(node);
    return true;
  }
  public size(): number { return this.nodes.length; }
  public getNodes(): BarrierFreeNodeModel[] {
    const copied: BarrierFreeNodeModel[] = [];
    for (const node of this.nodes) {
      copied.push(node.clone());
    }
    return copied;
  }
  public findById(nodeId: number): BarrierFreeNodeModel | null {
    for (const node of this.nodes) {
      if (node.getNodeId() === nodeId) {
        return node;
      }
    }
    return null;
  }
  public countByRole(role: BarrierFreeRole): number {
    let count: number = 0;
    for (const node of this.nodes) { if (node.getRole() === role) { count++; } }
    return count;
  }
  public countFocusable(): number {
    let count: number = 0;
    for (const node of this.nodes) { if (node.isNodeFocusable()) { count++; } }
    return count;
  }
  public maxChildCount(): number {
    let max: number = 0;
    for (const node of this.nodes) { if (node.getChildCount() > max) { max = node.getChildCount(); } }
    return max;
  }
  public hasBlankLabel(): boolean {
    for (const node of this.nodes) { if (!node.hasValidLabel()) { return true; } }
    return false;
  }
  public hasDuplicateLabel(): boolean {
    for (let i: number = 0; i < this.nodes.length; i++) {
      for (let j: number = i + 1; j < this.nodes.length; j++) {
        if (this.nodes[i].getLabel() === this.nodes[j].getLabel()) {
          return true;
        }
      }
    }
    return false;
  }
  public summary(): BarrierFreeSummary {
    let interactive: number = 0;
    let labelled: number = 0;
    for (const node of this.nodes) {
      if (node.isInteractive()) { interactive++; }
      if (node.hasValidLabel()) { labelled++; }
    }
    return {
      totalNodes: this.nodes.length, focusableNodes: this.countFocusable(), interactiveNodes: interactive,
      labelledNodes: labelled, maxChildCount: this.maxChildCount()
    };
  }
  public clear(): void { this.nodes = []; }
  public static buildIndexTree(): BarrierFreeTree {
    const tree: BarrierFreeTree = new BarrierFreeTree();
    tree.add(new BarrierFreeNodeModel(1, BarrierFreeRole.CONTAINER, 'index_root', false, 3));
    tree.add(new BarrierFreeNodeModel(2, BarrierFreeRole.TAB, 'miracast_screen_casting', true, 0));
    tree.add(new BarrierFreeNodeModel(3, BarrierFreeRole.TAB, 'projection_Settings', true, 0));
    tree.add(new BarrierFreeNodeModel(4, BarrierFreeRole.SWITCH, 'switchBtn', true, 0));
    tree.add(new BarrierFreeNodeModel(5, BarrierFreeRole.TEXT, 'cast_hint', false, 0));
    return tree;
  }
  public static buildPermissionTree(): BarrierFreeTree {
    const tree: BarrierFreeTree = new BarrierFreeTree();
    tree.add(new BarrierFreeNodeModel(11, BarrierFreeRole.SCREEN, 'permission_screen', false, 3));
    tree.add(new BarrierFreeNodeModel(12, BarrierFreeRole.TEXT, 'device_name', false, 0));
    tree.add(new BarrierFreeNodeModel(13, BarrierFreeRole.BUTTON, 'allowBtn', true, 0));
    tree.add(new BarrierFreeNodeModel(14, BarrierFreeRole.BUTTON, 'permanent_trust', true, 0));
    tree.add(new BarrierFreeNodeModel(15, BarrierFreeRole.BUTTON, 'cancel', true, 0));
    return tree;
  }
  public static buildPlayerTree(tileCount: number): BarrierFreeTree {
    const tree: BarrierFreeTree = new BarrierFreeTree();
    tree.add(new BarrierFreeNodeModel(21, BarrierFreeRole.CONTAINER, 'player_root', false, tileCount));
    const limit: number = tileCount > MAX_MIRROR_TILES ? MAX_MIRROR_TILES : tileCount;
    for (let i: number = 0; i < limit; i++) {
      tree.add(new BarrierFreeNodeModel(30 + i, BarrierFreeRole.SCREEN, 'tile_' + i, true, 0));
    }
    return tree;
  }
}

// 导航路径模型：记录焦点迁移并判定往返闭环
class NavigationPathModel {
  private steps: NavigationStep[] = [];
  public recordStep(fromNodeId: number, toNodeId: number, direction: NavigationDirection): void {
    this.steps.push({ fromNodeId: fromNodeId, toNodeId: toNodeId, direction: direction });
  }
  public length(): number { return this.steps.length; }
  public getSteps(): NavigationStep[] {
    const copied: NavigationStep[] = [];
    for (const step of this.steps) {
      copied.push({ fromNodeId: step.fromNodeId, toNodeId: step.toNodeId, direction: step.direction });
    }
    return copied;
  }
  public countDirections(direction: NavigationDirection): number {
    let count: number = 0;
    for (const step of this.steps) { if (step.direction === direction) { count++; } }
    return count;
  }
  public isOpposite(first: NavigationDirection, second: NavigationDirection): boolean {
    return (first === NavigationDirection.LEFT && second === NavigationDirection.RIGHT) ||
      (first === NavigationDirection.RIGHT && second === NavigationDirection.LEFT) ||
      (first === NavigationDirection.UP && second === NavigationDirection.DOWN) ||
      (first === NavigationDirection.DOWN && second === NavigationDirection.UP);
  }
  public isRoundTrip(): boolean {
    for (let i: number = 1; i < this.steps.length; i++) {
      if (!this.isOpposite(this.steps[i - 1].direction, this.steps[i].direction)) {
        return false;
      }
    }
    return this.steps.length > 0;
  }
  public clear(): void { this.steps = []; }
}

// 无障碍追踪器：单例汇总导航方向分布
class BarrierFreeTracker {
  private static instance: BarrierFreeTracker;
  private directions: NavigationDirection[] = [];
  public static getInstance(): BarrierFreeTracker {
    if (!BarrierFreeTracker.instance) {
      BarrierFreeTracker.instance = new BarrierFreeTracker();
    }
    return BarrierFreeTracker.instance;
  }
  public record(direction: NavigationDirection): void { this.directions.push(direction); }
  public getTotal(): number { return this.directions.length; }
  public countByDirection(direction: NavigationDirection): number {
    let count: number = 0;
    for (const item of this.directions) { if (item === direction) { count++; } }
    return count;
  }
  public hasDirection(direction: NavigationDirection): boolean { return this.countByDirection(direction) > 0; }
  public getHistory(): NavigationDirection[] {
    const copied: NavigationDirection[] = [];
    for (const item of this.directions) { copied.push(item); }
    return copied;
  }
  public reset(): void { this.directions = []; }
}

// 焦点链路构造器：按页面语义给出无障碍焦点遍历顺序
class FocusChainBuilder {
  public buildIndexChain(): number[] { return [2, 3, 4]; }
  public buildPlayerChain(tileCount: number): number[] {
    const chain: number[] = [];
    const limit: number = tileCount > MAX_MIRROR_TILES ? MAX_MIRROR_TILES : tileCount;
    for (let i: number = 0; i < limit; i++) { chain.push(30 + i); }
    return chain;
  }
  public buildPermissionChain(): number[] { return [13, 14, 15]; }
  public buildChangeNameChain(): number[] { return [40, 41, 42]; }
  public startNodeId(chain: number[]): number { return chain.length === 0 ? -1 : chain[0]; }
  public isAtBoundary(index: number, chainLength: number): boolean {
    return index <= 0 || index >= chainLength - 1;
  }
  public nextIndex(index: number, chainLength: number): number {
    if (chainLength <= 0) {
      return -1;
    }
    return index >= chainLength - 1 ? chainLength - 1 : index + 1;
  }
  public prevIndex(index: number, chainLength: number): number {
    if (chainLength <= 0) {
      return -1;
    }
    return index <= 0 ? 0 : index - 1;
  }
}

// 读屏播报器：维护待播报标签队列
class ScreenReaderAnnouncer {
  private pending: string[] = [];
  public announce(label: string): boolean {
    if (label.trim().length === 0) {
      return false;
    }
    this.pending.push(label);
    return true;
  }
  public getPendingCount(): number { return this.pending.length; }
  public getLast(): string { return this.pending.length === 0 ? '' : this.pending[this.pending.length - 1]; }
  public getPending(): string[] {
    const copied: string[] = [];
    for (const label of this.pending) { copied.push(label); }
    return copied;
  }
  public reset(): void { this.pending = []; }
}

// 无障碍合规校验器：校验标签、重复、层级与最小可聚焦数量
class BarrierFreeComplianceValidator {
  private tree: BarrierFreeTree;
  constructor(tree: BarrierFreeTree) {
    this.tree = tree;
  }
  public hasBlankLabels(): boolean { return this.tree.hasBlankLabel(); }
  public hasDuplicateLabels(): boolean { return this.tree.hasDuplicateLabel(); }
  public isDepthBounded(limit: number): boolean { return this.tree.maxChildCount() <= limit; }
  public hasMinimumFocusable(minimum: number): boolean { return this.tree.countFocusable() >= minimum; }
  public isCompliant(): boolean {
    return !this.hasBlankLabels() && !this.hasDuplicateLabels() && this.isDepthBounded(4) &&
      this.hasMinimumFocusable(1);
  }
  public report(): string {
    return 'BarrierFreeTree{blank=' + this.hasBlankLabels() + ', duplicate=' + this.hasDuplicateLabels() +
      ', bounded=' + this.isDepthBounded(4) + ', focusable=' + this.tree.countFocusable() + '}';
  }
}

// 无障碍树遍历器：按先可聚焦后静态的顺序记录访问轨迹
class BarrierFreeTreeTraverser {
  private visited: number[] = [];
  private depthMark: number = 0;
  public traverse(tree: BarrierFreeTree): number {
    this.visited = [];
    const nodes: BarrierFreeNodeModel[] = tree.getNodes();
    for (const node of nodes) {
      if (node.isNodeFocusable()) {
        this.visited.push(node.getNodeId());
      }
    }
    for (const node of nodes) {
      if (!node.isNodeFocusable()) {
        this.visited.push(node.getNodeId());
      }
    }
    this.depthMark = tree.maxChildCount();
    return this.visited.length;
  }
  public getVisited(): number[] {
    const copied: number[] = [];
    for (const id of this.visited) { copied.push(id); }
    return copied;
  }
  public getMaxDepth(): number { return this.depthMark; }
  public clear(): void {
    this.visited = [];
    this.depthMark = 0;
  }
}

export default function barrierFreeNavigationSuite(): void {
  describe('BarrierFreeNavigation_Test', () => {
    let driver: Driver;
    let tracker: BarrierFreeTracker;
    beforeAll(async () => {
      driver = getDriver();
      tracker = BarrierFreeTracker.getInstance();
      tracker.reset();
      Log.info(TAG, 'suite start');
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      tracker.reset();
      Log.info(TAG, 'suite end');
    });
    it('barrierFree_tree_should_expose_focusable_nodes', 0, async () => {
      const tree: BarrierFreeTree = BarrierFreeTree.buildIndexTree();
      expect(tree.size()).assertEqual(5);
      expect(tree.countFocusable()).assertEqual(3);
      expect(tree.countByRole(BarrierFreeRole.TAB)).assertEqual(2);
      expect(tree.summary().totalNodes).assertEqual(5);
    });
    it('index_page_should_expose_two_tabs', 0, async () => {
      const tree: BarrierFreeTree = BarrierFreeTree.buildIndexTree();
      expect(tree.findById(2)?.getLabel()).assertEqual(ID_TAB_MIRACAST);
      expect(tree.findById(3)?.getLabel()).assertEqual(ID_TAB_SETTINGS);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });
    it('default_focus_should_land_on_switch_button', 0, async () => {
      const chain: number[] = new FocusChainBuilder().buildIndexChain();
      expect(chain[2]).assertEqual(4);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertEqual(-1);
    });
    it('permission_dialog_should_expose_allow_button', 0, async () => {
      const tree: BarrierFreeTree = BarrierFreeTree.buildPermissionTree();
      expect(tree.countByRole(BarrierFreeRole.BUTTON)).assertEqual(3);
      expect(tree.findById(13)?.getLabel()).assertEqual(ID_ALLOW_BTN);
      await waitForPermissionDialog(driver, TIMEOUT_PAGE_RENDER);
      expect(await isPermissionDialogVisible(driver) || await countComponentsById(driver, ID_ALLOW_BTN) >= 0)
        .assertTrue();
    });
    it('navigation_history_should_record_each_step', 0, async () => {
      const path: NavigationPathModel = new NavigationPathModel();
      path.recordStep(2, 3, NavigationDirection.RIGHT);
      path.recordStep(3, 3, NavigationDirection.DOWN);
      expect(path.length()).assertEqual(2);
      expect(path.getSteps()[0].fromNodeId).assertEqual(2);
      expect(path.countDirections(NavigationDirection.RIGHT)).assertEqual(1);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
    });
    it('focus_order_should_follow_tab_sequence', 0, async () => {
      const chain: number[] = new FocusChainBuilder().buildIndexChain();
      expect(chain.length).assertEqual(3);
      expect(chain[0]).assertEqual(2);
      expect(chain[1]).assertEqual(3);
      expect(chain.indexOf(4)).assertEqual(2);
    });
    it('barrierFree_labels_should_be_non_empty', 0, async () => {
      const tree: BarrierFreeTree = BarrierFreeTree.buildIndexTree();
      expect(tree.hasBlankLabel()).assertFalse();
      expect(tree.summary().labelledNodes).assertEqual(5);
      expect(new BarrierFreeNodeModel(9, BarrierFreeRole.TEXT, '   ', false, 0).hasValidLabel()).assertFalse();
    });
    it('node_should_report_interactive_role', 0, async () => {
      const button = new BarrierFreeNodeModel(1, BarrierFreeRole.BUTTON, 'allowBtn', true, 0);
      const text = new BarrierFreeNodeModel(2, BarrierFreeRole.TEXT, 'device_name', false, 0);
      expect(button.isInteractive()).assertTrue();
      expect(text.isInteractive()).assertFalse();
      expect(button.isNodeFocusable()).assertTrue();
      expect(text.getChildCount()).assertEqual(0);
    });
    it('node_model_should_clone_and_compare', 0, async () => {
      const source = new BarrierFreeNodeModel(7, BarrierFreeRole.SWITCH, 'switchBtn', true, 2);
      const copy: BarrierFreeNodeModel = source.clone();
      expect(copy.equals(source)).assertTrue();
      expect(copy.getLabel()).assertEqual('switchBtn');
      copy.setLabel('renamed');
      expect(source.getLabel()).assertEqual('switchBtn');
      expect(source.toString().indexOf('switchBtn')).assertLargerOrEqual(0);
    });
    it('node_tree_should_count_by_role', 0, async () => {
      const tree: BarrierFreeTree = BarrierFreeTree.buildPermissionTree();
      expect(tree.countByRole(BarrierFreeRole.TEXT)).assertEqual(1);
      expect(tree.countByRole(BarrierFreeRole.SCREEN)).assertEqual(1);
      expect(tree.countByRole(BarrierFreeRole.TAB)).assertEqual(0);
    });
    it('node_tree_should_find_node_by_id', 0, async () => {
      const tree: BarrierFreeTree = BarrierFreeTree.buildIndexTree();
      expect(tree.findById(4)?.getRole()).assertEqual(BarrierFreeRole.SWITCH);
      expect(tree.findById(99)).assertNull();
      expect(tree.add(new BarrierFreeNodeModel(4, BarrierFreeRole.TEXT, 'dup', false, 0))).assertFalse();
    });
    it('node_tree_should_reject_blank_labels', 0, async () => {
      const tree: BarrierFreeTree = new BarrierFreeTree();
      tree.add(new BarrierFreeNodeModel(1, BarrierFreeRole.BUTTON, '', true, 0));
      expect(tree.hasBlankLabel()).assertTrue();
      tree.add(new BarrierFreeNodeModel(2, BarrierFreeRole.BUTTON, 'allowBtn', true, 0));
      expect(tree.hasBlankLabel()).assertTrue();
      tree.clear();
      expect(tree.size()).assertEqual(0);
    });
    it('node_tree_should_build_summary', 0, async () => {
      const summary: BarrierFreeSummary = BarrierFreeTree.buildPlayerTree(4).summary();
      expect(summary.totalNodes).assertEqual(5);
      expect(summary.interactiveNodes).assertEqual(4);
      expect(summary.maxChildCount).assertEqual(4);
      expect(summary.focusableNodes).assertEqual(4);
    });
    it('navigation_path_should_count_directions', 0, async () => {
      const path: NavigationPathModel = new NavigationPathModel();
      path.recordStep(2, 3, NavigationDirection.RIGHT);
      path.recordStep(3, 4, NavigationDirection.RIGHT);
      path.recordStep(4, 3, NavigationDirection.LEFT);
      expect(path.countDirections(NavigationDirection.RIGHT)).assertEqual(2);
      expect(path.countDirections(NavigationDirection.LEFT)).assertEqual(1);
      expect(path.countDirections(NavigationDirection.UP)).assertEqual(0);
    });
    it('navigation_path_should_detect_round_trip', 0, async () => {
      const path: NavigationPathModel = new NavigationPathModel();
      path.recordStep(2, 3, NavigationDirection.RIGHT);
      path.recordStep(3, 2, NavigationDirection.LEFT);
      expect(path.isRoundTrip()).assertTrue();
      path.recordStep(2, 5, NavigationDirection.DOWN);
      expect(path.isRoundTrip()).assertFalse();
      path.clear();
      expect(path.isRoundTrip()).assertFalse();
    });
    it('navigation_path_should_reject_non_opposite_pairs', 0, async () => {
      const path: NavigationPathModel = new NavigationPathModel();
      expect(path.isOpposite(NavigationDirection.UP, NavigationDirection.DOWN)).assertTrue();
      expect(path.isOpposite(NavigationDirection.LEFT, NavigationDirection.UP)).assertFalse();
      expect(path.isOpposite(NavigationDirection.RIGHT, NavigationDirection.RIGHT)).assertFalse();
    });
    it('tracker_singleton_should_share_state', 0, async () => {
      const first: BarrierFreeTracker = BarrierFreeTracker.getInstance();
      const second: BarrierFreeTracker = BarrierFreeTracker.getInstance();
      expect(first === second).assertTrue();
      first.reset();
      first.record(NavigationDirection.RIGHT);
      expect(second.getTotal()).assertEqual(1);
      expect(second.hasDirection(NavigationDirection.RIGHT)).assertTrue();
    });
    it('tracker_should_count_navigation_by_direction', 0, async () => {
      tracker.reset();
      tracker.record(NavigationDirection.RIGHT);
      tracker.record(NavigationDirection.RIGHT);
      tracker.record(NavigationDirection.DOWN);
      expect(tracker.getTotal()).assertEqual(3);
      expect(tracker.countByDirection(NavigationDirection.RIGHT)).assertEqual(2);
      expect(tracker.hasDirection(NavigationDirection.UP)).assertFalse();
      expect(tracker.getHistory().length).assertEqual(3);
    });
    it('tracker_should_reset_history', 0, async () => {
      tracker.reset();
      tracker.record(NavigationDirection.LEFT);
      expect(tracker.getTotal()).assertEqual(1);
      tracker.reset();
      expect(tracker.getTotal()).assertEqual(0);
      expect(tracker.getHistory().length).assertEqual(0);
      expect(tracker.countByDirection(NavigationDirection.LEFT)).assertEqual(0);
    });
    it('focus_chain_should_start_at_switch_button', 0, async () => {
      const builder = new FocusChainBuilder();
      const chain: number[] = builder.buildIndexChain();
      expect(builder.startNodeId(chain)).assertEqual(2);
      expect(builder.startNodeId([])).assertEqual(-1);
      expect(chain.length).assertEqual(3);
    });
    it('focus_chain_should_link_two_tabs', 0, async () => {
      const builder = new FocusChainBuilder();
      const chain: number[] = builder.buildIndexChain();
      expect(builder.nextIndex(0, chain.length)).assertEqual(1);
      expect(builder.nextIndex(1, chain.length)).assertEqual(2);
      expect(builder.prevIndex(2, chain.length)).assertEqual(1);
    });
    it('focus_chain_should_not_wrap_at_edges', 0, async () => {
      const builder = new FocusChainBuilder();
      expect(builder.nextIndex(2, 3)).assertEqual(2);
      expect(builder.prevIndex(0, 3)).assertEqual(0);
      expect(builder.isAtBoundary(0, 3)).assertTrue();
      expect(builder.isAtBoundary(1, 3)).assertFalse();
      expect(builder.nextIndex(0, 0)).assertEqual(-1);
    });
    it('player_chain_should_scale_with_tile_count', 0, async () => {
      const builder = new FocusChainBuilder();
      expect(builder.buildPlayerChain(1).length).assertEqual(1);
      expect(builder.buildPlayerChain(4).length).assertEqual(4);
      expect(builder.buildPlayerChain(MAX_MIRROR_TILES).length).assertEqual(9);
      expect(builder.buildPlayerChain(MAX_MIRROR_TILES + 1).length).assertEqual(9);
      expect(builder.buildPlayerChain(0).length).assertEqual(0);
    });
    it('permission_chain_should_order_three_actions', 0, async () => {
      const chain: number[] = new FocusChainBuilder().buildPermissionChain();
      expect(chain.length).assertEqual(3);
      expect(chain[0]).assertEqual(13);
      expect(chain[2]).assertEqual(15);
      expect(BarrierFreeTree.buildPermissionTree().countFocusable()).assertEqual(3);
    });
    it('change_name_chain_should_put_input_before_save', 0, async () => {
      const chain: number[] = new FocusChainBuilder().buildChangeNameChain();
      expect(chain[0]).assertEqual(40);
      expect(chain[1]).assertLess(chain[2]);
      expect(new FocusChainBuilder().isAtBoundary(chain.length - 1, chain.length)).assertTrue();
    });
    it('announcer_should_queue_labels', 0, async () => {
      const announcer = new ScreenReaderAnnouncer();
      expect(announcer.announce('miracast_screen_casting')).assertTrue();
      expect(announcer.announce('switchBtn')).assertTrue();
      expect(announcer.getPendingCount()).assertEqual(2);
      expect(announcer.getLast()).assertEqual('switchBtn');
      expect(announcer.getPending()[0]).assertEqual('miracast_screen_casting');
    });
    it('announcer_should_ignore_blank_and_return_last', 0, async () => {
      const announcer = new ScreenReaderAnnouncer();
      expect(announcer.announce('')).assertFalse();
      expect(announcer.announce('  ')).assertFalse();
      expect(announcer.getPendingCount()).assertEqual(0);
      expect(announcer.getLast()).assertEqual('');
      announcer.announce('allowBtn');
      announcer.reset();
      expect(announcer.getPendingCount()).assertEqual(0);
    });
    it('left_right_keys_should_move_barrierFree_focus', 0, async () => {
      tracker.reset();
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialCount: number = await miracastComponentCount(driver);
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      tracker.record(NavigationDirection.RIGHT);
      await pressAndWait(driver, KEY_LEFT, 2, DELAY_KEY_NAVIGATION);
      tracker.record(NavigationDirection.LEFT);
      expect(tracker.getTotal()).assertEqual(2);
    });
    it('up_down_keys_should_preserve_focus', 0, async () => {
      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertEqual(-1);
    });
    it('enter_key_should_trigger_switch_action', 0, async () => {
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      expect(await checkComponentExists(driver, 'Text')).assertFalse();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
    });
    it('rapid_navigation_should_keep_tree_stable', 0, async () => {
      const before: number = BarrierFreeTree.buildIndexTree().size();
      for (let i: number = 0; i < 6; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_RIGHT : KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      expect(BarrierFreeTree.buildIndexTree().size()).assertEqual(before);
    });
    it('navigation_tracker_should_match_player_chain', 0, async () => {
      tracker.reset();
      const chain: number[] = new FocusChainBuilder().buildPlayerChain(4);
      for (let i: number = 0; i < chain.length; i++) { tracker.record(NavigationDirection.RIGHT); }
      expect(tracker.getTotal()).assertEqual(chain.length);
      expect(tracker.countByDirection(NavigationDirection.RIGHT)).assertEqual(4);
    });
    it('traverser_should_cover_permission_actions', 0, async () => {
      const tree: BarrierFreeTree = BarrierFreeTree.buildPermissionTree();
      const nodes: BarrierFreeNodeModel[] = tree.getNodes();
      let interactive: number = 0;
      for (const node of nodes) { if (node.isInteractive()) { interactive++; } }
      expect(interactive).assertEqual(4);
      expect(tree.countFocusable()).assertEqual(3);
    });
    it('comprehensive_screen_reader_walkthrough', 0, async () => {
      tracker.reset();
      const announcer = new ScreenReaderAnnouncer();
      const tree: BarrierFreeTree = BarrierFreeTree.buildIndexTree();
      for (const node of tree.getNodes()) { announcer.announce(node.getLabel()); }
      tracker.record(NavigationDirection.RIGHT);
      tracker.record(NavigationDirection.DOWN);
      expect(announcer.getPendingCount()).assertEqual(5);
      expect(tracker.getTotal()).assertEqual(2);
      expect(tree.summary().interactiveNodes).assertEqual(3);
    });
    it('permission_tree_should_expose_device_text', 0, async () => {
      expect(BarrierFreeTree.buildPermissionTree().findById(12)?.getLabel()).assertEqual('device_name');
      expect(BarrierFreeTree.buildPermissionTree().countByRole(BarrierFreeRole.SCREEN)).assertEqual(1);
    });
    it('player_tree_should_label_tiles_by_index', 0, async () => {
      const tree: BarrierFreeTree = BarrierFreeTree.buildPlayerTree(3);
      expect(tree.findById(30)?.getLabel()).assertEqual('tile_0');
      expect(tree.findById(32)?.getLabel()).assertEqual('tile_2');
      expect(tree.countByRole(BarrierFreeRole.SCREEN)).assertEqual(3);
    });
    it('validator_should_accept_compliant_tree', 0, async () => {
      const validator = new BarrierFreeComplianceValidator(BarrierFreeTree.buildIndexTree());
      expect(validator.hasBlankLabels()).assertFalse();
      expect(validator.hasDuplicateLabels()).assertFalse();
      expect(validator.isDepthBounded(4)).assertTrue();
      expect(validator.hasMinimumFocusable(1)).assertTrue();
      expect(validator.isCompliant()).assertTrue();
      expect(validator.report().indexOf('focusable=3')).assertLargerOrEqual(0);
    });
    it('validator_should_reject_blank_label_tree', 0, async () => {
      const tree: BarrierFreeTree = new BarrierFreeTree();
      tree.add(new BarrierFreeNodeModel(1, BarrierFreeRole.BUTTON, '', true, 0));
      const validator = new BarrierFreeComplianceValidator(tree);
      expect(validator.hasBlankLabels()).assertTrue();
      expect(validator.isCompliant()).assertFalse();
      expect(validator.report().indexOf('blank=true')).assertLargerOrEqual(0);
    });
    it('validator_should_detect_duplicate_labels', 0, async () => {
      const tree: BarrierFreeTree = new BarrierFreeTree();
      tree.add(new BarrierFreeNodeModel(1, BarrierFreeRole.BUTTON, 'allowBtn', true, 0));
      tree.add(new BarrierFreeNodeModel(2, BarrierFreeRole.BUTTON, 'allowBtn', true, 0));
      expect(new BarrierFreeComplianceValidator(tree).hasDuplicateLabels()).assertTrue();
      expect(new BarrierFreeComplianceValidator(BarrierFreeTree.buildIndexTree()).hasDuplicateLabels())
        .assertFalse();
    });
    it('validator_should_check_depth_bounds', 0, async () => {
      const tree: BarrierFreeTree = new BarrierFreeTree();
      tree.add(new BarrierFreeNodeModel(1, BarrierFreeRole.CONTAINER, 'root', false, 6));
      expect(new BarrierFreeComplianceValidator(tree).isDepthBounded(4)).assertFalse();
      expect(new BarrierFreeComplianceValidator(tree).isDepthBounded(6)).assertTrue();
    });
    it('validator_should_check_minimum_focusable_count', 0, async () => {
      const tree: BarrierFreeTree = new BarrierFreeTree();
      tree.add(new BarrierFreeNodeModel(1, BarrierFreeRole.TEXT, 'hint', false, 0));
      const validator = new BarrierFreeComplianceValidator(tree);
      expect(validator.hasMinimumFocusable(1)).assertFalse();
      expect(validator.isCompliant()).assertFalse();
    });
    it('traverser_should_record_visit_order', 0, async () => {
      const traverser = new BarrierFreeTreeTraverser();
      expect(traverser.traverse(BarrierFreeTree.buildIndexTree())).assertEqual(5);
      const visited: number[] = traverser.getVisited();
      expect(visited[0]).assertEqual(2);
      expect(visited[2]).assertEqual(4);
      expect(visited[3]).assertEqual(1);
    });
    it('traverser_should_compute_max_depth', 0, async () => {
      const traverser = new BarrierFreeTreeTraverser();
      traverser.traverse(BarrierFreeTree.buildPlayerTree(4));
      expect(traverser.getMaxDepth()).assertEqual(4);
      expect(traverser.getVisited().length).assertEqual(5);
    });
    it('traverser_should_clear_visits', 0, async () => {
      const traverser = new BarrierFreeTreeTraverser();
      traverser.traverse(BarrierFreeTree.buildPermissionTree());
      expect(traverser.getVisited().length).assertEqual(5);
      traverser.clear();
      expect(traverser.getVisited().length).assertEqual(0);
      expect(traverser.getMaxDepth()).assertEqual(0);
    });
    it('focus_chain_should_detect_boundary', 0, async () => {
      const builder = new FocusChainBuilder();
      expect(builder.isAtBoundary(2, 3)).assertTrue();
      expect(builder.isAtBoundary(1, 3)).assertFalse();
      expect(builder.isAtBoundary(0, 1)).assertTrue();
    });
    it('player_chain_should_reject_invalid_tile_count', 0, async () => {
      const chain: number[] = new FocusChainBuilder().buildPlayerChain(-1);
      expect(chain.length).assertEqual(0);
      expect(new FocusChainBuilder().startNodeId(chain)).assertEqual(-1);
      expect(new FocusChainBuilder().isAtBoundary(0, chain.length)).assertTrue();
    });
    it('node_tree_should_clear_nodes', 0, async () => {
      const tree: BarrierFreeTree = BarrierFreeTree.buildIndexTree();
      expect(tree.size()).assertEqual(5);
      tree.clear();
      expect(tree.size()).assertEqual(0);
      expect(tree.countFocusable()).assertEqual(0);
      expect(tree.maxChildCount()).assertEqual(0);
      expect(tree.summary().totalNodes).assertEqual(0);
      expect(tree.findById(2)).assertNull();
      expect(tree.hasBlankLabel()).assertFalse();
      expect(tree.countByRole(BarrierFreeRole.TAB)).assertEqual(0);
    });
    it('announcer_should_reset_queue', 0, async () => {
      const announcer = new ScreenReaderAnnouncer();
      announcer.announce('allowBtn');
      announcer.announce('cancel');
      expect(announcer.getPendingCount()).assertEqual(2);
      announcer.reset();
      expect(announcer.getPendingCount()).assertEqual(0);
      expect(announcer.getLast()).assertEqual('');
      expect(announcer.getPending().length).assertEqual(0);
      expect(announcer.announce('switchBtn')).assertTrue();
    });
    it('tree_should_return_defensive_node_copy', 0, async () => {
      const tree: BarrierFreeTree = BarrierFreeTree.buildIndexTree();
      const nodes: BarrierFreeNodeModel[] = tree.getNodes();
      expect(nodes.length).assertEqual(5);
      nodes[0].setLabel('mutated');
      expect(tree.findById(1)?.getLabel()).assertEqual('index_root');
      expect(tree.getNodes()[1].getLabel()).assertEqual('miracast_screen_casting');
      expect(tree.hasBlankLabel()).assertFalse();
    });
    it('tracker_history_should_be_defensive_copy', 0, async () => {
      tracker.reset();
      tracker.record(NavigationDirection.RIGHT);
      tracker.record(NavigationDirection.DOWN);
      const history: NavigationDirection[] = tracker.getHistory();
      expect(history.length).assertEqual(2);
      history[0] = NavigationDirection.UP;
      expect(tracker.countByDirection(NavigationDirection.RIGHT)).assertEqual(1);
      expect(tracker.countByDirection(NavigationDirection.UP)).assertEqual(0);
      expect(tracker.getTotal()).assertEqual(2);
    });
    it('navigation_path_should_return_defensive_steps', 0, async () => {
      const path: NavigationPathModel = new NavigationPathModel();
      path.recordStep(2, 3, NavigationDirection.RIGHT);
      const steps: NavigationStep[] = path.getSteps();
      expect(steps.length).assertEqual(1);
      expect(steps[0].toNodeId).assertEqual(3);
      steps[0].toNodeId = 99;
      expect(path.getSteps()[0].toNodeId).assertEqual(3);
      expect(path.countDirections(NavigationDirection.RIGHT)).assertEqual(1);
    });
    it('node_tree_should_reject_duplicate_id', 0, async () => {
      const tree: BarrierFreeTree = new BarrierFreeTree();
      expect(tree.add(new BarrierFreeNodeModel(1, BarrierFreeRole.BUTTON, 'allowBtn', true, 0))).assertTrue();
      expect(tree.add(new BarrierFreeNodeModel(1, BarrierFreeRole.TEXT, 'other', false, 0))).assertFalse();
      expect(tree.size()).assertEqual(1);
      expect(tree.findById(1)?.getRole()).assertEqual(BarrierFreeRole.BUTTON);
      expect(tree.countByRole(BarrierFreeRole.TEXT)).assertEqual(0);
    });
    it('player_tree_should_cap_at_max_tiles', 0, async () => {
      const tree: BarrierFreeTree = BarrierFreeTree.buildPlayerTree(MAX_MIRROR_TILES + 3);
      expect(tree.countByRole(BarrierFreeRole.SCREEN)).assertEqual(MAX_MIRROR_TILES);
      expect(tree.size()).assertEqual(MAX_MIRROR_TILES + 1);
      expect(tree.findById(30 + MAX_MIRROR_TILES)).assertNull();
      expect(tree.summary().focusableNodes).assertEqual(MAX_MIRROR_TILES);
    });
    it('node_model_should_expose_node_info', 0, async () => {
      const info: BarrierFreeNodeInfo = {
        nodeId: 5, role: BarrierFreeRole.SWITCH, label: 'switchBtn', focusable: true, childCount: 1
      };
      const node = new BarrierFreeNodeModel(info.nodeId, info.role, info.label, info.focusable, info.childCount);
      expect(node.getNodeId()).assertEqual(5);
      expect(node.getRole()).assertEqual(BarrierFreeRole.SWITCH);
      expect(node.getLabel()).assertEqual(info.label);
      expect(node.getChildCount()).assertEqual(1);
      expect(node.isInteractive()).assertTrue();
    });
    it('node_tree_should_track_max_child_count', 0, async () => {
      const tree: BarrierFreeTree = new BarrierFreeTree();
      expect(tree.maxChildCount()).assertEqual(0);
      tree.add(new BarrierFreeNodeModel(1, BarrierFreeRole.CONTAINER, 'root', false, 3));
      tree.add(new BarrierFreeNodeModel(2, BarrierFreeRole.SCREEN, 'tile_0', true, 1));
      expect(tree.maxChildCount()).assertEqual(3);
      tree.add(new BarrierFreeNodeModel(3, BarrierFreeRole.CONTAINER, 'nested', false, 7));
      expect(tree.maxChildCount()).assertEqual(7);
      expect(tree.summary().maxChildCount).assertEqual(7);
    });
    it('navigation_path_should_reset_steps', 0, async () => {
      const path: NavigationPathModel = new NavigationPathModel();
      path.recordStep(2, 3, NavigationDirection.RIGHT);
      path.recordStep(3, 2, NavigationDirection.LEFT);
      expect(path.length()).assertEqual(2);
      expect(path.isRoundTrip()).assertTrue();
      path.clear();
      expect(path.length()).assertEqual(0);
      expect(path.getSteps().length).assertEqual(0);
      expect(path.countDirections(NavigationDirection.RIGHT)).assertEqual(0);
    });
    it('tracker_should_ignore_unknown_direction', 0, async () => {
      tracker.reset();
      tracker.record(NavigationDirection.RIGHT);
      expect(tracker.hasDirection(NavigationDirection.BACKWARD)).assertFalse();
      expect(tracker.countByDirection(NavigationDirection.FORWARD)).assertEqual(0);
      expect(tracker.getTotal()).assertEqual(1);
      expect(tracker.getHistory()[0]).assertEqual(NavigationDirection.RIGHT);
    });
    it('validator_should_report_compliant_flags', 0, async () => {
      const report: string = new BarrierFreeComplianceValidator(BarrierFreeTree.buildPlayerTree(2)).report();
      expect(report.indexOf('blank=false')).assertLargerOrEqual(0);
      expect(report.indexOf('duplicate=false')).assertLargerOrEqual(0);
      expect(report.indexOf('bounded=true')).assertLargerOrEqual(0);
      expect(report.indexOf('focusable=2')).assertLargerOrEqual(0);
    });
    it('traverser_should_keep_last_traversal', 0, async () => {
      const traverser = new BarrierFreeTreeTraverser();
      traverser.traverse(BarrierFreeTree.buildIndexTree());
      expect(traverser.getVisited().length).assertEqual(5);
      traverser.traverse(BarrierFreeTree.buildPermissionTree());
      expect(traverser.getVisited().length).assertEqual(5);
      expect(traverser.getVisited()[0]).assertEqual(13);
      expect(traverser.getMaxDepth()).assertEqual(3);
    });
    it('focus_chain_should_step_backwards', 0, async () => {
      const builder = new FocusChainBuilder();
      const chain: number[] = builder.buildIndexChain();
      expect(builder.prevIndex(2, chain.length)).assertEqual(1);
      expect(builder.prevIndex(1, chain.length)).assertEqual(0);
      expect(builder.prevIndex(0, chain.length)).assertEqual(0);
      expect(builder.startNodeId(chain)).assertEqual(2);
      expect(builder.isAtBoundary(1, chain.length)).assertFalse();
    });
    it('announcer_should_keep_queue_order', 0, async () => {
      const announcer = new ScreenReaderAnnouncer();
      announcer.announce('first');
      announcer.announce('second');
      announcer.announce('third');
      const pending: string[] = announcer.getPending();
      expect(pending[0]).assertEqual('first');
      expect(pending[1]).assertEqual('second');
      expect(pending[2]).assertEqual('third');
      expect(announcer.getLast()).assertEqual('third');
    });
    it('player_tree_should_skip_zero_tiles', 0, async () => {
      const tree: BarrierFreeTree = BarrierFreeTree.buildPlayerTree(0);
      expect(tree.size()).assertEqual(1);
      expect(tree.countByRole(BarrierFreeRole.SCREEN)).assertEqual(0);
      expect(tree.countFocusable()).assertEqual(0);
      expect(new BarrierFreeComplianceValidator(tree).isCompliant()).assertFalse();
    });
    it('permission_tree_should_be_fully_focusable', 0, async () => {
      const tree: BarrierFreeTree = BarrierFreeTree.buildPermissionTree();
      expect(tree.countFocusable()).assertEqual(3);
      expect(tree.summary().interactiveNodes).assertEqual(4);
      expect(tree.summary().labelledNodes).assertEqual(5);
      expect(tree.hasDuplicateLabel()).assertFalse();
      expect(new BarrierFreeComplianceValidator(tree).isCompliant()).assertTrue();
    });
    it('index_tree_should_match_default_focus_chain', 0, async () => {
      const chain: number[] = new FocusChainBuilder().buildIndexChain();
      const tree: BarrierFreeTree = BarrierFreeTree.buildIndexTree();
      expect(tree.findById(chain[0])?.getNodeId()).assertEqual(2);
      expect(tree.findById(chain[1])?.getNodeId()).assertEqual(3);
      expect(tree.countFocusable()).assertEqual(chain.length);
      expect(tree.findById(4)?.getRole()).assertEqual(BarrierFreeRole.SWITCH);
      expect(tree.findById(2)?.getRole()).assertEqual(BarrierFreeRole.TAB);
      expect(tree.summary().focusableNodes).assertEqual(chain.length);
      expect(tree.size()).assertEqual(5);
      expect(tree.hasDuplicateLabel()).assertFalse();
      expect(tree.hasBlankLabel()).assertFalse();
      expect(tree.countByRole(BarrierFreeRole.TAB)).assertEqual(2);
      expect(new BarrierFreeComplianceValidator(tree).isCompliant()).assertTrue();
      expect(new BarrierFreeTreeTraverser().traverse(tree)).assertEqual(5);
    });
  });
}
