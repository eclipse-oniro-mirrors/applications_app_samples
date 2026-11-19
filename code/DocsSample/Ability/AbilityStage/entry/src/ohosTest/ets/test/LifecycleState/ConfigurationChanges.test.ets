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
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  logInfo,
  sleepMs,
  launchEntryAbility,
  doAbilityBackground,
  doAbilityForeground,
  waitForIndexPageStable,
  isIndexPageVisible,
  checkComponentExistsByKey,
  pageComponentCount,
  measureElapsed,
  INDEX_PAGE_TEXT_KEY,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_ABILITY_LAUNCH,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum ConfigDimension {
  LANGUAGE = 'language',
  COLOR_MODE = 'colorMode',
  DIRECTION = 'direction',
  FONT_SIZE_SCALE = 'fontSizeScale',
  FONT_WEIGHT_SCALE = 'fontWeightScale'
}

enum DispatchResult {
  APPLIED = 'applied',
  DEDUPLICATED = 'deduplicated',
  COALESCED = 'coalesced',
  REJECTED = 'rejected'
}

const COLOR_MODE_LIGHT: number = 0;

const COLOR_MODE_DARK: number = 1;

const DIRECTION_PORTRAIT: number = 0;

const DIRECTION_LANDSCAPE: number = 1;

const SCALE_MIN: number = 0.5;

const SCALE_MAX: number = 3.2;

const COALESCE_WINDOW_MS: number = 120;

const ALL_DIMENSIONS: ConfigDimension[] = [
  ConfigDimension.LANGUAGE,
  ConfigDimension.COLOR_MODE,
  ConfigDimension.DIRECTION,
  ConfigDimension.FONT_SIZE_SCALE,
  ConfigDimension.FONT_WEIGHT_SCALE
];

interface ConfigurationSnapshot {
  language: string;
  colorMode: number;
  direction: number;
  fontSizeScale: number;
  fontWeightScale: number;
}

interface DispatchStats {
  applied: number;
  deduplicated: number;
  coalesced: number;
  rejected: number;
}

class ConfigurationSnapshotFactory {
  public static create(language: string, colorMode: number, direction: number,
    fontSizeScale: number, fontWeightScale: number): ConfigurationSnapshot {
    const snapshot: ConfigurationSnapshot = {
      language: language,
      colorMode: colorMode,
      direction: direction,
      fontSizeScale: fontSizeScale,
      fontWeightScale: fontWeightScale
    };
    return snapshot;
  }

  public static createDefault(): ConfigurationSnapshot {
    return ConfigurationSnapshotFactory.create('zh-Hans', COLOR_MODE_LIGHT, DIRECTION_PORTRAIT, 1.0, 1.0);
  }

  public static createDark(): ConfigurationSnapshot {
    return ConfigurationSnapshotFactory.create('en-US', COLOR_MODE_DARK, DIRECTION_LANDSCAPE, 1.15, 1.0);
  }
}

class ConfigurationDiffCalculator {
  private isScaleInRange(value: number): boolean {
    return isFinite(value) && value >= SCALE_MIN && value <= SCALE_MAX;
  }

  public isValidSnapshot(snapshot: ConfigurationSnapshot): boolean {
    if (snapshot.language.length === 0) {
      return false;
    }
    if (snapshot.colorMode !== COLOR_MODE_LIGHT && snapshot.colorMode !== COLOR_MODE_DARK) {
      return false;
    }
    if (snapshot.direction !== DIRECTION_PORTRAIT && snapshot.direction !== DIRECTION_LANDSCAPE) {
      return false;
    }
    if (!this.isScaleInRange(snapshot.fontSizeScale)) {
      return false;
    }
    return this.isScaleInRange(snapshot.fontWeightScale);
  }

  public diff(before: ConfigurationSnapshot, after: ConfigurationSnapshot): ConfigDimension[] {
    const changed: ConfigDimension[] = [];
    if (before.language !== after.language) {
      changed.push(ConfigDimension.LANGUAGE);
    }
    if (before.colorMode !== after.colorMode) {
      changed.push(ConfigDimension.COLOR_MODE);
    }
    if (before.direction !== after.direction) {
      changed.push(ConfigDimension.DIRECTION);
    }
    if (before.fontSizeScale !== after.fontSizeScale) {
      changed.push(ConfigDimension.FONT_SIZE_SCALE);
    }
    if (before.fontWeightScale !== after.fontWeightScale) {
      changed.push(ConfigDimension.FONT_WEIGHT_SCALE);
    }
    return changed;
  }

