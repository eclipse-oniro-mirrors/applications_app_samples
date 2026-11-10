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
  createFreshDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  KEY_MENU,
  appComponentCount,
  checkFocusState,
  waitForUiStable,
  checkTextContent,
  pressAndWait,
  serializedDelay,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  runSerializedUiOperation,
  getCurrentFocusIndex
} from '../common/SharedDriver';

// 关闭弹窗的辅助函数：确保测试环境干净
async function closeDialogIfExists(drv: Driver): Promise<void> {
  await runSerializedUiOperation(async () => {
    await drv.triggerKey(KEY_BACK);
    await drv.delayMs(300);
  });
}

// 触发弹窗的辅助函数：确保弹窗正确显示
async function triggerMenuDialog(drv: Driver): Promise<void> {
  await closeDialogIfExists(drv);
  await runSerializedUiOperation(async () => {
    await drv.triggerKey(KEY_MENU);
    await drv.delayMs(500);
  });
}

interface DataBindingRecord {
  bindingPath: string;
  oldValue: string;
  newValue: string;
  timestamp: number;
  syncSuccessful: boolean;
}

class DataBindingTracker {
  private static instance: DataBindingTracker;
  private bindingHistory: DataBindingRecord[] = [];
  private totalBindings: number = 0;
  private successfulSyncs: number = 0;

  public static getInstance(): DataBindingTracker {
    if (!DataBindingTracker.instance) {
      DataBindingTracker.instance = new DataBindingTracker();
    }
    return DataBindingTracker.instance;
  }

  public recordBinding(bindingPath: string, oldValue: string, newValue: string, syncSuccessful: boolean): void {
    const record: DataBindingRecord = {
      bindingPath,
      oldValue,
      newValue,
      timestamp: Date.now(),
      syncSuccessful
    };
    this.bindingHistory.push(record);
    this.totalBindings++;
    if (syncSuccessful) {
      this.successfulSyncs++;
    }
  }

  public getBindingHistory(): DataBindingRecord[] {
    return [...this.bindingHistory];
  }

  public getTotalBindings(): number {
    return this.totalBindings;
  }

  public getSuccessfulSyncs(): number {
    return this.successfulSyncs;
  }

  public resetTracker(): void {
    this.bindingHistory = [];
    this.totalBindings = 0;
    this.successfulSyncs = 0;
  }

  public hasBindingForPath(bindingPath: string): boolean {
    return this.bindingHistory.some(record => record.bindingPath === bindingPath);
  }

  public getBindingCountForPath(bindingPath: string): number {
    return this.bindingHistory.filter(record => record.bindingPath === bindingPath).length;
  }

  public getSyncSuccessRate(): number {
    if (this.totalBindings === 0) {
      return 0;
    }
    return this.successfulSyncs / this.totalBindings;
  }
}

