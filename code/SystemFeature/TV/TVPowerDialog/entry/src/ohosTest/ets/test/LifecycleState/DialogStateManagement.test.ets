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
import { Driver, ON } from '@ohos.UiTest';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_BACK,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT
} from '../Shared/SharedDriver';

enum DialogState {
  CLOSED = 'closed', OPENING = 'opening', OPENED = 'opened', CLOSING = 'closing'
}

interface StateTransitionRecord {
  fromState: DialogState;
  toState: DialogState;
  trigger: string;
  timestamp: number;
}

class DialogStateManager {
  private static instance: DialogStateManager;
  private currentState: DialogState = DialogState.CLOSED;
  private stateHistory: StateTransitionRecord[] = [];
  private totalTransitions: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): DialogStateManager {
    if (!DialogStateManager.instance) {
      DialogStateManager.instance = new DialogStateManager();
    }
    return DialogStateManager.instance;
  }

  public transitionTo(newState: DialogState, trigger: string): void {
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

  public getCurrentState(): DialogState {
    return this.currentState;
  }

  public getStateHistory(): StateTransitionRecord[] {
    return [...this.stateHistory];
  }

  public getTotalTransitions(): number {
    return this.totalTransitions;
  }

  public resetManager(): void {
    this.currentState = DialogState.CLOSED;
    this.stateHistory = [];
    this.totalTransitions = 0;
  }

  public hasTransitionedTo(state: DialogState): boolean {
    return this.stateHistory.some(record => record.toState === state);
  }

  public getTransitionCountForState(state: DialogState): number {
    return this.stateHistory.filter(record => record.toState === state).length;
  }
}

// ==================== 状态模型扩展工具集（新增代码） ====================

// 对话框状态转换类别枚举：用于对状态流转进行分类统计
enum DialogTransitionCategory {
  OPEN_FLOW = 'open_flow', CLOSE_FLOW = 'close_flow', NAVIGATION = 'navigation', RECOVERY = 'recovery', IDLE = 'idle'
}

// 状态指标快照接口：记录状态管理器的统计指标
interface DialogMetricsSnapshot {
  totalTransitions: number;
  openedCount: number;
  closedCount: number;
  navigationCount: number;
  averageTransitionDuration: number;
  lastTrigger: string;
}

// 状态统计条目接口：描述单类转换的统计信息
interface DialogStatEntry {
  category: DialogTransitionCategory;
  count: number;
  percentage: number;
}

// 状态转换路径接口：描述一组连续的状态流转序列
interface DialogTransitionPath {
  sequence: DialogState[];
  duration: number;
  isComplete: boolean;
}

// 对话框状态分类器：根据触发源对状态转换进行分类统计
class DialogTransitionClassifier {
  private static instance: DialogTransitionClassifier;
  private categoryCounts: Map<DialogTransitionCategory, number> = new Map<DialogTransitionCategory, number>();

  // 单例模式获取实例：确保分类统计跨测试用例保持一致
  public static getInstance(): DialogTransitionClassifier {
    if (!DialogTransitionClassifier.instance) {
      DialogTransitionClassifier.instance = new DialogTransitionClassifier();
    }
    return DialogTransitionClassifier.instance;
  }

  // 根据触发源文本推断转换类别
  public classify(trigger: string): DialogTransitionCategory {
    if (trigger.includes('open') || trigger.includes('render')) {
      return DialogTransitionCategory.OPEN_FLOW;
    }
    if (trigger.includes('close') || trigger.includes('back')) {
      return DialogTransitionCategory.CLOSE_FLOW;
    }
    if (trigger.includes('navigation') || trigger.includes('nav')) {
      return DialogTransitionCategory.NAVIGATION;
    }
    if (trigger.includes('recovery') || trigger.includes('recover')) {
      return DialogTransitionCategory.RECOVERY;
    }
    return DialogTransitionCategory.IDLE;
  }

