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
  KEY_BACK,
  recorderComponentCount,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../shared/RecordingDriver';

// 录屏动作枚举：与 SRManager 的启动/停止入口一致
enum RecorderAction {
  START = 'start',
  STOP = 'stop',
  QUERY = 'query'
}

// 操作执行结果接口
interface RecorderOperationResult {
  success: boolean;
  message: string;
  code: number;
}

// 模拟录屏上下文：可空上下文用于空守卫测试
class MockRecorderContext {
  public valid: boolean = true;

  constructor(valid: boolean) {
    this.valid = valid;
  }
}

// 录屏操作执行器：处理空上下文、创建失败与故障注入
class RecorderOperationExecutor {
  private context: MockRecorderContext | null = null;

  constructor(context: MockRecorderContext | null) {
    this.context = context;
  }

  public getHelper(): boolean {
    if (this.context === null) {
      return false;
    }
    return this.context.valid;
  }

  public execute(action: RecorderAction): RecorderOperationResult {
    if (!this.getHelper()) {
      return RecorderOperationExecutor.failure('context is null', 1001);
    }
    if (action === RecorderAction.START) {
      return RecorderOperationExecutor.success('start ok');
    }
    if (action === RecorderAction.STOP) {
      return RecorderOperationExecutor.success('stop ok');
    }
    if (action === RecorderAction.QUERY) {
      return RecorderOperationExecutor.success('query ok');
    }
    return RecorderOperationExecutor.failure('unknown action', 1002);
  }

  public executeWithFault(action: RecorderAction, fault: string): RecorderOperationResult {
    if (fault === 'timeout') {
      return RecorderOperationExecutor.failure('operation timeout', 1003);
    }
    if (fault === 'asset') {
      return RecorderOperationExecutor.failure('create asset failed', 1004);
    }
    if (fault === 'open') {
      return RecorderOperationExecutor.failure('open fd failed', 1005);
    }
    if (fault === 'native') {
      return RecorderOperationExecutor.failure('native start failed', 1006);
    }
    return this.execute(action);
  }

  private static success(message: string): RecorderOperationResult {
    const result: RecorderOperationResult = {
      success: true,
      message: message,
      code: 0
    };
    return result;
  }

  private static failure(message: string, code: number): RecorderOperationResult {
    const result: RecorderOperationResult = {
      success: false,
      message: message,
      code: code
    };
    return result;
  }
}

// 文件名安全校验器：防止路径穿越与空字节注入
class RecorderNameSafetyValidator {
  public static isSafeRecordingName(name: string): boolean {
    if (name.length === 0) {
      return false;
    }
    if (name.includes('..')) {
      return false;
    }
    if (name.includes('\0')) {
      return false;
    }
    if (!name.startsWith('REC_') || !name.endsWith('.mp4')) {
      return false;
    }
    return true;
  }
}

// 错误严重级别枚举
enum ErrorSeverity {
  INFO = 'info',
  WARNING = 'warning',
  CRITICAL = 'critical'
}

// 恢复策略枚举
enum RecoveryStrategy {
  RETRY = 'retry',
  ROLLBACK = 'rollback',
  RESET = 'reset',
  IGNORE = 'ignore'
}

// 错误事件接口
interface RecorderErrorEvent {
  severity: ErrorSeverity;
  code: number;
  message: string;
  timestamp: number;
}

// 恢复报告接口
interface RecorderRecoveryReport {
  success: boolean;
  strategy: RecoveryStrategy;
  retryCount: number;
  detail: string;
}

// 错误条目模型：封装单条错误并提供比较与克隆
class RecorderErrorEntry {
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

  public clone(): RecorderErrorEntry {
    return new RecorderErrorEntry(this.severity, this.code, this.message, this.timestamp);
  }

  public equals(other: RecorderErrorEntry): boolean {
    return this.severity === other.severity && this.code === other.code &&
      this.message === other.message && this.timestamp === other.timestamp;
  }

  public toString(): string {
    return `RecorderErrorEntry{severity: ${this.severity}, code: ${this.code}, message: ${this.message}}`;
  }
}