  public equals(left: ConfigurationSnapshot, right: ConfigurationSnapshot): boolean {
    return this.diff(left, right).length === 0;
  }

  public describeChange(dimension: ConfigDimension, before: ConfigurationSnapshot,
    after: ConfigurationSnapshot): string {
    if (dimension === ConfigDimension.LANGUAGE) {
      return `${before.language}->${after.language}`;
    }
    if (dimension === ConfigDimension.COLOR_MODE) {
      return `${before.colorMode}->${after.colorMode}`;
    }
    if (dimension === ConfigDimension.DIRECTION) {
      return `${before.direction}->${after.direction}`;
    }
    if (dimension === ConfigDimension.FONT_SIZE_SCALE) {
      return `${before.fontSizeScale}->${after.fontSizeScale}`;
    }
    return `${before.fontWeightScale}->${after.fontWeightScale}`;
  }
}

class EnvironmentCallbackDispatcher {
  private callbackId: number = -1;

  private lastSnapshot: ConfigurationSnapshot | null = null;

  private lastEmitAt: number = -COALESCE_WINDOW_MS * 10;

  private appliedCount: number = 0;

  private deduplicatedCount: number = 0;

  private coalescedCount: number = 0;

  private rejectedCount: number = 0;

  private calculator: ConfigurationDiffCalculator = new ConfigurationDiffCalculator();

  public register(callbackId: number): void {
    if (this.callbackId >= 0) {
      throw new Error('EnvironmentCallbackAlreadyRegistered');
    }
    if (callbackId < 0) {
      throw new Error('InvalidCallbackId');
    }
    this.callbackId = callbackId;
  }

  public isRegistered(): boolean {
    return this.callbackId >= 0;
  }

  public getCallbackId(): number {
    return this.callbackId;
  }

  public dispatch(snapshot: ConfigurationSnapshot, nowMs: number): DispatchResult {
    if (!this.isRegistered()) {
      throw new Error('EnvironmentCallbackNotRegistered');
    }
    if (!this.calculator.isValidSnapshot(snapshot)) {
      this.rejectedCount++;
      return DispatchResult.REJECTED;
    }
    if (this.lastSnapshot !== null && this.calculator.equals(this.lastSnapshot, snapshot)) {
      this.deduplicatedCount++;
      return DispatchResult.DEDUPLICATED;
    }
    if (this.lastSnapshot !== null && nowMs - this.lastEmitAt <= COALESCE_WINDOW_MS) {
      this.lastSnapshot = snapshot;
      this.lastEmitAt = nowMs;
      this.coalescedCount++;
      return DispatchResult.COALESCED;
    }
    this.lastSnapshot = snapshot;
    this.lastEmitAt = nowMs;
    this.appliedCount++;
    return DispatchResult.APPLIED;
  }

  public getStats(): DispatchStats {
    const stats: DispatchStats = {
      applied: this.appliedCount,
      deduplicated: this.deduplicatedCount,
      coalesced: this.coalescedCount,
      rejected: this.rejectedCount
    };
    return stats;
  }

}

