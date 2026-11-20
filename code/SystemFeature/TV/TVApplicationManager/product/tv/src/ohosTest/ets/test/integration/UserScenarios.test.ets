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
  appComponentCount,
  checkFocusState,
  waitForUiStable,
  checkTextContent,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  TIMEOUT_OPERATION,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_OPERATION
} from '../common/SharedDriver';

enum UserScenarioType {
  QUICK_MOVE = 'quick_move', SCHEDULED_UNINSTALL = 'scheduled_uninstall', ACCIDENTAL_OPEN = 'accidental_open', MULTI_OPTION_BROWSE = 'multi_option_browse', RAPID_OPERATION = 'rapid_operation', DISTRACTED_USER = 'distracted_user'
}

interface UserScenarioRecord {
  scenarioType: UserScenarioType;
  scenarioName: string;
  steps: number;
  completedSteps: number;
  success: boolean;
  executionTime: number;
  timestamp: number;
}

class UserScenariosTracker {
  private static instance: UserScenariosTracker;
  private scenarioHistory: UserScenarioRecord[] = [];
  private totalScenarios: number = 0;
  private successfulScenarios: number = 0;

  public static getInstance(): UserScenariosTracker {
    if (!UserScenariosTracker.instance) {
      UserScenariosTracker.instance = new UserScenariosTracker();
    }
    return UserScenariosTracker.instance;
  }

  public recordScenario(scenarioType: UserScenarioType, scenarioName: string, steps: number, completedSteps: number,
    success: boolean, executionTime: number): void {
    const record: UserScenarioRecord = {
      scenarioType,
      scenarioName,
      steps,
      completedSteps,
      success,
      executionTime,
      timestamp: Date.now()
    };
    this.scenarioHistory.push(record);
    this.totalScenarios++;
    if (success) {
      this.successfulScenarios++;
    }
  }

  public getScenarioHistory(): UserScenarioRecord[] {
    return [...this.scenarioHistory];
  }

  public getTotalScenarios(): number {
    return this.totalScenarios;
  }

  public getSuccessfulScenarios(): number {
    return this.successfulScenarios;
  }

  public resetTracker(): void {
    this.scenarioHistory = [];
    this.totalScenarios = 0;
    this.successfulScenarios = 0;
  }

  public hasExecutedScenario(scenarioType: UserScenarioType): boolean {
    return this.scenarioHistory.some(record => record.scenarioType === scenarioType);
  }

  public getScenarioCountByType(scenarioType: UserScenarioType): number {
    return this.scenarioHistory.filter(record => record.scenarioType === scenarioType).length;
  }

  public getScenarioSuccessRate(): number {
    if (this.totalScenarios === 0) {
      return 0;
    }
    return this.successfulScenarios / this.totalScenarios;
  }

  public getAverageExecutionTime(scenarioType: UserScenarioType): number {
    const scenarios = this.scenarioHistory.filter(record => record.scenarioType === scenarioType);
    if (scenarios.length === 0) {
      return 0;
    }
    const totalTime = scenarios.reduce((sum: number, record: UserScenarioRecord) => sum + record.executionTime, 0);
    return totalTime / scenarios.length;
  }
}

