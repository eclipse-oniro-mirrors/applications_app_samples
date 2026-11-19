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
import {
  ERR_INVALID_PARAM,
  GC_STAT_KEYS,
  gcStat,
  GcSnapshot,
  KEY_BYTES_ALLOCATED,
  KEY_BYTES_FREED,
  KEY_FULL_GC_LONG,
  KEY_GC_COUNT,
  KEY_GC_TIME,
  statErrorCode
} from './shared/GcProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

// Every key in this suite is expected to be rejected with the documented 401 parameter error. The family tables
// below therefore only record how a key was generated; the assertions check the error code, the fact that the
// five documented keys keep answering afterwards and that the counters are never reset by the failing calls.
const EMPTY_TEXT: string = '';
const KEY_PREFIX: string = 'ark.gc.';
const FIRST_DOT_INDEX: number = 3;
const SECOND_DOT_INDEX: number = 6;
const SUCCESS_CODE: number = 0;
const INVALID_CODE: number = ERR_INVALID_PARAM;
const DOCUMENTED_INVALID_CODE: number = 401;
const STAT_COUNT: number = 5;
const ZERO_DELTA: number = 0;
const ALLOCATED_INDEX: number = 2;
const ALLOCATION_BOUND_BYTES: number = 33554432;
const TABLE_SIZE_ONE: number = 1;
const TABLE_SIZE_TWO: number = 2;
const TABLE_SIZE_THREE: number = 3;
const TABLE_SIZE_FOUR: number = 4;
const TABLE_SIZE_FIVE: number = 5;
const TABLE_SIZE_SIX: number = 6;
const TABLE_SIZE_SEVEN: number = 7;
const TABLE_SIZE_EIGHT: number = 8;
const TABLE_SIZE_NINE: number = 9;
const TABLE_SIZE_TEN: number = 10;

// A family describes one way of building rejected keys together with the code it must produce.
interface KeyFamily {
  label: string;
  keys: string[];
  expected: number;
}

class KeyFamilyData implements KeyFamily {
  label: string;
  keys: string[];
  expected: number;

  constructor(label: string, keys: string[], expected: number) {
    this.label = label;
    this.keys = keys;
    this.expected = expected;
  }
}

function codesOf(keys: string[]): number[] {
  return keys.map((key: string) => statErrorCode(key));
}

function matchesAllCodes(codes: number[], expected: number): boolean {
  return codes.length > ZERO_DELTA && codes.every((code: number) => code === expected);
}

function countsOf(codes: number[], expected: number): number {
  return codes.filter((code: number) => code === expected).length;
}

// asks every documented key again after the failing family ran, so a rejection cannot poison later reads
function validCodesAfter(keys: string[]): number[] {
  keys.forEach((key: string) => {
    statErrorCode(key);
  });
  return GC_STAT_KEYS.map((key: string) => statErrorCode(key));
}

function validValuesOk(): boolean {
  return GC_STAT_KEYS.every((key: string) => {
    const value: number = gcStat(key);
    return Number.isFinite(value) && value >= ZERO_DELTA;
  });
}

// counters are cumulative: a rejected key must never decrement or reset them
function failureDeltas(keys: string[]): number[] {
  const before: GcSnapshot = new GcSnapshot();
  keys.forEach((key: string) => {
    statErrorCode(key);
  });
  const after: GcSnapshot = new GcSnapshot();
  return [after.count - before.count, after.time - before.time, after.allocated - before.allocated,
    after.freed - before.freed, after.longFullGc - before.longFullGc];
}

function deltasKeptCounters(deltas: number[]): boolean {
  return deltas.length === STAT_COUNT && deltas.every((value: number) => value >= ZERO_DELTA);
}

function deltaWithinBound(deltas: number[]): boolean {
  const allocated: number = deltas[ALLOCATED_INDEX];
  return allocated >= ZERO_DELTA && allocated < ALLOCATION_BOUND_BYTES;
}

function familyCodes(family: KeyFamily): number[] {
  return codesOf(family.keys);
}

function familyRejected(family: KeyFamily): boolean {
  const codes: number[] = familyCodes(family);
  return matchesAllCodes(codes, family.expected);
}

function describeKeys(keys: string[]): string {
  return keys.map((key: string) => key.length).join(',');
}

function totalLength(keys: string[]): number {
  let total: number = ZERO_DELTA;
  keys.forEach((key: string) => {
    total += key.length;
  });
  return total;
}

function longestLength(keys: string[]): number {
  let best: number = ZERO_DELTA;
  keys.forEach((key: string) => {
    if (key.length > best) {
      best = key.length;
    }
  });
  return best;
}

function shortestLength(keys: string[]): number {
  let best: number = -1;
  keys.forEach((key: string) => {
    if (best < ZERO_DELTA || key.length < best) {
      best = key.length;
    }
  });
  return best;
}

function distinctCount(keys: string[]): number {
  const seen: string[] = [];
  keys.forEach((key: string) => {
    if (seen.indexOf(key) < ZERO_DELTA) {
      seen.push(key);
    }
  });
  return seen.length;
}

function nonEmptyCount(keys: string[]): number {
  return keys.filter((key: string) => key.length > ZERO_DELTA).length;
}

function includesValidKey(keys: string[]): boolean {
  return keys.some((key: string) => GC_STAT_KEYS.indexOf(key) >= ZERO_DELTA);
}

function spaces(count: number): string {
  return ' '.repeat(count);
}

function tabs(count: number): string {
  return '\t'.repeat(count);
}

function newlines(count: number): string {
  return '\n'.repeat(count);
}

function carriages(count: number): string {
  return '\r'.repeat(count);
}

function repeatText(unit: string, times: number): string {
  return unit.repeat(times);
}

function joinedText(unit: string, times: number, separator: string): string {
  const parts: string[] = [];
  for (let i = 0; i < times; i++) {
    parts.push(unit);
  }
  return parts.join(separator);
}

function mappedKeys(transform: (key: string) => string): string[] {
  return GC_STAT_KEYS.map((key: string) => transform(key));
}

function leafPart(key: string): string {
  return key.substring(KEY_PREFIX.length);
}

function headPart(key: string): string {
  return key.substring(0, KEY_PREFIX.length);
}

function upperAll(key: string): string {
  return key.toUpperCase();
}

function upperHeadSegment(key: string): string {
  return 'ARK' + key.substring(FIRST_DOT_INDEX);
}

function upperFamilySegment(key: string): string {
  return headPart(key).toUpperCase() + leafPart(key);
}

function upperLeafSegment(key: string): string {
  return KEY_PREFIX + leafPart(key).toUpperCase();
}

function titleCaseKey(key: string): string {
  const chunks: string[] = key.split('-');
  const titled: string[] = chunks.map((chunk: string) => chunk.split('.').map((segment: string) =>
    segment.charAt(0).toUpperCase() + segment.substring(1)).join('.'));
  return titled.join('-');
}

function upperAtEven(text: string): string {
  const chars: string[] = [];
  for (let i = 0; i < text.length; i++) {
    const ch: string = text.charAt(i);
    chars.push(i % 2 === 0 ? ch.toUpperCase() : ch);
  }
  return chars.join('');
}

