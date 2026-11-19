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
  logError,
  launchEntryAbility,
  serializedDelay,
  waitForIndexPageStable,
  isIndexPageVisible,
  checkTextContent,
  waitForTextVisible,
  tapComponentByText,
  doAbilityBackground,
  doAbilityForeground,
  ENV_CALLBACK_EVENT,
  COLOR_MODE_NOT_SET,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  DELAY_AFTER_LAUNCH,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

const MIN_FONT_SCALE: number = 0.1;

const MAX_FONT_SCALE: number = 3.0;

const NEUTRAL_FONT_SCALE: number = 1.0;

const MIN_FONT_WEIGHT_SCALE: number = 0.1;

const MAX_FONT_WEIGHT_SCALE: number = 3.0;

const LANGUAGE_MIN_LENGTH: number = 2;

const LANGUAGE_MAX_LENGTH: number = 20;

const COLOR_MODE_DARK: number = 0;

const COLOR_MODE_LIGHT: number = 1;

const DIRECTION_LTR: number = 0;

const DIRECTION_RTL: number = 1;

const MEMORY_LEVEL_NORMAL: number = 0;

const MEMORY_LEVEL_LOW: number = 1;

const MEMORY_LEVEL_CRITICAL: number = 2;

enum EnvErrorCode {
  OK = 'ok',
  EVENT_NAME_EMPTY = 'event_name_empty',
  EVENT_NAME_UNKNOWN = 'event_name_unknown',
  LANGUAGE_EMPTY = 'language_empty',
  LANGUAGE_TOO_SHORT = 'language_too_short',
  LANGUAGE_TOO_LONG = 'language_too_long',
  LANGUAGE_FORMAT_INVALID = 'language_format_invalid',
  COLOR_MODE_OUT_OF_RANGE = 'color_mode_out_of_range',
  DIRECTION_OUT_OF_RANGE = 'direction_out_of_range',
  FONT_SCALE_OUT_OF_RANGE = 'font_scale_out_of_range',
  FONT_WEIGHT_SCALE_OUT_OF_RANGE = 'font_weight_scale_out_of_range',
  MEMORY_LEVEL_OUT_OF_RANGE = 'memory_level_out_of_range',
  CALLBACK_MISSING = 'callback_missing'
}

class ConfigSnapshot {
  public language: string;
  public colorMode: number;
  public direction: number;
  public fontSizeScale: number;
  public fontWeightScale: number;

  constructor(language: string, colorMode: number, direction: number, fontSizeScale: number,
    fontWeightScale: number) {
    this.language = language;
    this.colorMode = colorMode;
    this.direction = direction;
    this.fontSizeScale = fontSizeScale;
    this.fontWeightScale = fontWeightScale;
  }

  public static defaultSnapshot(): ConfigSnapshot {
    return new ConfigSnapshot('zh-Hans', COLOR_MODE_LIGHT, DIRECTION_LTR, NEUTRAL_FONT_SCALE, NEUTRAL_FONT_SCALE);
  }

  public copyWithColorMode(colorMode: number): ConfigSnapshot {
    return new ConfigSnapshot(this.language, colorMode, this.direction, this.fontSizeScale, this.fontWeightScale);
  }

  public copyWithDirection(direction: number): ConfigSnapshot {
    return new ConfigSnapshot(this.language, this.colorMode, direction, this.fontSizeScale, this.fontWeightScale);
  }

  public copyWithLanguage(language: string): ConfigSnapshot {
    return new ConfigSnapshot(language, this.colorMode, this.direction, this.fontSizeScale, this.fontWeightScale);
  }

  public copyWithFontScale(scale: number): ConfigSnapshot {
    return new ConfigSnapshot(this.language, this.colorMode, this.direction, scale, this.fontWeightScale);
  }

  public copyWithWeightScale(scale: number): ConfigSnapshot {
    return new ConfigSnapshot(this.language, this.colorMode, this.direction, this.fontSizeScale, scale);
  }

  public isDark(): boolean {
    return this.colorMode === COLOR_MODE_DARK;
  }

  public isRtl(): boolean {
    return this.direction === DIRECTION_RTL;
  }
}

class LanguageRules {
  public static checkTag(tag: string): EnvErrorCode {
    if (tag.length === 0) {
      return EnvErrorCode.LANGUAGE_EMPTY;
    }
    if (tag.length < LANGUAGE_MIN_LENGTH) {
      return EnvErrorCode.LANGUAGE_TOO_SHORT;
    }
    if (tag.length > LANGUAGE_MAX_LENGTH) {
      return EnvErrorCode.LANGUAGE_TOO_LONG;
    }
    if (!LanguageRules.areLetters(tag)) {
      return EnvErrorCode.LANGUAGE_FORMAT_INVALID;
    }
    return EnvErrorCode.OK;
  }

