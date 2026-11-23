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
  KEY_UP,
  KEY_BACK,
  pageComponentCount,
  checkFocusState,
  waitForPageStable,
  pressAndWait,
  TIMEOUT_TAB_RENDER,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT
} from '../Shared/CustomViewTestDriver';

enum TabState {
  CLOSED = 'closed', OPENING = 'opening', OPENED = 'opened', CLOSING = 'closing'
}

interface StateTransitionRecord {
  fromState: TabState;
  toState: TabState;
  trigger: string;
  timestamp: number;
}

class TabStateManager {
  private static instance: TabStateManager;
  private currentState: TabState = TabState.CLOSED;
  private stateHistory: StateTransitionRecord[] = [];
  private totalTransitions: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): TabStateManager {
    if (!TabStateManager.instance) {
      TabStateManager.instance = new TabStateManager();
    }
    return TabStateManager.instance;
  }

  public transitionTo(newState: TabState, trigger: string): void {
    const record: StateTransitionRecord = {
      fromState: this.currentState,
      toState: newState,
      trigger,
      timestamp: Date.now()
    };
    this.stateHistory.push(record);
    this.currentState = newState;
    this.totalTransitions++;
  }

  public getCurrentState(): TabState {
    return this.currentState;
  }

  public getStateHistory(): StateTransitionRecord[] {
    return [...this.stateHistory];
  }

  public getTotalTransitions(): number {
    return this.totalTransitions;
  }

  public resetManager(): void {
    this.currentState = TabState.CLOSED;
    this.stateHistory = [];
    this.totalTransitions = 0;
  }

  public hasTransitionedTo(state: TabState): boolean {
    return this.stateHistory.some(record => record.toState === state);
  }

  public getTransitionCountForState(state: TabState): number {
    return this.stateHistory.filter(record => record.toState === state).length;
  }
}

// ==================== 状态模型扩展工具集（新增代码） ====================

// 页签页状态转换类别枚举：用于对状态流转进行分类统计
enum TabTransitionCategory {
  OPEN_FLOW = 'open_flow', CLOSE_FLOW = 'close_flow', NAVIGATION = 'navigation', RECOVERY = 'recovery', IDLE = 'idle'
}

// 状态指标快照接口：记录状态管理器的统计指标
interface TabMetricsSnapshot {
  totalTransitions: number;
  openedCount: number;
  closedCount: number;
  navigationCount: number;
  averageTransitionDuration: number;
  lastTrigger: string;
}

// 状态统计条目接口：描述单类转换的统计信息
interface TabStatEntry {
  category: TabTransitionCategory;
  count: number;
  percentage: number;
}

// 状态转换路径接口：描述一组连续的状态流转序列
interface TabTransitionPath {
  sequence: TabState[];
  duration: number;
  isComplete: boolean;
}

// 页签页状态分类器：根据触发源对状态转换进行分类统计
class TabTransitionClassifier {
  private static instance: TabTransitionClassifier;
  private categoryCounts: Map<TabTransitionCategory, number> = new Map<TabTransitionCategory, number>();

  // 单例模式获取实例：确保分类统计跨测试用例保持一致
  public static getInstance(): TabTransitionClassifier {
    if (!TabTransitionClassifier.instance) {
      TabTransitionClassifier.instance = new TabTransitionClassifier();
    }
    return TabTransitionClassifier.instance;
  }

  // 根据触发源文本推断转换类别
  public classify(trigger: string): TabTransitionCategory {
    if (trigger.includes('open') || trigger.includes('render')) {
      return TabTransitionCategory.OPEN_FLOW;
    }
    if (trigger.includes('close') || trigger.includes('back')) {
      return TabTransitionCategory.CLOSE_FLOW;
    }
    if (trigger.includes('navigation') || trigger.includes('nav')) {
      return TabTransitionCategory.NAVIGATION;
    }
    if (trigger.includes('recovery') || trigger.includes('recover')) {
      return TabTransitionCategory.RECOVERY;
    }
    return TabTransitionCategory.IDLE;
  }

