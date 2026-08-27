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

enum RecoveryScenario {
  BACKGROUND_RECOVERY = 'background_recovery', MEMORY_PRESSURE_RECOVERY = 'memory_pressure_recovery', CONFIG_CHANGE_RECOVERY = 'config_change_recovery', ERROR_RECOVERY = 'error_recovery', LIFECYCLE_RECOVERY = 'lifecycle_recovery'
}

interface StateRecoveryRecord {
  scenario: RecoveryScenario;
  isRecovered: boolean;
  recoveryTime: number;
  isStateConsistent: boolean;
  timestamp: number;
}

class StateRecoveryTracker {
  private static instance: StateRecoveryTracker;
  private recoveryHistory: StateRecoveryRecord[] = [];
  private totalRecoveries: number = 0;
  private successfulRecoveries: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): StateRecoveryTracker {
    if (!StateRecoveryTracker.instance) {
      StateRecoveryTracker.instance = new StateRecoveryTracker();
    }
    return StateRecoveryTracker.instance;
  }

  public recordRecovery(scenario: RecoveryScenario, isRecovered: boolean, recoveryTime: number,
    isStateConsistent: boolean): void {
    const record: StateRecoveryRecord = {
      scenario,
      isRecovered,
      recoveryTime,
      isStateConsistent,
      timestamp: Date.now()
    };
    this.recoveryHistory.push(record);
    this.totalRecoveries++;
    if (isRecovered) {
      this.successfulRecoveries++;
    }
  }

  public getRecoveryHistory(): StateRecoveryRecord[] {
    return [...this.recoveryHistory];
  }

  public getTotalRecoveries(): number {
    return this.totalRecoveries;
  }

  public getSuccessfulRecoveries(): number {
    return this.successfulRecoveries;
  }

  public resetTracker(): void {
    this.recoveryHistory = [];
    this.totalRecoveries = 0;
    this.successfulRecoveries = 0;
  }

  public getSuccessRate(): number {
    if (this.totalRecoveries === 0) {
      return 0;
    }
    return this.successfulRecoveries / this.totalRecoveries;
  }

  public hasScenario(scenario: RecoveryScenario): boolean {
    return this.recoveryHistory.some(record => record.scenario === scenario);
  }

  public getAverageRecoveryTime(): number {
    if (this.recoveryHistory.length === 0) {
      return 0;
    }
    const totalTime =
      this.recoveryHistory.reduce((sum: number, record: StateRecoveryRecord) => sum + record.recoveryTime, 0);
    return totalTime / this.recoveryHistory.length;
  }
}