function upperAtOdd(text: string): string {
  const chars: string[] = [];
  for (let i = 0; i < text.length; i++) {
    const ch: string = text.charAt(i);
    chars.push(i % 2 === 1 ? ch.toUpperCase() : ch);
  }
  return chars.join('');
}

function upperFirst(text: string): string {
  return text.charAt(0).toUpperCase() + text.substring(1);
}

function upperLast(text: string): string {
  return text.substring(0, text.length - 1) + text.charAt(text.length - 1).toUpperCase();
}

function upperAt(text: string, index: number): string {
  return text.substring(0, index) + text.charAt(index).toUpperCase() + text.substring(index + 1);
}

function swapChars(text: string, index: number): string {
  if (index <= ZERO_DELTA || index >= text.length) {
    return text;
  }
  return text.substring(0, index - 1) + text.charAt(index) + text.charAt(index - 1) + text.substring(index + 1);
}

function removeCharAt(text: string, index: number): string {
  return text.substring(0, index) + text.substring(index + 1);
}

function insertAt(text: string, index: number, extra: string): string {
  return text.substring(0, index) + extra + text.substring(index);
}

function replaceAll(text: string, from: string, to: string): string {
  return text.split(from).join(to);
}

function sliceOf(text: string, start: number, end: number): string {
  return text.substring(start, end);
}

function dropLast(text: string, count: number): string {
  return text.substring(0, text.length - count);
}

function dropFirst(text: string, count: number): string {
  return text.substring(count);
}

// ---------------------------------------------------------------------------------------------------------------
// Matrix tables. Each table is produced by a different generator, and no two tables share a generated key.
// ---------------------------------------------------------------------------------------------------------------

// family 1: empty and blank keys
const EMPTY_KEYS: string[] = [EMPTY_TEXT];
const CONTROL_CHAR_KEYS: string[] = ['\u0000', '\u0001', '\u0007', '\u001B'];
const SPACE_RUNS_SHORT: string[] = [spaces(1), spaces(2), spaces(3), spaces(4)];
const SPACE_RUNS_LONG: string[] = [spaces(5), spaces(6), spaces(7), spaces(8)];
const TAB_RUNS_SHORT: string[] = [tabs(1), tabs(2), tabs(3), tabs(4)];
const TAB_RUNS_LONG: string[] = [tabs(5), tabs(6), tabs(7), tabs(8)];
const LINE_BREAK_KEYS: string[] = [newlines(1), newlines(2), carriages(1), carriages(2)];
const MIXED_BLANK_KEYS: string[] = [spaces(2) + tabs(2), tabs(3) + spaces(3), newlines(3) + spaces(4),
  carriages(4) + tabs(5)];
const LONG_BLANK_RUNS: string[] = [spaces(9), tabs(9), newlines(9), carriages(9)];
const UNICODE_SPACE_KEYS: string[] = ['\u00A0', '\u2000', '\u2001', '\u3000'];
const UNICODE_SPACE_RUNS: string[] = ['\u00A0\u00A0', '\u2000\u2000', '\u2002\u2002', '\u3000\u3000'];
const INVISIBLE_KEYS: string[] = ['\u200B', '\u200C', '\u200D', '\u2060'];
const BYTE_ORDER_MARK_KEYS: string[] = ['\uFEFF', '\u200E', '\u200F', '\u061C'];

// family 2: upper case variants of the documented keys
const UPPER_ALL_KEYS: string[] = mappedKeys(upperAll);
const UPPER_HEAD_KEYS: string[] = mappedKeys(upperHeadSegment);
const UPPER_FAMILY_KEYS: string[] = mappedKeys(upperFamilySegment);
const UPPER_LEAF_KEYS: string[] = mappedKeys(upperLeafSegment);
const TITLE_CASE_KEYS: string[] = mappedKeys(titleCaseKey);

// family 3: case sensitivity at different positions
const EVEN_UPPER_KEYS: string[] = mappedKeys(upperAtEven);
const ODD_UPPER_KEYS: string[] = mappedKeys(upperAtOdd);
const FIRST_UPPER_KEYS: string[] = mappedKeys(upperFirst);
const LAST_UPPER_KEYS: string[] = mappedKeys(upperLast);
const SWAPPED_LEAD_KEYS: string[] = mappedKeys((key: string) => swapChars(key, 1));
const SWAPPED_MIDDLE_KEYS: string[] = mappedKeys((key: string) => swapChars(key, TABLE_SIZE_FIVE));
const DEEP_UPPER_KEYS: string[] = mappedKeys((key: string) => upperAt(key, 8));

// family 4: separators missing between segments
const NO_DOT_KEYS: string[] = mappedKeys((key: string) => replaceAll(key, '.', EMPTY_TEXT));
const NO_FIRST_DOT_KEYS: string[] = mappedKeys((key: string) => removeCharAt(key, FIRST_DOT_INDEX));
const NO_SECOND_DOT_KEYS: string[] = mappedKeys((key: string) => removeCharAt(key, SECOND_DOT_INDEX));
const HYPHENATED_DOTS_KEYS: string[] = mappedKeys((key: string) => replaceAll(key, '.', '-'));
const UNDERSCORE_DOTS_KEYS: string[] = mappedKeys((key: string) => replaceAll(key, '.', '_'));
const SPACED_DOTS_KEYS: string[] = mappedKeys((key: string) => replaceAll(key, '.', ' '));

// family 5: extra separators
const DOUBLE_FIRST_DOT_KEYS: string[] = mappedKeys((key: string) => insertAt(key, FIRST_DOT_INDEX, '.'));
const DOUBLE_SECOND_DOT_KEYS: string[] = mappedKeys((key: string) => insertAt(key, SECOND_DOT_INDEX, '.'));
const TRIPLE_FIRST_DOT_KEYS: string[] = mappedKeys((key: string) => insertAt(key, FIRST_DOT_INDEX, '..'));
const LEADING_DOT_KEYS: string[] = mappedKeys((key: string) => '.' + key);
const TRAILING_DOT_KEYS: string[] = mappedKeys((key: string) => key + '.');
const DOT_HEAVY_KEYS: string[] = mappedKeys((key: string) => replaceAll(key, '.', '...'));

// family 6: trailing suffixes
const HYPHEN_SUFFIX_KEYS: string[] = mappedKeys((key: string) => key + '-');
const LETTER_SUFFIX_KEYS: string[] = mappedKeys((key: string) => key + 's');
const DIGIT_SUFFIX_KEYS: string[] = mappedKeys((key: string) => key + '0');
const NAMESPACE_SUFFIX_KEYS: string[] = mappedKeys((key: string) => key + '.ark');
const UNDERSCORE_SUFFIX_KEYS: string[] = mappedKeys((key: string) => key + '_');
const SPACE_SUFFIX_KEYS: string[] = mappedKeys((key: string) => key + ' ');
const REPEATED_LEAF_SUFFIX_KEYS: string[] = mappedKeys((key: string) => key + '-' + leafPart(key));

// family 7: prefixes and truncated prefixes
const COUNT_PREFIX_KEYS: string[] = [sliceOf(KEY_GC_COUNT, 0, 1), sliceOf(KEY_GC_COUNT, 0, 2),
  sliceOf(KEY_GC_COUNT, 0, 3), sliceOf(KEY_GC_COUNT, 0, 4)];