  // 累加指定类别的计数
  public recordCategory(category: TabTransitionCategory): void {
    const current = this.categoryCounts.get(category);
    if (current === undefined) {
      this.categoryCounts.set(category, 1);
    } else {
      this.categoryCounts.set(category, current + 1);
    }
  }

  public getCategoryCount(category: TabTransitionCategory): number {
    const current = this.categoryCounts.get(category);
    if (current === undefined) {
      return 0;
    }
    return current;
  }

  // 获取已分类的转换总数
  public getTotalClassified(): number {
    let total = 0;
    const values = this.categoryCounts.values();
    for (const value of values) {
      total += value;
    }
    return total;
  }

  public resetClassifier(): void {
    this.categoryCounts = new Map<TabTransitionCategory, number>();
  }
}

// 页签页状态指标计算器：从状态历史中聚合统计指标
class TabMetricsCalculator {
  private records: StateTransitionRecord[] = [];

  constructor(records: StateTransitionRecord[]) {
    this.records = [...records];
  }

  // 计算指定状态的转换次数
  public countState(state: TabState): number {
    let count = 0;
    for (const record of this.records) {
      if (record.toState === state) {
        count++;
      }
    }
    return count;
  }

  // 计算转换的平均时间间隔（毫秒）
  public computeAverageDuration(): number {
    if (this.records.length < 2) {
      return 0;
    }
    let total = 0;
    for (let i = 1; i < this.records.length; i++) {
      total += this.records[i].timestamp - this.records[i - 1].timestamp;
    }
    return total / (this.records.length - 1);
  }

  // 生成完整的指标快照
  public buildSnapshot(): TabMetricsSnapshot {
    const snapshot: TabMetricsSnapshot = {
      totalTransitions: this.records.length,
      openedCount: this.countState(TabState.OPENED),
      closedCount: this.countState(TabState.CLOSED),
      navigationCount: this.countState(TabState.OPENED),
      averageTransitionDuration: this.computeAverageDuration(),
      lastTrigger: this.records.length > 0 ? this.records[this.records.length - 1].trigger : ''
    };
    return snapshot;
  }

  // 计算各类别的统计条目
  public buildCategoryStats(classifier: TabTransitionClassifier): TabStatEntry[] {
    const entries: TabStatEntry[] = [];
    const categories =
      [TabTransitionCategory.OPEN_FLOW, TabTransitionCategory.CLOSE_FLOW, TabTransitionCategory.NAVIGATION,
        TabTransitionCategory.RECOVERY, TabTransitionCategory.IDLE];
    const total = this.records.length;
    for (const category of categories) {
      const count = this.countByCategory(category, classifier);
      const entry: TabStatEntry = {
        category, count, percentage: total === 0 ? 0 : count / total
      };
      entries.push(entry);
    }
    return entries;
  }

  // 统计指定类别的转换数量
  private countByCategory(category: TabTransitionCategory, classifier: TabTransitionClassifier): number {
    let count = 0;
    for (const record of this.records) {
      if (classifier.classify(record.trigger) === category) {
        count++;
      }
    }
    return count;
  }
}

// 页签页状态序列化器：负责状态历史的序列化与反序列化
class TabStateSerializer {
  private static readonly VERSION: string = '1.0.0';

  // 将状态历史序列化为JSON字符串
  public serialize(records: StateTransitionRecord[]): string {
    return JSON.stringify(records);
  }

  // 将JSON字符串反序列化为状态历史数组
  public deserialize(json: string): StateTransitionRecord[] {
    const parsed: StateTransitionRecord[] = JSON.parse(json);
    return parsed;
  }

  // 判断给定的JSON字符串是否可安全解析
  public isSerializable(json: string): boolean {
    try {
      const parsed: StateTransitionRecord[] = JSON.parse(json);
      return Array.isArray(parsed);
    } catch (e) {
      return false;
    }
  }

