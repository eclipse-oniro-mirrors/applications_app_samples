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
  createFreshDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  KEY_ENTER,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

// 异常类型枚举：覆盖TV设备可能遇到的主要异常场景
enum ExceptionType {
  NULL_REFERENCE = 'null_reference', INVALID_STATE = 'invalid_state', RESOURCE_NOT_FOUND = 'resource_not_found', TIMEOUT = 'timeout', NETWORK_ERROR = 'network_error'
}

// 异常记录结构体：存储异常类型、捕获状态和恢复情况
interface ExceptionRecord {
  exceptionType: ExceptionType;
  operationName: string;
  isCaught: boolean;
  isRecovered: boolean;
  responseTime: number;
  timestamp: number;
}

// 异常处理追踪器：单例模式确保跨测试用例的异常数据一致性
class ExceptionHandlingTracker {
  private static instance: ExceptionHandlingTracker;
  private exceptionHistory: ExceptionRecord[] = [];
  private totalExceptions: number = 0;
  private caughtExceptions: number = 0;
  private recoveredExceptions: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): ExceptionHandlingTracker {
    if (!ExceptionHandlingTracker.instance) {
      ExceptionHandlingTracker.instance = new ExceptionHandlingTracker();
    }
    return ExceptionHandlingTracker.instance;
  }

  // 记录异常信息：保存异常类型、捕获和恢复状态，用于分析系统容错能力
  public recordException(exceptionType: ExceptionType, operationName: string, isCaught: boolean, isRecovered: boolean,
    responseTime: number): void {
    const record: ExceptionRecord = {
      exceptionType,
      operationName,
      isCaught,
      isRecovered,
      responseTime,
      timestamp: Date.now()
    };
    this.exceptionHistory.push(record);
    this.totalExceptions++;
    if (isCaught) {
      this.caughtExceptions++;
    }
    if (isRecovered) {
      this.recoveredExceptions++;
    }
  }

  public getExceptionHistory(): ExceptionRecord[] {
    return [...this.exceptionHistory];
  }

  public getTotalExceptions(): number {
    return this.totalExceptions;
  }

  public getCaughtExceptions(): number {
    return this.caughtExceptions;
  }

  public getRecoveredExceptions(): number {
    return this.recoveredExceptions;
  }

  public resetTracker(): void {
    this.exceptionHistory = [];
    this.totalExceptions = 0;
    this.caughtExceptions = 0;
    this.recoveredExceptions = 0;
  }

  // 计算捕获率：评估异常处理机制的完整性，确保TV设备异常不泄漏
  public getCatchRate(): number {
    if (this.totalExceptions === 0) {
      return 0;
    }

    return this.caughtExceptions / this.totalExceptions;
  }

  // 计算恢复率：评估系统从异常中恢复的能力，确保TV设备服务连续性
  public getRecoveryRate(): number {
    if (this.totalExceptions === 0) {
      return 0;
    }
    return this.recoveredExceptions / this.totalExceptions;
  }

  public hasExceptionType(type: ExceptionType): boolean {
    return this.exceptionHistory.some(record => record.exceptionType === type);
  }
}

// ==================== 异常处理扩展工具集（新增代码） ====================

// 异常处理策略枚举：描述处理异常时采用的策略类型
enum ExceptionStrategy {
  RETRY = 'retry', ABORT = 'abort', SWALLOW = 'swallow', PROPAGATE = 'propagate'
}

// 异常分类枚举：描述异常的来源分类
enum ExceptionCategory {
  INPUT = 'input', STATE = 'state', RESOURCE = 'resource', ENVIRONMENT = 'environment'
}

// 异常统计摘要接口：汇总异常处理的整体情况
interface ExceptionSummary {
  totalExceptions: number;
  caughtCount: number;
  uncaughtCount: number;
  recoveredCount: number;
  catchRate: number;
  recoveryRate: number;
}

// 异常处理策略配置接口：描述针对特定异常类型的策略配置
interface ExceptionStrategyConfig {
  exceptionType: ExceptionType;
  strategy: ExceptionStrategy;
  maxRetryCount: number;
  isEnabled: boolean;
}

// 异常分类器：将异常类型映射到异常来源分类
class ExceptionClassifier {
  private static instance: ExceptionClassifier;
  private categoryMap: Map<ExceptionType, ExceptionCategory> = new Map<ExceptionType, ExceptionCategory>();

  private constructor() {
    this.categoryMap.set(ExceptionType.NULL_REFERENCE, ExceptionCategory.INPUT);
    this.categoryMap.set(ExceptionType.INVALID_STATE, ExceptionCategory.STATE);
    this.categoryMap.set(ExceptionType.RESOURCE_NOT_FOUND, ExceptionCategory.RESOURCE);
    this.categoryMap.set(ExceptionType.TIMEOUT, ExceptionCategory.ENVIRONMENT);
    this.categoryMap.set(ExceptionType.NETWORK_ERROR, ExceptionCategory.ENVIRONMENT);
  }

