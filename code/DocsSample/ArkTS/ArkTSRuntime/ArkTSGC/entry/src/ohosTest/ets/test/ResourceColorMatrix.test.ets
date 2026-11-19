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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { resourceManager } from '@kit.LocalizationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import {
  argbFromHex,
  entryContext,
  ERR_RES_ID_INVALID,
  ERR_RES_NAME_INVALID,
  errorCode
} from './shared/AppProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

// The module publishes exactly one color. base/element/color.json declares start_window_background as
// #FFFFFF and dark/element/color.json re-declares the same name as #000000, so the two literals below
// are the only facts copied out of the json files; every other constant is derived from them.
const COLOR_NAME: string = 'start_window_background';
const BASE_COLOR_HEX: string = '#FFFFFF';
const DARK_COLOR_HEX: string = '#000000';
const BASE_COLOR_VALUE: number = 0xFFFFFFFF;
const DARK_COLOR_VALUE: number = 0xFF000000;
const TRANSPARENT_VALUE: number = 0x00000000;
const TRANSPARENT_WHITE_VALUE: number = 0x00FFFFFF;
const RED_EXTREME_VALUE: number = 0xFFFF0000;
const GREEN_EXTREME_VALUE: number = 0xFF00FF00;
const BLUE_EXTREME_VALUE: number = 0xFF0000FF;
const HALF_ALPHA_RED_VALUE: number = 0x80FF0000;
const HALF_ALPHA_BLACK_VALUE: number = 0x80000000;
const CHANNEL_MAX: number = 255;
const BYTE_SPAN: number = 256;
const GREEN_SPAN: number = 65536;
const RGB_SPAN: number = 16777216;
const ARGB_SPAN: number = 4294967296;
const PERCENT_SCALE: number = 100;
const HEX_DIGITS: string = '0123456789ABCDEF';
const HEX_LITERAL: RegExp = /^#([0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$/;
const APP_COLOR_KEY: string = 'app.color.start_window_background';
const STRING_RESOURCE_NAME: string = 'app_name';
const EN_US_LOCALE: string = 'en_US';
const ZH_CN_LOCALE: string = 'zh_CN';
const ID_SCAN_SPAN: number = 1024;
const ID_SCAN_BASE: number = 0x01000000;
const MISSING_COLOR: number = -1;

// digit value of one hex character, -1 for anything that is not a hex digit (including '#')
function hexDigitOf(unit: number): number {
  if (unit >= 0x30 && unit <= 0x39) {
    return unit - 0x30;
  }
  if (unit >= 0x41 && unit <= 0x46) {
    return unit - 0x37;
  }
  if (unit >= 0x61 && unit <= 0x66) {
    return unit - 0x57;
  }
  return -1;
}

// independent oracle for a '#RRGGBB' or '#AARRGGBB' literal: repeated multiply and add, no bit shifting
function oracleHex(hex: string): number {
  let total: number = 0;
  for (let index = 0; index < hex.length; index++) {
    const digit: number = hexDigitOf(hex.charCodeAt(index));
    if (digit < 0) {
      continue;
    }
    total = total * 16 + digit;
  }
  if (hex.length === 7) {
    total = total + CHANNEL_MAX * RGB_SPAN;
  }
  return total;
}

// channel of a packed value obtained by division instead of the shifts the helpers use
function oracleChannel(value: number, power: number): number {
  return Math.floor(value / Math.pow(2, power)) % BYTE_SPAN;
}

function oracleAlphaOf(value: number): number {
  return oracleChannel(value, 24);
}

function oracleRgbOf(value: number): number {
  return value % RGB_SPAN;
}

// independent packing: positional weights instead of shifts
function oraclePack(alpha: number, red: number, green: number, blue: number): number {
  return alpha * RGB_SPAN + red * GREEN_SPAN + green * BYTE_SPAN + blue;
}

function oracleHexText(value: number, digits: number): string {
  let text: string = '';
  let rest: number = value;
  for (let index = 0; index < digits; index++) {
    const digit: number = rest % 16;
    text = HEX_DIGITS.charAt(digit) + text;
    rest = Math.floor(rest / 16);
  }
  return '#' + text;
}

function oracleLuma(red: number, green: number, blue: number): number {
  return Math.floor((299 * red + 587 * green + 114 * blue) / 1000);
}

function oracleAverage(red: number, green: number, blue: number): number {
  return Math.floor((red + green + blue) / 3);
}

function oracleMix(from: number, to: number, weight: number): number {
  return Math.floor((from * (PERCENT_SCALE - weight) + to * weight) / PERCENT_SCALE);
}

// per channel interpolation that never touches the Argb helpers under test
function oracleBlend(from: number, to: number, weight: number): number {
  return oraclePack(oracleMix(oracleAlphaOf(from), oracleAlphaOf(to), weight),
    oracleMix(oracleChannel(from, 16), oracleChannel(to, 16), weight),
    oracleMix(oracleChannel(from, 8), oracleChannel(to, 8), weight),
    oracleMix(oracleChannel(from, 0), oracleChannel(to, 0), weight));
}

function oracleRgbGap(first: number, second: number): number {
  return Math.abs(oracleChannel(first, 16) - oracleChannel(second, 16)) +
    Math.abs(oracleChannel(first, 8) - oracleChannel(second, 8)) +
    Math.abs(oracleChannel(first, 0) - oracleChannel(second, 0));
}

function countDistinct(values: number[]): number {
  return new Set<number>(values).size;
}

// the unit under test: ARGB packing and unpacking helpers built from 32 bit integers
class Argb {
  static readonly ALPHA_BITS: number = 24;
  static readonly RED_BITS: number = 16;
  static readonly GREEN_BITS: number = 8;
  static readonly CHANNEL_MASK: number = 0xFF;
  static readonly FULL_ALPHA: number = 255;

  static alpha(value: number): number {
    return (value >>> Argb.ALPHA_BITS) & Argb.CHANNEL_MASK;
  }

  static red(value: number): number {
    return (value >>> Argb.RED_BITS) & Argb.CHANNEL_MASK;
  }

  static green(value: number): number {
    return (value >>> Argb.GREEN_BITS) & Argb.CHANNEL_MASK;
  }

  static blue(value: number): number {
    return value & Argb.CHANNEL_MASK;
  }

  static channelSet(value: number): number[] {
    return [Argb.alpha(value), Argb.red(value), Argb.green(value), Argb.blue(value)];
  }

  static pack(alpha: number, red: number, green: number, blue: number): number {
    return (((alpha & Argb.CHANNEL_MASK) << Argb.ALPHA_BITS) | ((red & Argb.CHANNEL_MASK) << Argb.RED_BITS) |
      ((green & Argb.CHANNEL_MASK) << Argb.GREEN_BITS) | (blue & Argb.CHANNEL_MASK)) >>> 0;
  }

  static clamp(unit: number): number {
    if (unit < 0) {
      return 0;
    }
    return unit > CHANNEL_MAX ? CHANNEL_MAX : unit;
  }

  static packClamped(alpha: number, red: number, green: number, blue: number): number {
    return Argb.pack(Argb.clamp(alpha), Argb.clamp(red), Argb.clamp(green), Argb.clamp(blue));
  }

  static withAlpha(value: number, alpha: number): number {
    return Argb.pack(Argb.clamp(alpha), Argb.red(value), Argb.green(value), Argb.blue(value));
  }

  static dropAlpha(value: number): number {
    return value & (RGB_SPAN - 1);
  }

  static toHex8(value: number): string {
    return '#' + (value >>> 0).toString(16).toUpperCase().padStart(8, '0');
  }

  static toHex6(value: number): string {
    return '#' + Argb.dropAlpha(value).toString(16).toUpperCase().padStart(6, '0');
  }

  static parse(text: string): number {
    if (text.match(HEX_LITERAL) === null) {
      return MISSING_COLOR;
    }
    const digits: string = text.substring(1);
    const parsed: number = parseInt(digits, 16);
    return digits.length === 6 ? parsed + Argb.FULL_ALPHA * RGB_SPAN : parsed;
  }

  static weightedLuma(value: number): number {
    return Math.floor((299 * Argb.red(value) + 587 * Argb.green(value) + 114 * Argb.blue(value)) / 1000);
  }

  static average(value: number): number {
    return Math.floor((Argb.red(value) + Argb.green(value) + Argb.blue(value)) / 3);
  }