  public static areLetters(tag: string): boolean {
    for (let i = 0; i < tag.length; i++) {
      const ch: string = tag.charAt(i);
      const isLower: boolean = ch >= 'a' && ch <= 'z';
      const isUpper: boolean = ch >= 'A' && ch <= 'Z';
      const isDash: boolean = ch === '-';
      if (!isLower && !isUpper && !isDash) {
        return false;
      }
    }
    return true;
  }

  public static primarySubtag(tag: string): string {
    const dashIndex: number = tag.indexOf('-');
    if (dashIndex < 0) {
      return tag;
    }
    return tag.substring(0, dashIndex);
  }

  public static hasRegion(tag: string): boolean {
    return tag.indexOf('-') > 0;
  }

  public static samePrimary(left: string, right: string): boolean {
    return LanguageRules.primarySubtag(left) === LanguageRules.primarySubtag(right);
  }
}

class EnvironmentValidator {
  public static checkEventName(name: string): EnvErrorCode {
    if (name.length === 0) {
      return EnvErrorCode.EVENT_NAME_EMPTY;
    }
    if (name !== ENV_CALLBACK_EVENT) {
      return EnvErrorCode.EVENT_NAME_UNKNOWN;
    }
    return EnvErrorCode.OK;
  }

  public static checkColorMode(colorMode: number): EnvErrorCode {
    if (colorMode === COLOR_MODE_NOT_SET) {
      return EnvErrorCode.OK;
    }
    if (colorMode === COLOR_MODE_DARK) {
      return EnvErrorCode.OK;
    }
    if (colorMode === COLOR_MODE_LIGHT) {
      return EnvErrorCode.OK;
    }
    return EnvErrorCode.COLOR_MODE_OUT_OF_RANGE;
  }

  public static checkDirection(direction: number): EnvErrorCode {
    if (direction === DIRECTION_LTR || direction === DIRECTION_RTL) {
      return EnvErrorCode.OK;
    }
    return EnvErrorCode.DIRECTION_OUT_OF_RANGE;
  }

  public static checkFontSizeScale(scale: number): EnvErrorCode {
    if (isNaN(scale)) {
      return EnvErrorCode.FONT_SCALE_OUT_OF_RANGE;
    }
    if (scale < MIN_FONT_SCALE) {
      return EnvErrorCode.FONT_SCALE_OUT_OF_RANGE;
    }
    if (scale > MAX_FONT_SCALE) {
      return EnvErrorCode.FONT_SCALE_OUT_OF_RANGE;
    }
    return EnvErrorCode.OK;
  }

  public static checkFontWeightScale(scale: number): EnvErrorCode {
    if (isNaN(scale)) {
      return EnvErrorCode.FONT_WEIGHT_SCALE_OUT_OF_RANGE;
    }
    if (scale < MIN_FONT_WEIGHT_SCALE) {
      return EnvErrorCode.FONT_WEIGHT_SCALE_OUT_OF_RANGE;
    }
    if (scale > MAX_FONT_WEIGHT_SCALE) {
      return EnvErrorCode.FONT_WEIGHT_SCALE_OUT_OF_RANGE;
    }
    return EnvErrorCode.OK;
  }

  public static checkMemoryLevel(level: number): EnvErrorCode {
    if (level === MEMORY_LEVEL_NORMAL || level === MEMORY_LEVEL_LOW || level === MEMORY_LEVEL_CRITICAL) {
      return EnvErrorCode.OK;
    }
    return EnvErrorCode.MEMORY_LEVEL_OUT_OF_RANGE;
  }

  public static checkSnapshot(snapshot: ConfigSnapshot): EnvErrorCode {
    const results: EnvErrorCode[] = [
      EnvironmentValidator.checkColorMode(snapshot.colorMode),
      EnvironmentValidator.checkDirection(snapshot.direction),
      EnvironmentValidator.checkFontSizeScale(snapshot.fontSizeScale),
      EnvironmentValidator.checkFontWeightScale(snapshot.fontWeightScale),
      LanguageRules.checkTag(snapshot.language)
    ];
    for (let i = 0; i < results.length; i++) {
      if (results[i] !== EnvErrorCode.OK) {
        return results[i];
      }
    }
    return EnvErrorCode.OK;
  }

