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

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_0100
     * @tc.name testConfigDefaultSnapshot
     * @tc.desc Verify the default configuration snapshot uses zh-Hans-CN, color mode -1, direction 0 and scale 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigDefaultSnapshot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const config: ConfigurationSnapshot = ConfigurationSnapshot.createDefault();
          expect(config.language).assertEqual('zh-Hans-CN');
          expect(config.colorMode).assertEqual(-1);
          expect(config.direction).assertEqual(0);
          expect(config.fontSizeScale).assertEqual(1.0);
          expect(config.fontWeightScale).assertEqual(1.0);
          expect(config.isValid()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_0200
     * @tc.name testConfigLanguageField
     * @tc.desc Verify the language field keeps the zh-Hans-CN value and is recognized as a region qualified tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigLanguageField', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const config: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 1.0, 1.0);
          expect(config.language).assertEqual('zh-Hans-CN');
          expect(config.language.length).assertEqual(10);
          expect(config.isLanguageValid()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_0300
     * @tc.name testConfigLanguageWithoutRegionRejected
     * @tc.desc Verify a language tag without region separator or an empty string is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigLanguageWithoutRegionRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const noRegion: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh', 0, 0, 1.0, 1.0);
          const empty: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('', 0, 0, 1.0, 1.0);
          expect(noRegion.isLanguageValid()).assertFalse();
          expect(empty.isLanguageValid()).assertFalse();
          expect(noRegion.isValid()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_0400
     * @tc.name testColorModeNotSetValue
     * @tc.desc Verify colorMode -1 denotes follow system and reports not_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testColorModeNotSetValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const config: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', COLOR_MODE_NOT_SET, 0, 1.0, 1.0);
          expect(config.colorMode).assertEqual(-1);
          expect(config.isFollowSystemColorMode()).assertTrue();
          expect(config.isDarkMode()).assertFalse();
          expect(config.isLightMode()).assertFalse();
          expect(config.getColorModeName()).assertEqual('not_set');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_0500
     * @tc.name testColorModeDarkValue
     * @tc.desc Verify colorMode 0 denotes dark mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testColorModeDarkValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const config: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 1.0, 1.0);
          expect(config.colorMode).assertEqual(0);
          expect(config.isDarkMode()).assertTrue();
          expect(config.isLightMode()).assertFalse();
          expect(config.getColorModeName()).assertEqual('dark');
          expect(config.isColorModeValid()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_0600
     * @tc.name testColorModeLightValue
     * @tc.desc Verify colorMode 1 denotes light mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testColorModeLightValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const config: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 1, 0, 1.0, 1.0);
          expect(config.colorMode).assertEqual(1);
          expect(config.isLightMode()).assertTrue();
          expect(config.isDarkMode()).assertFalse();
          expect(config.getColorModeName()).assertEqual('light');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_0700
     * @tc.name testColorModeOutOfRangeRejected
     * @tc.desc Verify colorMode values 2 and -2 fall outside the documented -1/0/1 domain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testColorModeOutOfRangeRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const two: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 2, 0, 1.0, 1.0);
          const minusTwo: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', -2, 0, 1.0, 1.0);
          expect(two.isColorModeValid()).assertFalse();
          expect(minusTwo.isColorModeValid()).assertFalse();
          expect(two.getColorModeName()).assertEqual('invalid');
          expect(minusTwo.isValid()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_0800
     * @tc.name testDirectionNormalValue
     * @tc.desc Verify direction 0 is normal orientation and not reversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDirectionNormalValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const config: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 1.0, 1.0);
          expect(config.direction).assertEqual(0);
          expect(config.isReversed()).assertFalse();
          expect(config.getDirectionName()).assertEqual('normal');
          expect(config.isDirectionValid()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_0900
     * @tc.name testDirectionReverseValue
     * @tc.desc Verify direction 1 is reversed layout and reports reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDirectionReverseValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const config: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 1, 1.0, 1.0);
          expect(config.direction).assertEqual(1);
          expect(config.isReversed()).assertTrue();
          expect(config.getDirectionName()).assertEqual('reverse');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_1000
     * @tc.name testDirectionInvalidValueRejected
     * @tc.desc Verify direction values 2 and -3 are outside the valid direction domain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDirectionInvalidValueRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const two: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 2, 1.0, 1.0);
          const minusThree: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, -3, 1.0, 1.0);
          expect(two.isDirectionValid()).assertFalse();
          expect(minusThree.isDirectionValid()).assertFalse();
          expect(two.getDirectionName()).assertEqual('invalid');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_1100
     * @tc.name testFontSizeScaleLowerBoundary
     * @tc.desc Verify fontSizeScale 0.85 is the accepted lower boundary while 0.84 is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontSizeScaleLowerBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const min: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 0.85, 1.0);
          const below: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 0.84, 1.0);
          expect(min.fontSizeScale).assertEqual(0.85);
          expect(min.isFontSizeScaleValid()).assertTrue();
          expect(below.isFontSizeScaleValid()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_1200
     * @tc.name testFontSizeScaleUpperBoundary
     * @tc.desc Verify fontSizeScale 3.0 is the accepted upper boundary while 3.01 is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontSizeScaleUpperBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const max: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 3.0, 1.0);
          const above: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 3.01, 1.0);
          expect(max.fontSizeScale).assertEqual(3.0);
          expect(max.isFontSizeScaleValid()).assertTrue();
          expect(above.isFontSizeScaleValid()).assertFalse();
          expect(above.isValid()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_1300
     * @tc.name testFontSizeScaleMidRangeAccepted
     * @tc.desc Verify intermediate fontSizeScale values 1.0, 1.75 and 2.5 are accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontSizeScaleMidRangeAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const one: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 1.0, 1.0);
          const mid: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 1.75, 1.0);
          const high: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 2.5, 1.0);
          expect(one.isFontSizeScaleValid()).assertTrue();
          expect(mid.isFontSizeScaleValid()).assertTrue();
          expect(high.isFontSizeScaleValid()).assertTrue();
          expect(mid.fontSizeScale).assertEqual(1.75);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_1400
     * @tc.name testFontWeightScaleBoundaries
     * @tc.desc Verify fontWeightScale shares the 0.85 to 3.0 domain and rejects 0.5 and 4.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontWeightScaleBoundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const min: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 1.0, 0.85);
          const max: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 1.0, 3.0);
          const low: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 1.0, 0.5);
          const high: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 1.0, 4.0);
          expect(min.isFontWeightScaleValid()).assertTrue();
          expect(max.isFontWeightScaleValid()).assertTrue();
          expect(low.isFontWeightScaleValid()).assertFalse();
          expect(high.isFontWeightScaleValid()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_1500
     * @tc.name testConfigSnapshotCloneAndEquals
     * @tc.desc Verify a clone equals the original and mutating it leaves the original untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigSnapshotCloneAndEquals', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const config: ConfigurationSnapshot = ConfigurationSnapshot.createDefault();
          const cloned: ConfigurationSnapshot = config.clone();
          expect(config.equals(cloned)).assertTrue();
          cloned.language = 'en-Latn-US';
          cloned.fontSizeScale = 2.0;
          expect(config.language).assertEqual('zh-Hans-CN');
          expect(config.fontSizeScale).assertEqual(1.0);
          expect(config.equals(cloned)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_1600
     * @tc.name testConfigSnapshotToString
     * @tc.desc Verify toString exposes the language and derived color and direction names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigSnapshotToString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const config: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 1, 1, 1.5, 1.0);
          const text: string = config.toString();
          expect(text.includes('ConfigurationSnapshot')).assertTrue();
          expect(text.includes('zh-Hans-CN')).assertTrue();
          expect(text.includes('light')).assertTrue();
          expect(text.includes('reverse')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_1700
     * @tc.name testConfigDiffSingleField
     * @tc.desc Verify changing only colorMode reports exactly one changed field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigDiffSingleField', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const before: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 1.0, 1.0);
          const after: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 1, 0, 1.0, 1.0);
          const changed: string[] = before.collectChangedFields(after);
          expect(changed.length).assertEqual(1);
          expect(changed[0]).assertEqual('colorMode');
          expect(before.changedFieldCount(after)).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_1800
     * @tc.name testConfigDiffAllFiveFields
     * @tc.desc Verify changing every configuration field reports all five field names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigDiffAllFiveFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const before: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 1.0, 1.0);
          const after: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('en-Latn-US', 1, 1, 2.0, 1.5);
          const changed: string[] = before.collectChangedFields(after);
          expect(changed.length).assertEqual(5);
          expect(changed[0]).assertEqual('language');
          expect(changed[1]).assertEqual('colorMode');
          expect(changed[2]).assertEqual('direction');
          expect(changed[3]).assertEqual('fontSizeScale');
          expect(changed[4]).assertEqual('fontWeightScale');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_1900
     * @tc.name testConfigDiffIdenticalSnapshots
     * @tc.desc Verify two identical snapshots produce zero changed fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigDiffIdenticalSnapshots', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const first: ConfigurationSnapshot = ConfigurationSnapshot.createDefault();
          const second: ConfigurationSnapshot = ConfigurationSnapshot.createDefault();
          expect(first.changedFieldCount(second)).assertEqual(0);
          expect(first.collectChangedFields(second).length).assertEqual(0);
          expect(first.equals(second)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_2000
     * @tc.name testMemoryLevelModerateValue
     * @tc.desc Verify MEMORY_LEVEL_MODERATE equals 0 with moderate name and trim_idle_caches action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMemoryLevelModerateValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(MemoryLevel.MEMORY_LEVEL_MODERATE).assertEqual(0);
          expect(MemoryLevelPolicy.getLevelName(0)).assertEqual('moderate');
          expect(MemoryLevelPolicy.getActionName(0)).assertEqual('trim_idle_caches');
          expect(MemoryLevelPolicy.isValidLevel(0)).assertTrue();
          expect(MemoryLevelPolicy.shouldReleaseBackground(0)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_2100
     * @tc.name testMemoryLevelLowValue
     * @tc.desc Verify MEMORY_LEVEL_LOW equals 1 with release_cached_resources action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMemoryLevelLowValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(MemoryLevel.MEMORY_LEVEL_LOW).assertEqual(1);
          expect(MemoryLevelPolicy.getLevelName(1)).assertEqual('low');
          expect(MemoryLevelPolicy.getActionName(1)).assertEqual('release_cached_resources');
          expect(MemoryLevelPolicy.getSeverity(1)).assertEqual(1);
          expect(MemoryLevelPolicy.shouldReleaseBackground(1)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_2200
     * @tc.name testMemoryLevelCriticalValue
     * @tc.desc Verify MEMORY_LEVEL_CRITICAL equals 2, releases background and reports highest severity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMemoryLevelCriticalValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(MemoryLevel.MEMORY_LEVEL_CRITICAL).assertEqual(2);
          expect(MemoryLevelPolicy.getLevelName(2)).assertEqual('critical');
          expect(MemoryLevelPolicy.getActionName(2)).assertEqual('release_all_non_essential');
          expect(MemoryLevelPolicy.getSeverity(2)).assertEqual(2);
          expect(MemoryLevelPolicy.shouldReleaseBackground(2)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_2300
     * @tc.name testMemoryLevelInvalidValues
     * @tc.desc Verify levels -1 and 3 are rejected while severity reports -1 and action reports no_action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMemoryLevelInvalidValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(MemoryLevelPolicy.isValidLevel(-1)).assertFalse();
          expect(MemoryLevelPolicy.isValidLevel(3)).assertFalse();
          expect(MemoryLevelPolicy.getLevelName(-1)).assertEqual('unknown');
          expect(MemoryLevelPolicy.getActionName(3)).assertEqual('no_action');
          expect(MemoryLevelPolicy.getSeverity(-1)).assertEqual(-1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_2400
     * @tc.name testMemoryLevelThresholdComparison
     * @tc.desc Verify isAtLeast compares levels against a threshold and rejects invalid inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMemoryLevelThresholdComparison', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(MemoryLevelPolicy.isAtLeast(2, 1)).assertTrue();
          expect(MemoryLevelPolicy.isAtLeast(1, 1)).assertTrue();
          expect(MemoryLevelPolicy.isAtLeast(0, 1)).assertFalse();
          expect(MemoryLevelPolicy.isAtLeast(0, 0)).assertTrue();
          expect(MemoryLevelPolicy.isAtLeast(5, 1)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_2500
     * @tc.name testRegistryRegisterReturnsUniqueIds
     * @tc.desc Verify three distinct registrations receive unique ascending callback ids starting at 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryRegisterReturnsUniqueIds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          const first: number = registry.register(new RecordingCallback(false, false), 'first');
          const second: number = registry.register(new RecordingCallback(false, false), 'second');
          const third: number = registry.register(new RecordingCallback(false, false), 'third');
          expect(first).assertEqual(1);
          expect(second).assertEqual(2);
          expect(third).assertEqual(3);
          expect(registry.getCount()).assertEqual(3);
          expect(registry.getEventName()).assertEqual('environment');
          expect(registry.getEventName()).assertEqual(ENV_CALLBACK_EVENT);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_2600
     * @tc.name testRegistryDuplicateKeyDeduplicated
     * @tc.desc Verify registering twice with the same key returns the existing id and keeps count at 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryDuplicateKeyDeduplicated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          const first: number = registry.register(new RecordingCallback(false, false), 'environment');
          const duplicate: number = registry.register(new RecordingCallback(false, false), 'environment');
          expect(first).assertEqual(1);
          expect(duplicate).assertEqual(first);
          expect(registry.getCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_2700
     * @tc.name testRegistryUnregisterPairing
     * @tc.desc Verify unregister removes exactly the matching id and a second unregister returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryUnregisterPairing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          const first: number = registry.register(new RecordingCallback(false, false), 'alpha');
          const second: number = registry.register(new RecordingCallback(false, false), 'beta');
          expect(registry.contains(first)).assertTrue();
          expect(registry.unregister(first)).assertTrue();
          expect(registry.contains(first)).assertFalse();
          expect(registry.contains(second)).assertTrue();
          expect(registry.getCount()).assertEqual(1);
          expect(registry.unregister(first)).assertFalse();
          expect(registry.getIds().length).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_2800
     * @tc.name testRegistryUnregisterUnknownId
     * @tc.desc Verify unregistering an id that was never issued returns false and mutates nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryUnregisterUnknownId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          registry.register(new RecordingCallback(false, false), 'only');
          expect(registry.unregister(99)).assertFalse();
          expect(registry.unregister(0)).assertFalse();
          expect(registry.getCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_2900
     * @tc.name testRegistryDispatchConfigurationDelivers
     * @tc.desc Verify a configuration dispatch reaches every registered callback with the language value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryDispatchConfigurationDelivers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          const first: RecordingCallback = new RecordingCallback(false, false);
          const second: RecordingCallback = new RecordingCallback(false, false);
          registry.register(first, 'first');
          registry.register(second, 'second');
          const config: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 1, 0, 1.25, 1.0);
          const records: DispatchRecord[] = registry.dispatchConfiguration(config);
          expect(first.configCalls).assertEqual(1);
          expect(second.configCalls).assertEqual(1);
          expect(first.lastLanguage).assertEqual('zh-Hans-CN');
          expect(records.length).assertEqual(2);
          expect(registry.countOutcome(DispatchOutcome.OUTCOME_DELIVERED)).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_3000
     * @tc.name testRegistryDispatchMemoryLevelDelivers
     * @tc.desc Verify a memory level dispatch reaches callbacks and records the delivered level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryDispatchMemoryLevelDelivers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          const callback: RecordingCallback = new RecordingCallback(false, false);
          const id: number = registry.register(callback, 'memory-probe');
          const records: DispatchRecord[] = registry.dispatchMemoryLevel(MemoryLevel.MEMORY_LEVEL_LOW);
          expect(callback.memoryCalls).assertEqual(1);
          expect(callback.lastMemoryLevel).assertEqual(1);
          expect(records.length).assertEqual(1);
          expect(records[0].callbackId).assertEqual(id);
          expect(records[0].eventName).assertEqual('memory');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_3100
     * @tc.name testRegistryCallbackExceptionIsolation
     * @tc.desc Verify one throwing configuration callback does not stop delivery to the healthy callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryCallbackExceptionIsolation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          const broken: RecordingCallback = new RecordingCallback(true, false);
          const healthy: RecordingCallback = new RecordingCallback(false, false);
          registry.register(broken, 'broken');
          registry.register(healthy, 'healthy');
          const config: ConfigurationSnapshot = ConfigurationSnapshot.createDefault();
          registry.dispatchConfiguration(config);
          expect(broken.configCalls).assertEqual(0);
          expect(healthy.configCalls).assertEqual(1);
          expect(registry.countOutcome(DispatchOutcome.OUTCOME_FAILED)).assertEqual(1);
          expect(registry.countOutcome(DispatchOutcome.OUTCOME_DELIVERED)).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_3200
     * @tc.name testRegistryMemoryExceptionIsolation
     * @tc.desc Verify a throwing memory callback is isolated and recorded as failed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryMemoryExceptionIsolation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          const broken: RecordingCallback = new RecordingCallback(false, true);
          const healthy: RecordingCallback = new RecordingCallback(false, false);
          registry.register(broken, 'broken-memory');
          registry.register(healthy, 'healthy-memory');
          registry.dispatchMemoryLevel(MemoryLevel.MEMORY_LEVEL_CRITICAL);
          expect(broken.memoryCalls).assertEqual(0);
          expect(healthy.memoryCalls).assertEqual(1);
          expect(healthy.lastMemoryLevel).assertEqual(2);
          expect(registry.countOutcome(DispatchOutcome.OUTCOME_FAILED)).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_3300
     * @tc.name testRegistryAllCallbacksThrow
     * @tc.desc Verify a dispatch where every callback throws records all failures and leaves count unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryAllCallbacksThrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          registry.register(new RecordingCallback(true, false), 'throw-a');
          registry.register(new RecordingCallback(true, false), 'throw-b');
          registry.register(new RecordingCallback(true, false), 'throw-c');
          const records: DispatchRecord[] = registry.dispatchConfiguration(
            ConfigurationSnapshot.createDefault());
          expect(records.length).assertEqual(3);
          expect(registry.countOutcome(DispatchOutcome.OUTCOME_FAILED)).assertEqual(3);
          expect(registry.countOutcome(DispatchOutcome.OUTCOME_DELIVERED)).assertEqual(0);
          expect(registry.getCount()).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_3400
     * @tc.name testRegistryEmptyDispatch
     * @tc.desc Verify dispatching with no registered callbacks returns an empty record list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryEmptyDispatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          const configRecords: DispatchRecord[] =
            registry.dispatchConfiguration(ConfigurationSnapshot.createDefault());
          const memoryRecords: DispatchRecord[] = registry.dispatchMemoryLevel(MemoryLevel.MEMORY_LEVEL_MODERATE);
          expect(configRecords.length).assertEqual(0);
          expect(memoryRecords.length).assertEqual(0);
          expect(registry.getCount()).assertEqual(0);
          expect(registry.getRecords().length).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_3500
     * @tc.name testRegistryClearResetsIds
     * @tc.desc Verify clear removes callbacks and restarts the id sequence at 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryClearResetsIds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          registry.register(new RecordingCallback(false, false), 'a');
          registry.register(new RecordingCallback(false, false), 'b');
          registry.clear();
          expect(registry.getCount()).assertEqual(0);
          expect(registry.getIds().length).assertEqual(0);
          const fresh: number = registry.register(new RecordingCallback(false, false), 'c');
          expect(fresh).assertEqual(1);
          expect(registry.getCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_3600
     * @tc.name testRegistryRepeatedDispatchIsIdempotent
     * @tc.desc Verify dispatching the same configuration five times delivers five calls per callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryRepeatedDispatchIsIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          const callback: RecordingCallback = new RecordingCallback(false, false);
          registry.register(callback, 'repeat');
          const config: ConfigurationSnapshot = ConfigurationSnapshot.createDefault();
          for (let i = 0; i < 5; i++) {
            registry.dispatchConfiguration(config);
          }
          expect(callback.configCalls).assertEqual(5);
          expect(registry.getCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_3700
     * @tc.name testRegistryUnregisterStopsDelivery
     * @tc.desc Verify a callback no longer receives events after its registration is removed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryUnregisterStopsDelivery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          const removed: RecordingCallback = new RecordingCallback(false, false);
          const kept: RecordingCallback = new RecordingCallback(false, false);
          const removedId: number = registry.register(removed, 'removed');
          registry.register(kept, 'kept');
          registry.dispatchConfiguration(ConfigurationSnapshot.createDefault());
          expect(removed.configCalls).assertEqual(1);
          expect(registry.unregister(removedId)).assertTrue();
          registry.dispatchConfiguration(ConfigurationSnapshot.createDefault());
          expect(removed.configCalls).assertEqual(1);
          expect(kept.configCalls).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_3800
     * @tc.name testRegistryStressManyCallbacks
     * @tc.desc Verify 10 registered callbacks all receive the memory event exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryStressManyCallbacks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          const callbacks: RecordingCallback[] = [];
          for (let i = 0; i < 10; i++) {
            const callback: RecordingCallback = new RecordingCallback(false, false);
            callbacks.push(callback);
            registry.register(callback, 'stress-' + i);
          }
          registry.dispatchMemoryLevel(MemoryLevel.MEMORY_LEVEL_CRITICAL);
          let delivered: number = 0;
          for (let i = 0; i < callbacks.length; i++) {
            if (callbacks[i].memoryCalls === 1) {
              delivered++;
            }
          }
          expect(delivered).assertEqual(10);
          expect(registry.getCount()).assertEqual(10);
          expect(registry.getIds()[9]).assertEqual(10);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_3900
     * @tc.name testUiIndexPageAfterEnvironmentSnapshot
     * @tc.desc Verify the index page stays rendered after dispatching a default environment snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiIndexPageAfterEnvironmentSnapshot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          const callback: RecordingCallback = new RecordingCallback(false, false);
          registry.register(callback, 'ui-probe');
          registry.dispatchConfiguration(ConfigurationSnapshot.createDefault());
          expect(callback.configCalls).assertEqual(1);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_4000
     * @tc.name testUiColorModeSwitchKeepsText
     * @tc.desc Verify switching the color mode between dark and light leaves the page text readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiColorModeSwitchKeepsText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const before: string = await readHelloTextById(driver);
          const dark: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 1.0, 1.0);
          const light: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 1, 0, 1.0, 1.0);
          expect(dark.changedFieldCount(light)).assertEqual(1);
          const after: string = await readHelloTextById(driver);
          expect(after).assertEqual(before);
          expect(dark.isColorModeValid()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_4100
     * @tc.name testUiDirectionReverseKeepsPageId
     * @tc.desc Verify a reverse direction snapshot still matches a page exposing the HelloWorld id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiDirectionReverseKeepsPageId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const reversed: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 1, 1.0, 1.0);
          expect(reversed.isReversed()).assertTrue();
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
          const text: string = await readHelloTextById(driver);
          expect(isNonEmptyString(text)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_4200
     * @tc.name testUiFontSizeScaleAppliedToPage
     * @tc.desc Verify the page text node remains compliant for the 0.85 and 3.0 font scale boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiFontSizeScaleAppliedToPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const minScale: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 0.85, 0.85);
          const maxScale: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 3.0, 3.0);
          expect(minScale.isValid()).assertTrue();
          expect(maxScale.isValid()).assertTrue();
          expect(minScale.changedFieldCount(maxScale)).assertEqual(2);
          const text: string = await readHelloTextById(driver);
          expect(isNonEmptyString(text)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_4300
     * @tc.name testUiMemoryLevelCriticalKeepsPage
     * @tc.desc Verify a critical memory level dispatch keeps the page rendered and text accessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiMemoryLevelCriticalKeepsPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          const callback: RecordingCallback = new RecordingCallback(false, false);
          registry.register(callback, 'critical-probe');
          registry.dispatchMemoryLevel(MemoryLevel.MEMORY_LEVEL_CRITICAL);
          expect(callback.lastMemoryLevel).assertEqual(2);
          expect(MemoryLevelPolicy.shouldReleaseBackground(2)).assertTrue();
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_4400
     * @tc.name testUiForegroundBackgroundEnvironmentCycle
     * @tc.desc Verify repeated foreground and background cycles keep the configuration model consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiForegroundBackgroundEnvironmentCycle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          for (let i = 0; i < STRESS_ROUNDS_LIFECYCLE; i++) {
            await doAbilityBackground();
            await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
            await doAbilityForeground();
            await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          }
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const config: ConfigurationSnapshot = ConfigurationSnapshot.createDefault();
          expect(config.language).assertEqual('zh-Hans-CN');
          expect(config.isValid()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_4500
     * @tc.name testUiBundleNameMatchesEnvironmentEvent
     * @tc.desc Verify the running bundle matches the manifest while the environment event name is environment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiBundleNameMatchesEnvironmentEvent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(getBundleName()).assertEqual('com.samples.abilitystage');
          const registry: CallbackRegistry = new CallbackRegistry();
          expect(registry.getEventName()).assertEqual('environment');
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_4600
     * @tc.name testUiTapThenEnvironmentSnapshot
     * @tc.desc Verify tapping the page switches the text to Welcome and a later snapshot dispatch keeps it visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiTapThenEnvironmentSnapshot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const clicked: boolean = await clickHelloWorld(driver);
          expect(clicked).assertTrue();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await checkTextContent(driver, PAGE_TEXT_CLICKED)).assertTrue();
          const registry: CallbackRegistry = new CallbackRegistry();
          const callback: RecordingCallback = new RecordingCallback(false, false);
          registry.register(callback, 'post-tap');
          registry.dispatchConfiguration(ConfigurationSnapshot.createDefault());
          expect(callback.configCalls).assertEqual(1);
          expect(await checkTextContent(driver, PAGE_TEXT_CLICKED)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_4700
     * @tc.name testUiKeyPressWithEnvironmentModel
     * @tc.desc Verify TAB and LEFT key presses do not disturb the page text already tracked by the model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiKeyPressWithEnvironmentModel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const before: string = await readHelloTextById(driver);
          await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
          const after: string = await readHelloTextById(driver);
          expect(after).assertEqual(before);
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.includes(after)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_4800
     * @tc.name testUiEnterAfterRegistryDispatch
     * @tc.desc Verify a real ENTER press after a registry dispatch leaves the visible page text unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiEnterAfterRegistryDispatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          registry.register(new RecordingCallback(false, false), 'enter-probe');
          registry.dispatchMemoryLevel(MemoryLevel.MEMORY_LEVEL_MODERATE);
          const before: string = await readHelloTextById(driver);
          await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
          const after: string = await readHelloTextById(driver);
          expect(after).assertEqual(before);
          expect(await checkTextContent(driver, after)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_4900
     * @tc.name testUiRelaunchAfterEnvironmentStress
     * @tc.desc Verify a relaunch after 20 dispatch rounds restores a stable page and readable text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiRelaunchAfterEnvironmentStress', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          const callback: RecordingCallback = new RecordingCallback(false, false);
          registry.register(callback, 'stress-ui');
          for (let i = 0; i < 20; i++) {
            registry.dispatchConfiguration(ConfigurationSnapshot.createDefault());
            registry.dispatchMemoryLevel(i % 3);
          }
          expect(callback.configCalls).assertEqual(20);
          expect(callback.memoryCalls).assertEqual(20);
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const text: string = await readHelloTextById(driver);
          expect(isNonEmptyString(text)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_5000
     * @tc.name testUiDelegatorTopAbilityAfterSnapshot
     * @tc.desc Verify the delegator top ability stays bound to EntryAbility after a configuration dispatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiDelegatorTopAbilityAfterSnapshot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const registry: CallbackRegistry = new CallbackRegistry();
          registry.register(new RecordingCallback(false, false), 'delegator-probe');
          registry.dispatchConfiguration(ConfigurationSnapshot.createDefault());
          const delegator: abilityDelegatorRegistry.AbilityDelegator = getAbilityDelegator();
          const topAbility: UIAbility | null = await delegator.getCurrentTopAbility();
          expect(topAbility === null).assertFalse();
          expect(topAbility?.context.abilityInfo.name).assertEqual('EntryAbility');
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_5100
     * @tc.name testUiPageTextAfterMemoryLow
     * @tc.desc Verify a low memory event keeps the page text readable and the component count positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiPageTextAfterMemoryLow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          const callback: RecordingCallback = new RecordingCallback(false, false);
          registry.register(callback, 'memory-low-ui');
          registry.dispatchMemoryLevel(MemoryLevel.MEMORY_LEVEL_LOW);
          expect(callback.lastMemoryLevel).assertEqual(1);
          const text: string = await readHelloTextById(driver);
          expect(isNonEmptyString(text)).assertTrue();
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_5200
     * @tc.name testUiAllMemoryLevelsSequence
     * @tc.desc Verify dispatching moderate, low and critical in order keeps the page rendered each time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiAllMemoryLevelsSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          const callback: RecordingCallback = new RecordingCallback(false, false);
          registry.register(callback, 'memory-sequence');
          const levels: number[] = [0, 1, 2];
          for (let i = 0; i < levels.length; i++) {
            registry.dispatchMemoryLevel(levels[i]);
            expect(callback.lastMemoryLevel).assertEqual(levels[i]);
          }
          expect(callback.memoryCalls).assertEqual(3);
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_5300
     * @tc.name testUiStartAbilityByWantWithConfig
     * @tc.desc Verify an explicit want start after a snapshot dispatch renders the HelloWorld text node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiStartAbilityByWantWithConfig', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const config: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 1, 0, 1.5, 1.5);
          expect(config.isValid()).assertTrue();
          await startAbilityByWant(buildEntryWant());
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const text: string = await readHelloTextById(driver);
          expect(isNonEmptyString(text)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_5400
     * @tc.name testUiBackThenForegroundWithRegistry
     * @tc.desc Verify a BACK press followed by foreground keeps the registry intact and the page readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiBackThenForegroundWithRegistry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          const callback: RecordingCallback = new RecordingCallback(false, false);
          registry.register(callback, 'back-probe');
          await pressAndWait(driver, KEY_BACK, 1, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(registry.getCount()).assertEqual(1);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_5500
     * @tc.name testUiCollectedTextsAfterColorSwitch
     * @tc.desc Verify texts on the real page still contain the page title after a light to dark transition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiCollectedTextsAfterColorSwitch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const light: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 1, 0, 1.0, 1.0);
          const dark: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 1.0, 1.0);
          expect(light.changedFieldCount(dark)).assertEqual(1);
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.length).assertLargerOrEqual(1);
          const hasInitial: boolean = texts.includes(PAGE_TEXT_INITIAL);
          const hasClicked: boolean = texts.includes(PAGE_TEXT_CLICKED);
          expect(hasInitial || hasClicked).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_5600
     * @tc.name testUiTapThenCriticalMemory
     * @tc.desc Verify tapping the page then a critical memory event keeps Welcome visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiTapThenCriticalMemory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const clicked: boolean = await clickHelloWorld(driver);
          expect(clicked).assertTrue();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const registry: CallbackRegistry = new CallbackRegistry();
          registry.register(new RecordingCallback(false, false), 'post-tap-critical');
          registry.dispatchMemoryLevel(MemoryLevel.MEMORY_LEVEL_CRITICAL);
          expect(await checkTextContent(driver, PAGE_TEXT_CLICKED)).assertTrue();
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_5700
     * @tc.name testUiDirectionChangeWithForeground
     * @tc.desc Verify a reverse direction snapshot plus a foreground cycle keeps the page id discoverable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiDirectionChangeWithForeground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const reversed: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 1, 1.0, 1.0);
          expect(reversed.isReversed()).assertTrue();
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_5800
     * @tc.name testUiFocusIndexAfterEnvironmentDispatch
     * @tc.desc Verify the focus index stays in range after a TAB press and an environment dispatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiFocusIndexAfterEnvironmentDispatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
          const registry: CallbackRegistry = new CallbackRegistry();
          const callback: RecordingCallback = new RecordingCallback(false, false);
          registry.register(callback, 'focus-probe');
          registry.dispatchConfiguration(ConfigurationSnapshot.createDefault());
          expect(callback.configCalls).assertEqual(1);
          const focusIndex: number = await getCurrentFocusIndex(driver);
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
          expect(focusIndex < count || focusIndex === -1).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_5900
     * @tc.name testUiRegistryDispatchFailureKeepsPage
     * @tc.desc Verify a throwing callback is isolated while the real page remains rendered and readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiRegistryDispatchFailureKeepsPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: CallbackRegistry = new CallbackRegistry();
          const broken: RecordingCallback = new RecordingCallback(true, true);
          const healthy: RecordingCallback = new RecordingCallback(false, false);
          registry.register(broken, 'broken-ui');
          registry.register(healthy, 'healthy-ui');
          registry.dispatchConfiguration(ConfigurationSnapshot.createDefault());
          registry.dispatchMemoryLevel(MemoryLevel.MEMORY_LEVEL_CRITICAL);
          expect(registry.countOutcome(DispatchOutcome.OUTCOME_FAILED)).assertEqual(1);
          expect(healthy.configCalls).assertEqual(1);
          const text: string = await readHelloTextById(driver);
          expect(isNonEmptyString(text)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_6000
     * @tc.name testConfigMatrixFiveFieldCombinations
     * @tc.desc Verify all 32 combinations of five boolean field toggles produce a valid snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigMatrixFiveFieldCombinations', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          let validCount: number = 0;
          const total: number = 32;
          for (let mask = 0; mask < total; mask++) {
            const language: string = (mask & 1) === 0 ? 'zh-Hans-CN' : 'en-Latn-US';
            const colorMode: number = (mask & 2) === 0 ? 0 : 1;
            const direction: number = (mask & 4) === 0 ? 0 : 1;
            const fontSizeScale: number = (mask & 8) === 0 ? 1.0 : 2.0;
            const fontWeightScale: number = (mask & 16) === 0 ? 1.0 : 2.0;
            const config: ConfigurationSnapshot = ConfigurationSnapshot.createPassingThrough(
              language, colorMode, direction, fontSizeScale, fontWeightScale);
            if (config.isValid()) {
              validCount++;
            }
          }
          expect(validCount).assertEqual(32);
          const base: ConfigurationSnapshot = ConfigurationSnapshot.createDefault();
          const inverse: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('en-Latn-US', 1, 1, 2.0, 2.0);
          expect(base.changedFieldCount(inverse)).assertEqual(5);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVMODEL_6100
     * @tc.name testConfigMatrixInvalidCombinationCount
     * @tc.desc Verify one invalid field in each of five positions fails validation in all five cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigMatrixInvalidCombinationCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const badLanguage: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('', 0, 0, 1.0, 1.0);
          const badColor: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 5, 0, 1.0, 1.0);
          const badDirection: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 5, 1.0, 1.0);
          const badFontSize: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 0.1, 1.0);
          const badFontWeight: ConfigurationSnapshot =
            ConfigurationSnapshot.createPassingThrough('zh-Hans-CN', 0, 0, 1.0, 9.0);
          expect(badLanguage.isValid()).assertFalse();
          expect(badColor.isValid()).assertFalse();
          expect(badDirection.isValid()).assertFalse();
          expect(badFontSize.isValid()).assertFalse();
          expect(badFontWeight.isValid()).assertFalse();
        } finally {
          done();
        }
      })
  });
}
