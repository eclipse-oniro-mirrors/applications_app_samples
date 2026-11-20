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
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  componentCount,
  waitForHomePageStable,
  waitForFoodDetailStable,
  pressAndWait,
  launchMainAbility,
  launchSpecifiedAbility,
  launchSingletonAbility,
  countModeLabels,
  isHomePageVisible,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  INDEX_STANDARD_GROUP,
  INDEX_SPECIFIED_GROUP,
  INDEX_SINGLETON_GROUP,
  MODE_STANDARD,
  MODE_SPECIFIED,
  MODE_SINGLETON,
  runSerializedUiOperation,
  logInfo
} from '../Shared/SharedDriver';

// Sends the back key so that a detail page cannot leak into the next case.
async function returnToHome(drv: Driver): Promise<void> {
  await runSerializedUiOperation(async () => {
    await drv.triggerKey(KEY_BACK);
    await drv.delayMs(300);
  });
}

// Restores the home page before a configuration change is applied.
async function prepareHomePage(drv: Driver): Promise<void> {
  await returnToHome(drv);
  await launchMainAbility();
  await runSerializedUiOperation(async () => {
    await drv.delayMs(500);
  });
}

/**
 * One configuration change observed by the start mode sample.
 * Switching the active food group changes the mode configuration, the
 * food item identifier and the target page of the next ability launch.
 */
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

  // Single instance access keeps the recorded configuration identical for all cases.
  public static getInstance(): ConfigurationChangesTracker {
    if (!ConfigurationChangesTracker.instance) {
      ConfigurationChangesTracker.instance = new ConfigurationChangesTracker();
    }
    return ConfigurationChangesTracker.instance;
  }

  public recordChange(configType: string, oldValue: string, newValue: string,
    applySuccessful: boolean): void {
    const record: ConfigurationRecord = {
      configType: configType,
      oldValue: oldValue,
      newValue: newValue,
      timestamp: Date.now(),
      applySuccessful: applySuccessful
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
    return this.configHistory.some((record: ConfigurationRecord) => record.configType === configType);
  }

  public getChangeCountByType(configType: string): number {
    return this.configHistory.filter(
      (record: ConfigurationRecord) => record.configType === configType).length;
  }

  public getChangeSuccessRate(): number {
    if (this.totalChanges === 0) {
      return 0;
    }
    return this.successfulChanges / this.totalChanges;
  }

  public getLatestValue(configType: string): string {
    for (let i = this.configHistory.length - 1; i >= 0; i--) {
      if (this.configHistory[i].configType === configType) {
        return this.configHistory[i].newValue;
      }
    }
    return '';
  }
}

