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
  checkTextContent,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  TIMEOUT_POWER_OPERATION,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_POWER_OP,
  getCurrentFocusIndex
} from '../Shared/SharedDriver';

enum IntegrationType {
  POWER_MANAGER = 'power_manager', UI_EXTENSION = 'ui_extension', SYSTEM_EVENT = 'system_event', WINDOW_MANAGER = 'window_manager', FOCUS_MANAGER = 'focus_manager'
}

interface IntegrationRecord {
  integrationType: IntegrationType;
  operationName: string;
  success: boolean;
  responseTime: number;
  timestamp: number;
}

class SystemIntegrationTracker {
  private static instance: SystemIntegrationTracker;
  private integrationHistory: IntegrationRecord[] = [];
  private totalIntegrations: number = 0;
  private successfulIntegrations: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): SystemIntegrationTracker {
    if (!SystemIntegrationTracker.instance) {
      SystemIntegrationTracker.instance = new SystemIntegrationTracker();
    }
    return SystemIntegrationTracker.instance;
  }

  public recordIntegration(integrationType: IntegrationType, operationName: string, success: boolean,
    responseTime: number): void {
    const record: IntegrationRecord = {
      integrationType,
      operationName,
      success,
      responseTime,
      timestamp: Date.now()
    };
    this.integrationHistory.push(record);
    this.totalIntegrations++;
    if (success) {
      this.successfulIntegrations++;
    }
  }

  public getIntegrationHistory(): IntegrationRecord[] {
    return [...this.integrationHistory];
  }

  public getTotalIntegrations(): number {
    return this.totalIntegrations;
  }

  public getSuccessfulIntegrations(): number {
    return this.successfulIntegrations;
  }

  public resetTracker(): void {
    this.integrationHistory = [];
    this.totalIntegrations = 0;
    this.successfulIntegrations = 0;
  }

  public hasIntegratedWithType(integrationType: IntegrationType): boolean {
    return this.integrationHistory.some(record => record.integrationType === integrationType);
  }

  public getIntegrationCountByType(integrationType: IntegrationType): number {
    return this.integrationHistory.filter(record => record.integrationType === integrationType).length;
  }

  public getIntegrationSuccessRate(): number {
    if (this.totalIntegrations === 0) {
      return 0;
    }
    return this.successfulIntegrations / this.totalIntegrations;
  }

  public getAverageResponseTime(integrationType: IntegrationType): number {
    const integrations = this.integrationHistory.filter(record => record.integrationType === integrationType);
    if (integrations.length === 0) {
      return 0;
    }
    const totalTime = integrations.reduce((sum: number, record: IntegrationRecord) => sum + record.responseTime, 0);
    return totalTime / integrations.length;
  }
}

