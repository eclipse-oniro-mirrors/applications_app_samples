/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, beforeEach, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import {
  getDriver,
  logInfo,
  serializedDelay,
  runSerializedUiOperation,
  launchEntryAbility,
  waitForIndexPageStable,
  pressAndWait,
  checkComponentExistsByKey,
  checkTextContent,
  pageComponentCount,
  collectAllTexts,
  getCurrentFocusIndex,
  doAbilityForeground,
  doAbilityBackground,
  getBundleName,
  getAbilityDelegator,
  buildEntryWant,
  startAbilityByWant,
  isNonEmptyString,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  ENV_CALLBACK_EVENT,
  COLOR_MODE_NOT_SET,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  STRESS_ROUNDS_LIFECYCLE,
  KEY_ENTER,
  KEY_TAB,
  KEY_LEFT,
  KEY_BACK,
  ensureIndexPageInitial,
  queryInAppWindow,
  isIndexPageRendered,
} from '../Shared/SharedDriver';

enum ColorMode {
  COLOR_MODE_NOT_SET = -1,
  COLOR_MODE_DARK = 0,
  COLOR_MODE_LIGHT = 1
}

enum ScreenDirection {
  DIRECTION_UNDEFINED = -1,
  DIRECTION_NORMAL = 0,
  DIRECTION_REVERSE = 1
}

enum MemoryLevel {
  MEMORY_LEVEL_MODERATE = 0,
  MEMORY_LEVEL_LOW = 1,
  MEMORY_LEVEL_CRITICAL = 2
}

enum DispatchOutcome {
  OUTCOME_DELIVERED = 0,
  OUTCOME_FAILED = 1,
  OUTCOME_SKIPPED = 2
}

const DEFAULT_LANGUAGE: string = 'zh-Hans-CN';

const DEFAULT_FONT_SIZE_SCALE: number = 1.0;

const DEFAULT_FONT_WEIGHT_SCALE: number = 1.0;

const MIN_SCALE: number = 0.85;

const MAX_SCALE: number = 3.0;

const REGISTRY_DUPLICATE_KEY: string = 'environment';

interface ConfigurationSnapshotInit {
  language: string;
  colorMode: number;
  direction: number;
  fontSizeScale: number;
  fontWeightScale: number;
}

interface DispatchRecord {
  callbackId: number;
  outcome: DispatchOutcome;
  eventName: string;
}

class ConfigurationSnapshot {
  public language: string;
  public colorMode: number;
  public direction: number;
  public fontSizeScale: number;
  public fontWeightScale: number;

  constructor(init: ConfigurationSnapshotInit) {
    this.language = init.language;
    this.colorMode = init.colorMode;
    this.direction = init.direction;
    this.fontSizeScale = init.fontSizeScale;
    this.fontWeightScale = init.fontWeightScale;
  }

  public static createDefault(): ConfigurationSnapshot {
    const init: ConfigurationSnapshotInit = {
      language: DEFAULT_LANGUAGE,
      colorMode: ColorMode.COLOR_MODE_NOT_SET,
      direction: ScreenDirection.DIRECTION_NORMAL,
      fontSizeScale: DEFAULT_FONT_SIZE_SCALE,
      fontWeightScale: DEFAULT_FONT_WEIGHT_SCALE
    };
    return new ConfigurationSnapshot(init);
  }

  public static createPassingThrough(language: string, colorMode: number, direction: number,
    fontSizeScale: number, fontWeightScale: number): ConfigurationSnapshot {
    const init: ConfigurationSnapshotInit = {
      language: language,
      colorMode: colorMode,
      direction: direction,
      fontSizeScale: fontSizeScale,
      fontWeightScale: fontWeightScale
    };
    return new ConfigurationSnapshot(init);
  }

  public isColorModeValid(): boolean {
    return this.colorMode === ColorMode.COLOR_MODE_NOT_SET || this.colorMode === ColorMode.COLOR_MODE_DARK ||
      this.colorMode === ColorMode.COLOR_MODE_LIGHT;
  }

  public isDirectionValid(): boolean {
    return this.direction === ScreenDirection.DIRECTION_UNDEFINED ||
      this.direction === ScreenDirection.DIRECTION_NORMAL ||
      this.direction === ScreenDirection.DIRECTION_REVERSE;
  }

  public isFontSizeScaleValid(): boolean {
    return this.fontSizeScale >= MIN_SCALE && this.fontSizeScale <= MAX_SCALE;
  }

  public isFontWeightScaleValid(): boolean {
    return this.fontWeightScale >= MIN_SCALE && this.fontWeightScale <= MAX_SCALE;
  }

  public isLanguageValid(): boolean {
    if (this.language.length === 0) {
      return false;
    }
    return this.language.includes('-');
  }

  public isDarkMode(): boolean {
    return this.colorMode === ColorMode.COLOR_MODE_DARK;
  }

  public isLightMode(): boolean {
    return this.colorMode === ColorMode.COLOR_MODE_LIGHT;
  }