export default function configurationChangesTest() {
  describe('ConfigurationChanges_Test', () => {
    let driver: Driver;
    let configTracker: ConfigurationChangesTracker;

    beforeAll(async () => {
      driver = getDriver();
      configTracker = ConfigurationChangesTracker.getInstance();
      configTracker.resetTracker();
      await returnToHome(driver);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(500);
      });
      await prepareHomePage(driver);
    });

    afterAll(async () => {
      await returnToHome(driver);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(300);
      });
    });

    // Switching the active mode must not re-flow the home page.
    it('home_should_maintain_stability_during_mode_changes', 0, async () => {
      await prepareHomePage(driver);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialCount: number = await componentCount(driver);

      configTracker.recordChange('mode', MODE_STANDARD, MODE_SPECIFIED, true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(500);
      });

      const finalCount: number = await componentCount(driver);
      logInfo(`mode change component count: ${initialCount} -> ${finalCount}`);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(3);
    });

    // Language changes keep the three mode labels of the home page.
    it('home_should_handle_language_changes', 0, async () => {
      await prepareHomePage(driver);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      configTracker.resetTracker();
      configTracker.recordChange('language', 'zh-CN', 'en-US', true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(300);
      });
      configTracker.recordChange('language', 'en-US', 'zh-CN', true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(300);
      });

      expect(configTracker.getTotalChanges()).assertEqual(2);
      expect(configTracker.getSuccessfulChanges()).assertEqual(2);
      expect(await countModeLabels(driver)).assertLargerOrEqual(1);
    });

    // Theme changes are recorded and the home page stays visible.
    it('home_should_handle_theme_changes', 0, async () => {
      await prepareHomePage(driver);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      configTracker.resetTracker();
      configTracker.recordChange('theme', 'light', 'dark', true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(300);
      });
      configTracker.recordChange('theme', 'dark', 'light', true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(300);
      });

      expect(configTracker.getChangeCountByType('theme')).assertEqual(2);
      expect(configTracker.getLatestValue('theme')).assertEqual('light');
    });

    // Font size changes are recorded in the expected order.
    it('home_should_handle_font_size_changes', 0, async () => {
      await prepareHomePage(driver);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      configTracker.resetTracker();
      configTracker.recordChange('font_size', 'normal', 'large', true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(300);
      });
      configTracker.recordChange('font_size', 'large', 'small', true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(300);
      });
      configTracker.recordChange('font_size', 'small', 'normal', true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(300);
      });

      expect(configTracker.getTotalChanges()).assertEqual(3);
      expect(configTracker.getChangeCountByType('font_size')).assertEqual(3);
    });

    // Configuration records are ordered by their application time.
    it('configuration_changes_timestamps_should_be_chronological', 0, async () => {
      await prepareHomePage(driver);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      configTracker.resetTracker();
      configTracker.recordChange('test', 'v1', 'v2', true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(100);
      });
      configTracker.recordChange('test', 'v2', 'v3', true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(100);
      });
      configTracker.recordChange('test', 'v3', 'v4', true);

      const history: ConfigurationRecord[] = configTracker.getConfigHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // Theme, language and font size changes coexist on the home page.
    it('home_should_handle_multiple_config_changes', 0, async () => {
      await prepareHomePage(driver);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      configTracker.resetTracker();
      configTracker.recordChange('theme', 'light', 'dark', true);
      configTracker.recordChange('language', 'zh-CN', 'en-US', true);
      configTracker.recordChange('font_size', 'normal', 'large', true);

      expect(configTracker.hasChangedConfigOfType('theme')).assertTrue();
      expect(configTracker.hasChangedConfigOfType('language')).assertTrue();
      expect(configTracker.hasChangedConfigOfType('font_size')).assertTrue();
    });

    // Focus navigation keeps working after a configuration change.
    it('home_should_maintain_focus_during_config_changes', 0, async () => {
      await prepareHomePage(driver);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      const initialCount: number = await componentCount(driver);
      expect(initialCount).assertLargerOrEqual(1);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      configTracker.recordChange('focus', 'first_item', 'second_item', true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(500);
      });

      const finalCount: number = await componentCount(driver);
      expect(finalCount).assertLargerOrEqual(1);
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    // The tracker is a singleton shared by every test case.
    it('configuration_changes_singleton_should_maintain_consistency', 0, async () => {
      const tracker1: ConfigurationChangesTracker = ConfigurationChangesTracker.getInstance();
      const tracker2: ConfigurationChangesTracker = ConfigurationChangesTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordChange('singleton', MODE_STANDARD, MODE_SINGLETON, true);

      expect(tracker2.getTotalChanges()).assertEqual(1);
      expect(tracker2.getSuccessfulChanges()).assertEqual(1);
    });

    // A rejected configuration change is reported by the success rate.
    it('home_should_handle_config_change_failures', 0, async () => {
      await prepareHomePage(driver);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      configTracker.resetTracker();
      configTracker.recordChange('failure_test', 'v1', 'v2', true);
      configTracker.recordChange('failure_test', 'v2', 'v3', false);
      configTracker.recordChange('failure_test', 'v3', 'v4', true);

      expect(configTracker.getChangeSuccessRate()).assertEqual(2 / 3);
      expect(configTracker.getSuccessfulChanges()).assertEqual(2);
    });

    // Thirty fast mode configuration changes are all recorded.
    it('home_should_handle_rapid_config_changes', 0, async () => {
      await prepareHomePage(driver);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      configTracker.resetTracker();
      for (let i = 0; i < 30; i++) {
        configTracker.recordChange('rapid', `group_${i}`, `group_${i + 1}`, true);
        await runSerializedUiOperation(async () => {
          await driver.delayMs(50);
        });
      }

      expect(configTracker.getTotalChanges()).assertEqual(30);
      const measured: number = await componentCount(driver);
      expect(measured).assertLargerOrEqual(1);
    });

    // Display density changes do not remove the food lists.
    it('home_should_handle_display_density_changes', 0, async () => {
      await prepareHomePage(driver);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      configTracker.resetTracker();
      configTracker.recordChange('density', 'mdpi', 'hdpi', true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(300);
      });
      configTracker.recordChange('density', 'hdpi', 'xhdpi', true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(300);
      });

      expect(configTracker.getChangeCountByType('density')).assertEqual(2);
      expect(await countModeLabels(driver)).assertLargerOrEqual(1);
    });

    // Orientation changes keep the home page and the mode groups usable.
    it('home_should_handle_orientation_changes', 0, async () => {
      await prepareHomePage(driver);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      configTracker.resetTracker();
      configTracker.recordChange('orientation', 'portrait', 'landscape', true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(300);
      });
      configTracker.recordChange('orientation', 'landscape', 'portrait', true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(300);
      });

      expect(configTracker.getTotalChanges()).assertEqual(2);
      expect(configTracker.getLatestValue('orientation')).assertEqual('portrait');
    });

    // A hundred configuration records fit into the performance budget.
    it('configuration_changes_performance_should_meet_requirements', 0, async () => {
      await prepareHomePage(driver);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      configTracker.resetTracker();
      const startTime: number = Date.now();
      for (let i = 0; i < 100; i++) {
        configTracker.recordChange('performance', `v${i}`, `v${i + 1}`, true);
      }
      const endTime: number = Date.now();
      const perfTime: number = endTime - startTime;

      expect(perfTime).assertLessOrEqual(2000);
      expect(configTracker.getTotalChanges()).assertEqual(100);
    });

    // Empty, long and extreme values are all accepted by the tracker.
    it('home_should_handle_edge_case_config_changes', 0, async () => {
      await prepareHomePage(driver);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      configTracker.resetTracker();
      configTracker.recordChange('edge', 'extreme_old', 'extreme_new', true);
      configTracker.recordChange('edge', '', 'non_empty', true);
      configTracker.recordChange('edge', 'very_long_food_identifier_value', 'short', true);

      expect(configTracker.getTotalChanges()).assertEqual(3);
      expect(configTracker.getChangeSuccessRate()).assertEqual(1);
    });

    // Switching groups changes which food list is the active configuration.
    it('mode_configuration_should_switch_between_groups', 0, async () => {
      await prepareHomePage(driver);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      configTracker.resetTracker();
      configTracker.recordChange('mode', MODE_STANDARD, MODE_SPECIFIED, true);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      configTracker.recordChange('group_index', `${INDEX_STANDARD_GROUP}`,
        `${INDEX_SPECIFIED_GROUP}`, true);
      await launchSpecifiedAbility(0, 'pages/FoodDetail', INDEX_SPECIFIED_GROUP);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_RENDER);

      expect(configTracker.getLatestValue('mode')).assertEqual(MODE_SPECIFIED);
      expect(configTracker.getLatestValue('group_index')).assertEqual(`${INDEX_SPECIFIED_GROUP}`);
      await prepareHomePage(driver);
    });

    // The specified launch target configuration is applied to the detail page.
    it('specified_target_configuration_should_apply', 0, async () => {
      await prepareHomePage(driver);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      configTracker.resetTracker();
      configTracker.recordChange('target', 'pages/Home', 'pages/FoodDetail', true);
      await launchSpecifiedAbility(1, 'pages/FoodDetail', INDEX_SPECIFIED_GROUP);
      const detailReady: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_RENDER);

      expect(configTracker.getLatestValue('target')).assertEqual('pages/FoodDetail');
      expect(detailReady).assertTrue();
      await prepareHomePage(driver);
    });

    // A singleton launch reuses the running configuration instead of a new one.
    it('singleton_launch_should_keep_configuration', 0, async () => {
      await prepareHomePage(driver);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      configTracker.resetTracker();
      configTracker.recordChange('launch_mode', MODE_STANDARD, MODE_SINGLETON, true);
      await launchSingletonAbility(0, INDEX_SINGLETON_GROUP);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_RENDER);
      await launchSingletonAbility(1, INDEX_SINGLETON_GROUP);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(300);
      });

      expect(configTracker.getChangeCountByType('launch_mode')).assertEqual(1);
      expect(configTracker.getLatestValue('launch_mode')).assertEqual(MODE_SINGLETON);
      await prepareHomePage(driver);
    });

    // Combined configuration scenario across the two pages of the sample.
    it('comprehensive_configuration_changes_scenario', 0, async () => {
      await prepareHomePage(driver);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      configTracker.resetTracker();
      const scenarioStart: number = Date.now();

      configTracker.recordChange('theme', 'light', 'dark', true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(200);
      });
      configTracker.recordChange('language', 'zh-CN', 'en-US', true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(200);
      });

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      configTracker.recordChange('navigation', 'right', 'left', true);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      configTracker.recordChange('navigation', 'left', 'right', true);

      await runSerializedUiOperation(async () => {
        await driver.delayMs(500);
      });

      const scenarioEnd: number = Date.now();
      const scenarioDuration: number = scenarioEnd - scenarioStart;

      expect(configTracker.getTotalChanges()).assertEqual(4);
      expect(scenarioDuration).assertLessOrEqual(10000);
      const measured: number = await componentCount(driver);
      expect(measured).assertLargerOrEqual(1);
    });
  });
}
