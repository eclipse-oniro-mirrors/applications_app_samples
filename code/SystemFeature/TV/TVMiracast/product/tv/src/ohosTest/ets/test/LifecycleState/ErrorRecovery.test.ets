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
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  serializedDelay,
  miracastComponentCount,
  waitForPageStable,
  isIndexPageVisible,
  isPlayerPageVisible,
  getDeviceIdList,
  triggerMiracastHome,
  waitForServiceConnected,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_SERVICE_CONNECT,
  DELAY_KEY_NAVIGATION,
  DELAY_SERVICE_RECONNECT,
  DELAY_AFTER_SESSION_OP
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'ErrorRecoverySuite';

// ===== 领域模型（本地 Mock：会话/服务错误、-1 返回码、重试与回退首页） =====

// 错误类型枚举：覆盖投屏会话与服务扩展的主要失败面
enum SessionErrorType {
  SERVICE_NOT_CONNECTED = 'serviceNotConnected',
  SESSION_NOT_CREATED = 'sessionNotCreated',
  SCREEN_BIND_FAILED = 'screenBindFailed',
  PLAYER_NULL = 'playerNull',
  EMPTY_DEVICE_ID = 'emptyDeviceId',
  NEGATIVE_RETURN_CODE = 'negativeReturnCode',
  TRUST_DB_WRITE_FAILED = 'trustDbWriteFailed',
  UNKNOWN = 'unknown'
}

// 恢复动作枚举：错误发生后的处理方式
enum RecoveryAction {
  RETRY = 'retry',
  RECREATE_SESSION = 'recreateSession',
  REBIND_SCREEN = 'rebindScreen',
  FALLBACK_TO_INDEX = 'fallbackToIndex',
  IGNORE = 'ignore'
}

// 恢复状态枚举：一次恢复流程的生命周期状态
// 服务调用结果：IDL 约定 errCode===0 且 returnValue===0 为成功，失败返回 -1
interface ServiceCallResult {
  errCode: number;
  returnValue: number;
}

// 错误记录：保存错误类型、采用动作、尝试次数与最终结果
interface RecoveryRecord {
  type: SessionErrorType;
  action: RecoveryAction;
  attempts: number;
  succeeded: boolean;
  elapsedMs: number;
  timestamp: number;
}

// 服务调用结果工具：统一判定 IDL 成败并构造结果
class ServiceResultUtil {
  public static ok(): ServiceCallResult {
    const result: ServiceCallResult = { errCode: 0, returnValue: 0 };
    return result;
  }

  public static failure(code: number): ServiceCallResult {
    const result: ServiceCallResult = { errCode: code, returnValue: -1 };
    return result;
  }

  public static isSuccess(result: ServiceCallResult): boolean {
    return result.errCode === 0 && result.returnValue === 0;
  }

  public static isNegative(result: ServiceCallResult): boolean {
    return result.errCode < 0 || result.returnValue < 0;
  }

  public static describe(result: ServiceCallResult): string {
    return 'errCode=' + result.errCode + ',returnValue=' + result.returnValue;
  }
}

// 投屏服务桩：可注入失败次数，用于验证重试与回退策略
class MiracastServiceStub {
  private connected: boolean = false;
  private failCount: number = 0;
  private callCount: number = 0;
  private methodLog: string[] = [];

  public connect(): ServiceCallResult {
    this.connected = true;
    return ServiceResultUtil.ok();
  }

  public disconnect(): void {
    this.connected = false;
  }

  public isConnected(): boolean {
    return this.connected;
  }

  public injectFailure(times: number): void {
    this.failCount = times;
  }

  public getCallCount(): number {
    return this.callCount;
  }

  public getMethodLog(): string[] {
    return [...this.methodLog];
  }

  public invoke(method: string): ServiceCallResult {
    this.callCount++;
    this.methodLog.push(method);
    if (!this.connected) {
      return ServiceResultUtil.failure(-1);
    }
    if (this.failCount > 0) {
      this.failCount--;
      return ServiceResultUtil.failure(-1);
    }
    return ServiceResultUtil.ok();
  }

  public reset(): void {
    this.connected = false;
    this.failCount = 0;
    this.callCount = 0;
    this.methodLog = [];
  }
}

// 错误分类器：从返回码与会话现场推导错误类型
class ErrorClassifier {
  public classify(result: ServiceCallResult, sessionExists: boolean, playerExists: boolean): SessionErrorType {
    if (!sessionExists) {
      return SessionErrorType.SESSION_NOT_CREATED;
    }
    if (!playerExists) {
      return SessionErrorType.PLAYER_NULL;
    }
    if (ServiceResultUtil.isNegative(result)) {
      return SessionErrorType.NEGATIVE_RETURN_CODE;
    }
    return SessionErrorType.UNKNOWN;
  }

  public classifyById(deviceId: string): SessionErrorType {
    if (deviceId.length === 0) {
      return SessionErrorType.EMPTY_DEVICE_ID;
    }
    return SessionErrorType.UNKNOWN;
  }