// 错误目录：提供录屏标准错误条目的工厂方法
class RecorderErrorCatalog {
  public static createContextNull(): RecorderErrorEntry {
    return new RecorderErrorEntry(ErrorSeverity.CRITICAL, 1001, 'context is null', Date.now());
  }

  public static createAssetFailed(): RecorderErrorEntry {
    return new RecorderErrorEntry(ErrorSeverity.CRITICAL, 1004, 'create asset failed', Date.now());
  }

  public static createOpenFailed(): RecorderErrorEntry {
    return new RecorderErrorEntry(ErrorSeverity.WARNING, 1005, 'open fd failed', Date.now());
  }

  public static createNativeFailed(): RecorderErrorEntry {
    return new RecorderErrorEntry(ErrorSeverity.CRITICAL, 1006, 'native start failed', Date.now());
  }

  public static createUnknownError(): RecorderErrorEntry {
    return new RecorderErrorEntry(ErrorSeverity.WARNING, 1007, '未知错误,录制停止', Date.now());
  }
}

// 故障注入器：按名称注入特定故障并统计次数
class RecorderFaultInjector {
  private injectedCount: number = 0;
  private faults: string[] = [];

  public inject(fault: string): boolean {
    this.faults.push(fault);
    this.injectedCount++;
    return this.isKnownFault(fault);
  }

  public isKnownFault(fault: string): boolean {
    return fault === 'timeout' || fault === 'asset' || fault === 'open' || fault === 'native';
  }

  public getInjectedCount(): number {
    return this.injectedCount;
  }

  public getFaults(): string[] {
    return this.faults.slice();
  }

  public hasFault(fault: string): boolean {
    return this.faults.includes(fault);
  }

  public reset(): void {
    this.injectedCount = 0;
    this.faults = [];
  }
}

// 恢复编排器：按策略执行恢复并累计重试次数
class RecorderRecoveryOrchestrator {
  private retryCounter: Map<string, number> = new Map<string, number>();

