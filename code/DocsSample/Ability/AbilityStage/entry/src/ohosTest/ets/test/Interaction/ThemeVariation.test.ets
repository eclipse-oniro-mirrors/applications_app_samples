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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';
import {
  getDriver,
  ensureIndexPageInitial,
  getAbilityDelegator,
  logInfo,
  logError,
  launchEntryAbility,
  waitForIndexPageStable,
  checkTextContent,
  checkComponentExistsByKey,
  waitForTextVisible,
  tapComponentByText,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_CLICKED,
  PAGE_TEXT_INITIAL,
  COLOR_MODE_NOT_SET,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_TEXT_APPEAR
} from '../Shared/SharedDriver';

const START_WINDOW_TOKEN: string = 'start_window_background';

const BASE_LIGHT_VALUE: string = '#FFFFFF';

const DARK_VALUE: string = '#000000';

const FALLBACK_VALUE: string = '#FFFFFF';

const COLOR_MODE_DARK_VALUE: number = 0;

const COLOR_MODE_LIGHT_VALUE: number = 1;

const RGB_MAX: number = 255;

class ColorModeError extends Error {
  private readonly rejectedMode: number;

  constructor(rejectedMode: number) {
    super(`color mode rejected: ${rejectedMode}`);
    this.name = 'ColorModeError';
    this.rejectedMode = rejectedMode;
  }

  public getRejectedMode(): number {
    return this.rejectedMode;
  }
}

class ColorToken {
  private readonly tokenName: string;
  private readonly hexValue: string;

  constructor(tokenName: string, hexValue: string) {
    this.tokenName = tokenName;
    this.hexValue = hexValue;
  }

  public getTokenName(): string {
    return this.tokenName;
  }

  public getHexValue(): string {
    return this.hexValue;
  }

  public isValidHex(): boolean {
    if (this.hexValue.length !== 7) {
      return false;
    }
    if (this.hexValue.charAt(0) !== '#') {
      return false;
    }
    const body: string = this.hexValue.substring(1);
    const allowed: string = '0123456789ABCDEFabcdef';
    for (let i = 0; i < body.length; i++) {
      if (allowed.indexOf(body.charAt(i)) < 0) {
        return false;
      }
    }
    return true;
  }

  private static hexDigitValue(character: string): number {
    const code: number = character.charCodeAt(0);
    if (code >= 48 && code <= 57) {
      return code - 48;
    }
    if (code >= 65 && code <= 70) {
      return code - 55;
    }
    if (code >= 97 && code <= 102) {
      return code - 87;
    }
    return -1;
  }

  private static parseHexPair(pair: string): number {
    if (pair.length !== 2) {
      return 0;
    }
    const high: number = ColorToken.hexDigitValue(pair.charAt(0));
    const low: number = ColorToken.hexDigitValue(pair.charAt(1));
    if (high < 0 || low < 0) {
      return 0;
    }
    return high * 16 + low;
  }

  public getRed(): number {
    if (!this.isValidHex()) {
      return 0;
    }
    return ColorToken.parseHexPair(this.hexValue.substring(1, 3));
  }

  public getGreen(): number {
    if (!this.isValidHex()) {
      return 0;
    }
    return ColorToken.parseHexPair(this.hexValue.substring(3, 5));
  }

  public getBlue(): number {
    if (!this.isValidHex()) {
      return 0;
    }
    return ColorToken.parseHexPair(this.hexValue.substring(5, 7));
  }

  public getBrightness(): number {
    if (!this.isValidHex()) {
      return 0;
    }
    return Math.round((this.getRed() * 299 + this.getGreen() * 587 + this.getBlue() * 114) / 1000);
  }

  public isLightColor(): boolean {
    return this.getBrightness() >= 128;
  }
}

class ThemeResourceTable {
  private readonly baseTokens: ColorToken[] = [];
  private readonly darkTokens: ColorToken[] = [];

  public registerBase(token: ColorToken): void {
    this.baseTokens.push(token);
  }

  public registerDark(token: ColorToken): void {
    this.darkTokens.push(token);
  }

  public getBaseCount(): number {
    return this.baseTokens.length;
  }

