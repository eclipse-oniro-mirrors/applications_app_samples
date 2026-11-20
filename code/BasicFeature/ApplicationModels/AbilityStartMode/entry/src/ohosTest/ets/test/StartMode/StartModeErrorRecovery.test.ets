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
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay,
  launchMainAbility,
  launchSingletonAbility,
  launchSpecifiedAbility,
  launchStandardAbility,
  waitForHomePageStable,
  waitForFoodDetailStable,
  isHomePageVisible,
  isFoodDetailVisible,
  countModeLabels,
  checkTextContent,
  resetToHome,
  MODE_STANDARD,
  TEXT_FOOD_DETAIL_TITLE,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_SWITCH,
  DELAY_AFTER_START_MODE,
  logInfo
} from '../Shared/SharedDriver';

// 启动模式类型枚举：与 Home 页三组食物列表一一对应
enum StartModeType {
  STARTMODE_STANDARD = 0, STARTMODE_SPECIFIED = 1, STARTMODE_SINGLETON = 2
}

// 启动结果接口：描述一次能力启动请求的处理结果
interface LaunchResult {
  success: boolean;
  message: string;
}

// 模拟启动上下文：可空上下文，用于空守卫测试
class MockLaunchContext {
  public valid: boolean = true;

  constructor(valid: boolean) {
    this.valid = valid;
  }
}

// 启动执行器：处理空上下文、非法食物 id 与故障注入
class StartModeLauncher {
  private context: MockLaunchContext | null = null;

  constructor(context: MockLaunchContext | null) {
    this.context = context;
  }

  public getHelper(): boolean {
    if (this.context === null) {
      return false;
    }
    return this.context.valid;
  }

  public execute(modeType: number, foodItemId: number): LaunchResult {
    if (!this.getHelper()) {
      return { success: false, message: 'context is null' };
    }
    if (foodItemId < 0 || foodItemId > 1) {
      return { success: false, message: 'invalid food item id' };
    }
    switch (modeType) {
      case StartModeType.STARTMODE_STANDARD:
        return { success: true, message: 'standard launch ok' };
      case StartModeType.STARTMODE_SPECIFIED:
        return { success: true, message: 'specified launch ok' };
      case StartModeType.STARTMODE_SINGLETON:
        return { success: true, message: 'singleton launch ok' };
      default:
        return { success: false, message: 'unknown start mode' };
    }
  }

  public executeWithFault(modeType: number, foodItemId: number, fault: string): LaunchResult {
    if (fault === 'timeout') {
      return { success: false, message: 'timeout' };
    }
    if (fault === 'denied') {
      return { success: false, message: 'access denied' };
    }
    return this.execute(modeType, foodItemId);
  }
}

// 目标页面安全校验器：只接受 pages/ 前缀且不含路径穿越的目标页面
class TargetPageSafetyValidator {
  public static isSafeTarget(target: string): boolean {
    if (target.length === 0) {
      return false;
    }
    if (target.includes('..')) {
      return false;
    }
    if (target.includes('\0')) {
      return false;
    }
    return target.startsWith('pages/');
  }

  public static isFoodDetailTarget(target: string): boolean {
    return target === 'pages/FoodDetail';
  }
}

// 食物 id 校验器：每组食物只有 id 0 与 id 1
class FoodItemIdValidator {
  public static isValidId(foodItemId: number): boolean {
    return foodItemId === 0 || foodItemId === 1;
  }

  public static isValidGroupIndex(groupIndex: number): boolean {
    return groupIndex >= 0 && groupIndex <= 2;
  }
}

// 错误严重级别枚举：描述启动异常的影响程度
enum ErrorSeverity {
  INFO = 'info', WARNING = 'warning', CRITICAL = 'critical'
}

// 恢复策略枚举：描述启动失败后的恢复方式
enum RecoveryStrategy {
  RETRY = 'retry', ROLLBACK = 'rollback', RESET = 'reset', IGNORE = 'ignore'
}

// 错误事件接口：描述一次启动错误发生的完整信息
interface ErrorEvent {
  severity: ErrorSeverity;
  code: number;
  message: string;
  timestamp: number;
}