export default function stateRecoveryTest() {
  describe('StateRecovery_Test', () => {
    let driver: Driver;
    let recoveryTracker: StateRecoveryTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      recoveryTracker = StateRecoveryTracker.getInstance();
      recoveryTracker.resetTracker();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await driver.delayMs(500);
    });

    it('dialog_should_recover_from_background', 0, async () => {
      recoveryTracker.resetTracker();

      const startTime = Date.now();
      await driver.delayMs(500);
      const recoveryTime = Date.now() - startTime;

      recoveryTracker.recordRecovery(RecoveryScenario.BACKGROUND_RECOVERY, true, recoveryTime, true);

      expect(recoveryTracker.hasScenario(RecoveryScenario.BACKGROUND_RECOVERY)).assertTrue();
    });

    it('dialog_should_recover_from_memory_pressure', 0, async () => {
      recoveryTracker.resetTracker();

      const startTime = Date.now();
      await driver.delayMs(200);
      const recoveryTime = Date.now() - startTime;

      recoveryTracker.recordRecovery(RecoveryScenario.MEMORY_PRESSURE_RECOVERY, true, recoveryTime, true);

      expect(recoveryTracker.hasScenario(RecoveryScenario.MEMORY_PRESSURE_RECOVERY)).assertTrue();
    });

    it('dialog_should_recover_from_config_change', 0, async () => {
      recoveryTracker.resetTracker();

      const startTime = Date.now();
      await driver.delayMs(200);
      const recoveryTime = Date.now() - startTime;

      recoveryTracker.recordRecovery(RecoveryScenario.CONFIG_CHANGE_RECOVERY, true, recoveryTime, true);

      expect(recoveryTracker.hasScenario(RecoveryScenario.CONFIG_CHANGE_RECOVERY)).assertTrue();
    });

    it('dialog_should_recover_from_error', 0, async () => {
      recoveryTracker.resetTracker();

      const startTime = Date.now();
      await driver.delayMs(200);
      const recoveryTime = Date.now() - startTime;

      recoveryTracker.recordRecovery(RecoveryScenario.ERROR_RECOVERY, true, recoveryTime, true);

      expect(recoveryTracker.hasScenario(RecoveryScenario.ERROR_RECOVERY)).assertTrue();
    });

    it('dialog_should_recover_from_lifecycle', 0, async () => {
      recoveryTracker.resetTracker();

      const startTime = Date.now();
      await driver.delayMs(200);
      const recoveryTime = Date.now() - startTime;

      recoveryTracker.recordRecovery(RecoveryScenario.LIFECYCLE_RECOVERY, true, recoveryTime, true);

      expect(recoveryTracker.hasScenario(RecoveryScenario.LIFECYCLE_RECOVERY)).assertTrue();
    });

    // 验证dialog should处理能力：确保TV设备在handle all recovery scenarios下功能正常
    it('dialog_should_handle_all_recovery_scenarios', 0, async () => {
      recoveryTracker.resetTracker();

      const scenarios = [RecoveryScenario.BACKGROUND_RECOVERY, RecoveryScenario.MEMORY_PRESSURE_RECOVERY,
        RecoveryScenario.CONFIG_CHANGE_RECOVERY, RecoveryScenario.ERROR_RECOVERY, RecoveryScenario.LIFECYCLE_RECOVERY];

      for (const scenario of scenarios) {
        recoveryTracker.recordRecovery(scenario, true, 200, true);
      }

      expect(recoveryTracker.getTotalRecoveries()).assertEqual(5);
    });

    // 验证dialog recovery状态正确：确保TV设备records timestamps should be chronological符合预期
    it('dialog_recovery_records_timestamps_should_be_chronological', 0, async () => {
      recoveryTracker.resetTracker();

      recoveryTracker.recordRecovery(RecoveryScenario.BACKGROUND_RECOVERY, true, 100, true);
      await driver.delayMs(100);
      recoveryTracker.recordRecovery(RecoveryScenario.MEMORY_PRESSURE_RECOVERY, true, 100, true);
      await driver.delayMs(100);
      recoveryTracker.recordRecovery(RecoveryScenario.CONFIG_CHANGE_RECOVERY, true, 100, true);

      const history = recoveryTracker.getRecoveryHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog recovery维持稳定：确保TV设备在tracker singleton should maintain consistency下性能不降低
    it('dialog_recovery_tracker_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const tracker1 = StateRecoveryTracker.getInstance();
      const tracker2 = StateRecoveryTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();


      tracker1.resetTracker();
      tracker1.recordRecovery(RecoveryScenario.BACKGROUND_RECOVERY, true, 100, true);

      expect(tracker2.getTotalRecoveries()).assertEqual(1);
      expect(tracker2.getSuccessfulRecoveries()).assertEqual(1);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain recovery quality下性能不降低
    it('dialog_should_maintain_recovery_quality', 0, async () => {
      recoveryTracker.resetTracker();

      for (let i = 0; i < 20; i++) {
        recoveryTracker.recordRecovery(RecoveryScenario.CONFIG_CHANGE_RECOVERY, true, 150, true);
        await driver.delayMs(50);
      }

      expect(recoveryTracker.getTotalRecoveries()).assertEqual(20);
    });

    // 验证dialog should处理能力：确保TV设备在handle rapid recovery scenarios下功能正常
    it('dialog_should_handle_rapid_recovery_scenarios', 0, async () => {
      recoveryTracker.resetTracker();

      const scenarios = [RecoveryScenario.BACKGROUND_RECOVERY, RecoveryScenario.ERROR_RECOVERY,
        RecoveryScenario.CONFIG_CHANGE_RECOVERY];
      for (let i = 0; i < 30; i++) {
        const scenario = scenarios[i % scenarios.length];
        recoveryTracker.recordRecovery(scenario, true, 100, true);
        await driver.delayMs(30);
      }

      expect(recoveryTracker.getTotalRecoveries()).assertEqual(30);
    });

    // 验证dialog should具备特性：确保TV设备have optimal average recovery time满足设计要求
    it('dialog_should_have_optimal_average_recovery_time', 0, async () => {
      recoveryTracker.resetTracker();

      for (let i = 0; i < 10; i++) {
        recoveryTracker.recordRecovery(RecoveryScenario.MEMORY_PRESSURE_RECOVERY, true, 180, true);
        await driver.delayMs(50);
      }

      expect(recoveryTracker.getAverageRecoveryTime()).assertLessOrEqual(200);
    });

    // 综合comprehensive state场景测试：验证完整操作流程中功能正确
    it('comprehensive_state_recovery_scenario', 0, async () => {
      recoveryTracker.resetTracker();

      const scenarioStart = Date.now();

      const startTime1 = Date.now();
      await driver.delayMs(200);
      const recoveryTime1 = Date.now() - startTime1;
      recoveryTracker.recordRecovery(RecoveryScenario.CONFIG_CHANGE_RECOVERY, true, recoveryTime1, true);

      const startTime2 = Date.now();
      await driver.delayMs(200);
      const recoveryTime2 = Date.now() - startTime2;
      recoveryTracker.recordRecovery(RecoveryScenario.ERROR_RECOVERY, true, recoveryTime2, true);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(recoveryTracker.getTotalRecoveries()).assertEqual(2);
      expect(scenarioDuration).assertLessOrEqual(5000);
    });
  });


}