  public getDarkCount(): number {
    return this.darkTokens.length;
  }

  public findBase(tokenName: string): ColorToken | null {
    for (let i = 0; i < this.baseTokens.length; i++) {
      if (this.baseTokens[i].getTokenName() === tokenName) {
        return this.baseTokens[i];
      }
    }
    return null;
  }

  public findDark(tokenName: string): ColorToken | null {
    for (let i = 0; i < this.darkTokens.length; i++) {
      if (this.darkTokens[i].getTokenName() === tokenName) {
        return this.darkTokens[i];
      }
    }
    return null;
  }
}

class ThemeResolver {
  private readonly table: ThemeResourceTable;

  constructor(table: ThemeResourceTable) {
    this.table = table;
  }

  public normalizeColorMode(colorMode: number): number {
    if (colorMode === COLOR_MODE_NOT_SET || colorMode === COLOR_MODE_DARK_VALUE ||
      colorMode === COLOR_MODE_LIGHT_VALUE) {
      return colorMode;
    }
    throw new ColorModeError(colorMode);
  }

  public isValidColorMode(colorMode: number): boolean {
    return colorMode === COLOR_MODE_NOT_SET || colorMode === COLOR_MODE_DARK_VALUE ||
      colorMode === COLOR_MODE_LIGHT_VALUE;
  }

  public resolveHex(tokenName: string, colorMode: number): string {
    const normalized: number = this.normalizeColorMode(colorMode);
    if (normalized === COLOR_MODE_DARK_VALUE) {
      const darkToken: ColorToken | null = this.table.findDark(tokenName);
      if (darkToken !== null) {
        return darkToken.getHexValue();
      }
    }
    const baseToken: ColorToken | null = this.table.findBase(tokenName);
    if (baseToken !== null) {
      return baseToken.getHexValue();
    }
    return FALLBACK_VALUE;
  }

  public resolveToken(tokenName: string, colorMode: number): ColorToken {
    return new ColorToken(tokenName, this.resolveHex(tokenName, colorMode));
  }

  public resolveChainDepth(tokenName: string, colorMode: number): number {
    const normalized: number = this.normalizeColorMode(colorMode);
    if (normalized === COLOR_MODE_DARK_VALUE && this.table.findDark(tokenName) !== null) {
      return 1;
    }
    if (this.table.findBase(tokenName) !== null) {
      return 2;
    }
    return 3;
  }

  public isDarkOverridden(tokenName: string): boolean {
    return this.table.findDark(tokenName) !== null;
  }
}

class ThemeSnapshot {
  private readonly colorMode: number;
  private readonly backgroundHex: string;
  private readonly revision: number;

  constructor(colorMode: number, backgroundHex: string, revision: number) {
    this.colorMode = colorMode;
    this.backgroundHex = backgroundHex;
    this.revision = revision;
  }

  public getColorMode(): number {
    return this.colorMode;
  }

  public getBackgroundHex(): string {
    return this.backgroundHex;
  }

  public getRevision(): number {
    return this.revision;
  }
}

function buildResourceTable(): ThemeResourceTable {
  const table: ThemeResourceTable = new ThemeResourceTable();
  table.registerBase(new ColorToken(START_WINDOW_TOKEN, BASE_LIGHT_VALUE));
  table.registerDark(new ColorToken(START_WINDOW_TOKEN, DARK_VALUE));
  return table;
}