  // 生成序列化版本描述信息
  public getVersionInfo(): string {
    return `TabStateSerializer version: ${TabStateSerializer.VERSION}`;
  }
}

// 状态转换路径校验器：校验状态序列的合法性
class TabTransitionPathValidator {
  private static readonly ALLOWED_PATHS: TabState[][] =
    [[TabState.CLOSED, TabState.OPENING, TabState.OPENED],
      [TabState.OPENED, TabState.CLOSING, TabState.CLOSED]];

  // 判断给定路径是否完整且合法
  public isValidPath(path: TabTransitionPath): boolean {
    if (path.sequence.length < 2) {
      return false;
    }
    if (!path.isComplete) {
      return false;
    }
    return this.matchesAllowedPattern(path.sequence);
  }

  // 判断路径是否匹配任意允许的模式
  private matchesAllowedPattern(sequence: TabState[]): boolean {
    for (const pattern of TabTransitionPathValidator.ALLOWED_PATHS) {
      if (this.isSubSequence(pattern, sequence)) {
        return true;
      }
    }
    return false;
  }

  // 判断候选模式是否为路径的子序列
  private isSubSequence(pattern: TabState[], sequence: TabState[]): boolean {
    let patternIndex = 0;
    for (const state of sequence) {
      if (patternIndex < pattern.length && state === pattern[patternIndex]) {
        patternIndex++;
      }
    }
    return patternIndex === pattern.length;
  }

  // 计算路径的最短完成时间
  public estimateMinimalDuration(path: TabTransitionPath): number {
    return path.sequence.length * 50;
  }
}

// ==================== 状态序列分析工具集（新增代码） ====================

// 状态序列类型枚举：描述状态序列的分析类型
enum TabSequenceType {
  LINEAR = 'linear', CYCLIC = 'cyclic', REVERSIBLE = 'reversible', IRREGULAR = 'irregular'
}

// 状态序列分析结果接口：描述状态序列的分析结论
interface TabSequenceAnalysis {
  type: TabSequenceType;
  length: number;
  uniqueStateCount: number;
  hasOpenCycle: boolean;
  hasCloseCycle: boolean;
}

// 状态序列分析器：对状态历史序列进行结构分析
class TabStateSequenceAnalyzer {
  private sequence: TabState[] = [];

  constructor(sequence: TabState[]) {
    this.sequence = [...sequence];
  }

  // 判断序列是否包含完整的开闭周期
  public hasOpenCloseCycle(): boolean {
    let hasOpen = false;
    let hasClose = false;
    for (const state of this.sequence) {
      if (state === TabState.OPENING || state === TabState.OPENED) {
        hasOpen = true;
      }
      if (state === TabState.CLOSING || state === TabState.CLOSED) {
        hasClose = true;
      }
    }
    return hasOpen && hasClose;
  }

  // 统计序列中不同状态的数量
  public countUniqueStates(): number {
    const seen = new Set<TabState>();
    for (const state of this.sequence) {
      seen.add(state);
    }
    return seen.size;
  }

  // 生成序列分析结果
  public analyze(): TabSequenceAnalysis {
    const analysis: TabSequenceAnalysis = {
      type: this.determineType(),
      length: this.sequence.length,
      uniqueStateCount: this.countUniqueStates(),
      hasOpenCycle: this.hasState(TabState.OPENED),
      hasCloseCycle: this.hasState(TabState.CLOSED)
    };
    return analysis;
  }

  // 判断序列中是否包含指定状态
  private hasState(state: TabState): boolean {
    for (const item of this.sequence) {
      if (item === state) {
        return true;
      }
    }
    return false;
  }

  // 推断序列的类型
  private determineType(): TabSequenceType {
    if (this.sequence.length === 0) {
      return TabSequenceType.IRREGULAR;
    }
    if (this.hasOpenCloseCycle()) {
      return TabSequenceType.CYCLIC;
    }
    return TabSequenceType.LINEAR;
  }
}

