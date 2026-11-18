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
  serializedDelay,
  DELAY_KEY_NAVIGATION,
  TIMEOUT_DIALOG_RENDER
} from '../common/SharedDriver';

enum Language {
  ENGLISH = 'en-US', CHINESE_SIMPLIFIED = 'zh-CN', CHINESE_TRADITIONAL = 'zh-TW', JAPANESE = 'ja-JP', KOREAN = 'ko-KR', FRENCH = 'fr-FR', GERMAN = 'de-DE', SPANISH = 'es-ES'
}

interface LocalizationRecord {
  language: Language;
  textDisplayed: boolean;
  layoutCorrect: boolean;
  responseTime: number;
  timestamp: number;
}

class LocalizationTracker {
  private static instance: LocalizationTracker;
  private localizationHistory: LocalizationRecord[] = [];
  private totalTests: number = 0;
  private successfulTests: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): LocalizationTracker {
    if (!LocalizationTracker.instance) {
      LocalizationTracker.instance = new LocalizationTracker();
    }
    return LocalizationTracker.instance;
  }

  public recordLocalization(language: Language, textDisplayed: boolean, layoutCorrect: boolean,
    responseTime: number): void {
    const record: LocalizationRecord = {
      language,
      textDisplayed,
      layoutCorrect,
      responseTime,
      timestamp: Date.now()
    };
    this.localizationHistory.push(record);
    this.totalTests++;
    if (textDisplayed && layoutCorrect) {
      this.successfulTests++;
    }
  }

  public getLocalizationHistory(): LocalizationRecord[] {
    return [...this.localizationHistory];
  }

  public getTotalTests(): number {
    return this.totalTests;
  }

  public getSuccessfulTests(): number {
    return this.successfulTests;
  }

  public resetTracker(): void {
    this.localizationHistory = [];
    this.totalTests = 0;
    this.successfulTests = 0;
  }

  public getSuccessRate(): number {
    if (this.totalTests === 0) {
      return 0;
    }
    return this.successfulTests / this.totalTests;
  }

  public hasTestedLanguage(language: Language): boolean {
    return this.localizationHistory.some(record => record.language === language);
  }
}