const TIME_PREFIX_KEYS: string[] = [sliceOf(KEY_GC_TIME, 0, 5), sliceOf(KEY_GC_TIME, 0, 6),
  sliceOf(KEY_GC_TIME, 0, 7), sliceOf(KEY_GC_TIME, 0, 8)];
const ALLOCATED_PREFIX_KEYS: string[] = [sliceOf(KEY_BYTES_ALLOCATED, 0, 9), sliceOf(KEY_BYTES_ALLOCATED, 0, 12),
  sliceOf(KEY_BYTES_ALLOCATED, 0, 15), sliceOf(KEY_BYTES_ALLOCATED, 0, 18)];
const FREED_PREFIX_KEYS: string[] = [dropLast(KEY_BYTES_FREED, 1), dropLast(KEY_BYTES_FREED, 2),
  dropLast(KEY_BYTES_FREED, 4), dropLast(KEY_BYTES_FREED, 5)];
const FULL_GC_PREFIX_KEYS: string[] = [dropLast(KEY_FULL_GC_LONG, 2), dropLast(KEY_FULL_GC_LONG, 6),
  dropLast(KEY_FULL_GC_LONG, 10), dropLast(KEY_FULL_GC_LONG, 14)];
const COUNT_PREFIX_DEEP_KEYS: string[] = [dropLast(KEY_GC_COUNT, 1), dropLast(KEY_GC_COUNT, 2),
  dropLast(KEY_GC_COUNT, 3), dropLast(KEY_GC_COUNT, 4)];

// family 8: near miss keys built from small letter level mistakes
const TYPO_SWAP_KEYS: string[] = mappedKeys((key: string) => swapChars(key, key.length - 1));
const DOUBLE_LETTER_TYPO_KEYS: string[] = mappedKeys((key: string) =>
  insertAt(key, key.length - 1, key.charAt(key.length - 1)));
const HOMOGLYPH_ZERO_KEYS: string[] = ['ark.gc.gc-c0unt', 'ark.gc.gc-bytes-all0cated',
  'ark.gc.fullgc-l0ngtime-count', 'ark.gc.gc-byte5-freed'];
const CYRILLIC_KEYS: string[] = ['\u0430rk.gc.gc-count', 'ark.g\u0441.gc-count', 'ark.gc.gc-c\u043Eunt',
  'ark.gc.gc-bytes-\u0444reed'];
const DROPPED_LETTER_KEYS: string[] = mappedKeys((key: string) => removeCharAt(key, 10));
const DOUBLED_HYPHEN_KEYS: string[] = mappedKeys((key: string) => insertAt(key, 9, '-'));
const JOINED_LEAF_KEYS: string[] = mappedKeys((key: string) => replaceAll(key, '-', EMPTY_TEXT));
const EXTRA_SEGMENT_KEYS: string[] = mappedKeys((key: string) => KEY_PREFIX + 'gc.' + leafPart(key));

// family 9: non ASCII lookalikes and invisible marks
const ACCENTED_KEYS: string[] = ['\u00E1rk.gc.gc-count', 'ark.g\u00E7.gc-count', 'ark.gc.gc-c\u00F6unt',
  'ark.gc.gc-count\u00E9'];
const FULLWIDTH_KEYS: string[] = ['\uFF41\uFF52\uFF4B.gc.gc-count', 'ark\uFF0Egc\uFF0Egc-count',
  '\uFF41\uFF52\uFF4B\uFF0E\uFF47\uFF43\uFF0E\uFF47\uFF43\uFF0Dcount'];
const GREEK_KEYS: string[] = ['\u03B1rk.gc.gc-count', 'ark.\u03B3c.gc-count', 'ark.gc.gc-c\u03BFunt'];
const EMOJI_KEYS: string[] = ['\uD83D\uDE00ark.gc.gc-count', 'ark.gc.gc-count\uD83D\uDE00',
  '\uD83D\uDD25ark.gc.gc-count'];
const COMBINING_MARK_KEYS: string[] = ['a\u0301rk.gc.gc-count', 'ark.gc.gc-count\u0301', 'ark.gc.gc-cou\u0308nt'];
const BIDI_MARK_KEYS: string[] = ['\u202Aark.gc.gc-count', 'ark.gc.gc-count\u202C', '\u202Bark.gc.gc-count\u202C'];
const SURROGATE_EDGE_KEYS: string[] = ['\uD83Dark.gc.gc-count', 'ark.gc.gc-count\uDC00',
  '\uDBFF\uDFFFark.gc.gc-count'];

// family 10: very long keys
const LONG_FILL_KEYS: string[] = [repeatText('x', 1000), repeatText('y', 1000), repeatText('z', 1000),
  repeatText('w', 1000)];
const LONGER_FILL_KEYS: string[] = [repeatText('x', 2000), repeatText('y', 2500), repeatText('z', 3000),
  repeatText('w', 3500)];
const HUGE_FILL_KEYS: string[] = [repeatText('x', 4000), repeatText('y', 5000), repeatText('z', 6000),
  repeatText('w', 8000)];
const LONG_VALID_PREFIX_KEYS: string[] = mappedKeys((key: string) => key + repeatText('x', 512));
const LONG_SEGMENT_KEYS: string[] = mappedKeys((key: string) => joinedText(leafPart(key), 32, '.'));
const LONG_ARK_CHAIN_KEYS: string[] = [joinedText('ark', 300, '.'), joinedText('ark', 301, '.'),
  joinedText('ark.gc', 150, '.'), joinedText('ark.gc', 151, '.')];
const REPEATED_PUNCTUATION_KEYS: string[] = [repeatText('.', 1000), repeatText('.', 2000), repeatText('-', 1000),
  repeatText('_', 1000)];

// family 11: numeric strings
const SMALL_NUMBER_KEYS: string[] = ['0', '1', '2', '7', '9'];
const SIGNED_NUMBER_KEYS: string[] = ['-1', '+1', '+2', '-2', '-0'];
const DECIMAL_NUMBER_KEYS: string[] = ['0.0', '1.5', '3.14', '.5', '5.'];
const EXPONENT_NUMBER_KEYS: string[] = ['1e3', '1E9', '1e-3', '6.02e23', '0e0'];
const NON_NUMERIC_TOKEN_KEYS: string[] = ['NaN', 'Infinity', '-Infinity', 'null', 'undefined'];
const BASE_LITERAL_KEYS: string[] = ['0x1F', '0b1010', '0o17', '1_000', '3,14'];

// family 12: keys that mention the documented 401 code
const STATUS_CODE_KEYS: string[] = ['401', '0401', '401.0', '-401', '+401'];
const STATUS_CODE_TEXT_KEYS: string[] = ['error401', 'ErrorCode401', '401error'];
const DOCUMENTED_FAMILY_KEYS: string[] = ['ark.gc.gc-count:401', '401:ark.gc.gc-count', 'ark.gc.401', 'ark.401'];
const MIXED_FAMILY_KEYS: string[] = ['40l', '\u2003', '4O1', 'ark.gc.gc-count#'];
const ERROR_CODE_TYPE_KEYS: string[] = ['error', 'Error', 'ERROR', 'err401', 'code401'];
const ERROR_CODE_INTEGER_KEYS: string[] = ['4.01', '40.1', '401e0', '4,01', '4 01'];
const ERROR_CODE_DISTINCT_KEYS: string[] = ['success', 'ok', 'zero', 'none', 'blank'];
const ERROR_CODE_REPEAT_KEYS: string[] = ['gc-count', 'gc-time', 'gc-bytes-allocated', 'gc-bytes-freed'];

