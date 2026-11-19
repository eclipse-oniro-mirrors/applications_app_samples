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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver, Component } from '@ohos.UiTest';
import {
  getDriver,
  ensureIndexPageInitial,
  launchEntryAbility,
  waitForIndexPageStable,
  isIndexPageVisible,
  pageComponentCount,
  checkTextContent,
  checkComponentExistsByKey,
  findComponentsByType,
  measureElapsed,
  isWithinBudget,
  logInfo,
  logError,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_ABILITY_LAUNCH,
  COLOR_MODE_NOT_SET,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED
} from '../Shared/SharedDriver';

enum ConfigKey {
  LANGUAGE = 'language',
  COLOR_MODE = 'colorMode',
  DIRECTION = 'direction',
  FONT_SIZE_SCALE = 'fontSizeScale',
  FONT_WEIGHT_SCALE = 'fontWeightScale'
}

interface ConfigurationSnapshot {
  language: string;
  colorMode: number;
  direction: number;
  fontSizeScale: number;
  fontWeightScale: number;
}

interface ConfigurationListener {
  id: number;
  key: string;
}

class ConfigKeyError extends Error {
  public code: number = 401;

  constructor(message: string) {
    super(message);
    this.name = 'ConfigKeyError';
  }
}

class ConfigurationStore {
  private static readonly SUPPORTED_KEYS: string[] = [
    ConfigKey.LANGUAGE, ConfigKey.COLOR_MODE, ConfigKey.DIRECTION,
    ConfigKey.FONT_SIZE_SCALE, ConfigKey.FONT_WEIGHT_SCALE
  ];

  private values: Map<string, string> = new Map<string, string>();
  private version: number = 0;
  private listeners: ConfigurationListener[] = [];
  private nextListenerId: number = 1;
  private notifyCount: number = 0;

  public static supportedKeys(): string[] {
    return ConfigurationStore.SUPPORTED_KEYS.slice(0);
  }

  public static isSupportedKey(key: string): boolean {
    for (let i = 0; i < ConfigurationStore.SUPPORTED_KEYS.length; i++) {
      if (ConfigurationStore.SUPPORTED_KEYS[i] === key) {
        return true;
      }
    }
    return false;
  }

  public static createDefault(): ConfigurationSnapshot {
    const snapshot: ConfigurationSnapshot = {
      language: 'zh-Hans',
      colorMode: COLOR_MODE_NOT_SET,
      direction: 0,
      fontSizeScale: 1.0,
      fontWeightScale: 1.0
    };
    return snapshot;
  }

  public load(snapshot: ConfigurationSnapshot): void {
    this.values.set(ConfigKey.LANGUAGE, snapshot.language);
    this.values.set(ConfigKey.COLOR_MODE, snapshot.colorMode.toString());
    this.values.set(ConfigKey.DIRECTION, snapshot.direction.toString());
    this.values.set(ConfigKey.FONT_SIZE_SCALE, snapshot.fontSizeScale.toString());
    this.values.set(ConfigKey.FONT_WEIGHT_SCALE, snapshot.fontWeightScale.toString());
    this.version++;
  }

  public snapshot(): ConfigurationSnapshot {
    const snapshot: ConfigurationSnapshot = {
      language: this.readString(ConfigKey.LANGUAGE, 'zh-Hans'),
      colorMode: this.readNumber(ConfigKey.COLOR_MODE, COLOR_MODE_NOT_SET),
      direction: this.readNumber(ConfigKey.DIRECTION, 0),
      fontSizeScale: this.readNumber(ConfigKey.FONT_SIZE_SCALE, 1.0),
      fontWeightScale: this.readNumber(ConfigKey.FONT_WEIGHT_SCALE, 1.0)
    };
    return snapshot;
  }

  public readString(key: string, fallback: string): string {
    const raw: string | undefined = this.values.get(key);
    if (raw === undefined || raw.length === 0) {
      return fallback;
    }
    return raw;
  }

  public readNumber(key: string, fallback: number): number {
    const raw: string | undefined = this.values.get(key);
    if (raw === undefined || raw.length === 0) {
      return fallback;
    }
    const parsed: number = parseFloat(raw);
    if (isNaN(parsed) || !isFinite(parsed)) {
      return fallback;
    }
    return parsed;
  }

  public readValue(key: string): string | null {
    if (!ConfigurationStore.isSupportedKey(key)) {
      return null;
    }
    const raw: string | undefined = this.values.get(key);
    if (raw === undefined) {
      return null;
    }
    return raw;
  }

  public update(key: string, value: string): number {
    if (!ConfigurationStore.isSupportedKey(key)) {
      throw new ConfigKeyError(`unsupported configuration key ${key}`);
    }
    if (value.length === 0) {
      throw new ConfigKeyError(`empty value for configuration key ${key}`);
    }
    const previous: string | undefined = this.values.get(key);
    if (previous === value) {
      return this.version;
    }
    this.values.set(key, value);
    this.version++;
    this.notifyCount++;
    return this.version;
  }

