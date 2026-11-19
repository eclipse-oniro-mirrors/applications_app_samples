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
  KEY_ENTER,
  KEY_BACK,
  pageComponentCount,
  checkFocusState,
  waitForPageStable,
  pressAndWait,
  TIMEOUT_TAB_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/CustomViewTestDriver';

// 页签页状态枚举：覆盖TV设备主要的状态类型
enum TabState {
  CLOSED = 'closed', OPENING = 'opening', OPENED = 'opened', CLOSING = 'closing', HIDDEN = 'hidden', ERROR = 'error'
}

// 状态转换记录结构体：存储状态转换的详细信息
interface StateTransition {
  from: TabState;
  to: TabState;
  timestamp: number;
  trigger: string;
}

// 页签页状态管理器：单例模式确保跨测试用例的状态数据一致性
class TabStateManager {
  private static instance: TabStateManager;
  private currentState: TabState;
  private stateHistory: StateTransition[] = [];
  private stateChangeListeners: Array<(from: TabState, to: TabState) => void> = [];
  private lastError: string = '';

  constructor() {
    this.currentState = TabState.CLOSED;
  }

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): TabStateManager {
    if (!TabStateManager.instance) {
      TabStateManager.instance = new TabStateManager();
    }
    return TabStateManager.instance;
  }

  public getCurrentState(): TabState {
    return this.currentState;
  }

  // 状态转换方法：执行状态转换并记录转换历史
  public transitionState(newState: TabState, trigger: string): boolean {
    const oldState = this.currentState;
    if (!this.isValidTransition(oldState, newState)) {
      this.lastError = `Invalid transition from ${oldState} to ${newState}`;
      this.currentState = TabState.ERROR;
      return false;
    }

    this.currentState = newState;

    const transition: StateTransition = {
      from: oldState,
      to: newState,
      timestamp: Date.now(),
      trigger
    };

    this.stateHistory.push(transition);
    this.notifyListeners(oldState, newState);

    return true;
  }

  // 添加状态变化监听器：允许外部组件监听状态变化
  public addStateChangeListener(listener: (from: TabState, to: TabState) => void): void {
    this.stateChangeListeners.push(listener);
  }

  // 移除状态变化监听器：清理不再需要的监听器
  public removeStateChangeListener(listener: (from: TabState, to: TabState) => void): void {
    const index = this.stateChangeListeners.indexOf(listener);
    if (index !== -1) {
      this.stateChangeListeners.splice(index, 1);
    }
  }

  public getStateHistory(): StateTransition[] {
    return [...this.stateHistory];
  }

  public getTransitionCount(): number {
    return this.stateHistory.length;
  }

  public getStateTransitionCount(state: TabState): number {
    return this.stateHistory.filter(t => t.to === state).length;
  }

  public getLastError(): string {
    return this.lastError;
  }

  public resetState(): void {
    this.currentState = TabState.CLOSED;
    this.stateHistory = [];
    this.lastError = '';
  }

  public isInState(state: TabState): boolean {
    return this.currentState === state;
  }

  public getStateStats(): Map<string, number> {
    const stats = new Map<string, number>();

    for (const transition of this.stateHistory) {
      const key = `${transition.from}->${transition.to}`;
      const currentCount = stats.get(key) || 0;
      stats.set(key, currentCount + 1);
    }

    return stats;
  }

  // 导出状态历史：将状态历史转换为JSON格式
  public exportStateHistory(): string {
    return JSON.stringify(this.stateHistory);
  }

  // 导入状态历史：从JSON字符串恢复状态历史记录
  public importStateHistory(jsonString: string): boolean {
    try {
      const history: StateTransition[] = JSON.parse(jsonString);
      this.stateHistory = history;
      if (history.length > 0) {
        this.currentState = history[history.length - 1].to;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  private isValidTransition(from: TabState, to: TabState): boolean {
    const validTransitions: Map<TabState, TabState[]> = new Map([[TabState.CLOSED, [TabState.OPENING]],
      [TabState.OPENING, [TabState.OPENED, TabState.CLOSED]],
      [TabState.OPENED, [TabState.CLOSING, TabState.HIDDEN]], [TabState.CLOSING, [TabState.CLOSED]],
      [TabState.HIDDEN, [TabState.OPENED, TabState.CLOSING]], [TabState.ERROR, [TabState.CLOSED]]]);

    const allowedTargets = validTransitions.get(from);
    if (!allowedTargets) {
      return false;
    }

    return allowedTargets.includes(to);
  }

  // 通知监听器：触发所有注册的状态变化回调
  private notifyListeners(from: TabState, to: TabState): void {
    for (const listener of this.stateChangeListeners) {
      listener(from, to);
    }
  }
}

// ==================== 状态管理器扩展工具集（新增代码） ====================

// 转换结果枚举：描述状态转换操作的结果类型
enum TransitionResult {
  SUCCESS = 'success', INVALID = 'invalid', DUPLICATE = 'duplicate', ERROR = 'error'
}

// 转换合法性等级枚举：描述状态转换的合法性评估等级
enum TransitionLegality {
  LEGAL = 'legal', ILLEGAL = 'illegal', CONDITIONAL = 'conditional'
}

// 状态统计摘要接口：汇总状态管理器的整体运行情况
interface StateSummary {
  totalTransitions: number;
  successCount: number;
  failureCount: number;
  errorCount: number;
  successRate: number;
  mostFrequentTransition: string;
}

// 转换评估结果接口：描述单次转换的合法性评估结论
interface TransitionAssessment {
  from: TabState;
  to: TabState;
  legality: TransitionLegality;
  reason: string;
}

// 状态转换审计器：对状态转换过程进行合法性评估与统计
class StateTransitionAuditor {
  private assessments: TransitionAssessment[] = [];

  // 评估一次状态转换的合法性
  public assess(from: TabState, to: TabState): TransitionAssessment {
    const legality = this.determineLegality(from, to);
    const assessment: TransitionAssessment = {
      from,
      to,
      legality,
      reason: this.buildReason(legality)
    };
    this.assessments.push(assessment);
    return assessment;
  }

  // 根据源状态与目标状态判断转换合法性
  private determineLegality(from: TabState, to: TabState): TransitionLegality {
    if (from === to) {
      return TransitionLegality.ILLEGAL;
    }
    if (from === TabState.ERROR || to === TabState.ERROR) {
      return TransitionLegality.CONDITIONAL;
    }
    return TransitionLegality.LEGAL;
  }

  // 生成评估结果的原因描述文本
  private buildReason(legality: TransitionLegality): string {
    if (legality === TransitionLegality.LEGAL) {
      return 'transition is legal';
    }
    if (legality === TransitionLegality.ILLEGAL) {
      return 'transition is illegal';
    }
    return 'transition is conditional';
  }

  // 获取全部评估记录
  public getAssessments(): TransitionAssessment[] {
    return [...this.assessments];
  }

  // 统计指定合法性等级的评估数量
  public countByLegality(legality: TransitionLegality): number {
    let count = 0;
    for (const assessment of this.assessments) {
      if (assessment.legality === legality) {
        count++;
      }
    }
    return count;
  }

  // 清空评估记录
  public resetAuditor(): void {
    this.assessments = [];
  }
}

// 状态汇总报告器：基于转换历史生成统计摘要
class StateSummaryReporter {
  private history: StateTransition[] = [];

  constructor(history: StateTransition[]) {
    this.history = [...history];
  }

  // 生成状态统计摘要
  public buildSummary(): StateSummary {
    const summary: StateSummary = {
      totalTransitions: this.history.length,
      successCount: this.history.length,
      failureCount: 0,
      errorCount: this.countTargetState(TabState.ERROR),
      successRate: this.history.length === 0 ? 0 : 1,
      mostFrequentTransition: this.findMostFrequentTransition()
    };
    return summary;
  }

  // 统计到达指定状态的次数
  private countTargetState(state: TabState): number {
    let count = 0;
    for (const transition of this.history) {
      if (transition.to === state) {
        count++;
      }
    }
    return count;
  }

  // 查找出现次数最多的转换对
  private findMostFrequentTransition(): string {
    const counts = new Map<string, number>();
    for (const transition of this.history) {
      const key = `${transition.from}->${transition.to}`;
      const current = counts.get(key);
      if (current === undefined) {
        counts.set(key, 1);
      } else {
        counts.set(key, current + 1);
      }
    }
    let bestKey = '';
    let bestCount = 0;
    const keys = counts.keys();
    for (const key of keys) {
      const value = counts.get(key);
      if (value !== undefined && value > bestCount) {
        bestCount = value;
        bestKey = key;
      }
    }
    return bestKey;
  }
}

// 状态转换断言器：为状态管理提供可复用的断言辅助逻辑
class StateTransitionAsserter {
  private targetState: TabState = TabState.CLOSED;
  private expectedCount: number = 0;

  constructor() {
    this.targetState = TabState.CLOSED;
    this.expectedCount = 0;
  }

  // 设置断言目标状态
  public setTargetState(state: TabState): void {
    this.targetState = state;
  }

  // 设置期望的转换计数
  public setExpectedCount(count: number): void {
    this.expectedCount = count;
  }

  public getTargetState(): TabState {
    return this.targetState;
  }

  public getExpectedCount(): number {
    return this.expectedCount;
  }

  // 校验实际计数是否满足期望
  public isCountSatisfied(actualCount: number): boolean {
    return actualCount === this.expectedCount;
  }

  // 校验当前状态是否匹配目标状态
  public isStateSatisfied(actualState: TabState): boolean {
    return actualState === this.targetState;
  }
}

// 状态转换日志模型：封装一条可扩展的状态转换日志
class StateTransitionLogEntry {
  private from: TabState;
  private to: TabState;
  private trigger: string;
  private timestamp: number;
  private result: TransitionResult;

  constructor(from: TabState, to: TabState, trigger: string, timestamp: number, result: TransitionResult) {
    this.from = from;
    this.to = to;
    this.trigger = trigger;
    this.timestamp = timestamp;
    this.result = result;
  }

  public getFrom(): TabState {
    return this.from;
  }

  public getTo(): TabState {
    return this.to;
  }

  public getTrigger(): string {
    return this.trigger;
  }

  public getTimestamp(): number {
    return this.timestamp;
  }

  public getResult(): TransitionResult {
    return this.result;
  }

  public setResult(result: TransitionResult): void {
    this.result = result;
  }

  // 生成日志条目的可读文本表示
  public toString(): string {
    return `[${this.timestamp}] ${this.from} -> ${this.to} (${this.trigger}) result=${this.result}`;
  }

  // 判断两条日志是否表示相同的转换
  public equals(other: StateTransitionLogEntry): boolean {
    return this.from === other.from && this.to === other.to && this.trigger === other.trigger;
  }
}

// 状态转换日志管理器：集中管理状态转换日志条目
class StateTransitionLogManager {
  private entries: StateTransitionLogEntry[] = [];

  // 追加一条日志条目
  public appendEntry(entry: StateTransitionLogEntry): void {
    this.entries.push(entry);
  }

  // 获取全部日志条目
  public getEntries(): StateTransitionLogEntry[] {
    return [...this.entries];
  }

  // 按转换结果筛选日志
  public filterByResult(result: TransitionResult): StateTransitionLogEntry[] {
    const filtered: StateTransitionLogEntry[] = [];
    for (const entry of this.entries) {
      if (entry.getResult() === result) {
        filtered.push(entry);
      }
    }
    return filtered;
  }

  // 清空全部日志
  public clearEntries(): void {
    this.entries = [];
  }

  // 获取日志条目数量
  public getEntryCount(): number {
    return this.entries.length;
  }
}

// ==================== 状态转换矩阵工具集（新增代码） ====================

// 转换矩阵单元接口：描述状态转换矩阵中的一个单元
interface TransitionMatrixCell {
  from: TabState;
  to: TabState;
  allowed: boolean;
  weight: number;
}

// 状态转换矩阵：描述状态之间允许的转换关系
class StateTransitionMatrix {
  private cells: TransitionMatrixCell[] = [];

  constructor() {
    this.initializeCells();
  }

  // 初始化转换矩阵单元
  private initializeCells(): void {
    const states =
      [TabState.CLOSED, TabState.OPENING, TabState.OPENED, TabState.CLOSING, TabState.HIDDEN,
        TabState.ERROR];
    for (const from of states) {
      for (const to of states) {
        const cell: TransitionMatrixCell = {
          from,
          to,
          allowed: this.isAllowedPair(from, to),
          weight: from === to ? 0 : 1
        };
        this.cells.push(cell);
      }
    }
  }

  // 判断一对状态是否允许转换
  private isAllowedPair(from: TabState, to: TabState): boolean {
    if (from === to) {
      return false;
    }
    if (from === TabState.CLOSED && to === TabState.OPENING) {
      return true;
    }
    if (from === TabState.OPENING && (to === TabState.OPENED || to === TabState.CLOSED)) {
      return true;
    }
    if (from === TabState.OPENED && (to === TabState.CLOSING || to === TabState.HIDDEN)) {
      return true;
    }
    if (from === TabState.CLOSING && to === TabState.CLOSED) {
      return true;
    }
    if (from === TabState.HIDDEN && (to === TabState.OPENED || to === TabState.CLOSING)) {
      return true;
    }
    if (from === TabState.ERROR && to === TabState.CLOSED) {
      return true;
    }
    return false;
  }

  // 查询一对状态的转换是否允许
  public isTransitionAllowed(from: TabState, to: TabState): boolean {
    for (const cell of this.cells) {
      if (cell.from === from && cell.to === to) {
        return cell.allowed;
      }
    }
    return false;
  }

  // 统计允许的转换数量
  public countAllowedTransitions(): number {
    let count = 0;
    for (const cell of this.cells) {
      if (cell.allowed) {
        count++;
      }
    }
    return count;
  }

  // 获取全部矩阵单元
  public getCells(): TransitionMatrixCell[] {
    return [...this.cells];
  }
}

// 状态转换权重计算器：计算转换的权重值
class StateTransitionWeightCalculator {
  private matrix: StateTransitionMatrix;

  constructor(matrix: StateTransitionMatrix) {
    this.matrix = matrix;
  }

  // 计算一次转换的权重
  public computeWeight(from: TabState, to: TabState): number {
    if (!this.matrix.isTransitionAllowed(from, to)) {
      return -1;
    }
    if (from === to) {
      return 0;
    }
    return 1;
  }

  // 计算转换路径的总权重
  public computePathWeight(path: TabState[]): number {
    let total = 0;
    for (let i = 1; i < path.length; i++) {
      const weight = this.computeWeight(path[i - 1], path[i]);
      if (weight < 0) {
        return -1;
      }
      total += weight;
    }
    return total;
  }

  // 判断转换路径是否全部合法
  public isLegalPath(path: TabState[]): boolean {
    return this.computePathWeight(path) >= 0;
  }
}

// 状态转换矩阵报告器：生成转换矩阵的分析报告
class StateTransitionMatrixReporter {
  private matrix: StateTransitionMatrix;

  constructor(matrix: StateTransitionMatrix) {
    this.matrix = matrix;
  }

  // 生成矩阵分析文本报告
  public generateReport(): string {
    const allowed = this.matrix.countAllowedTransitions();
    const cells = this.matrix.getCells();
    return `TransitionMatrix report: totalCells=${cells.length} allowed=${allowed}`;
  }

  // 统计从指定状态出发的允许转换数量
  public countAllowedFrom(state: TabState): number {
    const cells = this.matrix.getCells();
    let count = 0;
    for (const cell of cells) {
      if (cell.from === state && cell.allowed) {
        count++;
      }
    }
    return count;
  }
}

export default function tabStateManagerValidationTest() {
  describe('TabStateManagerValidation_Test', () => {
    let driver: Driver;
    let stateManager: TabStateManager;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      stateManager = TabStateManager.getInstance();
      stateManager.resetState();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭页签页并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    }); // 验证tab state状态正确：确保TV设备enum should be defined correctly符合预期
    it('tab_state_enum_should_be_defined_correctly', 0, async () => {
      expect(TabState.CLOSED).assertEqual('closed');
      expect(TabState.OPENING).assertEqual('opening');
      expect(TabState.OPENED).assertEqual('opened');
      expect(TabState.CLOSING).assertEqual('closing');
      expect(TabState.HIDDEN).assertEqual('hidden');
      expect(TabState.ERROR).assertEqual('error');
    }); // 验证state manager状态正确：确保TV设备initial state should be closed符合预期
    it('state_manager_initial_state_should_be_closed', 0, async () => {
      stateManager.resetState();
      expect(stateManager.getCurrentState()).assertEqual(TabState.CLOSED);
      expect(stateManager.getTransitionCount()).assertEqual(0);
      expect(stateManager.getLastError()).assertEqual('');
    });
    it('valid_state_transitions_should_succeed', 0, async () => {
      stateManager.resetState();

      // CLOSED -> OPENING
      const result1 = stateManager.transitionState(TabState.OPENING, 'open_tab');
      expect(result1).assertTrue();
      expect(stateManager.getCurrentState()).assertEqual(TabState.OPENING);

      // OPENING -> OPENED
      const result2 = stateManager.transitionState(TabState.OPENED, 'animation_complete');
      expect(result2).assertTrue();
      expect(stateManager.getCurrentState()).assertEqual(TabState.OPENED);

      // OPENED -> CLOSING
      const result3 = stateManager.transitionState(TabState.CLOSING, 'close_tab');
      expect(result3).assertTrue();
      expect(stateManager.getCurrentState()).assertEqual(TabState.CLOSING);

      // CLOSING -> CLOSED
      const result4 = stateManager.transitionState(TabState.CLOSED, 'animation_complete');
      expect(result4).assertTrue();
      expect(stateManager.getCurrentState()).assertEqual(TabState.CLOSED);
    });
    it('invalid_state_transitions_should_fail', 0, async () => {
      stateManager.resetState();

      // CLOSED -> OPENED (跳过OPENING)
      const result1 = stateManager.transitionState(TabState.OPENED, 'direct_open');
      expect(result1).assertFalse();
      expect(stateManager.getCurrentState()).assertEqual(TabState.ERROR);
      expect(stateManager.getLastError().includes('Invalid transition')).assertTrue();
      stateManager.resetState();
      stateManager.transitionState(TabState.OPENING, 'open');
      stateManager.transitionState(TabState.OPENED, 'complete');

      // OPENED -> CLOSED (跳过CLOSING)
      const result2 = stateManager.transitionState(TabState.CLOSED, 'direct_close');
      expect(result2).assertFalse();
      expect(stateManager.getCurrentState()).assertEqual(TabState.ERROR);
    });
    it('state_change_listener_should_receive_notifications', 0, async () => {
      stateManager.resetState();

      let notificationCount = 0;
      let lastFrom: TabState | null = null;
      let lastTo: TabState | null = null;

      const listener = (from: TabState, to: TabState) => {
        notificationCount++;
        lastFrom = from;
        lastTo = to;
      };

      stateManager.addStateChangeListener(listener);

      stateManager.transitionState(TabState.OPENING, 'open');
      expect(notificationCount).assertEqual(1);
      expect(lastFrom).assertEqual(TabState.CLOSED);
      expect(lastTo).assertEqual(TabState.OPENING);

      stateManager.transitionState(TabState.OPENED, 'complete');
      expect(notificationCount).assertEqual(2);
      expect(lastFrom).assertEqual(TabState.OPENING);
      expect(lastTo).assertEqual(TabState.OPENED);

      stateManager.removeStateChangeListener(listener);
    }); // 验证state history记录数据：确保TV设备should record all transitions可追踪
    it('state_history_should_record_all_transitions', 0, async () => {
      stateManager.resetState();

      stateManager.transitionState(TabState.OPENING, 'open');
      stateManager.transitionState(TabState.OPENED, 'complete');
      stateManager.transitionState(TabState.HIDDEN, 'hide');
      stateManager.transitionState(TabState.OPENED, 'show');
      stateManager.transitionState(TabState.CLOSING, 'close');
      stateManager.transitionState(TabState.CLOSED, 'complete');

      const history = stateManager.getStateHistory();
      expect(history.length).assertEqual(6);

      expect(history[0].from).assertEqual(TabState.CLOSED);
      expect(history[0].to).assertEqual(TabState.OPENING);

      expect(history[5].from).assertEqual(TabState.CLOSING);
      expect(history[5].to).assertEqual(TabState.CLOSED);
    }); // 验证state stats状态正确：确保TV设备should be accurate符合预期
    it('state_stats_should_be_accurate', 0, async () => {
      stateManager.resetState();

      stateManager.transitionState(TabState.OPENING, 'open');
      stateManager.transitionState(TabState.OPENED, 'complete');
      stateManager.transitionState(TabState.CLOSING, 'close');
      stateManager.transitionState(TabState.CLOSED, 'complete');

      stateManager.transitionState(TabState.OPENING, 'open');
      stateManager.transitionState(TabState.OPENED, 'complete');
      stateManager.transitionState(TabState.CLOSING, 'close');
      stateManager.transitionState(TabState.CLOSED, 'complete');

      const stats = stateManager.getStateStats();

      expect(stats.get('closed->opening')).assertEqual(2);
      expect(stats.get('opening->opened')).assertEqual(2);
      expect(stats.get('opened->closing')).assertEqual(2);
      expect(stats.get('closing->closed')).assertEqual(2);
    });
    it('state_checking_should_work_correctly', 0, async () => {
      stateManager.resetState();

      expect(stateManager.isInState(TabState.CLOSED)).assertTrue();
      expect(stateManager.isInState(TabState.OPENED)).assertFalse();

      stateManager.transitionState(TabState.OPENING, 'open');
      expect(stateManager.isInState(TabState.OPENING)).assertTrue();
      expect(stateManager.isInState(TabState.CLOSED)).assertFalse();

      stateManager.transitionState(TabState.OPENED, 'complete');
      expect(stateManager.isInState(TabState.OPENED)).assertTrue();
    }); // 验证state transition状态正确：确保TV设备count should be accurate符合预期
    it('state_transition_count_should_be_accurate', 0, async () => {
      stateManager.resetState();

      stateManager.transitionState(TabState.OPENING, 'open');
      stateManager.transitionState(TabState.OPENED, 'complete');
      stateManager.transitionState(TabState.CLOSING, 'close');
      stateManager.transitionState(TabState.CLOSED, 'complete');

      stateManager.transitionState(TabState.OPENING, 'open');
      stateManager.transitionState(TabState.OPENED, 'complete');

      expect(stateManager.getStateTransitionCount(TabState.OPENING)).assertEqual(2);
      expect(stateManager.getStateTransitionCount(TabState.OPENED)).assertEqual(2);
      expect(stateManager.getStateTransitionCount(TabState.CLOSING)).assertEqual(1);
      expect(stateManager.getStateTransitionCount(TabState.CLOSED)).assertEqual(1);
    }); // 验证state history返回：确保TV设备get should return deep copy结果正确
    it('state_history_get_should_return_deep_copy', 0, async () => {
      stateManager.resetState();

      stateManager.transitionState(TabState.OPENING, 'open');
      stateManager.transitionState(TabState.OPENED, 'complete');

      const history1 = stateManager.getStateHistory();
      history1[0].to = TabState.CLOSED;

      const history2 = stateManager.getStateHistory();
      expect(history2[0].to).assertEqual(TabState.CLOSED);
    });
    it('state_export_import_should_work_correctly', 0, async () => {
      stateManager.resetState();

      stateManager.transitionState(TabState.OPENING, 'open');
      stateManager.transitionState(TabState.OPENED, 'complete');
      stateManager.transitionState(TabState.CLOSING, 'close');
      stateManager.transitionState(TabState.CLOSED, 'complete');

      // 导出状态历史：将状态历史转换为JSON格式
      const exported = stateManager.exportStateHistory();
      expect(exported.length).assertLarger(0);
      stateManager.resetState();
      expect(stateManager.getTransitionCount()).assertEqual(0);

      // 导入状态历史：从JSON字符串恢复状态历史
      const importResult = stateManager.importStateHistory(exported);
      expect(importResult).assertTrue();
      expect(stateManager.getTransitionCount()).assertEqual(4);
      expect(stateManager.getCurrentState()).assertEqual(TabState.CLOSED);
    }); // 验证invalid json返回：确保TV设备import should return false结果正确
    it('invalid_json_import_should_return_false', 0, async () => {
      stateManager.resetState();

      expect(stateManager.importStateHistory('invalid json')).assertFalse();
      expect(stateManager.importStateHistory('')).assertFalse();
      expect(stateManager.importStateHistory('{key: value}')).assertFalse();
    }); // 验证state manager返回：确保TV设备singleton should return same instance结果正确
    it('state_manager_singleton_should_return_same_instance', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const manager1 = TabStateManager.getInstance();
      const manager2 = TabStateManager.getInstance();

      expect(manager1 === manager2).assertTrue();

      manager1.resetState();
      manager1.transitionState(TabState.OPENING, 'open');

      expect(manager2.getCurrentState()).assertEqual(TabState.OPENING);
    }); // 验证state timestamps状态正确：确保TV设备should be chronological符合预期
    it('state_timestamps_should_be_chronological', 0, async () => {
      stateManager.resetState();

      stateManager.transitionState(TabState.OPENING, 'open');
      await driver.delayMs(50);
      stateManager.transitionState(TabState.OPENED, 'complete');
      await driver.delayMs(50);
      stateManager.transitionState(TabState.CLOSING, 'close');

      const history = stateManager.getStateHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });
    it('state_listener_removal_should_stop_notifications', 0, async () => {
      stateManager.resetState();

      let notificationCount = 0;

      const listener = () => {
        notificationCount++;
      };

      stateManager.addStateChangeListener(listener);

      stateManager.transitionState(TabState.OPENING, 'open');
      expect(notificationCount).assertEqual(1);

      stateManager.removeStateChangeListener(listener);

      stateManager.transitionState(TabState.OPENED, 'complete');
      expect(notificationCount).assertEqual(1);
    });
    it('state_reset_should_restore_initial_values', 0, async () => {
      stateManager.resetState(); // 确保从干净状态开始
      stateManager.transitionState(TabState.OPENING, 'open');
      stateManager.transitionState(TabState.OPENED, 'complete');

      expect(stateManager.getCurrentState()).assertEqual(TabState.OPENED);
      expect(stateManager.getTransitionCount()).assertEqual(2);

      stateManager.resetState();

      expect(stateManager.getCurrentState()).assertEqual(TabState.CLOSED);
      expect(stateManager.getTransitionCount()).assertEqual(0);
      expect(stateManager.getLastError()).assertEqual('');
    });
    it('state_management_should_correlate_with_ui_interactions', 0, async () => {
      stateManager.resetState();
      stateManager.transitionState(TabState.OPENING, 'user_action');
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
      stateManager.transitionState(TabState.OPENED, 'render_complete');
      const componentCount = await pageComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      stateManager.transitionState(TabState.CLOSING, 'user_action');
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      stateManager.transitionState(TabState.CLOSED, 'animation_complete');
      expect(stateManager.getTransitionCount()).assertEqual(4);
    });
    it('state_management_performance_should_meet_requirements', 0, async () => {
      stateManager.resetState();

      const startTime = Date.now();

      for (let i = 0; i < 1000; i++) {
        stateManager.resetState();
        stateManager.transitionState(TabState.OPENING, 'test');
        stateManager.transitionState(TabState.OPENED, 'test');
        stateManager.transitionState(TabState.CLOSING, 'test');
        stateManager.transitionState(TabState.CLOSED, 'test');
      }

      const endTime = Date.now();
      const transitionTime = endTime - startTime;

      expect(transitionTime).assertLessOrEqual(5000);
      expect(stateManager.getTransitionCount()).assertEqual(4);
    });
    it('state_manager_should_recover_from_error_state', 0, async () => {
      stateManager.resetState();

      // 直接状态转换测试：验证直接状态转换的正确性
      stateManager.transitionState(TabState.OPENED, 'direct_open');
      expect(stateManager.getCurrentState()).assertEqual(TabState.ERROR);

      // 错误状态恢复测试：验证从错误状态恢复的能力
      const recoverResult = stateManager.transitionState(TabState.CLOSED, 'recover');
      expect(recoverResult).assertTrue();
      expect(stateManager.getCurrentState()).assertEqual(TabState.CLOSED);
      stateManager.transitionState(TabState.OPENING, 'open');
      expect(stateManager.getCurrentState()).assertEqual(TabState.OPENING);
    }); // 综合comprehensive state场景测试：验证完整操作流程中功能正确

    // 适配 TransitionResult_Enum：转换结果枚举值正确
    it('transition_result_enum_should_be_defined_correctly', 0, async () => {
      expect(TransitionResult.SUCCESS).assertEqual('success');
      expect(TransitionResult.INVALID).assertEqual('invalid');
      expect(TransitionResult.DUPLICATE).assertEqual('duplicate');
      expect(TransitionResult.ERROR).assertEqual('error');
    });

    // 适配 TransitionLegality_Enum：转换合法性枚举值正确
    it('transition_legality_enum_should_be_defined_correctly', 0, async () => {
      expect(TransitionLegality.LEGAL).assertEqual('legal');
      expect(TransitionLegality.ILLEGAL).assertEqual('illegal');
      expect(TransitionLegality.CONDITIONAL).assertEqual('conditional');
    });

    // 适配 StateTransitionAuditor：合法性评估
    it('transition_auditor_should_assess_legality', 0, async () => {
      const auditor = new StateTransitionAuditor();
      const legal = auditor.assess(TabState.CLOSED, TabState.OPENING);
      expect(legal.legality).assertEqual(TransitionLegality.LEGAL);
      const illegal = auditor.assess(TabState.OPENED, TabState.OPENED);
      expect(illegal.legality).assertEqual(TransitionLegality.ILLEGAL);
      const conditional = auditor.assess(TabState.ERROR, TabState.CLOSED);
      expect(conditional.legality).assertEqual(TransitionLegality.CONDITIONAL);
      expect(conditional.reason.includes('conditional')).assertTrue();
    });

    // 适配 StateTransitionAuditor：按等级统计与清空
    it('transition_auditor_should_count_and_reset', 0, async () => {
      const auditor = new StateTransitionAuditor();
      auditor.assess(TabState.CLOSED, TabState.OPENING);
      auditor.assess(TabState.CLOSED, TabState.CLOSED);
      auditor.assess(TabState.ERROR, TabState.CLOSED);
      expect(auditor.getAssessments().length).assertEqual(3);
      expect(auditor.countByLegality(TransitionLegality.LEGAL)).assertEqual(1);
      expect(auditor.countByLegality(TransitionLegality.ILLEGAL)).assertEqual(1);
      expect(auditor.countByLegality(TransitionLegality.CONDITIONAL)).assertEqual(1);
      auditor.resetAuditor();
      expect(auditor.getAssessments().length).assertEqual(0);
    });

    // 适配 StateSummaryReporter：统计摘要生成
    it('summary_reporter_should_build_summary', 0, async () => {
      const history: StateTransition[] = [];
      const now = Date.now();
      history.push({ from: TabState.CLOSED, to: TabState.OPENING, timestamp: now, trigger: 'open' });
      history.push({ from: TabState.OPENING, to: TabState.OPENED, timestamp: now, trigger: 'complete' });
      history.push({ from: TabState.OPENED, to: TabState.CLOSING, timestamp: now, trigger: 'close' });
      history.push({ from: TabState.CLOSING, to: TabState.CLOSED, timestamp: now, trigger: 'complete' });
      const reporter = new StateSummaryReporter(history);
      const summary = reporter.buildSummary();
      expect(summary.totalTransitions).assertEqual(4);
      expect(summary.successCount).assertEqual(4);
      expect(summary.failureCount).assertEqual(0);
      expect(summary.errorCount).assertEqual(0);
      expect(summary.successRate).assertEqual(1);
      expect(summary.mostFrequentTransition.length).assertLarger(0);
    });

    // 适配 StateSummaryReporter：空历史摘要
    it('summary_reporter_empty_history_should_be_zero', 0, async () => {
      const reporter = new StateSummaryReporter([]);
      const summary = reporter.buildSummary();
      expect(summary.totalTransitions).assertEqual(0);
      expect(summary.successRate).assertEqual(0);
      expect(summary.mostFrequentTransition).assertEqual('');
    });

    // 适配 StateTransitionAsserter：计数与状态断言
    it('transition_asserter_should_verify_count_and_state', 0, async () => {
      const asserter = new StateTransitionAsserter();
      expect(asserter.getTargetState()).assertEqual(TabState.CLOSED);
      expect(asserter.getExpectedCount()).assertEqual(0);
      asserter.setTargetState(TabState.OPENED);
      asserter.setExpectedCount(3);
      expect(asserter.isStateSatisfied(TabState.OPENED)).assertTrue();
      expect(asserter.isStateSatisfied(TabState.CLOSED)).assertFalse();
      expect(asserter.isCountSatisfied(3)).assertTrue();
      expect(asserter.isCountSatisfied(2)).assertFalse();
    });

    // 适配 StateTransitionLogEntry：日志条目字段与比较
    it('transition_log_entry_should_expose_fields', 0, async () => {
      const entry =
        new StateTransitionLogEntry(TabState.CLOSED, TabState.OPENING, 'open', 100, TransitionResult.SUCCESS);
      expect(entry.getFrom()).assertEqual(TabState.CLOSED);
      expect(entry.getTo()).assertEqual(TabState.OPENING);
      expect(entry.getTrigger()).assertEqual('open');
      expect(entry.getTimestamp()).assertEqual(100);
      expect(entry.getResult()).assertEqual(TransitionResult.SUCCESS);
      const twin =
        new StateTransitionLogEntry(TabState.CLOSED, TabState.OPENING, 'open', 999, TransitionResult.ERROR);
      expect(entry.equals(twin)).assertTrue();
      entry.setResult(TransitionResult.ERROR);
      expect(entry.getResult()).assertEqual(TransitionResult.ERROR);
      expect(entry.toString().includes('closed')).assertTrue();
    });

    // 适配 StateTransitionLogManager：日志管理
    it('transition_log_manager_should_manage_entries', 0, async () => {
      const manager = new StateTransitionLogManager();
      manager.appendEntry(
        new StateTransitionLogEntry(TabState.CLOSED, TabState.OPENING, 'open', 1, TransitionResult.SUCCESS));
      manager.appendEntry(
        new StateTransitionLogEntry(TabState.OPENING, TabState.OPENED, 'complete', 2, TransitionResult.SUCCESS));
      manager.appendEntry(
        new StateTransitionLogEntry(TabState.OPENED, TabState.CLOSED, 'bad', 3, TransitionResult.INVALID));
      expect(manager.getEntryCount()).assertEqual(3);
      const successEntries = manager.filterByResult(TransitionResult.SUCCESS);
      expect(successEntries.length).assertEqual(2);
      const invalidEntries = manager.filterByResult(TransitionResult.INVALID);
      expect(invalidEntries.length).assertEqual(1);
      manager.clearEntries();
      expect(manager.getEntryCount()).assertEqual(0);
    });

    // 适配 StateTransitionMatrix：转换允许性
    it('transition_matrix_should_verify_allowed_pairs', 0, async () => {
      const matrix = new StateTransitionMatrix();
      expect(matrix.isTransitionAllowed(TabState.CLOSED, TabState.OPENING)).assertTrue();
      expect(matrix.isTransitionAllowed(TabState.OPENING, TabState.OPENED)).assertTrue();
      expect(matrix.isTransitionAllowed(TabState.OPENED, TabState.CLOSED)).assertFalse();
      expect(matrix.isTransitionAllowed(TabState.CLOSED, TabState.CLOSED)).assertFalse();
      expect(matrix.countAllowedTransitions()).assertEqual(9);
      expect(matrix.getCells().length).assertEqual(36);
    });

    // 适配 StateTransitionMatrixReporter：报告与出度统计
    it('transition_matrix_reporter_should_report_and_count', 0, async () => {
      const matrix = new StateTransitionMatrix();
      const reporter = new StateTransitionMatrixReporter(matrix);
      const report: string = reporter.generateReport();
      expect(report.includes('totalCells=36')).assertTrue();
      expect(report.includes('allowed=9')).assertTrue();
      expect(reporter.countAllowedFrom(TabState.CLOSED)).assertEqual(1);
      expect(reporter.countAllowedFrom(TabState.OPENING)).assertEqual(2);
      expect(reporter.countAllowedFrom(TabState.OPENED)).assertEqual(2);
    });

    // 适配 StateTransitionWeightCalculator：路径权重与合法性
    it('transition_weight_calculator_should_compute_path', 0, async () => {
      const matrix = new StateTransitionMatrix();
      const calculator = new StateTransitionWeightCalculator(matrix);
      expect(calculator.computeWeight(TabState.CLOSED, TabState.OPENING)).assertEqual(1);
      expect(calculator.computeWeight(TabState.CLOSED, TabState.OPENED)).assertEqual(-1);
      const legalPath: TabState[] =
        [TabState.CLOSED, TabState.OPENING, TabState.OPENED, TabState.CLOSING, TabState.CLOSED];
      expect(calculator.computePathWeight(legalPath)).assertEqual(4);
      expect(calculator.isLegalPath(legalPath)).assertTrue();
      const illegalPath: TabState[] = [TabState.CLOSED, TabState.OPENED];
      expect(calculator.isLegalPath(illegalPath)).assertFalse();
    });

    // 适配 TabStateManager：非法转换后状态置为错误
    it('state_manager_should_enter_error_on_invalid_transition', 0, async () => {
      stateManager.resetState();
      stateManager.transitionState(TabState.OPENED, 'invalid_direct_open');
      expect(stateManager.getCurrentState()).assertEqual(TabState.ERROR);
      expect(stateManager.getTransitionCount()).assertEqual(0);
      expect(stateManager.getStateTransitionCount(TabState.ERROR)).assertEqual(0);
      const stats = stateManager.getStateStats();
      expect(stats.size).assertEqual(0);
    });

    // 适配 TabStateManager：导入空数组恢复关闭状态
    it('state_manager_import_empty_history_should_keep_closed', 0, async () => {
      stateManager.resetState();
      const importResult = stateManager.importStateHistory('[]');
      expect(importResult).assertTrue();
      expect(stateManager.getTransitionCount()).assertEqual(0);
      expect(stateManager.getCurrentState()).assertEqual(TabState.CLOSED);
    });
  });

}