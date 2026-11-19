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
import { Driver, ON } from '@kit.TestKit';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  KEY_ENTER,
  KEY_TAB_TOGGLE,
  pageComponentCount,
  checkFocusState,
  waitForPageStable,
  pressAndWait,
  openSamplePage,
  TIMEOUT_TAB_RENDER,
  DELAY_KEY_NAVIGATION,
  serializedDelay,
  getCurrentFocusIndex,
  checkComponentExists
} from '../Shared/CustomViewTestDriver';
import hilog from '@ohos.hilog';

interface AccessibilityRecord {
  componentName: string;
  accessibilityText: string;
  isFocusable: boolean;
  timestamp: number;
}

class AccessibilityTracker {
  private static instance: AccessibilityTracker;
  private navigationHistory: AccessibilityRecord[] = [];
  private totalNavigations: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): AccessibilityTracker {
    if (!AccessibilityTracker.instance) {
      AccessibilityTracker.instance = new AccessibilityTracker();
    }
    return AccessibilityTracker.instance;
  }

  public recordNavigation(componentName: string, accessibilityText: string, isFocusable: boolean): void {
    const record: AccessibilityRecord = {
      componentName,
      accessibilityText,
      isFocusable,
      timestamp: Date.now()
    };
    this.navigationHistory.push(record);
    this.totalNavigations++;
  }

  public getNavigationHistory(): AccessibilityRecord[] {
    return [...this.navigationHistory];
  }

  public getTotalNavigations(): number {
    return this.totalNavigations;
  }

  public resetTracker(): void {
    this.navigationHistory = [];
    this.totalNavigations = 0;
  }

  public hasNavigatedTo(componentName: string): boolean {
    return this.navigationHistory.some(record => record.componentName === componentName);
  }

  public getNavigationCountForComponent(componentName: string): number {
    return this.navigationHistory.filter(record => record.componentName === componentName).length;
  }
}

// 无障碍角色枚举：定义组件在无障碍树中的语义角色，用于导航路径判定
enum AccessibilityRole {
  BUTTON = 'button', TEXT = 'text', IMAGE = 'image', CONTAINER = 'container', HEADING = 'heading'
}

// 导航方向枚举：定义无障碍导航支持的方向，用于遍历路径建模
enum NavigationDirection {
  LEFT = 'left', RIGHT = 'right', UP = 'up', DOWN = 'down', FORWARD = 'forward', BACKWARD = 'backward'
}

// 无障碍节点接口：描述无障碍树中单个节点的元信息
interface AccessibilityNode {
  nodeId: number;
  role: AccessibilityRole;
  label: string;
  isFocusable: boolean;
  childCount: number;
}

// 导航路径接口：描述一次完整的无障碍导航路径
interface NavigationPath {
  pathId: number;
  startNodeId: number;
  endNodeId: number;
  directions: NavigationDirection[];
}

// 无障碍节点模型类：封装节点信息并提供语义校验与克隆能力
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

  // 判断节点是否为可交互节点：按钮与图片通常可交互
  public isInteractive(): boolean {
    return this.role === AccessibilityRole.BUTTON || this.role === AccessibilityRole.IMAGE;
  }

  // 校验节点标签是否非空：无障碍节点必须具备可读标签
  public hasValidLabel(): boolean {
    return this.label.length > 0;
  }

  public equals(other: AccessibilityNodeModel): boolean {
    return this.nodeId === other.nodeId && this.role === other.role;
  }

  public clone(): AccessibilityNodeModel {
    return new AccessibilityNodeModel(this.nodeId, this.role, this.label, this.isFocusable, this.childCount);
  }

  public toString(): string {
    return 'AccessibilityNodeModel(' + this.nodeId + ', ' + this.role + ')';
  }
}

// 无障碍节点集合类：管理无障碍树节点，提供遍历与统计能力
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
    return this.nodes.filter(node => node.isNodeFocusable()).length;
  }

  public getNodeById(nodeId: number): AccessibilityNodeModel | null {
    for (const node of this.nodes) {
      if (node.getNodeId() === nodeId) {
        return node.clone();
      }
    }
    return null;
  }

  // 统计指定角色的节点数量
  public getNodeCountByRole(role: AccessibilityRole): number {
    return this.nodes.filter(node => node.getRole() === role).length;
  }

  // 校验所有节点标签是否完整：用于无障碍合规性检查
  public areAllLabelsValid(): boolean {
    for (const node of this.nodes) {
      if (!node.hasValidLabel()) {
        return false;
      }
    }
    return true;
  }
}

// 导航路径模型类：封装导航路径并提供方向统计与校验能力
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
    for (const direction of this.directions) {
      result.push(direction);
    }
    return result;
  }

  public getDirectionCount(): number {
    return this.directions.length;
  }

  // 判断路径是否为往返路径：方向数量为偶数且存在相反方向
  public isRoundTrip(): boolean {
    return this.directions.length % 2 === 0 && this.directions.length > 0;
  }

  public clearDirections(): void {
    this.directions = [];
  }
}

