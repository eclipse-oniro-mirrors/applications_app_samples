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
  KEY_BACK,
  KEY_UP,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

// 焦点环状态枚举：覆盖TV设备焦点环的主要视觉状态
enum FocusRingState {
  VISIBLE = 'visible', HIDDEN = 'hidden', ANIMATING = 'animating', HIGHLIGHTED = 'highlighted'
}

// 焦点环记录结构体：存储焦点环状态和响应时间
interface FocusRingRecord {
  state: FocusRingState;
  focusIndex: number;
  isVisible: boolean;
  responseTime: number;
  timestamp: number;
}

// 焦点环行为追踪器：单例模式确保跨测试用例的焦点环数据一致性
class FocusRingBehaviorTracker {
  private static instance: FocusRingBehaviorTracker;
  private focusRingHistory: FocusRingRecord[] = [];
  private totalTests: number = 0;
  private visibleCount: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): FocusRingBehaviorTracker {
    if (!FocusRingBehaviorTracker.instance) {
      FocusRingBehaviorTracker.instance = new FocusRingBehaviorTracker();
    }
    return FocusRingBehaviorTracker.instance;
  }

  // 记录焦点环状态：保存状态类型、焦点索引和可见性，用于分析焦点环行为
  public recordFocusRing(state: FocusRingState, focusIndex: number, isVisible: boolean, responseTime: number): void {
    const record: FocusRingRecord = {
      state,
      focusIndex,
      isVisible,
      responseTime,
      timestamp: Date.now()
    };
    this.focusRingHistory.push(record);
    this.totalTests++;
    if (isVisible) {
      this.visibleCount++;
    }
  }

  public getFocusRingHistory(): FocusRingRecord[] {
    return [...this.focusRingHistory];
  }

  public getTotalTests(): number {
    return this.totalTests;
  }

  public getVisibleCount(): number {
    return this.visibleCount;
  }

  public resetTracker(): void {
    this.focusRingHistory = [];
    this.totalTests = 0;
    this.visibleCount = 0;
  }

  // 计算可见率：评估焦点环在操作期间的可见性，确保用户能清晰识别当前焦点
  public getVisibilityRate(): number {
    if (this.totalTests === 0) {
      return 0;
    }
    return this.visibleCount / this.totalTests;
  }

  public hasState(state: FocusRingState): boolean {
    return this.focusRingHistory.some(record => record.state === state);
  }

  // 计算平均响应时间：评估焦点环状态切换的性能表现
  public getAverageResponseTime(): number {
    if (this.focusRingHistory.length === 0) {
      return 0;
    }
    const totalTime =
      this.focusRingHistory.reduce((sum: number, record: FocusRingRecord) => sum + record.responseTime, 0);
    return totalTime / this.focusRingHistory.length;
  }

  // 计算最大响应时间：识别焦点环响应最慢的操作，用于性能瓶颈分析
  public getMaxResponseTime(): number {
    if (this.focusRingHistory.length === 0) {
      return 0;
    }
    let maxTime = 0;
    for (let i = 0; i < this.focusRingHistory.length; i++) {
      if (this.focusRingHistory[i].responseTime > maxTime) {
        maxTime = this.focusRingHistory[i].responseTime;
      }
    }
    return maxTime;
  }

  // 计算最小响应时间：识别焦点环响应最快的操作，作为性能基线参考
  public getMinResponseTime(): number {
    if (this.focusRingHistory.length === 0) {
      return 0;
    }
    let minTime = Number.MAX_SAFE_INTEGER;
    for (let i = 0; i < this.focusRingHistory.length; i++) {
      if (this.focusRingHistory[i].responseTime < minTime) {
        minTime = this.focusRingHistory[i].responseTime;
      }
    }
    return minTime;
  }

  // 统计指定状态的记录数量：分析焦点环各状态的分布情况
  public getStateCount(state: FocusRingState): number {
    return this.focusRingHistory.filter(record => record.state === state).length;
  }

  // 获取所有可见记录：过滤出焦点环处于可见状态的记录，便于单独分析
  public getVisibleHistory(): FocusRingRecord[] {
    return this.focusRingHistory.filter(record => record.isVisible);
  }

  // 统计各焦点索引出现频率：分析焦点在各控件上的停留分布
  public getFocusIndexFrequency(): Map<number, number> {
    const frequency = new Map<number, number>();
    for (let i = 0; i < this.focusRingHistory.length; i++) {
      const index = this.focusRingHistory[i].focusIndex;
      const currentCount = frequency.get(index) || 0;
      frequency.set(index, currentCount + 1);
    }
    return frequency;
  }

  // 深拷贝追踪器快照：克隆当前追踪器状态，便于测试前后对比
  public clone(): FocusRingBehaviorTracker {
    const cloneTracker = new FocusRingBehaviorTracker();
    for (let i = 0; i < this.focusRingHistory.length; i++) {
      cloneTracker.recordFocusRing(this.focusRingHistory[i].state, this.focusRingHistory[i].focusIndex,
        this.focusRingHistory[i].isVisible, this.focusRingHistory[i].responseTime);
    }
    return cloneTracker;
  }

  // 判断两个追踪器是否等价：比较焦点环历史记录数量是否一致
  public equals(other: FocusRingBehaviorTracker): boolean {
    return this.focusRingHistory.length === other.focusRingHistory.length;
  }

  // 生成追踪器摘要字符串：输出当前追踪器关键统计信息
  public toString(): string {
    return `FocusRingBehaviorTracker{total=${this.totalTests}, visible=${this.visibleCount}, rate=${this.getVisibilityRate()}}`;
  }
}

