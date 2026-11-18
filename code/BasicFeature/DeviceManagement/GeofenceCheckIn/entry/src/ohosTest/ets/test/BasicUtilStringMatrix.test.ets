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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BasicUtil } from 'library';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_BasicStrMatrix]';

/**
 * Probe record describing the expected emptiness flags of one string sample.
 * A sample carries raw text, so `undefined` samples are described by a separate flag.
 */
interface EmptyProbe {
  label: string;
  isMissing: boolean;
  value: string;
  isEmpty: boolean;
  isBlank: boolean;
}

/**
 * Probe record describing the expected trim result of one string sample.
 */
interface TrimProbe {
  label: string;
  isMissing: boolean;
  value: string;
  trimmed: string;
  trimmedLength: number;
}

/**
 * Probe record describing the expected capitalize result of one string sample.
 */
interface CapitalizeProbe {
  label: string;
  value: string;
  expected: string;
  expectedLength: number;
}

/**
 * Probe record describing the expected reverse result of one string sample.
 */
interface ReverseProbe {
  label: string;
  value: string;
  expected: string;
  expectedLength: number;
}

/**
 * Probe record describing one countOccurrences expectation.
 */
interface OccurrenceProbe {
  label: string;
  source: string;
  target: string;
  expected: number;
}

/**
 * Samples used by the emptiness matrix. The flag `isMissing` replaces an undefined value
 * so the table stays a homogeneous string list.
 */
const EMPTY_PROBES: EmptyProbe[] = [
  { label: 'undefined', isMissing: true, value: '', isEmpty: true, isBlank: true },
  { label: 'empty', isMissing: false, value: '', isEmpty: true, isBlank: true },
  { label: 'singleSpace', isMissing: false, value: ' ', isEmpty: false, isBlank: true },
  { label: 'threeSpaces', isMissing: false, value: '   ', isEmpty: false, isBlank: true },
  { label: 'tab', isMissing: false, value: '\t', isEmpty: false, isBlank: true },
  { label: 'newline', isMissing: false, value: '\n', isEmpty: false, isBlank: true },
  { label: 'carriageReturn', isMissing: false, value: '\r', isEmpty: false, isBlank: true },
  { label: 'mixedWhitespace', isMissing: false, value: ' \t\n\r ', isEmpty: false, isBlank: true },
  { label: 'paddedWord', isMissing: false, value: '  geofence  ', isEmpty: false, isBlank: false },
  { label: 'singleChar', isMissing: false, value: 'a', isEmpty: false, isBlank: false },
  { label: 'chinese', isMissing: false, value: '地理围栏', isEmpty: false, isBlank: false },
  { label: 'emoji', isMissing: false, value: '📍', isEmpty: false, isBlank: false },
  { label: 'digit', isMissing: false, value: '0', isEmpty: false, isBlank: false },
  { label: 'symbol', isMissing: false, value: '+-', isEmpty: false, isBlank: false }
];

/**
 * Samples used by the trimming matrix.
 */
const TRIM_PROBES: TrimProbe[] = [
  { label: 'undefined', isMissing: true, value: '', trimmed: '', trimmedLength: 0 },
  { label: 'empty', isMissing: false, value: '', trimmed: '', trimmedLength: 0 },
  { label: 'spacesOnly', isMissing: false, value: '    ', trimmed: '', trimmedLength: 0 },
  { label: 'leading', isMissing: false, value: '   left', trimmed: 'left', trimmedLength: 4 },
  { label: 'trailing', isMissing: false, value: 'right   ', trimmed: 'right', trimmedLength: 5 },
  { label: 'both', isMissing: false, value: '  both  ', trimmed: 'both', trimmedLength: 4 },
  { label: 'tabs', isMissing: false, value: '\t\ttabbed\t', trimmed: 'tabbed', trimmedLength: 6 },
  { label: 'newlines', isMissing: false, value: '\n\nline\n', trimmed: 'line', trimmedLength: 4 },
  { label: 'mixed', isMissing: false, value: ' \t\ninner\t\n ', trimmed: 'inner', trimmedLength: 5 },
  { label: 'innerSpaceKept', isMissing: false, value: '  a b  ', trimmed: 'a b', trimmedLength: 3 },
  { label: 'chinese', isMissing: false, value: '  围栏  ', trimmed: '围栏', trimmedLength: 2 },
  { label: 'emoji', isMissing: false, value: '  📍  ', trimmed: '📍', trimmedLength: 2 },
  { label: 'digitText', isMissing: false, value: ' 0012 ', trimmed: '0012', trimmedLength: 4 },
  { label: 'symbolText', isMissing: false, value: ' -+- ', trimmed: '-+-', trimmedLength: 3 }
];

/**
 * Samples used by the capitalize matrix.
 */
const CAPITALIZE_PROBES: CapitalizeProbe[] = [
  { label: 'lowerWord', value: 'geofence', expected: 'Geofence', expectedLength: 8 },
  { label: 'upperWord', value: 'GEOFENCE', expected: 'GEOFENCE', expectedLength: 8 },
  { label: 'mixedWord', value: 'aBcD', expected: 'ABcD', expectedLength: 4 },
  { label: 'singleLower', value: 'a', expected: 'A', expectedLength: 1 },
  { label: 'singleUpper', value: 'Z', expected: 'Z', expectedLength: 1 },
  { label: 'empty', value: '', expected: '', expectedLength: 0 },
  { label: 'digitFirst', value: '1abc', expected: '1abc', expectedLength: 4 },
  { label: 'symbolFirst', value: '-abc', expected: '-abc', expectedLength: 4 },
  { label: 'spaceFirst', value: ' abc', expected: ' abc', expectedLength: 4 },
  { label: 'chinese', value: '地理围栏', expected: '地理围栏', expectedLength: 4 },
  { label: 'emojiFirst', value: '📍abc', expected: '📍abc', expectedLength: 5 },
  { label: 'digitSymbolMix', value: 'a1-b2', expected: 'A1-b2', expectedLength: 5 }
];

/**
 * Samples used by the reverse matrix.
 */
const REVERSE_PROBES: ReverseProbe[] = [
  { label: 'empty', value: '', expected: '', expectedLength: 0 },
  { label: 'single', value: 'a', expected: 'a', expectedLength: 1 },
  { label: 'abc', value: 'abc', expected: 'cba', expectedLength: 3 },
  { label: 'palindrome', value: 'level', expected: 'level', expectedLength: 5 },
  { label: 'mixedCase', value: 'AbC', expected: 'CbA', expectedLength: 3 },
  { label: 'digits', value: '12345', expected: '54321', expectedLength: 5 },
  { label: 'symbols', value: '+-*/', expected: '/*-+', expectedLength: 4 },
  { label: 'withSpace', value: 'a b', expected: 'b a', expectedLength: 3 },
  { label: 'chinese', value: '地理围栏', expected: '栏围理地', expectedLength: 4 },
  { label: 'chineseSpace', value: '安全 围栏', expected: '栏围 全安', expectedLength: 5 },
  { label: 'mixedScript', value: 'a1地', expected: '地1a', expectedLength: 3 },
  { label: 'word', value: 'geofence', expected: 'ecnefoeg', expectedLength: 8 }
];