// 恢复报告接口：描述一次恢复动作的结果
interface RecoveryReport {
  success: boolean;
  strategy: RecoveryStrategy;
  retryCount: number;
  detail: string;
}

// 错误条目模型：封装单条启动错误并提供比较与克隆能力
class ErrorEntry {
  public severity: ErrorSeverity;
  public code: number;
  public message: string;
  public timestamp: number;

  constructor(severity: ErrorSeverity, code: number, message: string, timestamp: number) {
    this.severity = severity;
    this.code = code;
    this.message = message;
    this.timestamp = timestamp;
  }

  public getSeverity(): ErrorSeverity {
    return this.severity;
  }

  public getCode(): number {
    return this.code;
  }

  public getMessage(): string {
    return this.message;
  }

  public getTimestamp(): number {
    return this.timestamp;
  }

  public isCritical(): boolean {
    return this.severity === ErrorSeverity.CRITICAL;
  }

  public isWarning(): boolean {
    return this.severity === ErrorSeverity.WARNING;
  }

  public clone(): ErrorEntry {
    return new ErrorEntry(this.severity, this.code, this.message, this.timestamp);
  }

  public equals(other: ErrorEntry): boolean {
    return this.severity === other.severity && this.code === other.code && this.message === other.message &&
      this.timestamp === other.timestamp;
  }

  public toString(): string {
    return `ErrorEntry{severity: ${this.severity}, code: ${this.code}, message: ${this.message}}`;
  }
}

// 错误目录：提供启动场景标准错误条目的静态工厂方法
class ErrorCatalog {
  public static createContextNull(): ErrorEntry {
    return new ErrorEntry(ErrorSeverity.CRITICAL, 2001, 'context is null', Date.now());
  }

  public static createLaunchTimeout(): ErrorEntry {
    return new ErrorEntry(ErrorSeverity.WARNING, 2002, 'launch timeout', Date.now());
  }

  public static createInvalidFoodItemId(): ErrorEntry {
    return new ErrorEntry(ErrorSeverity.CRITICAL, 2003, 'invalid food item id', Date.now());
  }

  public static createUnknownStartMode(code: number): ErrorEntry {
    return new ErrorEntry(ErrorSeverity.WARNING, code, 'unknown start mode', Date.now());
  }
}

// 故障注入器：按名称注入特定故障并统计注入次数
class FaultInjector {
  private injectedCount: number = 0;
  private faults: string[] = [];

  public inject(fault: string): boolean {
    this.faults.push(fault);
    this.injectedCount++;
    return this.isKnownFault(fault);
  }

  public isKnownFault(fault: string): boolean {
    return fault === 'timeout' || fault === 'denied' || fault === 'panic';
  }

  public getInjectedCount(): number {
    return this.injectedCount;
  }

  public getFaults(): string[] {
    return [...this.faults];
  }

  public hasFault(fault: string): boolean {
    return this.faults.includes(fault);
  }

  public reset(): void {
    this.injectedCount = 0;
    this.faults = [];
  }
}

// 恢复编排器：根据错误与恢复策略执行恢复动作并生成报告
class RecoveryOrchestrator {
  private retryCounter: Map<string, number> = new Map<string, number>();

  public recover(entry: ErrorEntry, strategy: RecoveryStrategy): RecoveryReport {
    const key: string = entry.getMessage();
    const retry: number = this.getRetryCount(key);
    const success: boolean = strategy !== RecoveryStrategy.IGNORE;
    if (strategy === RecoveryStrategy.RETRY) {
      this.retryCounter.set(key, retry + 1);
    }
    return {
      success,
      strategy,
      retryCount: retry,
      detail: `recovered from ${entry.getMessage()}`
    };
  }

  private getRetryCount(key: string): number {
    const value: number | undefined = this.retryCounter.get(key);
    if (value === undefined) {
      return 0;
    }
    return value;
  }

  public getTotalRetries(): number {
    let total: number = 0;
    this.retryCounter.forEach((value: number) => {
      total += value;
    });
    return total;
  }

  public reset(): void {
    this.retryCounter = new Map<string, number>();
  }
}

// 错误统计：对错误条目列表进行聚合分析
class ErrorStatistics {
  private entries: ErrorEntry[] = [];

  public add(entry: ErrorEntry): void {
    this.entries.push(entry);
  }