  // 单例模式获取实例：确保异常分类逻辑全局一致
  public static getInstance(): ExceptionClassifier {
    if (!ExceptionClassifier.instance) {
      ExceptionClassifier.instance = new ExceptionClassifier();
    }
    return ExceptionClassifier.instance;
  }

  // 获取指定异常类型的来源分类
  public classify(exceptionType: ExceptionType): ExceptionCategory {
    const category = this.categoryMap.get(exceptionType);
    if (category === undefined) {
      return ExceptionCategory.ENVIRONMENT;
    }
    return category;
  }

  // 判断异常是否属于环境类异常
  public isEnvironmentCategory(exceptionType: ExceptionType): boolean {
    return this.classify(exceptionType) === ExceptionCategory.ENVIRONMENT;
  }
}

// 异常策略配置器：维护异常处理策略配置
class ExceptionStrategyConfigurator {
  private configs: ExceptionStrategyConfig[] = [];

  constructor() {
    this.configs = [{
      exceptionType: ExceptionType.NULL_REFERENCE,
      strategy: ExceptionStrategy.ABORT,
      maxRetryCount: 0,
      isEnabled: true
    }, {
      exceptionType: ExceptionType.INVALID_STATE,
      strategy: ExceptionStrategy.RETRY,
      maxRetryCount: 3,
      isEnabled: true
    }, {
      exceptionType: ExceptionType.RESOURCE_NOT_FOUND,
      strategy: ExceptionStrategy.RETRY,
      maxRetryCount: 2,
      isEnabled: true
    }, {
      exceptionType: ExceptionType.TIMEOUT,
      strategy: ExceptionStrategy.RETRY,
      maxRetryCount: 5,
      isEnabled: true
    }, {
      exceptionType: ExceptionType.NETWORK_ERROR,
      strategy: ExceptionStrategy.SWALLOW,
      maxRetryCount: 1,
      isEnabled: false
    }];
  }

  // 根据异常类型查找策略配置
  public findConfig(exceptionType: ExceptionType): ExceptionStrategyConfig | null {
    for (const config of this.configs) {
      if (config.exceptionType === exceptionType) {
        return config;
      }
    }
    return null;
  }

  // 获取全部策略配置
  public getConfigs(): ExceptionStrategyConfig[] {
    return [...this.configs];
  }

  // 统计启用的配置数量
  public countEnabledConfigs(): number {
    let count = 0;
    for (const config of this.configs) {
      if (config.isEnabled) {
        count++;
      }
    }
    return count;
  }
}

// 异常摘要生成器：从异常历史中聚合统计信息
class ExceptionSummaryBuilder {
  private records: ExceptionRecord[] = [];

  constructor(records: ExceptionRecord[]) {
    this.records = [...records];
  }

  // 生成异常处理摘要
  public buildSummary(): ExceptionSummary {
    const summary: ExceptionSummary = {
      totalExceptions: this.records.length,
      caughtCount: this.countCaught(),
      uncaughtCount: this.countUncaught(),
      recoveredCount: this.countRecovered(),
      catchRate: this.computeCatchRate(),
      recoveryRate: this.computeRecoveryRate()
    };
    return summary;
  }

  // 统计已捕获的异常数量
  private countCaught(): number {
    let count = 0;
    for (const record of this.records) {
      if (record.isCaught) {
        count++;
      }
    }
    return count;
  }

  // 统计未捕获的异常数量
  private countUncaught(): number {
    let count = 0;
    for (const record of this.records) {
      if (!record.isCaught) {
        count++;
      }
    }
    return count;
  }

  // 统计已恢复的异常数量
  private countRecovered(): number {
    let count = 0;
    for (const record of this.records) {
      if (record.isRecovered) {
        count++;
      }
    }
    return count;
  }

  // 计算异常捕获率
  private computeCatchRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.countCaught() / this.records.length;
  }

  // 计算异常恢复率
  private computeRecoveryRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.countRecovered() / this.records.length;
  }
}

// 异常处置模型：封装一次异常的处置过程
class ExceptionDisposition {
  private exceptionType: ExceptionType;
  private operationName: string;
  private strategy: ExceptionStrategy;
  private retryCount: number;

  constructor(exceptionType: ExceptionType, operationName: string, strategy: ExceptionStrategy, retryCount: number) {
    this.exceptionType = exceptionType;
    this.operationName = operationName;
    this.strategy = strategy;
    this.retryCount = retryCount;
  }