/**
 * Samples used by the occurrence matrix.
 */
const OCCURRENCE_PROBES: OccurrenceProbe[] = [
  { label: 'emptyTarget', source: 'geofence', target: '', expected: 0 },
  { label: 'emptySource', source: '', target: 'a', expected: 0 },
  { label: 'bothEmpty', source: '', target: '', expected: 0 },
  { label: 'absent', source: 'geofence', target: 'xyz', expected: 0 },
  { label: 'singleHit', source: 'geofence', target: 'fence', expected: 1 },
  { label: 'repeatedChar', source: 'aaaa', target: 'a', expected: 4 },
  { label: 'overlapAaa', source: 'aaaa', target: 'aa', expected: 2 },
  { label: 'overlapRemainder', source: 'aaaaa', target: 'aa', expected: 2 },
  { label: 'spacedHits', source: 'ab ab ab', target: 'ab', expected: 3 },
  { label: 'wholeString', source: 'abc', target: 'abc', expected: 1 },
  { label: 'chineseRepeat', source: '围栏围栏围栏', target: '围栏', expected: 3 },
  { label: 'chineseOverlap', source: '哈哈哈', target: '哈哈', expected: 1 },
  { label: 'digitRepeat', source: '101010', target: '10', expected: 3 },
  { label: 'symbolRepeat', source: '--++--', target: '--', expected: 2 },
  { label: 'mixedScript', source: 'a1a1a1', target: 'a1', expected: 3 }
];

/**
 * String matrix suite for the BasicUtil string helpers.
 * Every case works on a data table so legal, blank, Unicode, long text and repeated
 * substring shapes are covered by real assertions instead of duplicated ones.
 */
