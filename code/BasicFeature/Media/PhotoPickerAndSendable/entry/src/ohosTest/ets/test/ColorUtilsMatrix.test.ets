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
 * Registers the numeric matrix cases of every color helper of the shared
 * library. All methods under test are pure math without any platform
 * dependency, so no ability context is required.
 */
export default function colorUtilsMatrixTest() {
  describe('ColorUtilsMatrixTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_0100
     * @tc.name      testColorMatrix0001
     * @tc.desc      Verify hexToNumber parses a six digit color and the
     *               round trip through numberToHex restores the text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const parsed: number = ColorUtils.hexToNumber('#102030');
      expect(ColorUtils.numberToHex(parsed)).assertEqual('#FF102030');
      const second: number = ColorUtils.hexToNumber('#ABCDEF');
      expect(ColorUtils.numberToHex(second)).assertEqual('#FFABCDEF');
      const third: number = ColorUtils.hexToNumber('#0080FF');
      expect(ColorUtils.numberToHex(third)).assertEqual('#FF0080FF');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_0200
     * @tc.name      testColorMatrix0002
     * @tc.desc      Verify hexToNumber maps pure black and pure white to the
     *               signed ARGB representation used by ArkUI.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrix0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.hexToNumber('#000000')).assertEqual(-16777216);
      expect(ColorUtils.hexToNumber('#FFFFFF')).assertEqual(-1);
      expect(ColorUtils.numberToHex(-16777216)).assertEqual('#FF000000');
      expect(ColorUtils.numberToHex(-1)).assertEqual('#FFFFFFFF');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_0300
     * @tc.name      testColorMatrix0003
     * @tc.desc      Verify hexToNumber treats a missing hash prefix the same
     *               way as the prefixed form.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrix0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const bare: number = ColorUtils.hexToNumber('102030');
      const prefixed: number = ColorUtils.hexToNumber('#102030');
      expect(bare).assertEqual(prefixed);
      expect(ColorUtils.numberToHex(bare)).assertEqual('#FF102030');
      const second: number = ColorUtils.hexToNumber('ABCDEF');
      expect(ColorUtils.numberToHex(second)).assertEqual('#FFABCDEF');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_0400
     * @tc.name      testColorMatrix0004
     * @tc.desc      Verify hexToNumber parses an eight digit ARGB color and
     *               the round trip keeps every channel.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrix0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const half: number = ColorUtils.hexToNumber('#80123456');
      expect(ColorUtils.numberToHex(half)).assertEqual('#80123456');
      const transparent: number = ColorUtils.hexToNumber('#00FFFFFF');
      expect(ColorUtils.numberToHex(transparent)).assertEqual('#00FFFFFF');
      const opaque: number = ColorUtils.hexToNumber('#FF876543');
      expect(ColorUtils.numberToHex(opaque)).assertEqual('#FF876543');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_0500
     * @tc.name      testColorMatrix0005
     * @tc.desc      Verify hexToNumber of positive signed inputs stays inside
     *               the int32 range and matches the known decimal values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrix0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.hexToNumber('#7FFFFFFF')).assertEqual(2147483647);
      expect(ColorUtils.hexToNumber('#12345678')).assertEqual(305419896);
      expect(ColorUtils.hexToNumber('#00000001')).assertEqual(1);
      expect(ColorUtils.hexToNumber('#00000000')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_0600
     * @tc.name      testColorMatrix0006
     * @tc.desc      Verify hexToNumber accepts lower case digits and the
     *               round trip uppercases every hex letter.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrix0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const lower: number = ColorUtils.hexToNumber('#abcdef');
      expect(ColorUtils.numberToHex(lower)).assertEqual('#FFABCDEF');
      const mixed: number = ColorUtils.hexToNumber('#AbCdEf');
      expect(mixed).assertEqual(lower);
      const second: number = ColorUtils.hexToNumber('#00ff00');
      expect(ColorUtils.numberToHex(second)).assertEqual('#FF00FF00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_0700
     * @tc.name      testColorMatrix0007
     * @tc.desc      Verify hexToNumber degrades an empty text and a lone hash
     *               to the opaque black fallback color.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrix0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.hexToNumber('')).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.hexToNumber('#')).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.numberToHex(FALLBACK_COLOR)).assertEqual('#FF000000');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_0800
     * @tc.name      testColorMatrix0008
     * @tc.desc      Verify hexToNumber rejects bodies of unsupported length
     *               and returns the fallback color for each of them.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrix0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.hexToNumber('#12345')).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.hexToNumber('#1234567')).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.hexToNumber('#123456789')).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.hexToNumber('12345')).assertEqual(FALLBACK_COLOR);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_0900
     * @tc.name      testColorMatrix0009
     * @tc.desc      Verify hexToNumber rejects non hexadecimal characters
     *               and returns the fallback color.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrix0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.hexToNumber('#GGGGGG')).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.hexToNumber('xyz')).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.hexToNumber('#FF00GG')).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.hexToNumber('#AB CD')).assertEqual(FALLBACK_COLOR);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_1000
     * @tc.name      testColorMatrix0010
     * @tc.desc      Verify isValidHex accepts well formed six and eight digit
     *               bodies with and without the hash prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrix0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.isValidHex('#102030')).assertTrue();
      expect(ColorUtils.isValidHex('102030')).assertTrue();
      expect(ColorUtils.isValidHex('#80102030')).assertTrue();
      expect(ColorUtils.isValidHex('80102030')).assertTrue();
      expect(ColorUtils.isValidHex('#000000')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_1100
     * @tc.name      testColorMatrix0011
     * @tc.desc      Verify isValidHex rejects wrong lengths and characters
     *               outside the hexadecimal digit pool.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrix0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.isValidHex('#12345')).assertFalse();
      expect(ColorUtils.isValidHex('#1234567')).assertFalse();
      expect(ColorUtils.isValidHex('123456789')).assertFalse();
      expect(ColorUtils.isValidHex('#12G45G')).assertFalse();
      expect(ColorUtils.isValidHex('#FF00GG')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_1200
     * @tc.name      testColorMatrix0012
     * @tc.desc      Verify isValidHex handles mixed case digits and reports
     *               an empty text as invalid.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrix0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.isValidHex('#AbCdEf')).assertTrue();
      expect(ColorUtils.isValidHex('FFFFFF')).assertTrue();
      expect(ColorUtils.isValidHex('')).assertFalse();
      expect(ColorUtils.isValidHex('#')).assertFalse();
      expect(ColorUtils.isValidHex('#80AbCdEf')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_1300
     * @tc.name      testColorMatrix0013
     * @tc.desc      Verify numberToHex renders zero, minus one and the pure
     *               red signed value as eight digit upper case text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrix0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.numberToHex(0)).assertEqual('#00000000');
      expect(ColorUtils.numberToHex(-1)).assertEqual('#FFFFFFFF');
      expect(ColorUtils.numberToHex(-65536)).assertEqual('#FFFF0000');
      expect(ColorUtils.numberToHex(-16777216)).assertEqual('#FF000000');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_1400
     * @tc.name      testColorMatrix0014
     * @tc.desc      Verify numberToHex renders positive values including the
     *               int32 maximum with correctly padded channels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrix0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.numberToHex(16711935)).assertEqual('#00FF00FF');
      expect(ColorUtils.numberToHex(2147483647)).assertEqual('#7FFFFFFF');
      expect(ColorUtils.numberToHex(1234567890)).assertEqual('#499602D2');
      expect(ColorUtils.numberToHex(305419896)).assertEqual('#12345678');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_1500
     * @tc.name      testColorMatrix0015
     * @tc.desc      Verify numberToHex keeps negative inputs inside the low
     *               thirty two bits so the text always has eight digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrix0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const rendered: string = ColorUtils.numberToHex(-123456789);
      expect(rendered.charAt(0)).assertEqual('#');
      expect(rendered.length).assertEqual(9);
      const second: string = ColorUtils.numberToHex(-305419897);
      expect(second.length).assertEqual(9);
      expect(second.charAt(1)).assertEqual('E');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_1600
     * @tc.name      testColorMatrix0016
     * @tc.desc      Verify hexToNumber and numberToHex form a stable round
     *               trip pair in both directions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrix0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: number = ColorUtils.hexToNumber('#0080FF');
      const firstText: string = ColorUtils.numberToHex(first);
      expect(firstText).assertEqual('#FF0080FF');
      expect(ColorUtils.hexToNumber(firstText)).assertEqual(first);
      const second: number = ColorUtils.hexToNumber('#80123456');
      const secondText: string = ColorUtils.numberToHex(second);
      expect(secondText).assertEqual('#80123456');
      expect(ColorUtils.hexToNumber(secondText)).assertEqual(second);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_1700
     * @tc.name      testColorMatrix0017
     * @tc.desc      Verify withAlpha replaces the alpha channel with the
     *               requested byte and keeps the RGB channels untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrix0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = ColorUtils.hexToNumber('#102030');
      expect(ColorUtils.numberToHex(ColorUtils.withAlpha(base, 255))).assertEqual('#FF102030');
      expect(ColorUtils.numberToHex(ColorUtils.withAlpha(base, 0))).assertEqual('#00102030');
      expect(ColorUtils.numberToHex(ColorUtils.withAlpha(base, 128))).assertEqual('#80102030');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_1800
     * @tc.name      testColorMatrix0018
     * @tc.desc      Verify withAlpha clamps alpha values beyond the byte
     *               range instead of shifting them out of place.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrix0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = ColorUtils.hexToNumber('#102030');
      expect(ColorUtils.numberToHex(ColorUtils.withAlpha(base, 300))).assertEqual('#FF102030');
      expect(ColorUtils.numberToHex(ColorUtils.withAlpha(base, -10))).assertEqual('#00102030');
      expect(ColorUtils.numberToHex(ColorUtils.withAlpha(base, 1000))).assertEqual('#FF102030');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_1900
     * @tc.name      testColorMatrix0019
     * @tc.desc      Verify withAlpha rounds a fractional alpha to the nearest
     *               byte before shifting it into the color.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrix0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = ColorUtils.hexToNumber('#102030');
      expect(ColorUtils.numberToHex(ColorUtils.withAlpha(base, 127.6))).assertEqual('#80102030');
      expect(ColorUtils.numberToHex(ColorUtils.withAlpha(base, 200.4))).assertEqual('#C8102030');
      expect(ColorUtils.numberToHex(ColorUtils.withAlpha(base, 1.2))).assertEqual('#01102030');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_2000
     * @tc.name      testColorMatrix0020
     * @tc.desc      Verify withAlpha never modifies the RGB channels and
     *               builds opaque black from the zero color.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrix0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const tinted: number = ColorUtils.withAlpha(ColorUtils.hexToNumber('#102030'), 5);
      expect(ColorUtils.numberToHex(tinted)).assertEqual('#05102030');
      expect(ColorUtils.toRgbString(tinted)).assertEqual('rgb(16, 32, 48)');
      expect(ColorUtils.withAlpha(0, 255)).assertEqual(-16777216);
      expect(ColorUtils.withAlpha(0, 0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_2100
     * @tc.name      testColorMatrix0021
     * @tc.desc      Verify blend returns the pure base color at weight zero
     *               and the pure overlay color at weight one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrix0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = ColorUtils.hexToNumber('#102030');
      const overlay: number = ColorUtils.hexToNumber('#F0E0D0');
      expect(ColorUtils.blend(base, overlay, 0)).assertEqual(base);
      expect(ColorUtils.blend(base, overlay, 1)).assertEqual(overlay);
      expect(ColorUtils.numberToHex(ColorUtils.blend(base, overlay, 0))).assertEqual('#FF102030');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_2200
     * @tc.name      testColorMatrix0022
     * @tc.desc      Verify blend clamps an out of range weight so negative
     *               weights behave like zero and weights above one like one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrix0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = ColorUtils.hexToNumber('#102030');
      const overlay: number = ColorUtils.hexToNumber('#F0E0D0');
      expect(ColorUtils.blend(base, overlay, -1)).assertEqual(base);
      expect(ColorUtils.blend(base, overlay, 2)).assertEqual(overlay);
      expect(ColorUtils.blend(base, overlay, 100)).assertEqual(overlay);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_2300
     * @tc.name      testColorMatrix0023
     * @tc.desc      Verify blend at the midpoint mixes every RGB channel to
     *               the arithmetic mean of both colors.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrix0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const mixed: number = ColorUtils.blend(ColorUtils.hexToNumber('#102030'),
        ColorUtils.hexToNumber('#F0E0D0'), 0.5);
      expect(ColorUtils.numberToHex(mixed)).assertEqual('#FF808080');
      expect(ColorUtils.toRgbString(mixed)).assertEqual('rgb(128, 128, 128)');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_2400
     * @tc.name      testColorMatrix0024
     * @tc.desc      Verify blend rounds a half step channel up so the mixed
     *               channel of sixteen and seventeen becomes seventeen.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrix0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const mixed: number = ColorUtils.blend(ColorUtils.hexToNumber('#101010'),
        ColorUtils.hexToNumber('#111111'), 0.5);
      expect(ColorUtils.numberToHex(mixed)).assertEqual('#FF111111');
      const channel: string = ColorUtils.toRgbString(mixed);
      expect(channel).assertEqual('rgb(17, 17, 17)');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_2500
     * @tc.name      testColorMatrix0025
     * @tc.desc      Verify blend with a quarter weight rounds the halfway
     *               channel value up the same way as the midpoint.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrix0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const mixed: number = ColorUtils.blend(ColorUtils.hexToNumber('#101010'),
        ColorUtils.hexToNumber('#121212'), 0.25);
      expect(ColorUtils.numberToHex(mixed)).assertEqual('#FF111111');
      const second: number = ColorUtils.blend(ColorUtils.hexToNumber('#101010'),
        ColorUtils.hexToNumber('#131313'), 0.75);
      expect(ColorUtils.numberToHex(second)).assertEqual('#FF121212');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_2600
     * @tc.name      testColorMatrix0026
     * @tc.desc      Verify blend interpolates the alpha channel as well so a
     *               transparent overlay gains half of its opacity.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrix0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = ColorUtils.hexToNumber('#00FFFFFF');
      const overlay: number = ColorUtils.hexToNumber('#FFFFFFFF');
      const mixed: number = ColorUtils.blend(base, overlay, 0.5);
      expect(ColorUtils.numberToHex(mixed)).assertEqual('#80FFFFFF');
      const second: number = ColorUtils.blend(ColorUtils.hexToNumber('#80FFFFFF'),
        ColorUtils.hexToNumber('#FFFFFFFF'), 0.5);
      expect(ColorUtils.numberToHex(second)).assertEqual('#C0FFFFFF');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_2700
     * @tc.name      testColorMatrix0027
     * @tc.desc      Verify blending a color with itself keeps the color
     *               stable for any weight inside the valid range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testColorMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testColorMatrix0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const same: number = ColorUtils.hexToNumber('#505050');
      const mixed: number = ColorUtils.blend(same, same, 0.37);
      expect(mixed).assertEqual(same);
      expect(ColorUtils.numberToHex(mixed)).assertEqual('#FF505050');
      const second: number = ColorUtils.blend(same, same, 0.99);
      expect(second).assertEqual(same);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_2800
     * @tc.name      testColorMatrix0028
     * @tc.desc      Verify invert maps pure white to opaque black and pure
     *               black to opaque white.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrix0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.invert(ColorUtils.hexToNumber('#FFFFFF'))).assertEqual(-16777216);
      expect(ColorUtils.invert(ColorUtils.hexToNumber('#000000'))).assertEqual(-1);
      expect(ColorUtils.numberToHex(ColorUtils.invert(ColorUtils.hexToNumber('#FFFFFF'))))
        .assertEqual('#FF000000');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_2900
     * @tc.name      testColorMatrix0029
     * @tc.desc      Verify invert subtracts every RGB channel from the byte
     *               maximum while keeping the original alpha.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrix0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const flipped: number = ColorUtils.invert(ColorUtils.hexToNumber('#123456'));
      expect(ColorUtils.numberToHex(flipped)).assertEqual('#FFEDCBA9');
      const second: number = ColorUtils.invert(ColorUtils.hexToNumber('#FF0000'));
      expect(ColorUtils.numberToHex(second)).assertEqual('#FF00FFFF');
      const third: number = ColorUtils.invert(ColorUtils.hexToNumber('#00FF00'));
      expect(ColorUtils.numberToHex(third)).assertEqual('#FFFF00FF');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_3000
     * @tc.name      testColorMatrix0030
     * @tc.desc      Verify a double inversion restores the original color
     *               and a single inversion preserves the alpha channel.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrix0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = ColorUtils.hexToNumber('#102030');
      expect(ColorUtils.invert(ColorUtils.invert(base))).assertEqual(base);
      const translucent: number = ColorUtils.invert(ColorUtils.hexToNumber('#80FFFFFF'));
      expect(ColorUtils.numberToHex(translucent)).assertEqual('#80000000');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_3100
     * @tc.name      testColorMatrix0031
     * @tc.desc      Verify toRgbString renders the decimal channels with the
     *               CSS like spacing for regular colors.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrix0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.toRgbString(ColorUtils.hexToNumber('#102030'))).assertEqual('rgb(16, 32, 48)');
      expect(ColorUtils.toRgbString(ColorUtils.hexToNumber('#FF8000'))).assertEqual('rgb(255, 128, 0)');
      expect(ColorUtils.toRgbString(ColorUtils.hexToNumber('#010203'))).assertEqual('rgb(1, 2, 3)');
      expect(ColorUtils.toRgbString(ColorUtils.hexToNumber('#ABCDEF'))).assertEqual('rgb(171, 205, 239)');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_3200
     * @tc.name      testColorMatrix0032
     * @tc.desc      Verify toRgbString ignores the alpha channel and renders
     *               the extreme byte values for zero and minus one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrix0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ColorUtils.toRgbString(-1)).assertEqual('rgb(255, 255, 255)');
      expect(ColorUtils.toRgbString(0)).assertEqual('rgb(0, 0, 0)');
      expect(ColorUtils.toRgbString(ColorUtils.hexToNumber('#00FF8000'))).assertEqual('rgb(255, 128, 0)');
      expect(ColorUtils.toRgbString(ColorUtils.hexToNumber('#40102030'))).assertEqual('rgb(16, 32, 48)');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLMAT_3300
     * @tc.name      testColorMatrix0033
     * @tc.desc      Verify the composed pipeline of hexToNumber, withAlpha,
     *               numberToHex and toRgbString stays consistent.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrix0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = ColorUtils.hexToNumber('#802040');
      const toned: number = ColorUtils.withAlpha(base, 200);
      expect(ColorUtils.numberToHex(toned)).assertEqual('#C8802040');
      expect(ColorUtils.toRgbString(toned)).assertEqual('rgb(128, 32, 64)');
      const flipped: number = ColorUtils.invert(toned);
      expect(ColorUtils.numberToHex(flipped)).assertEqual('#C87FDFBF');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