  public static isValidSnapshot(snapshot: ConfigSnapshot): boolean {
    return EnvironmentValidator.checkSnapshot(snapshot) === EnvErrorCode.OK;
  }

  public static errorName(code: EnvErrorCode): string {
    if (code === EnvErrorCode.EVENT_NAME_EMPTY) {
      return 'EventNameEmptyError';
    }
    if (code === EnvErrorCode.EVENT_NAME_UNKNOWN) {
      return 'EventNameUnknownError';
    }
    if (code === EnvErrorCode.LANGUAGE_EMPTY) {
      return 'LanguageEmptyError';
    }
    if (code === EnvErrorCode.LANGUAGE_TOO_SHORT) {
      return 'LanguageTooShortError';
    }
    if (code === EnvErrorCode.LANGUAGE_TOO_LONG) {
      return 'LanguageTooLongError';
    }
    if (code === EnvErrorCode.LANGUAGE_FORMAT_INVALID) {
      return 'LanguageFormatError';
    }
    if (code === EnvErrorCode.COLOR_MODE_OUT_OF_RANGE) {
      return 'ColorModeRangeError';
    }
    if (code === EnvErrorCode.DIRECTION_OUT_OF_RANGE) {
      return 'DirectionRangeError';
    }
    if (code === EnvErrorCode.FONT_SCALE_OUT_OF_RANGE) {
      return 'FontScaleRangeError';
    }
    if (code === EnvErrorCode.FONT_WEIGHT_SCALE_OUT_OF_RANGE) {
      return 'FontWeightScaleRangeError';
    }
    if (code === EnvErrorCode.MEMORY_LEVEL_OUT_OF_RANGE) {
      return 'MemoryLevelRangeError';
    }
    if (code === EnvErrorCode.CALLBACK_MISSING) {
      return 'EnvironmentCallbackMissingError';
    }
    return 'NoError';
  }

  public static toError(code: EnvErrorCode): Error {
    const error: Error = new Error(`environment rejected: ${code}`);
    error.name = EnvironmentValidator.errorName(code);
    return error;
  }

  public static requireSnapshot(snapshot: ConfigSnapshot): void {
    const code: EnvErrorCode = EnvironmentValidator.checkSnapshot(snapshot);
    if (code === EnvErrorCode.OK) {
      return;
    }
    throw EnvironmentValidator.toError(code);
  }

  public static requireMemoryLevel(level: number): void {
    const code: EnvErrorCode = EnvironmentValidator.checkMemoryLevel(level);
    if (code === EnvErrorCode.OK) {
      return;
    }
    throw EnvironmentValidator.toError(code);
  }
}

class ConfigurationJournal {
  private snapshots: ConfigSnapshot[] = [];

  public record(snapshot: ConfigSnapshot): number {
    this.snapshots.push(snapshot);
    return this.snapshots.length;
  }

  public size(): number {
    return this.snapshots.length;
  }

  public latest(): ConfigSnapshot | null {
    if (this.snapshots.length === 0) {
      return null;
    }
    return this.snapshots[this.snapshots.length - 1];
  }

  public first(): ConfigSnapshot | null {
    if (this.snapshots.length === 0) {
      return null;
    }
    return this.snapshots[0];
  }

  public countDark(): number {
    let count: number = 0;
    for (let i = 0; i < this.snapshots.length; i++) {
      if (this.snapshots[i].isDark()) {
        count++;
      }
    }
    return count;
  }

  public countRtl(): number {
    let count: number = 0;
    for (let i = 0; i < this.snapshots.length; i++) {
      if (this.snapshots[i].isRtl()) {
        count++;
      }
    }
    return count;
  }

  public changedFields(): number {
    if (this.snapshots.length < 2) {
      return 0;
    }
    const previous: ConfigSnapshot = this.snapshots[this.snapshots.length - 2];
    const current: ConfigSnapshot = this.snapshots[this.snapshots.length - 1];
    let changed: number = 0;
    if (previous.language !== current.language) {
      changed++;
    }
    if (previous.colorMode !== current.colorMode) {
      changed++;
    }
    if (previous.direction !== current.direction) {
      changed++;
    }
    if (previous.fontSizeScale !== current.fontSizeScale) {
      changed++;
    }
    if (previous.fontWeightScale !== current.fontWeightScale) {
      changed++;
    }
    return changed;
  }

  public clear(): void {
    this.snapshots.splice(0, this.snapshots.length);
  }
}

class MemoryLevelPolicy {
  public static isCritical(level: number): boolean {
    return level === MEMORY_LEVEL_CRITICAL;
  }

  public static isLow(level: number): boolean {
    return level === MEMORY_LEVEL_LOW;
  }