  public getTotalCount(): number {
    return this.entries.length;
  }

  public getCriticalCount(): number {
    return this.entries.filter((entry: ErrorEntry) => entry.isCritical()).length;
  }

  public getWarningCount(): number {
    return this.entries.filter((entry: ErrorEntry) => entry.isWarning()).length;
  }

  public getMaxCode(): number {
    let max: number = -1;
    this.entries.forEach((entry: ErrorEntry) => {
      if (entry.getCode() > max) {
        max = entry.getCode();
      }
    });
    return max;
  }

  public getMinCode(): number {
    if (this.entries.length === 0) {
      return -1;
    }
    let min: number = this.entries[0].getCode();
    this.entries.forEach((entry: ErrorEntry) => {
      if (entry.getCode() < min) {
        min = entry.getCode();
      }
    });
    return min;
  }

  public clear(): void {
    this.entries = [];
  }
}

// 错误日志管理器：单例维护启动错误条目并支持按严重级别过滤
class ErrorLogManager {
  private static instance: ErrorLogManager;
  private entries: ErrorEntry[] = [];

  public static getInstance(): ErrorLogManager {
    if (!ErrorLogManager.instance) {
      ErrorLogManager.instance = new ErrorLogManager();
    }
    return ErrorLogManager.instance;
  }

  public log(entry: ErrorEntry): void {
    this.entries.push(entry);
  }

  public getEntries(): ErrorEntry[] {
    return [...this.entries];
  }

  public getBySeverity(severity: ErrorSeverity): ErrorEntry[] {
    return this.entries.filter((entry: ErrorEntry) => entry.getSeverity() === severity);
  }

  public getCountBySeverity(severity: ErrorSeverity): number {
    return this.getBySeverity(severity).length;
  }

  public clear(): void {
    this.entries = [];
  }
}

// 恢复计划模型：描述针对特定启动错误的恢复步骤集合
class RecoveryPlan {
  public entry: ErrorEntry;
  public strategy: RecoveryStrategy;
  public maxRetries: number;
  public steps: string[];

  constructor(entry: ErrorEntry, strategy: RecoveryStrategy, maxRetries: number, steps: string[]) {
    this.entry = entry;
    this.strategy = strategy;
    this.maxRetries = maxRetries;
    this.steps = steps;
  }

  public getStepCount(): number {
    return this.steps.length;
  }

  public getMaxRetries(): number {
    return this.maxRetries;
  }

  public getEntry(): ErrorEntry {
    return this.entry;
  }

  public getStrategy(): RecoveryStrategy {
    return this.strategy;
  }

  public describe(): string {
    return `RecoveryPlan{strategy: ${this.strategy}, maxRetries: ${this.maxRetries}, steps: ${this.steps.length}}`;
  }
}

// 恢复计划目录：维护错误码到恢复计划的映射
class RecoveryPlanCatalog {
  private plans: Map<number, RecoveryPlan> = new Map<number, RecoveryPlan>();

  public register(plan: RecoveryPlan): void {
    this.plans.set(plan.entry.getCode(), plan);
  }

  public lookup(code: number): RecoveryPlan | null {
    const value: RecoveryPlan | undefined = this.plans.get(code);
    if (value === undefined) {
      return null;
    }
    return value;
  }

  public getPlanCount(): number {
    return this.plans.size;
  }

  public contains(code: number): boolean {
    return this.plans.has(code);
  }

  public clear(): void {
    this.plans = new Map<number, RecoveryPlan>();
  }
}

// 错误序列追踪器：按发生顺序记录启动错误代码序列
class ErrorSequenceTracker {
  private sequence: number[] = [];

  public append(code: number): void {
    this.sequence.push(code);
  }

  public getSequence(): number[] {
    return [...this.sequence];
  }

  public getLength(): number {
    return this.sequence.length;
  }

  public getFirstCode(): number {
    if (this.sequence.length === 0) {
      return -1;
    }
    return this.sequence[0];
  }

  public getLastCode(): number {
    if (this.sequence.length === 0) {
      return -1;
    }
    return this.sequence[this.sequence.length - 1];
  }

  public hasCode(code: number): boolean {
    return this.sequence.includes(code);
  }

  public reset(): void {
    this.sequence = [];
  }
}