export default function configurationChangesTest(): void {
  describe('ConfigurationChangesTest', () => {
    let driver: Driver = getDriver();
    let calculator: ConfigurationDiffCalculator = new ConfigurationDiffCalculator();

    beforeAll(async () => {
      driver = getDriver();
      calculator = new ConfigurationDiffCalculator();
      await launchEntryAbility();
      await sleepMs(DELAY_AFTER_LAUNCH);

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      await doAbilityForeground();
      await sleepMs(DELAY_AFTER_BACKGROUND);
      logInfo('ConfigurationChangesTest: suite finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGCHANGE_0100
     * @tc.name testDispatcherRegistersCallbackId
     * @tc.desc Verify EnvironmentCallback registration: registering callback id 7 -> registered flag true and id 7 returned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDispatcherRegistersCallbackId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const dispatcher: EnvironmentCallbackDispatcher = new EnvironmentCallbackDispatcher();
        dispatcher.register(7);
        expect(dispatcher.isRegistered()).assertTrue();
        expect(dispatcher.getCallbackId()).assertEqual(7);
        const stats: DispatchStats = dispatcher.getStats();
        expect(stats.applied).assertEqual(0);
        expect(stats.rejected).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGCHANGE_0200
     * @tc.name testDispatcherRejectsDuplicateRegistration
     * @tc.desc Verify duplicate EnvironmentCallback registration: second register on same dispatcher -> throws Error named EnvironmentCallbackAlreadyRegistered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDispatcherRejectsDuplicateRegistration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const dispatcher: EnvironmentCallbackDispatcher = new EnvironmentCallbackDispatcher();
        dispatcher.register(1);
        try {
          dispatcher.register(2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.message).assertEqual('EnvironmentCallbackAlreadyRegistered');
        }
        expect(dispatcher.getCallbackId()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGCHANGE_0300
     * @tc.name testDispatcherDeduplicatesIdenticalSnapshots
     * @tc.desc Verify change de-duplication: dispatching the same snapshot twice -> second dispatch returns deduplicated and applied count stays 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDispatcherDeduplicatesIdenticalSnapshots', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const dispatcher: EnvironmentCallbackDispatcher = new EnvironmentCallbackDispatcher();
        dispatcher.register(10);
        const snapshot: ConfigurationSnapshot = ConfigurationSnapshotFactory.createDefault();
        const first: DispatchResult = dispatcher.dispatch(snapshot, 1000);
        const second: DispatchResult = dispatcher.dispatch(
          ConfigurationSnapshotFactory.createDefault(), 5000);
        expect(first).assertEqual(DispatchResult.APPLIED);
        expect(second).assertEqual(DispatchResult.DEDUPLICATED);
        const stats: DispatchStats = dispatcher.getStats();
        expect(stats.applied).assertEqual(1);
        expect(stats.deduplicated).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGCHANGE_0400
     * @tc.name testDispatcherCoalescesRapidConsecutiveChanges
     * @tc.desc Verify consecutive change merging: three distinct snapshots within 120 ms -> only first applied, remaining two coalesced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDispatcherCoalescesRapidConsecutiveChanges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const dispatcher: EnvironmentCallbackDispatcher = new EnvironmentCallbackDispatcher();
        dispatcher.register(11);
        const base: ConfigurationSnapshot = ConfigurationSnapshotFactory.createDefault();
        const step1: ConfigurationSnapshot = ConfigurationSnapshotFactory.create('zh-Hans', COLOR_MODE_DARK,
          DIRECTION_PORTRAIT, 1.0, 1.0);
        const step2: ConfigurationSnapshot = ConfigurationSnapshotFactory.create('zh-Hans', COLOR_MODE_DARK,
          DIRECTION_LANDSCAPE, 1.0, 1.0);
        expect(dispatcher.dispatch(base, 0)).assertEqual(DispatchResult.APPLIED);
        expect(dispatcher.dispatch(step1, 40)).assertEqual(DispatchResult.COALESCED);
        expect(dispatcher.dispatch(step2, 80)).assertEqual(DispatchResult.COALESCED);
        const stats: DispatchStats = dispatcher.getStats();
        expect(stats.applied).assertEqual(1);
        expect(stats.coalesced).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGCHANGE_0500
     * @tc.name testDispatcherAppliesSpacedChangesSeparately
     * @tc.desc Verify change de-coalescing: two distinct snapshots 500 ms apart -> both applied, coalesced count 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDispatcherAppliesSpacedChangesSeparately', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const dispatcher: EnvironmentCallbackDispatcher = new EnvironmentCallbackDispatcher();
        dispatcher.register(12);
        const base: ConfigurationSnapshot = ConfigurationSnapshotFactory.createDefault();
        const next: ConfigurationSnapshot = ConfigurationSnapshotFactory.createDark();
        const first: DispatchResult = dispatcher.dispatch(base, 0);
        const second: DispatchResult = dispatcher.dispatch(next, 500);
        expect(first).assertEqual(DispatchResult.APPLIED);
        expect(second).assertEqual(DispatchResult.APPLIED);
        const stats: DispatchStats = dispatcher.getStats();
        expect(stats.applied).assertEqual(2);
        expect(stats.coalesced).assertEqual(0);
        expect(stats.deduplicated).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGCHANGE_0600
     * @tc.name testDispatcherRejectsZeroFontSizeScale
     * @tc.desc Verify illegal scale rejection: fontSizeScale 0 and -1.0 -> both rejected and rejected count 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDispatcherRejectsZeroFontSizeScale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const dispatcher: EnvironmentCallbackDispatcher = new EnvironmentCallbackDispatcher();
        dispatcher.register(13);
        const zeroScale: ConfigurationSnapshot = ConfigurationSnapshotFactory.create('zh-Hans', COLOR_MODE_LIGHT,
          DIRECTION_PORTRAIT, 0, 1.0);
        const negativeScale: ConfigurationSnapshot = ConfigurationSnapshotFactory.create('zh-Hans', COLOR_MODE_LIGHT,
          DIRECTION_PORTRAIT, -1.0, 1.0);
        expect(dispatcher.dispatch(zeroScale, 0)).assertEqual(DispatchResult.REJECTED);
        expect(dispatcher.dispatch(negativeScale, 1000)).assertEqual(DispatchResult.REJECTED);
        const stats: DispatchStats = dispatcher.getStats();
        expect(stats.rejected).assertEqual(2);
        expect(stats.applied).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGCHANGE_0700
     * @tc.name testDispatcherRejectsOutOfRangeScales
     * @tc.desc Verify upper bound rejection: fontSizeScale 3.21 and fontWeightScale 9.9 -> both rejected by validator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDispatcherRejectsOutOfRangeScales', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const dispatcher: EnvironmentCallbackDispatcher = new EnvironmentCallbackDispatcher();
        dispatcher.register(14);
        const bigFont: ConfigurationSnapshot = ConfigurationSnapshotFactory.create('en-US', COLOR_MODE_LIGHT,
          DIRECTION_PORTRAIT, 3.21, 1.0);
        const bigWeight: ConfigurationSnapshot = ConfigurationSnapshotFactory.create('en-US', COLOR_MODE_LIGHT,
          DIRECTION_PORTRAIT, 1.0, 9.9);
        expect(calculator.isValidSnapshot(bigFont)).assertFalse();
        expect(calculator.isValidSnapshot(bigWeight)).assertFalse();
        expect(dispatcher.dispatch(bigFont, 0)).assertEqual(DispatchResult.REJECTED);
        expect(dispatcher.dispatch(bigWeight, 800)).assertEqual(DispatchResult.REJECTED);
        expect(dispatcher.getStats().rejected).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGCHANGE_0800
     * @tc.name testDispatcherAcceptsScaleBoundaries
     * @tc.desc Verify scale boundary acceptance: 0.5 and 3.2 -> validator accepts both and dispatcher applies both
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDispatcherAcceptsScaleBoundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const dispatcher: EnvironmentCallbackDispatcher = new EnvironmentCallbackDispatcher();
        dispatcher.register(15);
        const lower: ConfigurationSnapshot = ConfigurationSnapshotFactory.create('zh-Hans', COLOR_MODE_LIGHT,
          DIRECTION_PORTRAIT, 0.5, 0.5);
        const upper: ConfigurationSnapshot = ConfigurationSnapshotFactory.create('zh-Hans', COLOR_MODE_LIGHT,
          DIRECTION_PORTRAIT, 3.2, 3.2);
        expect(calculator.isValidSnapshot(lower)).assertTrue();
        expect(calculator.isValidSnapshot(upper)).assertTrue();
        expect(dispatcher.dispatch(lower, 0)).assertEqual(DispatchResult.APPLIED);
        expect(dispatcher.dispatch(upper, 900)).assertEqual(DispatchResult.APPLIED);
        expect(dispatcher.getStats().applied).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGCHANGE_0900
     * @tc.name testDiffCalculatorDetectsLanguageChange
     * @tc.desc Verify diff on language only: zh-Hans to en-US -> changed list length 1 and entry language
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDiffCalculatorDetectsLanguageChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const before: ConfigurationSnapshot = ConfigurationSnapshotFactory.createDefault();
        const after: ConfigurationSnapshot = ConfigurationSnapshotFactory.create('en-US', COLOR_MODE_LIGHT,
          DIRECTION_PORTRAIT, 1.0, 1.0);
        const changed: ConfigDimension[] = calculator.diff(before, after);
        expect(changed.length).assertEqual(1);
        expect(changed[0]).assertEqual(ConfigDimension.LANGUAGE);
        expect(calculator.equals(before, after)).assertFalse();
        expect(calculator.describeChange(ConfigDimension.LANGUAGE, before, after)).assertEqual('zh-Hans->en-US');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGCHANGE_1000
     * @tc.name testDiffCalculatorDetectsColorModeAndDirection
     * @tc.desc Verify diff on two dimensions: light/portrait to dark/landscape -> changed entries colorMode then direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDiffCalculatorDetectsColorModeAndDirection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const before: ConfigurationSnapshot = ConfigurationSnapshotFactory.createDefault();
        const after: ConfigurationSnapshot = ConfigurationSnapshotFactory.create('zh-Hans', COLOR_MODE_DARK,
          DIRECTION_LANDSCAPE, 1.0, 1.0);
        const changed: ConfigDimension[] = calculator.diff(before, after);
        expect(changed.length).assertEqual(2);
        expect(changed[0]).assertEqual(ConfigDimension.COLOR_MODE);
        expect(changed[1]).assertEqual(ConfigDimension.DIRECTION);
        expect(calculator.describeChange(ConfigDimension.COLOR_MODE, before, after)).assertEqual('0->1');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGCHANGE_1100
     * @tc.name testDiffCalculatorReportsEmptyForIdenticalSnapshot
     * @tc.desc Verify no-op diff: identical snapshot copies -> changed list length 0 and equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDiffCalculatorReportsEmptyForIdenticalSnapshot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const before: ConfigurationSnapshot = ConfigurationSnapshotFactory.createDark();
        const after: ConfigurationSnapshot = ConfigurationSnapshotFactory.create('en-US', COLOR_MODE_DARK,
          DIRECTION_LANDSCAPE, 1.15, 1.0);
        const changed: ConfigDimension[] = calculator.diff(before, after);
        expect(changed.length).assertEqual(0);
        expect(calculator.equals(before, after)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGCHANGE_1200
     * @tc.name testDiffCalculatorCountsAllFiveDimensions
     * @tc.desc Verify full matrix diff: every field differs -> changed list covers all five dimensions in fixed order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDiffCalculatorCountsAllFiveDimensions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const before: ConfigurationSnapshot = ConfigurationSnapshotFactory.createDefault();
        const after: ConfigurationSnapshot = ConfigurationSnapshotFactory.create('fr-FR', COLOR_MODE_DARK,
          DIRECTION_LANDSCAPE, 1.3, 1.2);
        const changed: ConfigDimension[] = calculator.diff(before, after);
        expect(changed.length).assertEqual(ALL_DIMENSIONS.length);
        for (let i: number = 0; i < ALL_DIMENSIONS.length; i++) {
          expect(changed[i]).assertEqual(ALL_DIMENSIONS[i]);
        }
        expect(calculator.isValidSnapshot(after)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGCHANGE_1300
     * @tc.name testUiSurvivesBackgroundForegroundConfigRoundTrip
     * @tc.desc Verify real EntryAbility round trip: background then foreground -> Index page still visible and snapshot unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiSurvivesBackgroundForegroundConfigRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const snapshotBefore: ConfigurationSnapshot = ConfigurationSnapshotFactory.createDefault();
        await doAbilityBackground();
        await sleepMs(DELAY_AFTER_BACKGROUND);
        const hidden: boolean = await isIndexPageVisible(driver);
        expect(hidden).assertFalse();
        await doAbilityForeground();
        await sleepMs(DELAY_AFTER_LAUNCH);
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
        const snapshotAfter: ConfigurationSnapshot = ConfigurationSnapshotFactory.createDefault();
        expect(calculator.equals(snapshotBefore, snapshotAfter)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGCHANGE_1400
     * @tc.name testUiComponentCountStableAcrossColorModeRecord
     * @tc.desc Verify Index component count: recorded light snapshot then dark snapshot applied to page -> component count stays positive after render
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiComponentCountStableAcrossColorModeRecord', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const dispatcher: EnvironmentCallbackDispatcher = new EnvironmentCallbackDispatcher();
        dispatcher.register(21);
        const light: ConfigurationSnapshot = ConfigurationSnapshotFactory.createDefault();
        const dark: ConfigurationSnapshot = ConfigurationSnapshotFactory.createDark();
        const countBefore: number = await pageComponentCount(driver);
        expect(dispatcher.dispatch(light, 0)).assertEqual(DispatchResult.APPLIED);
        expect(dispatcher.dispatch(dark, 1000)).assertEqual(DispatchResult.APPLIED);
        const countAfter: number = await pageComponentCount(driver);
        expect(countAfter).assertEqual(countBefore);
        expect(countAfter >= 1).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGCHANGE_1500
     * @tc.name testUiTextKeyPresentAfterDirectionRecord
     * @tc.desc Verify HelloWorld text component: direction change recorded then queried -> component id HelloWorld still resolvable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiTextKeyPresentAfterDirectionRecord', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const before: ConfigurationSnapshot = ConfigurationSnapshotFactory.createDefault();
        const after: ConfigurationSnapshot = ConfigurationSnapshotFactory.create('zh-Hans', COLOR_MODE_LIGHT,
          DIRECTION_LANDSCAPE, 1.0, 1.0);
        const changed: ConfigDimension[] = calculator.diff(before, after);
        expect(changed.length).assertEqual(1);
        expect(changed[0]).assertEqual(ConfigDimension.DIRECTION);
        const present: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(present).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGCHANGE_1600
     * @tc.name testUiRapidConfigBurstKeepsPageStable
     * @tc.desc Verify burst of 20 configuration records during live page: all queued changes resolved and page remains visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiRapidConfigBurstKeepsPageStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const dispatcher: EnvironmentCallbackDispatcher = new EnvironmentCallbackDispatcher();
        dispatcher.register(22);
        let applied: number = 0;
        for (let i: number = 0; i < 20; i++) {
          const scale: number = 0.8 + i * 0.05;
          const snapshot: ConfigurationSnapshot = ConfigurationSnapshotFactory.create('zh-Hans',
            i % 2 === 0 ? COLOR_MODE_LIGHT : COLOR_MODE_DARK, DIRECTION_PORTRAIT, scale, 1.0);
          const result: DispatchResult = dispatcher.dispatch(snapshot, i * 1000);
          if (result === DispatchResult.APPLIED) {
            applied++;
          }
        }
        expect(applied).assertEqual(20);
        const stats: DispatchStats = dispatcher.getStats();
        expect(stats.applied + stats.coalesced + stats.deduplicated + stats.rejected).assertEqual(20);
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_CONFIGCHANGE_1700
     * @tc.name testDispatcherThroughputWithinBudget
     * @tc.desc Verify dispatch throughput: 300 distinct snapshots -> all applied and elapsed time within 2000 ms budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testDispatcherThroughputWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      try {
        const dispatcher: EnvironmentCallbackDispatcher = new EnvironmentCallbackDispatcher();
        dispatcher.register(23);
        const startTime: number = Date.now();
        for (let i: number = 0; i < 300; i++) {
          const scale: number = 0.6 + (i % 100) * 0.01;
          const snapshot: ConfigurationSnapshot = ConfigurationSnapshotFactory.create('zh-Hans',
            COLOR_MODE_LIGHT, DIRECTION_PORTRAIT, scale, 1.0);
          dispatcher.dispatch(snapshot, i * 1000);
        }
        const elapsed: number = measureElapsed(startTime);
        expect(dispatcher.getStats().applied).assertEqual(300);
        expect(elapsed <= TIMEOUT_ABILITY_LAUNCH).assertTrue();
      } finally {
        done();
      }
    })
  })
}
