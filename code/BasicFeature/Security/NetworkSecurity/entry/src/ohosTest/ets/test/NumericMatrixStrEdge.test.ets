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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { StringUtils } from 'library';

const DOMAIN: number = 0xF811;

// Registers the numeric edge matrix test suite for the string helpers with
// boundary-focused numeric inputs on truncate, padStart, repeat, capitalize,
// ignore-case prefix and suffix checks, match counting and emptiness checks.
export default function numericMatrixStrEdgeTest() {
  describe('NumericMatrixStrEdgeSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_0100
     * @tc.name      testNumStrEdge0001
     * @tc.desc      Verify truncate with numeric length zero cuts any non-empty value to an empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Numeric length zero keeps no characters at all.
      expect(StringUtils.truncate('networksecurity', 0)).assertEqual('');
      // A different non-empty value is cut to the same empty result.
      expect(StringUtils.truncate('policy', 0)).assertEqual('');
      // Zero is a non-negative limit so the cut branch is taken.
      expect(StringUtils.truncate('a', 0)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_0200
     * @tc.name      testNumStrEdge0002
     * @tc.desc      Verify truncate with numeric length one keeps exactly the first character of longer values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length one keeps only the head character.
      expect(StringUtils.truncate('networksecurity', 1)).assertEqual('n');
      // The same limit on a shorter word keeps its single head too.
      expect(StringUtils.truncate('policy', 1)).assertEqual('p');
      // Digits behave identically under a one-character limit.
      expect(StringUtils.truncate('9lives', 1)).assertEqual('9');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_0300
     * @tc.name      testNumStrEdge0003
     * @tc.desc      Verify truncate with a mid-range numeric length keeps the exact prefix of that length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length seven keeps the first seven characters.
      expect(StringUtils.truncate('networksecurity', 7)).assertEqual('network');
      // Length four keeps the first four characters.
      expect(StringUtils.truncate('networksecurity', 4)).assertEqual('netw');
      // Repeated limits on the same value stay consistent.
      expect(StringUtils.truncate('networksecurity', 10)).assertEqual('networksec');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_0400
     * @tc.name      testNumStrEdge0004
     * @tc.desc      Verify truncate keeps the value untouched when the numeric length equals the value length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Limit equal to the length means no cut happens.
      expect(StringUtils.truncate('networksecurity', 15)).assertEqual('networksecurity');
      // The same equality boundary holds for a short word.
      expect(StringUtils.truncate('policy', 6)).assertEqual('policy');
      // Equality is exact: one below would cut, equal does not.
      expect(StringUtils.truncate('ab', 2)).assertEqual('ab');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_0500
     * @tc.name      testNumStrEdge0005
     * @tc.desc      Verify truncate keeps the value untouched when the numeric length is larger than the value length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Limit above the length leaves the value unchanged.
      expect(StringUtils.truncate('networksecurity', 16)).assertEqual('networksecurity');
      // A much larger limit still leaves the value unchanged.
      expect(StringUtils.truncate('policy', 999)).assertEqual('policy');
      // Large positive limits never introduce extra characters.
      expect(StringUtils.truncate('ab', 100000)).assertEqual('ab');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_0600
     * @tc.name      testNumStrEdge0006
     * @tc.desc      Verify truncate ignores negative numeric lengths and returns the original value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Negative length one is not a valid cut limit.
      expect(StringUtils.truncate('networksecurity', -1)).assertEqual('networksecurity');
      // A large negative limit behaves the same way.
      expect(StringUtils.truncate('networksecurity', -100)).assertEqual('networksecurity');
      // Negative limits never produce an empty or partial value.
      expect(StringUtils.truncate('policy', -5)).assertEqual('policy');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_0700
     * @tc.name      testNumStrEdge0007
     * @tc.desc      Verify truncate on an empty value returns the empty value for positive and negative numeric lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty value stays empty under a positive limit.
      expect(StringUtils.truncate('', 5)).assertEqual('');
      // An empty value stays empty under a zero limit too.
      expect(StringUtils.truncate('', 0)).assertEqual('');
      // An empty value stays empty under a negative limit.
      expect(StringUtils.truncate('', -3)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_0800
     * @tc.name      testNumStrEdge0008
     * @tc.desc      Verify truncate with numeric length one below the value length cuts exactly one character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length two on a three-character value keeps two characters.
      expect(StringUtils.truncate('abc', 2)).assertEqual('ab');
      // Length five on a six-character value keeps five characters.
      expect(StringUtils.truncate('policy', 5)).assertEqual('polic');
      // The cut is always the leading slice of the requested length.
      expect(StringUtils.truncate('session', 6)).assertEqual('sessio');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_0900
     * @tc.name      testNumStrEdge0009
     * @tc.desc      Verify truncate pads no characters and keeps numeric length semantics on single character values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single character survives a limit of one unchanged.
      expect(StringUtils.truncate('x', 1)).assertEqual('x');
      // A single character survives a limit of two unchanged.
      expect(StringUtils.truncate('x', 2)).assertEqual('x');
      // A single character is cut to empty by a zero limit.
      expect(StringUtils.truncate('x', 0)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_1000
     * @tc.name      testNumStrEdge0010
     * @tc.desc      Verify padStart pads digit values with zero to reach the requested numeric length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A one digit port segment pads with two zeros to length three.
      expect(StringUtils.padStart('7', 3, '0')).assertEqual('007');
      // A two digit value pads with three zeros to length five.
      expect(StringUtils.padStart('42', 5, '0')).assertEqual('00042');
      // An already three digit value pads with zeros to length six.
      expect(StringUtils.padStart('808', 6, '0')).assertEqual('000808');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_1100
     * @tc.name      testNumStrEdge0011
     * @tc.desc      Verify padStart keeps values unchanged when the numeric target length is at or below the value length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Target below the length pads nothing.
      expect(StringUtils.padStart('port', 2, '0')).assertEqual('port');
      // Target equal to the length pads nothing either.
      expect(StringUtils.padStart('port', 4, '0')).assertEqual('port');
      // The boundary between pad and no-pad is exact.
      expect(StringUtils.padStart('ab', 3, '0')).assertEqual('0ab');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_1200
     * @tc.name      testNumStrEdge0012
     * @tc.desc      Verify padStart with non-positive numeric target lengths returns the original value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Zero target length pads nothing.
      expect(StringUtils.padStart('5', 0, '0')).assertEqual('5');
      // Negative target length pads nothing.
      expect(StringUtils.padStart('5', -2, '0')).assertEqual('5');
      // Large negative target length still pads nothing.
      expect(StringUtils.padStart('audit', -50, 'x')).assertEqual('audit');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_1300
     * @tc.name      testNumStrEdge0013
     * @tc.desc      Verify padStart with an empty pad character returns the original value for any numeric target length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty pad character short-circuits the pad loop.
      expect(StringUtils.padStart('7', 3, '')).assertEqual('7');
      // The same guard applies to a longer target length.
      expect(StringUtils.padStart('42', 10, '')).assertEqual('42');
      // An empty pad character also guards an empty value.
      expect(StringUtils.padStart('', 5, '')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_1400
     * @tc.name      testNumStrEdge0014
     * @tc.desc      Verify padStart with a multi-character pad reaches the target but may overshoot the numeric length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A two character pad on a one character value hits the target exactly.
      expect(StringUtils.padStart('x', 3, 'ab')).assertEqual('abx');
      // A target that the two character pad cannot hit exactly overshoots.
      expect(StringUtils.padStart('x', 4, 'ab')).assertEqual('ababx');
      // The overshoot result is still at least the target length.
      expect(StringUtils.padStart('x', 5, 'ab')).assertEqual('ababx');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_1500
     * @tc.name      testNumStrEdge0015
     * @tc.desc      Verify padStart on an empty value produces a pad-only result of the numeric target length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty value pads to the full target length.
      expect(StringUtils.padStart('', 3, '0')).assertEqual('000');
      // The pad-only result grows with the target length.
      expect(StringUtils.padStart('', 5, '0')).assertEqual('00000');
      // A single pad target produces a single pad character.
      expect(StringUtils.padStart('', 1, '0')).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_1600
     * @tc.name      testNumStrEdge0016
     * @tc.desc      Verify padStart with a same-character pad reaches exactly the numeric target length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Padding nines up to length six from a two digit value lands exactly.
      expect(StringUtils.padStart('99', 6, '9')).assertEqual('999999');
      // The result length always reaches the requested target.
      expect(StringUtils.padStart('1', 4, '9')).assertEqual('9991');
      // Padding spaces also reaches the exact target length.
      expect(StringUtils.padStart('id', 5, ' ')).assertEqual('   id');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_1700
     * @tc.name      testNumStrEdge0017
     * @tc.desc      Verify padStart on values that already match the numeric target keeps every character intact.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A value equal to the target stays unchanged.
      expect(StringUtils.padStart('007', 3, '0')).assertEqual('007');
      // A longer value stays unchanged regardless of the pad character.
      expect(StringUtils.padStart('65535', 3, '0')).assertEqual('65535');
      // Whitespace inside the value does not affect the guard.
      expect(StringUtils.padStart('a b', 3, '0')).assertEqual('a b');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_1800
     * @tc.name      testNumStrEdge0018
     * @tc.desc      Verify padStart with a one-step numeric difference adds exactly one pad character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One short of the target adds exactly one pad character.
      expect(StringUtils.padStart('ab', 3, 'z')).assertEqual('zab');
      // The same one-step rule holds for digits.
      expect(StringUtils.padStart('80', 3, '0')).assertEqual('080');
      // Repeating the one-step check stays deterministic.
      expect(StringUtils.padStart('k', 2, 'k')).assertEqual('kk');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_1900
     * @tc.name      testNumStrEdge0019
     * @tc.desc      Verify padStart reaches large numeric targets without losing the original value tail.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A double digit target keeps the original tail at the end.
      expect(StringUtils.padStart('end', 12, '0')).assertEqual('000000000end');
      // The padded result length always equals the target when the pad is one character.
      expect(StringUtils.padStart('x', 10, '.')).assertEqual('.........x');
      // A moderate target stays exact as well.
      expect(StringUtils.padStart('log', 8, ' ')).assertEqual('     log');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_2000
     * @tc.name      testNumStrEdge0020
     * @tc.desc      Verify padStart with unicode and digit mixes keeps the pad loop numeric semantics stable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A unicode pad character behaves like any single character pad.
      expect(StringUtils.padStart('5', 3, '网')).assertEqual('网网5');
      // Mixed digit and letter values pad by character count only.
      expect(StringUtils.padStart('a1', 4, '0')).assertEqual('00a1');
      // Padding a value that already contains the pad character is still prefix-only.
      expect(StringUtils.padStart('0x', 4, '0')).assertEqual('000x');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_2100
     * @tc.name      testNumStrEdge0021
     * @tc.desc      Verify repeat with numeric count zero or one produces empty text or a single copy.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Count zero produces the empty string.
      expect(StringUtils.repeat('ab', 0)).assertEqual('');
      // Count one produces exactly one copy.
      expect(StringUtils.repeat('ab', 1)).assertEqual('ab');
      // Count two produces two concatenated copies.
      expect(StringUtils.repeat('ab', 2)).assertEqual('abab');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_2200
     * @tc.name      testNumStrEdge0022
     * @tc.desc      Verify repeat with small positive numeric counts produces the exact concatenated copies.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Count three produces three copies.
      expect(StringUtils.repeat('ab', 3)).assertEqual('ababab');
      // Count four grows the result by one copy per unit.
      expect(StringUtils.repeat('x', 4)).assertEqual('xxxx');
      // Multi-character values concatenate without separators.
      expect(StringUtils.repeat('01', 3)).assertEqual('010101');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_2300
     * @tc.name      testNumStrEdge0023
     * @tc.desc      Verify repeat of an empty value stays empty for every numeric count.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty value repeated any positive count stays empty.
      expect(StringUtils.repeat('', 5)).assertEqual('');
      // A large count on an empty value stays empty too.
      expect(StringUtils.repeat('', 100)).assertEqual('');
      // An empty value with count one is still empty.
      expect(StringUtils.repeat('', 1)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_2400
     * @tc.name      testNumStrEdge0024
     * @tc.desc      Verify repeat clamps negative numeric counts to zero repeats and returns an empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Negative count one clamps to zero repeats.
      expect(StringUtils.repeat('x', -1)).assertEqual('');
      // A large negative count also clamps to zero repeats.
      expect(StringUtils.repeat('x', -100)).assertEqual('');
      // Negative counts never throw and never keep characters.
      expect(StringUtils.repeat('policy', -7)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_2500
     * @tc.name      testNumStrEdge0025
     * @tc.desc      Verify repeat caps numeric counts above the limit at exactly ten thousand copies.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A count above the cap produces exactly ten thousand characters.
      expect(StringUtils.repeat('x', 10001).length).assertEqual(10000);
      // A far larger count is capped at the same limit.
      expect(StringUtils.repeat('x', 20000).length).assertEqual(10000);
      // The cap applies per call and does not depend on the value.
      expect(StringUtils.repeat('ab', 99999).length).assertEqual(20000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_2600
     * @tc.name      testNumStrEdge0026
     * @tc.desc      Verify repeat at the exact cap boundary numeric count produces the full limit length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The exact cap count is not clipped.
      expect(StringUtils.repeat('x', 10000).length).assertEqual(10000);
      // One below the cap is also produced in full.
      expect(StringUtils.repeat('x', 9999).length).assertEqual(9999);
      // The boundary between clamp and cap is exact.
      expect(StringUtils.repeat('x', 9998).length).assertEqual(9998);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_2700
     * @tc.name      testNumStrEdge0027
     * @tc.desc      Verify repeat result length equals value length times the numeric count below the cap.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two character value times one hundred is two hundred characters.
      expect(StringUtils.repeat('ab', 100).length).assertEqual(200);
      // Three character value times fifty is one hundred fifty characters.
      expect(StringUtils.repeat('abc', 50).length).assertEqual(150);
      // Single character value times five hundred is five hundred characters.
      expect(StringUtils.repeat('z', 500).length).assertEqual(500);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_2800
     * @tc.name      testNumStrEdge0028
     * @tc.desc      Verify repeat with numeric count one on multi-character values returns the value unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Count one keeps a word value unchanged.
      expect(StringUtils.repeat('network', 1)).assertEqual('network');
      // Count one keeps a digit value unchanged.
      expect(StringUtils.repeat('8080', 1)).assertEqual('8080');
      // Count one keeps whitespace inside the value unchanged.
      expect(StringUtils.repeat('a b', 1)).assertEqual('a b');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_2900
     * @tc.name      testNumStrEdge0029
     * @tc.desc      Verify capitalize uppercases only the first character and keeps the numeric rest of the value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A lowercase word gets an uppercase head and unchanged tail.
      expect(StringUtils.capitalize('network')).assertEqual('Network');
      // A mixed sentence only changes the head character.
      expect(StringUtils.capitalize('audit trail')).assertEqual('Audit trail');
      // Digits inside the tail stay untouched.
      expect(StringUtils.capitalize('level9')).assertEqual('Level9');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_3000
     * @tc.name      testNumStrEdge0030
     * @tc.desc      Verify capitalize keeps an empty value and a single character value stable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty value stays empty.
      expect(StringUtils.capitalize('')).assertEqual('');
      // A single lowercase letter becomes uppercase.
      expect(StringUtils.capitalize('a')).assertEqual('A');
      // A single digit stays the same digit.
      expect(StringUtils.capitalize('7')).assertEqual('7');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_3100
     * @tc.name      testNumStrEdge0031
     * @tc.desc      Verify capitalize on already uppercase heads keeps every character unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An all caps word stays all caps.
      expect(StringUtils.capitalize('NETWORK')).assertEqual('NETWORK');
      // An uppercase single letter stays uppercase.
      expect(StringUtils.capitalize('X')).assertEqual('X');
      // A mixed head already uppercase keeps the original casing tail.
      expect(StringUtils.capitalize('Audit Trail')).assertEqual('Audit Trail');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_3200
     * @tc.name      testNumStrEdge0032
     * @tc.desc      Verify capitalize passes non-letter numeric heads through without any change.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A leading digit is uppercased without visible effect.
      expect(StringUtils.capitalize('9lives')).assertEqual('9lives');
      // A leading whitespace character keeps the rest untouched.
      expect(StringUtils.capitalize('  lead')).assertEqual('  lead');
      // A leading punctuation character behaves the same way.
      expect(StringUtils.capitalize('-flag')).assertEqual('-flag');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_3300
     * @tc.name      testNumStrEdge0033
     * @tc.desc      Verify capitalize on values with numeric digit heads and letter tails touches only the head.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A digit head with letter tail stays completely unchanged.
      expect(StringUtils.capitalize('3way')).assertEqual('3way');
      // A digit-only value stays unchanged.
      expect(StringUtils.capitalize('2026')).assertEqual('2026');
      // The head rule applies no matter how long the tail is.
      expect(StringUtils.capitalize('v2Protocol')).assertEqual('V2Protocol');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_3400
     * @tc.name      testNumStrEdge0034
     * @tc.desc      Verify capitalize on repeated short values stays deterministic across numeric runs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The same input always maps to the same output.
      expect(StringUtils.capitalize('policy')).assertEqual('Policy');
      // Repeating the call does not accumulate changes.
      expect(StringUtils.capitalize('Policy')).assertEqual('Policy');
      // Different inputs map independently.
      expect(StringUtils.capitalize('policy')).assertEqual('Policy');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_3500
     * @tc.name      testNumStrEdge0035
     * @tc.desc      Verify capitalize keeps surrounding whitespace characters intact while uppercasing the head.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A tab head is uppercased without visible effect.
      expect(StringUtils.capitalize('\trow')).assertEqual('\trow');
      // A newline head keeps the letter tail intact.
      expect(StringUtils.capitalize('\nnext')).assertEqual('\nnext');
      // Inner whitespace after the head survives.
      expect(StringUtils.capitalize('a b')).assertEqual('A b');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_3600
     * @tc.name      testNumStrEdge0036
     * @tc.desc      Verify capitalize on numeric-prefixed identifiers used by the sample keeps the identifier stable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Sample style identifiers with a letter head get capitalized.
      expect(StringUtils.capitalize('id_main_page')).assertEqual('Id_main_page');
      // Identifiers starting with the id prefix digit behave the same.
      expect(StringUtils.capitalize('uid_1001')).assertEqual('Uid_1001');
      // Pure numeric identifiers remain untouched.
      expect(StringUtils.capitalize('1001')).assertEqual('1001');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_3700
     * @tc.name      testNumStrEdge0037
     * @tc.desc      Verify startsWithIgnoreCase matches mixed case prefixes of different numeric lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0037';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A lowercase prefix matches an uppercase value head.
      expect(StringUtils.startsWithIgnoreCase('HTTPS://demo', 'https')).assertTrue();
      // An uppercase prefix matches the same value head.
      expect(StringUtils.startsWithIgnoreCase('HTTPS://demo', 'HTTPS')).assertTrue();
      // A shorter prefix still matches after lowercasing both sides.
      expect(StringUtils.startsWithIgnoreCase('HTTPS://demo', 'Http')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_3800
     * @tc.name      testNumStrEdge0038
     * @tc.desc      Verify startsWithIgnoreCase rejects prefixes that differ in content at any numeric position.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0038';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A different tail character breaks the match.
      expect(StringUtils.startsWithIgnoreCase('HTTPS://demo', 'httpx')).assertFalse();
      // A different first character breaks the match too.
      expect(StringUtils.startsWithIgnoreCase('network', 'Netx')).assertFalse();
      // Case folding cannot rescue different content.
      expect(StringUtils.startsWithIgnoreCase('policy', 'POLICX')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_3900
     * @tc.name      testNumStrEdge0039
     * @tc.desc      Verify startsWithIgnoreCase rejects prefixes longer than the value for any numeric lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0039';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A prefix one character longer can never match.
      expect(StringUtils.startsWithIgnoreCase('ab', 'abc')).assertFalse();
      // A much longer prefix cannot match either.
      expect(StringUtils.startsWithIgnoreCase('a', 'averylongprefix')).assertFalse();
      // The length guard runs before any content comparison.
      expect(StringUtils.startsWithIgnoreCase('', 'x')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_4000
     * @tc.name      testNumStrEdge0040
     * @tc.desc      Verify startsWithIgnoreCase treats an empty prefix as a match for any value including empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0040';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty prefix matches any non-empty value.
      expect(StringUtils.startsWithIgnoreCase('anything', '')).assertTrue();
      // An empty prefix matches the empty value too.
      expect(StringUtils.startsWithIgnoreCase('', '')).assertTrue();
      // The empty prefix rule is independent of the value content.
      expect(StringUtils.startsWithIgnoreCase('2026-report', '')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_4100
     * @tc.name      testNumStrEdge0041
     * @tc.desc      Verify startsWithIgnoreCase on an empty value only matches the empty numeric prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0041';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty value rejects any non-empty prefix.
      expect(StringUtils.startsWithIgnoreCase('', 'a')).assertFalse();
      // The rejection holds for uppercase prefixes as well.
      expect(StringUtils.startsWithIgnoreCase('', 'A')).assertFalse();
      // Only the empty prefix can match an empty value.
      expect(StringUtils.startsWithIgnoreCase('', '')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_4200
     * @tc.name      testNumStrEdge0042
     * @tc.desc      Verify startsWithIgnoreCase on equal length value and prefix compares every numeric position.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0042';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Equal length equal content matches after case folding.
      expect(StringUtils.startsWithIgnoreCase('ABC', 'abc')).assertTrue();
      // Equal length different content does not match.
      expect(StringUtils.startsWithIgnoreCase('ABC', 'abd')).assertFalse();
      // Equal length digit values compare exactly.
      expect(StringUtils.startsWithIgnoreCase('8080', '8080')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_4300
     * @tc.name      testNumStrEdge0043
     * @tc.desc      Verify startsWithIgnoreCase matches protocol style prefixes on sample network values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0043';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Https values match their lowercase scheme prefix.
      expect(StringUtils.startsWithIgnoreCase('https://security.sample', 'https://')).assertTrue();
      // Http values match their uppercase scheme prefix.
      expect(StringUtils.startsWithIgnoreCase('http://insecure.sample', 'HTTP://')).assertTrue();
      // A file scheme prefix matches case-insensitively too.
      expect(StringUtils.startsWithIgnoreCase('FILE:///data/cert.pem', 'file:///')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_4400
     * @tc.name      testNumStrEdge0044
     * @tc.desc      Verify startsWithIgnoreCase matches single character numeric prefixes precisely.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0044';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single letter prefix matches its value head.
      expect(StringUtils.startsWithIgnoreCase('Token', 't')).assertTrue();
      // A single digit prefix matches a digit value head.
      expect(StringUtils.startsWithIgnoreCase('9lives', '9')).assertTrue();
      // A single character mismatch is detected even at length one.
      expect(StringUtils.startsWithIgnoreCase('Token', 'x')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_4500
     * @tc.name      testNumStrEdge0045
     * @tc.desc      Verify endWithIgnoreCase matches mixed case suffixes on certificate and document values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0045';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An uppercase suffix matches a lowercase value tail.
      expect(StringUtils.endWithIgnoreCase('demo.pdf', 'PDF')).assertTrue();
      // The same suffix in lowercase matches an uppercase tail.
      expect(StringUtils.endWithIgnoreCase('demo.PDF', 'pdf')).assertTrue();
      // Mixed case on both sides still matches.
      expect(StringUtils.endWithIgnoreCase('demo.PDF', 'PdF')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_4600
     * @tc.name      testNumStrEdge0046
     * @tc.desc      Verify endWithIgnoreCase rejects suffixes with different content at any numeric position.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0046';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A different extension does not match.
      expect(StringUtils.endWithIgnoreCase('demo.PDF', 'docx')).assertFalse();
      // A different head character in the suffix breaks the match.
      expect(StringUtils.endWithIgnoreCase('network', 'tworkx')).assertFalse();
      // Content difference cannot be rescued by case folding.
      expect(StringUtils.endWithIgnoreCase('cert.pem', 'PEN')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_4700
     * @tc.name      testNumStrEdge0047
     * @tc.desc      Verify endWithIgnoreCase rejects suffixes longer than the value for any numeric lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0047';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A suffix one character longer can never match.
      expect(StringUtils.endWithIgnoreCase('ab', 'abc')).assertFalse();
      // A much longer suffix cannot match either.
      expect(StringUtils.endWithIgnoreCase('a', 'averylongsuffix')).assertFalse();
      // An empty value rejects any non-empty suffix.
      expect(StringUtils.endWithIgnoreCase('', 'x')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_4800
     * @tc.name      testNumStrEdge0048
     * @tc.desc      Verify endWithIgnoreCase treats an empty suffix as a match for any value including empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0048';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty suffix matches any non-empty value.
      expect(StringUtils.endWithIgnoreCase('anything', '')).assertTrue();
      // An empty suffix matches the empty value too.
      expect(StringUtils.endWithIgnoreCase('', '')).assertTrue();
      // The rule is independent of the value content.
      expect(StringUtils.endWithIgnoreCase('2026-log', '')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_4900
     * @tc.name      testNumStrEdge0049
     * @tc.desc      Verify endWithIgnoreCase on equal length value and suffix compares every numeric position.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0049';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Equal length equal content matches after case folding.
      expect(StringUtils.endWithIgnoreCase('CERT', 'cert')).assertTrue();
      // Equal length different content does not match.
      expect(StringUtils.endWithIgnoreCase('CERT', 'certy')).assertFalse();
      // Equal length digit values compare exactly.
      expect(StringUtils.endWithIgnoreCase('8080', '8080')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_5000
     * @tc.name      testNumStrEdge0050
     * @tc.desc      Verify endWithIgnoreCase matches file extension style suffixes on sample paths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0050';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A pem certificate path matches its uppercase extension.
      expect(StringUtils.endWithIgnoreCase('/data/certs/server.pem', '.PEM')).assertTrue();
      // A json config path matches its lowercase extension.
      expect(StringUtils.endWithIgnoreCase('/data/config.json', '.json')).assertTrue();
      // A numeric file name matches its numeric suffix.
      expect(StringUtils.endWithIgnoreCase('backup-2026', '2026')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_5100
     * @tc.name      testNumStrEdge0051
     * @tc.desc      Verify endWithIgnoreCase matches single character numeric suffixes precisely.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0051';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single letter suffix matches its value tail.
      expect(StringUtils.endWithIgnoreCase('network', 'K')).assertTrue();
      // A single digit suffix matches a digit value tail.
      expect(StringUtils.endWithIgnoreCase('level9', '9')).assertTrue();
      // A single character mismatch is detected even at length one.
      expect(StringUtils.endWithIgnoreCase('network', 'x')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_5200
     * @tc.name      testNumStrEdge0052
     * @tc.desc      Verify endWithIgnoreCase requires the suffix to align with the numeric end of the value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0052';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A mid-string occurrence does not count as an end match.
      expect(StringUtils.endWithIgnoreCase('network.layer', 'work')).assertFalse();
      // Only the tail position matters for the match.
      expect(StringUtils.endWithIgnoreCase('network.layer', 'ayer')).assertTrue();
      // A leading-only occurrence is not an end match either.
      expect(StringUtils.endWithIgnoreCase('abccba', 'abc')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_5300
     * @tc.name      testNumStrEdge0053
     * @tc.desc      Verify countMatches counts non-overlapping occurrences only for repeated numeric patterns.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0053';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three a values hold exactly one non-overlapping aa match.
      expect(StringUtils.countMatches('aaa', 'aa')).assertEqual(1);
      // Four a values hold exactly two non-overlapping aa matches.
      expect(StringUtils.countMatches('aaaa', 'aa')).assertEqual(2);
      // The scan jumps past each match so overlaps never double count.
      expect(StringUtils.countMatches('aaaaa', 'aa')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_5400
     * @tc.name      testNumStrEdge0054
     * @tc.desc      Verify countMatches counts separated pattern occurrences across numeric separator widths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0054';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two separated matches are both counted.
      expect(StringUtils.countMatches('abcabc', 'abc')).assertEqual(2);
      // A separator between matches does not change the count.
      expect(StringUtils.countMatches('abc-abc', 'abc')).assertEqual(2);
      // Three separated matches are all counted.
      expect(StringUtils.countMatches('ab,ab,ab', 'ab')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_5500
     * @tc.name      testNumStrEdge0055
     * @tc.desc      Verify countMatches returns zero for an empty pattern regardless of the value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0055';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty pattern never matches inside a non-empty value.
      expect(StringUtils.countMatches('abcabc', '')).assertEqual(0);
      // An empty pattern never matches inside an empty value either.
      expect(StringUtils.countMatches('', '')).assertEqual(0);
      // The empty pattern guard runs before any scanning.
      expect(StringUtils.countMatches('2026', '')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_5600
     * @tc.name      testNumStrEdge0056
     * @tc.desc      Verify countMatches returns zero for an empty value with any non-empty numeric pattern.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0056';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty value holds no matches of a word pattern.
      expect(StringUtils.countMatches('', 'abc')).assertEqual(0);
      // An empty value holds no matches of a single character pattern.
      expect(StringUtils.countMatches('', 'a')).assertEqual(0);
      // An empty value holds no matches of a digit pattern.
      expect(StringUtils.countMatches('', '2026')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_5700
     * @tc.name      testNumStrEdge0057
     * @tc.desc      Verify countMatches returns zero when the pattern never appears in the value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0057';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A missing character pattern counts zero.
      expect(StringUtils.countMatches('network', 'x')).assertEqual(0);
      // A missing word pattern counts zero.
      expect(StringUtils.countMatches('network', 'policy')).assertEqual(0);
      // A longer pattern than the value counts zero.
      expect(StringUtils.countMatches('ab', 'abcdef')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_5800
     * @tc.name      testNumStrEdge0058
     * @tc.desc      Verify countMatches counts dotted separator patterns used by numeric sample identifiers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0058';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two dotted segments contain two dotted pattern matches.
      expect(StringUtils.countMatches('a.b.a.b', 'a.b')).assertEqual(2);
      // A full value equal to the pattern counts exactly one.
      expect(StringUtils.countMatches('networksecurity', 'networksecurity')).assertEqual(1);
      // Adjacent matches separated by one character count correctly.
      expect(StringUtils.countMatches('xy.xy.xy', 'xy')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_5900
     * @tc.name      testNumStrEdge0059
     * @tc.desc      Verify countMatches on a pattern equal to the value returns exactly one numeric match.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0059';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The pattern equal to the whole value matches once.
      expect(StringUtils.countMatches('xyz', 'xyz')).assertEqual(1);
      // The same rule holds for digit values.
      expect(StringUtils.countMatches('8080', '8080')).assertEqual(1);
      // A partial tail pattern matches once as well.
      expect(StringUtils.countMatches('xyz', 'yz')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_6000
     * @tc.name      testNumStrEdge0060
     * @tc.desc      Verify countMatches with single character patterns counts every numeric occurrence.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0060';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single character appears once and counts once.
      expect(StringUtils.countMatches('network', 'n')).assertEqual(1);
      // A repeated separator character counts every occurrence.
      expect(StringUtils.countMatches('a-a-a', '-')).assertEqual(2);
      // A digit character counts each appearance.
      expect(StringUtils.countMatches('2026-11-09', '0')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_6100
     * @tc.name      testNumStrEdge0061
     * @tc.desc      Verify isEmpty distinguishes missing and empty text from whitespace and visible numeric text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0061';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Undefined input counts as empty.
      expect(StringUtils.isEmpty(undefined)).assertTrue();
      // Empty text counts as empty.
      expect(StringUtils.isEmpty('')).assertTrue();
      // Whitespace-only text still holds characters and is not empty.
      expect(StringUtils.isEmpty(' ')).assertFalse();
      // A visible digit string is not empty.
      expect(StringUtils.isEmpty('8080')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_6200
     * @tc.name      testNumStrEdge0062
     * @tc.desc      Verify isBlank treats missing, empty and whitespace-only text as blank across numeric widths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0062';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Empty text is blank.
      expect(StringUtils.isBlank('')).assertTrue();
      // Spaces of any width are blank after trimming.
      expect(StringUtils.isBlank('   ')).assertTrue();
      // Tabs and line breaks are whitespace and count as blank.
      expect(StringUtils.isBlank('\t\r\n')).assertTrue();
      // Text holding a digit is not blank.
      expect(StringUtils.isBlank('1')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_6300
     * @tc.name      testNumStrEdge0063
     * @tc.desc      Verify trimToNull collapses missing, empty and whitespace-only numeric input to null.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0063';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Undefined input collapses to null.
      expect(StringUtils.trimToNull(undefined)).assertNull();
      // Empty text collapses to null.
      expect(StringUtils.trimToNull('')).assertNull();
      // Whitespace-only text collapses to null after trimming.
      expect(StringUtils.trimToNull('   ')).assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_6400
     * @tc.name      testNumStrEdge0064
     * @tc.desc      Verify trimToNull returns the trimmed text for padded and clean visible values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrEdge0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrEdge0064';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Surrounding whitespace is removed around a visible token.
      expect(StringUtils.trimToNull('  token  ')).assertEqual('token');
      // A clean value is returned unchanged.
      expect(StringUtils.trimToNull('plain')).assertEqual('plain');
      // A digit token survives trimming with its content intact.
      expect(StringUtils.trimToNull(' 2026 ')).assertEqual('2026');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_6500
     * @tc.name      testNumStrEdge0065
     * @tc.desc      Verify emptiness checks agree with each other on mixed visibility and numeric inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0065';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A visible padded value is not empty.
      expect(StringUtils.isEmpty(' log ')).assertFalse();
      // The same value is not blank either because trimming keeps characters.
      expect(StringUtils.isBlank(' log ')).assertFalse();
      // Trimming that value yields the inner token.
      expect(StringUtils.trimToNull(' log ')).assertEqual('log');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_6600
     * @tc.name      testNumStrEdge0066
     * @tc.desc      Verify isEmpty and isBlank both accept undefined input while trimToNull maps it to null.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0066';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // All three helpers handle undefined consistently.
      expect(StringUtils.isEmpty(undefined)).assertTrue();
      expect(StringUtils.isBlank(undefined)).assertTrue();
      expect(StringUtils.trimToNull(undefined)).assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_6700
     * @tc.name      testNumStrEdge0067
     * @tc.desc      Verify single space input splits isEmpty false from isBlank true and trims to null.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0067';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single space holds a character so it is not empty.
      expect(StringUtils.isEmpty(' ')).assertFalse();
      // The same single space is blank after trimming.
      expect(StringUtils.isBlank(' ')).assertTrue();
      // Trimming the single space collapses it to null.
      expect(StringUtils.trimToNull(' ')).assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_6800
     * @tc.name      testNumStrEdge0068
     * @tc.desc      Verify digit-only and punctuation inputs stay visible for all three emptiness helpers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0068';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A digit string is visible to every helper.
      expect(StringUtils.isEmpty('42')).assertFalse();
      expect(StringUtils.isBlank('42')).assertFalse();
      expect(StringUtils.trimToNull('42')).assertEqual('42');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STREDGE_6900
     * @tc.name      testNumStrEdge0069
     * @tc.desc      Verify the three emptiness helpers keep sample identifier values stable across checks.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrEdge0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrEdge0069';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A sample component identifier is visible and trimmed as-is.
      expect(StringUtils.isEmpty('id_main_page')).assertFalse();
      expect(StringUtils.isBlank('id_main_page')).assertFalse();
      expect(StringUtils.trimToNull(' id_main_page ')).assertEqual('id_main_page');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