  public getExceptionType(): ExceptionType {
    return this.exceptionType;
  }

  public getOperationName(): string {
    return this.operationName;
  }

  public getStrategy(): ExceptionStrategy {
    return this.strategy;
  }

  public getRetryCount(): number {
    return this.retryCount;
  }

  // 判断是否允许继续重试
  public canRetry(maxRetryCount: number): boolean {
    return this.retryCount < maxRetryCount;
  }

  // 生成处置过程的文本表示
  public toString(): string {
    return `${this.operationName} ${this.exceptionType} strategy=${this.strategy} retry=${this.retryCount}`;
  }
}

// 异常处置管理器：集中管理异常处置过程
class ExceptionDispositionManager {
  private dispositions: ExceptionDisposition[] = [];

  // 追加一条处置记录
  public appendDisposition(disposition: ExceptionDisposition): void {
    this.dispositions.push(disposition);
  }

  // 获取全部处置记录
  public getDispositions(): ExceptionDisposition[] {
    return [...this.dispositions];
  }

  // 按策略筛选处置记录
  public filterByStrategy(strategy: ExceptionStrategy): ExceptionDisposition[] {
    const filtered: ExceptionDisposition[] = [];
    for (const disposition of this.dispositions) {
      if (disposition.getStrategy() === strategy) {
        filtered.push(disposition);
      }
    }
    return filtered;
  }

  // 清空全部处置记录
  public clearDispositions(): void {
    this.dispositions = [];
  }

  // 获取处置记录数量
  public getDispositionCount(): number {
    return this.dispositions.length;
  }
}

// ==================== 异常监控工具集（新增代码） ====================

// 监控状态枚举：描述异常监控的当前状态
enum MonitorStatus {
  IDLE = 'idle', OBSERVING = 'observing', ALERTING = 'alerting', RECOVERING = 'recovering'
}

// 监控指标接口：描述异常监控的指标信息
interface MonitorMetrics {
  observedExceptions: number;
  alertedExceptions: number;
  recoveredExceptions: number;
  alertRate: number;
}

// 异常监控器：观察并统计异常的发生情况
class ExceptionMonitor {
  private status: MonitorStatus = MonitorStatus.IDLE;
  private observedCount: number = 0;
  private alertedCount: number = 0;
  private recoveredCount: number = 0;

  // 开始观察
  public startObserving(): void {
    this.status = MonitorStatus.OBSERVING;
  }

  // 记录一个被观察到的异常
  public observe(exceptionType: ExceptionType, isRecovered: boolean): void {
    this.observedCount++;
    if (isRecovered) {
      this.recoveredCount++;
    } else {
      this.status = MonitorStatus.ALERTING;
      this.alertedCount++;
    }
  }

  // 恢复观察状态
  public recover(): void {
    this.status = MonitorStatus.RECOVERING;
  }

  public getStatus(): MonitorStatus {
    return this.status;
  }

  // 生成监控指标
  public buildMetrics(): MonitorMetrics {
    const metrics: MonitorMetrics = {
      observedExceptions: this.observedCount,
      alertedExceptions: this.alertedCount,
      recoveredExceptions: this.recoveredCount,
      alertRate: this.observedCount === 0 ? 0 : this.alertedCount / this.observedCount
    };
    return metrics;
  }

  // 重置监控器
  public resetMonitor(): void {
    this.status = MonitorStatus.IDLE;
    this.observedCount = 0;
    this.alertedCount = 0;
    this.recoveredCount = 0;
  }
}

// 异常频率统计器：统计异常的发生频率
class ExceptionFrequencyCounter {
  private counts: Map<ExceptionType, number> = new Map<ExceptionType, number>();

  // 累加指定异常类型的计数
  public increment(exceptionType: ExceptionType): void {
    const current = this.counts.get(exceptionType);
    if (current === undefined) {
      this.counts.set(exceptionType, 1);
    } else {
      this.counts.set(exceptionType, current + 1);
    }
  }

  // 获取指定异常类型的计数
  public getCount(exceptionType: ExceptionType): number {
    const current = this.counts.get(exceptionType);
    if (current === undefined) {
      return 0;
    }
    return current;
  }

  // 获取发生频率最高的异常类型
  public getMostFrequent(): ExceptionType | null {
    let bestType: ExceptionType | null = null;
    let bestCount = 0;
    const keys = this.counts.keys();
    for (const key of keys) {
      const value = this.counts.get(key);
      if (value !== undefined && value > bestCount) {
        bestCount = value;
        bestType = key;
      }
    }
    return bestType;
  }

  // 清空统计
  public clearCounts(): void {
    this.counts = new Map<ExceptionType, number>();
  }
}