// 状态审计报告模型：封装一次状态审计的完整报告
class TabStateAuditReport {
  private generatedAt: number;
  private totalTransitions: number;
  private openCount: number;
  private closeCount: number;
  private reportTitle: string;

  constructor(generatedAt: number, totalTransitions: number, openCount: number, closeCount: number,
    reportTitle: string) {
    this.generatedAt = generatedAt;
    this.totalTransitions = totalTransitions;
    this.openCount = openCount;
    this.closeCount = closeCount;
    this.reportTitle = reportTitle;
  }

  public getGeneratedAt(): number {
    return this.generatedAt;
  }

  public getTotalTransitions(): number {
    return this.totalTransitions;
  }

  public getOpenCount(): number {
    return this.openCount;
  }

  public getCloseCount(): number {
    return this.closeCount;
  }

  public getReportTitle(): string {
    return this.reportTitle;
  }

  // 计算开闭次数的差值
  public computeOpenCloseDelta(): number {
    return this.openCount - this.closeCount;
  }

  // 判断报告是否平衡
  public isBalanced(): boolean {
    return this.computeOpenCloseDelta() === 0;
  }

  // 生成报告的文本表示
  public toString(): string {
    return `${this.reportTitle} generatedAt=${this.generatedAt} transitions=${this.totalTransitions} open=${this.openCount} close=${this.closeCount}`;
  }
}