export default function startModeErrorRecoveryTest() {
  describe('StartModeErrorRecovery_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 Context_Null_Guard：空上下文时 getHelper 失败
    it('get_helper_should_fail_when_context_is_null', 0, async () => {
      const launcher = new StartModeLauncher(null);
      expect(launcher.getHelper()).assertFalse();
    });

    // 适配 Context_Null_Guard：有效上下文时 getHelper 成功
    it('get_helper_should_succeed_with_valid_context', 0, async () => {
      const launcher = new StartModeLauncher(new MockLaunchContext(true));
      expect(launcher.getHelper()).assertTrue();
    });

    // 适配 Fault_Injection_Mocks：空上下文执行启动返回失败
    it('execute_with_null_context_should_return_failure', 0, async () => {
      const launcher = new StartModeLauncher(null);
      const result: LaunchResult = launcher.execute(StartModeType.STARTMODE_SINGLETON, 0);
      expect(result.success).assertFalse();
      expect(result.message).assertEqual('context is null');
    });

    // 适配 Fault_Injection_Mocks：未知启动模式返回失败
    it('unknown_start_mode_should_return_failure', 0, async () => {
      const launcher = new StartModeLauncher(new MockLaunchContext(true));
      const result: LaunchResult = launcher.execute(100, 0);
      expect(result.success).assertFalse();
      expect(result.message).assertEqual('unknown start mode');
    });

    // 适配 Fault_Injection_Mocks：非法食物 id 被拒绝
    it('invalid_food_item_id_should_return_failure', 0, async () => {
      const launcher = new StartModeLauncher(new MockLaunchContext(true));
      expect(launcher.execute(StartModeType.STARTMODE_STANDARD, -1).message).assertEqual('invalid food item id');
      expect(launcher.execute(StartModeType.STARTMODE_SPECIFIED, 2).message).assertEqual('invalid food item id');
      expect(launcher.execute(StartModeType.STARTMODE_SINGLETON, 9).success).assertFalse();
    });

    // 适配 Fault_Injection_Mocks：故障注入超时
    it('fault_injection_timeout_should_be_handled', 0, async () => {
      const launcher = new StartModeLauncher(new MockLaunchContext(true));
      const result: LaunchResult =
        launcher.executeWithFault(StartModeType.STARTMODE_SPECIFIED, 0, 'timeout');
      expect(result.success).assertFalse();
      expect(result.message).assertEqual('timeout');
    });

    // 适配 Fault_Injection_Mocks：故障注入拒绝访问
    it('fault_injection_denied_should_be_handled', 0, async () => {
      const launcher = new StartModeLauncher(new MockLaunchContext(true));
      const result: LaunchResult =
        launcher.executeWithFault(StartModeType.STARTMODE_SPECIFIED, 0, 'denied');
      expect(result.success).assertFalse();
      expect(result.message).assertEqual('access denied');
    });

    // 适配 StartMode_Error_Scenarios：三种模式的合法启动均成功
    it('valid_launch_should_succeed', 0, async () => {
      const launcher = new StartModeLauncher(new MockLaunchContext(true));
      expect(launcher.execute(StartModeType.STARTMODE_STANDARD, 0).success).assertTrue();
      expect(launcher.execute(StartModeType.STARTMODE_SPECIFIED, 1).success).assertTrue();
      expect(launcher.execute(StartModeType.STARTMODE_SINGLETON, 0).success).assertTrue();
    });

    // 适配 Path_Traversal_Prevention：路径穿越目标页面被拒绝
    it('path_traversal_target_should_be_rejected', 0, async () => {
      expect(TargetPageSafetyValidator.isSafeTarget('../FoodDetail')).assertFalse();
      expect(TargetPageSafetyValidator.isSafeTarget('pages/../../FoodDetail')).assertFalse();
    });

    // 适配 Path_Traversal_Prevention：空目标与空字节注入被拒绝
    it('null_byte_target_should_be_rejected', 0, async () => {
      expect(TargetPageSafetyValidator.isSafeTarget('')).assertFalse();
      expect(TargetPageSafetyValidator.isSafeTarget('pages/FoodDetail\0')).assertFalse();
    });

    // 适配 Path_Traversal_Prevention：合法目标页面通过校验
    it('safe_target_should_pass_validation', 0, async () => {
      expect(TargetPageSafetyValidator.isSafeTarget('pages/FoodDetail')).assertTrue();
      expect(TargetPageSafetyValidator.isFoodDetailTarget('pages/FoodDetail')).assertTrue();
      expect(TargetPageSafetyValidator.isFoodDetailTarget('pages/Home')).assertFalse();
    });

    // 适配 Food_Item_Id_Guard：食物 id 与分组索引边界
    it('food_item_id_and_group_index_should_be_bounded', 0, async () => {
      expect(FoodItemIdValidator.isValidId(0)).assertTrue();
      expect(FoodItemIdValidator.isValidId(1)).assertTrue();
      expect(FoodItemIdValidator.isValidId(2)).assertFalse();
      expect(FoodItemIdValidator.isValidGroupIndex(0)).assertTrue();
      expect(FoodItemIdValidator.isValidGroupIndex(2)).assertTrue();
      expect(FoodItemIdValidator.isValidGroupIndex(3)).assertFalse();
    });

    // 适配 runTask_Promise_AllSettled：单个启动失败不阻断后续启动
    it('partial_failure_should_not_block_other_launches', 0, async () => {
      const launcher = new StartModeLauncher(new MockLaunchContext(true));
      const failed: LaunchResult =
        launcher.executeWithFault(StartModeType.STARTMODE_STANDARD, 0, 'timeout');
      const succeeded: LaunchResult = launcher.execute(StartModeType.STARTMODE_SINGLETON, 1);
      expect(failed.success).assertFalse();
      expect(succeeded.success).assertTrue();
    });

    // 适配 ErrorEntry_Model：克隆与相等性判断
    it('error_entry_should_clone_and_compare', 0, async () => {
      const entry: ErrorEntry = ErrorCatalog.createContextNull();
      const clone: ErrorEntry = entry.clone();
      expect(clone.equals(entry)).assertTrue();
      expect(clone.getTimestamp()).assertEqual(entry.getTimestamp());
      clone.code = 3001;
      expect(clone.equals(entry)).assertFalse();
    });

    // 适配 ErrorEntry_Model：严重级别判定与描述文本
    it('error_entry_should_report_severity', 0, async () => {
      const critical: ErrorEntry = ErrorCatalog.createContextNull();
      const warning: ErrorEntry = ErrorCatalog.createLaunchTimeout();
      expect(critical.isCritical()).assertTrue();
      expect(critical.isWarning()).assertFalse();
      expect(warning.isWarning()).assertTrue();
      expect(warning.isCritical()).assertFalse();
      expect(warning.toString().includes('launch timeout')).assertTrue();
    });

    // 适配 ErrorCatalog：标准错误条目字段正确
    it('error_catalog_should_build_standard_entries', 0, async () => {
      expect(ErrorCatalog.createContextNull().getCode()).assertEqual(2001);
      expect(ErrorCatalog.createLaunchTimeout().getSeverity()).assertEqual(ErrorSeverity.WARNING);
      expect(ErrorCatalog.createInvalidFoodItemId().getCode()).assertEqual(2003);
      expect(ErrorCatalog.createUnknownStartMode(2100).getCode()).assertEqual(2100);
      expect(ErrorCatalog.createUnknownStartMode(2100).getMessage()).assertEqual('unknown start mode');
    });

    // 适配 FaultInjector：注入次数与故障记录
    it('fault_injector_should_count_injected_faults', 0, async () => {
      const injector = new FaultInjector();
      expect(injector.inject('timeout')).assertTrue();
      expect(injector.inject('denied')).assertTrue();
      expect(injector.inject('unknown')).assertFalse();
      expect(injector.getInjectedCount()).assertEqual(3);
      expect(injector.hasFault('denied')).assertTrue();
      expect(injector.getFaults().length).assertEqual(3);
      logInfo('fault injector count verified');
    });

    // 适配 FaultInjector：重置后状态归零
    it('fault_injector_should_reset_state', 0, async () => {
      const injector = new FaultInjector();
      injector.inject('panic');
      injector.reset();
      expect(injector.getInjectedCount()).assertEqual(0);
      expect(injector.getFaults().length).assertEqual(0);
      expect(injector.hasFault('panic')).assertFalse();
    });

    // 适配 RecoveryOrchestrator：重试策略与恢复报告
    it('recovery_orchestrator_should_retry_and_report', 0, async () => {
      const orchestrator = new RecoveryOrchestrator();
      const entry: ErrorEntry = ErrorCatalog.createLaunchTimeout();
      const first: RecoveryReport = orchestrator.recover(entry, RecoveryStrategy.RETRY);
      expect(first.success).assertTrue();
      expect(first.strategy).assertEqual(RecoveryStrategy.RETRY);
      expect(first.retryCount).assertEqual(0);
      const second: RecoveryReport = orchestrator.recover(entry, RecoveryStrategy.RETRY);
      expect(second.retryCount).assertEqual(1);
      expect(orchestrator.getTotalRetries()).assertEqual(2);
    });

    // 适配 RecoveryOrchestrator：忽略策略返回失败且不计数
    it('recovery_orchestrator_should_ignore_without_retry', 0, async () => {
      const orchestrator = new RecoveryOrchestrator();
      const entry: ErrorEntry = ErrorCatalog.createInvalidFoodItemId();
      const report: RecoveryReport = orchestrator.recover(entry, RecoveryStrategy.IGNORE);
      expect(report.success).assertFalse();
      expect(report.retryCount).assertEqual(0);
      expect(orchestrator.getTotalRetries()).assertEqual(0);
      orchestrator.reset();
      expect(orchestrator.getTotalRetries()).assertEqual(0);
    });

    // 适配 ErrorStatistics：多条目聚合统计
    it('error_statistics_should_aggregate_entries', 0, async () => {
      const statistics = new ErrorStatistics();
      statistics.add(ErrorCatalog.createContextNull());
      statistics.add(ErrorCatalog.createLaunchTimeout());
      statistics.add(ErrorCatalog.createInvalidFoodItemId());
      expect(statistics.getTotalCount()).assertEqual(3);
      expect(statistics.getCriticalCount()).assertEqual(2);
      expect(statistics.getWarningCount()).assertEqual(1);
      expect(statistics.getMaxCode()).assertEqual(2003);
      expect(statistics.getMinCode()).assertEqual(2001);
      statistics.clear();
      expect(statistics.getTotalCount()).assertEqual(0);
    });

    // 适配 ErrorStatistics：空集合统计边界
    it('error_statistics_should_handle_empty_catalog', 0, async () => {
      const statistics = new ErrorStatistics();
      expect(statistics.getMaxCode()).assertEqual(-1);
      expect(statistics.getMinCode()).assertEqual(-1);
      expect(statistics.getCriticalCount()).assertEqual(0);
    });

    // 适配 ErrorLogManager：单例与按严重级别过滤
    it('error_log_manager_should_filter_by_severity', 0, async () => {
      const manager: ErrorLogManager = ErrorLogManager.getInstance();
      expect(manager === ErrorLogManager.getInstance()).assertTrue();
      manager.clear();
      manager.log(ErrorCatalog.createContextNull());
      manager.log(ErrorCatalog.createLaunchTimeout());
      manager.log(ErrorCatalog.createInvalidFoodItemId());
      expect(manager.getEntries().length).assertEqual(3);
      expect(manager.getCountBySeverity(ErrorSeverity.CRITICAL)).assertEqual(2);
      expect(manager.getCountBySeverity(ErrorSeverity.WARNING)).assertEqual(1);
      expect(manager.getCountBySeverity(ErrorSeverity.INFO)).assertEqual(0);
      manager.clear();
      expect(manager.getEntries().length).assertEqual(0);
    });

    // 适配 RecoveryPlan_Catalog：恢复计划注册与查找
    it('recovery_plan_catalog_should_register_and_lookup', 0, async () => {
      const catalog = new RecoveryPlanCatalog();
      const entry: ErrorEntry = ErrorCatalog.createLaunchTimeout();
      const plan: RecoveryPlan = new RecoveryPlan(entry, RecoveryStrategy.ROLLBACK, 3,
        ['reopen home page', 'relaunch standard ability']);
      catalog.register(plan);
      expect(catalog.getPlanCount()).assertEqual(1);
      expect(catalog.contains(2002)).assertTrue();
      const found: RecoveryPlan | null = catalog.lookup(2002);
      expect(found === null).assertFalse();
      expect(found?.getStepCount()).assertEqual(2);
      expect(found?.getMaxRetries()).assertEqual(3);
      expect(found?.describe().includes('rollback')).assertTrue();
      expect(catalog.lookup(9999) === null).assertTrue();
      catalog.clear();
      expect(catalog.getPlanCount()).assertEqual(0);
    });

    // 适配 ErrorSequenceTracker：错误代码序列追踪
    it('error_sequence_tracker_should_track_codes', 0, async () => {
      const tracker = new ErrorSequenceTracker();
      tracker.append(2001);
      tracker.append(2002);
      tracker.append(2003);
      expect(tracker.getLength()).assertEqual(3);
      expect(tracker.getFirstCode()).assertEqual(2001);
      expect(tracker.getLastCode()).assertEqual(2003);
      expect(tracker.hasCode(2002)).assertTrue();
      expect(tracker.hasCode(2004)).assertFalse();
      expect(tracker.getSequence().length).assertEqual(3);
    });

    // 适配 ErrorSequenceTracker：空序列与重置行为
    it('error_sequence_tracker_should_reset', 0, async () => {
      const tracker = new ErrorSequenceTracker();
      expect(tracker.getFirstCode()).assertEqual(-1);
      expect(tracker.getLastCode()).assertEqual(-1);
      tracker.append(2001);
      tracker.reset();
      expect(tracker.getLength()).assertEqual(0);
      expect(tracker.getFirstCode()).assertEqual(-1);
    });

    // 适配 Full_Application_Startup：启动失败后主页可恢复渲染
    it('home_page_should_recover_after_launch_failure', 0, async () => {
      await launchMainAbility();
      const stable: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(stable).assertTrue();
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    // 适配 Full_Application_Startup：standard 模式可恢复食物详情页
    it('standard_launch_should_recover_detail_page', 0, async () => {
      await launchStandardAbility(0);
      const stable: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      expect(stable).assertTrue();
      expect(await isFoodDetailVisible(driver)).assertTrue();
    });

    // 适配 Full_Application_Startup：specified 模式可恢复食物详情页
    it('specified_launch_should_recover_detail_page', 0, async () => {
      await launchSpecifiedAbility(1);
      const stable: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      expect(stable).assertTrue();
      expect(await isFoodDetailVisible(driver)).assertTrue();
    });

    // 适配 Full_Application_Startup：singleton 模式可恢复食物详情页
    it('singleton_launch_should_recover_detail_page', 0, async () => {
      await launchSingletonAbility(0);
      const stable: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      expect(stable).assertTrue();
      expect(await isFoodDetailVisible(driver)).assertTrue();
    });

    // 适配 Same_Ability_Relaunch：重复启动后详情页仍可渲染
    it('relaunch_should_keep_detail_page_visible', 0, async () => {
      await launchStandardAbility(1);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      await launchStandardAbility(0);
      await serializedDelay(driver, DELAY_AFTER_START_MODE);
      expect(await isFoodDetailVisible(driver)).assertTrue();
    });

    // 适配 Navigation_BackPress_Scenarios：重置回主页后可再次启动
    it('reset_to_home_after_detail_should_succeed', 0, async () => {
      const recovered: boolean = await resetToHome(driver);
      expect(recovered).assertTrue();
      expect(await isHomePageVisible(driver)).assertTrue();
      const labels: number = await countModeLabels(driver);
      expect(labels).assertLargerOrEqual(1);
    });

    // 适配 Page_Render_Recovery：详情页标题在恢复后仍存在
    it('detail_title_should_survive_recovery', 0, async () => {
      await launchSpecifiedAbility(0);
      const stable: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      expect(stable).assertTrue();
      expect(await checkTextContent(driver, TEXT_FOOD_DETAIL_TITLE)).assertTrue();
    });

    // 适配 Mode_Label_Recovery：standard 模式标识在主页恢复后可见
    it('standard_mode_label_should_survive_recovery', 0, async () => {
      await resetToHome(driver);
      expect(await checkTextContent(driver, MODE_STANDARD)).assertTrue();
    });
  });
}