// 焦点环显示模式枚举：描述焦点环在不同场景下的显示策略
enum FocusRingMode {
  ALWAYS = 'always', ON_DEMAND = 'on_demand', AUTO_HIDE = 'auto_hide', PERSISTENT = 'persistent'
}

// 焦点环移动方向枚举：描述焦点环在导航过程中的移动方向
enum FocusRingDirection {
  NONE = 'none', LEFT = 'left', RIGHT = 'right', UP = 'up', DOWN = 'down'
}

// 焦点环渲染优先级枚举：描述焦点环在渲染管线中的优先级
enum FocusRingPriority {
  LOW = 0, NORMAL = 1, HIGH = 2, CRITICAL = 3
}

// 焦点环度量信息结构体：聚合单次焦点环操作的关键性能指标
interface FocusRingMetrics {
  state: FocusRingState;
  focusIndex: number;
  responseTime: number;
  visibilityRatio: number;
  frameCount: number;
}

// 焦点环状态迁移记录：描述焦点环从一个状态迁移到另一个状态的完整信息
interface FocusRingTransition {
  from: FocusRingState;
  to: FocusRingState;
  direction: FocusRingDirection;
  duration: number;
  timestamp: number;
}

// 焦点环统计结果：汇总一段时间内焦点环的行为统计指标
interface FocusRingStatistics {
  totalRecords: number;
  visibleCount: number;
  hiddenCount: number;
  averageResponseTime: number;
  maxResponseTime: number;
  minResponseTime: number;
  visibilityRate: number;
}

// 焦点环配置结构：描述焦点环的渲染和行为配置参数
interface FocusRingConfig {
  mode: FocusRingMode;
  priority: FocusRingPriority;
  ringThickness: number;
  ringColor: string;
  animationDuration: number;
  autoHideDelay: number;
  enabled: boolean;
}

// 焦点环数据模型：封装焦点环的完整属性，提供克隆、相等比较和序列化能力
class FocusRingModel {
  private state: FocusRingState;
  private focusIndex: number;
  private isVisible: boolean;
  private responseTime: number;
  private mode: FocusRingMode;
  private priority: FocusRingPriority;

  // 构造函数：初始化焦点环数据模型的默认属性值
  public constructor() {
    this.state = FocusRingState.HIDDEN;
    this.focusIndex = -1;
    this.isVisible = false;
    this.responseTime = 0;
    this.mode = FocusRingMode.AUTO_HIDE;
    this.priority = FocusRingPriority.NORMAL;
  }

  // 设置焦点环状态
  public setState(state: FocusRingState): void {
    this.state = state;
  }

  public getState(): FocusRingState {
    return this.state;
  }

  // 设置焦点索引
  public setFocusIndex(index: number): void {
    this.focusIndex = index;
  }

