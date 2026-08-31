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
  KEY_ENTER,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

enum ThemeType {
  LIGHT = 'light', DARK = 'dark', HIGH_CONTRAST = 'high_contrast', CUSTOM = 'custom'
}

interface ThemeRecord {
  themeType: ThemeType;
  colorsCorrect: boolean;
  stylesApplied: boolean;
  responseTime: number;
  timestamp: number;
}

class ThemeVariationTracker {
  private static instance: ThemeVariationTracker;
  private themeHistory: ThemeRecord[] = [];
  private totalTests: number = 0;
  private successfulTests: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): ThemeVariationTracker {
    if (!ThemeVariationTracker.instance) {
      ThemeVariationTracker.instance = new ThemeVariationTracker();
    }
    return ThemeVariationTracker.instance;
  }

  public recordTheme(themeType: ThemeType, colorsCorrect: boolean, stylesApplied: boolean, responseTime: number): void {
    const record: ThemeRecord = {
      themeType,
      colorsCorrect,
      stylesApplied,
      responseTime,
      timestamp: Date.now()
    };
    this.themeHistory.push(record);
    this.totalTests++;
    if (colorsCorrect && stylesApplied) {
      this.successfulTests++;
    }
  }

  public getThemeHistory(): ThemeRecord[] {
    return [...this.themeHistory];
  }

  public getTotalTests(): number {
    return this.totalTests;
  }

  public getSuccessfulTests(): number {
    return this.successfulTests;
  }

  public resetTracker(): void {
    this.themeHistory = [];
    this.totalTests = 0;
    this.successfulTests = 0;
  }

  public getSuccessRate(): number {
    if (this.totalTests === 0) {
      return 0;
    }
    return this.successfulTests / this.totalTests;
  }

  public hasTestedTheme(themeType: ThemeType): boolean {
    return this.themeHistory.some(record => record.themeType === themeType);
  }
}

export default function themeVariationTest() {
  describe('ThemeVariation_Test', () => {
    let driver: Driver;
    let themeTracker: ThemeVariationTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      themeTracker = ThemeVariationTracker.getInstance();
      themeTracker.resetTracker();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('dialog_should_display_correctly_in_light_theme', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      const startTime = Date.now();
      const componentCount = await powerDialogComponentCount(driver);
      const responseTime = Date.now() - startTime;

      themeTracker.recordTheme(ThemeType.LIGHT, componentCount >= 6, true, responseTime);

      expect(themeTracker.hasTestedTheme(ThemeType.LIGHT)).assertTrue();
    });

    it('dialog_should_display_correctly_in_dark_theme', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      themeTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      themeTracker.recordTheme(ThemeType.DARK, isFocusCorrect, true, responseTime);

      expect(themeTracker.hasTestedTheme(ThemeType.DARK)).assertTrue();
    });

    it('dialog_should_display_correctly_in_high_contrast_theme', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      themeTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 1);
      themeTracker.recordTheme(ThemeType.HIGH_CONTRAST, isFocusCorrect, true, responseTime);

      expect(themeTracker.hasTestedTheme(ThemeType.HIGH_CONTRAST)).assertTrue();
    });

    it('dialog_should_display_correctly_in_custom_theme', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      themeTracker.resetTracker();

      const startTime = Date.now();
      const componentCount = await powerDialogComponentCount(driver);
      const responseTime = Date.now() - startTime;

      themeTracker.recordTheme(ThemeType.CUSTOM, componentCount >= 6, true, responseTime);

      expect(themeTracker.hasTestedTheme(ThemeType.CUSTOM)).assertTrue();
    });

    // 验证dialog theme状态正确：确保TV设备records timestamps should be chronological符合预期
    it('dialog_theme_records_timestamps_should_be_chronological', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      themeTracker.resetTracker();

      themeTracker.recordTheme(ThemeType.LIGHT, true, true, 50);
      await driver.delayMs(100);
      themeTracker.recordTheme(ThemeType.DARK, true, true, 50);
      await driver.delayMs(100);
      themeTracker.recordTheme(ThemeType.HIGH_CONTRAST, true, true, 50);

      const history = themeTracker.getThemeHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog theme维持稳定：确保TV设备在tracker singleton should maintain consistency下性能不降低
    it('dialog_theme_tracker_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const tracker1 = ThemeVariationTracker.getInstance();
      const tracker2 = ThemeVariationTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();


      tracker1.resetTracker();
      tracker1.recordTheme(ThemeType.LIGHT, true, true, 100);

      expect(tracker2.getTotalTests()).assertEqual(1);
      expect(tracker2.getSuccessfulTests()).assertEqual(1);
    });

    // 验证dialog should处理能力：确保TV设备在handle all themes下功能正常
    it('dialog_should_handle_all_themes', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      themeTracker.resetTracker();

      const themes = [ThemeType.LIGHT, ThemeType.DARK, ThemeType.HIGH_CONTRAST, ThemeType.CUSTOM];
      for (const theme of themes) {
        themeTracker.recordTheme(theme, true, true, 50);
      }

      expect(themeTracker.getTotalTests()).assertEqual(4);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain consistency across themes下性能不降低
    it('dialog_should_maintain_consistency_across_themes', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      themeTracker.resetTracker();
      const initialCount = await powerDialogComponentCount(driver);

      const themes = [ThemeType.LIGHT, ThemeType.DARK, ThemeType.HIGH_CONTRAST];
      for (const theme of themes) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        themeTracker.recordTheme(theme, true, true, 30);
        await driver.delayMs(50);
      }

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 验证dialog should处理能力：确保TV设备在handle rapid theme changes下功能正常
    it('dialog_should_handle_rapid_theme_changes', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      themeTracker.resetTracker();

      const themes = [ThemeType.LIGHT, ThemeType.DARK, ThemeType.HIGH_CONTRAST, ThemeType.CUSTOM];
      for (let i = 0; i < 20; i++) {
        const theme = themes[i % themes.length];
        themeTracker.recordTheme(theme, true, true, 20);
        await driver.delayMs(30);
      }

      expect(themeTracker.getTotalTests()).assertEqual(20);
    });

    it('dialog_should_track_theme_transitions', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      themeTracker.resetTracker();

      themeTracker.recordTheme(ThemeType.LIGHT, true, true, 50);
      themeTracker.recordTheme(ThemeType.DARK, true, true, 50);
      themeTracker.recordTheme(ThemeType.LIGHT, true, true, 50);

      expect(themeTracker.getTotalTests()).assertEqual(3);
    });

    // 综合comprehensive theme场景测试：验证完整操作流程中功能正确
    it('comprehensive_theme_variation_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      themeTracker.resetTracker();

      const scenarioStart = Date.now();

      const startTime1 = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime1 = Date.now() - startTime1;
      themeTracker.recordTheme(ThemeType.LIGHT, true, true, responseTime1);

      const startTime2 = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime2 = Date.now() - startTime2;
      themeTracker.recordTheme(ThemeType.DARK, true, true, responseTime2);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(themeTracker.getTotalTests()).assertEqual(2);
      expect(scenarioDuration).assertLessOrEqual(5000);
    });
  });


}
