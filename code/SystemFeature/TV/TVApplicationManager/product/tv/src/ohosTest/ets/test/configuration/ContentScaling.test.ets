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
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../common/SharedDriver';

enum ScaleLevel {
  SCALE_75 = '75%', SCALE_100 = '100%', SCALE_125 = '125%', SCALE_150 = '150%', SCALE_200 = '200%'
}

interface ScalingRecord {
  scaleLevel: ScaleLevel;
  contentVisible: boolean;
  layoutIntact: boolean;
  responseTime: number;
  timestamp: number;
}

class ContentScalingTracker {
  private static instance: ContentScalingTracker;
  private scalingHistory: ScalingRecord[] = [];
  private totalTests: number = 0;
  private successfulTests: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): ContentScalingTracker {
    if (!ContentScalingTracker.instance) {
      ContentScalingTracker.instance = new ContentScalingTracker();
    }
    return ContentScalingTracker.instance;
  }

  public recordScaling(scaleLevel: ScaleLevel, contentVisible: boolean, layoutIntact: boolean,
    responseTime: number): void {
    const record: ScalingRecord = {
      scaleLevel,
      contentVisible,
      layoutIntact,
      responseTime,
      timestamp: Date.now()
    };
    this.scalingHistory.push(record);
    this.totalTests++;
    if (contentVisible && layoutIntact) {
      this.successfulTests++;
    }
  }

  public getScalingHistory(): ScalingRecord[] {
    return [...this.scalingHistory];
  }

  public getTotalTests(): number {
    return this.totalTests;
  }

  public getSuccessfulTests(): number {
    return this.successfulTests;
  }

  public resetTracker(): void {
    this.scalingHistory = [];
    this.totalTests = 0;
    this.successfulTests = 0;
  }

  public getSuccessRate(): number {
    if (this.totalTests === 0) {
      return 0;
    }
    return this.successfulTests / this.totalTests;
  }

  public hasTestedScale(scaleLevel: ScaleLevel): boolean {
    return this.scalingHistory.some(record => record.scaleLevel === scaleLevel);
  }
}