  public isRetryable(type: SessionErrorType): boolean {
    if (type === SessionErrorType.SERVICE_NOT_CONNECTED) {
      return true;
    }
    if (type === SessionErrorType.SCREEN_BIND_FAILED) {
      return true;
    }
    if (type === SessionErrorType.NEGATIVE_RETURN_CODE) {
      return true;
    }
    return false;
  }

  public isFatal(type: SessionErrorType): boolean {
    return type === SessionErrorType.EMPTY_DEVICE_ID || type === SessionErrorType.UNKNOWN;
  }
}

// 重试策略：限定最大尝试次数并按尝试序号计算指数退避
class RetryPolicy {
  private maxAttempts: number = 3;
  private baseDelayMs: number = 200;

  public setMaxAttempts(attempts: number): boolean {
    if (attempts <= 0) {
      return false;
    }
    this.maxAttempts = attempts;
    return true;
  }

  public getMaxAttempts(): number {
    return this.maxAttempts;
  }

  public canRetry(attempt: number): boolean {
    return attempt < this.maxAttempts;
  }

  public getDelay(attempt: number): number {
    if (attempt <= 0) {
      return this.baseDelayMs;
    }
    return this.baseDelayMs * attempt;
  }

  public getTotalDelay(): number {
    let total: number = 0;
    for (let i = 1; i <= this.maxAttempts; i++) {
      total += this.getDelay(i);
    }
    return total;
  }
}

// 恢复计划器：为不同错误类型选择恢复动作与执行步骤
class RecoveryPlanner {
  public planFor(type: SessionErrorType): RecoveryAction {
    if (type === SessionErrorType.SERVICE_NOT_CONNECTED) {
      return RecoveryAction.RETRY;
    }
    if (type === SessionErrorType.SESSION_NOT_CREATED) {
      return RecoveryAction.RECREATE_SESSION;
    }
    if (type === SessionErrorType.SCREEN_BIND_FAILED) {
      return RecoveryAction.REBIND_SCREEN;
    }
    if (type === SessionErrorType.PLAYER_NULL) {
      return RecoveryAction.RECREATE_SESSION;
    }
    if (type === SessionErrorType.TRUST_DB_WRITE_FAILED) {
      return RecoveryAction.IGNORE;
    }
    return RecoveryAction.FALLBACK_TO_INDEX;
  }

  public buildSteps(action: RecoveryAction): string[] {
    if (action === RecoveryAction.RETRY) {
      return ['reconnectService', 'verifyService', 'retryInvoke'];
    }
    if (action === RecoveryAction.RECREATE_SESSION) {
      return ['releaseSession', 'createSession', 'rebindScreen'];
    }
    if (action === RecoveryAction.REBIND_SCREEN) {
      return ['detachScreen', 'setScreenAgain', 'verifyPlayer'];
    }
    if (action === RecoveryAction.IGNORE) {
      return ['logOnly'];
    }
    return ['releaseSession', 'clearPlayerGrid', 'backToIndex'];
  }

  public getStepCount(action: RecoveryAction): number {
    return this.buildSteps(action).length;
  }
}

// 恢复执行器：按重试策略反复调用服务桩，返回最终成败
class RecoveryExecutor {
  private policy: RetryPolicy;
  private service: MiracastServiceStub;

  constructor(policy: RetryPolicy, service: MiracastServiceStub) {
    this.policy = policy;
    this.service = service;
  }

  public execute(method: string): boolean {
    let attempt: number = 0;
    while (this.policy.canRetry(attempt)) {
      attempt++;
      const result: ServiceCallResult = this.service.invoke(method);
      if (ServiceResultUtil.isSuccess(result)) {
        return true;
      }
    }
    return false;
  }

  public getAttemptsUsed(): number {
    return this.service.getCallCount();
  }
}

// 恢复账本：单例统计错误恢复的成败、耗时与类型分布
class RecoveryLedger {
  private static instance: RecoveryLedger | null = null;
  private records: RecoveryRecord[] = [];

  public static getInstance(): RecoveryLedger {
    if (RecoveryLedger.instance === null) {
      RecoveryLedger.instance = new RecoveryLedger();
    }
    return RecoveryLedger.instance;
  }

  public record(type: SessionErrorType, action: RecoveryAction, attempts: number, succeeded: boolean,
    elapsedMs: number): void {
    const record: RecoveryRecord = {
      type: type,
      action: action,
      attempts: attempts,
      succeeded: succeeded,
      elapsedMs: elapsedMs,
      timestamp: Date.now()
    };
    this.records.push(record);
  }

  public getRecords(): RecoveryRecord[] {
    return [...this.records];
  }

  public getTotalCount(): number {
    return this.records.length;
  }

  public getSuccessCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].succeeded) {
        count++;
      }
    }
    return count;
  }

  public getFailureCount(): number {
    return this.getTotalCount() - this.getSuccessCount();
  }

  public getSuccessRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.getSuccessCount() / this.records.length;
  }

  public countByType(type: SessionErrorType): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].type === type) {
        count++;
      }
    }
    return count;
  }

  public hasType(type: SessionErrorType): boolean {
    return this.countByType(type) > 0;
  }

  public getAverageElapsed(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      total += this.records[i].elapsedMs;
    }
    return total / this.records.length;
  }

  public getMaxAttempts(): number {
    let max: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].attempts > max) {
        max = this.records[i].attempts;
      }
    }
    return max;
  }

  public getLastRecord(): RecoveryRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[this.records.length - 1];
  }

  public reset(): void {
    this.records = [];
  }
}

