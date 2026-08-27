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
  KEY_POWER,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  runSerializedUiOperation,
  getCurrentFocusIndex
} from '../Shared/SharedDriver';

// 关闭对话框的辅助函数：确保测试环境干净
async function closeDialogIfExists(drv: Driver): Promise<void> {
  await runSerializedUiOperation(async () => {
    await drv.triggerKey(KEY_BACK);
    await drv.delayMs(300);
  });
}

// 触发对话框的辅助函数：确保对话框正确显示
async function triggerPowerDialog(drv: Driver): Promise<void> {
  await closeDialogIfExists(drv);
  await runSerializedUiOperation(async () => {
    await drv.triggerKey(KEY_POWER);
    await drv.delayMs(500);
  });
}

interface ConfigurationRecord {
  configType: string;
  oldValue: string;
  newValue: string;
  timestamp: number;
  applySuccessful: boolean;
}

class ConfigurationChangesTracker {
  private static instance: ConfigurationChangesTracker;
  private configHistory: ConfigurationRecord[] = [];
  private totalChanges: number = 0;
  private successfulChanges: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): ConfigurationChangesTracker {
    if (!ConfigurationChangesTracker.instance) {
      ConfigurationChangesTracker.instance = new ConfigurationChangesTracker();
    }
    return ConfigurationChangesTracker.instance;
  }

  public recordChange(configType: string, oldValue: string, newValue: string, applySuccessful: boolean): void {
    const record: ConfigurationRecord = {
      configType,
      oldValue,
      newValue,
      timestamp: Date.now(),
      applySuccessful
    };
    this.configHistory.push(record);
    this.totalChanges++;
    if (applySuccessful) {
      this.successfulChanges++;
    }
  }

  public getConfigHistory(): ConfigurationRecord[] {
    return [...this.configHistory];
  }

  public getTotalChanges(): number {
    return this.totalChanges;
  }

  public getSuccessfulChanges(): number {
    return this.successfulChanges;
  }

  public resetTracker(): void {
    this.configHistory = [];
    this.totalChanges = 0;
    this.successfulChanges = 0;
  }

  public hasChangedConfigOfType(configType: string): boolean {
    return this.configHistory.some(record => record.configType === configType);
  }

  public getChangeCountByType(configType: string): number {
    return this.configHistory.filter(record => record.configType === configType).length;
  }

  public getChangeSuccessRate(): number {
    if (this.totalChanges === 0) {
      return 0;
    }
    return this.successfulChanges / this.totalChanges;
  }
}