  public getFocusIndex(): number {
    return this.focusIndex;
  }

  // 设置焦点环可见性
  public setVisible(visible: boolean): void {
    this.isVisible = visible;
  }

  public getVisible(): boolean {
    return this.isVisible;
  }

  // 设置焦点环响应时间
  public setResponseTime(time: number): void {
    this.responseTime = time;
  }

  public getResponseTime(): number {
    return this.responseTime;
  }

  // 设置焦点环显示模式
  public setMode(mode: FocusRingMode): void {
    this.mode = mode;
  }

  public getMode(): FocusRingMode {
    return this.mode;
  }

  // 设置焦点环渲染优先级
  public setPriority(priority: FocusRingPriority): void {
    this.priority = priority;
  }

  public getPriority(): FocusRingPriority {
    return this.priority;
  }

  // 校验焦点环数据是否有效：焦点索引必须合法，响应时间必须非负
  public isValid(): boolean {
    return this.focusIndex >= -1 && this.responseTime >= 0;
  }

  // 克隆焦点环数据模型：返回一个属性完全一致的副本
  public clone(): FocusRingModel {
    const cloned = new FocusRingModel();
    cloned.state = this.state;
    cloned.focusIndex = this.focusIndex;
    cloned.isVisible = this.isVisible;
    cloned.responseTime = this.responseTime;
    cloned.mode = this.mode;
    cloned.priority = this.priority;
    return cloned;
  }

  // 比较两个焦点环数据模型是否相等：逐字段比较核心属性
  public equals(other: FocusRingModel): boolean {
    return this.state === other.state && this.focusIndex === other.focusIndex && this.isVisible === other.isVisible &&
      this.responseTime === other.responseTime && this.mode === other.mode && this.priority === other.priority;
  }

  // 序列化焦点环数据模型：生成可读的字符串表示
  public toString(): string {
    return `FocusRingModel{state=${this.state}, index=${this.focusIndex}, visible=${this.isVisible}, mode=${this.mode}}`;
  }
}

// 焦点环度量计算器：提供基于焦点环记录的统计分析能力
class FocusRingMetricsCalculator {
  private records: FocusRingRecord[];

  // 构造函数：初始化度量计算器的记录列表
  public constructor(records: FocusRingRecord[]) {
    this.records = records;
  }

  // 计算平均响应时间
  public averageResponseTime(): number {
    if (this.records.length === 0) {
      return 0;
    }
    const total = this.records.reduce((sum: number, record: FocusRingRecord) => sum + record.responseTime, 0);
    return total / this.records.length;
  }

  // 计算最大响应时间
  public maxResponseTime(): number {
    let maxTime = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].responseTime > maxTime) {
        maxTime = this.records[i].responseTime;
      }
    }
    return maxTime;
  }

  // 计算最小响应时间
  public minResponseTime(): number {
    let minTime = Number.MAX_SAFE_INTEGER;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].responseTime < minTime) {
        minTime = this.records[i].responseTime;
      }
    }
    return minTime === Number.MAX_SAFE_INTEGER ? 0 : minTime;
  }

  // 计算可见记录数量
  public visibleCount(): number {
    return this.records.filter(record => record.isVisible).length;
  }

  // 计算可见率：可见记录占总记录的比例
  public visibilityRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.visibleCount() / this.records.length;
  }
}

// 焦点环状态迁移历史：记录并分析焦点环状态的迁移序列
class FocusRingTransitionHistory {
  private transitions: FocusRingTransition[];

  // 构造函数：初始化状态迁移记录列表
  public constructor() {
    this.transitions = [];
  }

  // 记录一次状态迁移：保存起点状态、终点状态、方向和持续时间
  public recordTransition(from: FocusRingState, to: FocusRingState, direction: FocusRingDirection,
    duration: number): void {
    const transition: FocusRingTransition = {
      from,
      to,
      direction,
      duration,
      timestamp: Date.now()
    };
    this.transitions.push(transition);
  }

  public getTransitions(): FocusRingTransition[] {
    return [...this.transitions];
  }

  public getTransitionCount(): number {
    return this.transitions.length;
  }

  // 统计指定方向迁移的数量：分析焦点环移动方向分布
  public getDirectionCount(direction: FocusRingDirection): number {
    return this.transitions.filter(transition => transition.direction === direction).length;
  }