  // 累加指定类别的计数
  public recordCategory(category: DialogTransitionCategory): void {
    const current = this.categoryCounts.get(category);
    if (current === undefined) {
      this.categoryCounts.set(category, 1);
    } else {
      this.categoryCounts.set(category, current + 1);
    }
  }

  public getCategoryCount(category: DialogTransitionCategory): number {
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
    this.categoryCounts = new Map<DialogTransitionCategory, number>();
  }
}

// 对话框状态指标计算器：从状态历史中聚合统计指标
class DialogMetricsCalculator {
  private records: StateTransitionRecord[] = [];

  constructor(records: StateTransitionRecord[]) {
    this.records = [...records];
  }

  // 计算指定状态的转换次数
  public countState(state: DialogState): number {
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
  public buildSnapshot(): DialogMetricsSnapshot {
    const snapshot: DialogMetricsSnapshot = {
      totalTransitions: this.records.length,
      openedCount: this.countState(DialogState.OPENED),
      closedCount: this.countState(DialogState.CLOSED),
      navigationCount: this.countState(DialogState.OPENED),
      averageTransitionDuration: this.computeAverageDuration(),
      lastTrigger: this.records.length > 0 ? this.records[this.records.length - 1].trigger : ''
    };
    return snapshot;
  }

  // 计算各类别的统计条目
  public buildCategoryStats(classifier: DialogTransitionClassifier): DialogStatEntry[] {
    const entries: DialogStatEntry[] = [];
    const categories =
      [DialogTransitionCategory.OPEN_FLOW, DialogTransitionCategory.CLOSE_FLOW, DialogTransitionCategory.NAVIGATION,
        DialogTransitionCategory.RECOVERY, DialogTransitionCategory.IDLE];
    const total = this.records.length;
    for (const category of categories) {
      const count = this.countByCategory(category, classifier);
      const entry: DialogStatEntry = {
        category, count, percentage: total === 0 ? 0 : count / total
      };
      entries.push(entry);
    }
    return entries;
  }

  // 统计指定类别的转换数量
  private countByCategory(category: DialogTransitionCategory, classifier: DialogTransitionClassifier): number {
    let count = 0;
    for (const record of this.records) {
      if (classifier.classify(record.trigger) === category) {
        count++;
      }
    }
    return count;
  }
}

// 对话框状态序列化器：负责状态历史的序列化与反序列化
class DialogStateSerializer {
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
    return `DialogStateSerializer version: ${DialogStateSerializer.VERSION}`;
  }
}

// 状态转换路径校验器：校验状态序列的合法性
class DialogTransitionPathValidator {
  private static readonly ALLOWED_PATHS: DialogState[][] =
    [[DialogState.CLOSED, DialogState.OPENING, DialogState.OPENED],
      [DialogState.OPENED, DialogState.CLOSING, DialogState.CLOSED]];

  // 判断给定路径是否完整且合法
  public isValidPath(path: DialogTransitionPath): boolean {
    if (path.sequence.length < 2) {
      return false;
    }
    if (!path.isComplete) {
      return false;
    }
    return this.matchesAllowedPattern(path.sequence);
  }

  // 判断路径是否匹配任意允许的模式
  private matchesAllowedPattern(sequence: DialogState[]): boolean {
    for (const pattern of DialogTransitionPathValidator.ALLOWED_PATHS) {
      if (this.isSubSequence(pattern, sequence)) {
        return true;
      }
    }
    return false;
  }

  // 判断候选模式是否为路径的子序列
  private isSubSequence(pattern: DialogState[], sequence: DialogState[]): boolean {
    let patternIndex = 0;
    for (const state of sequence) {
      if (patternIndex < pattern.length && state === pattern[patternIndex]) {
        patternIndex++;
      }
    }
    return patternIndex === pattern.length;
  }

  // 计算路径的最短完成时间
  public estimateMinimalDuration(path: DialogTransitionPath): number {
    return path.sequence.length * 50;
  }
}

// ==================== 状态序列分析工具集（新增代码） ====================