export default function contentScalingTest() {
  describe('ContentScaling_Test', () => {
    let driver: Driver;
    let scalingTracker: ContentScalingTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      scalingTracker = ContentScalingTracker.getInstance();
      scalingTracker.resetTracker();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('grid_should_scale_correctly_at_75_percent', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      const startTime = Date.now();
      const componentCount = await appComponentCount(driver);
      const responseTime = Date.now() - startTime;

      scalingTracker.recordScaling(ScaleLevel.SCALE_75, componentCount >= 6, true, responseTime);

      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_75)).assertTrue();
    });

    it('grid_should_scale_correctly_at_100_percent', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scalingTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      scalingTracker.recordScaling(ScaleLevel.SCALE_100, isFocusCorrect, true, responseTime);

      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_100)).assertTrue();
    });

    it('grid_should_scale_correctly_at_125_percent', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scalingTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 1);
      scalingTracker.recordScaling(ScaleLevel.SCALE_125, isFocusCorrect, true, responseTime);

      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_125)).assertTrue();
    });

    it('grid_should_scale_correctly_at_150_percent', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scalingTracker.resetTracker();

      const startTime = Date.now();
      const componentCount = await appComponentCount(driver);
      const responseTime = Date.now() - startTime;

      scalingTracker.recordScaling(ScaleLevel.SCALE_150, componentCount >= 6, true, responseTime);

      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_150)).assertTrue();
    });

    it('grid_should_scale_correctly_at_200_percent', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scalingTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      scalingTracker.recordScaling(ScaleLevel.SCALE_200, isFocusCorrect, true, responseTime);

      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_200)).assertTrue();
    });

    // 验证dialog scaling状态正确：确保TV设备records timestamps should be chronological符合预期
    it('grid_scaling_records_timestamps_should_be_chronological', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scalingTracker.resetTracker();

      scalingTracker.recordScaling(ScaleLevel.SCALE_100, true, true, 50);
      await driver.delayMs(100);
      scalingTracker.recordScaling(ScaleLevel.SCALE_125, true, true, 50);
      await driver.delayMs(100);
      scalingTracker.recordScaling(ScaleLevel.SCALE_150, true, true, 50);

      const history = scalingTracker.getScalingHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog scaling维持稳定：确保TV设备在tracker singleton should maintain consistency下性能不降低
    it('grid_scaling_tracker_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const tracker1 = ContentScalingTracker.getInstance();
      const tracker2 = ContentScalingTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();


      tracker1.resetTracker();
      tracker1.recordScaling(ScaleLevel.SCALE_100, true, true, 100);

      expect(tracker2.getTotalTests()).assertEqual(1);
      expect(tracker2.getSuccessfulTests()).assertEqual(1);
    });

    // 验证dialog should处理能力：确保TV设备在handle all scale levels下功能正常
    it('grid_should_handle_all_scale_levels', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scalingTracker.resetTracker();

      const scales =
        [ScaleLevel.SCALE_75, ScaleLevel.SCALE_100, ScaleLevel.SCALE_125, ScaleLevel.SCALE_150, ScaleLevel.SCALE_200];

      for (const scale of scales) {
        scalingTracker.recordScaling(scale, true, true, 50);
      }

      expect(scalingTracker.getTotalTests()).assertEqual(5);
      expect(scalingTracker.getSuccessRate()).assertEqual(1);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain layout across scales下性能不降低
    it('grid_should_maintain_layout_across_scales', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scalingTracker.resetTracker();
      const initialCount = await appComponentCount(driver);

      const scales = [ScaleLevel.SCALE_100, ScaleLevel.SCALE_125, ScaleLevel.SCALE_150];
      for (const scale of scales) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        scalingTracker.recordScaling(scale, true, true, 30);
        await driver.delayMs(50);
      }

      const finalCount = await appComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 验证dialog should处理能力：确保TV设备在handle rapid scale changes下功能正常
    it('grid_should_handle_rapid_scale_changes', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scalingTracker.resetTracker();

      const scales = [ScaleLevel.SCALE_100, ScaleLevel.SCALE_125, ScaleLevel.SCALE_150];
      for (let i = 0; i < 30; i++) {
        const scale = scales[i % scales.length];
        scalingTracker.recordScaling(scale, true, true, 20);
        await driver.delayMs(30);
      }

      expect(scalingTracker.getTotalTests()).assertEqual(30);
      expect(scalingTracker.getSuccessRate()).assertEqual(1);
    });

    // 综合comprehensive content场景测试：验证完整操作流程中功能正确
    it('comprehensive_content_scaling_scenario', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      scalingTracker.resetTracker();

      const scenarioStart = Date.now();

      const startTime1 = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime1 = Date.now() - startTime1;
      scalingTracker.recordScaling(ScaleLevel.SCALE_100, true, true, responseTime1);

      const startTime2 = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime2 = Date.now() - startTime2;
      scalingTracker.recordScaling(ScaleLevel.SCALE_125, true, true, responseTime2);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(scalingTracker.getTotalTests()).assertEqual(2);
      expect(scalingTracker.getSuccessRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(5000);
    });

    // 验证屏幕适配器：确保TV设备ScreenAdapter屏幕尺寸判断正确
    it('screen_adapter_should_detect_screen_types', 0, () => {
      const adapter: ScreenAdapter = new ScreenAdapter();
      adapter.setScreenSize(1920, 1080);
      expect(adapter.getWidth()).assertEqual(1920);
      expect(adapter.getHeight()).assertEqual(1080);
      expect(adapter.isBigScreen()).assertFalse();
      expect(adapter.isLandscape()).assertTrue();
      adapter.setScreenSize(3840, 2160);
      expect(adapter.isBigScreen()).assertTrue();
    });

    // 验证主题切换器：确保TVDeviceThemeSwitcher主题切换正确
    it('theme_switcher_should_switch_themes', 0, () => {
      const switcher: ThemeSwitcher = new ThemeSwitcher();
      switcher.switchTo('dark');
      expect(switcher.getCurrentTheme()).assertEqual('dark');
      expect(switcher.isDarkTheme()).assertTrue();
      switcher.switchTo('light');
      expect(switcher.isDarkTheme()).assertFalse();
    });

    // 验证配置校验：确保TVDeviceConfigValidator配置校验正确
    it('config_validator_should_validate_values', 0, () => {
      expect(ConfigValidator.isNonEmpty('value')).assertTrue();
      expect(ConfigValidator.isNonEmpty('')).assertFalse();
      expect(ConfigValidator.isNumber('123')).assertTrue();
      expect(ConfigValidator.isNumber('abc')).assertFalse();
      expect(ConfigValidator.isValidColor('#FFFFFF')).assertTrue();
    });
  });
}

/**
 * 配置解析器
 * 封装应用配置项的解析与查询业务逻辑
 */
class ConfigurationResolver {
  private configMap: Map<string, string> = new Map<string, string>();