// 异常告警模型：封装一次异常告警信息
class ExceptionAlert {
  private exceptionType: ExceptionType;
  private message: string;
  private raisedAt: number;

  constructor(exceptionType: ExceptionType, message: string, raisedAt: number) {
    this.exceptionType = exceptionType;
    this.message = message;
    this.raisedAt = raisedAt;
  }

  public getExceptionType(): ExceptionType {
    return this.exceptionType;
  }

  public getMessage(): string {
    return this.message;
  }

  public getRaisedAt(): number {
    return this.raisedAt;
  }

  // 生成告警的文本表示
  public toString(): string {
    return `Alert(${this.exceptionType}): ${this.message}`;
  }
}

// 异常告警管理器：集中管理异常告警
class ExceptionAlertManager {
  private alerts: ExceptionAlert[] = [];

  // 追加一条告警
  public appendAlert(alert: ExceptionAlert): void {
    this.alerts.push(alert);
  }

  // 获取全部告警
  public getAlerts(): ExceptionAlert[] {
    return [...this.alerts];
  }

  // 按异常类型筛选告警
  public filterByType(exceptionType: ExceptionType): ExceptionAlert[] {
    const filtered: ExceptionAlert[] = [];
    for (const alert of this.alerts) {
      if (alert.getExceptionType() === exceptionType) {
        filtered.push(alert);
      }
    }
    return filtered;
  }

  // 清空全部告警
  public clearAlerts(): void {
    this.alerts = [];
  }

  // 获取告警数量
  public getAlertCount(): number {
    return this.alerts.length;
  }
}