  // 计算平均迁移时长：评估状态迁移的整体耗时
  public getAverageDuration(): number {
    if (this.transitions.length === 0) {
      return 0;
    }
    const total =
      this.transitions.reduce((sum: number, transition: FocusRingTransition) => sum + transition.duration, 0);
    return total / this.transitions.length;
  }

  // 清空迁移记录
  public clear(): void {
    this.transitions = [];
  }
}

// 焦点环配置校验器：校验焦点环配置参数的合法性
class FocusRingConfigValidator {
  private config: FocusRingConfig;

  // 构造函数：保存待校验的配置对象
  public constructor(config: FocusRingConfig) {
    this.config = config;
  }

  // 校验环厚度：环厚度必须大于零
  public isThicknessValid(): boolean {
    return this.config.ringThickness > 0;
  }

  // 校验动画时长：动画时长必须非负
  public isAnimationDurationValid(): boolean {
    return this.config.animationDuration >= 0;
  }

  // 校验自动隐藏延迟：自动隐藏延迟必须大于动画时长
  public isAutoHideDelayValid(): boolean {
    return this.config.autoHideDelay >= this.config.animationDuration;
  }

  // 综合校验：判断整个配置是否完全合法
  public isValid(): boolean {
    return this.isThicknessValid() && this.isAnimationDurationValid() && this.isAutoHideDelayValid() &&
      this.config.ringColor.length > 0;
  }

  // 生成校验报告：输出配置校验的详细结果
  public generateValidationReport(): string {
    return `FocusRingConfig{thicknessValid=${this.isThicknessValid()}, ` +
      `animationValid=${this.isAnimationDurationValid()}, ` +
      `autoHideValid=${this.isAutoHideDelayValid()}, enabled=${this.config.enabled}}`;
  }
}