  public isFollowSystemColorMode(): boolean {
    return this.colorMode === ColorMode.COLOR_MODE_NOT_SET;
  }

  public isReversed(): boolean {
    return this.direction === ScreenDirection.DIRECTION_REVERSE;
  }

  public getColorModeName(): string {
    switch (this.colorMode) {
      case ColorMode.COLOR_MODE_DARK:
        return 'dark';
      case ColorMode.COLOR_MODE_LIGHT:
        return 'light';
      case ColorMode.COLOR_MODE_NOT_SET:
        return 'not_set';
      default:
        return 'invalid';
    }
  }

  public getDirectionName(): string {
    switch (this.direction) {
      case ScreenDirection.DIRECTION_NORMAL:
        return 'normal';
      case ScreenDirection.DIRECTION_REVERSE:
        return 'reverse';
      case ScreenDirection.DIRECTION_UNDEFINED:
        return 'undefined';
      default:
        return 'invalid';
    }
  }

  public isValid(): boolean {
    return this.isLanguageValid() && this.isColorModeValid() && this.isDirectionValid() &&
      this.isFontSizeScaleValid() && this.isFontWeightScaleValid();
  }

  public collectChangedFields(other: ConfigurationSnapshot): string[] {
    const fields: string[] = [];
    if (this.language !== other.language) {
      fields.push('language');
    }
    if (this.colorMode !== other.colorMode) {
      fields.push('colorMode');
    }
    if (this.direction !== other.direction) {
      fields.push('direction');
    }
    if (this.fontSizeScale !== other.fontSizeScale) {
      fields.push('fontSizeScale');
    }
    if (this.fontWeightScale !== other.fontWeightScale) {
      fields.push('fontWeightScale');
    }
    return fields;
  }

  public changedFieldCount(other: ConfigurationSnapshot): number {
    return this.collectChangedFields(other).length;
  }

  public equals(other: ConfigurationSnapshot): boolean {
    return this.language === other.language && this.colorMode === other.colorMode &&
      this.direction === other.direction && this.fontSizeScale === other.fontSizeScale &&
      this.fontWeightScale === other.fontWeightScale;
  }

  public clone(): ConfigurationSnapshot {
    const init: ConfigurationSnapshotInit = {
      language: this.language,
      colorMode: this.colorMode,
      direction: this.direction,
      fontSizeScale: this.fontSizeScale,
      fontWeightScale: this.fontWeightScale
    };
    return new ConfigurationSnapshot(init);
  }

  public toString(): string {
    return `ConfigurationSnapshot{language: ${this.language}, colorMode: ${this.getColorModeName()}, ` +
      `direction: ${this.getDirectionName()}, fontSizeScale: ${this.fontSizeScale}}`;
  }
}

class MemoryLevelPolicy {
  public static isValidLevel(level: number): boolean {
    return level === MemoryLevel.MEMORY_LEVEL_MODERATE || level === MemoryLevel.MEMORY_LEVEL_LOW ||
      level === MemoryLevel.MEMORY_LEVEL_CRITICAL;
  }

  public static getLevelName(level: number): string {
    switch (level) {
      case MemoryLevel.MEMORY_LEVEL_MODERATE:
        return 'moderate';
      case MemoryLevel.MEMORY_LEVEL_LOW:
        return 'low';
      case MemoryLevel.MEMORY_LEVEL_CRITICAL:
        return 'critical';
      default:
        return 'unknown';
    }
  }

  public static getActionName(level: number): string {
    switch (level) {
      case MemoryLevel.MEMORY_LEVEL_MODERATE:
        return 'trim_idle_caches';
      case MemoryLevel.MEMORY_LEVEL_LOW:
        return 'release_cached_resources';
      case MemoryLevel.MEMORY_LEVEL_CRITICAL:
        return 'release_all_non_essential';
      default:
        return 'no_action';
    }
  }

  public static shouldReleaseBackground(level: number): boolean {
    return level === MemoryLevel.MEMORY_LEVEL_CRITICAL;
  }

  public static getSeverity(level: number): number {
    if (!MemoryLevelPolicy.isValidLevel(level)) {
      return -1;
    }
    return level;
  }

  public static isAtLeast(level: number, threshold: number): boolean {
    if (!MemoryLevelPolicy.isValidLevel(level) || !MemoryLevelPolicy.isValidLevel(threshold)) {
      return false;
    }
    return level >= threshold;
  }
}

interface EnvironmentCallbackLike {
  onConfigurationUpdated(config: ConfigurationSnapshot): void;
  onMemoryLevel(level: number): void;
}

class RecordingCallback implements EnvironmentCallbackLike {
  public configCalls: number = 0;
  public memoryCalls: number = 0;
  public lastLanguage: string = '';
  public lastMemoryLevel: number = -1;
  private throwOnConfig: boolean;
  private throwOnMemory: boolean;

  constructor(throwOnConfig: boolean, throwOnMemory: boolean) {
    this.throwOnConfig = throwOnConfig;
    this.throwOnMemory = throwOnMemory;
  }