  public static shouldTrimCaches(level: number): boolean {
    return level >= MEMORY_LEVEL_LOW;
  }

  public static severity(level: number): number {
    if (level < MEMORY_LEVEL_NORMAL || level > MEMORY_LEVEL_CRITICAL) {
      return -1;
    }
    return level;
  }

  public static maxOf(levels: number[]): number {
    if (levels.length === 0) {
      return MEMORY_LEVEL_NORMAL;
    }
    let highest: number = levels[0];
    for (let i = 1; i < levels.length; i++) {
      if (levels[i] > highest) {
        highest = levels[i];
      }
    }
    return highest;
  }
}

class PageTextProbe {
  public static async current(driver: Driver): Promise<string> {
    if (await checkTextContent(driver, PAGE_TEXT_INITIAL)) {
      return PAGE_TEXT_INITIAL;
    }
    if (await checkTextContent(driver, PAGE_TEXT_CLICKED)) {
      return PAGE_TEXT_CLICKED;
    }
    return '';
  }

  public static isKnown(text: string): boolean {
    return text === PAGE_TEXT_INITIAL || text === PAGE_TEXT_CLICKED;
  }

  public static async ensureClicked(driver: Driver): Promise<boolean> {
    const currentText: string = await PageTextProbe.current(driver);
    if (currentText.length === 0) {
      return false;
    }
    await tapComponentByText(driver, currentText);
    return await waitForTextVisible(driver, PAGE_TEXT_CLICKED);
  }
}