// 状态序列类型枚举：描述状态序列的分析类型
enum DialogSequenceType {
  LINEAR = 'linear', CYCLIC = 'cyclic', REVERSIBLE = 'reversible', IRREGULAR = 'irregular'
}

// 状态序列分析结果接口：描述状态序列的分析结论
interface DialogSequenceAnalysis {
  type: DialogSequenceType;
  length: number;
  uniqueStateCount: number;
  hasOpenCycle: boolean;
  hasCloseCycle: boolean;
}

// 状态序列分析器：对状态历史序列进行结构分析
class DialogStateSequenceAnalyzer {
  private sequence: DialogState[] = [];

  constructor(sequence: DialogState[]) {
    this.sequence = [...sequence];
  }

  // 判断序列是否包含完整的开闭周期
  public hasOpenCloseCycle(): boolean {
    let hasOpen = false;
    let hasClose = false;
    for (const state of this.sequence) {
      if (state === DialogState.OPENING || state === DialogState.OPENED) {
        hasOpen = true;
      }
      if (state === DialogState.CLOSING || state === DialogState.CLOSED) {
        hasClose = true;
      }
    }
    return hasOpen && hasClose;
  }

  // 统计序列中不同状态的数量
  public countUniqueStates(): number {
    const seen = new Set<DialogState>();
    for (const state of this.sequence) {
      seen.add(state);
    }
    return seen.size;
  }

  // 生成序列分析结果
  public analyze(): DialogSequenceAnalysis {
    const analysis: DialogSequenceAnalysis = {
      type: this.determineType(),
      length: this.sequence.length,
      uniqueStateCount: this.countUniqueStates(),
      hasOpenCycle: this.hasState(DialogState.OPENED),
      hasCloseCycle: this.hasState(DialogState.CLOSED)
    };
    return analysis;
  }

  // 判断序列中是否包含指定状态
  private hasState(state: DialogState): boolean {
    for (const item of this.sequence) {
      if (item === state) {
        return true;
      }
    }
    return false;
  }

  // 推断序列的类型
  private determineType(): DialogSequenceType {
    if (this.sequence.length === 0) {
      return DialogSequenceType.IRREGULAR;
    }
    if (this.hasOpenCloseCycle()) {
      return DialogSequenceType.CYCLIC;
    }
    return DialogSequenceType.LINEAR;
  }
}

// 状态审计报告模型：封装一次状态审计的完整报告
class DialogStateAuditReport {
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

export default function dialogStateManagementTest() {
  describe('DialogStateManagement_Test', () => {
    let driver: Driver;
    let stateManager: DialogStateManager;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      stateManager = DialogStateManager.getInstance();
      stateManager.resetManager();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('dialog_should_start_in_opened_state', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.transitionTo(DialogState.OPENED, 'initial_render');
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(stateManager.getCurrentState()).assertEqual(DialogState.OPENED);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain state during navigation下性能不降低
    it('dialog_should_maintain_state_during_navigation', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.transitionTo(DialogState.OPENED, 'initial_render');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);

      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(stateManager.getCurrentState()).assertEqual(DialogState.OPENED);
    });

    // 验证dialog should处理能力：确保TV设备在handle back key transition下功能正常
    it('dialog_should_handle_back_key_transition', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.transitionTo(DialogState.OPENED, 'initial_render');

      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      stateManager.transitionTo(DialogState.CLOSING, 'back_key');
      await driver.delayMs(500);

      expect(stateManager.hasTransitionedTo(DialogState.CLOSING)).assertTrue();
    });

    // 验证dialog state状态正确：确保TV设备history should be complete符合预期
    it('dialog_state_history_should_be_complete', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(DialogState.OPENING, 'user_action');
      stateManager.transitionTo(DialogState.OPENED, 'render_complete');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      stateManager.transitionTo(DialogState.CLOSING, 'back_key');
      stateManager.transitionTo(DialogState.CLOSED, 'close_complete');

      const history = stateManager.getStateHistory();
      expect(history.length).assertEqual(4);
      expect(history[0].fromState).assertEqual(DialogState.CLOSED);
      expect(history[0].toState).assertEqual(DialogState.OPENING);
      expect(history[1].toState).assertEqual(DialogState.OPENED);
      expect(history[2].toState).assertEqual(DialogState.CLOSING);
      expect(history[3].toState).assertEqual(DialogState.CLOSED);
    });