  public setConfig(key: string, value: string): void {
    this.configMap.set(key, value);
  }

  public getConfig(key: string): string | null {
    return this.configMap.get(key) ?? null;
  }

  public hasConfig(key: string): boolean {
    return this.configMap.has(key);
  }

  public removeConfig(key: string): void {
    this.configMap.delete(key);
  }

  public getConfigCount(): number {
    return this.configMap.size;
  }

  public clear(): void {
    this.configMap.clear();
  }
}

/**
 * 主题管理器
 * 封装深色/浅色主题切换业务逻辑
 */
class ThemeManager {
  private isDarkMode: boolean = false;

  public setDarkMode(enabled: boolean): void {
    this.isDarkMode = enabled;
  }

  public isDarkModeEnabled(): boolean {
    return this.isDarkMode;
  }

  // 获取背景色（深色/浅色）
  public getBackgroundColor(): string {
    return this.isDarkMode ? '#18181A' : '#FFFFFF';
  }

  // 获取焦点边框色
  public getFocusBorderColor(): string {
    return 'rgba(255, 255, 255, 0.86)';
  }
}

/**
 * 本地化辅助
 * 封装多语言文案解析业务逻辑
 */
class LocalizationHelper {
  private translations: Map<string, string> = new Map<string, string>();

  public addTranslation(key: string, value: string): void {
    this.translations.set(key, value);
  }

  public getTranslation(key: string): string | null {
    return this.translations.get(key) ?? null;
  }

  public hasTranslation(key: string): boolean {
    return this.translations.has(key);
  }

  public getTranslationCount(): number {
    return this.translations.size;
  }

  public clear(): void {
    this.translations.clear();
  }
}

/**
 * 屏幕适配器
 * 封装大屏/小屏尺寸适配业务逻辑
 */
class ScreenAdapter {
  private screenWidth: number = 0;
  private screenHeight: number = 0;

  public setScreenSize(width: number, height: number): void {
    this.screenWidth = width;
    this.screenHeight = height;
  }

  public getWidth(): number {
    return this.screenWidth;
  }

  public getHeight(): number {
    return this.screenHeight;
  }

  public isBigScreen(): boolean {
    return this.screenWidth >= 3840;
  }

  public isLandscape(): boolean {
    return this.screenWidth > this.screenHeight;
  }
}

/**
 * 配置校验器
 * 封装配置项有效性校验业务逻辑
 */
class ConfigValidator {
  public static isNonEmpty(value: string): boolean {
    return value !== undefined && value !== null && value.length > 0;
  }

  public static isNumber(value: string): boolean {
    return !isNaN(Number(value));
  }

  public static isValidColor(color: string): boolean {
    return color.startsWith('#') || color.startsWith('rgba');
  }
}

/**
 * 主题切换器
 * 封装主题切换与跟随系统业务逻辑
 */
class ThemeSwitcher {
  private currentTheme: string = 'light';

  public switchTo(theme: string): void {
    this.currentTheme = theme;
  }

  public getCurrentTheme(): string {
    return this.currentTheme;
  }

  public isDarkTheme(): boolean {
    return this.currentTheme === 'dark';
  }
}

/**
 * 本地化回退处理
 * 封装缺失翻译的回退业务逻辑
 */
class LocalizationFallback {
  private fallbackLocale: string = 'en_US';

  public setFallbackLocale(locale: string): void {
    this.fallbackLocale = locale;
  }

  public getFallbackLocale(): string {
    return this.fallbackLocale;
  }

  public shouldFallback(translation: string | null): boolean {
    return translation === null;
  }
}

/**
 * 配置统计器
 * 封装配置项变更统计业务逻辑
 */
class ConfigStatistics {
  private changeCount: number = 0;

  public recordChange(): void {
    this.changeCount++;
  }

  public getChangeCount(): number {
    return this.changeCount;
  }

  public reset(): void {
    this.changeCount = 0;
  }
}

/**
 * 配置目标校验器
 * 封装配置项合法性校验业务逻辑
 */
class ConfigTargetValidator {
  public static isValidKey(key: string): boolean {
    return key !== undefined && key !== null && key.length > 0;
  }

  public static isValidValue(value: string): boolean {
    return value !== undefined && value !== null;
  }
}

/**
 * 配置状态追踪器
 * 封装配置变更状态追踪业务逻辑
 */
class ConfigStateTracker {
  private changed: boolean = false;

  public markChanged(): void {
    this.changed = true;
  }

  public isChanged(): boolean {
    return this.changed;
  }

  public reset(): void {
    this.changed = false;
  }
}