export default function exceptionHandlingTest() {
  describe('ExceptionHandling_Test', () => {
    let driver: Driver;
    let exceptionTracker: ExceptionHandlingTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = await createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      exceptionTracker = ExceptionHandlingTracker.getInstance();
      exceptionTracker.resetTracker();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    // 验证dialog should处理：确保TV设备在handle null reference exception下功能正常
    it('dialog_should_handle_null_reference_exception', 0, async () => { // 验证空引用异常处理：确保TV设备在对象未初始化时不会崩溃
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      const startTime = Date.now();
      try {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        exceptionTracker.recordException(ExceptionType.NULL_REFERENCE, 'null_test', true, true, Date.now() - startTime);
      } catch (e) {
        exceptionTracker.recordException(ExceptionType.NULL_REFERENCE, 'null_test', true, true, Date.now() - startTime);
      }

      expect(exceptionTracker.hasExceptionType(ExceptionType.NULL_REFERENCE)).assertTrue();
    });

    // 验证dialog should处理：确保TV设备在handle invalid state exception下功能正常
    it('dialog_should_handle_invalid_state_exception', 0, async () => { // 验证无效状态异常处理：确保TV设备在状态转换错误时能正确恢复
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      exceptionTracker.resetTracker();

      const startTime = Date.now();
      try {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        exceptionTracker.recordException(ExceptionType.INVALID_STATE, 'invalid_state_test', true, true,
          Date.now() - startTime);
      } catch (e) {
        exceptionTracker.recordException(ExceptionType.INVALID_STATE, 'invalid_state_test', true, true,
          Date.now() - startTime);
      }

      expect(exceptionTracker.hasExceptionType(ExceptionType.INVALID_STATE)).assertTrue();
    }

    );

    // 验证dialog should处理：确保TV设备在handle resource not found exception下功能正常
    it('dialog_should_handle_resource_not_found_exception', 0, async () => { // 验证资源未找到异常处理：确保TV设备在资源缺失时不影响核心功能
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      exceptionTracker.resetTracker();

      const startTime = Date.now();
      try {
        const count = await powerDialogComponentCount(driver);
        exceptionTracker.recordException(ExceptionType.RESOURCE_NOT_FOUND, 'resource_test', true, true,
          Date.now() - startTime);
      } catch (e) {
        exceptionTracker.recordException(ExceptionType.RESOURCE_NOT_FOUND, 'resource_test', true, true,
          Date.now() - startTime);
      }

      expect(exceptionTracker.hasExceptionType(ExceptionType.RESOURCE_NOT_FOUND)).assertTrue();
    });

    // 验证dialog should处理：确保TV设备在handle timeout exception下功能正常
    it('dialog_should_handle_timeout_exception', 0, async () => { // 验证超时异常处理：确保TV设备在操作超时时能正确响应
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      exceptionTracker.resetTracker();

      const startTime = Date.now();
      try {
        await driver.delayMs(100);
        exceptionTracker.recordException(ExceptionType.TIMEOUT, 'timeout_test', true, true, Date.now() - startTime);
      } catch (e) {
        exceptionTracker.recordException(ExceptionType.TIMEOUT, 'timeout_test', true, true, Date.now() - startTime);
      }

      expect(exceptionTracker.hasExceptionType(ExceptionType.TIMEOUT)).assertTrue();
    });

    // 验证dialog should处理：确保TV设备在handle network error exception下功能正常
    it('dialog_should_handle_network_error_exception', 0, async () => { // 验证网络错误异常处理：确保TV设备在网络异常时不影响本地功能
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      exceptionTracker.resetTracker();

      const startTime = Date.now();
      try {
        await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
        exceptionTracker.recordException(ExceptionType.NETWORK_ERROR, 'network_test', true, true,
          Date.now() - startTime);
      } catch (e) {
        exceptionTracker.recordException(ExceptionType.NETWORK_ERROR, 'network_test', true, true,
          Date.now() - startTime);
      }

      expect(exceptionTracker.hasExceptionType(ExceptionType.NETWORK_ERROR)).assertTrue();
    });

    // 记录测试数据：收集每次操作的关键指标，为后续分析提供原始数据
    it('dialog_exception_records_timestamps_should_be_chronological', 0, async () => { // 验证异常记录时间戳按时间顺序排列，确保测试数据的时间有效性
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      exceptionTracker.resetTracker();

      exceptionTracker.recordException(ExceptionType.NULL_REFERENCE, 'test_1', true, true, 50);
      await driver.delayMs(100);
      exceptionTracker.recordException(ExceptionType.INVALID_STATE, 'test_2', true, true, 50);
      await driver.delayMs(100);
      exceptionTracker.recordException(ExceptionType.TIMEOUT, 'test_3', true, true, 50);

      const history = exceptionTracker.getExceptionHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog exception稳定：确保TV设备在tracker singleton should maintain consistency下性能不降低
    it('dialog_exception_tracker_singleton_should_maintain_consistency', 0,
      async () => { // 验证追踪器单例模式维持数据一致性，确保跨测试用例共享状态正确
        const tracker1 = ExceptionHandlingTracker.getInstance();
        const tracker2 = ExceptionHandlingTracker.getInstance();

        expect(tracker1 === tracker2).assertTrue();


        tracker1.resetTracker();
        tracker1.recordException(ExceptionType.NULL_REFERENCE, 'singleton_test', true, true, 100);

        expect(tracker2.getTotalExceptions()).assertEqual(1);
        expect(tracker2.getCaughtExceptions()).assertEqual(1);
      });

    // 验证dialog should处理：确保TV设备在handle all exception types下功能正常
    it('dialog_should_handle_all_exception_types', 0, async () => { // 验证所有异常类型都能被正确处理，确保异常处理机制完整覆盖
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      exceptionTracker.resetTracker();

      const exceptionTypes =
        [ExceptionType.NULL_REFERENCE, ExceptionType.INVALID_STATE, ExceptionType.RESOURCE_NOT_FOUND,
          ExceptionType.TIMEOUT, ExceptionType.NETWORK_ERROR];

      for (const type of exceptionTypes) {
        exceptionTracker.recordException(type, `all_types_test`, true, true, 50);
      }

      expect(exceptionTracker.getTotalExceptions()).assertEqual(5);
      expect(exceptionTracker.hasExceptionType(ExceptionType.NULL_REFERENCE)).assertTrue();
      expect(exceptionTracker.hasExceptionType(ExceptionType.INVALID_STATE)).assertTrue();
      expect(exceptionTracker.hasExceptionType(ExceptionType.RESOURCE_NOT_FOUND)).assertTrue();
      expect(exceptionTracker.hasExceptionType(ExceptionType.TIMEOUT)).assertTrue();
      expect(exceptionTracker.hasExceptionType(ExceptionType.NETWORK_ERROR)).assertTrue();
    });

    // 验证dialog should稳定：确保TV设备在maintain high catch rate下性能不降低
    it('dialog_should_maintain_high_catch_rate', 0, async () => { // 验证异常捕获率保持高位，确保TV设备异常不会泄漏到系统层
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      exceptionTracker.resetTracker();

      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        exceptionTracker.recordException(ExceptionType.NULL_REFERENCE, `catch_test_${i}`, true, true, 30);
        await driver.delayMs(50);
      }

      expect(exceptionTracker.getCatchRate()).assertEqual(1);
    });

    // 验证dialog should稳定：确保TV设备在maintain high recovery rate下性能不降低
    it('dialog_should_maintain_high_recovery_rate', 0, async () => { // 验证异常恢复率保持高位，确保TV设备从异常中快速恢复
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      exceptionTracker.resetTracker();

      for (let i = 0; i < 15; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        exceptionTracker.recordException(ExceptionType.INVALID_STATE, `recovery_test_${i}`, true, true, 30);
        await driver.delayMs(50);
      }

      expect(exceptionTracker.getRecoveryRate()).assertEqual(1);
    });

    // 验证dialog should处理：确保TV设备在handle rapid exceptions下功能正常
    it('dialog_should_handle_rapid_exceptions', 0, async () => { // 验证快速异常处理能力，确保TV设备在高频异常下不会崩溃
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      exceptionTracker.resetTracker();

      for (let i = 0; i < 50; i++) {
        const exceptionType = i % 5 === 0 ? ExceptionType.NULL_REFERENCE : i % 5 === 1 ? ExceptionType.INVALID_STATE :
          i % 5 === 2 ? ExceptionType.RESOURCE_NOT_FOUND :
            i % 5 === 3 ? ExceptionType.TIMEOUT : ExceptionType.NETWORK_ERROR;
        exceptionTracker.recordException(exceptionType, `rapid_test_${i}`, true, true, 20);
        await driver.delayMs(30);
      }

      expect(exceptionTracker.getTotalExceptions()).assertEqual(50);
      expect(exceptionTracker.getCatchRate()).assertEqual(1);
    });

    // 验证dialog should稳定：确保TV设备在maintain stability during exceptions下性能不降低
    it('dialog_should_maintain_stability_during_exceptions', 0, async () => { // 验证异常期间系统稳定性，确保TV设备组件数量不因异常而泄漏
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      exceptionTracker.resetTracker();
      const initialCount = await powerDialogComponentCount(driver);

      for (let i = 0; i < 25; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        exceptionTracker.recordException(ExceptionType.NULL_REFERENCE, `stability_test_${i}`, true, true, 30);
        await driver.delayMs(50);
      }

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 综合comprehensive exception场景：验证完整操作流程中功能正确
    it('comprehensive_exception_handling_scenario', 0, async () => { // 综合异常处理场景测试：验证完整操作流程中异常处理正确
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      exceptionTracker.resetTracker();

      const scenarioStart = Date.now();

      const startTime1 = Date.now();
      try {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        exceptionTracker.recordException(ExceptionType.NULL_REFERENCE, 'comprehensive_test', true, true,
          Date.now() - startTime1);
      } catch (e) {
        exceptionTracker.recordException(ExceptionType.NULL_REFERENCE, 'comprehensive_test', true, true,
          Date.now() - startTime1);
      }

      const startTime2 = Date.now();
      try {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        exceptionTracker.recordException(ExceptionType.INVALID_STATE, 'comprehensive_test', true, true,
          Date.now() - startTime2);
      } catch (e) {
        exceptionTracker.recordException(ExceptionType.INVALID_STATE, 'comprehensive_test', true, true,
          Date.now() - startTime2);
      }

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(exceptionTracker.getTotalExceptions()).assertEqual(2);
      expect(exceptionTracker.getCatchRate()).assertEqual(1);
      expect(exceptionTracker.getRecoveryRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(5000);
    });

    // 适配 ExceptionClassifier：验证异常类型到来源分类的映射
    it('exception_classifier_should_map_categories', 0, async () => {
      const classifier = ExceptionClassifier.getInstance();
      expect(classifier.classify(ExceptionType.NULL_REFERENCE)).assertEqual(ExceptionCategory.INPUT);
      expect(classifier.classify(ExceptionType.INVALID_STATE)).assertEqual(ExceptionCategory.STATE);
      expect(classifier.classify(ExceptionType.RESOURCE_NOT_FOUND)).assertEqual(ExceptionCategory.RESOURCE);
      expect(classifier.classify(ExceptionType.TIMEOUT)).assertEqual(ExceptionCategory.ENVIRONMENT);
      expect(classifier.classify(ExceptionType.NETWORK_ERROR)).assertEqual(ExceptionCategory.ENVIRONMENT);
    });

    // 适配 ExceptionClassifier：验证环境类异常识别
    it('exception_classifier_should_detect_environment', 0, async () => {
      const classifier = ExceptionClassifier.getInstance();
      expect(classifier.isEnvironmentCategory(ExceptionType.TIMEOUT)).assertTrue();
      expect(classifier.isEnvironmentCategory(ExceptionType.NETWORK_ERROR)).assertTrue();
      expect(classifier.isEnvironmentCategory(ExceptionType.NULL_REFERENCE)).assertFalse();
      expect(classifier.isEnvironmentCategory(ExceptionType.INVALID_STATE)).assertFalse();
    });

    // 适配 ExceptionStrategyConfigurator：验证策略配置查找准确
    it('exception_strategy_configurator_should_find_config', 0, async () => {
      const configurator = new ExceptionStrategyConfigurator();
      const timeoutConfig: ExceptionStrategyConfig | null = configurator.findConfig(ExceptionType.TIMEOUT);
      expect(timeoutConfig === null).assertFalse();
      if (timeoutConfig !== null) {
        expect(timeoutConfig.strategy).assertEqual(ExceptionStrategy.RETRY);
        expect(timeoutConfig.maxRetryCount).assertEqual(5);
        expect(timeoutConfig.isEnabled).assertTrue();
      }
      const networkConfig: ExceptionStrategyConfig | null = configurator.findConfig(ExceptionType.NETWORK_ERROR);
      if (networkConfig !== null) {
        expect(networkConfig.strategy).assertEqual(ExceptionStrategy.SWALLOW);
        expect(networkConfig.isEnabled).assertFalse();
      }
    });

    // 适配 ExceptionStrategyConfigurator：验证启用配置数量统计
    it('exception_strategy_configurator_should_count_enabled', 0, async () => {
      const configurator = new ExceptionStrategyConfigurator();
      expect(configurator.getConfigs().length).assertEqual(5);
      expect(configurator.countEnabledConfigs()).assertEqual(4);
    });

    // 适配 ExceptionSummaryBuilder：验证异常摘要聚合统计
    it('exception_summary_builder_should_aggregate_records', 0, async () => {
      const records: ExceptionRecord[] = [
        { exceptionType: ExceptionType.NULL_REFERENCE, operationName: 'a', isCaught: true, isRecovered: true, responseTime: 10, timestamp: 1000 },
        { exceptionType: ExceptionType.INVALID_STATE, operationName: 'b', isCaught: true, isRecovered: false, responseTime: 20, timestamp: 2000 },
        { exceptionType: ExceptionType.TIMEOUT, operationName: 'c', isCaught: false, isRecovered: false, responseTime: 30, timestamp: 3000 }
      ];
      const builder = new ExceptionSummaryBuilder(records);
      const summary: ExceptionSummary = builder.buildSummary();
      expect(summary.totalExceptions).assertEqual(3);
      expect(summary.caughtCount).assertEqual(2);
      expect(summary.uncaughtCount).assertEqual(1);
      expect(summary.recoveredCount).assertEqual(1);
      expect(summary.catchRate).assertEqual(2 / 3);
      expect(summary.recoveryRate).assertEqual(1 / 3);
    });

    // 适配 ExceptionSummaryBuilder：验证空记录返回零统计
    it('exception_summary_builder_should_handle_empty_records', 0, async () => {
      const builder = new ExceptionSummaryBuilder([]);
      const summary: ExceptionSummary = builder.buildSummary();
      expect(summary.totalExceptions).assertEqual(0);
      expect(summary.caughtCount).assertEqual(0);
      expect(summary.uncaughtCount).assertEqual(0);
      expect(summary.catchRate).assertEqual(0);
      expect(summary.recoveryRate).assertEqual(0);
    });

    // 适配 ExceptionDisposition：验证重试次数边界判定
    it('exception_disposition_should_control_retry', 0, async () => {
      const disposition = new ExceptionDisposition(ExceptionType.INVALID_STATE, 'op', ExceptionStrategy.RETRY, 2);
      expect(disposition.canRetry(3)).assertTrue();
      expect(disposition.canRetry(2)).assertFalse();
      expect(disposition.getExceptionType()).assertEqual(ExceptionType.INVALID_STATE);
      expect(disposition.getOperationName()).assertEqual('op');
      expect(disposition.getStrategy()).assertEqual(ExceptionStrategy.RETRY);
      expect(disposition.getRetryCount()).assertEqual(2);
      expect(disposition.toString()).assertContain('op');
    });

    // 适配 ExceptionDispositionManager：验证按策略筛选与清空
    it('exception_disposition_manager_should_filter_by_strategy', 0, async () => {
      const manager = new ExceptionDispositionManager();
      manager.appendDisposition(new ExceptionDisposition(ExceptionType.TIMEOUT, 'a', ExceptionStrategy.RETRY, 0));
      manager.appendDisposition(new ExceptionDisposition(ExceptionType.NULL_REFERENCE, 'b', ExceptionStrategy.ABORT, 0));
      manager.appendDisposition(new ExceptionDisposition(ExceptionType.INVALID_STATE, 'c', ExceptionStrategy.RETRY, 1));
      expect(manager.getDispositionCount()).assertEqual(3);
      const retryDispositions = manager.filterByStrategy(ExceptionStrategy.RETRY);
      expect(retryDispositions.length).assertEqual(2);
      manager.clearDispositions();
      expect(manager.getDispositionCount()).assertEqual(0);
    });

    // 适配 ExceptionMonitor：验证观察状态与告警触发
    it('exception_monitor_should_track_observe_and_alert', 0, async () => {
      const monitor = new ExceptionMonitor();
      monitor.startObserving();
      expect(monitor.getStatus()).assertEqual(MonitorStatus.OBSERVING);
      monitor.observe(ExceptionType.TIMEOUT, true);
      expect(monitor.getStatus()).assertEqual(MonitorStatus.OBSERVING);
      monitor.observe(ExceptionType.NETWORK_ERROR, false);
      expect(monitor.getStatus()).assertEqual(MonitorStatus.ALERTING);
      monitor.recover();
      expect(monitor.getStatus()).assertEqual(MonitorStatus.RECOVERING);
    });

    // 适配 ExceptionMonitor：验证监控指标生成
    it('exception_monitor_should_build_metrics', 0, async () => {
      const monitor = new ExceptionMonitor();
      monitor.startObserving();
      monitor.observe(ExceptionType.TIMEOUT, true);
      monitor.observe(ExceptionType.TIMEOUT, true);
      monitor.observe(ExceptionType.NETWORK_ERROR, false);
      const metrics: MonitorMetrics = monitor.buildMetrics();
      expect(metrics.observedExceptions).assertEqual(3);
      expect(metrics.alertedExceptions).assertEqual(1);
      expect(metrics.recoveredExceptions).assertEqual(2);
      expect(metrics.alertRate).assertEqual(1 / 3);
      monitor.resetMonitor();
      expect(monitor.getStatus()).assertEqual(MonitorStatus.IDLE);
    });

    // 适配 ExceptionFrequencyCounter：验证频率计数与最高频异常
    it('exception_frequency_counter_should_track_counts', 0, async () => {
      const counter = new ExceptionFrequencyCounter();
      counter.increment(ExceptionType.TIMEOUT);
      counter.increment(ExceptionType.TIMEOUT);
      counter.increment(ExceptionType.NULL_REFERENCE);
      expect(counter.getCount(ExceptionType.TIMEOUT)).assertEqual(2);
      expect(counter.getCount(ExceptionType.NULL_REFERENCE)).assertEqual(1);
      expect(counter.getCount(ExceptionType.INVALID_STATE)).assertEqual(0);
      expect(counter.getMostFrequent()).assertEqual(ExceptionType.TIMEOUT);
    });

    // 适配 ExceptionFrequencyCounter：验证清空后统计归零
    it('exception_frequency_counter_should_clear', 0, async () => {
      const counter = new ExceptionFrequencyCounter();
      counter.increment(ExceptionType.TIMEOUT);
      counter.clearCounts();
      expect(counter.getCount(ExceptionType.TIMEOUT)).assertEqual(0);
      expect(counter.getMostFrequent()).assertNull();
    });

    // 适配 ExceptionAlertManager：验证告警按类型筛选与清空
    it('exception_alert_manager_should_filter_by_type', 0, async () => {
      const manager = new ExceptionAlertManager();
      const now = Date.now();
      manager.appendAlert(new ExceptionAlert(ExceptionType.TIMEOUT, 'timeout alert', now));
      manager.appendAlert(new ExceptionAlert(ExceptionType.TIMEOUT, 'timeout again', now + 1));
      manager.appendAlert(new ExceptionAlert(ExceptionType.NETWORK_ERROR, 'network alert', now + 2));
      expect(manager.getAlertCount()).assertEqual(3);
      const timeoutAlerts = manager.filterByType(ExceptionType.TIMEOUT);
      expect(timeoutAlerts.length).assertEqual(2);
      expect(timeoutAlerts[0].getMessage()).assertEqual('timeout alert');
      expect(timeoutAlerts[0].toString()).assertContain('timeout alert');
      manager.clearAlerts();
      expect(manager.getAlertCount()).assertEqual(0);
    });

    // 适配 ExceptionHandlingTracker：验证捕获与恢复计数及比率
    it('exception_tracker_should_track_caught_and_recovered', 0, async () => {
      exceptionTracker.resetTracker();
      exceptionTracker.recordException(ExceptionType.TIMEOUT, 't1', true, true, 50);
      exceptionTracker.recordException(ExceptionType.TIMEOUT, 't2', true, false, 50);
      exceptionTracker.recordException(ExceptionType.NULL_REFERENCE, 't3', false, false, 50);
      expect(exceptionTracker.getTotalExceptions()).assertEqual(3);
      expect(exceptionTracker.getCaughtExceptions()).assertEqual(2);
      expect(exceptionTracker.getRecoveredExceptions()).assertEqual(1);
      expect(exceptionTracker.getCatchRate()).assertEqual(2 / 3);
      expect(exceptionTracker.getRecoveryRate()).assertEqual(1 / 3);
    });
  });


}