  static mix(from: number, to: number, weight: number): number {
    return Math.floor((from * (PERCENT_SCALE - weight) + to * weight) / PERCENT_SCALE);
  }

  static blend(from: number, to: number, weight: number): number {
    return Argb.pack(Argb.mix(Argb.alpha(from), Argb.alpha(to), weight),
      Argb.mix(Argb.red(from), Argb.red(to), weight),
      Argb.mix(Argb.green(from), Argb.green(to), weight),
      Argb.mix(Argb.blue(from), Argb.blue(to), weight));
  }

  static invert(value: number): number {
    return Argb.pack(Argb.alpha(value), CHANNEL_MAX - Argb.red(value), CHANNEL_MAX - Argb.green(value),
      CHANNEL_MAX - Argb.blue(value));
  }

  static toGray(value: number): number {
    const level: number = Argb.weightedLuma(value);
    return Argb.pack(Argb.alpha(value), level, level, level);
  }

  static isOpaque(value: number): boolean {
    return Argb.alpha(value) === Argb.FULL_ALPHA;
  }

  static isTransparent(value: number): boolean {
    return Argb.alpha(value) === 0;
  }

  static isGray(value: number): boolean {
    return Argb.red(value) === Argb.green(value) && Argb.green(value) === Argb.blue(value);
  }

  static alphaPercent(value: number): number {
    return Math.floor(Argb.alpha(value) * PERCENT_SCALE / CHANNEL_MAX);
  }

  static rgbDistance(first: number, second: number): number {
    return Math.abs(Argb.red(first) - Argb.red(second)) + Math.abs(Argb.green(first) - Argb.green(second)) +
      Math.abs(Argb.blue(first) - Argb.blue(second));
  }

  static fullDistance(first: number, second: number): number {
    return Argb.rgbDistance(first, second) + Math.abs(Argb.alpha(first) - Argb.alpha(second));
  }
}

function resources(): resourceManager.ResourceManager {
  return entryContext().resourceManager;
}

function overrideWithColorMode(mode: resourceManager.ColorMode): resourceManager.ResourceManager {
  const manager: resourceManager.ResourceManager = resources();
  const config: resourceManager.Configuration = manager.getOverrideConfiguration();
  config.colorMode = mode;
  return manager.getOverrideResourceManager(config);
}

function overrideWithLocaleAndMode(locale: string,
  mode: resourceManager.ColorMode): resourceManager.ResourceManager {
  const manager: resourceManager.ResourceManager = resources();
  const config: resourceManager.Configuration = manager.getOverrideConfiguration();
  config.locale = locale;
  config.colorMode = mode;
  return manager.getOverrideResourceManager(config);
}

function overrideWithDeviceTypeAndMode(deviceType: resourceManager.DeviceType,
  mode: resourceManager.ColorMode): resourceManager.ResourceManager {
  const manager: resourceManager.ResourceManager = resources();
  const config: resourceManager.Configuration = manager.getOverrideConfiguration();
  config.deviceType = deviceType;
  config.colorMode = mode;
  return manager.getOverrideResourceManager(config);
}

// one override manager per flavour is created once and kept, so a hundred lookups never exhaust the
// override budget of the resource runtime
let lightCache: resourceManager.ResourceManager | null = null;
let darkCache: resourceManager.ResourceManager | null = null;
let enUsCache: resourceManager.ResourceManager | null = null;
let zhCnCache: resourceManager.ResourceManager | null = null;
let enUsDarkCache: resourceManager.ResourceManager | null = null;
let zhCnDarkCache: resourceManager.ResourceManager | null = null;
let phoneCache: resourceManager.ResourceManager | null = null;

function lightManager(): resourceManager.ResourceManager {
  const cached: resourceManager.ResourceManager | null = lightCache;
  if (cached !== null) {
    return cached;
  }
  const created: resourceManager.ResourceManager = overrideWithColorMode(resourceManager.ColorMode.LIGHT);
  lightCache = created;
  return created;
}

function darkManager(): resourceManager.ResourceManager {
  const cached: resourceManager.ResourceManager | null = darkCache;
  if (cached !== null) {
    return cached;
  }
  const created: resourceManager.ResourceManager = overrideWithColorMode(resourceManager.ColorMode.DARK);
  darkCache = created;
  return created;
}

function enUsManager(): resourceManager.ResourceManager {
  const cached: resourceManager.ResourceManager | null = enUsCache;
  if (cached !== null) {
    return cached;
  }
  const created: resourceManager.ResourceManager =
    overrideWithLocaleAndMode(EN_US_LOCALE, resourceManager.ColorMode.LIGHT);
  enUsCache = created;
  return created;
}

function zhCnManager(): resourceManager.ResourceManager {
  const cached: resourceManager.ResourceManager | null = zhCnCache;
  if (cached !== null) {
    return cached;
  }
  const created: resourceManager.ResourceManager =
    overrideWithLocaleAndMode(ZH_CN_LOCALE, resourceManager.ColorMode.LIGHT);
  zhCnCache = created;
  return created;
}

function enUsDarkManager(): resourceManager.ResourceManager {
  const cached: resourceManager.ResourceManager | null = enUsDarkCache;
  if (cached !== null) {
    return cached;
  }
  const created: resourceManager.ResourceManager =
    overrideWithLocaleAndMode(EN_US_LOCALE, resourceManager.ColorMode.DARK);
  enUsDarkCache = created;
  return created;
}

function zhCnDarkManager(): resourceManager.ResourceManager {
  const cached: resourceManager.ResourceManager | null = zhCnDarkCache;
  if (cached !== null) {
    return cached;
  }
  const created: resourceManager.ResourceManager =
    overrideWithLocaleAndMode(ZH_CN_LOCALE, resourceManager.ColorMode.DARK);
  zhCnDarkCache = created;
  return created;
}

function phoneManager(): resourceManager.ResourceManager {
  const cached: resourceManager.ResourceManager | null = phoneCache;
  if (cached !== null) {
    return cached;
  }
  const created: resourceManager.ResourceManager =
    overrideWithDeviceTypeAndMode(resourceManager.DeviceType.DEVICE_TYPE_PHONE, resourceManager.ColorMode.LIGHT);
  phoneCache = created;
  return created;
}

// the compiled description of the single app color, carrying the id the resource compiler assigned
function colorResource(): Resource {
  return $r('app.color.start_window_background');
}

function compiledColorId(): number {
  return colorResource().id;
}

function colorOrMissing(manager: resourceManager.ResourceManager, id: number): number {
  try {
    return manager.getColorSync(id);
  } catch (error) {
    return MISSING_COLOR;
  }
}

// the numeric id the entry resource table answers with; the compiled id is used when the entry manager
// resolves it to the expected color, otherwise the id is located by matching the name based read inside
// the app id window, so every id based case talks to an id the manager really knows
let numericIdCache: number = -1;

function numericColorId(): number {
  if (numericIdCache >= 0) {
    return numericIdCache;
  }
  const manager: resourceManager.ResourceManager = resources();
  const expected: number = manager.getColorByNameSync(COLOR_NAME);
  const compiled: number = compiledColorId();
  if (colorOrMissing(manager, compiled) === expected) {
    numericIdCache = compiled;
    return compiled;
  }
  let located: number = MISSING_COLOR;
  for (let candidate: number = ID_SCAN_BASE; candidate < ID_SCAN_BASE + ID_SCAN_SPAN && located < 0; candidate++) {
    if (colorOrMissing(manager, candidate) === expected) {
      located = candidate;
    }
  }
  numericIdCache = located >= 0 ? located : compiled;
  return numericIdCache;
}

async function promiseColorError(action: () => Promise<number>): Promise<number> {
  try {
    await action();
  } catch (error) {
    return Number((error as BusinessError).code);
  }
  return 0;
}

function syncColorError(action: () => void): number {
  return errorCode(action);
}