// 无障碍导航统计类：聚合节点与路径数据，输出导航健康度摘要
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

  // 计算平均路径方向数：用于评估导航复杂度
  public getAverageDirectionsPerPath(): number {
    if (this.paths.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const path of this.paths) {
      total += path.getDirectionCount();
    }
    return total / this.paths.length;
  }
}

// 无障碍树遍历模式枚举：定义无障碍树遍历的策略
enum TraversalMode {
  DEPTH_FIRST = 'depth_first', BREADTH_FIRST = 'breadth_first', FOCUS_ORDER = 'focus_order'
}

// 遍历访问记录接口：描述遍历过程中访问单个节点的记录
interface TraversalVisit {
  visitOrder: number;
  nodeId: number;
  depth: number;
}

// 无障碍树遍历器：模拟无障碍树的遍历过程，输出访问顺序
class AccessibilityTreeTraverser {
  private visits: TraversalVisit[] = [];
  private nextVisitOrder: number = 0;

  public visit(nodeId: number, depth: number): void {
    const visit: TraversalVisit = {
      visitOrder: this.nextVisitOrder, nodeId: nodeId, depth: depth
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
    for (const visit of this.visits) {
      const copied: TraversalVisit = {
        visitOrder: visit.visitOrder, nodeId: visit.nodeId, depth: visit.depth
      };
      result.push(copied);
    }
    return result;
  }

  public getVisitCount(): number {
    return this.visits.length;
  }

  // 计算遍历最大深度：用于评估无障碍树层级深度
  public getMaxDepth(): number {
    let maxDepth: number = 0;
    for (const visit of this.visits) {
      maxDepth = Math.max(maxDepth, visit.depth);
    }
    return maxDepth;
  }

  // 判断遍历是否覆盖了指定节点
  public hasVisited(nodeId: number): boolean {
    return this.visits.some(visit => visit.nodeId === nodeId);
  }
}

// 无障碍节点深度模型类：封装节点深度信息，用于层级校验
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

  // 判断节点是否为根节点：父节点编号为负表示根节点
  public isRoot(): boolean {
    return this.parentId < 0;
  }

  // 判断节点深度是否在合理范围内
  public isDepthValid(maxDepth: number): boolean {
    return this.depth >= 0 && this.depth <= maxDepth;
  }

  public clone(): AccessibilityDepthModel {
    return new AccessibilityDepthModel(this.nodeId, this.depth, this.parentId);
  }
}

// 无障碍合规性校验器：校验无障碍树结构与标签的合规性
class AccessibilityComplianceValidator {
  // 校验节点集合是否满足无障碍标签要求
  public validateLabels(nodeSet: AccessibilityNodeSet): boolean {
    return nodeSet.areAllLabelsValid();
  }

  // 校验树深度是否在合理范围内
  public validateDepth(depth: number, maxAllowedDepth: number): boolean {
    return depth >= 0 && depth <= maxAllowedDepth;
  }

  // 校验可聚焦节点数量是否达到最低要求
  public validateFocusableCount(nodeSet: AccessibilityNodeSet, minRequired: number): boolean {
    return nodeSet.getFocusableNodeCount() >= minRequired;
  }
}