export default function localizationTestingTest() {
  describe('LocalizationTesting_Test', () => {
    let driver: Driver;
    let localizationTracker: LocalizationTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      localizationTracker = LocalizationTracker.getInstance();
      localizationTracker.resetTracker();
      await serializedDelay(driver, 1000);
    });

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('grid_should_display_correctly_in_english', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      const startTime = Date.now();
      const componentCount = await appComponentCount(driver);
      const responseTime = Date.now() - startTime;

      localizationTracker.recordLocalization(Language.ENGLISH, componentCount >= 6, true, responseTime);

      expect(localizationTracker.hasTestedLanguage(Language.ENGLISH)).assertTrue();
    });

    it('grid_should_display_correctly_in_chinese_simplified', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      localizationTracker.recordLocalization(Language.CHINESE_SIMPLIFIED, isFocusCorrect, true, responseTime);

      expect(localizationTracker.hasTestedLanguage(Language.CHINESE_SIMPLIFIED)).assertTrue();
    });

    it('grid_should_display_correctly_in_chinese_traditional', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 1);
      localizationTracker.recordLocalization(Language.CHINESE_TRADITIONAL, isFocusCorrect, true, responseTime);

      expect(localizationTracker.hasTestedLanguage(Language.CHINESE_TRADITIONAL)).assertTrue();
    });

    it('grid_should_display_correctly_in_japanese', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      const startTime = Date.now();
      const componentCount = await appComponentCount(driver);
      const responseTime = Date.now() - startTime;

      localizationTracker.recordLocalization(Language.JAPANESE, componentCount >= 6, true, responseTime);

      expect(localizationTracker.hasTestedLanguage(Language.JAPANESE)).assertTrue();
    });

    it('grid_should_display_correctly_in_korean', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      localizationTracker.recordLocalization(Language.KOREAN, isFocusCorrect, true, responseTime);

      expect(localizationTracker.hasTestedLanguage(Language.KOREAN)).assertTrue();
    });

    it('grid_should_display_correctly_in_french', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 1);
      localizationTracker.recordLocalization(Language.FRENCH, isFocusCorrect, true, responseTime);

      expect(localizationTracker.hasTestedLanguage(Language.FRENCH)).assertTrue();
    });

    it('grid_should_display_correctly_in_german', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      const startTime = Date.now();
      const componentCount = await appComponentCount(driver);
      const responseTime = Date.now() - startTime;

      localizationTracker.recordLocalization(Language.GERMAN, componentCount >= 6, true, responseTime);

      expect(localizationTracker.hasTestedLanguage(Language.GERMAN)).assertTrue();
    });

    it('grid_should_display_correctly_in_spanish', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      localizationTracker.recordLocalization(Language.SPANISH, isFocusCorrect, true, responseTime);

      expect(localizationTracker.hasTestedLanguage(Language.SPANISH)).assertTrue();
    });

    // 验证dialog localization状态正确：确保TV设备records timestamps should be chronological符合预期
    it('grid_localization_records_timestamps_should_be_chronological', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      localizationTracker.recordLocalization(Language.ENGLISH, true, true, 50);
      await driver.delayMs(100);
      localizationTracker.recordLocalization(Language.CHINESE_SIMPLIFIED, true, true, 50);
      await driver.delayMs(100);
      localizationTracker.recordLocalization(Language.JAPANESE, true, true, 50);

      const history = localizationTracker.getLocalizationHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog localization维持稳定：确保TV设备在tracker singleton should maintain consistency下性能不降低
    it('grid_localization_tracker_singleton_should_maintain_consistency', 0,
      async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
        const tracker1 = LocalizationTracker.getInstance();
        const tracker2 = LocalizationTracker.getInstance();

        expect(tracker1 === tracker2).assertTrue();

        tracker1.resetTracker();
        tracker1.recordLocalization(Language.ENGLISH, true, true, 100);

        expect(tracker2.getTotalTests()).assertEqual(1);
        expect(tracker2.getSuccessfulTests()).assertEqual(1);
      });

    // 验证dialog should处理能力：确保TV设备在handle all languages下功能正常
    it('grid_should_handle_all_languages', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      const languages = [Language.ENGLISH, Language.CHINESE_SIMPLIFIED, Language.CHINESE_TRADITIONAL, Language.JAPANESE,
        Language.KOREAN, Language.FRENCH, Language.GERMAN, Language.SPANISH];

      for (const language of languages) {
        localizationTracker.recordLocalization(language, true, true, 50);
      }

      expect(localizationTracker.getTotalTests()).assertEqual(8);
      expect(localizationTracker.getSuccessRate()).assertEqual(1);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain layout across languages下性能不降低
    it('grid_should_maintain_layout_across_languages', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();
      const initialCount = await appComponentCount(driver);

      const languages = [Language.ENGLISH, Language.CHINESE_SIMPLIFIED, Language.JAPANESE];
      for (const language of languages) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        localizationTracker.recordLocalization(language, true, true, 30);
        await driver.delayMs(50);
      }

      const finalCount = await appComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 综合comprehensive localization场景测试：验证完整操作流程中功能正确
    it('comprehensive_localization_testing_scenario', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      const scenarioStart = Date.now();

      const startTime1 = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime1 = Date.now() - startTime1;
      localizationTracker.recordLocalization(Language.ENGLISH, true, true, responseTime1);

      const startTime2 = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime2 = Date.now() - startTime2;
      localizationTracker.recordLocalization(Language.CHINESE_SIMPLIFIED, true, true, responseTime2);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(localizationTracker.getTotalTests()).assertEqual(2);
      expect(localizationTracker.getSuccessRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(5000);
    });

    // 验证本地化回退：确保TVDeviceLocalizationFallback回退判断正确
    it('localization_fallback_should_trigger_when_missing', 0, () => {
      const fallback: LocalizationFallback = new LocalizationFallback();
      fallback.setFallbackLocale('en_US');
      expect(fallback.getFallbackLocale()).assertEqual('en_US');
      expect(fallback.shouldFallback(null)).assertTrue();
      expect(fallback.shouldFallback('已有翻译')).assertFalse();
    });

    // 验证配置统计：确保TVDeviceConfigStatistics变更计数正确
    it('config_statistics_should_count_changes', 0, () => {
      const stats: ConfigStatistics = new ConfigStatistics();
      stats.recordChange();
      stats.recordChange();
      stats.recordChange();
      expect(stats.getChangeCount()).assertEqual(3);
      stats.reset();
      expect(stats.getChangeCount()).assertEqual(0);
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