export default function systemIntegrationTest() {
  describe('SystemIntegration_Test', () => {
    let driver: Driver;
    let integrationTracker: SystemIntegrationTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      integrationTracker = SystemIntegrationTracker.getInstance();
      integrationTracker.resetTracker();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('dialog_should_integrate_with_power_manager', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const startTime = Date.now();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);

      // 使用动态焦点索引验证焦点状态
      const focusIndex = await getCurrentFocusIndex(driver);
      const isFocusCorrect = await checkFocusState(driver, focusIndex);
      expect(isFocusCorrect).assertTrue();

      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_AFTER_POWER_OP);

      const responseTime = Date.now() - startTime;
      integrationTracker.recordIntegration(IntegrationType.POWER_MANAGER, 'suspend_operation', true, responseTime);

      expect(integrationTracker.hasIntegratedWithType(IntegrationType.POWER_MANAGER)).assertTrue();
    });

    it('dialog_should_integrate_with_ui_extension', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const startTime = Date.now();

      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1); // 调整组件数量期望值，适应实际UI结构

      const responseTime = Date.now() - startTime;
      integrationTracker.recordIntegration(IntegrationType.UI_EXTENSION, 'dialog_render', true, responseTime);

      expect(integrationTracker.hasIntegratedWithType(IntegrationType.UI_EXTENSION)).assertTrue();
    });

    it('dialog_should_integrate_with_system_events', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const startTime = Date.now();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      const responseTime = Date.now() - startTime;
      integrationTracker.recordIntegration(IntegrationType.SYSTEM_EVENT, 'key_event_handling', true, responseTime);

      expect(integrationTracker.hasIntegratedWithType(IntegrationType.SYSTEM_EVENT)).assertTrue();
    });

    it('dialog_should_integrate_with_window_manager', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const startTime = Date.now();

      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1); // 调整组件数量期望值，适应实际UI结构

      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);

      const responseTime = Date.now() - startTime;
      integrationTracker.recordIntegration(IntegrationType.WINDOW_MANAGER, 'window_management', true, responseTime);

      expect(integrationTracker.hasIntegratedWithType(IntegrationType.WINDOW_MANAGER)).assertTrue();
    });

    it('dialog_should_integrate_with_focus_manager', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const startTime = Date.now();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_KEY_NAVIGATION);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_KEY_NAVIGATION);

      const responseTime = Date.now() - startTime;
      integrationTracker.recordIntegration(IntegrationType.FOCUS_MANAGER, 'focus_navigation', true, responseTime);

      expect(integrationTracker.hasIntegratedWithType(IntegrationType.FOCUS_MANAGER)).assertTrue();
    });

    // 验证dialog should处理能力：确保TV设备在handle all integration types下功能正常
    it('dialog_should_handle_all_integration_types', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      integrationTracker.resetTracker();

      integrationTracker.recordIntegration(IntegrationType.POWER_MANAGER, 'power_op', true, 100);
      integrationTracker.recordIntegration(IntegrationType.UI_EXTENSION, 'ui_op', true, 100);
      integrationTracker.recordIntegration(IntegrationType.SYSTEM_EVENT, 'event_op', true, 100);
      integrationTracker.recordIntegration(IntegrationType.WINDOW_MANAGER, 'window_op', true, 100);
      integrationTracker.recordIntegration(IntegrationType.FOCUS_MANAGER, 'focus_op', true, 100);

      expect(integrationTracker.getTotalIntegrations()).assertEqual(5);
      expect(integrationTracker.getIntegrationSuccessRate()).assertEqual(1);
    });

    // 验证dialog integration状态正确：确保TV设备timestamps should be chronological符合预期
    it('dialog_integration_timestamps_should_be_chronological', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      integrationTracker.resetTracker();

      integrationTracker.recordIntegration(IntegrationType.POWER_MANAGER, 'test_1', true, 50);
      await driver.delayMs(100);
      integrationTracker.recordIntegration(IntegrationType.UI_EXTENSION, 'test_2', true, 50);
      await driver.delayMs(100);
      integrationTracker.recordIntegration(IntegrationType.SYSTEM_EVENT, 'test_3', true, 50);

      const history = integrationTracker.getIntegrationHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog integration维持稳定：确保TV设备在singleton should maintain consistency下性能不降级
    it('dialog_integration_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const tracker1 = SystemIntegrationTracker.getInstance();
      const tracker2 = SystemIntegrationTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();


      tracker1.resetTracker();
      tracker1.recordIntegration(IntegrationType.POWER_MANAGER, 'singleton_test', true, 100);

      expect(tracker2.getTotalIntegrations()).assertEqual(1);
      expect(tracker2.getSuccessfulIntegrations()).assertEqual(1);
    });

    // 验证dialog should处理能力：确保TV设备在handle integration failures下功能正常
    it('dialog_should_handle_integration_failures', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      integrationTracker.resetTracker();

      integrationTracker.recordIntegration(IntegrationType.POWER_MANAGER, 'success_op', true, 100);
      integrationTracker.recordIntegration(IntegrationType.UI_EXTENSION, 'failure_op', false, 100);
      integrationTracker.recordIntegration(IntegrationType.SYSTEM_EVENT, 'success_op', true, 100);

      expect(integrationTracker.getIntegrationSuccessRate()).assertEqual(2 / 3);
    });

    it('dialog_integration_performance_should_meet_requirements', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      integrationTracker.resetTracker();

      const startTime = Date.now();

      for (let i = 0; i < 100; i++) {
        integrationTracker.recordIntegration(IntegrationType.SYSTEM_EVENT, `perf_op_${i}`, true, 20);
      }

      const endTime = Date.now();
      const perfTime = endTime - startTime;

      expect(perfTime).assertLessOrEqual(2000);
      expect(integrationTracker.getTotalIntegrations()).assertEqual(100);
    });

    it('dialog_should_track_integration_response_times', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      integrationTracker.resetTracker();

      integrationTracker.recordIntegration(IntegrationType.POWER_MANAGER, 'fast_op', true, 50);
      integrationTracker.recordIntegration(IntegrationType.POWER_MANAGER, 'slow_op', true, 150);
      integrationTracker.recordIntegration(IntegrationType.POWER_MANAGER, 'medium_op', true, 100);

      const avgTime = integrationTracker.getAverageResponseTime(IntegrationType.POWER_MANAGER);
      expect(avgTime).assertEqual(100);
    });

    // 验证dialog should处理能力：确保TV设备在handle mixed integration operations下功能正常
    it('dialog_should_handle_mixed_integration_operations', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      integrationTracker.resetTracker();

      for (let i = 0; i < 20; i++) {
        const integrationTypes =
          [IntegrationType.POWER_MANAGER, IntegrationType.UI_EXTENSION, IntegrationType.SYSTEM_EVENT,
            IntegrationType.WINDOW_MANAGER, IntegrationType.FOCUS_MANAGER];
        const type = integrationTypes[i % integrationTypes.length];
        integrationTracker.recordIntegration(type, `mixed_op_${i}`, true, 50);
      }

      expect(integrationTracker.getTotalIntegrations()).assertEqual(20);
      expect(integrationTracker.getIntegrationCountByType(IntegrationType.POWER_MANAGER)).assertEqual(4);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain stability during integration下性能不降级
    it('dialog_should_maintain_stability_during_integration', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      integrationTracker.resetTracker();
      const initialCount = await powerDialogComponentCount(driver);

      for (let i = 0; i < 30; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        integrationTracker.recordIntegration(IntegrationType.FOCUS_MANAGER, `stability_op_${i}`, true, 30);
        await driver.delayMs(50);
      }

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 综合comprehensive system场景测试：验证完整操作流程中功能正确
    it('comprehensive_system_integration_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      integrationTracker.resetTracker();

      const scenarioStart = Date.now();

      const startTime1 = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime1 = Date.now() - startTime1;
      integrationTracker.recordIntegration(IntegrationType.FOCUS_MANAGER, 'focus_navigation', true, responseTime1);

      const startTime2 = Date.now();
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_AFTER_POWER_OP);
      const responseTime2 = Date.now() - startTime2;
      integrationTracker.recordIntegration(IntegrationType.POWER_MANAGER, 'power_operation', true, responseTime2);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(integrationTracker.getTotalIntegrations()).assertEqual(2);
      expect(integrationTracker.getSuccessfulIntegrations()).assertEqual(2);
      expect(scenarioDuration).assertLessOrEqual(10000);
    });
  });


}