  public onConfigurationUpdated(config: ConfigurationSnapshot): void {
    if (this.throwOnConfig) {
      throw new Error('configuration callback failure');
    }
    this.configCalls++;
    this.lastLanguage = config.language;
  }

  public onMemoryLevel(level: number): void {
    if (this.throwOnMemory) {
      throw new Error('memory callback failure');
    }
    this.memoryCalls++;
    this.lastMemoryLevel = level;
  }
}

class CallbackRegistry {
  private callbacks: EnvironmentCallbackLike[] = [];
  private ids: number[] = [];
  private callbackKeys: string[] = [];
  private nextId: number = 1;
  private records: DispatchRecord[] = [];

  public getEventName(): string {
    return REGISTRY_DUPLICATE_KEY;
  }

  public register(callback: EnvironmentCallbackLike, callbackKey: string): number {
    const existingIndex: number = this.callbackKeys.indexOf(callbackKey);
    if (existingIndex >= 0) {
      return this.ids[existingIndex];
    }
    const id: number = this.nextId;
    this.nextId++;
    this.callbacks.push(callback);
    this.ids.push(id);
    this.callbackKeys.push(callbackKey);
    return id;
  }

  public unregister(callbackId: number): boolean {
    const index: number = this.ids.indexOf(callbackId);
    if (index < 0) {
      return false;
    }
    this.callbacks.splice(index, 1);
    this.ids.splice(index, 1);
    this.callbackKeys.splice(index, 1);
    return true;
  }

  public getCount(): number {
    return this.callbacks.length;
  }

  public contains(callbackId: number): boolean {
    return this.ids.indexOf(callbackId) >= 0;
  }

  public getIds(): number[] {
    return [...this.ids];
  }

  public dispatchConfiguration(config: ConfigurationSnapshot): DispatchRecord[] {
    this.records = [];
    for (let i = 0; i < this.callbacks.length; i++) {
      const id: number = this.ids[i];
      try {
        this.callbacks[i].onConfigurationUpdated(config);
        this.records.push({ callbackId: id, outcome: DispatchOutcome.OUTCOME_DELIVERED, eventName: 'config' });
      } catch (e) {
        logInfo(`dispatchConfiguration: callback ${id} failed with ${e.name}`);
        this.records.push({ callbackId: id, outcome: DispatchOutcome.OUTCOME_FAILED, eventName: 'config' });
      }
    }
    return [...this.records];
  }

  public dispatchMemoryLevel(level: number): DispatchRecord[] {
    this.records = [];
    for (let i = 0; i < this.callbacks.length; i++) {
      const id: number = this.ids[i];
      try {
        this.callbacks[i].onMemoryLevel(level);
        this.records.push({ callbackId: id, outcome: DispatchOutcome.OUTCOME_DELIVERED, eventName: 'memory' });
      } catch (e) {
        logInfo(`dispatchMemoryLevel: callback ${id} failed with ${e.name}`);
        this.records.push({ callbackId: id, outcome: DispatchOutcome.OUTCOME_FAILED, eventName: 'memory' });
      }
    }
    return [...this.records];
  }

  public countOutcome(outcome: DispatchOutcome): number {
    return this.records.filter((item: DispatchRecord) => item.outcome === outcome).length;
  }

  public getRecords(): DispatchRecord[] {
    return [...this.records];
  }

  public clear(): void {
    this.callbacks = [];
    this.ids = [];
    this.callbackKeys = [];
    this.records = [];
    this.nextId = 1;
  }
}

async function readHelloTextById(driver: Driver): Promise<string> {
  return await runSerializedUiOperation(async (): Promise<string> => {
    const components: Component[] = await queryInAppWindow(driver, ON.id(INDEX_PAGE_TEXT_KEY));
    if (components === null || components === undefined || components.length === 0) {
      logInfo('readHelloTextById: no component with the index page text id');
      return '';
    }
    return await components[0].getText();
  });
}

async function clickHelloWorld(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async (): Promise<boolean> => {
      const components: Component[] = await queryInAppWindow(driver, ON.id(INDEX_PAGE_TEXT_KEY));
      if (components === null || components === undefined || components.length === 0) {
        logInfo('clickHelloWorld: no component with the index page text id');
        return false;
      }
      await components[0].click();
      await driver.delayMs(DELAY_AFTER_LAUNCH);
      return true;
    });
  } catch (e) {
    logInfo(`clickHelloWorld failed: ${e.name} message: ${e.message}`);
    return false;
  }
}

export default function environmentCallbackModelTest(): void {
  describe('EnvironmentCallbackModelTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      logInfo('EnvironmentCallbackModelTest beforeAll finished');

      await ensureIndexPageInitial(driver);
    });

    beforeEach(async () => {
      const rendered: boolean = await isIndexPageRendered(driver);
      if (!rendered) {
        logInfo('beforeEach: index page absent, relaunching the entry ability');
        await launchEntryAbility();
      }
    });

    afterAll(async () => {
      await doAbilityForeground();
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
      logInfo('EnvironmentCallbackModelTest afterAll finished');
    });
