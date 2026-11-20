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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ColorUtils } from 'photopickersendable';
import { hilog } from '@kit.PerformanceAnalysisKit';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;
/** Fallback ARGB integer returned for invalid input, equals 0xFF000000 as a signed value. */
const FALLBACK_COLOR: number = -16777216;

/**
 * Registers edge and extreme input cases of every color helper of the
 * shared library. All methods under test are pure math without any
 * platform dependency, so no ability context is required.
 */
export default function colorUtilsEdgeTest() {
  describe('ColorUtilsEdgeTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_0100
     * @tc.name      testColorEdge0001
     * @tc.desc      Verify isValidHex rejects bodies whose length is not six
     *               or eight hexadecimal digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.isValidHex('#12345')).assertFalse();
      expect(ColorUtils.isValidHex('#1234567')).assertFalse();
      expect(ColorUtils.isValidHex('123456789')).assertFalse();
      expect(ColorUtils.isValidHex('#12345678')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_0200
     * @tc.name      testColorEdge0002
     * @tc.desc      Verify isValidHex rejects characters outside the
     *               hexadecimal digit pool even when the length fits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.isValidHex('#GGGGGG')).assertFalse();
      expect(ColorUtils.isValidHex('zzzzzz')).assertFalse();
      expect(ColorUtils.isValidHex('12345g')).assertFalse();
      expect(ColorUtils.isValidHex('#1234H6')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_0300
     * @tc.name      testColorEdge0003
     * @tc.desc      Verify isValidHex rejects the short three digit and the
     *               long twelve digit shorthand forms.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.isValidHex('#FFF')).assertFalse();
      expect(ColorUtils.isValidHex('FFF')).assertFalse();
      expect(ColorUtils.isValidHex('#FFFFFFFFFFFF')).assertFalse();
      expect(ColorUtils.isValidHex('FFFFFFFFFFFF')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_0400
     * @tc.name      testColorEdge0004
     * @tc.desc      Verify isValidHex reports false for the empty text and
     *               for a lone hash prefix without a body.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorEdge0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.isValidHex('')).assertFalse();
      expect(ColorUtils.isValidHex('#')).assertFalse();
      expect(ColorUtils.isValidHex('##')).assertFalse();
      expect(ColorUtils.isValidHex('#1')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_0500
     * @tc.name      testColorEdge0005
     * @tc.desc      Verify hexToNumber maps every malformed text to the
     *               opaque black fallback color.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorEdge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorEdge0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.hexToNumber('')).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.hexToNumber('#')).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.hexToNumber('#12345')).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.hexToNumber('#GGGGGG')).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.hexToNumber('abcdefg')).assertEqual(FALLBACK_COLOR);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_0600
     * @tc.name      testColorEdge0006
     * @tc.desc      Verify hexToNumber parses a fully transparent black
     *               eight digit color into the integer zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorEdge0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorEdge0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.hexToNumber('#00000000')).assertEqual(0);
      expect(ColorUtils.numberToHex(ColorUtils.hexToNumber('#00000000'))).assertEqual('#00000000');
      expect(ColorUtils.isValidHex('#00000000')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_0700
     * @tc.name      testColorEdge0007
     * @tc.desc      Verify hexToNumber upper case input round trips through
     *               numberToHex with the alpha byte restored.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorEdge0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorEdge0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const parsed: number = ColorUtils.hexToNumber('#ABCDEF');
      expect(ColorUtils.numberToHex(parsed)).assertEqual('#FFABCDEF');
      const eight: number = ColorUtils.hexToNumber('#40ABCDEF');
      expect(ColorUtils.numberToHex(eight)).assertEqual('#40ABCDEF');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_0800
     * @tc.name      testColorEdge0008
     * @tc.desc      Verify numberToHex renders NaN as all zero channels
     *               because bit operations coerce NaN to zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testColorEdge0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testColorEdge0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.numberToHex(Number.NaN)).assertEqual('#00000000');
      const shifted: number = Number.NaN >> 24;
      expect(shifted).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_0900
     * @tc.name      testColorEdge0009
     * @tc.desc      Verify numberToHex truncates a safe integer beyond the
     *               thirty two bit range to its low word all ones.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testColorEdge0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testColorEdge0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.numberToHex(Number.MAX_SAFE_INTEGER)).assertEqual('#FFFFFFFF');
      const truncated: number = Number.MAX_SAFE_INTEGER | 0;
      expect(truncated).assertEqual(-1);
      expect(ColorUtils.toRgbString(Number.MAX_SAFE_INTEGER)).assertEqual('rgb(255, 255, 255)');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_1000
     * @tc.name      testColorEdge0010
     * @tc.desc      Verify withAlpha of a NaN alpha collapses to a fully
     *               transparent color because the shifted NaN becomes zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testColorEdge0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testColorEdge0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = ColorUtils.hexToNumber('#AABBCC');
      const blended: number = ColorUtils.withAlpha(base, Number.NaN);
      expect(ColorUtils.numberToHex(blended)).assertEqual('#00AABBCC');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_1100
     * @tc.name      testColorEdge0011
     * @tc.desc      Verify withAlpha clamps a rounding overflow above the
     *               byte maximum and a negative fraction to the bounds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testColorEdge0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testColorEdge0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = ColorUtils.hexToNumber('#102030');
      const upper: number = ColorUtils.withAlpha(base, 255.5);
      expect(ColorUtils.numberToHex(upper)).assertEqual('#FF102030');
      const lower: number = ColorUtils.withAlpha(base, -0.5);
      expect(ColorUtils.numberToHex(lower)).assertEqual('#00102030');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_1200
     * @tc.name      testColorEdge0012
     * @tc.desc      Verify blend with a NaN weight collapses every channel
     *               to zero and renders as fully transparent black.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testColorEdge0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testColorEdge0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = ColorUtils.hexToNumber('#102030');
      const overlay: number = ColorUtils.hexToNumber('#F0E0D0');
      const blended: number = ColorUtils.blend(base, overlay, Number.NaN);
      expect(ColorUtils.numberToHex(blended)).assertEqual('#00000000');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_1300
     * @tc.name      testColorEdge0013
     * @tc.desc      Verify the black and white blend midpoint rounds the
     *               half channel value up to the gray byte.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorEdge0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorEdge0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const gray: number = ColorUtils.blend(ColorUtils.hexToNumber('#000000'),
        ColorUtils.hexToNumber('#FFFFFF'), 0.5);
      expect(ColorUtils.numberToHex(gray)).assertEqual('#FF808080');
      expect(ColorUtils.toRgbString(gray)).assertEqual('rgb(128, 128, 128)');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_1400
     * @tc.name      testColorEdge0014
     * @tc.desc      Verify a three quarter weight blend rounds the channel
     *               product down to the nearest byte.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorEdge0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorEdge0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const mixed: number = ColorUtils.blend(ColorUtils.hexToNumber('#101010'),
        ColorUtils.hexToNumber('#131313'), 0.75);
      expect(ColorUtils.numberToHex(mixed)).assertEqual('#FF121212');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_1500
     * @tc.name      testColorEdge0015
     * @tc.desc      Verify the half weight blend of a half transparent and
     *               an opaque overlay rounds the alpha up to C0.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testColorEdge0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testColorEdge0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = ColorUtils.hexToNumber('#80FFFFFF');
      const overlay: number = ColorUtils.hexToNumber('#FFFFFFFF');
      const blended: number = ColorUtils.blend(base, overlay, 0.5);
      expect(ColorUtils.numberToHex(blended)).assertEqual('#C0FFFFFF');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_1600
     * @tc.name      testColorEdge0016
     * @tc.desc      Verify invert keeps the alpha of the two raw boundary
     *               integers zero and minus one intact.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorEdge0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorEdge0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.invert(-1)).assertEqual(-16777216);
      expect(ColorUtils.invert(0)).assertEqual(16777215);
      expect(ColorUtils.numberToHex(ColorUtils.invert(-1))).assertEqual('#FF000000');
      expect(ColorUtils.numberToHex(ColorUtils.invert(0))).assertEqual('#00FFFFFF');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_1700
     * @tc.name      testColorEdge0017
     * @tc.desc      Verify invert flips the extreme channel bytes of a
     *               magenta and a green input color.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorEdge0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorEdge0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const magenta: number = ColorUtils.invert(ColorUtils.hexToNumber('#FF00FF'));
      expect(ColorUtils.numberToHex(magenta)).assertEqual('#FF00FF00');
      const green: number = ColorUtils.invert(ColorUtils.hexToNumber('#00FF00'));
      expect(ColorUtils.numberToHex(green)).assertEqual('#FFFF00FF');
      const blue: number = ColorUtils.invert(ColorUtils.hexToNumber('#0000FF'));
      expect(ColorUtils.numberToHex(blue)).assertEqual('#FFFFFF00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_1800
     * @tc.name      testColorEdge0018
     * @tc.desc      Verify toRgbString renders single channel extremes with
     *               zero filled neighbour channels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorEdge0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorEdge0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.toRgbString(ColorUtils.hexToNumber('#FF0000'))).assertEqual('rgb(255, 0, 0)');
      expect(ColorUtils.toRgbString(ColorUtils.hexToNumber('#000001'))).assertEqual('rgb(0, 0, 1)');
      expect(ColorUtils.toRgbString(ColorUtils.hexToNumber('#001000'))).assertEqual('rgb(0, 16, 0)');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_1900
     * @tc.name      testColorEdge0019
     * @tc.desc      Verify hexToNumber and numberToHex round trip several
     *               alpha levels without losing a byte.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorEdge0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorEdge0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const faint: number = ColorUtils.hexToNumber('#10FFFFFF');
      expect(ColorUtils.numberToHex(faint)).assertEqual('#10FFFFFF');
      const half: number = ColorUtils.hexToNumber('#80FFFFFF');
      expect(ColorUtils.numberToHex(half)).assertEqual('#80FFFFFF');
      const near: number = ColorUtils.hexToNumber('#C0FFFFFF');
      expect(ColorUtils.numberToHex(near)).assertEqual('#C0FFFFFF');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_2000
     * @tc.name      testColorEdge0020
     * @tc.desc      Verify the withAlpha output parses back to the same
     *               integer through numberToHex and hexToNumber.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorEdge0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorEdge0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = ColorUtils.hexToNumber('#102030');
      const toned: number = ColorUtils.withAlpha(base, 128);
      expect(ColorUtils.numberToHex(toned)).assertEqual('#80102030');
      expect(ColorUtils.hexToNumber('#80102030')).assertEqual(toned);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_2100
     * @tc.name      testColorEdge0021
     * @tc.desc      Verify the six digit and the explicit eight digit form
     *               of one color parse to the same integer.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorEdge0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorEdge0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const shortForm: number = ColorUtils.hexToNumber('#102030');
      const longForm: number = ColorUtils.hexToNumber('#FF102030');
      expect(shortForm).assertEqual(longForm);
      const other: number = ColorUtils.hexToNumber('F0E0D0');
      expect(other).assertEqual(ColorUtils.hexToNumber('#F0E0D0'));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_2200
     * @tc.name      testColorEdge0022
     * @tc.desc      Verify isValidHex rejects whitespace and control
     *               characters inside an otherwise well formed body.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testColorEdge0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testColorEdge0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.isValidHex('# 12345')).assertFalse();
      expect(ColorUtils.isValidHex('  102030')).assertFalse();
      expect(ColorUtils.isValidHex('#10203\n')).assertFalse();
      expect(ColorUtils.isValidHex('#10203\t')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_2300
     * @tc.name      testColorEdge0023
     * @tc.desc      Verify hexToNumber maps a blank text to the fallback
     *               color because the body length is not six or eight.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorEdge0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorEdge0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.hexToNumber('   ')).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.hexToNumber(' ')).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.hexToNumber('#     ')).assertEqual(FALLBACK_COLOR);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_2400
     * @tc.name      testColorEdge0024
     * @tc.desc      Verify toRgbString of a blended midpoint prints the
     *               averaged decimal channels of both inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorEdge0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorEdge0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const blended: number = ColorUtils.blend(ColorUtils.hexToNumber('#102030'),
        ColorUtils.hexToNumber('#F0E0D0'), 0.5);
      expect(ColorUtils.toRgbString(blended)).assertEqual('rgb(128, 128, 128)');
      const warm: number = ColorUtils.blend(ColorUtils.hexToNumber('#000000'),
        ColorUtils.hexToNumber('#FF0000'), 0.5);
      expect(ColorUtils.toRgbString(warm)).assertEqual('rgb(128, 0, 0)');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_2500
     * @tc.name      testColorEdge0025
     * @tc.desc      Verify hexToNumber is case insensitive and lower case
     *               input equals the upper case result.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorEdge0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorEdge0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.hexToNumber('#abcdef')).assertEqual(ColorUtils.hexToNumber('#ABCDEF'));
      expect(ColorUtils.hexToNumber('#AbCdEf')).assertEqual(ColorUtils.hexToNumber('#ABCDEF'));
      expect(ColorUtils.numberToHex(ColorUtils.hexToNumber('#abcdef'))).assertEqual('#FFABCDEF');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_2600
     * @tc.name      testColorEdge0026
     * @tc.desc      Verify withAlpha honours the byte neighbours one and two
     *               hundred fifty four without clamping.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorEdge0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorEdge0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = ColorUtils.hexToNumber('#102030');
      const almostClear: number = ColorUtils.withAlpha(base, 1);
      expect(ColorUtils.numberToHex(almostClear)).assertEqual('#01102030');
      const almostOpaque: number = ColorUtils.withAlpha(base, 254);
      expect(ColorUtils.numberToHex(almostOpaque)).assertEqual('#FE102030');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_2700
     * @tc.name      testColorEdge0027
     * @tc.desc      Verify asymmetric blend weights round the channel sum
     *               down at one tenth and up at nine tenths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorEdge0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorEdge0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = ColorUtils.hexToNumber('#101010');
      const overlay: number = ColorUtils.hexToNumber('#121212');
      const light: number = ColorUtils.blend(base, overlay, 0.1);
      expect(ColorUtils.numberToHex(light)).assertEqual('#FF101010');
      const heavy: number = ColorUtils.blend(base, overlay, 0.9);
      expect(ColorUtils.numberToHex(heavy)).assertEqual('#FF121212');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_2800
     * @tc.name      testColorEdge0028
     * @tc.desc      Verify the composed pipeline of invert, withAlpha and
     *               numberToHex keeps every channel consistent.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorEdge0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorEdge0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = ColorUtils.hexToNumber('#102030');
      const flipped: number = ColorUtils.invert(base);
      expect(ColorUtils.numberToHex(flipped)).assertEqual('#FFEFDFCF');
      const translucent: number = ColorUtils.withAlpha(flipped, 128);
      expect(ColorUtils.numberToHex(translucent)).assertEqual('#80EFDFCF');
      expect(ColorUtils.toRgbString(translucent)).assertEqual('rgb(239, 223, 207)');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_2900
     * @tc.name      testColorEdge0029
     * @tc.desc      Verify numberToHex renders the smallest signed integer
     *               as an eight digit text and the round trip is stable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testColorEdge0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testColorEdge0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const smallest: number = -2147483648;
      expect(ColorUtils.numberToHex(smallest)).assertEqual('#80000000');
      expect(ColorUtils.hexToNumber('#80000000')).assertEqual(smallest);
      expect(ColorUtils.numberToHex(-1)).assertEqual('#FFFFFFFF');
      expect(ColorUtils.hexToNumber('#FFFFFFFF')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLEDGE_3000
     * @tc.name      testColorEdge0030
     * @tc.desc      Verify a chained blend of the black to white midpoint
     *               towards white rounds the half step up to 192.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testColorEdge0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testColorEdge0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const black: number = ColorUtils.hexToNumber('#000000');
      const white: number = ColorUtils.hexToNumber('#FFFFFF');
      const mid: number = ColorUtils.blend(black, white, 0.5);
      expect(ColorUtils.numberToHex(mid)).assertEqual('#FF808080');
      const brighter: number = ColorUtils.blend(mid, white, 0.5);
      expect(ColorUtils.numberToHex(brighter)).assertEqual('#FFC0C0C0');
      expect(ColorUtils.toRgbString(brighter)).assertEqual('rgb(192, 192, 192)');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