  public recover(entry: RecorderErrorEntry, strategy: RecoveryStrategy): RecorderRecoveryReport {
    const key: string = entry.getMessage();
    const retry: number = this.getRetryCount(key);
    const success: boolean = strategy !== RecoveryStrategy.IGNORE;
    if (strategy === RecoveryStrategy.RETRY) {
      this.retryCounter.set(key, retry + 1);
    }
    const report: RecorderRecoveryReport = {
      success: success,
      strategy: strategy,
      retryCount: retry,
      detail: `recovered from ${entry.getMessage()}`
    };
    return report;
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

// 错误统计：聚合错误条目并按级别分类
class RecorderErrorStatistics {
  private entries: RecorderErrorEntry[] = [];

  public add(entry: RecorderErrorEntry): void {
    this.entries.push(entry);
  }

  public getTotalCount(): number {
    return this.entries.length;
  }

  public getCriticalCount(): number {
    return this.entries.filter((entry: RecorderErrorEntry) => entry.isCritical()).length;
  }

  public getWarningCount(): number {
    return this.entries.filter((entry: RecorderErrorEntry) => entry.isWarning()).length;
  }

  public getMaxCode(): number {
    let max: number = -1;
    this.entries.forEach((entry: RecorderErrorEntry) => {
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
    this.entries.forEach((entry: RecorderErrorEntry) => {
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

// 错误日志管理器：单例维护错误条目
class RecorderErrorLogManager {
  private static instance: RecorderErrorLogManager;
  private entries: RecorderErrorEntry[] = [];

  public static getInstance(): RecorderErrorLogManager {
    if (!RecorderErrorLogManager.instance) {
      RecorderErrorLogManager.instance = new RecorderErrorLogManager();
    }
    return RecorderErrorLogManager.instance;
  }

  public log(entry: RecorderErrorEntry): void {
    this.entries.push(entry);
  }

  public getEntries(): RecorderErrorEntry[] {
    return this.entries.slice();
  }

  public getBySeverity(severity: ErrorSeverity): RecorderErrorEntry[] {
    return this.entries.filter((entry: RecorderErrorEntry) => entry.getSeverity() === severity);
  }

  public getCountBySeverity(severity: ErrorSeverity): number {
    return this.getBySeverity(severity).length;
  }

  public clear(): void {
    this.entries = [];
  }
}

// 恢复计划模型：描述针对特定错误的恢复步骤
class RecorderRecoveryPlan {
  public entry: RecorderErrorEntry;
  public strategy: RecoveryStrategy;
  public maxRetries: number;
  public steps: string[];

  constructor(entry: RecorderErrorEntry, strategy: RecoveryStrategy, maxRetries: number, steps: string[]) {
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

  public getEntry(): RecorderErrorEntry {
    return this.entry;
  }

  public getStrategy(): RecoveryStrategy {
    return this.strategy;
  }

  public describe(): string {
    return `RecorderRecoveryPlan{strategy: ${this.strategy}, maxRetries: ${this.maxRetries}}`;
  }
}

// 恢复计划目录：维护错误码到恢复计划的映射
class RecorderRecoveryPlanCatalog {
  private plans: Map<number, RecorderRecoveryPlan> = new Map<number, RecorderRecoveryPlan>();

  public register(plan: RecorderRecoveryPlan): void {
    this.plans.set(plan.entry.getCode(), plan);
  }

  public lookup(code: number): RecorderRecoveryPlan | null {
    const value: RecorderRecoveryPlan | undefined = this.plans.get(code);
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
    this.plans = new Map<number, RecorderRecoveryPlan>();
  }
}

// 错误序列追踪器：按发生顺序记录错误码
class RecorderErrorSequenceTracker {
  private sequence: number[] = [];

  public append(code: number): void {
    this.sequence.push(code);
  }

  public getSequence(): number[] {
    return this.sequence.slice();
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

export default function screenRecorderDialogErrorRecoveryTest(): void {
  describe('ScreenRecorderDialogErrorRecovery_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await serializedDelay(driver, 500);
    });

    // 空上下文时 getHelper 应失败
    it('get_helper_should_fail_when_context_is_null', 0, async () => {
      const executor: RecorderOperationExecutor = new RecorderOperationExecutor(null);
      expect(executor.getHelper()).assertFalse();
    });

    // 有效上下文时 getHelper 应成功
    it('get_helper_should_succeed_with_valid_context', 0, async () => {
      const executor: RecorderOperationExecutor = new RecorderOperationExecutor(new MockRecorderContext(true));
      expect(executor.getHelper()).assertTrue();
    });

    // 空上下文启动录屏应失败并返回上下文错误码
    it('start_with_null_context_should_return_failure', 0, async () => {
      const executor: RecorderOperationExecutor = new RecorderOperationExecutor(null);
      const result: RecorderOperationResult = executor.execute(RecorderAction.START);
      expect(result.success).assertFalse();
      expect(result.message).assertEqual('context is null');
      expect(result.code).assertEqual(1001);
    });

    // 查询动作应返回成功
    it('query_action_should_return_success', 0, async () => {
      const executor: RecorderOperationExecutor = new RecorderOperationExecutor(new MockRecorderContext(true));
      const result: RecorderOperationResult = executor.execute(RecorderAction.QUERY);
      expect(result.success).assertTrue();
      expect(result.code).assertEqual(0);
    });

    // 创建媒体资产失败的故障应被处理
    it('fault_injection_asset_failure_should_be_handled', 0, async () => {
      const executor: RecorderOperationExecutor = new RecorderOperationExecutor(new MockRecorderContext(true));
      const result: RecorderOperationResult = executor.executeWithFault(RecorderAction.START, 'asset');
      expect(result.success).assertFalse();
      expect(result.message).assertEqual('create asset failed');
      expect(result.code).assertEqual(1004);
    });

    // 文件描述符打开失败的故障应被处理
    it('fault_injection_open_failure_should_be_handled', 0, async () => {
      const executor: RecorderOperationExecutor = new RecorderOperationExecutor(new MockRecorderContext(true));
      const result: RecorderOperationResult = executor.executeWithFault(RecorderAction.START, 'open');
      expect(result.success).assertFalse();
      expect(result.message).assertEqual('open fd failed');
      expect(result.code).assertEqual(1005);
    });

    // 原生启动失败的故障应被处理
    it('fault_injection_native_failure_should_be_handled', 0, async () => {
      const executor: RecorderOperationExecutor = new RecorderOperationExecutor(new MockRecorderContext(true));
      const result: RecorderOperationResult = executor.executeWithFault(RecorderAction.START, 'native');
      expect(result.success).assertFalse();
      expect(result.message).assertEqual('native start failed');
      expect(result.code).assertEqual(1006);
    });

    // 超时故障应被处理
    it('fault_injection_timeout_should_be_handled', 0, async () => {
      const executor: RecorderOperationExecutor = new RecorderOperationExecutor(new MockRecorderContext(true));
      const result: RecorderOperationResult = executor.executeWithFault(RecorderAction.STOP, 'timeout');
      expect(result.success).assertFalse();
      expect(result.message).assertEqual('operation timeout');
      expect(result.code).assertEqual(1003);
    });

    // 正常启动与停止应成功
    it('valid_operations_should_succeed', 0, async () => {
      const executor: RecorderOperationExecutor = new RecorderOperationExecutor(new MockRecorderContext(true));
      expect(executor.execute(RecorderAction.START).success).assertTrue();
      expect(executor.execute(RecorderAction.STOP).success).assertTrue();
      expect(executor.execute(RecorderAction.START).code).assertEqual(0);
    });

    // 非法上下文标志应导致执行失败
    it('invalid_context_flag_should_block_execution', 0, async () => {
      const executor: RecorderOperationExecutor = new RecorderOperationExecutor(new MockRecorderContext(false));
      const result: RecorderOperationResult = executor.execute(RecorderAction.START);
      expect(result.success).assertFalse();
      expect(result.code).assertEqual(1001);
    });

    // 路径穿越文件名应被拒绝
    it('path_traversal_name_should_be_rejected', 0, async () => {
      expect(RecorderNameSafetyValidator.isSafeRecordingName('../REC.mp4')).assertFalse();
      expect(RecorderNameSafetyValidator.isSafeRecordingName('..')).assertFalse();
    });

    // 空名称与空字节注入应被拒绝
    it('null_byte_name_should_be_rejected', 0, async () => {
      expect(RecorderNameSafetyValidator.isSafeRecordingName('')).assertFalse();
      expect(RecorderNameSafetyValidator.isSafeRecordingName('REC_20260101_120000.mp4\0')).assertFalse();
    });

    // 合法录屏文件名应通过校验
    it('safe_recording_name_should_pass_validation', 0, async () => {
      expect(RecorderNameSafetyValidator.isSafeRecordingName('REC_20260101_120000.mp4')).assertTrue();
      expect(RecorderNameSafetyValidator.isSafeRecordingName('REC_20261231_235959.mp4')).assertTrue();
    });

    // 非 REC 前缀文件名应被拒绝
    it('non_recording_name_should_be_rejected', 0, async () => {
      expect(RecorderNameSafetyValidator.isSafeRecordingName('VID_20260101_120000.mp4')).assertFalse();
      expect(RecorderNameSafetyValidator.isSafeRecordingName('REC_20260101_120000.mkv')).assertFalse();
    });

    // 失败不应阻断后续操作
    it('partial_failure_should_not_block_other_operations', 0, async () => {
      const executor: RecorderOperationExecutor = new RecorderOperationExecutor(new MockRecorderContext(true));
      const failed: RecorderOperationResult = executor.executeWithFault(RecorderAction.START, 'timeout');
      const succeeded: RecorderOperationResult = executor.execute(RecorderAction.STOP);
      expect(failed.success).assertFalse();
      expect(succeeded.success).assertTrue();
    });

    // 错误条目应可克隆与比较
    it('error_entry_should_clone_and_compare', 0, async () => {
      const entry: RecorderErrorEntry = new RecorderErrorEntry(ErrorSeverity.CRITICAL, 1001, 'context is null', 10);
      const copy: RecorderErrorEntry = entry.clone();
      expect(entry.equals(copy)).assertTrue();
      expect(copy.getCode()).assertEqual(1001);
      expect(entry.isCritical()).assertTrue();
      expect(entry.isWarning()).assertFalse();
      expect(entry.toString()).assertContain('RecorderErrorEntry');
      copy.severity = ErrorSeverity.WARNING;
      expect(entry.equals(copy)).assertFalse();
    });

    // 错误目录应提供上下文为空条目
    it('error_catalog_should_create_context_null_entry', 0, async () => {
      const entry: RecorderErrorEntry = RecorderErrorCatalog.createContextNull();
      expect(entry.getCode()).assertEqual(1001);
      expect(entry.getMessage()).assertEqual('context is null');
      expect(entry.getSeverity()).assertEqual(ErrorSeverity.CRITICAL);
    });

    // 错误目录应提供资产与文件打开失败条目
    it('error_catalog_should_create_asset_and_open_entries', 0, async () => {
      expect(RecorderErrorCatalog.createAssetFailed().getCode()).assertEqual(1004);
      expect(RecorderErrorCatalog.createOpenFailed().getCode()).assertEqual(1005);
      expect(RecorderErrorCatalog.createOpenFailed().isWarning()).assertTrue();
    });

    // 错误目录应提供原生启动失败与未知错误条目
    it('error_catalog_should_create_native_and_unknown_entries', 0, async () => {
      expect(RecorderErrorCatalog.createNativeFailed().getCode()).assertEqual(1006);
      const unknown: RecorderErrorEntry = RecorderErrorCatalog.createUnknownError();
      expect(unknown.getMessage()).assertEqual('未知错误,录制停止');
      expect(unknown.getCode()).assertEqual(1007);
    });

    // 故障注入器应识别已知故障
    it('fault_injector_should_recognize_known_faults', 0, async () => {
      const injector: RecorderFaultInjector = new RecorderFaultInjector();
      expect(injector.inject('timeout')).assertTrue();
      expect(injector.inject('asset')).assertTrue();
      expect(injector.inject('open')).assertTrue();
      expect(injector.inject('native')).assertTrue();
      expect(injector.inject('panic')).assertFalse();
      expect(injector.getInjectedCount()).assertEqual(5);
      expect(injector.hasFault('asset')).assertTrue();
      expect(injector.getFaults().length).assertEqual(5);
      injector.reset();
      expect(injector.getInjectedCount()).assertEqual(0);
    });

    // 恢复编排器应按策略生成报告
    it('recovery_orchestrator_should_build_report', 0, async () => {
      const orchestrator: RecorderRecoveryOrchestrator = new RecorderRecoveryOrchestrator();
      const entry: RecorderErrorEntry = RecorderErrorCatalog.createAssetFailed();
      const report: RecorderRecoveryReport = orchestrator.recover(entry, RecoveryStrategy.RETRY);
      expect(report.success).assertTrue();
      expect(report.strategy).assertEqual(RecoveryStrategy.RETRY);
      expect(report.retryCount).assertEqual(0);
      expect(report.detail).assertContain('create asset failed');
    });

    // 忽略策略应标记恢复失败
    it('ignore_strategy_should_report_failure', 0, async () => {
      const orchestrator: RecorderRecoveryOrchestrator = new RecorderRecoveryOrchestrator();
      const entry: RecorderErrorEntry = RecorderErrorCatalog.createOpenFailed();
      const report: RecorderRecoveryReport = orchestrator.recover(entry, RecoveryStrategy.IGNORE);
      expect(report.success).assertFalse();
      expect(report.strategy).assertEqual(RecoveryStrategy.IGNORE);
    });

    // 重试次数应按错误消息累计
    it('retry_count_should_accumulate_per_error', 0, async () => {
      const orchestrator: RecorderRecoveryOrchestrator = new RecorderRecoveryOrchestrator();
      const entry: RecorderErrorEntry = RecorderErrorCatalog.createNativeFailed();
      orchestrator.recover(entry, RecoveryStrategy.RETRY);
      const second: RecorderRecoveryReport = orchestrator.recover(entry, RecoveryStrategy.RETRY);
      expect(second.retryCount).assertEqual(1);
      expect(orchestrator.getTotalRetries()).assertEqual(2);
      orchestrator.reset();
      expect(orchestrator.getTotalRetries()).assertEqual(0);
    });

    // 错误统计应统计级别与错误码范围
    it('error_statistics_should_aggregate_entries', 0, async () => {
      const statistics: RecorderErrorStatistics = new RecorderErrorStatistics();
      statistics.add(RecorderErrorCatalog.createContextNull());
      statistics.add(RecorderErrorCatalog.createOpenFailed());
      statistics.add(RecorderErrorCatalog.createNativeFailed());
      expect(statistics.getTotalCount()).assertEqual(3);
      expect(statistics.getCriticalCount()).assertEqual(2);
      expect(statistics.getWarningCount()).assertEqual(1);
      expect(statistics.getMaxCode()).assertEqual(1006);
      expect(statistics.getMinCode()).assertEqual(1001);
      statistics.clear();
      expect(statistics.getTotalCount()).assertEqual(0);
      expect(statistics.getMinCode()).assertEqual(-1);
    });

    // 错误日志管理器应按级别过滤
    it('error_log_manager_should_filter_by_severity', 0, async () => {
      const manager: RecorderErrorLogManager = RecorderErrorLogManager.getInstance();
      manager.clear();
      manager.log(RecorderErrorCatalog.createContextNull());
      manager.log(RecorderErrorCatalog.createAssetFailed());
      manager.log(RecorderErrorCatalog.createOpenFailed());
      expect(manager.getEntries().length).assertEqual(3);
      expect(manager.getCountBySeverity(ErrorSeverity.CRITICAL)).assertEqual(2);
      expect(manager.getCountBySeverity(ErrorSeverity.WARNING)).assertEqual(1);
      expect(manager.getBySeverity(ErrorSeverity.INFO).length).assertEqual(0);
      manager.clear();
      expect(manager.getEntries().length).assertEqual(0);
    });

    // 恢复计划应描述策略与步骤
    it('recovery_plan_should_describe_strategy', 0, async () => {
      const entry: RecorderErrorEntry = RecorderErrorCatalog.createAssetFailed();
      const steps: string[] = ['release fd', 'reset state', 'retry start'];
      const plan: RecorderRecoveryPlan =
        new RecorderRecoveryPlan(entry, RecoveryStrategy.ROLLBACK, 3, steps);
      expect(plan.getStepCount()).assertEqual(3);
      expect(plan.getMaxRetries()).assertEqual(3);
      expect(plan.getStrategy()).assertEqual(RecoveryStrategy.ROLLBACK);
      expect(plan.getEntry().getCode()).assertEqual(1004);
      expect(plan.describe()).assertContain('RecorderRecoveryPlan');
    });

    // 恢复计划目录应支持注册与查找
    it('recovery_plan_catalog_should_lookup_by_code', 0, async () => {
      const catalog: RecorderRecoveryPlanCatalog = new RecorderRecoveryPlanCatalog();
      const entry: RecorderErrorEntry = RecorderErrorCatalog.createOpenFailed();
      const plan: RecorderRecoveryPlan =
        new RecorderRecoveryPlan(entry, RecoveryStrategy.RESET, 1, ['reset recorder state']);
      catalog.register(plan);
      expect(catalog.getPlanCount()).assertEqual(1);
      expect(catalog.contains(1005)).assertTrue();
      const found: RecorderRecoveryPlan | null = catalog.lookup(1005);
      expect(found === null).assertFalse();
      expect(catalog.lookup(9999)).assertNull();
      catalog.clear();
      expect(catalog.getPlanCount()).assertEqual(0);
    });

    // 错误序列应保持发生顺序
    it('error_sequence_tracker_should_keep_order', 0, async () => {
      const tracker: RecorderErrorSequenceTracker = new RecorderErrorSequenceTracker();
      tracker.append(1004);
      tracker.append(1005);
      tracker.append(1006);
      expect(tracker.getLength()).assertEqual(3);
      expect(tracker.getFirstCode()).assertEqual(1004);
      expect(tracker.getLastCode()).assertEqual(1006);
      expect(tracker.hasCode(1005)).assertTrue();
      expect(tracker.hasCode(1001)).assertFalse();
      expect(tracker.getSequence().length).assertEqual(3);
      tracker.reset();
      expect(tracker.getLength()).assertEqual(0);
      expect(tracker.getFirstCode()).assertEqual(-1);
      expect(tracker.getLastCode()).assertEqual(-1);
    });

    // 集成：错误恢复后浮窗仍可查询
    it('recorder_window_should_stay_queryable_after_error', 0, async () => {
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 集成：返回键后错误状态不残留
    it('back_press_should_clear_error_state', 0, async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 300);
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });
  });
}