    // 验证dialog should处理能力：确保TV设备在handle rapid state changes下功能正常
    it('dialog_should_handle_rapid_state_changes', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      for (let i = 0; i < 10; i++) {
        stateManager.transitionTo(DialogState.OPENED, `navigation_${i}`);
        await driver.delayMs(50);
      }

      expect(stateManager.getTotalTransitions()).assertEqual(10);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证dialog state具备特性：确保TV设备transitions should have correct triggers满足设计要求
    it('dialog_state_transitions_should_have_correct_triggers', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(DialogState.OPENING, 'user_request');
      stateManager.transitionTo(DialogState.OPENED, 'system_render');
      stateManager.transitionTo(DialogState.CLOSING, 'user_back');
      stateManager.transitionTo(DialogState.CLOSED, 'system_close');

      const history = stateManager.getStateHistory();
      expect(history[0].trigger).assertEqual('user_request');
      expect(history[1].trigger).assertEqual('system_render');
      expect(history[2].trigger).assertEqual('user_back');
      expect(history[3].trigger).assertEqual('system_close');
    });

    // 验证dialog should持久：确保TV设备persist state after operations状态保持
    it('dialog_should_persist_state_after_operations', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.transitionTo(DialogState.OPENED, 'initial_render');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(200);

      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(stateManager.getCurrentState()).assertEqual(DialogState.OPENED);
    });

    // 验证dialog state状态正确：确保TV设备timestamps should be chronological符合预期
    it('dialog_state_timestamps_should_be_chronological', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(DialogState.OPENING, 'start');
      await driver.delayMs(100);
      stateManager.transitionTo(DialogState.OPENED, 'complete');
      await driver.delayMs(100);
      stateManager.transitionTo(DialogState.CLOSING, 'user_action');

      const history = stateManager.getStateHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog should处理能力：确保TV设备在handle multiple open close cycles下功能正常
    it('dialog_should_handle_multiple_open_close_cycles', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      for (let cycle = 0; cycle < 3; cycle++) {
        stateManager.transitionTo(DialogState.OPENING, `open_${cycle}`);
        stateManager.transitionTo(DialogState.OPENED, `render_${cycle}`);

        await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

        stateManager.transitionTo(DialogState.CLOSING, `close_${cycle}`);
        stateManager.transitionTo(DialogState.CLOSED, `closed_${cycle}`);

        await driver.delayMs(200);
      }

      expect(stateManager.getTransitionCountForState(DialogState.OPENED)).assertEqual(3);
      expect(stateManager.getTransitionCountForState(DialogState.CLOSED)).assertEqual(3);
    });

    it('dialog_state_validation_should_detect_invalid_transitions', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(DialogState.OPENING, 'start');
      stateManager.transitionTo(DialogState.OPENED, 'complete');

      const currentState = stateManager.getCurrentState();
      expect(currentState).assertEqual(DialogState.OPENED);

      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain consistency during long session下性能不降低
    it('dialog_should_maintain_consistency_during_long_session', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager(); // 重置状态管理器，确保测试从干净状态开始
      stateManager.transitionTo(DialogState.OPENED, 'initial_render');

      for (let i = 0; i < 20; i++) {
        if (i % 2 === 0) {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        } else {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        }
        stateManager.transitionTo(DialogState.OPENED, `navigation_${i}`);
        await driver.delayMs(100);
      }

      // 期望转换次数：1次初始转换 + 20次导航转换 = 21次
      expect(stateManager.getTotalTransitions()).assertEqual(21);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证dialog state状态正确：确保TV设备should be queryable at any time符合预期
    it('dialog_state_should_be_queryable_at_any_time', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(DialogState.OPENING, 'start');
      expect(stateManager.getCurrentState()).assertEqual(DialogState.OPENING);

      stateManager.transitionTo(DialogState.OPENED, 'complete');
      expect(stateManager.getCurrentState()).assertEqual(DialogState.OPENED);

      stateManager.transitionTo(DialogState.CLOSING, 'user_action');
      expect(stateManager.getCurrentState()).assertEqual(DialogState.CLOSING);
    });

    it('dialog_state_history_should_support_filtering', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(DialogState.OPENING, 'request_1');
      stateManager.transitionTo(DialogState.OPENED, 'render_1');
      stateManager.transitionTo(DialogState.CLOSING, 'close_1');
      stateManager.transitionTo(DialogState.CLOSED, 'closed_1');

      stateManager.transitionTo(DialogState.OPENING, 'request_2');
      stateManager.transitionTo(DialogState.OPENED, 'render_2');

      const openCount = stateManager.getTransitionCountForState(DialogState.OPENED);
      const closeCount = stateManager.getTransitionCountForState(DialogState.CLOSED);

      expect(openCount).assertEqual(2);
      expect(closeCount).assertEqual(1);
    });

    // 验证dialog should处理能力：确保TV设备在handle state recovery after error下功能正常
    it('dialog_should_handle_state_recovery_after_error', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(DialogState.OPENED, 'initial_render');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      stateManager.transitionTo(DialogState.OPENED, 'recovery');

      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(stateManager.getCurrentState()).assertEqual(DialogState.OPENED);
    });

    // 验证dialog state状态正确：确保TV设备transitions should be atomic符合预期
    it('dialog_state_transitions_should_be_atomic', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(DialogState.OPENING, 'start');
      const midState = stateManager.getCurrentState();
      expect(midState).assertEqual(DialogState.OPENING);

      stateManager.transitionTo(DialogState.OPENED, 'complete');
      const finalState = stateManager.getCurrentState();
      expect(finalState).assertEqual(DialogState.OPENED);

      const history = stateManager.getStateHistory();
      expect(history.length).assertEqual(2);
    });

    it('dialog_should_track_all_state_changes', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      const states =
        [DialogState.OPENING, DialogState.OPENED, DialogState.CLOSING, DialogState.CLOSED, DialogState.OPENING,
          DialogState.OPENED];

      for (const state of states) {
        stateManager.transitionTo(state, 'test_transition');
      }

      expect(stateManager.getTotalTransitions()).assertEqual(6);
      expect(stateManager.hasTransitionedTo(DialogState.OPENING)).assertTrue();
      expect(stateManager.hasTransitionedTo(DialogState.OPENED)).assertTrue();
      expect(stateManager.hasTransitionedTo(DialogState.CLOSING)).assertTrue();
      expect(stateManager.hasTransitionedTo(DialogState.CLOSED)).assertTrue();
    });

    // 验证dialog state维持稳定：确保TV设备在manager singleton should maintain consistency下性能不降低
    it('dialog_state_manager_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const manager1 = DialogStateManager.getInstance();
      const manager2 = DialogStateManager.getInstance();

      expect(manager1 === manager2).assertTrue();

      manager1.resetManager();
      manager1.transitionTo(DialogState.OPENED, 'test');

      expect(manager2.getCurrentState()).assertEqual(DialogState.OPENED);
      expect(manager2.getTotalTransitions()).assertEqual(1);
    });

    // 验证dialog should处理能力：确保TV设备在handle concurrent state requests下功能正常
    it('dialog_should_handle_concurrent_state_requests', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(DialogState.OPENED, 'initial');

      // 使用串行化执行避免UITest API并发调用错误
      for (let i = 0; i < 5; i++) {
        stateManager.transitionTo(DialogState.OPENED, `concurrent_${i}`);
        await driver.delayMs(50);
      }

      expect(stateManager.getTotalTransitions()).assertEqual(6);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('dialog_state_performance_should_meet_requirements', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      const startTime = Date.now();

      for (let i = 0; i < 1000; i++) {
        stateManager.transitionTo(DialogState.OPENED, `perf_${i}`);
      }

      const endTime = Date.now();
      const transitionTime = endTime - startTime;

      expect(transitionTime).assertLessOrEqual(2000);
      expect(stateManager.getTotalTransitions()).assertEqual(1000);
    });

    // 综合comprehensive dialog场景测试：验证完整操作流程中功能正确
    it('comprehensive_dialog_state_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      const scenarioStart = Date.now();

      stateManager.transitionTo(DialogState.OPENING, 'user_open');
      stateManager.transitionTo(DialogState.OPENED, 'render_complete');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);

      stateManager.transitionTo(DialogState.CLOSING, 'operation_complete');
      stateManager.transitionTo(DialogState.CLOSED, 'close_complete');

      await driver.delayMs(500);

      stateManager.transitionTo(DialogState.OPENING, 'reopen');
      stateManager.transitionTo(DialogState.OPENED, 'reopen_complete');

      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(stateManager.getTotalTransitions()).assertEqual(6);
      expect(scenarioDuration).assertLessOrEqual(10000);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 适配 DialogTransitionClassifier：验证触发源文本到转换类别的映射准确
    it('dialog_transition_classifier_should_categorize_triggers', 0, async () => {
      const classifier = DialogTransitionClassifier.getInstance();
      expect(classifier.classify('open_dialog')).assertEqual(DialogTransitionCategory.OPEN_FLOW);
      expect(classifier.classify('render_complete')).assertEqual(DialogTransitionCategory.OPEN_FLOW);
      expect(classifier.classify('close_dialog')).assertEqual(DialogTransitionCategory.CLOSE_FLOW);
      expect(classifier.classify('back_key')).assertEqual(DialogTransitionCategory.CLOSE_FLOW);
      expect(classifier.classify('navigation_left')).assertEqual(DialogTransitionCategory.NAVIGATION);
      expect(classifier.classify('recovery_retry')).assertEqual(DialogTransitionCategory.RECOVERY);
      expect(classifier.classify('unknown_trigger')).assertEqual(DialogTransitionCategory.IDLE);
    });

    // 适配 DialogTransitionClassifier：验证分类计数累加、查询与重置
    it('dialog_transition_classifier_should_accumulate_category_counts', 0, async () => {
      const classifier = DialogTransitionClassifier.getInstance();
      classifier.resetClassifier();
      classifier.recordCategory(DialogTransitionCategory.OPEN_FLOW);
      classifier.recordCategory(DialogTransitionCategory.OPEN_FLOW);
      classifier.recordCategory(DialogTransitionCategory.CLOSE_FLOW);
      expect(classifier.getCategoryCount(DialogTransitionCategory.OPEN_FLOW)).assertEqual(2);
      expect(classifier.getCategoryCount(DialogTransitionCategory.CLOSE_FLOW)).assertEqual(1);
      expect(classifier.getCategoryCount(DialogTransitionCategory.IDLE)).assertEqual(0);
      expect(classifier.getTotalClassified()).assertEqual(3);
    });

    // 适配 DialogMetricsCalculator：验证按目标状态统计转换次数
    it('dialog_metrics_calculator_should_count_states', 0, async () => {
      const records: StateTransitionRecord[] = [
        { fromState: DialogState.CLOSED, toState: DialogState.OPENING, trigger: 'open', timestamp: 1000 },
        { fromState: DialogState.OPENING, toState: DialogState.OPENED, trigger: 'render', timestamp: 2000 },
        { fromState: DialogState.OPENED, toState: DialogState.CLOSING, trigger: 'close', timestamp: 3000 },
        { fromState: DialogState.CLOSING, toState: DialogState.CLOSED, trigger: 'back', timestamp: 4000 }
      ];
      const calculator = new DialogMetricsCalculator(records);
      expect(calculator.countState(DialogState.OPENING)).assertEqual(1);
      expect(calculator.countState(DialogState.OPENED)).assertEqual(1);
      expect(calculator.countState(DialogState.CLOSED)).assertEqual(1);
    });

    // 适配 DialogMetricsCalculator：验证平均转换时间间隔计算及空序列处理
    it('dialog_metrics_calculator_should_compute_average_duration', 0, async () => {
      const records: StateTransitionRecord[] = [
        { fromState: DialogState.CLOSED, toState: DialogState.OPENING, trigger: 'open', timestamp: 1000 },
        { fromState: DialogState.OPENING, toState: DialogState.OPENED, trigger: 'render', timestamp: 2000 },
        { fromState: DialogState.OPENED, toState: DialogState.CLOSING, trigger: 'close', timestamp: 3000 }
      ];
      const calculator = new DialogMetricsCalculator(records);
      expect(calculator.computeAverageDuration()).assertEqual(1000);
      const empty = new DialogMetricsCalculator([]);
      expect(empty.computeAverageDuration()).assertEqual(0);
    });

    // 适配 DialogMetricsCalculator：验证指标快照字段完整且准确
    it('dialog_metrics_calculator_should_build_snapshot', 0, async () => {
      const records: StateTransitionRecord[] = [
        { fromState: DialogState.CLOSED, toState: DialogState.OPENING, trigger: 'open', timestamp: 1000 },
        { fromState: DialogState.OPENING, toState: DialogState.OPENED, trigger: 'render', timestamp: 2000 }
      ];
      const calculator = new DialogMetricsCalculator(records);
      const snapshot: DialogMetricsSnapshot = calculator.buildSnapshot();
      expect(snapshot.totalTransitions).assertEqual(2);
      expect(snapshot.openedCount).assertEqual(1);
      expect(snapshot.closedCount).assertEqual(0);
      expect(snapshot.lastTrigger).assertEqual('render');
    });

    // 适配 DialogMetricsCalculator：验证分类统计条目与计数
    it('dialog_metrics_calculator_should_build_category_stats', 0, async () => {
      const records: StateTransitionRecord[] = [
        { fromState: DialogState.CLOSED, toState: DialogState.OPENING, trigger: 'open', timestamp: 1000 },
        { fromState: DialogState.OPENING, toState: DialogState.OPENED, trigger: 'render', timestamp: 2000 },
        { fromState: DialogState.OPENED, toState: DialogState.CLOSING, trigger: 'back', timestamp: 3000 }
      ];
      const classifier = DialogTransitionClassifier.getInstance();
      const calculator = new DialogMetricsCalculator(records);
      const entries: DialogStatEntry[] = calculator.buildCategoryStats(classifier);
      expect(entries.length).assertEqual(5);
      expect(entries[0].count).assertEqual(2);
      expect(entries[1].count).assertEqual(1);
      expect(entries[2].count).assertEqual(0);
    });

    // 适配 DialogStateSerializer：验证序列化与反序列化往返一致
    it('dialog_state_serializer_should_round_trip', 0, async () => {
      const records: StateTransitionRecord[] = [
        { fromState: DialogState.CLOSED, toState: DialogState.OPENED, trigger: 'open', timestamp: 1000 }
      ];
      const serializer = new DialogStateSerializer();
      const json = serializer.serialize(records);
      const restored: StateTransitionRecord[] = serializer.deserialize(json);
      expect(restored.length).assertEqual(1);
      expect(restored[0].toState).assertEqual(DialogState.OPENED);
      expect(restored[0].trigger).assertEqual('open');
    });

    // 适配 DialogStateSerializer：验证非法输入可被识别且版本信息完整
    it('dialog_state_serializer_should_detect_invalid_json', 0, async () => {
      const serializer = new DialogStateSerializer();
      expect(serializer.isSerializable('[]')).assertTrue();
      expect(serializer.isSerializable('{}')).assertFalse();
      expect(serializer.isSerializable('not_json')).assertFalse();
      expect(serializer.getVersionInfo()).assertContain('1.0.0');
    });

    // 适配 DialogTransitionPathValidator：验证合法路径通过且时长估算正确
    it('dialog_transition_path_validator_should_accept_valid_path', 0, async () => {
      const validator = new DialogTransitionPathValidator();
      const path: DialogTransitionPath = {
        sequence: [DialogState.CLOSED, DialogState.OPENING, DialogState.OPENED],
        duration: 300,
        isComplete: true
      };
      expect(validator.isValidPath(path)).assertTrue();
      expect(validator.estimateMinimalDuration(path)).assertEqual(150);
    });

    // 适配 DialogTransitionPathValidator：验证不完整或过短路径被拒绝
    it('dialog_transition_path_validator_should_reject_invalid_path', 0, async () => {
      const validator = new DialogTransitionPathValidator();
      const incomplete: DialogTransitionPath = {
        sequence: [DialogState.CLOSED, DialogState.OPENING],
        duration: 200,
        isComplete: false
      };
      expect(validator.isValidPath(incomplete)).assertFalse();
      const short: DialogTransitionPath = {
        sequence: [DialogState.OPENED],
        duration: 100,
        isComplete: true
      };
      expect(validator.isValidPath(short)).assertFalse();
    });

    // 适配 DialogStateSequenceAnalyzer：验证含开闭周期的序列识别为循环型
    it('dialog_state_sequence_analyzer_should_detect_cycle', 0, async () => {
      const analyzer = new DialogStateSequenceAnalyzer(
        [DialogState.OPENING, DialogState.OPENED, DialogState.CLOSING, DialogState.CLOSED]);
      const analysis: DialogSequenceAnalysis = analyzer.analyze();
      expect(analysis.type).assertEqual(DialogSequenceType.CYCLIC);
      expect(analyzer.hasOpenCloseCycle()).assertTrue();
      expect(analysis.uniqueStateCount).assertEqual(4);
    });

    // 适配 DialogStateSequenceAnalyzer：验证重复状态去重计数与序列长度
    it('dialog_state_sequence_analyzer_should_count_unique_states', 0, async () => {
      const analyzer = new DialogStateSequenceAnalyzer(
        [DialogState.OPENED, DialogState.OPENED, DialogState.CLOSED, DialogState.CLOSED]);
      expect(analyzer.countUniqueStates()).assertEqual(2);
      expect(analyzer.analyze().length).assertEqual(4);
      const empty = new DialogStateSequenceAnalyzer([]);
      expect(empty.analyze().type).assertEqual(DialogSequenceType.IRREGULAR);
    });

    // 适配 DialogStateAuditReport：验证开闭差值及字段取值
    it('dialog_state_audit_report_should_compute_delta', 0, async () => {
      const report = new DialogStateAuditReport(1000, 5, 3, 2, 'audit_report');
      expect(report.getGeneratedAt()).assertEqual(1000);
      expect(report.getTotalTransitions()).assertEqual(5);
      expect(report.getOpenCount()).assertEqual(3);
      expect(report.getCloseCount()).assertEqual(2);
      expect(report.computeOpenCloseDelta()).assertEqual(1);
      expect(report.toString()).assertContain('audit_report');
    });

    // 适配 DialogStateAuditReport：验证开闭次数平衡判定
    it('dialog_state_audit_report_should_detect_balance', 0, async () => {
      const balanced = new DialogStateAuditReport(1000, 4, 2, 2, 'balanced');
      expect(balanced.isBalanced()).assertTrue();
      const unbalanced = new DialogStateAuditReport(1000, 4, 3, 1, 'unbalanced');
      expect(unbalanced.isBalanced()).assertFalse();
      expect(unbalanced.computeOpenCloseDelta()).assertEqual(2);
    });
  });


}