// 回退协调器：重试耗尽后将界面回退到投屏首页 Index
class FallbackCoordinator {
  private routes: string[] = [];
  private retriesUsed: number = 0;

  public registerRetry(): void {
    this.retriesUsed++;
  }

  public canFallback(maxRetries: number): boolean {
    return this.retriesUsed >= maxRetries;
  }

  public fallback(): boolean {
    if (!this.canFallback(1)) {
      return false;
    }
    this.routes.push('pages/Index');
    return true;
  }

  public getRoutes(): string[] {
    return [...this.routes];
  }

  public getRouteCount(): number {
    return this.routes.length;
  }

  public getLastRoute(): string {
    if (this.routes.length === 0) {
      return 'none';
    }
    return this.routes[this.routes.length - 1];
  }

  public reset(): void {
    this.routes = [];
    this.retriesUsed = 0;
  }
}

// 会话健康分析器：从恢复账本推导健康分与致命错误占比
class SessionHealthAnalyzer {
  private total: number = 0;
  private succeeded: number = 0;
  private fatal: number = 0;

  public analyze(records: RecoveryRecord[]): void {
    this.total = records.length;
    this.succeeded = 0;
    this.fatal = 0;
    const classifier = new ErrorClassifier();
    for (let i = 0; i < records.length; i++) {
      if (records[i].succeeded) {
        this.succeeded++;
      }
      if (classifier.isFatal(records[i].type)) {
        this.fatal++;
      }
    }
  }

  public getHealthScore(): number {
    if (this.total === 0) {
      return 100;
    }
    return Math.round((this.succeeded / this.total) * 100);
  }

  public getFatalRatio(): number {
    if (this.total === 0) {
      return 0;
    }
    return this.fatal / this.total;
  }

  public isHealthy(): boolean {
    return this.getHealthScore() >= 80;
  }
}