export default function basicUtilStringMatrixTest() {
  describe('BasicUtilStringMatrixTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'BasicUtilStringMatrixTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'BasicUtilStringMatrixTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_0100
     * @tc.name      testIsEmptyStringMatrix0001
     * @tc.desc      Verify isEmptyString accepts undefined and the empty string only and rejects
     *               whitespace, Chinese, emoji and symbol samples.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsEmptyStringMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIsEmptyStringMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < EMPTY_PROBES.length; i++) {
        const probe: EmptyProbe = EMPTY_PROBES[i];
        const actual: boolean = probe.isMissing ? BasicUtil.isEmptyString(undefined) : BasicUtil.isEmptyString(probe.value);
        expect(actual).assertEqual(probe.isEmpty);
        // The length based expectation must agree with the helper result.
        expect(actual).assertEqual(probe.isMissing || probe.value.length === 0);
        hilog.info(DOMAIN, TAG, '%{public}s', 'isEmptyString ' + probe.label + ' -> ' + actual);
      }
      // Guard the two documented true branches explicitly.
      expect(BasicUtil.isEmptyString(undefined)).assertTrue();
      expect(BasicUtil.isEmptyString('')).assertTrue();
      expect(BasicUtil.isEmptyString('  ')).assertFalse();
      expect(BasicUtil.isEmptyString('\t')).assertFalse();
      expect(BasicUtil.isEmptyString('a')).assertFalse();
      expect(BasicUtil.isEmptyString('中文')).assertFalse();
      expect(BasicUtil.isEmptyString(' ')).assertFalse();
      expect(BasicUtil.isEmptyString('0')).assertFalse();
      expect(EMPTY_PROBES.length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_0200
     * @tc.name      testIsBlankMatrix0001
     * @tc.desc      Verify isBlank covers the complete wording matrix including spaces, tab, newline,
     *               carriage return, mixed whitespace and padded real text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsBlankMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIsBlankMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let blankCount: number = 0;
      for (let i = 0; i < EMPTY_PROBES.length; i++) {
        const probe: EmptyProbe = EMPTY_PROBES[i];
        const actual: boolean = probe.isMissing ? BasicUtil.isBlank(undefined) : BasicUtil.isBlank(probe.value);
        expect(actual).assertEqual(probe.isBlank);
        if (actual) {
          blankCount = blankCount + 1;
        }
        // Blank implies either an empty value or a trimmed length of zero.
        expect(actual).assertEqual(probe.isMissing || BasicUtil.trimSafe(probe.value).length === 0);
        // A blank sample never survives a trim with content.
        if (actual) {
          expect(BasicUtil.trimSafe(probe.value)).assertEqual('');
        }
      }
      // The table holds 8 blank samples: undefined, empty, space, three spaces, tab, newline, CR, mixed.
      expect(blankCount).assertEqual(8);
      expect(BasicUtil.isBlank(undefined)).assertTrue();
      expect(BasicUtil.isBlank(' x ')).assertFalse();
      // Explicit probes for each whitespace family the helper trims away.
      expect(BasicUtil.isBlank(' ')).assertTrue();
      expect(BasicUtil.isBlank('\t')).assertTrue();
      expect(BasicUtil.isBlank('\n')).assertTrue();
      expect(BasicUtil.isBlank('\r')).assertTrue();
      expect(BasicUtil.isBlank(' \t\n\r ')).assertTrue();
      expect(BasicUtil.isBlank('0')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_0300
     * @tc.name      testEmptyAndBlankRelationship0001
     * @tc.desc      Verify every sample that isEmptyString accepts is also blank while the opposite
     *               direction only holds for whitespace samples.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEmptyAndBlankRelationship0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testEmptyAndBlankRelationship0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let emptyButNotBlank: number = 0;
      let blankButNotEmpty: number = 0;
      for (let i = 0; i < EMPTY_PROBES.length; i++) {
        const probe: EmptyProbe = EMPTY_PROBES[i];
        const empty: boolean = probe.isMissing ? BasicUtil.isEmptyString(undefined) : BasicUtil.isEmptyString(probe.value);
        const blank: boolean = probe.isMissing ? BasicUtil.isBlank(undefined) : BasicUtil.isBlank(probe.value);
        // Blank is a superset of empty, so this implication must always hold.
        expect(empty && !blank).assertFalse();
        if (empty && !blank) {
          emptyButNotBlank = emptyButNotBlank + 1;
        }
        if (!empty && blank) {
          blankButNotEmpty = blankButNotEmpty + 1;
        }
      }
      expect(emptyButNotBlank).assertEqual(0);
      // Six whitespace-only samples are blank without being empty.
      expect(blankButNotEmpty).assertEqual(6);
      expect(BasicUtil.isEmptyString(' ') === BasicUtil.isBlank(' ')).assertFalse();
      expect(BasicUtil.isEmptyString('') === BasicUtil.isBlank('')).assertTrue();
      expect(BasicUtil.isEmptyString(undefined) === BasicUtil.isBlank(undefined)).assertTrue();
      expect(BasicUtil.isEmptyString('a') === BasicUtil.isBlank('a')).assertTrue();
      expect(BasicUtil.isBlank('') && BasicUtil.isEmptyString('')).assertTrue();
      expect(BasicUtil.isBlank('\t') && !BasicUtil.isEmptyString('\t')).assertTrue();
      expect(BasicUtil.isEmptyString('') && BasicUtil.isBlank('')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_0400
     * @tc.name      testTrimSafeMatrix0001
     * @tc.desc      Verify trimSafe strips leading and trailing whitespace, maps undefined to the empty
     *               string and keeps inner spaces, Chinese and emoji content intact.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTrimSafeMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTrimSafeMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < TRIM_PROBES.length; i++) {
        const probe: TrimProbe = TRIM_PROBES[i];
        const actual: string = probe.isMissing ? BasicUtil.trimSafe(undefined) : BasicUtil.trimSafe(probe.value);
        expect(actual).assertEqual(probe.trimmed);
        expect(actual.length).assertEqual(probe.trimmedLength);
        // Trimming never adds characters.
        expect(actual.length <= probe.value.length).assertTrue();
        // Trimming twice equals trimming once for every sample shape.
        expect(BasicUtil.trimSafe(actual)).assertEqual(actual);
        // A trimmed result never starts or ends with a plain space.
        if (actual.length > 0) {
          expect(actual.charAt(0) === ' ').assertFalse();
          expect(actual.charAt(actual.length - 1) === ' ').assertFalse();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'trimSafe ' + probe.label + ' -> [' + actual + ']');
      }
      expect(BasicUtil.trimSafe(undefined)).assertEqual('');
      expect(BasicUtil.trimSafe('')).assertEqual('');
      expect(BasicUtil.trimSafe('   ')).assertEqual('');
      expect(BasicUtil.trimSafe('x')).assertEqual('x');
      expect(BasicUtil.trimSafe('\tx\t')).assertEqual('x');
      expect(TRIM_PROBES.length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_0500
     * @tc.name      testTrimSafeIdempotent0001
     * @tc.desc      Verify trimSafe is idempotent on every table row and that trimming a blank sample
     *               always yields the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTrimSafeIdempotent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTrimSafeIdempotent0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let blankRows: number = 0;
      for (let i = 0; i < TRIM_PROBES.length; i++) {
        const probe: TrimProbe = TRIM_PROBES[i];
        const once: string = probe.isMissing ? BasicUtil.trimSafe(undefined) : BasicUtil.trimSafe(probe.value);
        const twice: string = BasicUtil.trimSafe(once);
        // A second trim must never change the value again.
        expect(twice).assertEqual(once);
        const blank: boolean = probe.isMissing ? BasicUtil.isBlank(undefined) : BasicUtil.isBlank(probe.value);
        if (blank) {
          blankRows = blankRows + 1;
          expect(once).assertEqual('');
        } else {
          expect(once.length > 0).assertTrue();
        }
      }
      expect(blankRows).assertEqual(3);
      expect(TRIM_PROBES.length).assertEqual(14);
      expect(BasicUtil.trimSafe(BasicUtil.trimSafe(' a '))).assertEqual('a');
      expect(BasicUtil.trimSafe(BasicUtil.trimSafe('  '))).assertEqual('');
      expect(BasicUtil.trimSafe(BasicUtil.trimSafe('a b'))).assertEqual('a b');
      expect(BasicUtil.trimSafe(BasicUtil.trimSafe(undefined))).assertEqual('');
      expect(BasicUtil.trimSafe(BasicUtil.trimSafe('\n\t'))).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_0600
     * @tc.name      testTrimSafeLongText0001
     * @tc.desc      Verify trimSafe handles a long generated payload, a long whitespace-only payload and
     *               a long payload with inner tab characters without changing the content length rule.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTrimSafeLongText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTrimSafeLongText0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const payload: string = '0123456789';
      let longBody: string = '';
      for (let i = 0; i < 100; i++) {
        longBody = longBody + payload;
      }
      expect(longBody.length).assertEqual(1000);
      const padded: string = '     ' + longBody + '     ';
      expect(padded.length).assertEqual(1010);
      expect(BasicUtil.trimSafe(padded)).assertEqual(longBody);
      expect(BasicUtil.trimSafe(padded).length).assertEqual(1000);
      expect(BasicUtil.isEmptyString(padded)).assertFalse();
      expect(BasicUtil.isBlank(padded)).assertFalse();
      const blankPayload: string = ' '.repeat(500);
      expect(blankPayload.length).assertEqual(500);
      expect(BasicUtil.trimSafe(blankPayload)).assertEqual('');
      expect(BasicUtil.isBlank(blankPayload)).assertTrue();
      expect(BasicUtil.isEmptyString(blankPayload)).assertFalse();
      const innerTab: string = '\t' + longBody + '\t';
      expect(BasicUtil.trimSafe(innerTab)).assertEqual(longBody);
      const chineseBody: string = '围栏'.repeat(200);
      expect(chineseBody.length).assertEqual(400);
      expect(BasicUtil.trimSafe('  ' + chineseBody + '  ')).assertEqual(chineseBody);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_0700
     * @tc.name      testCapitalizeMatrix0001
     * @tc.desc      Verify capitalize upper cases only the first code unit and keeps the tail unchanged
     *               across letters, digits, symbols, Chinese and emoji samples.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCapitalizeMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCapitalizeMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < CAPITALIZE_PROBES.length; i++) {
        const probe: CapitalizeProbe = CAPITALIZE_PROBES[i];
        const actual: string = BasicUtil.capitalize(probe.value);
        expect(actual).assertEqual(probe.expected);
        expect(actual.length).assertEqual(probe.expectedLength);
        // Capitalize never changes the string length.
        expect(actual.length).assertEqual(probe.value.length);
        // The tail after the first code unit is always preserved.
        expect(actual.substring(1)).assertEqual(probe.value.substring(1));
        // Capitalizing twice never changes the value again.
        expect(BasicUtil.capitalize(actual)).assertEqual(actual);
        hilog.info(DOMAIN, TAG, '%{public}s', 'capitalize ' + probe.label + ' -> ' + actual);
      }
      expect(CAPITALIZE_PROBES.length).assertEqual(12);
      expect(BasicUtil.capitalize('geofence')).assertEqual('Geofence');
      expect(BasicUtil.capitalize('GEOFENCE')).assertEqual('GEOFENCE');
      expect(BasicUtil.capitalize('aBc')).assertEqual('ABc');
      expect(BasicUtil.capitalize('')).assertEqual('');
      expect(BasicUtil.capitalize('z')).assertEqual('Z');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_0800
     * @tc.name      testCapitalizeIdempotent0001
     * @tc.desc      Verify capitalizing twice equals capitalizing once for every table row so the
     *               helper never degrades the tail characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCapitalizeIdempotent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCapitalizeIdempotent0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let changedRows: number = 0;
      for (let i = 0; i < CAPITALIZE_PROBES.length; i++) {
        const probe: CapitalizeProbe = CAPITALIZE_PROBES[i];
        const once: string = BasicUtil.capitalize(probe.value);
        const twice: string = BasicUtil.capitalize(once);
        expect(twice).assertEqual(once);
        if (once !== probe.value) {
          changedRows = changedRows + 1;
        }
      }
      // Only the samples that start with a lower case ASCII letter change: geofence, aBcD, a, a1-b2.
      expect(changedRows).assertEqual(4);
      expect(BasicUtil.capitalize('b')).assertEqual('B');
      expect(BasicUtil.capitalize('B')).assertEqual('B');
      expect(BasicUtil.capitalize('')).assertEqual('');
      expect(BasicUtil.capitalize(BasicUtil.capitalize('geofence'))).assertEqual('Geofence');
      expect(BasicUtil.capitalize(BasicUtil.capitalize(' a'))).assertEqual(' a');
      expect(BasicUtil.capitalize(BasicUtil.capitalize('1a'))).assertEqual('1a');
      expect(BasicUtil.capitalize(BasicUtil.capitalize('中文'))).assertEqual('中文');
      expect(CAPITALIZE_PROBES.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_0900
     * @tc.name      testReverseStringMatrix0001
     * @tc.desc      Verify reverseString mirrors every sample and keeps the character count stable for
     *               ASCII, Chinese, symbol and whitespace payloads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testReverseStringMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testReverseStringMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < REVERSE_PROBES.length; i++) {
        const probe: ReverseProbe = REVERSE_PROBES[i];
        const actual: string = BasicUtil.reverseString(probe.value);
        expect(actual).assertEqual(probe.expected);
        expect(actual.length).assertEqual(probe.expectedLength);
        // Reversing keeps the character count.
        expect(actual.length).assertEqual(probe.value.length);
        // A second reverse always restores the original code units.
        expect(BasicUtil.reverseString(actual)).assertEqual(probe.value);
        hilog.info(DOMAIN, TAG, '%{public}s', 'reverseString ' + probe.label + ' -> ' + actual);
      }
      expect(REVERSE_PROBES.length).assertEqual(12);
      expect(BasicUtil.reverseString('abc')).assertEqual('cba');
      expect(BasicUtil.reverseString('')).assertEqual('');
      expect(BasicUtil.reverseString('a')).assertEqual('a');
      expect(BasicUtil.reverseString('ab')).assertEqual('ba');
      expect(BasicUtil.reverseString('ab ')).assertEqual(' ba');
      expect(BasicUtil.reverseString('中文')).assertEqual('文中');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_1000
     * @tc.name      testReverseStringRoundTrip0001
     * @tc.desc      Verify reversing twice restores the original value for every table row and that the
     *               first and last characters are swapped.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testReverseStringRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testReverseStringRoundTrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < REVERSE_PROBES.length; i++) {
        const probe: ReverseProbe = REVERSE_PROBES[i];
        const reversed: string = BasicUtil.reverseString(probe.value);
        expect(BasicUtil.reverseString(reversed)).assertEqual(probe.value);
        // Reversing swaps the first and last code units when both exist.
        if (probe.value.length > 0) {
          expect(reversed.charAt(0)).assertEqual(probe.value.charAt(probe.value.length - 1));
          expect(reversed.charAt(reversed.length - 1)).assertEqual(probe.value.charAt(0));
        }
      }
      // Palindromes survive a single reverse.
      expect(BasicUtil.reverseString('level')).assertEqual('level');
      expect(BasicUtil.reverseString('')).assertEqual('');
      expect(BasicUtil.reverseString('a')).assertEqual('a');
      expect(BasicUtil.reverseString('ab')).assertEqual('ba');
      expect(BasicUtil.reverseString('abc')).assertEqual('cba');
      expect(BasicUtil.reverseString('aabb')).assertEqual('bbaa');
      expect(REVERSE_PROBES.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_1100
     * @tc.name      testReverseStringEmoji0001
     * @tc.desc      Verify reverseString preserves surrogate pairs while reversing Unicode code points.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testReverseStringEmoji0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testReverseStringEmoji0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const emoji: string = '📍';
      // A single emoji occupies two UTF-16 code units.
      expect(emoji.length).assertEqual(2);
      expect(BasicUtil.reverseString(emoji).length).assertEqual(2);
      expect(BasicUtil.reverseString(emoji)).assertEqual(emoji);
      const mixed: string = 'a📍b';
      expect(mixed.length).assertEqual(4);
      const reversedMixed: string = BasicUtil.reverseString(mixed);
      expect(reversedMixed.length).assertEqual(4);
      expect(reversedMixed).assertEqual('b' + emoji + 'a');
      // The leading ASCII character moves to the very end.
      expect(reversedMixed.charAt(3)).assertEqual('a');
      expect(reversedMixed.charAt(0)).assertEqual('b');
      // Reversing twice restores the original code units.
      expect(BasicUtil.reverseString(reversedMixed)).assertEqual(mixed);
      const pair: string = '📍📍';
      expect(pair.length).assertEqual(4);
      expect(BasicUtil.reverseString(pair)).assertEqual(pair);
      const rocket: string = '\u{1F680}';
      expect(BasicUtil.reverseString(emoji + rocket)).assertEqual(rocket + emoji);
      expect(BasicUtil.reverseString('a\r\n' + emoji + '\u0000b')).assertEqual('b\u0000' + emoji + '\n\ra');
      expect(BasicUtil.reverseString('\uD800a')).assertEqual('a\uD800');
      expect(BasicUtil.reverseString('a\uDC00')).assertEqual('\uDC00a');
      // Latin text mixed with an astral emoji keeps the total code unit count.
      const latin: string = '🚀go';
      expect(latin.length).assertEqual(4);
      expect(BasicUtil.reverseString(latin).charAt(0)).assertEqual('o');
      expect(BasicUtil.countOccurrences(latin, 'g')).assertEqual(1);
      expect(BasicUtil.isBlank(latin)).assertFalse();
      expect(BasicUtil.capitalize(latin).length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_1200
     * @tc.name      testReverseStringLongText0001
     * @tc.desc      Verify reverseString on a 1000 character payload keeps the length and produces the
     *               mirrored pattern expected from a repeating digit block.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testReverseStringLongText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testReverseStringLongText0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const payload: string = '0123456789';
      let body: string = '';
      for (let i = 0; i < 100; i++) {
        body = body + payload;
      }
      expect(body.length).assertEqual(1000);
      const reversed: string = BasicUtil.reverseString(body);
      expect(reversed.length).assertEqual(1000);
      expect(reversed).assertEqual('9876543210'.repeat(100));
      expect(BasicUtil.reverseString(reversed)).assertEqual(body);
      expect(reversed.charAt(0)).assertEqual('9');
      expect(reversed.charAt(999)).assertEqual('0');
      expect(BasicUtil.countOccurrences(body, '0123')).assertEqual(100);
      expect(BasicUtil.countOccurrences(reversed, '3210')).assertEqual(100);
      expect(BasicUtil.countOccurrences(reversed, '0123')).assertEqual(0);
      expect(BasicUtil.isBlank(body)).assertFalse();
      expect(BasicUtil.isEmptyString(body)).assertFalse();
      expect(BasicUtil.trimSafe(body)).assertEqual(body);
      expect(BasicUtil.capitalize(body)).assertEqual(body);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_1300
     * @tc.name      testCountOccurrencesMatrix0001
     * @tc.desc      Verify countOccurrences counts non-overlapping matches across empty, absent, repeated,
     *               overlapping, Chinese, digit and symbol samples.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCountOccurrencesMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCountOccurrencesMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < OCCURRENCE_PROBES.length; i++) {
        const probe: OccurrenceProbe = OCCURRENCE_PROBES[i];
        const actual: number = BasicUtil.countOccurrences(probe.source, probe.target);
        expect(actual).assertEqual(probe.expected);
        // A count can never exceed the number of possible start positions.
        const maxPossible: number = probe.target === '' || probe.source.length < probe.target.length
          ? 0 : probe.source.length - probe.target.length + 1;
        expect(actual <= maxPossible).assertTrue();
        expect(actual >= 0).assertTrue();
        if (actual === 0 && probe.expected === 0) {
          expect(probe.target === '' || probe.source.indexOf(probe.target) < 0).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'countOccurrences ' + probe.label + ' -> ' + actual);
      }
      expect(OCCURRENCE_PROBES.length).assertEqual(15);
      expect(BasicUtil.countOccurrences('abc', 'abc')).assertEqual(1);
      expect(BasicUtil.countOccurrences('abc', 'abcd')).assertEqual(0);
      expect(BasicUtil.countOccurrences('', '')).assertEqual(0);
      expect(BasicUtil.countOccurrences('abcabc', 'bc')).assertEqual(2);
      expect(OCCURRENCE_PROBES[0].target).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_1400
     * @tc.name      testCountOccurrencesEmptyTarget0001
     * @tc.desc      Verify an empty target always yields zero, while a target equal to the source yields
     *               exactly one and a single character target counts every character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCountOccurrencesEmptyTarget0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCountOccurrencesEmptyTarget0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const sources: string[] = ['', 'a', 'geofence', '围栏围栏', 'a b c'];
      for (let i = 0; i < sources.length; i++) {
        // An empty target is defined as zero matches for every source shape.
        expect(BasicUtil.countOccurrences(sources[i], '')).assertEqual(0);
        // The reverse direction also reports zero when the source is empty.
        expect(BasicUtil.countOccurrences('', sources[i])).assertEqual(0);
      }
      expect(sources.length).assertEqual(5);
      expect(BasicUtil.isBlank('')).assertTrue();
      expect(BasicUtil.countOccurrences('geofence', 'geofence')).assertEqual(1);
      expect(BasicUtil.countOccurrences('geofence', 'geofenceX')).assertEqual(0);
      expect(BasicUtil.countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(BasicUtil.countOccurrences('abcabc', 'a')).assertEqual(2);
      expect(BasicUtil.countOccurrences('a b c', ' ')).assertEqual(2);
      expect(BasicUtil.countOccurrences('', '')).assertEqual(0);
      expect(BasicUtil.countOccurrences('', 'a')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_1500
     * @tc.name      testCountOccurrencesOverlap0001
     * @tc.desc      Verify overlap samples are counted as non-overlapping matches so the cursor always
     *               advances by the target length after each hit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCountOccurrencesOverlap0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCountOccurrencesOverlap0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 'aaaa' with 'aa' can only match twice because matches may not overlap.
      expect(BasicUtil.countOccurrences('aaaa', 'aa')).assertEqual(2);
      expect(BasicUtil.countOccurrences('aaaaa', 'aa')).assertEqual(2);
      expect(BasicUtil.countOccurrences('aaaaaa', 'aa')).assertEqual(3);
      expect(BasicUtil.countOccurrences('aaa', 'aa')).assertEqual(1);
      expect(BasicUtil.countOccurrences('ababab', 'aba')).assertEqual(1);
      expect(BasicUtil.countOccurrences('abababa', 'aba')).assertEqual(2);
      expect(BasicUtil.countOccurrences('哈哈哈', '哈哈')).assertEqual(1);
      expect(BasicUtil.countOccurrences('哈哈哈哈', '哈哈')).assertEqual(2);
      // The number of overlapping hits is always greater than or equal to the reported count.
      const overlapping: number = 3;
      expect(BasicUtil.countOccurrences('aaaa', 'aa') <= overlapping).assertTrue();
      expect(BasicUtil.countOccurrences('abab', 'ab')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_1600
     * @tc.name      testCountOccurrencesLongText0001
     * @tc.desc      Verify countOccurrences stays exact on a 1000 character payload for several target
     *               lengths including one that never appears.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCountOccurrencesLongText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCountOccurrencesLongText0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const body: string = 'ab'.repeat(500);
      expect(body.length).assertEqual(1000);
      expect(BasicUtil.countOccurrences(body, 'a')).assertEqual(500);
      expect(BasicUtil.countOccurrences(body, 'b')).assertEqual(500);
      expect(BasicUtil.countOccurrences(body, 'ab')).assertEqual(500);
      expect(BasicUtil.countOccurrences(body, 'ba')).assertEqual(499);
      expect(BasicUtil.countOccurrences(body, 'abab')).assertEqual(250);
      expect(BasicUtil.countOccurrences(body, 'cd')).assertEqual(0);
      expect(BasicUtil.countOccurrences(body, body)).assertEqual(1);
      expect(BasicUtil.countOccurrences(body + 'ab', 'ba')).assertEqual(500);
      expect(BasicUtil.countOccurrences(body, 'ababab')).assertEqual(166);
      expect(BasicUtil.countOccurrences(body, '')).assertEqual(0);
      expect(BasicUtil.reverseString(BasicUtil.reverseString(body))).assertEqual(body);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_1700
     * @tc.name      testRemoveDuplicatesStringMatrix0001
     * @tc.desc      Verify removeDuplicates keeps the first appearance order while the emptiness helpers
     *               classify the deduplicated result correctly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRemoveDuplicatesStringMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRemoveDuplicatesStringMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const values: string[] = ['b', 'a', 'b', '', '  ', 'a', '围栏', '围栏', '\t'];
      const unique: string[] = BasicUtil.removeDuplicates(values);
      expect(values.length).assertEqual(9);
      expect(unique.length).assertEqual(6);
      expect(unique[0]).assertEqual('b');
      expect(unique[1]).assertEqual('a');
      expect(unique[2]).assertEqual('');
      expect(unique[3]).assertEqual('  ');
      expect(unique[4]).assertEqual('围栏');
      expect(unique[5]).assertEqual('\t');
      let emptyCount: number = 0;
      let blankCount: number = 0;
      for (let i = 0; i < unique.length; i++) {
        if (BasicUtil.isEmptyString(unique[i])) {
          emptyCount = emptyCount + 1;
        }
        if (BasicUtil.isBlank(unique[i])) {
          blankCount = blankCount + 1;
        }
      }
      // Only the preserved empty entry is empty, three entries are blank.
      expect(emptyCount).assertEqual(1);
      expect(blankCount).assertEqual(3);
      expect(BasicUtil.removeDuplicates([]).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_1800
     * @tc.name      testSafeJoinMatrix0001
     * @tc.desc      Verify safeJoin drops empty entries before joining and composes with trimSafe and
     *               reverseString on the joined text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSafeJoinMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSafeJoinMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.safeJoin(['a', '', 'b', '', 'c'], '-')).assertEqual('a-b-c');
      expect(BasicUtil.safeJoin(['', '', ''], '-')).assertEqual('');
      expect(BasicUtil.safeJoin([], '-')).assertEqual('');
      expect(BasicUtil.safeJoin(['x'], '-')).assertEqual('x');
      // Only empty strings are dropped, whitespace-only entries survive the join.
      expect(BasicUtil.safeJoin([' ', 'a', ' '], '|')).assertEqual(' |a| ');
      expect(BasicUtil.safeJoin(['围栏', '', '区域'], '/')).assertEqual('围栏/区域');
      expect(BasicUtil.countOccurrences(BasicUtil.safeJoin(['a', '', 'b', '', 'c'], '-'), '-')).assertEqual(2);
      expect(BasicUtil.reverseString(BasicUtil.safeJoin(['ab', '', 'cd'], '-'))).assertEqual('dc-ba');
      expect(BasicUtil.trimSafe(' ' + BasicUtil.safeJoin(['  a  ', '', 'b'], ',') + ' ')).assertEqual('a  ,b');
      expect(BasicUtil.safeJoin(['a', 'b'], '')).assertEqual('ab');
      expect(BasicUtil.safeJoin(['a'], '')).assertEqual('a');
      expect(BasicUtil.safeJoin(['', 'a'], ':')).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_1900
     * @tc.name      testBooleanToFlagMatrix0001
     * @tc.desc      Verify booleanToFlag maps the emptiness and blankness verdicts onto the 0/1 convention
     *               and that the flags can be summed back to the number of true verdicts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBooleanToFlagMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBooleanToFlagMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.booleanToFlag(true)).assertEqual(1);
      expect(BasicUtil.booleanToFlag(false)).assertEqual(0);
      let blankFlags: number = 0;
      let emptyFlags: number = 0;
      for (let i = 0; i < EMPTY_PROBES.length; i++) {
        const probe: EmptyProbe = EMPTY_PROBES[i];
        const empty: boolean = probe.isMissing ? BasicUtil.isEmptyString(undefined) : BasicUtil.isEmptyString(probe.value);
        const blank: boolean = probe.isMissing ? BasicUtil.isBlank(undefined) : BasicUtil.isBlank(probe.value);
        const emptyFlag: number = BasicUtil.booleanToFlag(empty);
        const blankFlag: number = BasicUtil.booleanToFlag(blank);
        expect(emptyFlag === 0 || emptyFlag === 1).assertTrue();
        expect(blankFlag === 0 || blankFlag === 1).assertTrue();
        expect(blankFlag >= emptyFlag).assertTrue();
        emptyFlags = emptyFlags + emptyFlag;
        blankFlags = blankFlags + blankFlag;
      }
      // Two samples are empty, eight samples are blank.
      expect(emptyFlags).assertEqual(2);
      expect(blankFlags).assertEqual(8);
      expect(EMPTY_PROBES.length).assertEqual(14);
      // The two truth tables must agree on every flag combination.
      expect(BasicUtil.booleanToFlag(BasicUtil.isBlank(' '))).assertEqual(1);
      expect(BasicUtil.booleanToFlag(BasicUtil.isEmptyString(' '))).assertEqual(0);
      expect(BasicUtil.booleanToFlag(BasicUtil.isBlank('x'))).assertEqual(0);
      expect(BasicUtil.booleanToFlag(BasicUtil.isEmptyString('x'))).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_2000
     * @tc.name      testUnicodeChineseMatrix0001
     * @tc.desc      Verify the string helpers behave consistently on Chinese payloads including
     *               capitalization, reversal, counting and blankness classification.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testUnicodeChineseMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testUnicodeChineseMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string = '地理围栏';
      expect(text.length).assertEqual(4);
      expect(BasicUtil.isEmptyString(text)).assertFalse();
      expect(BasicUtil.isBlank(text)).assertFalse();
      expect(BasicUtil.capitalize(text)).assertEqual(text);
      expect(BasicUtil.reverseString(text)).assertEqual('栏围理地');
      expect(BasicUtil.countOccurrences(text, '围栏')).assertEqual(1);
      expect(BasicUtil.countOccurrences(text, '地')).assertEqual(1);
      expect(BasicUtil.countOccurrences(text, '安全')).assertEqual(0);
      expect(BasicUtil.trimSafe('  地理围栏 ')).assertEqual(text);
      expect(BasicUtil.isBlank('　')).assertTrue();
      expect(BasicUtil.reverseString(BasicUtil.reverseString(text))).assertEqual(text);
      expect(BasicUtil.safeJoin(['地理', '', '围栏'], '')).assertEqual('地理围栏');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_2100
     * @tc.name      testDigitSymbolMatrix0001
     * @tc.desc      Verify the string helpers treat digits and symbols as ordinary content while
     *               emptiness, blankness, reversal and counting stay deterministic.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDigitSymbolMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDigitSymbolMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const digits: string = '0123456789';
      expect(BasicUtil.isEmptyString(digits)).assertFalse();
      expect(BasicUtil.isBlank(digits)).assertFalse();
      expect(BasicUtil.capitalize(digits)).assertEqual(digits);
      expect(BasicUtil.reverseString(digits)).assertEqual('9876543210');
      expect(BasicUtil.countOccurrences(digits, '0')).assertEqual(1);
      expect(BasicUtil.countOccurrences(digits, '00')).assertEqual(0);
      expect(BasicUtil.trimSafe('  42  ')).assertEqual('42');
      const symbols: string = '+-*/=<>';
      expect(symbols.length).assertEqual(7);
      expect(BasicUtil.reverseString(symbols)).assertEqual('><=/*-+');
      expect(BasicUtil.capitalize(symbols)).assertEqual(symbols);
      expect(BasicUtil.countOccurrences('--++--', '--')).assertEqual(2);
      expect(BasicUtil.isBlank('-')).assertFalse();
      expect(BasicUtil.isEmptyString('-')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_2200
     * @tc.name      testValidateEmailStringMatrix0001
     * @tc.desc      Verify isValidEmail classifies legal, blank, trimmed and malformed address samples so
     *               the string helpers and the validators agree on blank input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateEmailStringMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateEmailStringMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.isValidEmail('user@example.com')).assertTrue();
      expect(BasicUtil.isValidEmail('a.b@sub.example.cn')).assertTrue();
      expect(BasicUtil.isValidEmail('')).assertFalse();
      expect(BasicUtil.isValidEmail('  ')).assertFalse();
      expect(BasicUtil.isBlank('  ')).assertTrue();
      expect(BasicUtil.isValidEmail('user@')).assertFalse();
      expect(BasicUtil.isValidEmail('@example.com')).assertFalse();
      expect(BasicUtil.isValidEmail('user@example')).assertFalse();
      expect(BasicUtil.isValidEmail(' user@example.com')).assertFalse();
      // A padded address only validates after trimSafe is applied.
      expect(BasicUtil.isValidEmail(BasicUtil.trimSafe('  user@example.com  '))).assertTrue();
      expect(BasicUtil.countOccurrences('user@example.com', '@')).assertEqual(1);
      expect(BasicUtil.reverseString('moc.elpmaxe@resu')).assertEqual('user@example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_2300
     * @tc.name      testStringMatrixSummary0001
     * @tc.desc      Verify the aggregate counts implied by the probe tables so every table row is
     *               exercised at least once by the suite.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringMatrixSummary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringMatrixSummary0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(EMPTY_PROBES.length).assertEqual(14);
      expect(TRIM_PROBES.length).assertEqual(14);
      expect(CAPITALIZE_PROBES.length).assertEqual(12);
      expect(REVERSE_PROBES.length).assertEqual(12);
      expect(OCCURRENCE_PROBES.length).assertEqual(15);
      let missingSamples: number = 0;
      for (let i = 0; i < EMPTY_PROBES.length; i++) {
        if (EMPTY_PROBES[i].isMissing) {
          missingSamples = missingSamples + 1;
        }
      }
      expect(missingSamples).assertEqual(1);
      let occurrenceZero: number = 0;
      for (let i = 0; i < OCCURRENCE_PROBES.length; i++) {
        if (OCCURRENCE_PROBES[i].expected === 0) {
          occurrenceZero = occurrenceZero + 1;
        }
      }
      // Four rows expect zero occurrences: emptyTarget, emptySource, bothEmpty, absent.
      expect(occurrenceZero).assertEqual(4);
      let reversedEqual: number = 0;
      for (let i = 0; i < REVERSE_PROBES.length; i++) {
        if (REVERSE_PROBES[i].value === REVERSE_PROBES[i].expected) {
          reversedEqual = reversedEqual + 1;
        }
      }
      expect(reversedEqual).assertEqual(3);
      let blankSamples: number = 0;
      for (let i = 0; i < EMPTY_PROBES.length; i++) {
        if (EMPTY_PROBES[i].isBlank) {
          blankSamples = blankSamples + 1;
        }
      }
      // Two empty samples plus six whitespace samples are blank.
      expect(blankSamples).assertEqual(8);
      expect(TRIM_PROBES[0].trimmedLength).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_2400
     * @tc.name      testUnicodeCodePointMatrix0001
     * @tc.desc      Verify Unicode reversal preserves surrogate pairs and capitalize keeps an astral prefix unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testUnicodeCodePointMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testUnicodeCodePointMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single astral emoji occupies two UTF-16 code units.
      const emoji: string = '\u{1F4CD}';
      expect(emoji.length).assertEqual(2);
      expect(BasicUtil.isEmptyString(emoji)).assertFalse();
      expect(BasicUtil.isBlank(emoji)).assertFalse();
      const mirrored: string = BasicUtil.reverseString(emoji);
      expect(mirrored.length).assertEqual(2);
      expect(mirrored).assertEqual(emoji);
      // A second reverse restores the original pair.
      expect(BasicUtil.reverseString(mirrored)).assertEqual(emoji);
      // Capitalize keeps the leading surrogate untouched and preserves the length.
      const capitalized: string = BasicUtil.capitalize(emoji + 'ab');
      expect(capitalized.length).assertEqual(4);
      expect(capitalized.substring(2)).assertEqual('ab');
      // Counting works on code units too, so the pair counts as one match.
      expect(BasicUtil.countOccurrences(emoji + '|' + emoji, emoji)).assertEqual(2);
      expect(BasicUtil.countOccurrences(emoji, '\u{1F4CD}')).assertEqual(1);
      // The trimmed assiu mode emoji only sample keeps its code units.
      expect(BasicUtil.trimSafe(' ' + emoji + ' ')).assertEqual(emoji);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_2500
     * @tc.name      testLongTextMillionMatrix0001
     * @tc.desc      Verify the string helpers stay linear on a 2000 character repeated sample covering
     *               counting, trimming, reversing and blank detection at scale.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLongTextMillionMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLongTextMillionMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let longText: string = '';
      for (let i = 0; i < 250; i++) {
        longText = longText + 'geofence';
      }
      expect(longText.length).assertEqual(2000);
      expect(BasicUtil.isEmptyString(longText)).assertFalse();
      expect(BasicUtil.isBlank(longText)).assertFalse();
      expect(BasicUtil.countOccurrences(longText, 'geofence')).assertEqual(250);
      expect(BasicUtil.countOccurrences(longText, 'fence')).assertEqual(250);
      expect(BasicUtil.countOccurrences(longText, 'Geo')).assertEqual(0);
      expect(BasicUtil.capitalize(longText)).assertEqual('G' + longText.substring(1));
      const reversed: string = BasicUtil.reverseString(longText);
      expect(reversed.length).assertEqual(2000);
      expect(BasicUtil.reverseString(reversed)).assertEqual(longText);
      const padded: string = '   ' + longText + '   ';
      expect(BasicUtil.trimSafe(padded)).assertEqual(longText);
      expect(BasicUtil.trimSafe(padded).length).assertEqual(2000);
      // An all-whitespace sample of the same scale is deleted by trim.
      let blanks: string = '';
      for (let i = 0; i < 2000; i++) {
        blanks = blanks + ' ';
      }
      expect(BasicUtil.isBlank(blanks)).assertTrue();
      expect(BasicUtil.trimSafe(blanks)).assertEqual('');
      expect(BasicUtil.isEmptyString(blanks)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_2600
     * @tc.name      testSafeJoinTrimmingMatrix0001
     * @tc.desc      Verify safeJoin drops empty entries only, keeps blank entries and honours the
     *               separator while removeDuplicates keeps the first appearance order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSafeJoinTrimmingMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSafeJoinTrimmingMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.safeJoin([], ',')).assertEqual('');
      expect(BasicUtil.safeJoin(['a'], ',')).assertEqual('a');
      expect(BasicUtil.safeJoin(['a', 'b', 'c'], ',')).assertEqual('a,b,c');
      expect(BasicUtil.safeJoin(['a', '', 'b'], ',')).assertEqual('a,b');
      expect(BasicUtil.safeJoin(['', '', ''], ',')).assertEqual('');
      expect(BasicUtil.safeJoin(['a', ' ', 'b'], ',')).assertEqual('a, ,b');
      expect(BasicUtil.safeJoin(['a', 'b'], '')).assertEqual('ab');
      expect(BasicUtil.safeJoin([' a ', ' b '], '|')).assertEqual(' a | b ');
      // safeJoin does not trim entries, trimSafe has to be applied by the caller.
      const raw: string[] = [' a ', '', ' b '];
      const trimmed: string[] = [];
      for (let i = 0; i < raw.length; i++) {
        if (!BasicUtil.isEmptyString(raw[i])) {
          trimmed.push(BasicUtil.trimSafe(raw[i]));
        }
      }
      expect(BasicUtil.safeJoin(trimmed, '-')).assertEqual('a-b');
      expect(BasicUtil.removeDuplicates(['a', 'a', 'b']).length).assertEqual(2);
      expect(BasicUtil.removeDuplicates(['a', 'b', 'a'])[0]).assertEqual('a');
      expect(BasicUtil.removeDuplicates([]).length).assertEqual(0);
      expect(BasicUtil.removeDuplicates(['x', 'y'])[1]).assertEqual('y');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_2700
     * @tc.name      testFlagAndPercentStringMatrix0001
     * @tc.desc      Verify booleanToFlag maps booleans onto 0/1 and formatPercent output text follows
     *               the lowercase percent suffix contract.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFlagAndPercentStringMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFlagAndPercentStringMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.booleanToFlag(true)).assertEqual(1);
      expect(BasicUtil.booleanToFlag(false)).assertEqual(0);
      expect(BasicUtil.booleanToFlag(BasicUtil.isBlank('   '))).assertEqual(1);
      expect(BasicUtil.booleanToFlag(BasicUtil.isEmptyString(''))).assertEqual(1);
      expect(BasicUtil.booleanToFlag(BasicUtil.isEmptyString('a'))).assertEqual(0);
      expect(BasicUtil.formatPercent(0.25)).assertEqual('25.0%');
      expect(BasicUtil.formatPercent(0.256, 0)).assertEqual('26%');
      expect(BasicUtil.formatPercent(0.256, 2)).assertEqual('25.60%');
      expect(BasicUtil.formatPercent(1)).assertEqual('100.0%');
      expect(BasicUtil.formatPercent(0)).assertEqual('0.0%');
      expect(BasicUtil.countOccurrences('100.0%', '.')).assertEqual(1);
      expect(BasicUtil.countOccurrences('100.0%', '%')).assertEqual(1);
      expect(BasicUtil.trimSafe('  50%  ')).assertEqual('50%');
      expect(BasicUtil.reverseString('50%')).assertEqual('%05');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_2800
     * @tc.name      testOverlapAndCompoundMatrix0001
     * @tc.desc      Verify countOccurrences advances past each match so overlapping targets are counted
     *               once and compound samples keep deterministic totals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOverlapAndCompoundMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testOverlapAndCompoundMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.countOccurrences('aaaa', 'aaa')).assertEqual(1);
      expect(BasicUtil.countOccurrences('aaaaa', 'aaa')).assertEqual(1);
      expect(BasicUtil.countOccurrences('aaaaaa', 'aaa')).assertEqual(2);
      expect(BasicUtil.countOccurrences('aaaa', 'a')).assertEqual(4);
      expect(BasicUtil.countOccurrences('aaaa', 'aa')).assertEqual(2);
      expect(BasicUtil.countOccurrences('abababa', 'aba')).assertEqual(2);
      expect(BasicUtil.countOccurrences('abcabcab', 'abc')).assertEqual(2);
      expect(BasicUtil.countOccurrences('0.1.0.1', '.')).assertEqual(3);
      // The same totals are reachable through the probe table.
      for (let i = 0; i < OCCURRENCE_PROBES.length; i++) {
        const probe: OccurrenceProbe = OCCURRENCE_PROBES[i];
        const actual: number = BasicUtil.countOccurrences(probe.source, probe.target);
        expect(actual).assertEqual(probe.expected);
        // Any positive count means the source must be non-empty.
        if (probe.expected > 0) {
          expect(probe.source.length > 0).assertTrue();
          expect(probe.target.length > 0).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_2900
     * @tc.name      testPhoneIdCardStringMatrix0001
     * @tc.desc      Verify isValidPhoneCN and isValidIdCardCN reject blank and padded samples so the
     *               string helpers and the validators agree on whitespace handling.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPhoneIdCardStringMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPhoneIdCardStringMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.isValidPhoneCN('13800138000')).assertTrue();
      expect(BasicUtil.isValidPhoneCN('19912345678')).assertTrue();
      expect(BasicUtil.isValidPhoneCN('')).assertFalse();
      expect(BasicUtil.isValidPhoneCN('   ')).assertFalse();
      expect(BasicUtil.isValidPhoneCN('1380013800')).assertFalse();
      expect(BasicUtil.isValidPhoneCN('138001380000')).assertFalse();
      expect(BasicUtil.isValidPhoneCN(' 13800138000')).assertFalse();
      expect(BasicUtil.isValidPhoneCN(BasicUtil.trimSafe(' 13800138000 '))).assertTrue();
      expect(BasicUtil.isValidIdCardCN('11010519491231002X')).assertTrue();
      expect(BasicUtil.isValidIdCardCN('')).assertFalse();
      expect(BasicUtil.isBlank('')).assertTrue();
      expect(BasicUtil.isValidIdCardCN('110105194912310021')).assertFalse();
      expect(BasicUtil.isValidIdCardCN(BasicUtil.trimSafe(' 11010519491231002X '))).assertTrue();
      expect(BasicUtil.countOccurrences('11010519491231002X', '1')).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_3000
     * @tc.name      testWhitespaceFamilyMatrix0001
     * @tc.desc      Verify isBlank and trimSafe treat space, tab, carriage return and line feed as
     *               whitespace while a non-breaking space is only trimmed by the runtime trim.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testWhitespaceFamilyMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testWhitespaceFamilyMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.isBlank(' ')).assertTrue();
      expect(BasicUtil.isBlank('\t')).assertTrue();
      expect(BasicUtil.isBlank('\n')).assertTrue();
      expect(BasicUtil.isBlank('\r')).assertTrue();
      expect(BasicUtil.isBlank('\r\n')).assertTrue();
      expect(BasicUtil.isBlank(' \t\n\r ')).assertTrue();
      expect(BasicUtil.isBlank('\t\t\t')).assertTrue();
      expect(BasicUtil.isBlank('a\tb')).assertFalse();
      expect(BasicUtil.isBlank('\n\na')).assertFalse();
      expect(BasicUtil.trimSafe('\t\na b\r\n')).assertEqual('a b');
      expect(BasicUtil.trimSafe('\n')).assertEqual('');
      expect(BasicUtil.trimSafe('\t')).assertEqual('');
      expect(BasicUtil.countOccurrences('a\tb\tc', '\t')).assertEqual(2);
      expect(BasicUtil.countOccurrences('a\nb\nc', '\n')).assertEqual(2);
      expect(BasicUtil.reverseString('a\tb')).assertEqual('b\ta');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICSTR_3100
     * @tc.name      testBoundaryLengthMatrix0001
     * @tc.desc      Verify single character and two character samples keep every helper deterministic
     *               across emptiness, trimming, capitalization, reversal and counting.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBoundaryLengthMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBoundaryLengthMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.isEmptyString(' ')).assertFalse();
      expect(BasicUtil.isBlank(' ')).assertTrue();
      expect(BasicUtil.trimSafe(' ')).assertEqual('');
      expect(BasicUtil.trimSafe(' a ')).assertEqual('a');
      expect(BasicUtil.capitalize('a')).assertEqual('A');
      expect(BasicUtil.capitalize('ab')).assertEqual('Ab');
      expect(BasicUtil.capitalize(' a')).assertEqual(' a');
      expect(BasicUtil.reverseString('a')).assertEqual('a');
      expect(BasicUtil.reverseString('ab')).assertEqual('ba');
      expect(BasicUtil.countOccurrences('a', 'a')).assertEqual(1);
      expect(BasicUtil.countOccurrences('a', 'b')).assertEqual(0);
      expect(BasicUtil.countOccurrences('ab', 'ba')).assertEqual(0);
      expect(BasicUtil.countOccurrences('aa', 'a')).assertEqual(2);
      expect(BasicUtil.safeJoin(['a', 'b'], '+')).assertEqual('a+b');
      expect(BasicUtil.removeDuplicates(['a', 'b']).length).assertEqual(2);
      expect(BasicUtil.safeJoin(['  '], ',')).assertEqual('  ');
      expect(BasicUtil.isBlank(BasicUtil.trimSafe('   '))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