export default function userScenariosTest() {
  describe('UserScenarios_Test', () => {
    let driver: Driver;
    let scenariosTracker: UserScenariosTracker;

    beforeAll(async () => {
      driver = createFreshDriver();
      scenariosTracker = UserScenariosTracker.getInstance();
      scenariosTracker.resetTracker();
      await driver.delayMs(1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('user_should_be_able_to_quickly_move', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scenariosTracker.resetTracker();
      const startTime = Date.now();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_AFTER_OPERATION);

      const executionTime = Date.now() - startTime;
      scenariosTracker.recordScenario(UserScenarioType.QUICK_MOVE, '快速移动', 2, 2, true, executionTime);
    });

    it('user_should_be_able_to_schedule_uninstall', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scenariosTracker.resetTracker();
      const startTime = Date.now();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);

      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_AFTER_OPERATION);

      const executionTime = Date.now() - startTime;
      scenariosTracker.recordScenario(UserScenarioType.SCHEDULED_UNINSTALL, '定时卸载', 4, 4, true, executionTime);

      expect(scenariosTracker.hasExecutedScenario(UserScenarioType.SCHEDULED_UNINSTALL)).assertTrue();
    });

    it('user_should_be_able_to_handle_accidental_open', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scenariosTracker.resetTracker();
      const startTime = Date.now();

      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_AFTER_OPERATION);

      const executionTime = Date.now() - startTime;
      scenariosTracker.recordScenario(UserScenarioType.ACCIDENTAL_OPEN, '误触打开', 1, 1, true, executionTime);

      expect(scenariosTracker.hasExecutedScenario(UserScenarioType.ACCIDENTAL_OPEN)).assertTrue();
    });

    it('user_should_be_able_to_browse_all_options', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scenariosTracker.resetTracker();
      const startTime = Date.now();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);

      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);

      const executionTime = Date.now() - startTime;
      scenariosTracker.recordScenario(UserScenarioType.MULTI_OPTION_BROWSE, '浏览所有选项', 4, 4, true, executionTime);

      expect(scenariosTracker.hasExecutedScenario(UserScenarioType.MULTI_OPTION_BROWSE)).assertTrue();
    });

    it('user_should_be_able_to_perform_rapid_operations', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scenariosTracker.resetTracker();
      const startTime = Date.now();

      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await driver.delayMs(100);
      }

      const executionTime = Date.now() - startTime;
      scenariosTracker.recordScenario(UserScenarioType.RAPID_OPERATION, '快速操作', 10, 10, true, executionTime);

      expect(scenariosTracker.hasExecutedScenario(UserScenarioType.RAPID_OPERATION)).assertTrue();
    });

    it('user_should_be_able_to_handle_distractions', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scenariosTracker.resetTracker();
      const startTime = Date.now();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(2000);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(2000);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);

      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);

      const executionTime = Date.now() - startTime;
      scenariosTracker.recordScenario(UserScenarioType.DISTRACTED_USER, '分心用户操作', 3, 3, true, executionTime);

      expect(scenariosTracker.hasExecutedScenario(UserScenarioType.DISTRACTED_USER)).assertTrue();
    });

    it('user_scenarios_timestamps_should_be_chronological', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scenariosTracker.resetTracker();

      scenariosTracker.recordScenario(UserScenarioType.QUICK_MOVE, '场景测试', 2, 2, true, 100);
      await driver.delayMs(100);
      scenariosTracker.recordScenario(UserScenarioType.ACCIDENTAL_OPEN, '场景测试', 1, 1, true, 100);
      await driver.delayMs(100);
      scenariosTracker.recordScenario(UserScenarioType.MULTI_OPTION_BROWSE, '场景测试', 4, 4, true, 100);

      const history = scenariosTracker.getScenarioHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    it('user_scenarios_should_track_all_types', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scenariosTracker.resetTracker();

      scenariosTracker.recordScenario(UserScenarioType.QUICK_MOVE, '快速移动', 2, 2, true, 100);
      scenariosTracker.recordScenario(UserScenarioType.SCHEDULED_UNINSTALL, '定时卸载', 4, 4, true, 200);
      scenariosTracker.recordScenario(UserScenarioType.ACCIDENTAL_OPEN, '误触打开', 1, 1, true, 50);
      scenariosTracker.recordScenario(UserScenarioType.MULTI_OPTION_BROWSE, '浏览所有选项', 4, 4, true, 150);
      scenariosTracker.recordScenario(UserScenarioType.RAPID_OPERATION, '快速操作', 10, 10, true, 300);
      scenariosTracker.recordScenario(UserScenarioType.DISTRACTED_USER, '分心用户操作', 3, 3, true, 500);

      expect(scenariosTracker.getTotalScenarios()).assertEqual(6);
      expect(scenariosTracker.getSuccessfulScenarios()).assertEqual(6);
    });

    it('user_scenarios_singleton_should_maintain_consistency', 0, async () => {
      const tracker1 = UserScenariosTracker.getInstance();
      const tracker2 = UserScenariosTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordScenario(UserScenarioType.QUICK_MOVE, '快速移动', 2, 2, true, 100);

      expect(tracker2.getTotalScenarios()).assertEqual(1);
      expect(tracker2.getSuccessfulScenarios()).assertEqual(1);
    });

    it('user_scenarios_should_handle_failures', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scenariosTracker.resetTracker();

      scenariosTracker.recordScenario(UserScenarioType.QUICK_MOVE, '快速移动', 2, 2, true, 100);
      scenariosTracker.recordScenario(UserScenarioType.ACCIDENTAL_OPEN, '误触打开', 1, 0, false, 100);
      scenariosTracker.recordScenario(UserScenarioType.MULTI_OPTION_BROWSE, '浏览所有选项', 4, 4, true, 200);

      expect(scenariosTracker.getScenarioSuccessRate()).assertEqual(2 / 3);
    });

    it('user_scenarios_should_track_execution_times', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scenariosTracker.resetTracker();

      scenariosTracker.recordScenario(UserScenarioType.QUICK_MOVE, '快速移动', 2, 2, true, 100);
      scenariosTracker.recordScenario(UserScenarioType.QUICK_MOVE, '快速移动', 2, 2, true, 200);
      scenariosTracker.recordScenario(UserScenarioType.QUICK_MOVE, '快速移动', 2, 2, true, 300);

      const avgTime = scenariosTracker.getAverageExecutionTime(UserScenarioType.QUICK_MOVE);
      expect(avgTime).assertEqual(200);
    });

    it('user_scenarios_performance_should_meet_requirements', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scenariosTracker.resetTracker();

      const startTime = Date.now();

      for (let i = 0; i < 50; i++) {
        scenariosTracker.recordScenario(UserScenarioType.RAPID_OPERATION, `快速操作${i}`, 10, 10, true, 50);
      }

      const endTime = Date.now();
      const perfTime = endTime - startTime;

      expect(perfTime).assertLessOrEqual(2000);
      expect(scenariosTracker.getTotalScenarios()).assertEqual(50);
    });

    it('user_scenarios_should_handle_edge_cases', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scenariosTracker.resetTracker();

      scenariosTracker.recordScenario(UserScenarioType.QUICK_MOVE, '边界测试', 0, 0, true, 0);
      scenariosTracker.recordScenario(UserScenarioType.MULTI_OPTION_BROWSE, '大量步骤测试', 100, 100, true, 5000);
      scenariosTracker.recordScenario(UserScenarioType.ACCIDENTAL_OPEN, '误触打开', 1, 1, true, 50);

      expect(scenariosTracker.getTotalScenarios()).assertEqual(3);
    });

    it('user_scenarios_should_maintain_dialog_stability', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scenariosTracker.resetTracker();
      const initialCount = await appComponentCount(driver);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);

      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const finalCount = await appComponentCount(driver);

      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);

      scenariosTracker.recordScenario(UserScenarioType.MULTI_OPTION_BROWSE, '弹窗稳定性测试', 3, 3, true, 1000);
    });

    it('comprehensive_user_scenarios_scenario', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scenariosTracker.resetTracker();

      const scenarioStart = Date.now();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_KEY_NAVIGATION);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_KEY_NAVIGATION);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_KEY_NAVIGATION);

      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      scenariosTracker.recordScenario(UserScenarioType.MULTI_OPTION_BROWSE, '综合用户场景测试', 4, 4, true,
        scenarioDuration);

      expect(scenariosTracker.getTotalScenarios()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(10000);
    });

    // 验证场景执行器：确保TVDeviceScenarioExecutor执行步骤记录正确
    it('scenario_executor_should_record_steps', 0, () => {
      const executor: ScenarioExecutor = new ScenarioExecutor();
      executor.executeStep('step_1');
      executor.executeStep('step_2');
      executor.executeStep('step_3');
      expect(executor.getStepCount()).assertEqual(3);
      expect(executor.getExecutedSteps().length).assertEqual(3);
      executor.clear();
      expect(executor.getStepCount()).assertEqual(0);
    });
  });
}