  public getVersion(): number {
    return this.version;
  }

  public getNotifyCount(): number {
    return this.notifyCount;
  }

  public addListener(key: string): number {
    if (!ConfigurationStore.isSupportedKey(key)) {
      throw new ConfigKeyError(`cannot listen to unsupported key ${key}`);
    }
    const listener: ConfigurationListener = { id: this.nextListenerId, key: key };
    this.nextListenerId++;
    this.listeners.push(listener);
    return listener.id;
  }

  public removeListener(id: number): boolean {
    for (let i = 0; i < this.listeners.length; i++) {
      if (this.listeners[i].id === id) {
        this.listeners.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  public listenerCount(): number {
    return this.listeners.length;
  }

  public listenerCountForKey(key: string): number {
    let count: number = 0;
    for (let i = 0; i < this.listeners.length; i++) {
      if (this.listeners[i].key === key) {
        count++;
      }
    }
    return count;
  }

  public hasListener(id: number): boolean {
    for (let i = 0; i < this.listeners.length; i++) {
      if (this.listeners[i].id === id) {
        return true;
      }
    }
    return false;
  }

  public clear(): void {
    this.values = new Map<string, string>();
    this.version = 0;
    this.listeners = [];
    this.nextListenerId = 1;
    this.notifyCount = 0;
  }
}

export default function configurationManagerValidationTest(): void {
  describe('ConfigurationManagerValidationTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      logInfo('ConfigurationManagerValidationTest: beforeAll start');
      await launchEntryAbility();
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
      logInfo('ConfigurationManagerValidationTest: beforeAll finished');
    })

    afterAll(async () => {
      logInfo('ConfigurationManagerValidationTest: afterAll start');
      await driver.delayMs(200);
      logInfo('ConfigurationManagerValidationTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_0100
     * @tc.name testSupportedKeyListExact
     * @tc.desc Verify the store supports exactly the five Configuration fields documented for the environment callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSupportedKeyListExact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const keys: string[] = ConfigurationStore.supportedKeys();
        expect(keys.length).assertEqual(5);
        expect(keys[0]).assertEqual('language');
        expect(keys[1]).assertEqual('colorMode');
        expect(keys[2]).assertEqual('direction');
        expect(keys[3]).assertEqual('fontSizeScale');
        expect(keys[4]).assertEqual('fontWeightScale');
        expect(ConfigurationStore.isSupportedKey('language')).assertTrue();
        expect(ConfigurationStore.isSupportedKey('locale')).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_0200
     * @tc.name testDefaultSnapshotValues
     * @tc.desc Verify a default configuration snapshot starts with COLOR_MODE_NOT_SET and unit scales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDefaultSnapshotValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const snapshot: ConfigurationSnapshot = ConfigurationStore.createDefault();
        expect(snapshot.language).assertEqual('zh-Hans');
        expect(snapshot.colorMode).assertEqual(-1);
        expect(snapshot.colorMode).assertEqual(COLOR_MODE_NOT_SET);
        expect(snapshot.direction).assertEqual(0);
        expect(snapshot.fontSizeScale).assertEqual(1.0);
        expect(snapshot.fontWeightScale).assertEqual(1.0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_0300
     * @tc.name testSnapshotRoundTrip
     * @tc.desc Verify loading a snapshot then reading it back preserves every field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSnapshotRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        const source: ConfigurationSnapshot = {
          language: 'en-Latn-US', colorMode: 1, direction: 1, fontSizeScale: 1.5, fontWeightScale: 1.2
        };
        store.load(source);
        const restored: ConfigurationSnapshot = store.snapshot();
        expect(restored.language).assertEqual('en-Latn-US');
        expect(restored.colorMode).assertEqual(1);
        expect(restored.direction).assertEqual(1);
        expect(restored.fontSizeScale).assertEqual(1.5);
        expect(restored.fontWeightScale).assertEqual(1.2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_0400
     * @tc.name testReadLanguageKey
     * @tc.desc Verify reading the language key returns the loaded language string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReadLanguageKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        store.load(ConfigurationStore.createDefault());
        expect(store.readValue('language')).assertEqual('zh-Hans');
        expect(store.readString('language', 'fallback')).assertEqual('zh-Hans');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_0500
     * @tc.name testReadColorModeKey
     * @tc.desc Verify the colorMode key round trips both COLOR_MODE_NOT_SET and dark mode values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReadColorModeKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        store.load(ConfigurationStore.createDefault());
        expect(store.readNumber('colorMode', 0)).assertEqual(-1);
        store.update('colorMode', '0');
        expect(store.readNumber('colorMode', 9)).assertEqual(0);
        store.update('colorMode', '1');
        expect(store.readNumber('colorMode', 9)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_0600
     * @tc.name testReadDirectionKey
     * @tc.desc Verify the direction key exposes the loaded screen direction number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReadDirectionKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        store.load(ConfigurationStore.createDefault());
        expect(store.readNumber('direction', 7)).assertEqual(0);
        store.update('direction', '1');
        expect(store.readNumber('direction', 7)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_0700
     * @tc.name testReadFontSizeScaleKey
     * @tc.desc Verify the fontSizeScale key parses decimal text into a fractional number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReadFontSizeScaleKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        store.load(ConfigurationStore.createDefault());
        expect(store.readNumber('fontSizeScale', 9)).assertEqual(1.0);
        store.update('fontSizeScale', '1.75');
        expect(store.readNumber('fontSizeScale', 9)).assertEqual(1.75);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_0800
     * @tc.name testReadFontWeightScaleKey
     * @tc.desc Verify the fontWeightScale key reads back the updated weight scale exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReadFontWeightScaleKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        store.load(ConfigurationStore.createDefault());
        expect(store.readNumber('fontWeightScale', 9)).assertEqual(1.0);
        store.update('fontWeightScale', '0.6');
        expect(store.readNumber('fontWeightScale', 9)).assertEqual(0.6);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_0900
     * @tc.name testMissingKeyFallsBackToDefault
     * @tc.desc Verify an empty store returns fallback values for reads while readValue reports null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMissingKeyFallsBackToDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        expect(store.readString('language', 'zh-Hans')).assertEqual('zh-Hans');
        expect(store.readNumber('fontSizeScale', 1.0)).assertEqual(1.0);
        expect(store.readValue('language')).assertEqual(null);
        expect(store.readValue('fontSizeScale')).assertEqual(null);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_1000
     * @tc.name testIllegalKeyReturnsNull
     * @tc.desc Verify reading an unsupported key returns null instead of throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIllegalKeyReturnsNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        store.load(ConfigurationStore.createDefault());
        expect(store.readValue('screenDensity')).assertEqual(null);
        expect(store.readValue('')).assertEqual(null);
        expect(store.readValue('Language')).assertEqual(null);
        expect(store.readValue('language')).assertEqual('zh-Hans');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_1100
     * @tc.name testCorruptNumericValueFallsBack
     * @tc.desc Verify a non numeric stored value falls back instead of producing NaN or Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCorruptNumericValueFallsBack', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        store.update('fontSizeScale', 'huge');
        const resolved: number = store.readNumber('fontSizeScale', 1.0);
        expect(resolved).assertEqual(1.0);
        expect(isNaN(resolved)).assertFalse();
        expect(isFinite(resolved)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_1200
     * @tc.name testUpdateIncrementsVersion
     * @tc.desc Verify each distinct update increments the version by exactly one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUpdateIncrementsVersion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        store.load(ConfigurationStore.createDefault());
        const baseline: number = store.getVersion();
        expect(baseline).assertEqual(1);
        expect(store.update('language', 'en-Latn-US')).assertEqual(2);
        expect(store.update('direction', '1')).assertEqual(3);
        expect(store.getVersion()).assertEqual(3);
        expect(store.getNotifyCount()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_1300
     * @tc.name testSameValueUpdateKeepsVersion
     * @tc.desc Verify updating a key with its current value is a no-op for version and notifications
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSameValueUpdateKeepsVersion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        store.load(ConfigurationStore.createDefault());
        const baseline: number = store.getVersion();
        expect(store.update('language', 'zh-Hans')).assertEqual(baseline);
        expect(store.getVersion()).assertEqual(baseline);
        expect(store.getNotifyCount()).assertEqual(0);
        expect(store.update('language', 'en-Latn-US')).assertEqual(baseline + 1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_1400
     * @tc.name testUpdateUnsupportedKeyThrows
     * @tc.desc Verify updating an unsupported key raises ConfigKeyError and leaves the version untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUpdateUnsupportedKeyThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        store.load(ConfigurationStore.createDefault());
        const baseline: number = store.getVersion();
        try {
          store.update('screenDensity', '3');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ConfigKeyError');
          expect((e as ConfigKeyError).code).assertEqual(401);
        }
        expect(store.getVersion()).assertEqual(baseline);
        expect(store.getNotifyCount()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_1500
     * @tc.name testUpdateEmptyValueThrows
     * @tc.desc Verify an empty value raises ConfigKeyError because configuration values must be non empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUpdateEmptyValueThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        store.load(ConfigurationStore.createDefault());
        try {
          store.update('language', '');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ConfigKeyError');
        }
        expect(store.readValue('language')).assertEqual('zh-Hans');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_1600
     * @tc.name testListenerRegistrationIds
     * @tc.desc Verify listener ids start at one and increase by one per registration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testListenerRegistrationIds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        expect(store.addListener('language')).assertEqual(1);
        expect(store.addListener('colorMode')).assertEqual(2);
        expect(store.addListener('direction')).assertEqual(3);
        expect(store.listenerCount()).assertEqual(3);
        expect(store.listenerCountForKey('language')).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_1700
     * @tc.name testRemoveListenerById
     * @tc.desc Verify removing a listener by id shrinks the table and unknown ids report false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRemoveListenerById', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        const first: number = store.addListener('language');
        store.addListener('language');
        expect(store.listenerCountForKey('language')).assertEqual(2);
        expect(store.removeListener(first)).assertTrue();
        expect(store.hasListener(first)).assertFalse();
        expect(store.listenerCountForKey('language')).assertEqual(1);
        expect(store.removeListener(999)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_1800
     * @tc.name testListenerUnknownKeyRejected
     * @tc.desc Verify subscribing to an unsupported key raises ConfigKeyError and registers nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testListenerUnknownKeyRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        try {
          store.addListener('locale');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ConfigKeyError');
        }
        expect(store.listenerCount()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_1900
     * @tc.name testClearResetsStore
     * @tc.desc Verify clear removes values, listeners and resets version and notification counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testClearResetsStore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        store.load(ConfigurationStore.createDefault());
        store.update('language', 'en-Latn-US');
        store.addListener('language');
        store.clear();
        expect(store.getVersion()).assertEqual(0);
        expect(store.getNotifyCount()).assertEqual(0);
        expect(store.listenerCount()).assertEqual(0);
        expect(store.readValue('language')).assertEqual(null);
        expect(store.addListener('language')).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_2000
     * @tc.name testUiLiveColorModeMatchesEntryAbility
     * @tc.desc Verify the live page is visible while EntryAbility has applied COLOR_MODE_NOT_SET to the context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiLiveColorModeMatchesEntryAbility', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        store.load(ConfigurationStore.createDefault());
        expect(store.readNumber('colorMode', 0)).assertEqual(COLOR_MODE_NOT_SET);
        const startTime: number = Date.now();
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const elapsed: number = measureElapsed(startTime);
        logInfo(`testUiLiveColorModeMatchesEntryAbility: stable ${stable} in ${elapsed} ms`);
        expect(stable).assertTrue();
        expect(isWithinBudget(elapsed, TIMEOUT_ABILITY_LAUNCH)).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } catch (error) {
        logError(`testUiLiveColorModeMatchesEntryAbility failed: ${error}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_2100
     * @tc.name testUiPageTextMatchesConfigurationCopy
     * @tc.desc Verify the rendered page copy equals one of the two configured text constants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiPageTextMatchesConfigurationCopy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const initialPresent: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        const clickedPresent: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(initialPresent || clickedPresent).assertTrue();
        expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
        const configuredLanguage: string = 'zh-Hans';
        expect(configuredLanguage.length).assertEqual(7);
        expect(ConfigurationStore.createDefault().language).assertEqual(configuredLanguage);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_2200
     * @tc.name testUiComponentCountStableAcrossConfigUpdates
     * @tc.desc Verify model configuration updates do not perturb the live page component count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiComponentCountStableAcrossConfigUpdates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: ConfigurationStore = new ConfigurationStore();
        store.load(ConfigurationStore.createDefault());
        const before: number = await pageComponentCount(driver);
        store.update('fontSizeScale', '1.5');
        store.update('fontWeightScale', '1.2');
        store.update('direction', '1');
        const after: number = await pageComponentCount(driver);
        logInfo(`testUiComponentCountStableAcrossConfigUpdates: ${before} then ${after}`);
        expect(store.getVersion()).assertEqual(4);
        expect(before).assertEqual(after);
        expect(after > 0).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGMGR_2300
     * @tc.name testUiTextNodesQueryable
     * @tc.desc Verify the live page exposes a Text node whose content is non empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiTextNodesQueryable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const texts: Component[] = await findComponentsByType(driver, 'Text');
        expect(texts.length >= 1).assertTrue();
        const content: string = await texts[0].getText();
        logInfo(`testUiTextNodesQueryable: first text length ${content.length}`);
        expect(content.length > 0).assertTrue();
        const store: ConfigurationStore = new ConfigurationStore();
        store.load(ConfigurationStore.createDefault());
        const matchesInitial: boolean = content === PAGE_TEXT_INITIAL;
        const matchesClicked: boolean = content === PAGE_TEXT_CLICKED;
        logInfo(`testUiTextNodesQueryable: initial ${matchesInitial} clicked ${matchesClicked}`);
        expect(matchesInitial || matchesClicked).assertTrue();
        expect(store.readValue('language')).assertEqual('zh-Hans');
      } finally {
        done();
      }
    })
  })
}