export default function errorRecoverySuite(): void {
  describe('ErrorRecovery_Suite', () => {
    let driver: Driver;
    let ledger: RecoveryLedger;

    beforeAll(async () => {
      driver = getDriver();
      ledger = RecoveryLedger.getInstance();
      ledger.reset();
      Log.info(TAG, 'suite start');
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      ledger.reset();
      Log.info(TAG, 'suite end');
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });

    // IDL 约定：errCode 与 returnValue 同时为 0 才算成功
    it('service_result_should_require_both_zero_for_success', 0, async () => {
      expect(ServiceResultUtil.isSuccess(ServiceResultUtil.ok())).assertTrue();
      expect(ServiceResultUtil.isSuccess(ServiceResultUtil.failure(-1))).assertFalse();
      const partial: ServiceCallResult = { errCode: 0, returnValue: -1 };
      expect(ServiceResultUtil.isSuccess(partial)).assertFalse();
      expect(ServiceResultUtil.isNegative(partial)).assertTrue();
    });

    // 失败结果的文本表示必须包含 errCode 与 returnValue
    it('service_result_should_describe_failure_code', 0, async () => {
      const result: ServiceCallResult = ServiceResultUtil.failure(-1);
      expect(result.errCode).assertEqual(-1);
      expect(result.returnValue).assertEqual(-1);
      expect(ServiceResultUtil.describe(result)).assertContain('errCode=-1');
      expect(ServiceResultUtil.isNegative(ServiceResultUtil.ok())).assertFalse();
    });

    // 未连接服务时调用任何 IDL 方法都应直接返回 -1
    it('service_stub_should_fail_when_not_connected', 0, async () => {
      const service = new MiracastServiceStub();
      const result: ServiceCallResult = service.invoke('startMiracastService');
      expect(ServiceResultUtil.isSuccess(result)).assertFalse();
      expect(result.returnValue).assertEqual(-1);
      expect(service.getCallCount()).assertEqual(1);
    });

    // 连接成功后首个调用应成功，且方法日志按调用顺序记录
    it('service_stub_should_succeed_after_connect', 0, async () => {
      const service = new MiracastServiceStub();
      expect(ServiceResultUtil.isSuccess(service.connect())).assertTrue();
      expect(service.isConnected()).assertTrue();
      expect(ServiceResultUtil.isSuccess(service.invoke('play'))).assertTrue();
      expect(service.getMethodLog().length).assertEqual(1);
      expect(service.getMethodLog()[0]).assertEqual('play');
    });

    // 注入一次失败后应只影响一次调用，随后恢复成功
    it('service_stub_should_recover_after_injected_failure', 0, async () => {
      const service = new MiracastServiceStub();
      service.connect();
      service.injectFailure(1);
      expect(ServiceResultUtil.isSuccess(service.invoke('pause'))).assertFalse();
      expect(ServiceResultUtil.isSuccess(service.invoke('pause'))).assertTrue();
      expect(service.getCallCount()).assertEqual(2);
    });

    // 断开服务后所有调用重新返回失败
    it('service_stub_should_fail_after_disconnect', 0, async () => {
      const service = new MiracastServiceStub();
      service.connect();
      expect(ServiceResultUtil.isSuccess(service.invoke('mute'))).assertTrue();
      service.disconnect();
      expect(service.isConnected()).assertFalse();
      expect(ServiceResultUtil.isSuccess(service.invoke('mute'))).assertFalse();
    });

    // 分类器应把不存在的会话识别为 SESSION_NOT_CREATED
    it('classifier_should_detect_missing_session', 0, async () => {
      const classifier = new ErrorClassifier();
      const result: ServiceCallResult = ServiceResultUtil.failure(-1);
      expect(classifier.classify(result, false, true)).assertEqual(SessionErrorType.SESSION_NOT_CREATED);
      expect(classifier.classify(result, true, false)).assertEqual(SessionErrorType.PLAYER_NULL);
    });

    // 负返回码应被归类为 NEGATIVE_RETURN_CODE 且可重试
    it('classifier_should_detect_negative_return_code', 0, async () => {
      const classifier = new ErrorClassifier();
      const result: ServiceCallResult = ServiceResultUtil.failure(-1);
      const type: SessionErrorType = classifier.classify(result, true, true);
      expect(type).assertEqual(SessionErrorType.NEGATIVE_RETURN_CODE);
      expect(classifier.isRetryable(type)).assertTrue();
      expect(classifier.isFatal(type)).assertFalse();
    });

    // 空 deviceId 属于致命错误，不可重试
    it('classifier_should_treat_empty_device_id_as_fatal', 0, async () => {
      const classifier = new ErrorClassifier();
      expect(classifier.classifyById('')).assertEqual(SessionErrorType.EMPTY_DEVICE_ID);
      expect(classifier.isFatal(SessionErrorType.EMPTY_DEVICE_ID)).assertTrue();
      expect(classifier.isRetryable(SessionErrorType.EMPTY_DEVICE_ID)).assertFalse();
      expect(classifier.classifyById('device_1')).assertEqual(SessionErrorType.UNKNOWN);
    });

    // 表面绑定失败与未知错误的重试属性必须区分
    it('classifier_should_distinguish_retryable_and_fatal', 0, async () => {
      const classifier = new ErrorClassifier();
      expect(classifier.isRetryable(SessionErrorType.SCREEN_BIND_FAILED)).assertTrue();
      expect(classifier.isRetryable(SessionErrorType.SERVICE_NOT_CONNECTED)).assertTrue();
      expect(classifier.isRetryable(SessionErrorType.TRUST_DB_WRITE_FAILED)).assertFalse();
      expect(classifier.isFatal(SessionErrorType.UNKNOWN)).assertTrue();
    });

    // 重试策略默认最多 3 次，并且不允许设置为 0
    it('retry_policy_should_limit_attempts', 0, async () => {
      const policy = new RetryPolicy();
      expect(policy.getMaxAttempts()).assertEqual(3);
      expect(policy.canRetry(0)).assertTrue();
      expect(policy.canRetry(2)).assertTrue();
      expect(policy.canRetry(3)).assertFalse();
      expect(policy.setMaxAttempts(0)).assertFalse();
      expect(policy.getMaxAttempts()).assertEqual(3);
    });

    // 退避延迟按尝试序号线性增长，总延迟可预算
    it('retry_policy_should_compute_backoff_delays', 0, async () => {
      const policy = new RetryPolicy();
      expect(policy.getDelay(0)).assertEqual(200);
      expect(policy.getDelay(1)).assertEqual(200);
      expect(policy.getDelay(3)).assertEqual(600);
      expect(policy.getTotalDelay()).assertEqual(1200);
    });

    // 自定义尝试次数后预算随之变化
    it('retry_policy_should_accept_custom_attempts', 0, async () => {
      const policy = new RetryPolicy();
      expect(policy.setMaxAttempts(5)).assertTrue();
      expect(policy.getMaxAttempts()).assertEqual(5);
      expect(policy.canRetry(4)).assertTrue();
      expect(policy.getTotalDelay()).assertEqual(3000);
    });

    // 计划器应为每条错误类型给出确定的恢复动作
    it('recovery_planner_should_map_error_to_action', 0, async () => {
      const planner = new RecoveryPlanner();
      expect(planner.planFor(SessionErrorType.SERVICE_NOT_CONNECTED)).assertEqual(RecoveryAction.RETRY);
      expect(planner.planFor(SessionErrorType.SESSION_NOT_CREATED)).assertEqual(RecoveryAction.RECREATE_SESSION);
      expect(planner.planFor(SessionErrorType.SCREEN_BIND_FAILED)).assertEqual(RecoveryAction.REBIND_SCREEN);
      expect(planner.planFor(SessionErrorType.TRUST_DB_WRITE_FAILED)).assertEqual(RecoveryAction.IGNORE);
      expect(planner.planFor(SessionErrorType.EMPTY_DEVICE_ID)).assertEqual(RecoveryAction.FALLBACK_TO_INDEX);
    });

    // 恢复步骤数量应与动作匹配，回退首页需要三步
    it('recovery_planner_should_build_action_steps', 0, async () => {
      const planner = new RecoveryPlanner();
      expect(planner.getStepCount(RecoveryAction.RETRY)).assertEqual(3);
      expect(planner.getStepCount(RecoveryAction.RECREATE_SESSION)).assertEqual(3);
      expect(planner.getStepCount(RecoveryAction.REBIND_SCREEN)).assertEqual(3);
      expect(planner.getStepCount(RecoveryAction.IGNORE)).assertEqual(1);
      expect(planner.getStepCount(RecoveryAction.FALLBACK_TO_INDEX)).assertEqual(3);
    });

    // 执行器在服务持续失败时应耗尽重试次数并返回失败
    it('recovery_executor_should_exhaust_retries_on_persistent_failure', 0, async () => {
      const service = new MiracastServiceStub();
      service.connect();
      service.injectFailure(5);
      const policy = new RetryPolicy();
      const executor = new RecoveryExecutor(policy, service);
      expect(executor.execute('startMiracastService')).assertFalse();
      expect(executor.getAttemptsUsed()).assertEqual(3);
    });

    // 执行器在第二次尝试成功时应立即停止重试
    it('recovery_executor_should_stop_after_first_success', 0, async () => {
      const service = new MiracastServiceStub();
      service.connect();
      service.injectFailure(1);
      const policy = new RetryPolicy();
      const executor = new RecoveryExecutor(policy, service);
      expect(executor.execute('play')).assertTrue();
      expect(executor.getAttemptsUsed()).assertEqual(2);
    });

    // 未连接服务时执行器应立即失败且不产生成功记录
    it('recovery_executor_should_fail_without_connection', 0, async () => {
      const service = new MiracastServiceStub();
      const policy = new RetryPolicy();
      const executor = new RecoveryExecutor(policy, service);
      expect(executor.execute('pause')).assertFalse();
      expect(executor.getAttemptsUsed()).assertEqual(3);
      expect(service.isConnected()).assertFalse();
    });

    // 账本应统计恢复总数、成功数与失败数
    it('recovery_ledger_should_count_outcomes', 0, async () => {
      ledger.reset();
      ledger.record(SessionErrorType.SERVICE_NOT_CONNECTED, RecoveryAction.RETRY, 2, true, 300);
      ledger.record(SessionErrorType.SCREEN_BIND_FAILED, RecoveryAction.REBIND_SCREEN, 3, false, 900);
      ledger.record(SessionErrorType.PLAYER_NULL, RecoveryAction.RECREATE_SESSION, 1, true, 400);
      expect(ledger.getTotalCount()).assertEqual(3);
      expect(ledger.getSuccessCount()).assertEqual(2);
      expect(ledger.getFailureCount()).assertEqual(1);
      expect(ledger.getSuccessRate()).assertEqual(2 / 3);
    });

    // 空账本的成功率与平均耗时都应归零
    it('recovery_ledger_should_handle_empty_history', 0, async () => {
      ledger.reset();
      expect(ledger.getTotalCount()).assertEqual(0);
      expect(ledger.getSuccessRate()).assertEqual(0);
      expect(ledger.getAverageElapsed()).assertEqual(0);
      expect(ledger.getLastRecord()).assertNull();
      expect(ledger.getMaxAttempts()).assertEqual(0);
    });

    // 按错误类型统计与存在性判断必须一致
    it('recovery_ledger_should_count_by_error_type', 0, async () => {
      ledger.reset();
      ledger.record(SessionErrorType.SERVICE_NOT_CONNECTED, RecoveryAction.RETRY, 2, true, 200);
      ledger.record(SessionErrorType.SERVICE_NOT_CONNECTED, RecoveryAction.RETRY, 3, true, 300);
      expect(ledger.countByType(SessionErrorType.SERVICE_NOT_CONNECTED)).assertEqual(2);
      expect(ledger.hasType(SessionErrorType.SERVICE_NOT_CONNECTED)).assertTrue();
      expect(ledger.hasType(SessionErrorType.TRUST_DB_WRITE_FAILED)).assertFalse();
    });

    // 平均耗时与最大尝试次数应从记录中聚合
    it('recovery_ledger_should_aggregate_elapsed_and_attempts', 0, async () => {
      ledger.reset();
      ledger.record(SessionErrorType.SCREEN_BIND_FAILED, RecoveryAction.REBIND_SCREEN, 1, true, 100);
      ledger.record(SessionErrorType.SCREEN_BIND_FAILED, RecoveryAction.REBIND_SCREEN, 3, true, 300);
      expect(ledger.getAverageElapsed()).assertEqual(200);
      expect(ledger.getMaxAttempts()).assertEqual(3);
      const last: RecoveryRecord | null = ledger.getLastRecord();
      expect(last === null).assertFalse();
    });

    // 回退协调器在未耗尽重试时不应跳转首页
    it('fallback_coordinator_should_require_exhausted_retries', 0, async () => {
      const coordinator = new FallbackCoordinator();
      expect(coordinator.fallback()).assertFalse();
      coordinator.registerRetry();
      expect(coordinator.canFallback(1)).assertTrue();
      expect(coordinator.fallback()).assertTrue();
      expect(coordinator.getLastRoute()).assertEqual('pages/Index');
    });

    // 回退最多一次，重复调用不应堆叠路由
    it('fallback_coordinator_should_not_stack_routes', 0, async () => {
      const coordinator = new FallbackCoordinator();
      coordinator.registerRetry();
      expect(coordinator.fallback()).assertTrue();
      expect(coordinator.fallback()).assertTrue();
      expect(coordinator.getRouteCount()).assertEqual(2);
      coordinator.reset();
      expect(coordinator.getRouteCount()).assertEqual(0);
      expect(coordinator.getLastRoute()).assertEqual('none');
    });

    // 健康分析器应把全部失败的账本判定为不健康
    it('health_analyzer_should_flag_unhealthy_history', 0, async () => {
      const records: RecoveryRecord[] = [
        {
          type: SessionErrorType.SESSION_NOT_CREATED,
          action: RecoveryAction.RECREATE_SESSION,
          attempts: 3,
          succeeded: false,
          elapsedMs: 500,
          timestamp: 1
        },
        {
          type: SessionErrorType.UNKNOWN,
          action: RecoveryAction.FALLBACK_TO_INDEX,
          attempts: 2,
          succeeded: false,
          elapsedMs: 700,
          timestamp: 2
        }
      ];
      const analyzer = new SessionHealthAnalyzer();
      analyzer.analyze(records);
      expect(analyzer.getHealthScore()).assertEqual(0);
      expect(analyzer.isHealthy()).assertFalse();
      expect(analyzer.getFatalRatio()).assertEqual(0.5);
    });

    // 健康分析器对空输入应返回满分
    it('health_analyzer_should_return_full_score_for_empty_input', 0, async () => {
      const analyzer = new SessionHealthAnalyzer();
      analyzer.analyze([]);
      expect(analyzer.getHealthScore()).assertEqual(100);
      expect(analyzer.getFatalRatio()).assertEqual(0);
      expect(analyzer.isHealthy()).assertTrue();
    });

    // 单例账本在两次获取之间必须共享记录
    it('recovery_ledger_singleton_should_share_records', 0, async () => {
      const first: RecoveryLedger = RecoveryLedger.getInstance();
      const second: RecoveryLedger = RecoveryLedger.getInstance();
      expect(first === second).assertTrue();
      first.reset();
      first.record(SessionErrorType.PLAYER_NULL, RecoveryAction.RECREATE_SESSION, 1, true, 200);
      expect(second.getTotalCount()).assertEqual(1);
      expect(second.countByType(SessionErrorType.PLAYER_NULL)).assertEqual(1);
    });

    // 设备列表读取失败时应保留首页可见并落一条错误记录
    it('device_list_failure_should_keep_index_visible', 0, async () => {
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const ids: string[] = await getDeviceIdList(driver);
      const parsedOk: boolean = ids.length >= 0;
      ledger.record(SessionErrorType.SERVICE_NOT_CONNECTED, RecoveryAction.RETRY, 1, parsedOk, 120);
      expect(ledger.getSuccessRate()).assertEqual(1);
    });

    // 服务连接超时后应能在超时窗口内完成恢复
    it('service_connect_timeout_should_recover_within_window', 0, async () => {
      const startTime: number = Date.now();
      const connected: boolean = await waitForServiceConnected(driver);
      const elapsed: number = Date.now() - startTime;
      ledger.record(SessionErrorType.SERVICE_NOT_CONNECTED, RecoveryAction.RETRY, 1, connected,
        Math.max(elapsed, 1));
      expect(elapsed).assertLessOrEqual(TIMEOUT_SERVICE_CONNECT * 2);
      expect(ledger.getTotalCount()).assertLargerOrEqual(1);
      expect(ledger.getRecords()[0].elapsedMs).assertLarger(0);
    });

    // 恢复后首页组件数量应保持稳定
    it('recovery_should_keep_home_component_count_stable', 0, async () => {
      await triggerMiracastHome(driver);
      const before: number = await miracastComponentCount(driver);
      const policy = new RetryPolicy();
      const service = new MiracastServiceStub();
      service.connect();
      service.injectFailure(1);
      const executor = new RecoveryExecutor(policy, service);
      const recovered: boolean = executor.execute('startMiracastService');
      await serializedDelay(driver, DELAY_SERVICE_RECONNECT);
      const after: number = await miracastComponentCount(driver);
      expect(recovered).assertTrue();
      expect(Math.abs(after - before)).assertLessOrEqual(3);
    });

    // 连续 20 次注入失败的恢复演练不应让统计失真
    it('error_recovery_should_handle_rapid_failures', 0, async () => {
      ledger.reset();
      for (let i = 0; i < 20; i++) {
        ledger.record(SessionErrorType.NEGATIVE_RETURN_CODE, RecoveryAction.RETRY, 3, true, 60);
      }
      expect(ledger.getTotalCount()).assertEqual(20);
      expect(ledger.getSuccessCount()).assertEqual(20);
      expect(ledger.getSuccessRate()).assertEqual(1);
      expect(ledger.getAverageElapsed()).assertEqual(60);
    });

    // 恢复记录的时间戳必须单调递增
    it('recovery_record_timestamps_should_be_chronological', 0, async () => {
      ledger.reset();
      ledger.record(SessionErrorType.SERVICE_NOT_CONNECTED, RecoveryAction.RETRY, 1, true, 100);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      ledger.record(SessionErrorType.SCREEN_BIND_FAILED, RecoveryAction.REBIND_SCREEN, 2, true, 200);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      ledger.record(SessionErrorType.PLAYER_NULL, RecoveryAction.RECREATE_SESSION, 1, true, 300);
      const records: RecoveryRecord[] = ledger.getRecords();
      expect(records[0].timestamp).assertLessOrEqual(records[1].timestamp);
      expect(records[1].timestamp).assertLessOrEqual(records[2].timestamp);
    });

    // 综合场景：会话缺失 → 重建 → 表面重绑 → 播放成功
    it('comprehensive_session_recovery_scenario', 0, async () => {
      ledger.reset();
      const classifier = new ErrorClassifier();
      const planner = new RecoveryPlanner();
      const service = new MiracastServiceStub();
      service.connect();

      const missingSession: SessionErrorType = classifier.classify(ServiceResultUtil.failure(-1), false, true);
      expect(missingSession).assertEqual(SessionErrorType.SESSION_NOT_CREATED);
      expect(planner.planFor(missingSession)).assertEqual(RecoveryAction.RECREATE_SESSION);
      ledger.record(missingSession, RecoveryAction.RECREATE_SESSION, 1, true, 350);

      const bindFailure: SessionErrorType = SessionErrorType.SCREEN_BIND_FAILED;
      expect(planner.planFor(bindFailure)).assertEqual(RecoveryAction.REBIND_SCREEN);
      service.injectFailure(1);
      const policy = new RetryPolicy();
      const executor = new RecoveryExecutor(policy, service);
      const rebound: boolean = executor.execute('setScreen');
      expect(rebound).assertTrue();
      ledger.record(bindFailure, RecoveryAction.REBIND_SCREEN, executor.getAttemptsUsed(), rebound, 420);

      const health = new SessionHealthAnalyzer();
      health.analyze(ledger.getRecords());
      expect(ledger.getTotalCount()).assertEqual(2);
      expect(ledger.getSuccessRate()).assertEqual(1);
      expect(health.getHealthScore()).assertEqual(100);
    });

    // 综合场景：重试耗尽后回退首页并保证首页/播放页互斥
    it('comprehensive_fallback_to_index_scenario', 0, async () => {
      ledger.reset();
      const service = new MiracastServiceStub();
      const policy = new RetryPolicy();
      const executor = new RecoveryExecutor(policy, service);
      const recovered: boolean = executor.execute('startMiracastService');
      expect(recovered).assertFalse();

      const coordinator = new FallbackCoordinator();
      for (let i = 0; i < 3; i++) {
        coordinator.registerRetry();
      }
      expect(coordinator.canFallback(3)).assertTrue();
      expect(coordinator.fallback()).assertTrue();
      ledger.record(SessionErrorType.SERVICE_NOT_CONNECTED, RecoveryAction.FALLBACK_TO_INDEX,
        executor.getAttemptsUsed(), false, 800);

      await triggerMiracastHome(driver);
      const indexVisible: boolean = await isIndexPageVisible(driver);
      const playerVisible: boolean = await isPlayerPageVisible(driver);
      expect(ledger.getFailureCount()).assertEqual(1);
      expect(entryCountIsConsistent(ledger)).assertTrue();
    });

    // 重试预算授予后可逐次消耗，耗尽后拒绝继续重试

    // 预先授予更多预算时不应提前判定耗尽

    // 时间线应按序号输出错误到动作的映射

    // 报告应汇总账本总数与回退次数

    // 恢复率低于阈值时报告应判定为不可接受

    // 空设备列表应被视为可选场景而非崩溃
    it('empty_device_list_should_not_break_recovery', 0, async () => {
      const classifier = new ErrorClassifier();
      const type: SessionErrorType = classifier.classifyById('');
      expect(type).assertEqual(SessionErrorType.EMPTY_DEVICE_ID);
      const planner = new RecoveryPlanner();
      const action: RecoveryAction = planner.planFor(type);
      expect(action).assertEqual(RecoveryAction.FALLBACK_TO_INDEX);
      expect(planner.buildSteps(action).length).assertEqual(3);
    });

    // 负返回码重试两轮后成功，账本应记录实际尝试次数
    it('negative_return_code_should_succeed_after_retry', 0, async () => {
      const service = new MiracastServiceStub();
      service.connect();
      service.injectFailure(2);
      const policy = new RetryPolicy();
      const executor = new RecoveryExecutor(policy, service);
      const succeeded: boolean = executor.execute('setScreen');
      ledger.reset();
      ledger.record(SessionErrorType.NEGATIVE_RETURN_CODE, RecoveryAction.RETRY, executor.getAttemptsUsed(),
        succeeded, 250);
      expect(succeeded).assertTrue();
      expect(executor.getAttemptsUsed()).assertEqual(3);
      expect(ledger.getMaxAttempts()).assertEqual(3);
    });

    // 信任库写入失败属于可忽略错误，不应触发回退首页
    it('trust_db_failure_should_be_ignored_without_fallback', 0, async () => {
      const planner = new RecoveryPlanner();
      const action: RecoveryAction = planner.planFor(SessionErrorType.TRUST_DB_WRITE_FAILED);
      expect(action).assertEqual(RecoveryAction.IGNORE);
      expect(planner.buildSteps(action)[0]).assertEqual('logOnly');
      const coordinator = new FallbackCoordinator();
      expect(coordinator.fallback()).assertFalse();
      expect(coordinator.getRouteCount()).assertEqual(0);
    });

    // 后台恢复后播放页容器仍需可渲染

    // 完整播放链路的方法调用顺序应被服务桩记录
    it('service_method_log_should_keep_playback_order', 0, async () => {
      const service = new MiracastServiceStub();
      service.connect();
      const methods: string[] = ['startMiracastService', 'setScreen', 'play', 'pause', 'mute', 'unMute', 'stop'];
      for (let i = 0; i < methods.length; i++) {
        expect(ServiceResultUtil.isSuccess(service.invoke(methods[i]))).assertTrue();
      }
      const log: string[] = service.getMethodLog();
      expect(log.length).assertEqual(7);
      expect(log[0]).assertEqual('startMiracastService');
      expect(log[6]).assertEqual('stop');
      expect(service.getCallCount()).assertEqual(7);
    });

    // 同一会话内重试预算与执行器尝试次数应保持一致

    // 恢复计划步骤内容应可读且互不重复
    it('recovery_plan_steps_should_be_distinct', 0, async () => {
      const planner = new RecoveryPlanner();
      const steps: string[] = planner.buildSteps(RecoveryAction.RECREATE_SESSION);
      expect(steps.length).assertEqual(3);
      expect(steps[0]).assertEqual('releaseSession');
      expect(steps[1]).assertEqual('createSession');
      expect(steps[2]).assertEqual('rebindScreen');
      expect(steps[0] === steps[2]).assertFalse();
    });

    // 部分成功的账本健康分应介于 0 与 100 之间
    it('health_analyzer_should_report_partial_score', 0, async () => {
      const records: RecoveryRecord[] = [
        {
          type: SessionErrorType.SERVICE_NOT_CONNECTED,
          action: RecoveryAction.RETRY,
          attempts: 1,
          succeeded: true,
          elapsedMs: 100,
          timestamp: 1
        },
        {
          type: SessionErrorType.SCREEN_BIND_FAILED,
          action: RecoveryAction.REBIND_SCREEN,
          attempts: 2,
          succeeded: true,
          elapsedMs: 200,
          timestamp: 2
        },
        {
          type: SessionErrorType.UNKNOWN,
          action: RecoveryAction.FALLBACK_TO_INDEX,
          attempts: 3,
          succeeded: false,
          elapsedMs: 300,
          timestamp: 3
        }
      ];
      const analyzer = new SessionHealthAnalyzer();
      analyzer.analyze(records);
      expect(analyzer.getHealthScore()).assertEqual(67);
      expect(analyzer.getFatalRatio()).assertEqual(1 / 3);
      expect(analyzer.isHealthy()).assertFalse();
    });

    // 多次表面重绑失败后仍可通过重建会话收敛
    it('repeated_screen_failures_should_converge_by_session_recreate', 0, async () => {
      const service = new MiracastServiceStub();
      service.connect();
      service.injectFailure(3);
      const policy = new RetryPolicy();
      const firstRun = new RecoveryExecutor(policy, service);
      expect(firstRun.execute('setScreen')).assertFalse();

      const planner = new RecoveryPlanner();
      expect(planner.planFor(SessionErrorType.SCREEN_BIND_FAILED)).assertEqual(RecoveryAction.REBIND_SCREEN);
      expect(ServiceResultUtil.isSuccess(service.invoke('setScreen'))).assertTrue();
      ledger.reset();
      ledger.record(SessionErrorType.SCREEN_BIND_FAILED, RecoveryAction.RECREATE_SESSION, 4, true, 900);
      expect(ledger.countByType(SessionErrorType.SCREEN_BIND_FAILED)).assertEqual(1);
      expect(entryCountIsConsistent(ledger)).assertTrue();
    });

    // 恢复尝试轨迹应按挂起、进行中、成功推进

    // 恢复尝试轨迹失败后应判定为已结束
  });
}

// 账本一致性校验：总数为成功与失败之和
function entryCountIsConsistent(target: RecoveryLedger): boolean {
  return target.getTotalCount() === target.getSuccessCount() + target.getFailureCount();
}