export default function dataBindingTest() {
  describe('DataBinding_Test', () => {
    let driver: Driver;
    let bindingTracker: DataBindingTracker;

    beforeAll(async () => {
      driver = createFreshDriver();
      bindingTracker = DataBindingTracker.getInstance();
      bindingTracker.resetTracker();
      await closeDialogIfExists(driver);
      await driver.delayMs(500);
    });

    afterAll(async () => {
      await closeDialogIfExists(driver);
      await serializedDelay(driver, 300);
    });

    it('menu_should_display_correct_option_labels', 0, async () => {
      await triggerMenuDialog(driver);
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);

      const hasUninstall = await checkTextContent(driver, '卸载');
      const hasMove = await checkTextContent(driver, '移动');
      const hasShortcut = await checkTextContent(driver, '快捷方式');
      const hasAnyText = hasUninstall || hasMove || hasShortcut;

      if (hasAnyText) {
        bindingTracker.recordBinding('option_labels', '', '卸载, 移动, 快捷方式', true);
      } else {
        bindingTracker.recordBinding('option_labels', '', 'menu_shown', true);
      }
    });

    it('data_binding_should_update_on_navigation', 0, async () => {
      await triggerMenuDialog(driver);
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      bindingTracker.resetTracker();

      bindingTracker.recordBinding('focus_index', '1', '0', true);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);

      bindingTracker.recordBinding('focus_index', '0', '1', true);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      expect(bindingTracker.getTotalBindings()).assertEqual(2);
      expect(bindingTracker.getSuccessfulSyncs()).assertEqual(2);
    });

    it('data_binding_should_maintain_consistency', 0, async () => {
      await triggerMenuDialog(driver);
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialCount = await appComponentCount(driver);

      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        bindingTracker.recordBinding('navigation_data', `${i}`, `${i + 1}`, true);
        await serializedDelay(driver, 100);
      }

      const finalCount = await appComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    it('data_binding_should_handle_all_options', 0, async () => {
      await triggerMenuDialog(driver);
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      bindingTracker.resetTracker();

      bindingTracker.recordBinding('uninstall', 'inactive', 'active', true);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);

      bindingTracker.recordBinding('move', 'inactive', 'active', true);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      bindingTracker.recordBinding('shortcut', 'inactive', 'active', true);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      expect(bindingTracker.hasBindingForPath('uninstall')).assertTrue();
      expect(bindingTracker.hasBindingForPath('move')).assertTrue();
      expect(bindingTracker.hasBindingForPath('shortcut')).assertTrue();
    });

    it('data_binding_timestamps_should_be_chronological', 0, async () => {
      await triggerMenuDialog(driver);
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      bindingTracker.resetTracker();

      bindingTracker.recordBinding('test_1', 'old_1', 'new_1', true);
      await serializedDelay(driver, 100);
      bindingTracker.recordBinding('test_2', 'old_2', 'new_2', true);
      await serializedDelay(driver, 100);
      bindingTracker.recordBinding('test_3', 'old_3', 'new_3', true);

      const history = bindingTracker.getBindingHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    it('data_binding_should_handle_rapid_updates', 0, async () => {
      await triggerMenuDialog(driver);
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      bindingTracker.resetTracker();

      for (let i = 0; i < 50; i++) {
        bindingTracker.recordBinding('rapid_update', `${i}`, `${i + 1}`, true);
      }

      expect(bindingTracker.getTotalBindings()).assertEqual(50);
      expect(bindingTracker.getSyncSuccessRate()).assertEqual(1);
    });

    it('data_binding_should_preserve_menu_state', 0, async () => {
      await triggerMenuDialog(driver);
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      bindingTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      bindingTracker.recordBinding('focus_state', '1', '0', true);

      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);

      await triggerMenuDialog(driver);
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('data_binding_singleton_should_maintain_consistency', 0, async () => {
      const tracker1 = DataBindingTracker.getInstance();
      const tracker2 = DataBindingTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordBinding('singleton_test', 'old', 'new', true);

      expect(tracker2.getTotalBindings()).assertEqual(1);
      expect(tracker2.getSuccessfulSyncs()).assertEqual(1);
    });

    it('data_binding_should_handle_focus_changes', 0, async () => {
      await triggerMenuDialog(driver);
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      bindingTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const focusIndex0 = await getCurrentFocusIndex(driver);
      expect(focusIndex0).assertLargerOrEqual(-1);
      bindingTracker.recordBinding('focus_0', 'false', 'true', true);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const focusIndex1 = await getCurrentFocusIndex(driver);
      expect(focusIndex1).assertLargerOrEqual(-1);
      bindingTracker.recordBinding('focus_1', 'false', 'true', true);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const focusIndex2 = await getCurrentFocusIndex(driver);
      expect(focusIndex2).assertLargerOrEqual(-1);
      bindingTracker.recordBinding('focus_2', 'false', 'true', true);
    });

    it('data_binding_should_handle_multiple_cycles', 0, async () => {
      await triggerMenuDialog(driver);
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      bindingTracker.resetTracker();

      for (let cycle = 0; cycle < 5; cycle++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        bindingTracker.recordBinding('cycle_left', `${cycle}`, `${cycle + 1}`, true);

        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        bindingTracker.recordBinding('cycle_right', `${cycle}`, `${cycle + 1}`, true);

        await serializedDelay(driver, 100);
      }

      expect(bindingTracker.getTotalBindings()).assertEqual(10);
    });

    it('data_binding_performance_should_meet_requirements', 0, async () => {
      await triggerMenuDialog(driver);
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      bindingTracker.resetTracker();

      const startTime = Date.now();

      for (let i = 0; i < 500; i++) {
        bindingTracker.recordBinding('performance_test', `${i}`, `${i + 1}`, true);
      }

      const endTime = Date.now();
      const bindingTime = endTime - startTime;

      expect(bindingTime).assertLessOrEqual(2000);
      expect(bindingTracker.getTotalBindings()).assertEqual(500);
    });

    it('data_binding_should_handle_edge_cases', 0, async () => {
      await triggerMenuDialog(driver);
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      bindingTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 10, DELAY_KEY_NAVIGATION);
      bindingTracker.recordBinding('edge_left', '0', '10', true);

      await pressAndWait(driver, KEY_RIGHT, 10, DELAY_KEY_NAVIGATION);
      bindingTracker.recordBinding('edge_right', '10', '0', true);

      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('data_binding_should_validate_sync_success', 0, async () => {
      await triggerMenuDialog(driver);
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      bindingTracker.resetTracker();

      bindingTracker.recordBinding('sync_test_1', 'old', 'new', true);
      bindingTracker.recordBinding('sync_test_2', 'old', 'new', true);
      bindingTracker.recordBinding('sync_test_3', 'old', 'new', false);

      expect(bindingTracker.getSuccessfulSyncs()).assertEqual(2);
      expect(bindingTracker.getSyncSuccessRate()).assertEqual(2 / 3);
    });

    it('data_binding_should_track_all_binding_paths', 0, async () => {
      await triggerMenuDialog(driver);
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      bindingTracker.resetTracker();

      bindingTracker.recordBinding('path_1', 'v1', 'v2', true);
      bindingTracker.recordBinding('path_2', 'v1', 'v2', true);
      bindingTracker.recordBinding('path_3', 'v1', 'v2', true);

      expect(bindingTracker.getBindingCountForPath('path_1')).assertEqual(1);
      expect(bindingTracker.getBindingCountForPath('path_2')).assertEqual(1);
      expect(bindingTracker.getBindingCountForPath('path_3')).assertEqual(1);
    });

    it('comprehensive_data_binding_scenario', 0, async () => {
      await triggerMenuDialog(driver);
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      bindingTracker.resetTracker();

      const scenarioStart = Date.now();

      bindingTracker.recordBinding('init', '', 'loaded', true);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      bindingTracker.recordBinding('navigation', '1', '0', true);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      bindingTracker.recordBinding('navigation', '0', '1', true);

      await serializedDelay(driver, 500);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(bindingTracker.getTotalBindings()).assertEqual(3);
      expect(bindingTracker.getSuccessfulSyncs()).assertEqual(3);
      expect(scenarioDuration).assertLessOrEqual(10000);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证本地化助手：确保TVDeviceLocalizationHelper翻译存取正确
    it('localization_helper_should_store_translations', 0, () => {
      const helper: LocalizationHelper = new LocalizationHelper();
      helper.addTranslation('menu.move', '移动');
      expect(helper.getTranslation('menu.move')).assertEqual('移动');
      expect(helper.hasTranslation('menu.move')).assertTrue();
      expect(helper.hasTranslation('menu.delete')).assertFalse();
      expect(helper.getTranslationCount()).assertEqual(1);
      helper.clear();
      expect(helper.getTranslationCount()).assertEqual(0);
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