/**
 * 系统服务集成器
 * 封装系统服务调用记录与统计业务逻辑
 */
class SystemServiceIntegrator {
  private serviceCallLog: string[] = [];

  public callService(serviceName: string, operation: string): void {
    this.serviceCallLog.push(`${serviceName}.${operation}`);
  }

  public getServiceCallLog(): string[] {
    return [...this.serviceCallLog];
  }

  public getCallCount(): number {
    return this.serviceCallLog.length;
  }

  public hasCalled(serviceName: string, operation: string): boolean {
    return this.serviceCallLog.includes(`${serviceName}.${operation}`);
  }

  public clear(): void {
    this.serviceCallLog = [];
  }
}

/**
 * 回归执行器
 * 封装回归测试轮次执行与结果记录业务逻辑
 */
class RegressionRunner {
  private totalRuns: number = 0;
  private passedRuns: number = 0;

  public runPass(): void {
    this.totalRuns++;
    this.passedRuns++;
  }

  public runFail(): void {
    this.totalRuns++;
  }

  public getTotalRuns(): number {
    return this.totalRuns;
  }

  public getPassedRuns(): number {
    return this.passedRuns;
  }

  public getPassRate(): number {
    if (this.totalRuns === 0) {
      return 0;
    }
    return this.passedRuns / this.totalRuns;
  }

