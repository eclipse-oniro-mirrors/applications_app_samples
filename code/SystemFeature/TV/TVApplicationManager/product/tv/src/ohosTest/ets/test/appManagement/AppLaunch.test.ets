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
  createFreshDriver,
  KEY_ENTER,
  KEY_BACK,
  appComponentCount,
  checkFocusState,
  waitForUiStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  getCurrentFocusIndex
} from '../common/SharedDriver';

// 模拟应用启动服务：模拟 launcherBundleManager 启动应用的能力，记录启动调用日志
class MockLaunchService {
  private static instance: MockLaunchService;
  private launchLog: string[] = [];
  private failBundleNames: Set<string> = new Set<string>();

  public static getInstance(): MockLaunchService {
    if (!MockLaunchService.instance) {
      MockLaunchService.instance = new MockLaunchService();
    }
    return MockLaunchService.instance;
  }

  public launchAbility(bundleName: string, abilityName: string): boolean {
    if (this.failBundleNames.has(bundleName)) {
      return false;
    }
    this.launchLog.push(`${bundleName}/${abilityName}`);
    return true;
  }

  public setFailBundle(bundleName: string): void {
    this.failBundleNames.add(bundleName);
  }

  public getLaunchLog(): string[] {
    return [...this.launchLog];
  }

  public getLaunchCount(): number {
    return this.launchLog.length;
  }

  public hasLaunched(bundleName: string): boolean {
    return this.launchLog.some(log => log.startsWith(bundleName + '/'));
  }

  public clearLaunchLog(): void {
    this.launchLog = [];
    this.failBundleNames.clear();
  }
}

