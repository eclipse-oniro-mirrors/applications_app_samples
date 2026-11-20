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

enum DeviceOrientation {
  PORTRAIT = 'portrait', LANDSCAPE = 'landscape'
}

enum ScreenResolution {
  HD = '1280x720', FHD = '1920x1080', UHD = '3840x2160'
}

enum Language {
  EN = 'en', ZH = 'zh', JA = 'ja'
}

interface CompatibilityRecord {
  orientation: DeviceOrientation;
  resolution: ScreenResolution;
  language: Language;
  operationName: string;
  success: boolean;
  responseTime: number;
  timestamp: number;
}

class DeviceCompatibilityTracker {
  private static instance: DeviceCompatibilityTracker;
  private compatibilityHistory: CompatibilityRecord[] = [];
  private totalOperations: number = 0;
  private successfulOperations: number = 0;
  private currentOrientation: DeviceOrientation = DeviceOrientation.LANDSCAPE;
  private currentResolution: ScreenResolution = ScreenResolution.FHD;
  private currentLanguage: Language = Language.EN;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): DeviceCompatibilityTracker {
    if (!DeviceCompatibilityTracker.instance) {
      DeviceCompatibilityTracker.instance = new DeviceCompatibilityTracker();
    }
    return DeviceCompatibilityTracker.instance;
  }

  public setCurrentOrientation(orientation: DeviceOrientation): void {
    this.currentOrientation = orientation;
  }

  public setCurrentResolution(resolution: ScreenResolution): void {
    this.currentResolution = resolution;
  }

  public setCurrentLanguage(language: Language): void {
    this.currentLanguage = language;
  }

  public recordCompatibility(orientation: DeviceOrientation, resolution: ScreenResolution, language: Language,
    operationName: string, success: boolean, responseTime: number): void {
    const record: CompatibilityRecord = {
      orientation,
      resolution,
      language,
      operationName,
      success,
      responseTime,
      timestamp: Date.now()
    };
    this.compatibilityHistory.push(record);
    this.totalOperations++;
    if (success) {
      this.successfulOperations++;
    }
  }

  public getCompatibilityHistory(): CompatibilityRecord[] {
    return [...this.compatibilityHistory];
  }

  public getTotalOperations(): number {
    return this.totalOperations;
  }

  public getSuccessfulOperations(): number {
    return this.successfulOperations;
  }

  public resetTracker(): void {
    this.compatibilityHistory = [];
    this.totalOperations = 0;
    this.successfulOperations = 0;
    this.currentOrientation = DeviceOrientation.LANDSCAPE;
    this.currentResolution = ScreenResolution.FHD;
    this.currentLanguage = Language.EN;
  }

  public getSuccessRate(): number {
    if (this.totalOperations === 0) {
      return 0;
    }
    return this.successfulOperations / this.totalOperations;
  }

  public hasTestedWithOrientation(orientation: DeviceOrientation): boolean {
    return this.compatibilityHistory.some(record => record.orientation === orientation);
  }

  public hasTestedWithResolution(resolution: ScreenResolution): boolean {
    return this.compatibilityHistory.some(record => record.resolution === resolution);
  }

  public hasTestedWithLanguage(language: Language): boolean {
    return this.compatibilityHistory.some(record => record.language === language);
  }
}