// family 13: the documented keys must keep answering after a failing family
const RECOVERY_BLANK_KEYS: string[] = [spaces(11), tabs(11), newlines(11), carriages(11)];
const RECOVERY_CASE_KEYS: string[] = mappedKeys((key: string) => upperAt(key, 12));
const RECOVERY_LONG_KEYS: string[] = mappedKeys((key: string) => key + repeatText('q', 700));
const RECOVERY_UNICODE_KEYS: string[] = mappedKeys((key: string) => '\u02C6' + key);
const RECOVERY_MIXED_KEYS: string[] = mappedKeys((key: string) => replaceAll(key, '.', '|'));

// family 14: failing calls must leave the cumulative counters untouched
const STABLE_BLANK_KEYS: string[] = [spaces(12), tabs(12), newlines(12), carriages(12)];
const STABLE_SUFFIX_KEYS: string[] = mappedKeys((key: string) => key + repeatText('k', 64));
const STABLE_DOTS_KEYS: string[] = mappedKeys((key: string) => replaceAll(key, '.', '..'));
const STABLE_NUMBER_KEYS: string[] = ['10', '11', '12', '13'];
const STABLE_UNICODE_KEYS: string[] = mappedKeys((key: string) => key + '\u00B4');

// family 15: mixed families checked through the KeyFamily interface
const COMPOSITE_MIX_KEYS: string[] = [spaces(13), 'ARK.GC.GC-T1ME', 'ark::gc::gc-count', repeatText('r', 900)];
const COMPOSITE_FAMILY_A_KEYS: string[] = ['\u0002', '\u0003', 'k', 'g'];
const COMPOSITE_FAMILY_B_KEYS: string[] = mappedKeys((key: string) => dropFirst(key, 2));
const COMPOSITE_FAMILY_C_KEYS: string[] = [sliceOf(KEY_GC_COUNT, 4, 11), sliceOf(KEY_GC_TIME, 5, 12),
  sliceOf(KEY_BYTES_ALLOCATED, 8, 18), sliceOf(KEY_BYTES_FREED, 9, 19), sliceOf(KEY_FULL_GC_LONG, 3, 16)];