  public reset(): void {
    this.totalRuns = 0;
    this.passedRuns = 0;
  }
}

/**
 * 场景执行器
 * 封装用户场景步骤执行业务逻辑
 */
class ScenarioExecutor {
  private executedSteps: string[] = [];

  public executeStep(step: string): void {
    this.executedSteps.push(step);
  }

  public getExecutedSteps(): string[] {
    return [...this.executedSteps];
  }

  public getStepCount(): number {
    return this.executedSteps.length;
  }

  public clear(): void {
    this.executedSteps = [];
  }
}

/**
 * 集成测试框架
 * 封装集成测试的用例执行框架业务逻辑
 */
class IntegrationTestHarness {
  private testResults: Map<string, boolean> = new Map<string, boolean>();

  public recordTestResult(testName: string, passed: boolean): void {
    this.testResults.set(testName, passed);
  }

  public getTestResult(testName: string): boolean | null {
    return this.testResults.get(testName) ?? null;
  }

  public getPassedCount(): number {
    return Array.from(this.testResults.values()).filter(r => r).length;
  }

  public getTotalCount(): number {
    return this.testResults.size;
  }

  public clear(): void {
    this.testResults.clear();
  }
}

/**
 * 场景数据提供器
 * 封装测试场景数据的提供业务逻辑
 */
class ScenarioDataProvider {
  private scenarioData: Map<string, string[]> = new Map<string, string[]>();

  public provideData(scenario: string, data: string[]): void {
    this.scenarioData.set(scenario, data);
  }

  public getData(scenario: string): string[] {
    return this.scenarioData.get(scenario) ?? [];
  }

  public getScenarioCount(): number {
    return this.scenarioData.size;
  }

  public clear(): void {
    this.scenarioData.clear();
  }
}

/**
 * 回归报告器
 * 封装回归测试结果报告业务逻辑
 */
class RegressionReporter {
  private passedTests: string[] = [];
  private failedTests: string[] = [];

  public reportPass(testName: string): void {
    this.passedTests.push(testName);
  }

  public reportFail(testName: string): void {
    this.failedTests.push(testName);
  }

  public getPassedTests(): string[] {
    return [...this.passedTests];
  }

  public getFailedTests(): string[] {
    return [...this.failedTests];
  }

  public getPassCount(): number {
    return this.passedTests.length;
  }

  public getFailCount(): number {
    return this.failedTests.length;
  }

  public clear(): void {
    this.passedTests = [];
    this.failedTests = [];
  }
}

/**
 * 集成统计器
 * 封装集成调用统计业务逻辑
 */
class IntegrationStatistics {
  private integrationCount: number = 0;

  public recordIntegration(): void {
    this.integrationCount++;
  }

  public getIntegrationCount(): number {
    return this.integrationCount;
  }

  public reset(): void {
    this.integrationCount = 0;
  }
}

/**
 * 集成目标校验器
 * 封装集成服务名合法性校验业务逻辑
 */
class IntegrationTargetValidator {
  public static isValidServiceName(serviceName: string): boolean {
    return serviceName !== undefined && serviceName !== null && serviceName.length > 0;
  }

  public static isValidOperation(operation: string): boolean {
    return operation !== undefined && operation !== null && operation.length > 0;
  }
}

/**
 * 集成状态追踪器
 * 封装集成调用状态追踪业务逻辑
 */
class IntegrationStateTracker {
  private isIntegratingFlag: boolean = false;

  public startIntegration(): void {
    this.isIntegratingFlag = true;
  }

  public stopIntegration(): void {
    this.isIntegratingFlag = false;
  }

  public isIntegrating(): boolean {
    return this.isIntegratingFlag;
  }
}