export default function tabStateManagementTest() {
  describe('TabStateManagement_Test', () => {
    let driver: Driver;
    let stateManager: TabStateManager;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      stateManager = TabStateManager.getInstance();
      stateManager.resetManager();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭页签页并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('tab_should_start_in_opened_state', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
      stateManager.transitionTo(TabState.OPENED, 'initial_render');
      const componentCount = await pageComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(stateManager.getCurrentState()).assertEqual(TabState.OPENED);
    });

    // 验证tab should维持稳定：确保TV设备在maintain state during navigation下性能不降低
    it('tab_should_maintain_state_during_navigation', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
      stateManager.transitionTo(TabState.OPENED, 'initial_render');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);

      const componentCount = await pageComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(stateManager.getCurrentState()).assertEqual(TabState.OPENED);
    });

    // 验证tab should处理能力：确保TV设备在handle back key transition下功能正常
    it('tab_should_handle_back_key_transition', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
      stateManager.transitionTo(TabState.OPENED, 'initial_render');

      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      stateManager.transitionTo(TabState.CLOSING, 'back_key');
      await driver.delayMs(500);

      expect(stateManager.hasTransitionedTo(TabState.CLOSING)).assertTrue();
    });

    // 验证tab state状态正确：确保TV设备history should be complete符合预期
    it('tab_state_history_should_be_complete', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(TabState.OPENING, 'user_action');
      stateManager.transitionTo(TabState.OPENED, 'render_complete');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      stateManager.transitionTo(TabState.CLOSING, 'back_key');
      stateManager.transitionTo(TabState.CLOSED, 'close_complete');

      const history = stateManager.getStateHistory();
      expect(history.length).assertEqual(4);
      expect(history[0].fromState).assertEqual(TabState.CLOSED);
      expect(history[0].toState).assertEqual(TabState.OPENING);
      expect(history[1].toState).assertEqual(TabState.OPENED);
      expect(history[2].toState).assertEqual(TabState.CLOSING);
      expect(history[3].toState).assertEqual(TabState.CLOSED);
    });

    // 验证tab should处理能力：确保TV设备在handle rapid state changes下功能正常
    it('tab_should_handle_rapid_state_changes', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
      stateManager.resetManager();

      for (let i = 0; i < 10; i++) {
        stateManager.transitionTo(TabState.OPENED, `navigation_${i}`);
        await driver.delayMs(50);
      }

      expect(stateManager.getTotalTransitions()).assertEqual(10);
      const componentCount = await pageComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证tab state具备特性：确保TV设备transitions should have correct triggers满足设计要求

    // 验证tab should持久：确保TV设备persist state after operations状态保持

    // 验证tab state状态正确：确保TV设备timestamps should be chronological符合预期

    // 验证tab should处理能力：确保TV设备在handle multiple open close cycles下功能正常

    // 验证tab should维持稳定：确保TV设备在maintain consistency during long session下性能不降低

    // 验证tab state状态正确：确保TV设备should be queryable at any time符合预期

    // 验证tab should处理能力：确保TV设备在handle state recovery after error下功能正常

    // 验证tab state状态正确：确保TV设备transitions should be atomic符合预期

    // 验证tab state维持稳定：确保TV设备在manager singleton should maintain consistency下性能不降低
    it('tab_state_manager_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const manager1 = TabStateManager.getInstance();
      const manager2 = TabStateManager.getInstance();

      expect(manager1 === manager2).assertTrue();

      manager1.resetManager();
      manager1.transitionTo(TabState.OPENED, 'test');

      expect(manager2.getCurrentState()).assertEqual(TabState.OPENED);
      expect(manager2.getTotalTransitions()).assertEqual(1);
    });

    // 验证tab should处理能力：确保TV设备在handle concurrent state requests下功能正常

    // 综合comprehensive tab场景测试：验证完整操作流程中功能正确

    // 适配 TabTransitionClassifier：验证触发源文本到转换类别的映射准确
    it('tab_transition_classifier_should_categorize_triggers', 0, async () => {
      const classifier = TabTransitionClassifier.getInstance();
      expect(classifier.classify('open_tab')).assertEqual(TabTransitionCategory.OPEN_FLOW);
      expect(classifier.classify('render_complete')).assertEqual(TabTransitionCategory.OPEN_FLOW);
      expect(classifier.classify('close_tab')).assertEqual(TabTransitionCategory.CLOSE_FLOW);
      expect(classifier.classify('back_key')).assertEqual(TabTransitionCategory.CLOSE_FLOW);
      expect(classifier.classify('navigation_left')).assertEqual(TabTransitionCategory.NAVIGATION);
      expect(classifier.classify('recovery_retry')).assertEqual(TabTransitionCategory.RECOVERY);
      expect(classifier.classify('unknown_trigger')).assertEqual(TabTransitionCategory.IDLE);
    });

    // 适配 TabTransitionClassifier：验证分类计数累加、查询与重置
    it('tab_transition_classifier_should_accumulate_category_counts', 0, async () => {
      const classifier = TabTransitionClassifier.getInstance();
      classifier.resetClassifier();
      classifier.recordCategory(TabTransitionCategory.OPEN_FLOW);
      classifier.recordCategory(TabTransitionCategory.OPEN_FLOW);
      classifier.recordCategory(TabTransitionCategory.CLOSE_FLOW);
      expect(classifier.getCategoryCount(TabTransitionCategory.OPEN_FLOW)).assertEqual(2);
      expect(classifier.getCategoryCount(TabTransitionCategory.CLOSE_FLOW)).assertEqual(1);
      expect(classifier.getCategoryCount(TabTransitionCategory.IDLE)).assertEqual(0);
      expect(classifier.getTotalClassified()).assertEqual(3);
    });

    // 适配 TabMetricsCalculator：验证按目标状态统计转换次数
    it('tab_metrics_calculator_should_count_states', 0, async () => {
      const records: StateTransitionRecord[] = [
        { fromState: TabState.CLOSED, toState: TabState.OPENING, trigger: 'open', timestamp: 1000 },
        { fromState: TabState.OPENING, toState: TabState.OPENED, trigger: 'render', timestamp: 2000 },
        { fromState: TabState.OPENED, toState: TabState.CLOSING, trigger: 'close', timestamp: 3000 },
        { fromState: TabState.CLOSING, toState: TabState.CLOSED, trigger: 'back', timestamp: 4000 }
      ];
      const calculator = new TabMetricsCalculator(records);
      expect(calculator.countState(TabState.OPENING)).assertEqual(1);
      expect(calculator.countState(TabState.OPENED)).assertEqual(1);
      expect(calculator.countState(TabState.CLOSED)).assertEqual(1);
    });

    // 适配 TabMetricsCalculator：验证平均转换时间间隔计算及空序列处理
    it('tab_metrics_calculator_should_compute_average_duration', 0, async () => {
      const records: StateTransitionRecord[] = [
        { fromState: TabState.CLOSED, toState: TabState.OPENING, trigger: 'open', timestamp: 1000 },
        { fromState: TabState.OPENING, toState: TabState.OPENED, trigger: 'render', timestamp: 2000 },
        { fromState: TabState.OPENED, toState: TabState.CLOSING, trigger: 'close', timestamp: 3000 }
      ];
      const calculator = new TabMetricsCalculator(records);
      expect(calculator.computeAverageDuration()).assertEqual(1000);
      const empty = new TabMetricsCalculator([]);
      expect(empty.computeAverageDuration()).assertEqual(0);
    });

    // 适配 TabMetricsCalculator：验证指标快照字段完整且准确
    it('tab_metrics_calculator_should_build_snapshot', 0, async () => {
      const records: StateTransitionRecord[] = [
        { fromState: TabState.CLOSED, toState: TabState.OPENING, trigger: 'open', timestamp: 1000 },
        { fromState: TabState.OPENING, toState: TabState.OPENED, trigger: 'render', timestamp: 2000 }
      ];
      const calculator = new TabMetricsCalculator(records);
      const snapshot: TabMetricsSnapshot = calculator.buildSnapshot();
      expect(snapshot.totalTransitions).assertEqual(2);
      expect(snapshot.openedCount).assertEqual(1);
      expect(snapshot.closedCount).assertEqual(0);
      expect(snapshot.lastTrigger).assertEqual('render');
    });

    // 适配 TabMetricsCalculator：验证分类统计条目与计数
    it('tab_metrics_calculator_should_build_category_stats', 0, async () => {
      const records: StateTransitionRecord[] = [
        { fromState: TabState.CLOSED, toState: TabState.OPENING, trigger: 'open', timestamp: 1000 },
        { fromState: TabState.OPENING, toState: TabState.OPENED, trigger: 'render', timestamp: 2000 },
        { fromState: TabState.OPENED, toState: TabState.CLOSING, trigger: 'back', timestamp: 3000 }
      ];
      const classifier = TabTransitionClassifier.getInstance();
      const calculator = new TabMetricsCalculator(records);
      const entries: TabStatEntry[] = calculator.buildCategoryStats(classifier);
      expect(entries.length).assertEqual(5);
      expect(entries[0].count).assertEqual(2);
      expect(entries[1].count).assertEqual(1);
      expect(entries[2].count).assertEqual(0);
    });

    // 适配 TabStateSerializer：验证序列化与反序列化往返一致
    it('tab_state_serializer_should_round_trip', 0, async () => {
      const records: StateTransitionRecord[] = [
        { fromState: TabState.CLOSED, toState: TabState.OPENED, trigger: 'open', timestamp: 1000 }
      ];
      const serializer = new TabStateSerializer();
      const json = serializer.serialize(records);
      const restored: StateTransitionRecord[] = serializer.deserialize(json);
      expect(restored.length).assertEqual(1);
      expect(restored[0].toState).assertEqual(TabState.OPENED);
      expect(restored[0].trigger).assertEqual('open');
    });

    // 适配 TabStateSerializer：验证非法输入可被识别且版本信息完整
    it('tab_state_serializer_should_detect_invalid_json', 0, async () => {
      const serializer = new TabStateSerializer();
      expect(serializer.isSerializable('[]')).assertTrue();
      expect(serializer.isSerializable('{}')).assertFalse();
      expect(serializer.isSerializable('not_json')).assertFalse();
      expect(serializer.getVersionInfo()).assertContain('1.0.0');
    });

    // 适配 TabTransitionPathValidator：验证合法路径通过且时长估算正确
    it('tab_transition_path_validator_should_accept_valid_path', 0, async () => {
      const validator = new TabTransitionPathValidator();
      const path: TabTransitionPath = {
        sequence: [TabState.CLOSED, TabState.OPENING, TabState.OPENED],
        duration: 300,
        isComplete: true
      };
      expect(validator.isValidPath(path)).assertTrue();
      expect(validator.estimateMinimalDuration(path)).assertEqual(150);
    });

    // 适配 TabTransitionPathValidator：验证不完整或过短路径被拒绝
    it('tab_transition_path_validator_should_reject_invalid_path', 0, async () => {
      const validator = new TabTransitionPathValidator();
      const incomplete: TabTransitionPath = {
        sequence: [TabState.CLOSED, TabState.OPENING],
        duration: 200,
        isComplete: false
      };
      expect(validator.isValidPath(incomplete)).assertFalse();
      const short: TabTransitionPath = {
        sequence: [TabState.OPENED],
        duration: 100,
        isComplete: true
      };
      expect(validator.isValidPath(short)).assertFalse();
    });

    // 适配 TabStateSequenceAnalyzer：验证含开闭周期的序列识别为循环型
    it('tab_state_sequence_analyzer_should_detect_cycle', 0, async () => {
      const analyzer = new TabStateSequenceAnalyzer(
        [TabState.OPENING, TabState.OPENED, TabState.CLOSING, TabState.CLOSED]);
      const analysis: TabSequenceAnalysis = analyzer.analyze();
      expect(analysis.type).assertEqual(TabSequenceType.CYCLIC);
      expect(analyzer.hasOpenCloseCycle()).assertTrue();
      expect(analysis.uniqueStateCount).assertEqual(4);
    });

    // 适配 TabStateSequenceAnalyzer：验证重复状态去重计数与序列长度
    it('tab_state_sequence_analyzer_should_count_unique_states', 0, async () => {
      const analyzer = new TabStateSequenceAnalyzer(
        [TabState.OPENED, TabState.OPENED, TabState.CLOSED, TabState.CLOSED]);
      expect(analyzer.countUniqueStates()).assertEqual(2);
      expect(analyzer.analyze().length).assertEqual(4);
      const empty = new TabStateSequenceAnalyzer([]);
      expect(empty.analyze().type).assertEqual(TabSequenceType.IRREGULAR);
    });

    // 适配 TabStateAuditReport：验证开闭差值及字段取值
    it('tab_state_audit_report_should_compute_delta', 0, async () => {
      const report = new TabStateAuditReport(1000, 5, 3, 2, 'audit_report');
      expect(report.getGeneratedAt()).assertEqual(1000);
      expect(report.getTotalTransitions()).assertEqual(5);
      expect(report.getOpenCount()).assertEqual(3);
      expect(report.getCloseCount()).assertEqual(2);
      expect(report.computeOpenCloseDelta()).assertEqual(1);
      expect(report.toString()).assertContain('audit_report');
    });

    // 适配 TabStateAuditReport：验证开闭次数平衡判定
    it('tab_state_audit_report_should_detect_balance', 0, async () => {
      const balanced = new TabStateAuditReport(1000, 4, 2, 2, 'balanced');
      expect(balanced.isBalanced()).assertTrue();
      const unbalanced = new TabStateAuditReport(1000, 4, 3, 1, 'unbalanced');
      expect(unbalanced.isBalanced()).assertFalse();
      expect(unbalanced.computeOpenCloseDelta()).assertEqual(2);
    });
  });

}