export default function gcStatErrorMatrixTest() {
  describe('GcStatErrorMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_0100
     * @tc.name      testStatEmptyKey0001
     * @tc.desc      Ask for the empty statistic key and check the documented 401 rejection together with the count
     *               of blank entries
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatEmptyKey0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = EMPTY_KEYS;
      const codes: number[] = codesOf(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      const filled: number = nonEmptyCount(keys);
      logCase('testStatEmptyKey0001', `keyCount=${keys.length} rejected=${rejected} filled=${filled} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_ONE);
      expect(rejected).assertEqual(TABLE_SIZE_ONE);
      expect(filled).assertEqual(ZERO_DELTA);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
      expect(includesValidKey(keys)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_0200
     * @tc.name      testStatControlChar0002
     * @tc.desc      Ask for keys made only of control characters and check every one is rejected with 401
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatControlChar0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = CONTROL_CHAR_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const shortest: number = shortestLength(keys);
      logCase('testStatControlChar0002', `keyCount=${keys.length} distinct=${distinct} shortest=${shortest} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(distinct).assertEqual(TABLE_SIZE_FOUR);
      expect(shortest).assertEqual(TABLE_SIZE_ONE);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
      expect(countsOf(codes, SUCCESS_CODE)).assertEqual(ZERO_DELTA);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_0300
     * @tc.name      testStatSpaceRuns0003
     * @tc.desc      Ask for short runs of one to four spaces and check the whole run is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSpaceRuns0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = SPACE_RUNS_SHORT;
      const codes: number[] = codesOf(keys);
      const longest: number = longestLength(keys);
      const shortest: number = shortestLength(keys);
      logCase('testStatSpaceRuns0003', `keyCount=${keys.length} longest=${longest} shortest=${shortest} ` +
        `codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(shortest).assertEqual(TABLE_SIZE_ONE);
      expect(longest).assertEqual(TABLE_SIZE_FOUR);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
      expect(distinctCount(keys)).assertEqual(TABLE_SIZE_FOUR);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_0400
     * @tc.name      testStatSpaceRuns0004
     * @tc.desc      Ask for runs of five to eight spaces and check the growing length changes nothing about the
     *               rejection
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSpaceRuns0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = SPACE_RUNS_LONG;
      const codes: number[] = codesOf(keys);
      const shortest: number = shortestLength(keys);
      const longest: number = longestLength(keys);
      const total: number = totalLength(keys);
      logCase('testStatSpaceRuns0004', `keyCount=${keys.length} shortest=${shortest} longest=${longest} ` +
        `total=${total} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(shortest).assertEqual(TABLE_SIZE_FIVE);
      expect(longest).assertEqual(TABLE_SIZE_EIGHT);
      expect(total).assertEqual(TABLE_SIZE_FIVE + TABLE_SIZE_SIX + TABLE_SIZE_SEVEN + TABLE_SIZE_EIGHT);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_0500
     * @tc.name      testStatTabRuns0005
     * @tc.desc      Ask for short runs of tab characters and check the escape is not expanded into a valid key
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatTabRuns0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = TAB_RUNS_SHORT;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatTabRuns0005', `keyCount=${keys.length} distinct=${distinct} rejected=${rejected} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(distinct).assertEqual(TABLE_SIZE_FOUR);
      expect(rejected).assertEqual(keys.length);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_0600
     * @tc.name      testStatTabRuns0006
     * @tc.desc      Ask for longer tab runs and check the buffer is still refused as an unknown key
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatTabRuns0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = TAB_RUNS_LONG;
      const codes: number[] = codesOf(keys);
      const longest: number = longestLength(keys);
      const shortest: number = shortestLength(keys);
      const total: number = totalLength(keys);
      logCase('testStatTabRuns0006', `keyCount=${keys.length} shortest=${shortest} longest=${longest} ` +
        `total=${total} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(shortest).assertEqual(TABLE_SIZE_FIVE);
      expect(total > longest).assertTrue();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_0700
     * @tc.name      testStatLineBreak0007
     * @tc.desc      Ask for line feed and carriage return keys and check neither terminator is trimmed into an
     *               empty accepted key
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatLineBreak0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = LINE_BREAK_KEYS;
      const codes: number[] = codesOf(keys);
      const filled: number = nonEmptyCount(keys);
      const distinct: number = distinctCount(keys);
      logCase('testStatLineBreak0007', `keyCount=${keys.length} filled=${filled} distinct=${distinct} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(filled).assertEqual(TABLE_SIZE_FOUR);
      expect(distinct).assertEqual(TABLE_SIZE_FOUR);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_0800
     * @tc.name      testStatMixedBlank0008
     * @tc.desc      Ask for blank keys that mix spaces, tabs, line feeds and carriage returns and check every
     *               combination is refused
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatMixedBlank0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = MIXED_BLANK_KEYS;
      const codes: number[] = codesOf(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      const includesValid: boolean = includesValidKey(keys);
      logCase('testStatMixedBlank0008', `keyCount=${keys.length} rejected=${rejected} ` +
        `includesValid=${includesValid} lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(rejected).assertEqual(TABLE_SIZE_FOUR);
      expect(includesValid).assertFalse();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_0900
     * @tc.name      testStatLongBlank0009
     * @tc.desc      Ask for nine character blank runs and check a longer buffer still produces the same 401 code
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatLongBlank0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = LONG_BLANK_RUNS;
      const codes: number[] = codesOf(keys);
      const shortest: number = shortestLength(keys);
      const longest: number = longestLength(keys);
      const observed: number = INVALID_CODE;
      logCase('testStatLongBlank0009', `keyCount=${keys.length} shortest=${shortest} longest=${longest} ` +
        `observed=${observed} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(shortest).assertEqual(TABLE_SIZE_NINE);
      expect(longest).assertEqual(TABLE_SIZE_NINE);
      expect(countsOf(codes, observed)).assertEqual(TABLE_SIZE_FOUR);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_1000
     * @tc.name      testStatUnicodeSpace0010
     * @tc.desc      Ask for no break space and the three ideographic space widths and check none is treated as a
     *               pad character around a valid key
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatUnicodeSpace0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = UNICODE_SPACE_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const shortest: number = shortestLength(keys);
      logCase('testStatUnicodeSpace0010', `keyCount=${keys.length} distinct=${distinct} shortest=${shortest} ` +
        `codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(distinct).assertEqual(TABLE_SIZE_FOUR);
      expect(shortest).assertEqual(TABLE_SIZE_ONE);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_1100
     * @tc.name      testStatUnicodeSpaceRun0011
     * @tc.desc      Ask for doubled unicode spaces and check the doubled width does not make the key acceptable
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatUnicodeSpaceRun0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = UNICODE_SPACE_RUNS;
      const codes: number[] = codesOf(keys);
      const shortest: number = shortestLength(keys);
      const distinct: number = distinctCount(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatUnicodeSpaceRun0011', `keyCount=${keys.length} shortest=${shortest} distinct=${distinct} ` +
        `rejected=${rejected} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(shortest).assertEqual(TABLE_SIZE_TWO);
      expect(distinct).assertEqual(TABLE_SIZE_FOUR);
      expect(rejected).assertEqual(TABLE_SIZE_FOUR);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_1200
     * @tc.name      testStatInvisibleChar0012
     * @tc.desc      Ask for zero width and word joiner characters and check invisible input is never accepted
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatInvisibleChar0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = INVISIBLE_KEYS;
      const codes: number[] = codesOf(keys);
      const filled: number = nonEmptyCount(keys);
      const distinct: number = distinctCount(keys);
      logCase('testStatInvisibleChar0012', `keyCount=${keys.length} filled=${filled} distinct=${distinct} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(filled).assertEqual(TABLE_SIZE_FOUR);
      expect(distinct).assertEqual(TABLE_SIZE_FOUR);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
      expect(countsOf(codes, SUCCESS_CODE)).assertEqual(ZERO_DELTA);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_1300
     * @tc.name      testStatByteOrderMark0013
     * @tc.desc      Ask for the byte order mark and the three directional marks and check no mark is stripped before
     *               the lookup
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatByteOrderMark0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = BYTE_ORDER_MARK_KEYS;
      const codes: number[] = codesOf(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      const includesValid: boolean = includesValidKey(keys);
      logCase('testStatByteOrderMark0013', `keyCount=${keys.length} rejected=${rejected} ` +
        `includesValid=${includesValid} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(rejected).assertEqual(TABLE_SIZE_FOUR);
      expect(includesValid).assertFalse();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_1400
     * @tc.name      testStatUpperAll0014
     * @tc.desc      Ask for the fully upper case form of every documented key and check the lookup is case sensitive
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStatUpperAll0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const keys: string[] = UPPER_ALL_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatUpperAll0014', `keyCount=${keys.length} distinct=${distinct} rejected=${rejected} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
      expect(includesValidKey(keys)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_1500
     * @tc.name      testStatUpperHead0015
     * @tc.desc      Upper case only the leading ark segment of every key and check the mixed form is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatUpperHead0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = UPPER_HEAD_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const longest: number = longestLength(keys);
      logCase('testStatUpperHead0015', `keyCount=${keys.length} distinct=${distinct} longest=${longest} ` +
        `codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(longest >= TABLE_SIZE_TEN).assertTrue();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_1600
     * @tc.name      testStatUpperFamily0016
     * @tc.desc      Upper case the ark dot gc head of every key and check the leaf stays unreachable
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatUpperFamily0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = UPPER_FAMILY_KEYS;
      const codes: number[] = codesOf(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      const filled: number = nonEmptyCount(keys);
      logCase('testStatUpperFamily0016', `keyCount=${keys.length} rejected=${rejected} filled=${filled} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
      expect(filled).assertEqual(STAT_COUNT);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_1700
     * @tc.name      testStatUpperLeaf0017
     * @tc.desc      Upper case only the leaf name of every key and check the lower case namespace does not rescue it
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatUpperLeaf0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = UPPER_LEAF_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const shortest: number = shortestLength(keys);
      logCase('testStatUpperLeaf0017', `keyCount=${keys.length} distinct=${distinct} shortest=${shortest} ` +
        `codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(shortest > TABLE_SIZE_TEN).assertTrue();
      expect(countsOf(codes, INVALID_CODE)).assertEqual(STAT_COUNT);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_1800
     * @tc.name      testStatTitleCase0018
     * @tc.desc      Build title case variants that capitalise every dot segment and check the style is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatTitleCase0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = TITLE_CASE_KEYS;
      const codes: number[] = codesOf(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      const includesValid: boolean = includesValidKey(keys);
      logCase('testStatTitleCase0018', `keyCount=${keys.length} rejected=${rejected} ` +
        `includesValid=${includesValid} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
      expect(includesValid).assertFalse();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_1900
     * @tc.name      testStatEvenUpper0019
     * @tc.desc      Upper case every even index of each key and check the alternating style is not normalised
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatEvenUpper0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = EVEN_UPPER_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const longest: number = longestLength(keys);
      logCase('testStatEvenUpper0019', `keyCount=${keys.length} distinct=${distinct} longest=${longest} ` +
        `codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(longest > TABLE_SIZE_TEN).assertTrue();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_2000
     * @tc.name      testStatOddUpper0020
     * @tc.desc      Upper case every odd index of each key and check the second alternating style is rejected too
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatOddUpper0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = ODD_UPPER_KEYS;
      const codes: number[] = codesOf(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      const filled: number = nonEmptyCount(keys);
      logCase('testStatOddUpper0020', `keyCount=${keys.length} rejected=${rejected} filled=${filled} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
      expect(filled).assertEqual(STAT_COUNT);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_2100
     * @tc.name      testStatFirstUpper0021
     * @tc.desc      Upper case only the first character of each key and check a single capital is enough to miss
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatFirstUpper0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = FIRST_UPPER_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatFirstUpper0021', `keyCount=${keys.length} distinct=${distinct} rejected=${rejected} ` +
        `codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
      expect(includesValidKey(keys)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_2200
     * @tc.name      testStatLastUpper0022
     * @tc.desc      Upper case only the final character of each key and check the tail is not folded to lower case
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatLastUpper0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = LAST_UPPER_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const shortest: number = shortestLength(keys);
      logCase('testStatLastUpper0022', `keyCount=${keys.length} distinct=${distinct} shortest=${shortest} ` +
        `codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(shortest > TABLE_SIZE_TEN).assertTrue();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_2300
     * @tc.name      testStatSwapLead0023
     * @tc.desc      Swap the first two letters of every key and check the transposed prefix is unknown
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSwapLead0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = SWAPPED_LEAD_KEYS;
      const codes: number[] = codesOf(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      const includesValid: boolean = includesValidKey(keys);
      logCase('testStatSwapLead0023', `keyCount=${keys.length} rejected=${rejected} ` +
        `includesValid=${includesValid} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
      expect(includesValid).assertFalse();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_2400
     * @tc.name      testStatDeepUpper0024
     * @tc.desc      Upper case a single character deep inside each key and check one altered glyph is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatDeepUpper0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = DEEP_UPPER_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const filled: number = nonEmptyCount(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatDeepUpper0024', `keyCount=${keys.length} distinct=${distinct} filled=${filled} ` +
        `rejected=${rejected} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(filled).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_2500
     * @tc.name      testStatNoDot0025
     * @tc.desc      Remove every dot from each key and check the collapsed form has no chance of matching
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatNoDot0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = NO_DOT_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const total: number = totalLength(keys);
      logCase('testStatNoDot0025', `keyCount=${keys.length} distinct=${distinct} total=${total} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(total > ZERO_DELTA).assertTrue();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_2600
     * @tc.name      testStatNoFirstDot0026
     * @tc.desc      Drop the first dot of each key and check a missing segment separator is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatNoFirstDot0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = NO_FIRST_DOT_KEYS;
      const codes: number[] = codesOf(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      const includesValid: boolean = includesValidKey(keys);
      logCase('testStatNoFirstDot0026', `keyCount=${keys.length} rejected=${rejected} ` +
        `includesValid=${includesValid} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
      expect(includesValid).assertFalse();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_2700
     * @tc.name      testStatNoSecondDot0027
     * @tc.desc      Drop the second dot of each key and check the merged segment is not parsed back apart
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatNoSecondDot0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = NO_SECOND_DOT_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatNoSecondDot0027', `keyCount=${keys.length} distinct=${distinct} rejected=${rejected} ` +
        `codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_2800
     * @tc.name      testStatHyphenDots0028
     * @tc.desc      Replace the dots with hyphens and check a key that only differs in separators is refused
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatHyphenDots0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = HYPHENATED_DOTS_KEYS;
      const codes: number[] = codesOf(keys);
      const filled: number = nonEmptyCount(keys);
      const longest: number = longestLength(keys);
      logCase('testStatHyphenDots0028', `keyCount=${keys.length} filled=${filled} longest=${longest} ` +
        `codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(filled).assertEqual(STAT_COUNT);
      expect(longest > TABLE_SIZE_TEN).assertTrue();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_2900
     * @tc.name      testStatUnderscoreDots0029
     * @tc.desc      Replace the dots with underscores and check the underscore namespace is unknown
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatUnderscoreDots0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = UNDERSCORE_DOTS_KEYS;
      const codes: number[] = codesOf(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      const includesValid: boolean = includesValidKey(keys);
      logCase('testStatUnderscoreDots0029', `keyCount=${keys.length} rejected=${rejected} ` +
        `includesValid=${includesValid} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
      expect(includesValid).assertFalse();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_3000
     * @tc.name      testStatSpaceDots0030
     * @tc.desc      Replace the dots with spaces and check a spaced namespace is not trimmed into a valid key
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSpaceDots0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = SPACED_DOTS_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      const filled: number = nonEmptyCount(keys);
      logCase('testStatSpaceDots0030', `keyCount=${keys.length} distinct=${distinct} rejected=${rejected} ` +
        `filled=${filled} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
      expect(filled).assertEqual(STAT_COUNT);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_3100
     * @tc.name      testStatDoubleFirstDot0031
     * @tc.desc      Insert an extra dot after the ark segment and check the doubled separator is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatDoubleFirstDot0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = DOUBLE_FIRST_DOT_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const shortest: number = shortestLength(keys);
      logCase('testStatDoubleFirstDot0031', `keyCount=${keys.length} distinct=${distinct} shortest=${shortest} ` +
        `codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(shortest > TABLE_SIZE_TEN).assertTrue();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_3200
     * @tc.name      testStatDoubleSecondDot0032
     * @tc.desc      Insert an extra dot after the gc segment and check an empty middle segment is not skipped
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatDoubleSecondDot0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = DOUBLE_SECOND_DOT_KEYS;
      const codes: number[] = codesOf(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      const filled: number = nonEmptyCount(keys);
      logCase('testStatDoubleSecondDot0032', `keyCount=${keys.length} rejected=${rejected} filled=${filled} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
      expect(filled).assertEqual(STAT_COUNT);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_3300
     * @tc.name      testStatTripleFirstDot0033
     * @tc.desc      Insert two extra dots after the ark segment and check a tripled separator is still refused
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatTripleFirstDot0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = TRIPLE_FIRST_DOT_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const total: number = totalLength(keys);
      logCase('testStatTripleFirstDot0033', `keyCount=${keys.length} distinct=${distinct} total=${total} ` +
        `codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(total > ZERO_DELTA).assertTrue();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_3400
     * @tc.name      testStatLeadingDot0034
     * @tc.desc      Add a leading dot to each key and check a root prefixed name is not accepted
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatLeadingDot0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = LEADING_DOT_KEYS;
      const codes: number[] = codesOf(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      const includesValid: boolean = includesValidKey(keys);
      logCase('testStatLeadingDot0034', `keyCount=${keys.length} rejected=${rejected} ` +
        `includesValid=${includesValid} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
      expect(includesValid).assertFalse();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_3500
     * @tc.name      testStatTrailingDot0035
     * @tc.desc      Add a trailing dot to each key and check an empty trailing segment is not ignored
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatTrailingDot0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = TRAILING_DOT_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const longest: number = longestLength(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatTrailingDot0035', `keyCount=${keys.length} distinct=${distinct} longest=${longest} ` +
        `rejected=${rejected} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(longest > TABLE_SIZE_TEN).assertTrue();
      expect(rejected).assertEqual(STAT_COUNT);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_3600
     * @tc.name      testStatDotHeavy0036
     * @tc.desc      Replace each dot with three dots and check the dotted namespace is not normalised
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatDotHeavy0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = DOT_HEAVY_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const filled: number = nonEmptyCount(keys);
      logCase('testStatDotHeavy0036', `keyCount=${keys.length} distinct=${distinct} filled=${filled} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(filled).assertEqual(STAT_COUNT);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_3700
     * @tc.name      testStatHyphenSuffix0037
     * @tc.desc      Append a hyphen after each key and check the dangling separator is not trimmed away
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatHyphenSuffix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = HYPHEN_SUFFIX_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const includesValid: boolean = includesValidKey(keys);
      logCase('testStatHyphenSuffix0037', `keyCount=${keys.length} distinct=${distinct} ` +
        `includesValid=${includesValid} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(includesValid).assertFalse();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_3800
     * @tc.name      testStatLetterSuffix0038
     * @tc.desc      Append a letter after each key and check a plural looking name is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatLetterSuffix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = LETTER_SUFFIX_KEYS;
      const codes: number[] = codesOf(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      const longest: number = longestLength(keys);
      logCase('testStatLetterSuffix0038', `keyCount=${keys.length} rejected=${rejected} longest=${longest} ` +
        `codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
      expect(longest > TABLE_SIZE_TEN).assertTrue();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_3900
     * @tc.name      testStatDigitSuffix0039
     * @tc.desc      Append a digit after each key and check an indexed name is not accepted
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatDigitSuffix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = DIGIT_SUFFIX_KEYS;
      const codes: number[] = codesOf(keys);
      const filled: number = nonEmptyCount(keys);
      const distinct: number = distinctCount(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatDigitSuffix0039', `keyCount=${keys.length} filled=${filled} distinct=${distinct} ` +
        `rejected=${rejected} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(filled).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_4000
     * @tc.name      testStatNamespaceSuffix0040
     * @tc.desc      Append a dotted namespace after each key and check a nested name is refused
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatNamespaceSuffix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = NAMESPACE_SUFFIX_KEYS;
      const codes: number[] = codesOf(keys);
      const shortest: number = shortestLength(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatNamespaceSuffix0040', `keyCount=${keys.length} shortest=${shortest} rejected=${rejected} ` +
        `codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(shortest > TABLE_SIZE_TEN).assertTrue();
      expect(rejected).assertEqual(STAT_COUNT);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_4100
     * @tc.name      testStatUnderscoreSuffix0041
     * @tc.desc      Append an underscore after each key and check the trailing separator is part of the lookup
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatUnderscoreSuffix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = UNDERSCORE_SUFFIX_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const includesValid: boolean = includesValidKey(keys);
      logCase('testStatUnderscoreSuffix0041', `keyCount=${keys.length} distinct=${distinct} ` +
        `includesValid=${includesValid} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(includesValid).assertFalse();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_4200
     * @tc.name      testStatSpaceSuffix0042
     * @tc.desc      Append one space after each key and check the padded name is not trimmed before the lookup
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSpaceSuffix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = SPACE_SUFFIX_KEYS;
      const codes: number[] = codesOf(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      const filled: number = nonEmptyCount(keys);
      logCase('testStatSpaceSuffix0042', `keyCount=${keys.length} rejected=${rejected} filled=${filled} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
      expect(filled).assertEqual(STAT_COUNT);
      expect(includesValidKey(keys)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_4300
     * @tc.name      testStatRepeatedLeaf0043
     * @tc.desc      Append the leaf name a second time after each key and check the doubled name is rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatRepeatedLeaf0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = REPEATED_LEAF_SUFFIX_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const total: number = totalLength(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatRepeatedLeaf0043', `keyCount=${keys.length} distinct=${distinct} total=${total} ` +
        `rejected=${rejected} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(total > ZERO_DELTA).assertTrue();
      expect(rejected).assertEqual(STAT_COUNT);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_4400
     * @tc.name      testStatCountPrefix0044
     * @tc.desc      Truncate the gc count key to one to four characters and check every prefix is unknown
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatCountPrefix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = COUNT_PREFIX_KEYS;
      const codes: number[] = codesOf(keys);
      const shortest: number = shortestLength(keys);
      const longest: number = longestLength(keys);
      logCase('testStatCountPrefix0044', `keyCount=${keys.length} shortest=${shortest} longest=${longest} ` +
        `codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(shortest).assertEqual(TABLE_SIZE_ONE);
      expect(longest).assertEqual(TABLE_SIZE_FOUR);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_4500
     * @tc.name      testStatTimePrefix0045
     * @tc.desc      Truncate the gc time key to five to eight characters and check the partial namespace is unknown
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatTimePrefix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = TIME_PREFIX_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const shortest: number = shortestLength(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatTimePrefix0045', `keyCount=${keys.length} distinct=${distinct} shortest=${shortest} ` +
        `rejected=${rejected} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(distinct).assertEqual(TABLE_SIZE_FOUR);
      expect(shortest).assertEqual(TABLE_SIZE_FIVE);
      expect(rejected).assertEqual(TABLE_SIZE_FOUR);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_4600
     * @tc.name      testStatAllocatedPrefix0046
     * @tc.desc      Truncate the allocated bytes key at three depths and check a cut before the leaf end is refused
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatAllocatedPrefix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = ALLOCATED_PREFIX_KEYS;
      const codes: number[] = codesOf(keys);
      const longest: number = longestLength(keys);
      const distinct: number = distinctCount(keys);
      logCase('testStatAllocatedPrefix0046', `keyCount=${keys.length} longest=${longest} distinct=${distinct} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(distinct).assertEqual(TABLE_SIZE_FOUR);
      expect(longest > TABLE_SIZE_TEN).assertTrue();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_4700
     * @tc.name      testStatFreedPrefix0047
     * @tc.desc      Cut one to five characters off the freed bytes key and check every shortened variant is refused
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatFreedPrefix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = FREED_PREFIX_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatFreedPrefix0047', `keyCount=${keys.length} distinct=${distinct} rejected=${rejected} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(distinct).assertEqual(TABLE_SIZE_FOUR);
      expect(rejected).assertEqual(TABLE_SIZE_FOUR);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_4800
     * @tc.name      testStatFullGcPrefix0048
     * @tc.desc      Cut two to fourteen characters off the long full gc key and check the long prefixes stay unknown
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatFullGcPrefix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = FULL_GC_PREFIX_KEYS;
      const codes: number[] = codesOf(keys);
      const shortest: number = shortestLength(keys);
      const longest: number = longestLength(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatFullGcPrefix0048', `keyCount=${keys.length} shortest=${shortest} longest=${longest} ` +
        `rejected=${rejected} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(shortest < longest).assertTrue();
      expect(rejected).assertEqual(TABLE_SIZE_FOUR);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_4900
     * @tc.name      testStatCountPrefixDeep0049
     * @tc.desc      Cut the last one to four characters off the gc count key and check near complete prefixes fail
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatCountPrefixDeep0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const keys: string[] = COUNT_PREFIX_DEEP_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const includesValid: boolean = includesValidKey(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatCountPrefixDeep0049', `keyCount=${keys.length} distinct=${distinct} ` +
        `includesValid=${includesValid} rejected=${rejected} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(distinct).assertEqual(TABLE_SIZE_FOUR);
      expect(includesValid).assertFalse();
      expect(rejected).assertEqual(TABLE_SIZE_FOUR);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_5000
     * @tc.name      testStatTypoSwap0050
     * @tc.desc      Swap the last two characters of each key and check the transposed tail is refused
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatTypoSwap0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = TYPO_SWAP_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatTypoSwap0050', `keyCount=${keys.length} distinct=${distinct} rejected=${rejected} ` +
        `codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_5100
     * @tc.name      testStatDoubleLetter0051
     * @tc.desc      Duplicate the last letter of each key and check the lengthened leaf is unknown
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatDoubleLetter0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = DOUBLE_LETTER_TYPO_KEYS;
      const codes: number[] = codesOf(keys);
      const longest: number = longestLength(keys);
      const includesValid: boolean = includesValidKey(keys);
      logCase('testStatDoubleLetter0051', `keyCount=${keys.length} longest=${longest} ` +
        `includesValid=${includesValid} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(longest > TABLE_SIZE_TEN).assertTrue();
      expect(includesValid).assertFalse();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_5200
     * @tc.name      testStatHomoglyphZero0052
     * @tc.desc      Replace a letter with the digit zero or five and check the digit lookalikes are not folded back
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatHomoglyphZero0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = HOMOGLYPH_ZERO_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatHomoglyphZero0052', `keyCount=${keys.length} distinct=${distinct} rejected=${rejected} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(distinct).assertEqual(TABLE_SIZE_FOUR);
      expect(rejected).assertEqual(TABLE_SIZE_FOUR);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_5300
     * @tc.name      testStatCyrillicLookalike0053
     * @tc.desc      Spell a letter of each key with the Cyrillic lookalike and check no folding happens
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testStatCyrillicLookalike0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const keys: string[] = CYRILLIC_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const filled: number = nonEmptyCount(keys);
      logCase('testStatCyrillicLookalike0053', `keyCount=${keys.length} distinct=${distinct} filled=${filled} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(distinct).assertEqual(TABLE_SIZE_FOUR);
      expect(filled).assertEqual(TABLE_SIZE_FOUR);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_5400
     * @tc.name      testStatDroppedLetter0054
     * @tc.desc      Remove one letter from the middle of each key and check the shortened leaf is refused
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatDroppedLetter0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = DROPPED_LETTER_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      const includesValid: boolean = includesValidKey(keys);
      logCase('testStatDroppedLetter0054', `keyCount=${keys.length} distinct=${distinct} rejected=${rejected} ` +
        `includesValid=${includesValid} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
      expect(includesValid).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_5500
     * @tc.name      testStatDoubledHyphen0055
     * @tc.desc      Insert a second hyphen inside the leaf of each key and check the doubled separator is refused
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatDoubledHyphen0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = DOUBLED_HYPHEN_KEYS;
      const codes: number[] = codesOf(keys);
      const shortest: number = shortestLength(keys);
      const distinct: number = distinctCount(keys);
      logCase('testStatDoubledHyphen0055', `keyCount=${keys.length} shortest=${shortest} distinct=${distinct} ` +
        `codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(shortest > TABLE_SIZE_TEN).assertTrue();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_5600
     * @tc.name      testStatJoinedLeaf0056
     * @tc.desc      Remove the hyphen from the leaf of each key and check the joined leaf is unknown
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatJoinedLeaf0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = JOINED_LEAF_KEYS;
      const codes: number[] = codesOf(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      const filled: number = nonEmptyCount(keys);
      logCase('testStatJoinedLeaf0056', `keyCount=${keys.length} rejected=${rejected} filled=${filled} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(rejected).assertEqual(STAT_COUNT);
      expect(filled).assertEqual(STAT_COUNT);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_5700
     * @tc.name      testStatExtraSegment0057
     * @tc.desc      Insert an extra gc segment before the leaf of each key and check the deeper path is refused
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatExtraSegment0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const keys: string[] = EXTRA_SEGMENT_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const longest: number = longestLength(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatExtraSegment0057', `keyCount=${keys.length} distinct=${distinct} longest=${longest} ` +
        `rejected=${rejected} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(STAT_COUNT);
      expect(distinct).assertEqual(STAT_COUNT);
      expect(longest > TABLE_SIZE_TEN).assertTrue();
      expect(rejected).assertEqual(STAT_COUNT);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_5800
     * @tc.name      testStatAccented0058
     * @tc.desc      Replace one letter of each key with an accented form and check a composed glyph is not folded
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testStatAccented0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const keys: string[] = ACCENTED_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatAccented0058', `keyCount=${keys.length} distinct=${distinct} rejected=${rejected} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_FOUR);
      expect(distinct).assertEqual(TABLE_SIZE_FOUR);
      expect(rejected).assertEqual(TABLE_SIZE_FOUR);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_5900
     * @tc.name      testStatFullwidth0059
     * @tc.desc      Spell keys with fullwidth letters and a fullwidth dot and check width folding is not applied
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testStatFullwidth0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const keys: string[] = FULLWIDTH_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const filled: number = nonEmptyCount(keys);
      logCase('testStatFullwidth0059', `keyCount=${keys.length} distinct=${distinct} filled=${filled} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_THREE);
      expect(distinct).assertEqual(TABLE_SIZE_THREE);
      expect(filled).assertEqual(TABLE_SIZE_THREE);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_6000
     * @tc.name      testStatGreek0060
     * @tc.desc      Replace one letter of each key with a Greek letter and check the Greek trio is refused
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testStatGreek0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const keys: string[] = GREEK_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      logCase('testStatGreek0060', `keyCount=${keys.length} distinct=${distinct} rejected=${rejected} ` +
        `codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_THREE);
      expect(distinct).assertEqual(TABLE_SIZE_THREE);
      expect(rejected).assertEqual(TABLE_SIZE_THREE);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_6100
     * @tc.name      testStatEmoji0061
     * @tc.desc      Prefix or suffix keys with an emoji pair and check surrogate pairs are kept inside the lookup
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testStatEmoji0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const keys: string[] = EMOJI_KEYS;
      const codes: number[] = codesOf(keys);
      const distinct: number = distinctCount(keys);
      const shortest: number = shortestLength(keys);
      logCase('testStatEmoji0061', `keyCount=${keys.length} distinct=${distinct} shortest=${shortest} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_THREE);
      expect(distinct).assertEqual(TABLE_SIZE_THREE);
      expect(shortest > TABLE_SIZE_TEN).assertTrue();
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_6200
     * @tc.name      testStatCombiningMark0062
     * @tc.desc      Attach a combining mark to a letter of each key and check no unicode normalisation happens
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
     */
    it('testStatCombiningMark0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const keys: string[] = COMBINING_MARK_KEYS;
      const codes: number[] = codesOf(keys);
      const rejected: number = countsOf(codes, INVALID_CODE);
      const filled: number = nonEmptyCount(keys);
      logCase('testStatCombiningMark0062', `keyCount=${keys.length} rejected=${rejected} filled=${filled} ` +
        `lengths=${describeKeys(keys)} codes=${codes.join(',')}`);
      expect(keys.length).assertEqual(TABLE_SIZE_THREE);
      expect(rejected).assertEqual(TABLE_SIZE_THREE);
      expect(filled).assertEqual(TABLE_SIZE_THREE);
      expect(matchesAllCodes(codes, INVALID_CODE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATERROR_6300
     * @tc.name      testStatBidiMark0063
     * @tc.desc      Wrap keys with bidi embedding marks and check the directional controls are not removed
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL3