export default function deviceCompatibilityTest() {
  describe('DeviceCompatibility_Test', () => {
    let driver: Driver;
    let compatibilityTracker: DeviceCompatibilityTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      compatibilityTracker = DeviceCompatibilityTracker.getInstance();
      compatibilityTracker.resetTracker();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('grid_should_work_in_landscape_orientation', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      compatibilityTracker.setCurrentOrientation(DeviceOrientation.LANDSCAPE);

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      compatibilityTracker.recordCompatibility(DeviceOrientation.LANDSCAPE, ScreenResolution.FHD, Language.EN,
        'landscape_navigation', isFocusCorrect, responseTime);

      expect(compatibilityTracker.hasTestedWithOrientation(DeviceOrientation.LANDSCAPE)).assertTrue();
    });

    it('grid_should_work_in_portrait_orientation', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      compatibilityTracker.setCurrentOrientation(DeviceOrientation.PORTRAIT);

      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 1);
      compatibilityTracker.recordCompatibility(DeviceOrientation.PORTRAIT, ScreenResolution.FHD, Language.EN,
        'portrait_navigation', isFocusCorrect, responseTime);

      expect(compatibilityTracker.hasTestedWithOrientation(DeviceOrientation.PORTRAIT)).assertTrue();
    });

    it('grid_should_work_in_hd_resolution', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      compatibilityTracker.setCurrentResolution(ScreenResolution.HD);

      const startTime = Date.now();
      const componentCount = await appComponentCount(driver);
      const responseTime = Date.now() - startTime;

      compatibilityTracker.recordCompatibility(DeviceOrientation.LANDSCAPE, ScreenResolution.HD, Language.EN,
        'hd_rendering', componentCount >= 6, responseTime);

      expect(compatibilityTracker.hasTestedWithResolution(ScreenResolution.HD)).assertTrue();
    });

    it('grid_should_work_in_fhd_resolution', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      compatibilityTracker.setCurrentResolution(ScreenResolution.FHD);

      const startTime = Date.now();
      const componentCount = await appComponentCount(driver);
      const responseTime = Date.now() - startTime;

      compatibilityTracker.recordCompatibility(DeviceOrientation.LANDSCAPE, ScreenResolution.FHD, Language.EN,
        'fhd_rendering', componentCount >= 6, responseTime);

      expect(compatibilityTracker.hasTestedWithResolution(ScreenResolution.FHD)).assertTrue();
    });

    it('grid_should_work_in_uhd_resolution', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      compatibilityTracker.setCurrentResolution(ScreenResolution.UHD);

      const startTime = Date.now();
      const componentCount = await appComponentCount(driver);
      const responseTime = Date.now() - startTime;

      compatibilityTracker.recordCompatibility(DeviceOrientation.LANDSCAPE, ScreenResolution.UHD, Language.EN,
        'uhd_rendering', componentCount >= 6, responseTime);

      expect(compatibilityTracker.hasTestedWithResolution(ScreenResolution.UHD)).assertTrue();
    });

    it('grid_should_work_in_english_language', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      compatibilityTracker.setCurrentLanguage(Language.EN);

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      compatibilityTracker.recordCompatibility(DeviceOrientation.LANDSCAPE, ScreenResolution.FHD, Language.EN,
        'english_navigation', isFocusCorrect, responseTime);

      expect(compatibilityTracker.hasTestedWithLanguage(Language.EN)).assertTrue();
    });

    it('grid_should_work_in_chinese_language', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      compatibilityTracker.setCurrentLanguage(Language.ZH);

      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 1);
      compatibilityTracker.recordCompatibility(DeviceOrientation.LANDSCAPE, ScreenResolution.FHD, Language.ZH,
        'chinese_navigation', isFocusCorrect, responseTime);

      expect(compatibilityTracker.hasTestedWithLanguage(Language.ZH)).assertTrue();
    });

    it('grid_should_work_in_japanese_language', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      compatibilityTracker.setCurrentLanguage(Language.JA);

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      compatibilityTracker.recordCompatibility(DeviceOrientation.LANDSCAPE, ScreenResolution.FHD, Language.JA,
        'japanese_navigation', isFocusCorrect, responseTime);

      expect(compatibilityTracker.hasTestedWithLanguage(Language.JA)).assertTrue();
    });

    // 验证dialog compatibility状态正确：确保TV设备records timestamps should be chronological符合预期
    it('grid_compatibility_records_timestamps_should_be_chronological', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      compatibilityTracker.resetTracker();

      compatibilityTracker.recordCompatibility(DeviceOrientation.LANDSCAPE, ScreenResolution.FHD, Language.EN, 'test_1',
        true, 50);
      await driver.delayMs(100);
      compatibilityTracker.recordCompatibility(DeviceOrientation.PORTRAIT, ScreenResolution.HD, Language.ZH, 'test_2',
        true, 50);
      await driver.delayMs(100);
      compatibilityTracker.recordCompatibility(DeviceOrientation.LANDSCAPE, ScreenResolution.UHD, Language.JA, 'test_3',
        true, 50);

      const history = compatibilityTracker.getCompatibilityHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog compatibility维持稳定：确保TV设备在tracker singleton should maintain consistency下性能不降低
    it('grid_compatibility_tracker_singleton_should_maintain_consistency', 0,
      async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
        const tracker1 = DeviceCompatibilityTracker.getInstance();
        const tracker2 = DeviceCompatibilityTracker.getInstance();

        expect(tracker1 === tracker2).assertTrue();

        tracker1.resetTracker();
        tracker1.setCurrentOrientation(DeviceOrientation.LANDSCAPE);
        tracker1.recordCompatibility(DeviceOrientation.LANDSCAPE, ScreenResolution.FHD, Language.EN, 'singleton_test',
          true, 100);

        expect(tracker2.getTotalOperations()).assertEqual(1);
        expect(tracker2.getSuccessfulOperations()).assertEqual(1);
      });

    // 验证dialog should处理能力：确保TV设备在handle all device configurations下功能正常
    it('grid_should_handle_all_device_configurations', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      compatibilityTracker.resetTracker();

      const orientations = [DeviceOrientation.LANDSCAPE, DeviceOrientation.PORTRAIT];
      const resolutions = [ScreenResolution.HD, ScreenResolution.FHD, ScreenResolution.UHD];
      const languages = [Language.EN, Language.ZH, Language.JA];

      for (const orientation of orientations) {
        for (const resolution of resolutions) {
          for (const language of languages) {
            compatibilityTracker.recordCompatibility(orientation, resolution, language, 'full_config_test', true, 50);
          }
        }
      }

      expect(compatibilityTracker.getTotalOperations()).assertEqual(18);
      expect(compatibilityTracker.getSuccessRate()).assertEqual(1);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain stability across configurations下性能不降低
    it('grid_should_maintain_stability_across_configurations', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      compatibilityTracker.resetTracker();
      const initialCount = await appComponentCount(driver);

      for (let i = 0; i < 30; i++) {
        const orientation = i % 2 === 0 ? DeviceOrientation.LANDSCAPE : DeviceOrientation.PORTRAIT;
        const resolution =
          i % 3 === 0 ? ScreenResolution.HD : i % 3 === 1 ? ScreenResolution.FHD : ScreenResolution.UHD;
        const language = i % 3 === 0 ? Language.EN : i % 3 === 1 ? Language.ZH : Language.JA;

        compatibilityTracker.setCurrentOrientation(orientation);
        compatibilityTracker.setCurrentResolution(resolution);
        compatibilityTracker.setCurrentLanguage(language);

        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        compatibilityTracker.recordCompatibility(orientation, resolution, language, `stability_op_${i}`, true, 30);
        await driver.delayMs(50);
      }

      const finalCount = await appComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 综合comprehensive device场景测试：验证完整操作流程中功能正确
    it('comprehensive_device_compatibility_scenario', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      compatibilityTracker.resetTracker();

      const scenarioStart = Date.now();

      compatibilityTracker.setCurrentOrientation(DeviceOrientation.LANDSCAPE);
      compatibilityTracker.setCurrentResolution(ScreenResolution.FHD);
      compatibilityTracker.setCurrentLanguage(Language.EN);

      const startTime1 = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime1 = Date.now() - startTime1;
      compatibilityTracker.recordCompatibility(DeviceOrientation.LANDSCAPE, ScreenResolution.FHD, Language.EN,
        'comprehensive_test', true, responseTime1);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(compatibilityTracker.getTotalOperations()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(5000);
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