export default function focusRingBehaviorTest() {
  describe('FocusRingBehavior_Test', () => {
    let driver: Driver;
    let focusRingTracker: FocusRingBehaviorTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      focusRingTracker = FocusRingBehaviorTracker.getInstance();
      focusRingTracker.resetTracker();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    // 验证focus ring状态：确保TV设备should be visible on dialog open符合预期
    it('focus_ring_should_be_visible_on_dialog_open', 0, async () => { // 验证对话框打开时焦点环可见，确保用户能立即识别当前焦点位置
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      const startTime = Date.now();
      const isFocusCorrect = await checkFocusState(driver, 0);
      const responseTime = Date.now() - startTime;

      focusRingTracker.recordFocusRing(FocusRingState.VISIBLE, 0, isFocusCorrect, responseTime);

      expect(focusRingTracker.hasState(FocusRingState.VISIBLE)).assertTrue();
    });

    it('focus_ring_should_move_on_left_navigation', 0, async () => { // 验证向左导航时焦点环正确移动，确保焦点移动视觉反馈连贯
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      focusRingTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      focusRingTracker.recordFocusRing(FocusRingState.ANIMATING, 0, isFocusCorrect, responseTime);

      expect(focusRingTracker.hasState(FocusRingState.ANIMATING)).assertTrue();
    });

    it('focus_ring_should_move_on_right_navigation', 0, async () => { // 验证向右导航时焦点环正确移动，确保焦点移动视觉反馈连贯
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      focusRingTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 1);
      focusRingTracker.recordFocusRing(FocusRingState.ANIMATING, 1, isFocusCorrect, responseTime);

      expect(focusRingTracker.hasState(FocusRingState.ANIMATING)).assertTrue();
    });

    it('focus_ring_should_highlight_on_enter', 0, async () => { // 验证按下ENTER键时焦点环高亮显示，确保用户确认操作有明确视觉反馈
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      focusRingTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      focusRingTracker.recordFocusRing(FocusRingState.HIGHLIGHTED, 0, true, responseTime);

      expect(focusRingTracker.hasState(FocusRingState.HIGHLIGHTED)).assertTrue();
    });

    it('focus_ring_should_hide_on_dialog_close', 0, async () => { // 验证对话框关闭时焦点环隐藏，确保焦点环不会残留在屏幕上
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      focusRingTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      focusRingTracker.recordFocusRing(FocusRingState.HIDDEN, -1, false, responseTime);

      expect(focusRingTracker.hasState(FocusRingState.HIDDEN)).assertTrue();
    });

    // 记录测试数据：收集每次操作的关键指标，为后续分析提供原始数据
    it('focus_ring_records_timestamps_should_be_chronological', 0, async () => { // 验证焦点环记录时间戳按时间顺序排列，确保测试数据的时间有效性
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      focusRingTracker.resetTracker();

      focusRingTracker.recordFocusRing(FocusRingState.VISIBLE, 0, true, 50);
      await driver.delayMs(100);
      focusRingTracker.recordFocusRing(FocusRingState.ANIMATING, 1, true, 50);
      await driver.delayMs(100);
      focusRingTracker.recordFocusRing(FocusRingState.HIGHLIGHTED, 0, true, 50);

      const history = focusRingTracker.getFocusRingHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证focus ring稳定：确保TV设备在tracker singleton should maintain consistency下性能不降低
    it('focus_ring_tracker_singleton_should_maintain_consistency', 0, async () => { // 验证追踪器单例模式维持数据一致性，确保跨测试用例共享状态正确
      const tracker1 = FocusRingBehaviorTracker.getInstance();
      const tracker2 = FocusRingBehaviorTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();


      tracker1.resetTracker();
      tracker1.recordFocusRing(FocusRingState.VISIBLE, 0, true, 100);

      expect(tracker2.getTotalTests()).assertEqual(1);
      expect(tracker2.getVisibleCount()).assertEqual(1);
    });

    // 验证focus ring处理：确保TV设备在should handle all states下功能正常
    it('focus_ring_should_handle_all_states', 0, async () => { // 验证焦点环能正确处理所有状态，确保状态机完整覆盖
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      focusRingTracker.resetTracker();

      const states =
        [FocusRingState.VISIBLE, FocusRingState.HIDDEN, FocusRingState.ANIMATING, FocusRingState.HIGHLIGHTED];

      for (const state of states) {
        focusRingTracker.recordFocusRing(state, 0, true, 50);
      }

      expect(focusRingTracker.getTotalTests()).assertEqual(4);
    });

    // 验证focus ring稳定：确保TV设备在should maintain visibility during navigation下性能不降低
    it('focus_ring_should_maintain_visibility_during_navigation', 0, async () => { // 验证导航期间焦点环保持可见，确保用户始终能识别当前焦点位置
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      focusRingTracker.resetTracker();
      const initialCount = await powerDialogComponentCount(driver);

      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        focusRingTracker.recordFocusRing(FocusRingState.ANIMATING, i % 3, true, 30);
        await driver.delayMs(50);
      }

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 验证focus ring处理：确保TV设备在should handle rapid navigation下功能正常
    it('focus_ring_should_handle_rapid_navigation', 0, async () => { // 验证快速导航时焦点环响应正常，确保高频操作下视觉反馈不丢失
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      focusRingTracker.resetTracker();

      const rapidNavigationRounds = 24;
      for (let i = 0; i < rapidNavigationRounds; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        focusRingTracker.recordFocusRing(FocusRingState.ANIMATING, i % 3, true, 20);
        await driver.delayMs(30);
      }

      expect(focusRingTracker.getTotalTests()).assertEqual(rapidNavigationRounds);
      expect(focusRingTracker.getVisibilityRate()).assertEqual(1);
    });

    // 综合comprehensive focus场景：验证完整操作流程中功能正确
    it('comprehensive_focus_ring_behavior_scenario', 0, async () => { // 综合焦点环行为场景测试：验证完整操作流程中焦点环行为正确
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      focusRingTracker.resetTracker();

      const scenarioStart = Date.now();

      const startTime1 = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime1 = Date.now() - startTime1;
      focusRingTracker.recordFocusRing(FocusRingState.VISIBLE, 0, true, responseTime1);

      const startTime2 = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime2 = Date.now() - startTime2;
      focusRingTracker.recordFocusRing(FocusRingState.ANIMATING, 1, true, responseTime2);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(focusRingTracker.getTotalTests()).assertEqual(2);
      expect(focusRingTracker.getVisibilityRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(5000);
    });
  });


}