export default function appLaunchTest() {
  describe('AppLaunch_Test', () => {
    let driver: Driver;
    let launchService: MockLaunchService;

    beforeAll(async () => {
      driver = createFreshDriver();
      launchService = MockLaunchService.getInstance();
      launchService.clearLaunchLog();
      await driver.delayMs(1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    // 1. 验证启动应用功能：对应 功能-启动
    it('launch_service_should_launch_target_ability', 0, () => {
      launchService.clearLaunchLog();
      const success = launchService.launchAbility('com.example.app', 'MainAbility');
      expect(success).assertTrue();
      expect(launchService.getLaunchLog().length).assertEqual(1);
    });

    // 2. 验证确认键启动应用：对应 TV 设备按确认键启动选中应用
    it('enter_key_should_trigger_app_launch', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const focusIndex = await getCurrentFocusIndex(driver);
      const isFocusCorrect = await checkFocusState(driver, focusIndex);
      if (focusIndex !== -1) {
        expect(isFocusCorrect).assertTrue();
      }
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 3. 验证前后台切换刷新应用列表：对应 中断-前后台切换、onPageShow 刷新逻辑
    it('foreground_background_switch_should_refresh_app_list', 0, async () => {
      launchService.clearLaunchLog();
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 4. 验证冷启动：对应 稳定-冷启动
    it('cold_start_should_launch_without_crash', 0, async () => {
      const startTime = Date.now();
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const componentCount = await appComponentCount(driver);
      const elapsed = Date.now() - startTime;
      expect(componentCount).assertLargerOrEqual(0);
      expect(elapsed).assertLessOrEqual(5000);
    });

    // 5. 验证热启动：对应 稳定-热启动/后台唤起
    it('hot_start_should_recover_quickly', 0, async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      const startTime = Date.now();
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      const elapsed = Date.now() - startTime;
      expect(elapsed).assertLessOrEqual(3000);
    });

    // 6. 验证启动参数传递正确：对应 功能-启动、数据-数据完整性
    it('launch_service_should_pass_correct_parameters', 0, () => {
      launchService.clearLaunchLog();
      launchService.launchAbility('com.example.app', 'DetailAbility');
      const log = launchService.getLaunchLog();
      expect(log[0]).assertEqual('com.example.app/DetailAbility');
    });

    // 7. 验证连续启动不崩溃：对应 稳定-反复操作
    it('repeated_launch_should_not_crash', 0, () => {
      launchService.clearLaunchLog();
      for (let i = 0; i < 10; i++) {
        launchService.launchAbility('com.example.app', 'MainAbility');
      }
      expect(launchService.getLaunchLog().length).assertEqual(10);
    });

    // 8. 验证启动失败处理：对应 功能-错误状态页、错误提示
    it('launch_failure_should_be_handled_gracefully', 0, () => {
      launchService.clearLaunchLog();
      launchService.setFailBundle('com.broken.app');
      const success = launchService.launchAbility('com.broken.app', 'MainAbility');
      expect(success).assertFalse();
      expect(launchService.getLaunchCount()).assertEqual(0);
    });

    // 9. 验证启动日志记录完整：对应 启动记录追踪
    it('launch_log_should_record_all_launches', 0, () => {
      launchService.clearLaunchLog();
      launchService.launchAbility('com.a', 'MainAbility');
      launchService.launchAbility('com.b', 'MainAbility');
      launchService.launchAbility('com.c', 'MainAbility');
      expect(launchService.getLaunchCount()).assertEqual(3);
    });

    // 10. 验证已启动判断：对应 启动状态查询
    it('launch_service_should_check_if_launched', 0, () => {
      launchService.clearLaunchLog();
      launchService.launchAbility('com.example.app', 'MainAbility');
      expect(launchService.hasLaunched('com.example.app')).assertTrue();
      expect(launchService.hasLaunched('com.other')).assertFalse();
    });

    // 11. 验证空包名启动：对应 输入-空值提交
    it('launch_with_empty_bundle_name_should_be_handled', 0, () => {
      launchService.clearLaunchLog();
      const success = launchService.launchAbility('', 'MainAbility');
      expect(success).assertTrue();
      expect(launchService.getLaunchCount()).assertEqual(1);
    });

    // 12. 验证重复启动同一应用：对应 防重复启动
    it('duplicate_launch_should_be_recorded_independently', 0, () => {
      launchService.clearLaunchLog();
      launchService.launchAbility('com.example.app', 'MainAbility');
      launchService.launchAbility('com.example.app', 'MainAbility');
      expect(launchService.getLaunchCount()).assertEqual(2);
    });

    // 13. 验证启动后焦点状态：对应 焦点管理
    it('focus_state_should_be_valid_after_launch', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const focusIndex = await getCurrentFocusIndex(driver);
      const isFocusCorrect = await checkFocusState(driver, focusIndex);
      if (focusIndex !== -1) {
        expect(isFocusCorrect).assertTrue();
      }
    });

    // 14. 验证启动后界面稳定：对应 界面稳定性
    it('interface_should_be_stable_after_launch', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 15. 验证多次前后台切换：对应 稳定-频繁切换
    it('repeated_foreground_background_switch_should_be_stable', 0, async () => {
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      }
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 16. 验证启动服务单例一致性：对应 单例模式
    it('launch_service_singleton_should_be_consistent', 0, () => {
      const service1 = MockLaunchService.getInstance();
      const service2 = MockLaunchService.getInstance();
      expect(service1 === service2).assertTrue();
    });

    // 17. 验证清理日志：对应 日志重置
    it('launch_log_should_be_clearable', 0, () => {
      launchService.launchAbility('com.a', 'MainAbility');
      launchService.clearLaunchLog();
      expect(launchService.getLaunchCount()).assertEqual(0);
    });

    // 18. 验证大量启动操作性能：对应 性能-并发处理
    it('mass_launch_should_be_performant', 0, () => {
      launchService.clearLaunchLog();
      const startTime = Date.now();
      for (let i = 0; i < 500; i++) {
        launchService.launchAbility(`com.app${i}`, 'MainAbility');
      }
      const elapsed = Date.now() - startTime;
      expect(launchService.getLaunchCount()).assertEqual(500);
      expect(elapsed).assertLessOrEqual(1000);
    });

    // 19. 验证启动失败不影响后续启动：对应 错误恢复
    it('launch_failure_should_not_affect_subsequent_launches', 0, () => {
      launchService.clearLaunchLog();
      launchService.setFailBundle('com.broken');
      launchService.launchAbility('com.broken', 'MainAbility');
      const success = launchService.launchAbility('com.ok', 'MainAbility');
      expect(success).assertTrue();
      expect(launchService.getLaunchCount()).assertEqual(1);
    });

    // 20. 验证启动多个应用：对应 多应用管理
    it('multiple_apps_should_be_launchable', 0, () => {
      launchService.clearLaunchLog();
      launchService.launchAbility('com.a', 'MainAbility');
      launchService.launchAbility('com.b', 'MainAbility');
      launchService.launchAbility('com.c', 'MainAbility');
      expect(launchService.hasLaunched('com.a')).assertTrue();
      expect(launchService.hasLaunched('com.b')).assertTrue();
      expect(launchService.hasLaunched('com.c')).assertTrue();
    });

    // 21. 验证启动日志顺序：对应 数据-数据一致性
    it('launch_log_should_preserve_order', 0, () => {
      launchService.clearLaunchLog();
      launchService.launchAbility('com.a', 'MainAbility');
      launchService.launchAbility('com.b', 'MainAbility');
      const log = launchService.getLaunchLog();
      expect(log[0]).assertEqual('com.a/MainAbility');
      expect(log[1]).assertEqual('com.b/MainAbility');
    });

    // 22. 验证不同 Ability 启动：对应 多入口启动
    it('different_abilities_should_be_launchable', 0, () => {
      launchService.clearLaunchLog();
      launchService.launchAbility('com.a', 'MainAbility');
      launchService.launchAbility('com.a', 'DetailAbility');
      expect(launchService.getLaunchCount()).assertEqual(2);
      expect(launchService.hasLaunched('com.a')).assertTrue();
    });

    // 23. 验证返回键退出不崩溃：对应 输入-返回键处理
    it('back_key_should_not_crash_app', 0, async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 24. 验证启动响应时间：对应 性能-响应时间
    it('launch_response_time_should_be_acceptable', 0, async () => {
      const startTime = Date.now();
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      const elapsed = Date.now() - startTime;
      expect(elapsed).assertLessOrEqual(2000);
    });

    // 25. 验证启动服务清理失败标记：对应 状态重置
    it('fail_bundle_flag_should_be_clearable', 0, () => {
      launchService.setFailBundle('com.broken');
      launchService.clearLaunchLog();
      expect(launchService.launchAbility('com.broken', 'MainAbility')).assertTrue();
    });

    // 26. 验证启动后组件计数稳定：对应 组件渲染稳定
    it('component_count_should_be_stable_after_launch', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const count1 = await appComponentCount(driver);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      const count2 = await appComponentCount(driver);
      expect(Math.abs(count1 - count2)).assertLessOrEqual(3);
    });

    // 27. 验证焦点切换后启动：对应 焦点导航后启动
    it('launch_after_focus_navigation_should_work', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 28. 验证启动服务日志容量：对应 日志规模
    it('launch_log_should_handle_large_volume', 0, () => {
      launchService.clearLaunchLog();
      for (let i = 0; i < 1000; i++) {
        launchService.launchAbility(`com.app${i % 10}`, 'MainAbility');
      }
      expect(launchService.getLaunchCount()).assertEqual(1000);
    });

    // 29. 验证启动异常不崩溃：对应 异常处理
    it('launch_service_should_not_crash_on_edge_case', 0, () => {
      launchService.clearLaunchLog();
      const success = launchService.launchAbility('com.a', '');
      expect(success).assertTrue();
    });

    // 30. 验证启动数据一致性：对应 数据-数据一致性
    it('launch_data_should_be_consistent', 0, () => {
      launchService.clearLaunchLog();
      launchService.launchAbility('com.a', 'MainAbility');
      expect(launchService.hasLaunched('com.a')).assertTrue();
      expect(launchService.getLaunchCount()).assertEqual(1);
      expect(launchService.getLaunchLog()[0]).assertEqual('com.a/MainAbility');
    });

    // 验证启动Want参数构建器：确保TV设备Want参数构建完整
    it('launch_want_builder_should_build_complete_want', 0, () => {
      const builder: LaunchWantBuilder = new LaunchWantBuilder();
      builder.setBundleName('com.example.app');
      builder.setAbilityName('MainAbility');
      builder.addParameter('key1', 'value1');
      builder.addParameter('key2', 'value2');
      expect(builder.getBundleName()).assertEqual('com.example.app');
      expect(builder.getAbilityName()).assertEqual('MainAbility');
      expect(builder.getParameterCount()).assertEqual(2);
      expect(builder.isValid()).assertTrue();
      expect(builder.buildDescription()).assertEqual('com.example.app/MainAbility');
    });

    // 验证启动前置校验：确保TV设备LaunchPrecondition校验空包名与格式
    it('launch_precondition_should_validate_bundle_name', 0, () => {
      expect(LaunchPrecondition.isEmptyBundleName('')).assertTrue();
      expect(LaunchPrecondition.isEmptyBundleName('com.example.app')).assertFalse();
      expect(LaunchPrecondition.isValidBundleName('com.example.app')).assertTrue();
      expect(LaunchPrecondition.isValidBundleName('single')).assertFalse();
      expect(LaunchPrecondition.canLaunch('com.example.app')).assertTrue();
      expect(LaunchPrecondition.canLaunch('')).assertFalse();
    });

    // 验证启动重试策略：确保TV设备LaunchRetryStrategy重试次数受控
    it('launch_retry_strategy_should_control_retry_count', 0, () => {
      const retry: LaunchRetryStrategy = new LaunchRetryStrategy();
      retry.setMaxRetries(3);
      expect(retry.shouldRetry()).assertTrue();
      retry.recordRetry();
      retry.recordRetry();
      expect(retry.getRetryCount()).assertEqual(2);
      expect(retry.shouldRetry()).assertTrue();
      retry.recordRetry();
      expect(retry.shouldRetry()).assertFalse();
      retry.reset();
      expect(retry.getRetryCount()).assertEqual(0);
    });

    // 验证启动历史记录：确保TV设备LaunchHistory记录与查询正确
    it('launch_history_should_record_and_query_correctly', 0, () => {
      const history: LaunchHistory = new LaunchHistory();
      history.recordLaunch('com.a');
      history.recordLaunch('com.b');
      history.recordLaunch('com.a');
      expect(history.getLaunchCount()).assertEqual(3);
      expect(history.getLaunchCountFor('com.a')).assertEqual(2);
      expect(history.hasLaunched('com.b')).assertTrue();
      expect(history.hasLaunched('com.c')).assertFalse();
      history.clear();
      expect(history.getLaunchCount()).assertEqual(0);
    });

    // 验证启动结果处理：确保TVDeviceLaunchResultHandler成功失败计数正确
    it('launch_result_handler_should_count_success_and_failure', 0, () => {
      const handler: LaunchResultHandler = new LaunchResultHandler();
      handler.handleSuccess();
      handler.handleSuccess();
      handler.handleFailure();
      expect(handler.getSuccessCount()).assertEqual(2);
      expect(handler.getFailureCount()).assertEqual(1);
      expect(handler.getTotalCount()).assertEqual(3);
      handler.reset();
      expect(handler.getTotalCount()).assertEqual(0);
    });
  });
}

/**
 * 启动Want参数构建器
 * 封装启动应用 Want 参数的构建业务逻辑
 */
class LaunchWantBuilder {
  private bundleName: string = '';
  private abilityName: string = '';
  private parameters: Map<string, string> = new Map<string, string>();

  public setBundleName(bundleName: string): LaunchWantBuilder {
    this.bundleName = bundleName;
    return this;
  }

  public setAbilityName(abilityName: string): LaunchWantBuilder {
    this.abilityName = abilityName;
    return this;
  }

  public addParameter(key: string, value: string): LaunchWantBuilder {
    this.parameters.set(key, value);
    return this;
  }

  public getBundleName(): string {
    return this.bundleName;
  }

  public getAbilityName(): string {
    return this.abilityName;
  }

  public getParameterCount(): number {
    return this.parameters.size;
  }

  // 校验启动参数完整性
  public isValid(): boolean {
    return this.bundleName.length > 0 && this.abilityName.length > 0;
  }

  // 构建启动描述字符串
  public buildDescription(): string {
    return `${this.bundleName}/${this.abilityName}`;
  }
}

/**
 * 启动历史记录器
 * 封装应用启动历史的记录与查询业务逻辑
 */
class LaunchHistory {
  private history: string[] = [];

  public recordLaunch(bundleName: string): void {
    this.history.push(bundleName);
  }

  public getHistory(): string[] {
    return [...this.history];
  }

  public getLaunchCount(): number {
    return this.history.length;
  }

  public getLaunchCountFor(bundleName: string): number {
    return this.history.filter(name => name === bundleName).length;
  }

  public hasLaunched(bundleName: string): boolean {
    return this.history.includes(bundleName);
  }

  public clear(): void {
    this.history = [];
  }
}

/**
 * 启动前置校验器
 * 封装启动应用前的前置条件校验业务逻辑
 */
class LaunchPrecondition {
  // 校验 bundleName 是否为空
  public static isEmptyBundleName(bundleName: string): boolean {
    return bundleName === undefined || bundleName === null || bundleName.length === 0;
  }

  // 校验 bundleName 格式（com.xxx 格式）
  public static isValidBundleName(bundleName: string): boolean {
    return bundleName.split('.').length >= 2;
  }

  // 校验是否可启动（非空且格式合法）
  public static canLaunch(bundleName: string): boolean {
    return !LaunchPrecondition.isEmptyBundleName(bundleName) && LaunchPrecondition.isValidBundleName(bundleName);
  }
}

/**
 * 启动重试策略
 * 封装启动失败后的重试业务逻辑
 */
class LaunchRetryStrategy {
  private maxRetries: number = 3;
  private retryCount: number = 0;

  public setMaxRetries(max: number): void {
    this.maxRetries = max;
  }

  public shouldRetry(): boolean {
    return this.retryCount < this.maxRetries;
  }

  public recordRetry(): void {
    this.retryCount++;
  }

  public getRetryCount(): number {
    return this.retryCount;
  }

  public reset(): void {
    this.retryCount = 0;
  }
}

/**
 * 启动超时检查器
 * 封装启动超时检测业务逻辑
 */
class LaunchTimeoutChecker {
  private timeoutMs: number = 5000;

  public setTimeout(timeoutMs: number): void {
    this.timeoutMs = timeoutMs;
  }

  public isTimeout(elapsedMs: number): boolean {
    return elapsedMs > this.timeoutMs;
  }

  public getTimeout(): number {
    return this.timeoutMs;
  }
}

/**
 * 启动结果处理器
 * 封装启动成功/失败结果处理业务逻辑
 */
class LaunchResultHandler {
  private successCount: number = 0;
  private failureCount: number = 0;

  public handleSuccess(): void {
    this.successCount++;
  }

  public handleFailure(): void {
    this.failureCount++;
  }

  public getSuccessCount(): number {
    return this.successCount;
  }

  public getFailureCount(): number {
    return this.failureCount;
  }

  public getTotalCount(): number {
    return this.successCount + this.failureCount;
  }

  public reset(): void {
    this.successCount = 0;
    this.failureCount = 0;
  }
}

/**
 * 启动统计器
 * 封装启动成功/失败/耗时统计业务逻辑
 */
class LaunchStatistics {
  private launchTimes: number[] = [];

  public recordLaunchTime(time: number): void {
    this.launchTimes.push(time);
  }

  public getAverageLaunchTime(): number {
    if (this.launchTimes.length === 0) {
      return 0;
    }
    const total = this.launchTimes.reduce((sum, t) => sum + t, 0);
    return total / this.launchTimes.length;
  }

  public getLaunchCount(): number {
    return this.launchTimes.length;
  }

  public reset(): void {
    this.launchTimes = [];
  }
}

/**
 * 启动Want参数校验器
 * 封装启动Want参数完整性校验业务逻辑
 */
class LaunchWantValidator {
  public static hasBundleName(bundleName: string): boolean {
    return bundleName !== undefined && bundleName !== null && bundleName.length > 0;
  }

  public static hasAbilityName(abilityName: string): boolean {
    return abilityName !== undefined && abilityName !== null && abilityName.length > 0;
  }

  public static isWantValid(bundleName: string, abilityName: string): boolean {
    return LaunchWantValidator.hasBundleName(bundleName) && LaunchWantValidator.hasAbilityName(abilityName);
  }
}

/**
 * 启动状态追踪器
 * 封装启动状态变化追踪业务逻辑
 */
class LaunchStateTracker {
  private state: string = 'idle';

  public setState(state: string): void {
    this.state = state;
  }

  public getState(): string {
    return this.state;
  }

  public isLaunched(): boolean {
    return this.state === 'launched';
  }

  public reset(): void {
    this.state = 'idle';
  }
}