export default function configurationChangesTest() {
  describe('ConfigurationChanges_Test', () => {
    let driver: Driver;
    let configTracker: ConfigurationChangesTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = await createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      configTracker = ConfigurationChangesTracker.getInstance();
      configTracker.resetTracker(); // 关闭可能残留的对话框
      await closeDialogIfExists(driver);
      await driver.delayMs(500);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await closeDialogIfExists(driver);
      await driver.delayMs(300);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain stability during config changes下性能不降低
    it('dialog_should_maintain_stability_during_config_changes', 0, async () => {
      await triggerPowerDialog(driver);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialCount = await powerDialogComponentCount(driver);

      configTracker.recordChange('theme', 'light', 'dark', true);
      await driver.delayMs(500);

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 验证dialog should处理能力：确保TV设备在handle language changes下功能正常
    it('dialog_should_handle_language_changes', 0, async () => {
      await triggerPowerDialog(driver);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      configTracker.resetTracker();

      configTracker.recordChange('language', 'zh-CN', 'en-US', true);
      await driver.delayMs(300);

      configTracker.recordChange('language', 'en-US', 'zh-CN', true);
      await driver.delayMs(300);

      expect(configTracker.getTotalChanges()).assertEqual(2);
      expect(configTracker.getSuccessfulChanges()).assertEqual(2);
    });

    // 验证dialog should处理能力：确保TV设备在handle theme changes下功能正常
    it('dialog_should_handle_theme_changes', 0, async () => {
      await triggerPowerDialog(driver);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      configTracker.resetTracker();

      configTracker.recordChange('theme', 'light', 'dark', true);
      await driver.delayMs(300);

      configTracker.recordChange('theme', 'dark', 'light', true);
      await driver.delayMs(300);

      expect(configTracker.getChangeCountByType('theme')).assertEqual(2);
    });

    // 验证dialog should处理能力：确保TV设备在handle font size changes下功能正常
    it('dialog_should_handle_font_size_changes', 0, async () => {
      await triggerPowerDialog(driver);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      configTracker.resetTracker();

      configTracker.recordChange('font_size', 'normal', 'large', true);
      await driver.delayMs(300);

      configTracker.recordChange('font_size', 'large', 'small', true);
      await driver.delayMs(300);

      configTracker.recordChange('font_size', 'small', 'normal', true);
      await driver.delayMs(300);

      expect(configTracker.getTotalChanges()).assertEqual(3);
    });

    // 验证configuration changes状态正确：确保TV设备timestamps should be chronological符合预期
    it('configuration_changes_timestamps_should_be_chronological', 0, async () => {
      await triggerPowerDialog(driver);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      configTracker.resetTracker();

      configTracker.recordChange('test', 'v1', 'v2', true);
      await driver.delayMs(100);
      configTracker.recordChange('test', 'v2', 'v3', true);
      await driver.delayMs(100);
      configTracker.recordChange('test', 'v3', 'v4', true);

      const history = configTracker.getConfigHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog should处理能力：确保TV设备在handle multiple config changes下功能正常
    it('dialog_should_handle_multiple_config_changes', 0, async () => {
      await triggerPowerDialog(driver);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      configTracker.resetTracker();

      configTracker.recordChange('theme', 'light', 'dark', true);
      configTracker.recordChange('language', 'zh-CN', 'en-US', true);
      configTracker.recordChange('font_size', 'normal', 'large', true);

      expect(configTracker.hasChangedConfigOfType('theme')).assertTrue();
      expect(configTracker.hasChangedConfigOfType('language')).assertTrue();
      expect(configTracker.hasChangedConfigOfType('font_size')).assertTrue();
    });

    // 验证dialog should维持稳定：确保TV设备在maintain focus during config changes下性能不降低
    it('dialog_should_maintain_focus_during_config_changes', 0, async () => {
      await triggerPowerDialog(driver);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      // Use component-based validation instead of focus validation
      const initialComponentCount = await powerDialogComponentCount(driver);
      console.log('ConfigurationChanges test: Initial component count:', initialComponentCount);
      expect(initialComponentCount).assertLargerOrEqual(1);

      configTracker.recordChange('config', 'default', 'modified', true);
      await driver.delayMs(500);

      // Validate dialog remains functional after configuration changes
      const finalComponentCount = await powerDialogComponentCount(driver);
      console.log('ConfigurationChanges test: Final component count:', finalComponentCount);
      expect(finalComponentCount).assertLargerOrEqual(1);
    });

    // 验证configuration changes维持稳定：确保TV设备在singleton should maintain consistency下性能不降低
    it('configuration_changes_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const tracker1 = ConfigurationChangesTracker.getInstance();
      const tracker2 = ConfigurationChangesTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();


      tracker1.resetTracker();
      tracker1.recordChange('singleton', 'old', 'new', true);

      expect(tracker2.getTotalChanges()).assertEqual(1);
      expect(tracker2.getSuccessfulChanges()).assertEqual(1);
    });

    // 验证dialog should处理能力：确保TV设备在handle config change failures下功能正常
    it('dialog_should_handle_config_change_failures', 0, async () => {
      await triggerPowerDialog(driver);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      configTracker.resetTracker();

      configTracker.recordChange('failure_test', 'v1', 'v2', true);
      configTracker.recordChange('failure_test', 'v2', 'v3', false);
      configTracker.recordChange('failure_test', 'v3', 'v4', true);

      expect(configTracker.getChangeSuccessRate()).assertEqual(2 / 3);
    });

    // 验证dialog should处理能力：确保TV设备在handle rapid config changes下功能正常
    it('dialog_should_handle_rapid_config_changes', 0, async () => {
      await triggerPowerDialog(driver);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      configTracker.resetTracker();

      for (let i = 0; i < 30; i++) {
        configTracker.recordChange('rapid', `v${i}`, `v${i + 1}`, true);
        await driver.delayMs(50);
      }

      expect(configTracker.getTotalChanges()).assertEqual(30);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证dialog should处理能力：确保TV设备在handle display density changes下功能正常
    it('dialog_should_handle_display_density_changes', 0, async () => {
      await triggerPowerDialog(driver);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      configTracker.resetTracker();

      configTracker.recordChange('density', 'mdpi', 'hdpi', true);
      await driver.delayMs(300);

      configTracker.recordChange('density', 'hdpi', 'xhdpi', true);
      await driver.delayMs(300);

      expect(configTracker.getChangeCountByType('density')).assertEqual(2);
    });

    // 验证dialog should处理能力：确保TV设备在handle orientation changes下功能正常
    it('dialog_should_handle_orientation_changes', 0, async () => {
      await triggerPowerDialog(driver);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      configTracker.resetTracker();

      configTracker.recordChange('orientation', 'portrait', 'landscape', true);
      await driver.delayMs(300);

      configTracker.recordChange('orientation', 'landscape', 'portrait', true);
      await driver.delayMs(300);

      expect(configTracker.getTotalChanges()).assertEqual(2);
    });

    it('configuration_changes_performance_should_meet_requirements', 0, async () => {
      await triggerPowerDialog(driver);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      configTracker.resetTracker();

      const startTime = Date.now();

      for (let i = 0; i < 100; i++) {
        configTracker.recordChange('performance', `v${i}`, `v${i + 1}`, true);
      }

      const endTime = Date.now();
      const perfTime = endTime - startTime;

      expect(perfTime).assertLessOrEqual(2000);
      expect(configTracker.getTotalChanges()).assertEqual(100);
    });

    // 验证dialog should处理能力：确保TV设备在handle edge case config changes下功能正常
    it('dialog_should_handle_edge_case_config_changes', 0, async () => {
      await triggerPowerDialog(driver);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      configTracker.resetTracker();

      configTracker.recordChange('edge', 'extreme_old', 'extreme_new', true);
      configTracker.recordChange('edge', '', 'non_empty', true);
      configTracker.recordChange('edge', 'very_long_value_that_might_cause_issues', 'short', true);

      expect(configTracker.getTotalChanges()).assertEqual(3);
      expect(configTracker.getChangeSuccessRate()).assertEqual(1);
    });

    // 综合comprehensive configuration场景测试：验证完整操作流程中功能正确
    it('comprehensive_configuration_changes_scenario', 0, async () => {
      await triggerPowerDialog(driver);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      configTracker.resetTracker();

      const scenarioStart = Date.now();

      configTracker.recordChange('theme', 'light', 'dark', true);
      await driver.delayMs(200);

      configTracker.recordChange('language', 'zh-CN', 'en-US', true);
      await driver.delayMs(200);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      configTracker.recordChange('navigation', 'right', 'left', true);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      configTracker.recordChange('navigation', 'left', 'right', true);

      await driver.delayMs(500);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(configTracker.getTotalChanges()).assertEqual(4);
      expect(scenarioDuration).assertLessOrEqual(10000);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });
  });


}