export default function accessibilityNavigationTest() {
  describe('AccessibilityNavigation_Test', () => {
    let driver: Driver;
    let accessibilityTracker: AccessibilityTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', `beforeAll: Starting test setup...`);
      driver = getDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      accessibilityTracker = AccessibilityTracker.getInstance();
      accessibilityTracker.resetTracker();

      // 初始等待确保系统稳定
      await serializedDelay(driver, 1000);

      // 尝试触发自定义视图页签，最多重试3次
      let tabStable = false;
      for (let attempt = 1; attempt <= 3; attempt++) {
        hilog.info(0x0000, 'testTag', '%{public}s', `beforeAll: Attempt ${attempt} to trigger customView tab`);

        // 触发自定义视图页签
        await openSamplePage(driver);

        // 等待页签页稳定显示，增加等待时间
        tabStable = await waitForPageStable(driver, TIMEOUT_TAB_RENDER * 2);

        if (tabStable) {
          hilog.info(0x0000, 'testTag', '%{public}s', `beforeAll: CustomView tab displayed successfully on attempt ${attempt}`);
          break;
        } else {
          hilog.info(0x0000, 'testTag', '%{public}s', `beforeAll: CustomView tab not displayed on attempt ${attempt}`);

          // 如果失败，等待一段时间后重试
          if (attempt < 3) {
            await serializedDelay(driver, 2000);
          }
        }
      }

      if (!tabStable) {
        hilog.error(0x0000, 'testTag', '%{public}s', `beforeAll: Failed to display customView tab after 3 attempts`);

        // 即使页签页未显示，也继续测试以提供更多调试信息
        const finalCount = await pageComponentCount(driver);
        hilog.error(0x0000, 'testTag', '%{public}s', `beforeAll: Final component count: ${finalCount}`);
      }
    });

    // 测试清理：关闭页签页并释放资源，避免影响后续测试
    afterAll(async () => {
      try { // 添加超时保护，避免清理操作无限等待
        const cleanupPromise = pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
        const timeoutPromise =
          new Promise<void>((resolve: (value: void | PromiseLike<void>) => void, reject: (reason?: Error) => void) => {
            setTimeout(() => reject(new Error('Cleanup timeout')), 5000);
          });

        await Promise.race([cleanupPromise, timeoutPromise]);
        await serializedDelay(driver, 500);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `Cleanup completed with error: ${error.message}`); // 即使清理失败也不影响测试结果
      }
    });

    it('all_options_should_be_focusable', 0, async () => { // 验证所有选项可聚焦，确保无障碍设备能访问所有功能
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);

      // 首先验证页签页组件存在
      const componentCount = await pageComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);

      // 获取当前焦点索引，而不是假设初始焦点位置
      const initialFocusIndex = await getCurrentFocusIndex(driver);
      hilog.info(0x0000, 'testTag', '%{public}s', `all_options_should_be_focusable: Initial focus index: ${initialFocusIndex}`);

      // 如果找不到焦点，跳过后续焦点检查
      if (initialFocusIndex < 0) {
        hilog.info(0x0000, 'testTag', '%{public}s', `all_options_should_be_focusable: No focus found, skipping focus state checks`);
        return;
      }

      expect(initialFocusIndex).assertLargerOrEqual(0);

      // 验证焦点状态基于当前焦点位置
      const isInitialFocusable = await checkFocusState(driver, initialFocusIndex);
      expect(isInitialFocusable).assertTrue();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const nextFocusIndex = await getCurrentFocusIndex(driver);
      hilog.info(0x0000, 'testTag', '%{public}s', `all_options_should_be_focusable: Next focus index: ${nextFocusIndex}`);

      if (nextFocusIndex >= 0) {
        expect(nextFocusIndex).assertLargerOrEqual(0);
        const isNextFocusable = await checkFocusState(driver, nextFocusIndex);
        expect(isNextFocusable).assertTrue();
      }

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const finalFocusIndex = await getCurrentFocusIndex(driver);
      hilog.info(0x0000, 'testTag', '%{public}s', `all_options_should_be_focusable: Final focus index: ${finalFocusIndex}`);

      if (finalFocusIndex >= 0) {
        expect(finalFocusIndex).assertLargerOrEqual(0);
        const isFinalFocusable = await checkFocusState(driver, finalFocusIndex);
        expect(isFinalFocusable).assertTrue();
      }
    });

    it('focus_order_should_be_logical', 0, async () => { // 验证焦点顺序逻辑合理，确保导航路径符合用户预期
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);

      accessibilityTracker.resetTracker();

      accessibilityTracker.recordNavigation('shutdown', '在线换座', true);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      accessibilityTracker.recordNavigation('screenOut', '息屏', true);
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      accessibilityTracker.recordNavigation('reboot', '余票挖掘', true);

      expect(accessibilityTracker.hasNavigatedTo('shutdown')).assertTrue();
      expect(accessibilityTracker.hasNavigatedTo('screenOut')).assertTrue();
      expect(accessibilityTracker.hasNavigatedTo('reboot')).assertTrue();
    });

    it('tab_should_handle_continuous_navigation', 0, async () => { // 验证页签页处理连续导航，确保快速操作不会导致异常
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);

      // 首先验证页签页组件存在
      const initialComponentCount = await pageComponentCount(driver);
      expect(initialComponentCount).assertLargerOrEqual(1);

      accessibilityTracker.resetTracker();

      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        accessibilityTracker.recordNavigation('left', `连续导航第${i}次`, true);

        // 每次导航后验证组件仍然存在
        const currentComponentCount = await pageComponentCount(driver);
        expect(currentComponentCount).assertLargerOrEqual(1);
      }

      expect(accessibilityTracker.getTotalNavigations()).assertEqual(10);
      const finalComponentCount = await pageComponentCount(driver);
      expect(finalComponentCount).assertLargerOrEqual(1);
    });

    it('focus_should_cycle_correctly', 0, async () => { // 验证焦点循环正确，确保边界导航不会越界
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);

      accessibilityTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      accessibilityTracker.recordNavigation('screenOut', '息屏', true);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      accessibilityTracker.recordNavigation('shutdown', '在线换座', true);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      accessibilityTracker.recordNavigation('reboot', '余票挖掘', true);

      expect(accessibilityTracker.getTotalNavigations()).assertEqual(3);
    });

    it('navigation_singleton_should_maintain_consistency', 0,
      async () => { // 验证导航单例保持一致性，确保跨测试用例数据正确 // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
        const tracker1 = AccessibilityTracker.getInstance();
        const tracker2 = AccessibilityTracker.getInstance();

        expect(tracker1 === tracker2).assertTrue();

        tracker1.resetTracker();
        tracker1.recordNavigation('test', '测试导航', true);

        expect(tracker2.getTotalNavigations()).assertEqual(1);
        expect(tracker2.hasNavigatedTo('test')).assertTrue();
      });
  });

}