export default function resourceColorMatrixTest() {
  describe('ResourceColorMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_0100
     * @tc.name      testResColorBaseNameOracle0001
     * @tc.desc      Read the only app color by name and compare it with the #FFFFFF literal of the base
     *               color.json recomputed digit by digit
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResColorBaseNameOracle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const actual: number = lightManager().getColorByNameSync(COLOR_NAME);
      const expected: number = oracleHex(BASE_COLOR_HEX);
      logCase('testResColorBaseNameOracle0001', `name=${COLOR_NAME} actual=${actual} expected=${expected}`);
      expect(actual).assertEqual(expected);
      expect(actual).assertEqual(BASE_COLOR_VALUE);
      expect(actual === oracleHex(DARK_COLOR_HEX)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_0200
     * @tc.name      testResColorBaseAlphaMask0002
     * @tc.desc      Check the alpha byte of the base color is fully saturated and matches the division
     *               based oracle
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResColorBaseAlphaMask0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value: number = resources().getColorByNameSync(COLOR_NAME);
      const alpha: number = Argb.alpha(value);
      logCase('testResColorBaseAlphaMask0002', `value=${value} alpha=${alpha} oracle=${oracleAlphaOf(value)}`);
      expect(alpha).assertEqual(CHANNEL_MAX);
      expect(oracleAlphaOf(value)).assertEqual(alpha);
      expect(value >= CHANNEL_MAX * RGB_SPAN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_0300
     * @tc.name      testResColorBaseChannelTrio0003
     * @tc.desc      Decompose the base color and check the three color channels are equal and all sit at
     *               the maximum
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResColorBaseChannelTrio0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value: number = lightManager().getColorByNameSync(COLOR_NAME);
      const red: number = Argb.red(value);
      const green: number = Argb.green(value);
      const blue: number = Argb.blue(value);
      logCase('testResColorBaseChannelTrio0003', `red=${red} green=${green} blue=${blue}`);
      expect(red).assertEqual(green);
      expect(green).assertEqual(blue);
      expect(red + green + blue).assertEqual(CHANNEL_MAX * 3);
      expect(Math.min(red, green, blue)).assertEqual(CHANNEL_MAX);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_0400
     * @tc.name      testResColorBaseRgbMask0004
     * @tc.desc      Mask the base color down to its 24 bit payload with a modulo oracle and check the
     *               helper agrees
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorBaseRgbMask0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const value: number = lightManager().getColorByNameSync(COLOR_NAME);
      const masked: number = value % RGB_SPAN;
      logCase('testResColorBaseRgbMask0004', `value=${value} masked=${masked} span=${RGB_SPAN}`);
      expect(masked).assertEqual(RGB_SPAN - 1);
      expect(Argb.dropAlpha(value)).assertEqual(masked);
      expect(oracleRgbOf(value)).assertEqual(masked);
      expect(oracleRgbOf(value)).assertEqual(oracleRgbOf(oracleHex(BASE_COLOR_HEX)));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_0500
     * @tc.name      testResColorBaseLuma0005
     * @tc.desc      Compute the weighted luminance of the base color and check both the integer oracle and
     *               the channel average land on the maximum
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorBaseLuma0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const value: number = lightManager().getColorByNameSync(COLOR_NAME);
      const luma: number = Argb.weightedLuma(value);
      const oracleLumaValue: number = oracleLuma(CHANNEL_MAX, CHANNEL_MAX, CHANNEL_MAX);
      logCase('testResColorBaseLuma0005', `value=${value} luma=${luma} oracleLuma=${oracleLumaValue}`);
      expect(luma).assertEqual(CHANNEL_MAX);
      expect(oracleLumaValue).assertEqual(luma);
      expect(Argb.average(value)).assertEqual(CHANNEL_MAX);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_0600
     * @tc.name      testResColorDarkOracle0006
     * @tc.desc      Read the same color under the dark qualifier and compare it with the #000000 literal of
     *               the dark color.json
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResColorDarkOracle0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const actual: number = darkManager().getColorByNameSync(COLOR_NAME);
      const parsed: number = Argb.parse(DARK_COLOR_HEX);
      logCase('testResColorDarkOracle0006', `actual=${actual} parsed=${parsed} hex=${Argb.toHex6(actual)}`);
      expect(actual).assertEqual(parsed);
      expect(Argb.toHex6(actual)).assertEqual(DARK_COLOR_HEX);
      expect(Argb.alpha(actual)).assertEqual(CHANNEL_MAX);
      expect(oracleRgbOf(actual)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_0700
     * @tc.name      testResColorDarkAlphaZero0007
     * @tc.desc      Check the dark color is fully opaque while all three color channels are zero and the
     *               alpha percentage is complete
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorDarkAlphaZero0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const value: number = darkManager().getColorByNameSync(COLOR_NAME);
      const channels: number[] = Argb.channelSet(value);
      logCase('testResColorDarkAlphaZero0007', `value=${value} channels=${channels.join(',')}`);
      expect(channels[0]).assertEqual(CHANNEL_MAX);
      expect(channels[1] + channels[2] + channels[3]).assertEqual(0);
      expect(Argb.alphaPercent(value)).assertEqual(PERCENT_SCALE);
      expect(Argb.isOpaque(value)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_0800
     * @tc.name      testResColorBaseHexText0008
     * @tc.desc      Format the base color back to eight and six digit hex text and check both against the
     *               digit table oracle
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorBaseHexText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const value: number = lightManager().getColorByNameSync(COLOR_NAME);
      const eight: string = Argb.toHex8(value);
      const six: string = Argb.toHex6(value);
      logCase('testResColorBaseHexText0008', `eight=${eight} six=${six}`);
      expect(eight).assertEqual('#FFFFFFFF');
      expect(six).assertEqual(BASE_COLOR_HEX);
      expect(eight).assertEqual(oracleHexText(value, 8));
      expect(six).assertEqual(oracleHexText(oracleRgbOf(value), 6));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_0900
     * @tc.name      testResColorHelperAgreement0009
     * @tc.desc      Feed the base color literal through the shared helper, the local parser and the
     *               multiply and add oracle and check all four routes agree
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResColorHelperAgreement0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const actual: number = lightManager().getColorByNameSync(COLOR_NAME);
      const shared: number = argbFromHex(BASE_COLOR_HEX);
      const local: number = Argb.parse(BASE_COLOR_HEX);
      logCase('testResColorHelperAgreement0009', `actual=${actual} shared=${shared} local=${local} ` +
        `oracle=${oracleHex(BASE_COLOR_HEX)}`);
      expect(shared).assertEqual(actual);
      expect(local).assertEqual(actual);
      expect(oracleHex(BASE_COLOR_HEX)).assertEqual(local);
      expect(shared).assertEqual(local);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_1000
     * @tc.name      testResColorBaseNumericDomain0010
     * @tc.desc      Check the base color is a non negative whole number inside the 32 bit unsigned domain
     *               and survives an unsigned normalisation unchanged
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorBaseNumericDomain0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const value: number = resources().getColorByNameSync(COLOR_NAME);
      logCase('testResColorBaseNumericDomain0010', `value=${value} argbSpan=${ARGB_SPAN}`);
      expect(value >>> 0).assertEqual(value);
      expect(value > 0).assertTrue();
      expect(Math.floor(value)).assertEqual(value);
      expect(value < ARGB_SPAN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_1100
     * @tc.name      testResColorDarkPackAgreement0011
     * @tc.desc      Pack an opaque black by hand and check it reproduces the dark qualified resource value
     *               and the dark json literal
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorDarkPackAgreement0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const dark: number = darkManager().getColorByNameSync(COLOR_NAME);
      const packed: number = Argb.pack(CHANNEL_MAX, 0, 0, 0);
      logCase('testResColorDarkPackAgreement0011', `dark=${dark} packed=${packed} ` +
        `oraclePacked=${oraclePack(CHANNEL_MAX, 0, 0, 0)}`);
      expect(packed).assertEqual(dark);
      expect(packed).assertEqual(oracleHex(DARK_COLOR_HEX));
      expect(oraclePack(CHANNEL_MAX, 0, 0, 0)).assertEqual(packed);
      expect(Argb.channelSet(packed).join(',')).assertEqual('255,0,0,0');
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_1200
     * @tc.name      testResColorBasePackAgreement0012
     * @tc.desc      Pack an opaque white by hand and check it reproduces the base resource value and that
     *               the channel sum covers all four bytes
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorBasePackAgreement0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base: number = lightManager().getColorByNameSync(COLOR_NAME);
      const packed: number = Argb.pack(CHANNEL_MAX, CHANNEL_MAX, CHANNEL_MAX, CHANNEL_MAX);
      const channels: number[] = Argb.channelSet(packed);
      let sum: number = 0;
      for (const channel of channels) {
        sum += channel;
      }
      logCase('testResColorBasePackAgreement0012', `base=${base} packed=${packed} sum=${sum}`);
      expect(packed).assertEqual(base);
      expect(packed).assertEqual(oracleHex(BASE_COLOR_HEX));
      expect(sum).assertEqual(CHANNEL_MAX * 4);
      expect(channels.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_1300
     * @tc.name      testResColorQualifierSplit0013
     * @tc.desc      Read the background under a forced light and a forced dark configuration and check the
     *               two qualifier branches resolve different literals
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResColorQualifierSplit0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const light: number = lightManager().getColorByNameSync(COLOR_NAME);
      const dark: number = darkManager().getColorByNameSync(COLOR_NAME);
      logCase('testResColorQualifierSplit0013', `light=${light} dark=${dark}`);
      expect(light).assertEqual(oracleHex(BASE_COLOR_HEX));
      expect(dark).assertEqual(oracleHex(DARK_COLOR_HEX));
      expect(light === dark).assertFalse();
      expect(light - dark).assertEqual(RGB_SPAN - 1);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_1400
     * @tc.name      testResColorCurrentModeMatch0014
     * @tc.desc      Read the color under the live configuration and check the value follows the color mode
     *               the device reports
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorCurrentModeMatch0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const config: resourceManager.Configuration = resources().getConfigurationSync();
      const actual: number = resources().getColorByNameSync(COLOR_NAME);
      const expectedHex: string =
        config.colorMode === resourceManager.ColorMode.DARK ? DARK_COLOR_HEX : BASE_COLOR_HEX;
      logCase('testResColorCurrentModeMatch0014', `colorMode=${config.colorMode} actual=${actual} ` +
        `expectedHex=${expectedHex}`);
      expect(actual).assertEqual(oracleHex(expectedHex));
      expect(Argb.toHex6(actual)).assertEqual(expectedHex);
      expect(Argb.alphaPercent(actual)).assertEqual(PERCENT_SCALE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_1500
     * @tc.name      testResColorOverrideAlphaSame0015
     * @tc.desc      Check the alpha channel is identical for the light and the dark branch even though the
     *               rgb payload differs, so the override only touches the color bytes
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorOverrideAlphaSame0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const light: number = lightManager().getColorByNameSync(COLOR_NAME);
      const dark: number = darkManager().getColorByNameSync(COLOR_NAME);
      const lightAlpha: number = Argb.alpha(light);
      const darkAlpha: number = Argb.alpha(dark);
      logCase('testResColorOverrideAlphaSame0015', `lightAlpha=${lightAlpha} darkAlpha=${darkAlpha}`);
      expect(lightAlpha).assertEqual(darkAlpha);
      expect(lightAlpha).assertEqual(CHANNEL_MAX);
      expect(Argb.alphaPercent(light)).assertEqual(Argb.alphaPercent(dark));
      expect(Argb.isOpaque(light) && Argb.isOpaque(dark)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_1600
     * @tc.name      testResColorOverrideRepeat0016
     * @tc.desc      Read each qualifier twice and check the repeated reads are stable while the two
     *               qualifiers stay distinct
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorOverrideRepeat0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const firstLight: number = lightManager().getColorByNameSync(COLOR_NAME);
      const secondLight: number = lightManager().getColorByNameSync(COLOR_NAME);
      const firstDark: number = darkManager().getColorByNameSync(COLOR_NAME);
      const secondDark: number = darkManager().getColorByNameSync(COLOR_NAME);
      const seen: number[] = [firstLight, secondLight, firstDark, secondDark];
      logCase('testResColorOverrideRepeat0016', `values=${seen.join(',')} distinct=${countDistinct(seen)}`);
      expect(firstLight).assertEqual(secondLight);
      expect(firstDark).assertEqual(secondDark);
      expect(countDistinct(seen)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_1700
     * @tc.name      testResColorLocaleIndependence0017
     * @tc.desc      Read the color under two different locale overrides and check the language qualifier
     *               leaves the light value untouched
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorLocaleIndependence0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const english: number = enUsManager().getColorByNameSync(COLOR_NAME);
      const chinese: number = zhCnManager().getColorByNameSync(COLOR_NAME);
      logCase('testResColorLocaleIndependence0017', `english=${english} chinese=${chinese}`);
      expect(english).assertEqual(oracleHex(BASE_COLOR_HEX));
      expect(chinese).assertEqual(oracleHex(BASE_COLOR_HEX));
      expect(english).assertEqual(chinese);
      expect(Argb.toHex6(english)).assertEqual(BASE_COLOR_HEX);
      expect(Argb.toHex6(chinese)).assertEqual(BASE_COLOR_HEX);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_1800
     * @tc.name      testResColorLocaleDarkAgreement0018
     * @tc.desc      Combine both locales with the dark color mode and check the language qualifier does not
     *               disturb the dark color selection
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorLocaleDarkAgreement0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const englishDark: number = enUsDarkManager().getColorByNameSync(COLOR_NAME);
      const chineseDark: number = zhCnDarkManager().getColorByNameSync(COLOR_NAME);
      const plainDark: number = darkManager().getColorByNameSync(COLOR_NAME);
      logCase('testResColorLocaleDarkAgreement0018', `englishDark=${englishDark} chineseDark=${chineseDark} ` +
        `plainDark=${plainDark}`);
      expect(englishDark).assertEqual(chineseDark);
      expect(englishDark).assertEqual(plainDark);
      expect(englishDark).assertEqual(oracleHex(DARK_COLOR_HEX));
      expect(Argb.toHex6(englishDark)).assertEqual(DARK_COLOR_HEX);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_1900
     * @tc.name      testResColorDeviceTypeStable0019
     * @tc.desc      Read the color through a phone device type override and check it stays on the base
     *               literal and keeps a fully populated rgb payload
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorDeviceTypeStable0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const phone: number = phoneManager().getColorByNameSync(COLOR_NAME);
      const phoneById: number = phoneManager().getColorSync(numericColorId());
      logCase('testResColorDeviceTypeStable0019', `phone=${phone} phoneById=${phoneById} ` +
        `rgbMask=${oracleRgbOf(phone)}`);
      expect(phone).assertEqual(oracleHex(BASE_COLOR_HEX));
      expect(phoneById).assertEqual(phone);
      expect(oracleRgbOf(phone)).assertEqual(RGB_SPAN - 1);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_2000
     * @tc.name      testResColorOverrideConfigReadback0020
     * @tc.desc      Check each cached override manager reports back the color mode it was asked for and that
     *               the readback stays paired with the right color literal
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorOverrideConfigReadback0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const lightConfig: resourceManager.Configuration = lightManager().getOverrideConfiguration();
      const darkConfig: resourceManager.Configuration = darkManager().getOverrideConfiguration();
      logCase('testResColorOverrideConfigReadback0020', `lightMode=${lightConfig.colorMode} ` +
        `darkMode=${darkConfig.colorMode}`);
      expect(lightConfig.colorMode).assertEqual(resourceManager.ColorMode.LIGHT);
      expect(darkConfig.colorMode).assertEqual(resourceManager.ColorMode.DARK);
      expect(lightConfig.colorMode === darkConfig.colorMode).assertFalse();
      expect(lightManager().getColorByNameSync(COLOR_NAME) === darkManager().getColorByNameSync(COLOR_NAME))
        .assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_2100
     * @tc.name      testResColorOverrideUpdateFlip0021
     * @tc.desc      Flip a private override manager from light to dark at run time and check the resolved
     *               color changes on the very same manager instance
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorOverrideUpdateFlip0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const manager: resourceManager.ResourceManager = overrideWithColorMode(resourceManager.ColorMode.LIGHT);
      const before: number = manager.getColorByNameSync(COLOR_NAME);
      const config: resourceManager.Configuration = manager.getOverrideConfiguration();
      config.colorMode = resourceManager.ColorMode.DARK;
      manager.updateOverrideConfiguration(config);
      const after: number = manager.getColorByNameSync(COLOR_NAME);
      const readback: resourceManager.ColorMode = manager.getOverrideConfiguration().colorMode;
      logCase('testResColorOverrideUpdateFlip0021', `before=${before} after=${after} readback=${readback}`);
      expect(before).assertEqual(oracleHex(BASE_COLOR_HEX));
      expect(after).assertEqual(oracleHex(DARK_COLOR_HEX));
      expect(before === after).assertFalse();
      expect(readback).assertEqual(resourceManager.ColorMode.DARK);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_2200
     * @tc.name      testResColorOverrideMaskSplit0022
     * @tc.desc      Mask both qualifier branches down to 24 bits and check the two masks are complementary
     *               extremes of the rgb range
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorOverrideMaskSplit0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lightMask: number = Argb.dropAlpha(lightManager().getColorByNameSync(COLOR_NAME));
      const darkMask: number = Argb.dropAlpha(darkManager().getColorByNameSync(COLOR_NAME));
      logCase('testResColorOverrideMaskSplit0022', `lightMask=${lightMask} darkMask=${darkMask} ` +
        `sum=${lightMask + darkMask}`);
      expect(lightMask).assertEqual(RGB_SPAN - 1);
      expect(darkMask).assertEqual(0);
      expect(lightMask + darkMask).assertEqual(RGB_SPAN - 1);
      expect((lightMask & darkMask)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_2300
     * @tc.name      testResColorOverrideLumaGap0023
     * @tc.desc      Compare the weighted luminance of both qualifier branches and check the gap spans the
     *               whole luminance range
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorOverrideLumaGap0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lightLuma: number = Argb.weightedLuma(lightManager().getColorByNameSync(COLOR_NAME));
      const darkLuma: number = Argb.weightedLuma(darkManager().getColorByNameSync(COLOR_NAME));
      logCase('testResColorOverrideLumaGap0023', `lightLuma=${lightLuma} darkLuma=${darkLuma} ` +
        `gap=${lightLuma - darkLuma}`);
      expect(lightLuma).assertEqual(CHANNEL_MAX);
      expect(darkLuma).assertEqual(0);
      expect(lightLuma - darkLuma).assertEqual(oracleLuma(CHANNEL_MAX, CHANNEL_MAX, CHANNEL_MAX));
      expect(Argb.average(darkManager().getColorByNameSync(COLOR_NAME))).assertEqual(darkLuma);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_2400
     * @tc.name      testResColorOverrideHexText0024
     * @tc.desc      Render both qualifier branches as hex text and check they reproduce the two json
     *               literals exactly
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorOverrideHexText0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const light: number = lightManager().getColorByNameSync(COLOR_NAME);
      const dark: number = darkManager().getColorByNameSync(COLOR_NAME);
      const eightDigitWhite: string = '#' + 'FF' + BASE_COLOR_HEX.substring(1);
      logCase('testResColorOverrideHexText0024', `light=${Argb.toHex6(light)} dark=${Argb.toHex6(dark)}`);
      expect(Argb.toHex6(light)).assertEqual(BASE_COLOR_HEX);
      expect(Argb.toHex6(dark)).assertEqual(DARK_COLOR_HEX);
      expect(Argb.toHex8(light)).assertEqual(eightDigitWhite);
      expect(Argb.toHex8(dark).substring(1)).assertEqual('FF' + DARK_COLOR_HEX.substring(1));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_2500
     * @tc.name      testResColorOverrideFreshManagers0025
     * @tc.desc      Build three independent light override managers and check they all resolve the same
     *               literal without sharing state
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorOverrideFreshManagers0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const first: number = overrideWithColorMode(resourceManager.ColorMode.LIGHT).getColorByNameSync(COLOR_NAME);
      const second: number = overrideWithColorMode(resourceManager.ColorMode.LIGHT).getColorByNameSync(COLOR_NAME);
      const third: number = overrideWithColorMode(resourceManager.ColorMode.LIGHT).getColorByNameSync(COLOR_NAME);
      const collected: number[] = [first, second, third];
      logCase('testResColorOverrideFreshManagers0025', `values=${collected.join(',')} ` +
        `distinct=${countDistinct(collected)}`);
      expect(countDistinct(collected)).assertEqual(1);
      expect(first).assertEqual(oracleHex(BASE_COLOR_HEX));
      expect(collected.length).assertEqual(3);
      expect(third).assertEqual(first);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_2600
     * @tc.name      testResColorOverrideDistance0026
     * @tc.desc      Measure the channel distance between the light and the dark branch and check it equals
     *               three saturated channels while the alpha byte contributes nothing
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorOverrideDistance0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const light: number = lightManager().getColorByNameSync(COLOR_NAME);
      const dark: number = darkManager().getColorByNameSync(COLOR_NAME);
      const rgbGap: number = Argb.rgbDistance(light, dark);
      logCase('testResColorOverrideDistance0026', `rgbGap=${rgbGap} fullGap=${Argb.fullDistance(light, dark)} ` +
        `oracleGap=${oracleRgbGap(light, dark)}`);
      expect(rgbGap).assertEqual(CHANNEL_MAX * 3);
      expect(Argb.fullDistance(light, dark)).assertEqual(rgbGap);
      expect(oracleRgbGap(light, dark)).assertEqual(rgbGap);
      expect(Argb.rgbDistance(dark, dark)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_2700
     * @tc.name      testResColorIdPositive0027
     * @tc.desc      Take the numeric id of the single color resource and check the id is a positive whole
     *               number the entry manager answers without an error
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResColorIdPositive0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const id: number = numericColorId();
      const code: number = syncColorError(() => {
        resources().getColorSync(id);
      });
      logCase('testResColorIdPositive0027', `id=${id} code=${code}`);
      expect(id > 0).assertTrue();
      expect(Math.floor(id)).assertEqual(id);
      expect(code).assertEqual(0);
      expect(colorOrMissing(resources(), id) === MISSING_COLOR).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_2800
     * @tc.name      testResColorIdNameAgreement0028
     * @tc.desc      Read the color once by id and once by name and check both routes land on the base json
     *               literal and on the same six digit text
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResColorIdNameAgreement0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byId: number = lightManager().getColorSync(numericColorId());
      const byName: number = lightManager().getColorByNameSync(COLOR_NAME);
      logCase('testResColorIdNameAgreement0028', `byId=${byId} byName=${byName}`);
      expect(byId).assertEqual(byName);
      expect(byId).assertEqual(oracleHex(BASE_COLOR_HEX));
      expect(Argb.toHex6(byId)).assertEqual(Argb.toHex6(byName));
      expect(Argb.fullDistance(byId, byName)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_2900
     * @tc.name      testResColorIdResourceOverload0029
     * @tc.desc      Read the color through the resource object overload and through the bare numeric id and
     *               check the two overloads agree
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorIdResourceOverload0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const resource: Resource = colorResource();
      const byResource: number = resources().getColorSync(resource);
      const byNumericId: number = resources().getColorSync(numericColorId());
      logCase('testResColorIdResourceOverload0029', `byResource=${byResource} byNumericId=${byNumericId} ` +
        `resourceId=${resource.id}`);
      expect(byResource).assertEqual(byNumericId);
      expect(byResource).assertEqual(resources().getColorByNameSync(COLOR_NAME));
      expect(resource.id > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_3000
     * @tc.name      testResColorIdPromiseAgreement0030
     * @tc.desc      Ask for the color by id through the promise api and check the resolved value matches the
     *               synchronous read and carries a saturated alpha
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorIdPromiseAgreement0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const id: number = numericColorId();
      const promised: number = await resources().getColor(id);
      const code: number = await promiseColorError(() => resources().getColor(id));
      logCase('testResColorIdPromiseAgreement0030', `promised=${promised} code=${code} ` +
        `nameRead=${resources().getColorByNameSync(COLOR_NAME)}`);
      expect(promised).assertEqual(resources().getColorByNameSync(COLOR_NAME));
      expect(code).assertEqual(0);
      expect(Argb.alpha(promised)).assertEqual(CHANNEL_MAX);
      expect(promised >= DARK_COLOR_VALUE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_3100
     * @tc.name      testResColorIdPromiseResource0031
     * @tc.desc      Ask for the color with the promise resource overload and check the result against the
     *               name based synchronous read and the base json literal
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorIdPromiseResource0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const promised: number = await resources().getColor(colorResource());
      const byName: number = resources().getColorByNameSync(COLOR_NAME);
      logCase('testResColorIdPromiseResource0031', `promised=${promised} byName=${byName}`);
      expect(promised).assertEqual(byName);
      expect(Argb.alphaPercent(promised)).assertEqual(PERCENT_SCALE);
      expect(Argb.toHex6(promised)).assertEqual(Argb.toHex6(byName));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_3200
     * @tc.name      testResColorNamePromiseAgreement0032
     * @tc.desc      Ask for the color by name through the promise api and check the promise neither rejects
     *               nor drifts away from the synchronous read
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorNamePromiseAgreement0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const promised: number = await resources().getColorByName(COLOR_NAME);
      const badCode: number = await promiseColorError(() => resources().getColorByName(COLOR_NAME.toUpperCase()));
      logCase('testResColorNamePromiseAgreement0032', `promised=${promised} badCode=${badCode}`);
      expect(promised).assertEqual(resources().getColorByNameSync(COLOR_NAME));
      expect(badCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(Argb.alphaPercent(promised)).assertEqual(PERCENT_SCALE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_3300
     * @tc.name      testResColorIdZeroRejected0033
     * @tc.desc      Ask for colors with the ids zero and one and check both calls are refused with the id
     *               error while the real id keeps working
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorIdZeroRejected0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const zeroCode: number = syncColorError(() => {
        resources().getColorSync(0);
      });
      const oneCode: number = syncColorError(() => {
        resources().getColorSync(1);
      });
      const goodCode: number = syncColorError(() => {
        resources().getColorSync(numericColorId());
      });
      logCase('testResColorIdZeroRejected0033', `zeroCode=${zeroCode} oneCode=${oneCode} goodCode=${goodCode}`);
      expect(zeroCode).assertEqual(ERR_RES_ID_INVALID);
      expect(oneCode).assertEqual(ERR_RES_ID_INVALID);
      expect(goodCode).assertEqual(0);
      expect(zeroCode).assertEqual(oneCode);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_3400
     * @tc.name      testResColorIdSweepRejected0034
     * @tc.desc      Sweep four ids that belong to no color resource and check every refusal carries the id
     *               error code without exception
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorIdSweepRejected0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const badIds: number[] = [2, 3, 0x7fffffff, 123456789];
      const codes: number[] = badIds.map((candidate: number) => syncColorError(() => {
        resources().getColorSync(candidate);
      }));
      logCase('testResColorIdSweepRejected0034', `ids=${badIds.join(',')} codes=${codes.join(',')}`);
      expect(codes.length).assertEqual(badIds.length);
      expect(codes.every((code: number) => code === ERR_RES_ID_INVALID)).assertTrue();
      expect(codes.filter((code: number) => code === 0).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_3500
     * @tc.name      testResColorIdDarkQualifier0035
     * @tc.desc      Read the numeric id through the dark override and the live configuration and check the
     *               qualifier still selects different literals
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorIdDarkQualifier0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const id: number = numericColorId();
      const dark: number = darkManager().getColorSync(id);
      const live: number = lightManager().getColorSync(id);
      logCase('testResColorIdDarkQualifier0035', `dark=${dark} live=${live} id=${id}`);
      expect(dark).assertEqual(oracleHex(DARK_COLOR_HEX));
      expect(dark).assertEqual(DARK_COLOR_VALUE);
      expect(live === dark).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_3600
     * @tc.name      testResColorIdDarkNameAgreement0036
     * @tc.desc      Read the color in dark mode once by id and once by name and check the byte layout is an
     *               opaque triple zero
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorIdDarkNameAgreement0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const byId: number = darkManager().getColorSync(numericColorId());
      const byName: number = darkManager().getColorByNameSync(COLOR_NAME);
      logCase('testResColorIdDarkNameAgreement0036', `byId=${byId} byName=${byName}`);
      expect(byId).assertEqual(byName);
      expect(Argb.toHex6(byId)).assertEqual(DARK_COLOR_HEX);
      expect(Argb.alpha(byId)).assertEqual(CHANNEL_MAX);
      expect(Argb.average(byId)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_3700
     * @tc.name      testResColorIdRepeatStable0037
     * @tc.desc      Read the color five times by id and check the five results collapse to one value whose
     *               total matches a single value multiplied by the round count
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorIdRepeatStable0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const id: number = numericColorId();
      const values: number[] = [];
      for (let round = 0; round < 5; round++) {
        values.push(resources().getColorSync(id));
      }
      let total: number = 0;
      for (const value of values) {
        total += value;
      }
      logCase('testResColorIdRepeatStable0037', `values=${values.join(',')} total=${total}`);
      expect(countDistinct(values)).assertEqual(1);
      expect(values.length).assertEqual(5);
      expect(total).assertEqual(values[0] * 5);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_3800
     * @tc.name      testResColorIdChannelOracle0038
     * @tc.desc      Decompose the id based read and check every channel against the division oracle and the
     *               alpha byte against the maximum
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorIdChannelOracle0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const value: number = resources().getColorSync(numericColorId());
      logCase('testResColorIdChannelOracle0038', `value=${value} red=${Argb.red(value)} ` +
        `green=${Argb.green(value)} blue=${Argb.blue(value)}`);
      expect(Argb.red(value)).assertEqual(oracleChannel(value, 16));
      expect(Argb.green(value)).assertEqual(oracleChannel(value, 8));
      expect(Argb.blue(value)).assertEqual(oracleChannel(value, 0));
      expect(oracleChannel(value, 24)).assertEqual(CHANNEL_MAX);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_3900
     * @tc.name      testResColorIdBothModesAlpha0039
     * @tc.desc      Read the color by id in both qualifier branches and check the alpha treatment is the
     *               same while the rgb payload is not
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorIdBothModesAlpha0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const id: number = numericColorId();
      const light: number = lightManager().getColorSync(id);
      const dark: number = darkManager().getColorSync(id);
      logCase('testResColorIdBothModesAlpha0039', `light=${light} dark=${dark}`);
      expect(Argb.alpha(light)).assertEqual(Argb.alpha(dark));
      expect(Argb.alphaPercent(light)).assertEqual(PERCENT_SCALE);
      expect(Argb.alphaPercent(dark)).assertEqual(PERCENT_SCALE);
      expect(Argb.dropAlpha(light) === Argb.dropAlpha(dark)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_4000
     * @tc.name      testResColorIdResourceIdentity0040
     * @tc.desc      Check the resource object built for the color keeps a stable positive id across two
     *               builds and that the id based read still returns the base literal
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorIdResourceIdentity0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const first: Resource = colorResource();
      const second: Resource = colorResource();
      logCase('testResColorIdResourceIdentity0040', `firstId=${first.id} secondId=${second.id} ` +
        `compiled=${compiledColorId()} numeric=${numericColorId()}`);
      expect(first.id).assertEqual(second.id);
      expect(first.id).assertEqual(compiledColorId());
      expect(resources().getColorSync(first)).assertEqual(resources().getColorByNameSync(COLOR_NAME));
      expect(numericColorId() > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_4100
     * @tc.name      testResColorIdFourWayAgreement0041
     * @tc.desc      Cross the id and name lookups with the light and the dark qualifier and check the four
     *               results form exactly two groups
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorIdFourWayAgreement0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const id: number = numericColorId();
      const lightById: number = lightManager().getColorSync(id);
      const lightByName: number = lightManager().getColorByNameSync(COLOR_NAME);
      const darkById: number = darkManager().getColorSync(id);
      const darkByName: number = darkManager().getColorByNameSync(COLOR_NAME);
      const all: number[] = [lightById, lightByName, darkById, darkByName];
      logCase('testResColorIdFourWayAgreement0041', `all=${all.join(',')} distinct=${countDistinct(all)}`);
      expect(lightById).assertEqual(lightByName);
      expect(darkById).assertEqual(darkByName);
      expect(lightById).assertEqual(oracleHex(BASE_COLOR_HEX));
      expect(darkById).assertEqual(oracleHex(DARK_COLOR_HEX));
      expect(countDistinct(all)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_4200
     * @tc.name      testResColorIdOrderIndependence0042
     * @tc.desc      Read name, then id, then name again and check the lookup order never changes the value
     *               that is handed back
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorIdOrderIndependence0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const first: number = resources().getColorByNameSync(COLOR_NAME);
      const middle: number = resources().getColorSync(numericColorId());
      const last: number = resources().getColorByNameSync(COLOR_NAME);
      logCase('testResColorIdOrderIndependence0042', `first=${first} middle=${middle} last=${last}`);
      expect(first).assertEqual(middle);
      expect(middle).assertEqual(last);
      expect(last - first).assertEqual(0);
      expect(Argb.channelSet(first).join(',')).assertEqual(Argb.channelSet(middle).join(','));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_4300
     * @tc.name      testResColorNameTruncated0043
     * @tc.desc      Ask for a truncated color name and for the real name with one extra character and check
     *               both are refused while the complete name still resolves
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorNameTruncated0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const truncated: string = COLOR_NAME.substring(0, COLOR_NAME.length - 1);
      const extended: string = COLOR_NAME + 'x';
      const truncatedCode: number = syncColorError(() => {
        resources().getColorByNameSync(truncated);
      });
      const extendedCode: number = syncColorError(() => {
        resources().getColorByNameSync(extended);
      });
      logCase('testResColorNameTruncated0043', `truncated=${truncated} extended=${extended} ` +
        `codes=${truncatedCode},${extendedCode}`);
      expect(truncatedCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(extendedCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(truncated.length).assertEqual(COLOR_NAME.length - 1);
      expect(syncColorError(() => {
        resources().getColorByNameSync(COLOR_NAME);
      })).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_4400
     * @tc.name      testResColorNameUppercase0044
     * @tc.desc      Ask for the fully upper cased name through the promise api and check the rejection code
     *               and the synchronous rejection agree
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorNameUppercase0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const upper: string = COLOR_NAME.toUpperCase();
      const syncCode: number = syncColorError(() => {
        resources().getColorByNameSync(upper);
      });
      const asyncCode: number = await promiseColorError(() => resources().getColorByName(upper));
      logCase('testResColorNameUppercase0044', `upper=${upper} syncCode=${syncCode} asyncCode=${asyncCode}`);
      expect(syncCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(asyncCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(upper.length).assertEqual(COLOR_NAME.length);
      expect(upper === COLOR_NAME).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_4500
     * @tc.name      testResColorNameCapitalized0045
     * @tc.desc      Ask for the name with only its first letter capitalised and check the case change alone
     *               is enough for the lookup to be refused
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorNameCapitalized0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const capitalized: string = COLOR_NAME.charAt(0).toUpperCase() + COLOR_NAME.substring(1);
      const code: number = syncColorError(() => {
        resources().getColorByNameSync(capitalized);
      });
      logCase('testResColorNameCapitalized0045', `capitalized=${capitalized} code=${code}`);
      expect(code).assertEqual(ERR_RES_NAME_INVALID);
      expect(capitalized.charAt(0) === COLOR_NAME.charAt(0)).assertFalse();
      expect(capitalized.substring(1)).assertEqual(COLOR_NAME.substring(1));
      expect(lightManager().getColorByNameSync(COLOR_NAME)).assertEqual(oracleHex(BASE_COLOR_HEX));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_4600
     * @tc.name      testResColorNameDashed0046
     * @tc.desc      Replace the underscores of the real name with dashes and check the dashed spelling is
     *               rejected although only one character per separator changed
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorNameDashed0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let dashed: string = '';
      for (let position = 0; position < COLOR_NAME.length; position++) {
        const unit: string = COLOR_NAME.charAt(position);
        dashed += unit === '_' ? '-' : unit;
      }
      const code: number = syncColorError(() => {
        resources().getColorByNameSync(dashed);
      });
      logCase('testResColorNameDashed0046', `dashed=${dashed} code=${code} segments=${dashed.split('-').length}`);
      expect(code).assertEqual(ERR_RES_NAME_INVALID);
      expect(dashed.length).assertEqual(COLOR_NAME.length);
      expect(dashed.split('-').length).assertEqual(3);
      expect(dashed.indexOf('_')).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_4700
     * @tc.name      testResColorNameFullKey0047
     * @tc.desc      Ask for the color with the full resource key used inside pages and check the api wants
     *               the bare name only
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorNameFullKey0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const code: number = syncColorError(() => {
        resources().getColorByNameSync(APP_COLOR_KEY);
      });
      logCase('testResColorNameFullKey0047', `key=${APP_COLOR_KEY} code=${code}`);
      expect(code).assertEqual(ERR_RES_NAME_INVALID);
      expect(APP_COLOR_KEY.startsWith('app.color.')).assertTrue();
      expect(APP_COLOR_KEY.endsWith(COLOR_NAME)).assertTrue();
      expect(APP_COLOR_KEY.length > COLOR_NAME.length).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_4800
     * @tc.name      testResColorNameDollarPrefix0048
     * @tc.desc      Ask for the color with the manifest style dollar reference and check the prefixed form
     *               reports the name error while the bare name keeps returning the base literal
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorNameDollarPrefix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const reference: string = '$color:' + COLOR_NAME;
      const referenceCode: number = syncColorError(() => {
        resources().getColorByNameSync(reference);
      });
      logCase('testResColorNameDollarPrefix0048', `reference=${reference} code=${referenceCode}`);
      expect(referenceCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(reference.indexOf('$')).assertEqual(0);
      expect(reference.substring(reference.length - COLOR_NAME.length)).assertEqual(COLOR_NAME);
      expect(lightManager().getColorByNameSync(COLOR_NAME)).assertEqual(oracleHex(BASE_COLOR_HEX));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_4900
     * @tc.name      testResColorNameWhitespace0049
     * @tc.desc      Surround the real name with spaces and check both padded spellings are refused, proving
     *               the lookup performs no trimming
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorNameWhitespace0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const trailing: string = COLOR_NAME + ' ';
      const leading: string = ' ' + COLOR_NAME;
      const trailingCode: number = syncColorError(() => {
        resources().getColorByNameSync(trailing);
      });
      const leadingCode: number = syncColorError(() => {
        resources().getColorByNameSync(leading);
      });
      logCase('testResColorNameWhitespace0049', `codes=${trailingCode},${leadingCode} ` +
        `trimmedLength=${trailing.trim().length}`);
      expect(trailingCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(leadingCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(trailing.trim()).assertEqual(COLOR_NAME);
      expect(trailing.length).assertEqual(COLOR_NAME.length + 1);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_5000
     * @tc.name      testResColorNameEmpty0050
     * @tc.desc      Ask for the color with an empty name and with a single blank and check both are refused
     *               without ever falling back to the only declared color
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorNameEmpty0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const empty: string = '';
      const blank: string = ' ';
      const emptyCode: number = syncColorError(() => {
        resources().getColorByNameSync(empty);
      });
      const blankCode: number = syncColorError(() => {
        resources().getColorByNameSync(blank);
      });
      logCase('testResColorNameEmpty0050', `emptyCode=${emptyCode} blankCode=${blankCode}`);
      expect(emptyCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(blankCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(empty.length).assertEqual(0);
      expect(blank.trim().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_5100
     * @tc.name      testResColorNameTypePrefix0051
     * @tc.desc      Prefix the real name with the color and with the string type name and check neither
     *               prefixed spelling is accepted by the color lookup
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorNameTypePrefix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const colorPrefixed: string = 'color.' + COLOR_NAME;
      const stringPrefixed: string = 'string.' + COLOR_NAME;
      const colorCode: number = syncColorError(() => {
        resources().getColorByNameSync(colorPrefixed);
      });
      const stringCode: number = syncColorError(() => {
        resources().getColorByNameSync(stringPrefixed);
      });
      logCase('testResColorNameTypePrefix0051', `colorCode=${colorCode} stringCode=${stringCode}`);
      expect(colorCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(stringCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(colorCode).assertEqual(stringCode);
      expect(colorPrefixed.length).assertEqual(stringPrefixed.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_5200
     * @tc.name      testResColorNameRecovery0052
     * @tc.desc      Interleave a failing and a succeeding name lookup through the promise api and check the
     *               failure never poisons the manager for the following read
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorNameRecovery0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const collapsed: string = COLOR_NAME.split('_').join('');
      const firstCode: number = await promiseColorError(() => resources().getColorByName(collapsed));
      const recovered: number = lightManager().getColorByNameSync(COLOR_NAME);
      const secondCode: number = await promiseColorError(() => resources().getColorByName(collapsed));
      logCase('testResColorNameRecovery0052', `collapsed=${collapsed} codes=${firstCode},${secondCode} ` +
        `recovered=${recovered}`);
      expect(firstCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(secondCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(recovered).assertEqual(oracleHex(BASE_COLOR_HEX));
      expect(recovered).assertEqual(lightManager().getColorByNameSync(COLOR_NAME));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_5300
     * @tc.name      testResColorNameFamilySweep0053
     * @tc.desc      Build eight misspellings of the color name and check the whole family is rejected with
     *               the same error code
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorNameFamilySweep0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const variants: string[] = [
        COLOR_NAME.toUpperCase(),
        COLOR_NAME.charAt(0).toUpperCase() + COLOR_NAME.substring(1),
        COLOR_NAME.split('_').join('-'),
        APP_COLOR_KEY,
        '$color:' + COLOR_NAME,
        COLOR_NAME + ' ',
        '',
        COLOR_NAME.split('_').join('__')
      ];
      const codes: number[] = variants.map((variant: string) => syncColorError(() => {
        resources().getColorByNameSync(variant);
      }));
      logCase('testResColorNameFamilySweep0053', `count=${variants.length} codes=${codes.join(',')}`);
      expect(codes.length).assertEqual(variants.length);
      expect(codes.every((code: number) => code === ERR_RES_NAME_INVALID)).assertTrue();
      expect(countDistinct(codes)).assertEqual(1);
      expect(codes.filter((code: number) => code === ERR_RES_NAME_INVALID).length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_5400
     * @tc.name      testResColorNameWrongType0054
     * @tc.desc      Read the color resource as a string and a known string resource as a color and check
     *               both type mismatches are refused
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorNameWrongType0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const colorAsString: number = syncColorError(() => {
        resources().getStringByNameSync(COLOR_NAME);
      });
      const stringAsColor: number = syncColorError(() => {
        resources().getColorByNameSync(STRING_RESOURCE_NAME);
      });
      const stringText: string = resources().getStringByNameSync(STRING_RESOURCE_NAME);
      logCase('testResColorNameWrongType0054', `colorAsString=${colorAsString} stringAsColor=${stringAsColor} ` +
        `stringTextLength=${stringText.length}`);
      expect(colorAsString).assertEqual(ERR_RES_NAME_INVALID);
      expect(stringAsColor).assertEqual(ERR_RES_NAME_INVALID);
      expect(stringText.length > 0).assertTrue();
      expect(resources().getColorByNameSync(COLOR_NAME) !== 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_5500
     * @tc.name      testResColorRepeatUnique0055
     * @tc.desc      Read the color eight times in a row and check the eight reads collapse to a single value
     *               whose total is eight times that value
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorRepeatUnique0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let round = 0; round < 8; round++) {
        values.push(lightManager().getColorByNameSync(COLOR_NAME));
      }
      let total: number = 0;
      for (const value of values) {
        total += value;
      }
      logCase('testResColorRepeatUnique0055', `count=${values.length} distinct=${countDistinct(values)} ` +
        `total=${total}`);
      expect(new Set<number>(values).size).assertEqual(1);
      expect(values.length).assertEqual(8);
      expect(total).assertEqual(oracleHex(BASE_COLOR_HEX) * 8);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_5600
     * @tc.name      testResColorRepeatAlternating0056
     * @tc.desc      Alternate between the light and the dark manager four times and check the eight reads
     *               form an exact light, dark, light, dark pattern
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorRepeatAlternating0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sequence: number[] = [];
      for (let round = 0; round < 4; round++) {
        sequence.push(lightManager().getColorByNameSync(COLOR_NAME));
        sequence.push(darkManager().getColorByNameSync(COLOR_NAME));
      }
      let lightMatches: number = 0;
      let darkMatches: number = 0;
      for (let position = 0; position < sequence.length; position++) {
        if (position % 2 === 0 && sequence[position] === BASE_COLOR_VALUE) {
          lightMatches++;
        }
        if (position % 2 === 1 && sequence[position] === DARK_COLOR_VALUE) {
          darkMatches++;
        }
      }
      logCase('testResColorRepeatAlternating0056', `sequence=${sequence.join(',')} lightMatches=${lightMatches} ` +
        `darkMatches=${darkMatches}`);
      expect(sequence.length).assertEqual(8);
      expect(lightMatches).assertEqual(4);
      expect(darkMatches).assertEqual(4);
      expect(countDistinct(sequence)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_5700
     * @tc.name      testResColorRepeatMinMax0057
     * @tc.desc      Read the color six times, take the minimum and the maximum and check the two extremes are
     *               equal to each other and to the base literal
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorRepeatMinMax0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let round = 0; round < 6; round++) {
        values.push(lightManager().getColorByNameSync(COLOR_NAME));
      }
      let lowest: number = values[0];
      let highest: number = values[0];
      for (const value of values) {
        lowest = value < lowest ? value : lowest;
        highest = value > highest ? value : highest;
      }
      logCase('testResColorRepeatMinMax0057', `lowest=${lowest} highest=${highest} count=${values.length}`);
      expect(highest - lowest).assertEqual(0);
      expect(highest).assertEqual(oracleHex(BASE_COLOR_HEX));
      expect(lowest).assertEqual(highest);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_5800
     * @tc.name      testResColorRepeatFirstLast0058
     * @tc.desc      Read the color seven times and check the first and the last read are identical and that
     *               every single position matched the reference read
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorRepeatFirstLast0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const reference: number = resources().getColorByNameSync(COLOR_NAME);
      let matches: number = 0;
      let last: number = reference;
      for (let round = 0; round < 7; round++) {
        last = resources().getColorByNameSync(COLOR_NAME);
        if (last === reference) {
          matches++;
        }
      }
      logCase('testResColorRepeatFirstLast0058', `reference=${reference} last=${last} matches=${matches}`);
      expect(last).assertEqual(reference);
      expect(matches).assertEqual(7);
      expect(Argb.fullDistance(last, reference)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_5900
     * @tc.name      testResColorRepeatNameIdMix0059
     * @tc.desc      Read the color by name and by id three times each and check the six collected values are
     *               one and the same base literal
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorRepeatNameIdMix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const id: number = numericColorId();
      const collected: number[] = [];
      for (let round = 0; round < 3; round++) {
        collected.push(lightManager().getColorByNameSync(COLOR_NAME));
        collected.push(lightManager().getColorSync(id));
      }
      let wrong: number = 0;
      for (const value of collected) {
        if (value !== oracleHex(BASE_COLOR_HEX)) {
          wrong++;
        }
      }
      logCase('testResColorRepeatNameIdMix0059', `count=${collected.length} wrong=${wrong} ` +
        `distinct=${countDistinct(collected)}`);
      expect(collected.length).assertEqual(6);
      expect(wrong).assertEqual(0);
      expect(countDistinct(collected)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_6000
     * @tc.name      testResColorRepeatDrift0060
     * @tc.desc      Track the difference between consecutive reads over five rounds and check the running
     *               value never drifts away from the first read
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorRepeatDrift0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const first: number = resources().getColorByNameSync(COLOR_NAME);
      const drift: number[] = [];
      let previous: number = first;
      for (let round = 0; round < 5; round++) {
        const current: number = resources().getColorByNameSync(COLOR_NAME);
        drift.push(current - previous);
        previous = current;
      }
      logCase('testResColorRepeatDrift0060', `drift=${drift.join(',')} previous=${previous}`);
      expect(drift.length).assertEqual(5);
      expect(countDistinct(drift)).assertEqual(1);
      expect(drift[0]).assertEqual(0);
      expect(previous - first).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_6100
     * @tc.name      testResColorRepeatXor0061
     * @tc.desc      Fold five repeated reads with an exclusive or and check the odd number of identical
     *               operands folds back to exactly one copy of the value
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResColorRepeatXor0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let folded: number = 0;
      const values: number[] = [];
      for (let round = 0; round < 5; round++) {
        const value: number = lightManager().getColorByNameSync(COLOR_NAME);
        values.push(value);
        folded = (folded ^ value) >>> 0;
      }
      logCase('testResColorRepeatXor0061', `folded=${folded} first=${values[0]} distinct=${countDistinct(values)}`);
      expect(folded).assertEqual(values[0]);
      expect(folded).assertEqual(BASE_COLOR_VALUE);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESCOLOR_6200
     * @tc.name      testResColorRepeatDarkFilter0062
     * @tc.desc      Read the dark qualified color five times and filter the reads that equal the opaque black
     *               literal, expecting every read to pass the filter
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResColorRepeatDarkFilter0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let round = 0; round < 5; round++) {
        values.push(darkManager().getColorByNameSync(COLOR_NAME));
      }
      const matching: number[] = values.filter((value: number) => value === oracleHex(DARK_COLOR_HEX));
      logCase('testResColorRepeatDarkFilter0062', `matching=${matching.length} distinct=${countDistinct(values)}`);
      expect(matching.length).assertEqual(5);
      expect(countDistinct(values)).assertEqual(1);
      expect(values[0]).assertEqual(DARK_COLOR_VALUE);
      expect(Argb.alpha(values[0])).assertEqual(CHANNEL_MAX);
    });