export default function environmentEventValidationTest(): void {
  describe('EnvironmentEventValidationTest', () => {
    beforeAll(async () => {
      await launchEntryAbility();
      await ensureIndexPageInitial(getDriver());
    });

    afterAll(async () => {
      logInfo('EnvironmentEventValidationTest suite finished');
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_0100
     * @tc.name testEnvEventNameEnvironment
     * @tc.desc Verify the environment callback event name is exactly environment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvEventNameEnvironment', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(ENV_CALLBACK_EVENT).assertEqual('environment');
          expect(EnvironmentValidator.checkEventName('environment')).assertEqual(EnvErrorCode.OK);
          expect(ENV_CALLBACK_EVENT.length).assertEqual(11);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_0200
     * @tc.name testEnvEventNameEmpty
     * @tc.desc Verify empty event name yields EVENT_NAME_EMPTY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvEventNameEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(EnvironmentValidator.checkEventName('')).assertEqual(EnvErrorCode.EVENT_NAME_EMPTY);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_0300
     * @tc.name testEnvEventNameUnknown
     * @tc.desc Verify unrelated event names are rejected with EVENT_NAME_UNKNOWN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvEventNameUnknown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(EnvironmentValidator.checkEventName('abilityLifecycle')).assertEqual(EnvErrorCode.EVENT_NAME_UNKNOWN);
          expect(EnvironmentValidator.checkEventName('Environment')).assertEqual(EnvErrorCode.EVENT_NAME_UNKNOWN);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_0400
     * @tc.name testEnvColorModeAccepted
     * @tc.desc Verify colorMode values -1 0 1 are all accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvColorModeAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(EnvironmentValidator.checkColorMode(COLOR_MODE_NOT_SET)).assertEqual(EnvErrorCode.OK);
          expect(EnvironmentValidator.checkColorMode(COLOR_MODE_DARK)).assertEqual(EnvErrorCode.OK);
          expect(EnvironmentValidator.checkColorMode(COLOR_MODE_LIGHT)).assertEqual(EnvErrorCode.OK);
          expect(COLOR_MODE_NOT_SET).assertEqual(-1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_0500
     * @tc.name testEnvColorModeRejected
     * @tc.desc Verify colorMode 2 and -2 are rejected with COLOR_MODE_OUT_OF_RANGE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvColorModeRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(EnvironmentValidator.checkColorMode(2)).assertEqual(EnvErrorCode.COLOR_MODE_OUT_OF_RANGE);
          expect(EnvironmentValidator.checkColorMode(-2)).assertEqual(EnvErrorCode.COLOR_MODE_OUT_OF_RANGE);
          expect(EnvironmentValidator.checkColorMode(100)).assertEqual(EnvErrorCode.COLOR_MODE_OUT_OF_RANGE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_0600
     * @tc.name testEnvDirectionAccepted
     * @tc.desc Verify direction 0 and 1 are accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvDirectionAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(EnvironmentValidator.checkDirection(DIRECTION_LTR)).assertEqual(EnvErrorCode.OK);
          expect(EnvironmentValidator.checkDirection(DIRECTION_RTL)).assertEqual(EnvErrorCode.OK);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_0700
     * @tc.name testEnvDirectionRejected
     * @tc.desc Verify direction 2 and -1 are rejected with DIRECTION_OUT_OF_RANGE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvDirectionRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(EnvironmentValidator.checkDirection(2)).assertEqual(EnvErrorCode.DIRECTION_OUT_OF_RANGE);
          expect(EnvironmentValidator.checkDirection(-1)).assertEqual(EnvErrorCode.DIRECTION_OUT_OF_RANGE);
          expect(EnvironmentValidator.checkDirection(90)).assertEqual(EnvErrorCode.DIRECTION_OUT_OF_RANGE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_0800
     * @tc.name testEnvFontScaleBounds
     * @tc.desc Verify font scale 0.1 and 3.0 pass while 0.09 and 3.01 fail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvFontScaleBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(EnvironmentValidator.checkFontSizeScale(MIN_FONT_SCALE)).assertEqual(EnvErrorCode.OK);
          expect(EnvironmentValidator.checkFontSizeScale(MAX_FONT_SCALE)).assertEqual(EnvErrorCode.OK);
          expect(EnvironmentValidator.checkFontSizeScale(0.09)).assertEqual(EnvErrorCode.FONT_SCALE_OUT_OF_RANGE);
          expect(EnvironmentValidator.checkFontSizeScale(3.01)).assertEqual(EnvErrorCode.FONT_SCALE_OUT_OF_RANGE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_0900
     * @tc.name testEnvFontScaleNeutral
     * @tc.desc Verify neutral font scale 1.0 passes and zero is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvFontScaleNeutral', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(EnvironmentValidator.checkFontSizeScale(NEUTRAL_FONT_SCALE)).assertEqual(EnvErrorCode.OK);
          expect(EnvironmentValidator.checkFontSizeScale(0)).assertEqual(EnvErrorCode.FONT_SCALE_OUT_OF_RANGE);
          expect(EnvironmentValidator.checkFontSizeScale(-1)).assertEqual(EnvErrorCode.FONT_SCALE_OUT_OF_RANGE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_1000
     * @tc.name testEnvFontScaleNaN
     * @tc.desc Verify a NaN font scale is rejected with FONT_SCALE_OUT_OF_RANGE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvFontScaleNaN', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const invalidScale: number = parseInt('scale', 10);
          expect(isNaN(invalidScale)).assertTrue();
          expect(EnvironmentValidator.checkFontSizeScale(invalidScale))
            .assertEqual(EnvErrorCode.FONT_SCALE_OUT_OF_RANGE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_1100
     * @tc.name testEnvFontWeightScaleBounds
     * @tc.desc Verify font weight scale 0.1 and 3.0 pass while out of range values fail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvFontWeightScaleBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(EnvironmentValidator.checkFontWeightScale(MIN_FONT_WEIGHT_SCALE)).assertEqual(EnvErrorCode.OK);
          expect(EnvironmentValidator.checkFontWeightScale(MAX_FONT_WEIGHT_SCALE)).assertEqual(EnvErrorCode.OK);
          expect(EnvironmentValidator.checkFontWeightScale(0)).assertEqual(
            EnvErrorCode.FONT_WEIGHT_SCALE_OUT_OF_RANGE);
          expect(EnvironmentValidator.checkFontWeightScale(4)).assertEqual(
            EnvErrorCode.FONT_WEIGHT_SCALE_OUT_OF_RANGE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_1200
     * @tc.name testEnvMemoryLevelAccepted
     * @tc.desc Verify memory levels 0 1 and 2 are all accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvMemoryLevelAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(EnvironmentValidator.checkMemoryLevel(MEMORY_LEVEL_NORMAL)).assertEqual(EnvErrorCode.OK);
          expect(EnvironmentValidator.checkMemoryLevel(MEMORY_LEVEL_LOW)).assertEqual(EnvErrorCode.OK);
          expect(EnvironmentValidator.checkMemoryLevel(MEMORY_LEVEL_CRITICAL)).assertEqual(EnvErrorCode.OK);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_1300
     * @tc.name testEnvMemoryLevelRejected
     * @tc.desc Verify memory level 3 and -1 are rejected with MEMORY_LEVEL_OUT_OF_RANGE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvMemoryLevelRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(EnvironmentValidator.checkMemoryLevel(3)).assertEqual(EnvErrorCode.MEMORY_LEVEL_OUT_OF_RANGE);
          expect(EnvironmentValidator.checkMemoryLevel(-1)).assertEqual(EnvErrorCode.MEMORY_LEVEL_OUT_OF_RANGE);
          expect(EnvironmentValidator.checkMemoryLevel(99)).assertEqual(EnvErrorCode.MEMORY_LEVEL_OUT_OF_RANGE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_1400
     * @tc.name testEnvDefaultSnapshotValid
     * @tc.desc Verify the default zh-Hans light LTR snapshot passes full validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvDefaultSnapshotValid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const snapshot: ConfigSnapshot = ConfigSnapshot.defaultSnapshot();
          expect(EnvironmentValidator.checkSnapshot(snapshot)).assertEqual(EnvErrorCode.OK);
          expect(EnvironmentValidator.isValidSnapshot(snapshot)).assertTrue();
          expect(snapshot.isDark()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_1500
     * @tc.name testEnvLanguageEmpty
     * @tc.desc Verify an empty language tag yields LANGUAGE_EMPTY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvLanguageEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(LanguageRules.checkTag('')).assertEqual(EnvErrorCode.LANGUAGE_EMPTY);
          expect(EnvironmentValidator.checkSnapshot(
            ConfigSnapshot.defaultSnapshot().copyWithLanguage(''))).assertEqual(EnvErrorCode.LANGUAGE_EMPTY);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_1600
     * @tc.name testEnvLanguageTooShort
     * @tc.desc Verify a one character language tag yields LANGUAGE_TOO_SHORT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvLanguageTooShort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(LanguageRules.checkTag('z')).assertEqual(EnvErrorCode.LANGUAGE_TOO_SHORT);
          expect(LanguageRules.checkTag('zh')).assertEqual(EnvErrorCode.OK);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_1700
     * @tc.name testEnvLanguageTooLong
     * @tc.desc Verify a 21 character language tag yields LANGUAGE_TOO_LONG
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvLanguageTooLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const longTag: string = 'zh-Hans-CN-extra-tags';
          expect(longTag.length).assertEqual(21);
          expect(LanguageRules.checkTag(longTag)).assertEqual(EnvErrorCode.LANGUAGE_TOO_LONG);
          expect(LanguageRules.checkTag('zh-Hans-CN-extra-tag')).assertEqual(EnvErrorCode.OK);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_1800
     * @tc.name testEnvLanguageFormatInvalid
     * @tc.desc Verify language tags with digits or spaces yield LANGUAGE_FORMAT_INVALID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvLanguageFormatInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(LanguageRules.checkTag('zh1')).assertEqual(EnvErrorCode.LANGUAGE_FORMAT_INVALID);
          expect(LanguageRules.checkTag('zh Hans')).assertEqual(EnvErrorCode.LANGUAGE_FORMAT_INVALID);
          expect(LanguageRules.checkTag('en_US')).assertEqual(EnvErrorCode.LANGUAGE_FORMAT_INVALID);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_1900
     * @tc.name testEnvLanguageSubtables
     * @tc.desc Verify primary subtag extraction and region detection for zh-Hans-CN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvLanguageSubtables', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(LanguageRules.primarySubtag('zh-Hans-CN')).assertEqual('zh');
          expect(LanguageRules.primarySubtag('en')).assertEqual('en');
          expect(LanguageRules.hasRegion('zh-Hans-CN')).assertTrue();
          expect(LanguageRules.hasRegion('en')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_2000
     * @tc.name testEnvLanguageSamePrimary
     * @tc.desc Verify samePrimary compares only the primary language subtag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvLanguageSamePrimary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(LanguageRules.samePrimary('zh-Hans', 'zh-Hant')).assertTrue();
          expect(LanguageRules.samePrimary('zh', 'en')).assertFalse();
          expect(LanguageRules.samePrimary('en-US', 'en-GB')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_2100
     * @tc.name testEnvSnapshotColorModeError
     * @tc.desc Verify a snapshot with colorMode 5 yields COLOR_MODE_OUT_OF_RANGE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvSnapshotColorModeError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const snapshot: ConfigSnapshot = ConfigSnapshot.defaultSnapshot().copyWithColorMode(5);
          expect(EnvironmentValidator.checkSnapshot(snapshot)).assertEqual(EnvErrorCode.COLOR_MODE_OUT_OF_RANGE);
          expect(EnvironmentValidator.isValidSnapshot(snapshot)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_2200
     * @tc.name testEnvSnapshotFontScaleError
     * @tc.desc Verify a snapshot with fontSizeScale 0.05 yields FONT_SCALE_OUT_OF_RANGE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvSnapshotFontScaleError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const snapshot: ConfigSnapshot = ConfigSnapshot.defaultSnapshot().copyWithFontScale(0.05);
          expect(EnvironmentValidator.checkSnapshot(snapshot)).assertEqual(EnvErrorCode.FONT_SCALE_OUT_OF_RANGE);
          const weightSnapshot: ConfigSnapshot = ConfigSnapshot.defaultSnapshot().copyWithWeightScale(0.05);
          expect(EnvironmentValidator.checkSnapshot(weightSnapshot))
            .assertEqual(EnvErrorCode.FONT_WEIGHT_SCALE_OUT_OF_RANGE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_2300
     * @tc.name testEnvSnapshotFirstFailureOrder
     * @tc.desc Verify color mode failure is reported before a later language failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvSnapshotFirstFailureOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const snapshot: ConfigSnapshot = new ConfigSnapshot('', 9, 7, 0.05, 0.05);
          expect(EnvironmentValidator.checkSnapshot(snapshot)).assertEqual(EnvErrorCode.COLOR_MODE_OUT_OF_RANGE);
          expect(EnvironmentValidator.checkDirection(snapshot.direction)).assertEqual(
            EnvErrorCode.DIRECTION_OUT_OF_RANGE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_2400
     * @tc.name testEnvRequireSnapshotThrows
     * @tc.desc Verify requireSnapshot throws ColorModeRangeError for an out of range color mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvRequireSnapshotThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          try {
            EnvironmentValidator.requireSnapshot(ConfigSnapshot.defaultSnapshot().copyWithColorMode(4));
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ColorModeRangeError');
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_2500
     * @tc.name testEnvRequireMemoryThrows
     * @tc.desc Verify requireMemoryLevel throws MemoryLevelRangeError for level 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvRequireMemoryThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          try {
            EnvironmentValidator.requireMemoryLevel(7);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('MemoryLevelRangeError');
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_2600
     * @tc.name testEnvErrorNameMapping
     * @tc.desc Verify error name mapping for unknown event and invalid language codes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvErrorNameMapping', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(EnvironmentValidator.errorName(EnvErrorCode.EVENT_NAME_UNKNOWN)).assertEqual('EventNameUnknownError');
          expect(EnvironmentValidator.errorName(EnvErrorCode.LANGUAGE_FORMAT_INVALID))
            .assertEqual('LanguageFormatError');
          expect(EnvironmentValidator.errorName(EnvErrorCode.OK)).assertEqual('NoError');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_2700
     * @tc.name testEnvJournalRecording
     * @tc.desc Verify the journal records two snapshots and reports the latest color mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvJournalRecording', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const journal: ConfigurationJournal = new ConfigurationJournal();
          expect(journal.record(ConfigSnapshot.defaultSnapshot())).assertEqual(1);
          expect(journal.record(ConfigSnapshot.defaultSnapshot().copyWithColorMode(COLOR_MODE_DARK)))
            .assertEqual(2);
          expect(journal.size()).assertEqual(2);
          const latest: ConfigSnapshot | null = journal.latest();
          if (latest === null) {
            expect().assertFail();
            return;
          }
          expect(latest.colorMode).assertEqual(COLOR_MODE_DARK);
          expect(journal.countDark()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_2800
     * @tc.name testEnvJournalEmpty
     * @tc.desc Verify an empty journal reports null endpoints zero counts and no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvJournalEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const journal: ConfigurationJournal = new ConfigurationJournal();
          expect(journal.latest()).assertEqual(null);
          expect(journal.first()).assertEqual(null);
          expect(journal.countDark()).assertEqual(0);
          expect(journal.changedFields()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_2900
     * @tc.name testEnvJournalChangedFields
     * @tc.desc Verify three changed fields are reported between two snapshots differing in color font and direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvJournalChangedFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const journal: ConfigurationJournal = new ConfigurationJournal();
          journal.record(ConfigSnapshot.defaultSnapshot());
          const changed: ConfigSnapshot = new ConfigSnapshot('zh-Hans', COLOR_MODE_DARK, DIRECTION_RTL, 1.5, 1.0);
          journal.record(changed);
          expect(journal.changedFields()).assertEqual(3);
          expect(journal.countRtl()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_3000
     * @tc.name testEnvJournalClear
     * @tc.desc Verify clearing the journal drops all recorded snapshots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvJournalClear', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const journal: ConfigurationJournal = new ConfigurationJournal();
          journal.record(ConfigSnapshot.defaultSnapshot());
          journal.record(ConfigSnapshot.defaultSnapshot());
          journal.clear();
          expect(journal.size()).assertEqual(0);
          expect(journal.first()).assertEqual(null);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_3100
     * @tc.name testEnvMemoryPolicySeverity
     * @tc.desc Verify memory policy critical detection and invalid severity for level 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvMemoryPolicySeverity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(MemoryLevelPolicy.isCritical(MEMORY_LEVEL_CRITICAL)).assertTrue();
          expect(MemoryLevelPolicy.isLow(MEMORY_LEVEL_LOW)).assertTrue();
          expect(MemoryLevelPolicy.severity(5)).assertEqual(-1);
          expect(MemoryLevelPolicy.severity(MEMORY_LEVEL_NORMAL)).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_3200
     * @tc.name testEnvMemoryTrimPolicy
     * @tc.desc Verify cache trimming starts at low memory and is skipped at normal level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvMemoryTrimPolicy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(MemoryLevelPolicy.shouldTrimCaches(MEMORY_LEVEL_NORMAL)).assertFalse();
          expect(MemoryLevelPolicy.shouldTrimCaches(MEMORY_LEVEL_LOW)).assertTrue();
          expect(MemoryLevelPolicy.shouldTrimCaches(MEMORY_LEVEL_CRITICAL)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_3300
     * @tc.name testEnvMemoryMaxOfSequence
     * @tc.desc Verify maxOf selects the critical level from a mixed memory level sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvMemoryMaxOfSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const levels: number[] = [MEMORY_LEVEL_NORMAL, MEMORY_LEVEL_CRITICAL, MEMORY_LEVEL_LOW];
          expect(MemoryLevelPolicy.maxOf(levels)).assertEqual(MEMORY_LEVEL_CRITICAL);
          const empty: number[] = [];
          expect(MemoryLevelPolicy.maxOf(empty)).assertEqual(MEMORY_LEVEL_NORMAL);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_3400
     * @tc.name testEnvLaunchRendersIndex
     * @tc.desc Verify the AbilityStage launches and the Index page becomes visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvLaunchRendersIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await waitForIndexPageStable(driver)).assertTrue();
          expect(await isIndexPageVisible(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_3500
     * @tc.name testEnvIndexRenderedText
     * @tc.desc Verify the page renders a known text after the environment callback registration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvIndexRenderedText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const currentText: string = await PageTextProbe.current(driver);
          expect(PageTextProbe.isKnown(currentText)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_3600
     * @tc.name testEnvClickSwitchesText
     * @tc.desc Verify clicking the text switches it to Welcome while the callback stays registered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvClickSwitchesText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await PageTextProbe.ensureClicked(driver)).assertTrue();
          expect(await checkTextContent(driver, PAGE_TEXT_CLICKED)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_3700
     * @tc.name testEnvBackgroundForegroundSurvives
     * @tc.desc Verify the page survives an environment relevant background foreground cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvBackgroundForegroundSurvives', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await isIndexPageVisible(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_3800
     * @tc.name testEnvSnapshotValidationRepeated
     * @tc.desc Verify repeated validation of the same snapshot stays OK for ten rounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvSnapshotValidationRepeated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const snapshot: ConfigSnapshot = ConfigSnapshot.defaultSnapshot();
          let okCount: number = 0;
          for (let i = 0; i < 10; i++) {
            if (EnvironmentValidator.checkSnapshot(snapshot) === EnvErrorCode.OK) {
              okCount++;
            }
          }
          expect(okCount).assertEqual(10);
          logInfo('environment snapshot validated ten times');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_3900
     * @tc.name testEnvUnknownEventErrorName
     * @tc.desc Verify throwing for an unknown event name produces EventNameUnknownError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvUnknownEventErrorName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const code: EnvErrorCode = EnvironmentValidator.checkEventName('configurationUpdate');
          try {
            if (code !== EnvErrorCode.OK) {
              throw EnvironmentValidator.toError(code);
            }
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('EventNameUnknownError');
            logError('unknown environment event rejected as expected');
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ENVEVENT_4000
     * @tc.name testEnvLanguageBoundaryLength
     * @tc.desc Verify language tags at the 2 and 20 character boundaries both pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvLanguageBoundaryLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect('en'.length).assertEqual(LANGUAGE_MIN_LENGTH);
          expect(LanguageRules.checkTag('en')).assertEqual(EnvErrorCode.OK);
          expect('zh-Hans-CN-extra-tag'.length).assertEqual(LANGUAGE_MAX_LENGTH);
          expect(LanguageRules.checkTag('zh-Hans-CN-extra-tag')).assertEqual(EnvErrorCode.OK);
        } finally {
          done();
        }
      })
  })
}
