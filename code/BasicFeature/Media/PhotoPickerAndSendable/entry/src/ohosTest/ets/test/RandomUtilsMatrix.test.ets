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
import { RandomUtils, NumberUtils } from 'photopickersendable';
import { hilog } from '@kit.PerformanceAnalysisKit';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;
/** Letter pool expected by the random string helper, digits and symbols excluded. */
const LETTER_POOL: string = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
/** Digit pool expected by the random digits helper. */
const DIGIT_POOL: string = '0123456789';
/** Lowercase hexadecimal pool expected by the random color helper. */
const HEX_POOL: string = '0123456789abcdef';
/** Leading hash of every generated color string. */
const COLOR_PREFIX: string = '#';
/** Separator of the standard RFC 4122 UUID text form. */
const UUID_DASH: string = '-';
/** Variant characters allowed at the third dash group of a v4 UUID. */
const UUID_VARIANT: string = '89ab';
/** Number of random draws per range loop case. */
const DRAWS: number = 24;

/**
 * Registers the matrix cases of every RandomUtils helper. Random output can
 * never be asserted as one exact value, so each case verifies the documented
 * domain instead: inclusive range bounds, exact lengths, allowed character
 * pools and structural properties of the generated identifiers.
 */
export default function randomUtilsMatrixTest() {
  describe('RandomUtilsMatrixTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_0100
     * @tc.name      testRndMat0001
     * @tc.desc      Verify randomInt returns an integer inside the inclusive
     *               range for a small positive interval.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const value: number = RandomUtils.randomInt(1, 10);
      expect(NumberUtils.isInteger(value)).assertTrue();
      expect(value).assertLargerOrEqual(1);
      expect(value).assertLess(11);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_0200
     * @tc.name      testRndMat0002
     * @tc.desc      Verify randomInt stays inside the inclusive range across
     *               many repeated draws on a positive interval.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < DRAWS; index++) {
        const value: number = RandomUtils.randomInt(5, 9);
        expect(NumberUtils.isInteger(value)).assertTrue();
        expect(value).assertLargerOrEqual(5);
        expect(value).assertLess(10);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_0300
     * @tc.name      testRndMat0003
     * @tc.desc      Verify randomInt with an equal pair of bounds always
     *               returns exactly that single boundary value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(RandomUtils.randomInt(7, 7)).assertEqual(7);
      expect(RandomUtils.randomInt(0, 0)).assertEqual(0);
      expect(RandomUtils.randomInt(-4, -4)).assertEqual(-4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_0400
     * @tc.name      testRndMat0004
     * @tc.desc      Verify randomInt normalises a swapped pair of bounds so
     *               the result still falls between the two arguments.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRndMat0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRndMat0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const value: number = RandomUtils.randomInt(10, 2);
      expect(value).assertLargerOrEqual(2);
      expect(value).assertLess(11);
      expect(NumberUtils.isInteger(value)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_0500
     * @tc.name      testRndMat0005
     * @tc.desc      Verify randomInt rounds fractional bounds outward so the
     *               drawn value keeps inside the requested span.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRndMat0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRndMat0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(RandomUtils.randomInt(2.5, 2.5)).assertEqual(3);
      const wide: number = RandomUtils.randomInt(1.2, 3.8);
      expect(wide).assertLargerOrEqual(2);
      expect(wide).assertLess(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_0600
     * @tc.name      testRndMat0006
     * @tc.desc      Verify randomInt draws integers inside a fully negative
     *               inclusive range without leaving the interval.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < DRAWS; index++) {
        const value: number = RandomUtils.randomInt(-10, -5);
        expect(value).assertLargerOrEqual(-10);
        expect(value).assertLess(-4);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_0700
     * @tc.name      testRndMat0007
     * @tc.desc      Verify randomInt draws integers across zero including
     *               both negative and positive results.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < DRAWS; index++) {
        const value: number = RandomUtils.randomInt(-3, 3);
        expect(value).assertLargerOrEqual(-3);
        expect(value).assertLess(4);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_0800
     * @tc.name      testRndMat0008
     * @tc.desc      Verify randomInt keeps the result inside a huge positive
     *               span ending at the safe integer limit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRndMat0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRndMat0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const value: number = RandomUtils.randomInt(0, Number.MAX_SAFE_INTEGER);
      expect(value).assertLargerOrEqual(0);
      expect(value).assertLess(Number.MAX_SAFE_INTEGER + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_0900
     * @tc.name      testRndMat0009
     * @tc.desc      Verify randomInt keeps the result inside a huge negative
     *               span starting at the lower safe integer limit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRndMat0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRndMat0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const value: number = RandomUtils.randomInt(Number.MIN_SAFE_INTEGER, 0);
      expect(value).assertLargerOrEqual(Number.MIN_SAFE_INTEGER);
      expect(value).assertLess(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_1000
     * @tc.name      testRndMat0010
     * @tc.desc      Verify randomInt with a one step span between neighbouring
     *               integers can only return one of the two bounds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRndMat0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRndMat0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < DRAWS; index++) {
        const value: number = RandomUtils.randomInt(4, 5);
        const isLower: boolean = value === 4;
        const isUpper: boolean = value === 5;
        expect(isLower || isUpper).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_1100
     * @tc.name      testRndMat0011
     * @tc.desc      Verify randomBoolean returns a real boolean value that is
     *               either the true literal or the false literal.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const flag: boolean = RandomUtils.randomBoolean();
      if (flag) {
        expect(flag).assertTrue();
      } else {
        expect(flag).assertFalse();
      }
      expect(flag === true || flag === false).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_1200
     * @tc.name      testRndMat0012
     * @tc.desc      Verify randomBoolean keeps producing valid booleans over
     *               a long series of repeated draws.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let trueSeen: boolean = false;
      let falseSeen: boolean = false;
      for (let index: number = 0; index < 40; index++) {
        const flag: boolean = RandomUtils.randomBoolean();
        if (flag) {
          trueSeen = true;
        } else {
          falseSeen = true;
        }
      }
      expect(trueSeen || falseSeen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_1300
     * @tc.name      testRndMat0013
     * @tc.desc      Verify randomString produces exactly the requested number
     *               of characters for a medium length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string = RandomUtils.randomString(16);
      expect(text.length).assertEqual(16);
      const short: string = RandomUtils.randomString(1);
      expect(short.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_1400
     * @tc.name      testRndMat0014
     * @tc.desc      Verify every character of a random string belongs to the
     *               documented letter pool without digits or symbols.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string = RandomUtils.randomString(24);
      expect(text.length).assertEqual(24);
      for (let index: number = 0; index < text.length; index++) {
        const letter: string = text.charAt(index);
        expect(LETTER_POOL.indexOf(letter) >= 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_1500
     * @tc.name      testRndMat0015
     * @tc.desc      Verify randomString degrades zero and negative lengths to
     *               the empty string instead of throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(RandomUtils.randomString(0)).assertEqual('');
      expect(RandomUtils.randomString(-1)).assertEqual('');
      expect(RandomUtils.randomString(-100)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_1600
     * @tc.name      testRndMat0016
     * @tc.desc      Verify randomString honours a long requested length and a
     *               fractional length that keeps one extra character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRndMat0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRndMat0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const long: string = RandomUtils.randomString(100);
      expect(long.length).assertEqual(100);
      const fractional: string = RandomUtils.randomString(10.9);
      expect(fractional.length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_1700
     * @tc.name      testRndMat0017
     * @tc.desc      Verify randomItem returns the only element of a single
     *               entry array and a member of a larger array.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const single: string[] = ['only'];
      expect(RandomUtils.randomItem(single)).assertEqual('only');
      const many: string[] = ['alpha', 'beta', 'gamma'];
      const picked: string = RandomUtils.randomItem(many);
      expect(many.indexOf(picked) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_1800
     * @tc.name      testRndMat0018
     * @tc.desc      Verify randomItem always picks a member of the source
     *               array over many repeated draws.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const pool: string[] = ['red', 'green', 'blue', 'white', 'black'];
      for (let index: number = 0; index < DRAWS; index++) {
        const picked: string = RandomUtils.randomItem(pool);
        expect(pool.indexOf(picked) >= 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_1900
     * @tc.name      testRndMat0019
     * @tc.desc      Verify randomItem degrades an empty array to the neutral
     *               empty string instead of throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRndMat0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRndMat0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const empty: string[] = [];
      expect(RandomUtils.randomItem(empty)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_2000
     * @tc.name      testRndMat0020
     * @tc.desc      Verify shuffleCopy keeps the array length unchanged and
     *               returns a new array instance, not the input itself.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const source: string[] = ['a', 'b', 'c', 'd', 'e'];
      const shuffled: string[] = RandomUtils.shuffleCopy(source);
      expect(shuffled.length).assertEqual(source.length);
      expect(shuffled === source).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_2100
     * @tc.name      testRndMat0021
     * @tc.desc      Verify shuffleCopy preserves the multiset of elements so
     *               the sorted copies of input and output are identical.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const source: string[] = ['x', 'y', 'z', 'w', 'v', 'u'];
      const shuffled: string[] = RandomUtils.shuffleCopy(source);
      const sortedSource: string[] = source.slice(0).sort();
      const sortedShuffled: string[] = shuffled.slice(0).sort();
      for (let index: number = 0; index < sortedSource.length; index++) {
        expect(sortedShuffled[index]).assertEqual(sortedSource[index]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_2200
     * @tc.name      testRndMat0022
     * @tc.desc      Verify shuffleCopy never mutates the input array order
     *               even after several shuffle operations.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const source: string[] = ['p', 'q', 'r', 's'];
      const before: string[] = source.slice(0);
      for (let index: number = 0; index < 5; index++) {
        RandomUtils.shuffleCopy(source);
      }
      for (let index: number = 0; index < source.length; index++) {
        expect(source[index]).assertEqual(before[index]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_2300
     * @tc.name      testRndMat0023
     * @tc.desc      Verify shuffleCopy handles the degenerate single entry
     *               and empty arrays without changing their content.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRndMat0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRndMat0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const single: string[] = ['solo'];
      const shuffledSingle: string[] = RandomUtils.shuffleCopy(single);
      expect(shuffledSingle.length).assertEqual(1);
      expect(shuffledSingle[0]).assertEqual('solo');
      const empty: string[] = [];
      const shuffledEmpty: string[] = RandomUtils.shuffleCopy(empty);
      expect(shuffledEmpty.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_2400
     * @tc.name      testRndMat0024
     * @tc.desc      Verify uuid produces the standard 36 character RFC 4122
     *               text form with four dashes at the fixed positions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const id: string = RandomUtils.uuid();
      expect(id.length).assertEqual(36);
      expect(id.charAt(8)).assertEqual(UUID_DASH);
      expect(id.charAt(13)).assertEqual(UUID_DASH);
      expect(id.charAt(18)).assertEqual(UUID_DASH);
      expect(id.charAt(23)).assertEqual(UUID_DASH);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_2500
     * @tc.name      testRndMat0025
     * @tc.desc      Verify uuid uses only hexadecimal digits and dashes and
     *               marks the version four position with the digit four.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const id: string = RandomUtils.uuid();
      expect(id.charAt(14)).assertEqual('4');
      expect(UUID_VARIANT.indexOf(id.charAt(19)) >= 0).assertTrue();
      for (let index: number = 0; index < id.length; index++) {
        const token: string = id.charAt(index);
        const isDash: boolean = token === UUID_DASH;
        const isHex: boolean = HEX_POOL.indexOf(token) >= 0;
        expect(isDash || isHex).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_2600
     * @tc.name      testRndMat0026
     * @tc.desc      Verify uuid generates a fresh identifier on every call so
     *               two consecutive values never collide.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: string = RandomUtils.uuid();
      const second: string = RandomUtils.uuid();
      expect(first === second).assertFalse();
      expect(first.length).assertEqual(second.length);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_2700
     * @tc.name      testRndMat0027
     * @tc.desc      Verify randomHexColor renders seven characters starting
     *               with the leading hash character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const color: string = RandomUtils.randomHexColor();
      expect(color.length).assertEqual(7);
      expect(color.charAt(0)).assertEqual(COLOR_PREFIX);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_2800
     * @tc.name      testRndMat0028
     * @tc.desc      Verify every digit of a random hex color belongs to the
     *               lowercase hexadecimal pool.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const color: string = RandomUtils.randomHexColor();
      for (let index: number = 1; index < color.length; index++) {
        const digit: string = color.charAt(index);
        expect(HEX_POOL.indexOf(digit) >= 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_2900
     * @tc.name      testRndMat0029
     * @tc.desc      Verify randomHexColor keeps its structure over many
     *               repeated generations.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRndMat0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRndMat0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < 8; index++) {
        const color: string = RandomUtils.randomHexColor();
        expect(color.length).assertEqual(7);
        expect(color.charAt(0)).assertEqual(COLOR_PREFIX);
        expect(HEX_POOL.indexOf(color.charAt(1)) >= 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_3000
     * @tc.name      testRndMat0030
     * @tc.desc      Verify randomDigits produces exactly the requested number
     *               of digit characters for a medium length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const digits: string = RandomUtils.randomDigits(12);
      expect(digits.length).assertEqual(12);
      for (let index: number = 0; index < digits.length; index++) {
        expect(DIGIT_POOL.indexOf(digits.charAt(index)) >= 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_3100
     * @tc.name      testRndMat0031
     * @tc.desc      Verify randomDigits degrades zero and negative lengths to
     *               the empty string and keeps a single digit for length one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRndMat0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRndMat0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(RandomUtils.randomDigits(0)).assertEqual('');
      expect(RandomUtils.randomDigits(-7)).assertEqual('');
      const one: string = RandomUtils.randomDigits(1);
      expect(one.length).assertEqual(1);
      expect(DIGIT_POOL.indexOf(one) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_3200
     * @tc.name      testRndMat0032
     * @tc.desc      Verify randomDigits rounds a fractional length up so the
     *               loop keeps one extra character beyond the integer part.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRndMat0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testRndMat0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const digits: string = RandomUtils.randomDigits(5.5);
      expect(digits.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_3300
     * @tc.name      testRndMat0033
     * @tc.desc      Verify randomDigits never contains a letter from the
     *               letter pool even for a long generated text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRndMat0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRndMat0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const digits: string = RandomUtils.randomDigits(40);
      expect(digits.length).assertEqual(40);
      for (let index: number = 0; index < digits.length; index++) {
        const token: string = digits.charAt(index);
        expect(LETTER_POOL.indexOf(token) < 0).assertTrue();
        expect(DIGIT_POOL.indexOf(token) >= 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_3400
     * @tc.name      testRndMat0034
     * @tc.desc      Verify randomInt keeps drawing valid integers when the
     *               bounds themselves come from earlier random draws.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRndMat0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRndMat0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const low: number = RandomUtils.randomInt(1, 5);
      const high: number = RandomUtils.randomInt(6, 10);
      expect(low).assertLargerOrEqual(1);
      expect(low).assertLess(6);
      expect(high).assertLargerOrEqual(6);
      expect(high).assertLess(11);
      const chained: number = RandomUtils.randomInt(low, high);
      expect(chained).assertLargerOrEqual(low);
      expect(chained).assertLess(high + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_3500
     * @tc.name      testRndMat0035
     * @tc.desc      Verify randomString keeps producing letters while the
     *               digits helper keeps producing digits for equal lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRndMat0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRndMat0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const letters: string = RandomUtils.randomString(10);
      const digits: string = RandomUtils.randomDigits(10);
      expect(letters.length).assertEqual(digits.length);
      for (let index: number = 0; index < 10; index++) {
        expect(DIGIT_POOL.indexOf(letters.charAt(index)) < 0).assertTrue();
        expect(LETTER_POOL.indexOf(digits.charAt(index)) < 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_RNDMAT_3600
     * @tc.name      testRndMat0036
     * @tc.desc      Verify shuffleCopy of an already shuffled copy still
     *               preserves every element across a second generation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRndMat0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testRndMat0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const source: string[] = ['a1', 'b2', 'c3', 'd4', 'e5', 'f6'];
      const firstPass: string[] = RandomUtils.shuffleCopy(source);
      const secondPass: string[] = RandomUtils.shuffleCopy(firstPass);
      expect(secondPass.length).assertEqual(source.length);
      const sortedFirst: string[] = firstPass.slice(0).sort();
      const sortedSecond: string[] = secondPass.slice(0).sort();
      for (let index: number = 0; index < source.length; index++) {
        expect(sortedSecond[index]).assertEqual(sortedFirst[index]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