export default function themeVariationTest(): void {
  describe('ThemeVariationTest', () => {
    let driver: Driver;
    let resolver: ThemeResolver;

    beforeAll(async () => {
      driver = getDriver();
      resolver = new ThemeResolver(buildResourceTable());
      logInfo('ThemeVariationTest: beforeAll start');
      await launchEntryAbility();
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
      logInfo('ThemeVariationTest: beforeAll finished');
    })

    afterAll(async () => {
      logInfo('ThemeVariationTest: afterAll start');
      await driver.delayMs(100);
      logInfo('ThemeVariationTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_THEME_0100
     * @tc.name testThemeLightModeResolvesBaseColor
     * @tc.desc Verify light mode resolves start_window_background to the base white value #FFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeLightModeResolvesBaseColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const resolved: string = resolver.resolveHex(START_WINDOW_TOKEN, COLOR_MODE_LIGHT_VALUE);
        expect(resolved).assertEqual(BASE_LIGHT_VALUE);
        const token: ColorToken = resolver.resolveToken(START_WINDOW_TOKEN, COLOR_MODE_LIGHT_VALUE);
        expect(token.getRed()).assertEqual(255);
        expect(token.getGreen()).assertEqual(255);
        expect(token.getBlue()).assertEqual(255);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_THEME_0200
     * @tc.name testThemeDarkModeResolvesDarkColor
     * @tc.desc Verify dark mode resolves start_window_background to the dark override #000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeDarkModeResolvesDarkColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const resolved: string = resolver.resolveHex(START_WINDOW_TOKEN, COLOR_MODE_DARK_VALUE);
        expect(resolved).assertEqual(DARK_VALUE);
        const token: ColorToken = resolver.resolveToken(START_WINDOW_TOKEN, COLOR_MODE_DARK_VALUE);
        expect(token.getBrightness()).assertEqual(0);
        expect(token.isLightColor()).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_THEME_0300
     * @tc.name testThemeNotSetFallsBackToBase
     * @tc.desc Verify COLOR_MODE_NOT_SET falls through to the base table and yields #FFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeNotSetFallsBackToBase', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(COLOR_MODE_NOT_SET).assertEqual(-1);
        const resolved: string = resolver.resolveHex(START_WINDOW_TOKEN, COLOR_MODE_NOT_SET);
        expect(resolved).assertEqual(BASE_LIGHT_VALUE);
        expect(resolver.isValidColorMode(COLOR_MODE_NOT_SET)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_THEME_0400
     * @tc.name testThemeUnknownTokenFallback
     * @tc.desc Verify an unregistered token returns the fallback white in both light and dark modes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeUnknownTokenFallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(resolver.resolveHex('missing_token', COLOR_MODE_LIGHT_VALUE)).assertEqual(FALLBACK_VALUE);
        expect(resolver.resolveHex('missing_token', COLOR_MODE_DARK_VALUE)).assertEqual(FALLBACK_VALUE);
        expect(resolver.resolveChainDepth('missing_token', COLOR_MODE_DARK_VALUE)).assertEqual(3);
        expect(resolver.isDarkOverridden('missing_token')).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_THEME_0500
     * @tc.name testThemeFallbackChainDepth
     * @tc.desc Verify the start window token resolves at depth 1 in dark mode and depth 2 in light mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeFallbackChainDepth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(resolver.resolveChainDepth(START_WINDOW_TOKEN, COLOR_MODE_DARK_VALUE)).assertEqual(1);
        expect(resolver.resolveChainDepth(START_WINDOW_TOKEN, COLOR_MODE_LIGHT_VALUE)).assertEqual(2);
        expect(resolver.resolveChainDepth(START_WINDOW_TOKEN, COLOR_MODE_NOT_SET)).assertEqual(2);
        expect(resolver.isDarkOverridden(START_WINDOW_TOKEN)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_THEME_0600
     * @tc.name testThemeInvalidColorModeRejected
     * @tc.desc Verify color mode 7 and -2 are rejected with ColorModeError while three legal modes pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeInvalidColorModeRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(resolver.isValidColorMode(7)).assertFalse();
        expect(resolver.isValidColorMode(-2)).assertFalse();
        try {
          resolver.normalizeColorMode(7);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ColorModeError');
        }
        expect(resolver.isValidColorMode(COLOR_MODE_LIGHT_VALUE)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_THEME_0700
     * @tc.name testThemeInvalidModeRejectedResolve
     * @tc.desc Verify calling resolveHex with mode 99 raises ColorModeError instead of returning a color
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeInvalidModeRejectedResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        try {
          resolver.resolveHex(START_WINDOW_TOKEN, 99);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ColorModeError');
        }
        expect(resolver.isValidColorMode(99)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_THEME_0800
     * @tc.name testThemeNormalizePreservesLegalModes
     * @tc.desc Verify normalizeColorMode returns each of the three legal modes unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeNormalizePreservesLegalModes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(resolver.normalizeColorMode(COLOR_MODE_NOT_SET)).assertEqual(COLOR_MODE_NOT_SET);
        expect(resolver.normalizeColorMode(COLOR_MODE_DARK_VALUE)).assertEqual(COLOR_MODE_DARK_VALUE);
        expect(resolver.normalizeColorMode(COLOR_MODE_LIGHT_VALUE)).assertEqual(COLOR_MODE_LIGHT_VALUE);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_THEME_0900
     * @tc.name testThemeConstantAlignment
     * @tc.desc Verify ConfigurationConstant color modes match the local model values dark 0 light 1 not set -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeConstantAlignment', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(ConfigurationConstant.ColorMode.COLOR_MODE_DARK).assertEqual(COLOR_MODE_DARK_VALUE);
        expect(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT).assertEqual(COLOR_MODE_LIGHT_VALUE);
        expect(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET).assertEqual(COLOR_MODE_NOT_SET);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_THEME_1000
     * @tc.name testThemeTokenHexValidation
     * @tc.desc Verify six digit hex forms are accepted while short malformed and non hex forms are rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeTokenHexValidation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(new ColorToken('a', '#FFFFFF').isValidHex()).assertTrue();
        expect(new ColorToken('b', '#000000').isValidHex()).assertTrue();
        expect(new ColorToken('c', '#FFF').isValidHex()).assertFalse();
        expect(new ColorToken('d', 'FFFFFF').isValidHex()).assertFalse();
        expect(new ColorToken('e', '#GGGGGG').isValidHex()).assertFalse();
        expect(new ColorToken('f', '#GGGGGG').getRed()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_THEME_1100
     * @tc.name testThemeBrightnessClassification
     * @tc.desc Verify white brightness 255 is light while black brightness 0 is dark and mid gray rounds to 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeBrightnessClassification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const white: ColorToken = new ColorToken('white', '#FFFFFF');
        const black: ColorToken = new ColorToken('black', '#000000');
        const gray: ColorToken = new ColorToken('gray', '#808080');
        expect(white.getBrightness()).assertEqual(255);
        expect(black.getBrightness()).assertEqual(0);
        expect(gray.getBrightness()).assertEqual(128);
        expect(white.isLightColor()).assertTrue();
        expect(black.isLightColor()).assertFalse();
        expect(gray.isLightColor()).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_THEME_1200
     * @tc.name testThemeChannelDecomposition
     * @tc.desc Verify pure red decomposes to channels 255 0 0 and a mid tone to 51 102 153
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeChannelDecomposition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const red: ColorToken = new ColorToken('red', '#FF0000');
        const tone: ColorToken = new ColorToken('tone', '#336699');
        expect(red.getRed()).assertEqual(255);
        expect(red.getGreen()).assertEqual(0);
        expect(red.getBlue()).assertEqual(0);
        expect(tone.getRed()).assertEqual(51);
        expect(tone.getGreen()).assertEqual(102);
        expect(tone.getBlue()).assertEqual(153);
        expect(red.getGreen() + red.getBlue()).assertEqual(0);
        expect(RGB_MAX).assertEqual(255);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_THEME_1300
     * @tc.name testThemeResourceTableContents
     * @tc.desc Verify the resource table registers one base and one dark token for the start window color
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeResourceTableContents', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const table: ThemeResourceTable = buildResourceTable();
        expect(table.getBaseCount()).assertEqual(1);
        expect(table.getDarkCount()).assertEqual(1);
        const baseToken: ColorToken | null = table.findBase(START_WINDOW_TOKEN);
        expect(baseToken !== null).assertTrue();
        const darkToken: ColorToken | null = table.findDark(START_WINDOW_TOKEN);
        expect(darkToken !== null).assertTrue();
        expect(table.findBase('absent')).assertNull();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_THEME_1400
     * @tc.name testThemeSnapshotIsolation
     * @tc.desc Verify snapshots taken in light and dark modes retain their own resolved colors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeSnapshotIsolation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const lightSnapshot: ThemeSnapshot = new ThemeSnapshot(COLOR_MODE_LIGHT_VALUE,
          resolver.resolveHex(START_WINDOW_TOKEN, COLOR_MODE_LIGHT_VALUE), 1);
        const darkSnapshot: ThemeSnapshot = new ThemeSnapshot(COLOR_MODE_DARK_VALUE,
          resolver.resolveHex(START_WINDOW_TOKEN, COLOR_MODE_DARK_VALUE), 2);
        expect(lightSnapshot.getBackgroundHex()).assertEqual(BASE_LIGHT_VALUE);
        expect(darkSnapshot.getBackgroundHex()).assertEqual(DARK_VALUE);
        expect(lightSnapshot.getRevision()).assertEqual(1);
        expect(darkSnapshot.getRevision()).assertEqual(2);
        expect(lightSnapshot.getColorMode() !== darkSnapshot.getColorMode()).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_THEME_1500
     * @tc.name testThemeSwitchCycleStable
     * @tc.desc Verify ten alternating light and dark resolutions alternate between white and black exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeSwitchCycleStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        let lightHits: number = 0;
        let darkHits: number = 0;
        for (let i = 0; i < 10; i++) {
          const mode: number = i % 2 === 0 ? COLOR_MODE_LIGHT_VALUE : COLOR_MODE_DARK_VALUE;
          const hex: string = resolver.resolveHex(START_WINDOW_TOKEN, mode);
          if (hex === BASE_LIGHT_VALUE) {
            lightHits++;
          }
          if (hex === DARK_VALUE) {
            darkHits++;
          }
        }
        expect(lightHits).assertEqual(5);
        expect(darkHits).assertEqual(5);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_THEME_1600
     * @tc.name testThemeRealUiStillRenders
     * @tc.desc Verify the live page keeps rendering the HelloWorld node regardless of the ambient color mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeRealUiStillRenders', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const idExists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(idExists).assertTrue();
      } catch (e) {
        logError(`testThemeRealUiStillRenders failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_THEME_1700
     * @tc.name testThemeRealUiInteractionAfterThemeCheck
     * @tc.desc Verify the HelloWorld node remains clickable and text transitions to Welcome after the theme checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeRealUiInteractionAfterThemeCheck', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const initialPresent: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        if (initialPresent) {
          const tapped: boolean = await tapComponentByText(driver, PAGE_TEXT_INITIAL);
          expect(tapped).assertTrue();
        } else {
          const tapped: boolean = await tapComponentByText(driver, PAGE_TEXT_CLICKED);
          expect(tapped).assertTrue();
        }
        const welcomeVisible: boolean = await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR);
        expect(welcomeVisible).assertTrue();
        expect(await checkTextContent(driver, PAGE_TEXT_CLICKED)).assertTrue();
      } catch (e) {
        logError(`testThemeRealUiInteractionAfterThemeCheck failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_THEME_1800
     * @tc.name testThemeRealUiStartWindowColorResource
     * @tc.desc Verify the start_window_background resource resolves to either the base or the dark table value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeRealUiStartWindowColorResource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const delegator: abilityDelegatorRegistry.AbilityDelegator = getAbilityDelegator();
        const resourceColor: number = await delegator.getAppContext().resourceManager
          .getColorByName(START_WINDOW_TOKEN);
        const red: number = Math.floor(resourceColor / 65536) % 256;
        const green: number = Math.floor(resourceColor / 256) % 256;
        const blue: number = resourceColor % 256;
        const baseToken: ColorToken = new ColorToken(START_WINDOW_TOKEN, BASE_LIGHT_VALUE);
        const darkToken: ColorToken = new ColorToken(START_WINDOW_TOKEN, DARK_VALUE);
        const matchesBase: boolean = red === baseToken.getRed() && green === baseToken.getGreen() &&
          blue === baseToken.getBlue();
        const matchesDark: boolean = red === darkToken.getRed() && green === darkToken.getGreen() &&
          blue === darkToken.getBlue();
        expect(resourceColor >= 0).assertTrue();
        expect(matchesBase || matchesDark).assertTrue();
        expect(red + green + blue === 765 || red + green + blue === 0).assertTrue();
        logInfo(`testThemeRealUiStartWindowColorResource: resolved color ${resourceColor}`);
      } catch (e) {
        logError(`testThemeRealUiStartWindowColorResource failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })
  })
}
