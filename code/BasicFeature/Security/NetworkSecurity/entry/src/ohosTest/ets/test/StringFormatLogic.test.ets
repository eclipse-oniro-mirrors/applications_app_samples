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
import { StringUtils, formatBytes, joinNumbers, elapsedMilliseconds } from 'library';

// Waits for the given duration so timer based logic cases can observe real elapsed time.
function sleepMs(durationMs: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, durationMs);
  });
}

// Registers the pure logic test suite for the string helpers and the byte formatting helpers.
export default function stringFormatLogicTest() {
  // Define the logic test suite that contains all StringUtils and Format cases.
  describe('StringFormatLogicSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_0100
     * @tc.name      testStrFmt0001
     * @tc.desc      Verify isEmpty reports true for undefined and empty text and false for visible or whitespace-only text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Missing input counts as empty.
      expect(StringUtils.isEmpty(undefined)).assertTrue();
      // Empty text counts as empty.
      expect(StringUtils.isEmpty('')).assertTrue();
      // Visible text never counts as empty.
      expect(StringUtils.isEmpty('session-key')).assertFalse();
      // Whitespace-only text still holds characters and is not empty.
      expect(StringUtils.isEmpty(' ')).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_0200
     * @tc.name      testStrFmt0002
     * @tc.desc      Verify isBlank treats undefined, empty and whitespace-only text as blank and keeps visible text non-blank.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Missing input counts as blank.
      expect(StringUtils.isBlank(undefined)).assertTrue();
      // Empty text counts as blank.
      expect(StringUtils.isBlank('')).assertTrue();
      // Spaces only count as blank after trimming.
      expect(StringUtils.isBlank('   ')).assertTrue();
      // Tabs and line breaks are whitespace and count as blank too.
      expect(StringUtils.isBlank('\t\r\n')).assertTrue();
      // Text with visible characters stays non-blank.
      expect(StringUtils.isBlank('audit-log')).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_0300
     * @tc.name      testStrFmt0003
     * @tc.desc      Verify trimToNull returns null for missing, empty and whitespace-only text and the trimmed text otherwise.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Missing input collapses to null.
      expect(StringUtils.trimToNull(undefined)).assertNull();
      // Empty text collapses to null.
      expect(StringUtils.trimToNull('')).assertNull();
      // Whitespace-only text collapses to null after trimming.
      expect(StringUtils.trimToNull('   ')).assertNull();
      // Surrounding whitespace is removed and the visible text survives.
      expect(StringUtils.trimToNull('  token-42 ')).assertEqual('token-42');
      // Text without surrounding whitespace is returned unchanged.
      expect(StringUtils.trimToNull('plain')).assertEqual('plain');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_0400
     * @tc.name      testStrFmt0004
     * @tc.desc      Verify capitalize uppercases the first character, keeps the rest untouched and passes empty or non-letter heads through.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Empty text stays empty.
      expect(StringUtils.capitalize('')).assertEqual('');
      // The first letter is uppercased and the tail keeps its original casing.
      expect(StringUtils.capitalize('network')).assertEqual('Network');
      // An already uppercase head stays unchanged.
      expect(StringUtils.capitalize('NETWORK')).assertEqual('NETWORK');
      // Only the first character is touched in a mixed sentence.
      expect(StringUtils.capitalize('audit Trail')).assertEqual('Audit Trail');
      // A non-letter head is uppercased without effect and survives untouched.
      expect(StringUtils.capitalize('9lives')).assertEqual('9lives');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_0500
     * @tc.name      testStrFmt0005
     * @tc.desc      Verify truncate keeps values at or below the limit unchanged and cuts longer values to the requested prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // A longer value is cut down to the requested prefix.
      expect(StringUtils.truncate('hello world', 5)).assertEqual('hello');
      // A value exactly at the limit passes through unchanged.
      expect(StringUtils.truncate('abc', 3)).assertEqual('abc');
      // A value shorter than the limit passes through unchanged.
      expect(StringUtils.truncate('abc', 10)).assertEqual('abc');
      // The cut keeps exactly the requested number of characters.
      expect(StringUtils.truncate('truncate-me-please', 10)).assertEqual('truncate-m');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_0600
     * @tc.name      testStrFmt0006
     * @tc.desc      Verify truncate returns the full value for negative limits, empty text for limit zero and one character for limit one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrFmt0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A zero limit cuts the value down to empty text.
      expect(StringUtils.truncate('abcdef', 0)).assertEqual('');
      // A negative limit is guarded and the value passes through unchanged.
      expect(StringUtils.truncate('abcdef', -1)).assertEqual('abcdef');
      // A large negative limit is guarded the same way.
      expect(StringUtils.truncate('abcdef', -100)).assertEqual('abcdef');
      // A limit of one keeps only the first character.
      expect(StringUtils.truncate('abcdef', 1)).assertEqual('a');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_0700
     * @tc.name      testStrFmt0007
     * @tc.desc      Verify padStart skips padding when the pad character is empty or the value already reaches the target length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // A target equal to the current length is a no-op.
      expect(StringUtils.padStart('42', 2, '0')).assertEqual('42');
      // A target below the current length is a no-op.
      expect(StringUtils.padStart('42', 1, '0')).assertEqual('42');
      // An empty pad character cannot pad and short-circuits to the original value.
      expect(StringUtils.padStart('42', 3, '')).assertEqual('42');
      // A negative target is below the current length and is a no-op as well.
      expect(StringUtils.padStart('42', -3, '0')).assertEqual('42');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_0800
     * @tc.name      testStrFmt0008
     * @tc.desc      Verify padStart prepends the pad character until the value reaches the requested length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Zero padding grows the value to the target length.
      expect(StringUtils.padStart('42', 5, '0')).assertEqual('00042');
      // A different pad character is prepended the same way.
      expect(StringUtils.padStart('7', 3, '#')).assertEqual('##7');
      // An empty value is padded up entirely from the pad character.
      expect(StringUtils.padStart('', 4, 'x')).assertEqual('xxxx');
      // Padding stops exactly at the requested length.
      expect(StringUtils.padStart('2026', 7, '9')).assertEqual('9992026');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_0900
     * @tc.name      testStrFmt0009
     * @tc.desc      Verify padStart prepends the whole pad text per step and stops as soon as the target length is reached or passed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrFmt0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A two character pad grows the value by two per step and stops on the target.
      expect(StringUtils.padStart('a', 5, 'ab')).assertEqual('ababa');
      // This step lands exactly on the requested target length.
      expect(StringUtils.padStart('a', 5, 'ab').length).assertEqual(5);
      // An odd target leaves room for one overshooting step past the requested length.
      expect(StringUtils.padStart('a', 4, 'ab')).assertEqual('ababa');
      // A multi character pad can also land exactly on the target length.
      expect(StringUtils.padStart('12', 4, 'ab')).assertEqual('ab12');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_1000
     * @tc.name      testStrFmt0010
     * @tc.desc      Verify startsWithIgnoreCase matches prefixes regardless of letter case on both sides.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // An uppercase value matches a lowercase prefix.
      expect(StringUtils.startsWithIgnoreCase('HTTPS://EXAMPLE.com/Policy', 'https://')).assertTrue();
      // A lowercase value matches an uppercase prefix.
      expect(StringUtils.startsWithIgnoreCase('https://example.com', 'HTTPS://EXAMPLE.COM')).assertTrue();
      // A prefix that differs in letters does not match.
      expect(StringUtils.startsWithIgnoreCase('httpx://example.com', 'https')).assertFalse();
      // A prefix shorter than the value matches when the head agrees.
      expect(StringUtils.startsWithIgnoreCase('https://example.com', 'http')).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_1100
     * @tc.name      testStrFmt0011
     * @tc.desc      Verify startsWithIgnoreCase rejects longer prefixes and accepts an empty prefix including the empty value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrFmt0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A prefix longer than the value can never match.
      expect(StringUtils.startsWithIgnoreCase('abc', 'abcde')).assertFalse();
      // An empty prefix matches any value, including an empty one.
      expect(StringUtils.startsWithIgnoreCase('abc', '')).assertTrue();
      // An equal length prefix matches case-insensitively.
      expect(StringUtils.startsWithIgnoreCase('abc', 'ABC')).assertTrue();
      // Two empty values match because both heads are empty.
      expect(StringUtils.startsWithIgnoreCase('', '')).assertTrue();
      // A non-empty prefix never matches an empty value.
      expect(StringUtils.startsWithIgnoreCase('', 'a')).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_1200
     * @tc.name      testStrFmt0012
     * @tc.desc      Verify endWithIgnoreCase matches suffixes regardless of letter case on both sides.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // An uppercase extension matches a lowercase suffix.
      expect(StringUtils.endWithIgnoreCase('report.TXT', '.txt')).assertTrue();
      // A lowercase value matches an uppercase suffix.
      expect(StringUtils.endWithIgnoreCase('2026-Q1.log', 'LOG')).assertTrue();
      // A suffix that differs in letters does not match.
      expect(StringUtils.endWithIgnoreCase('report.txt', '.csv')).assertFalse();
      // A path style value matches its file extension suffix.
      expect(StringUtils.endWithIgnoreCase('audit/report.pdf', 'PDF')).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_1300
     * @tc.name      testStrFmt0013
     * @tc.desc      Verify endWithIgnoreCase rejects longer suffixes and accepts an empty suffix including the empty value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrFmt0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A suffix longer than the value can never match.
      expect(StringUtils.endWithIgnoreCase('log', 'logfile')).assertFalse();
      // An empty suffix matches any value.
      expect(StringUtils.endWithIgnoreCase('data.log', '')).assertTrue();
      // An equal length suffix matches case-insensitively.
      expect(StringUtils.endWithIgnoreCase('cache', 'CACHE')).assertTrue();
      // Two empty values match because both tails are empty.
      expect(StringUtils.endWithIgnoreCase('', '')).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_1400
     * @tc.name      testStrFmt0014
     * @tc.desc      Verify repeat concatenates the value the requested number of times and yields empty text for zero repeats.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The value is concatenated once per repeat.
      expect(StringUtils.repeat('ab', 3)).assertEqual('ababab');
      // Zero repeats produce empty text.
      expect(StringUtils.repeat('x', 0)).assertEqual('');
      // Repeating empty text stays empty whatever the count.
      expect(StringUtils.repeat('', 5)).assertEqual('');
      // The repeated banner length matches the repeat count and cross-checks with the pattern scanner.
      const banner: string = StringUtils.repeat('a', 6);
      expect(banner.length).assertEqual(6);
      expect(StringUtils.countMatches(banner, 'aa')).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_1500
     * @tc.name      testStrFmt0015
     * @tc.desc      Verify repeat clamps negative counts to zero and caps oversized counts at the internal limit of 10000.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrFmt0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A negative count clamps to zero repeats and yields empty text.
      expect(StringUtils.repeat('ab', -2)).assertEqual('');
      // A single repeat keeps one copy.
      expect(StringUtils.repeat('ab', 1)).assertEqual('ab');
      // A count above the internal cap is clamped to 10000 copies.
      const capped: string = StringUtils.repeat('ab', 10001);
      // The capped result holds exactly 20000 characters.
      expect(capped.length).assertEqual(20000);
      // The capped result still interleaves the two source characters correctly.
      expect(capped.charAt(1)).assertEqual('b');
      expect(capped.charAt(19999)).assertEqual('b');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_1600
     * @tc.name      testStrFmt0016
     * @tc.desc      Verify countMatches counts non-overlapping occurrences from left to right.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Alternating text holds one match per repetition.
      expect(StringUtils.countMatches('ababab', 'ab')).assertEqual(3);
      // Overlapping candidates are skipped past so only non-overlapping matches count.
      expect(StringUtils.countMatches('aaaa', 'aa')).assertEqual(2);
      // A word pattern is found once per appearance.
      expect(StringUtils.countMatches('one two one two', 'one')).assertEqual(2);
      // Single character scans still count every position.
      expect(StringUtils.countMatches('aba', 'a')).assertEqual(2);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_1700
     * @tc.name      testStrFmt0017
     * @tc.desc      Verify countMatches returns zero for an empty value or an empty pattern and counts whole-string and skipped matches.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrFmt0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // An empty value has nothing to scan and yields zero.
      expect(StringUtils.countMatches('', 'x')).assertEqual(0);
      // An empty pattern is guarded and yields zero instead of looping forever.
      expect(StringUtils.countMatches('hello', '')).assertEqual(0);
      // A pattern covering the whole value matches exactly once.
      expect(StringUtils.countMatches('aaa', 'aaa')).assertEqual(1);
      // A whole-length pattern in a longer value matches once per non-overlapping window.
      expect(StringUtils.countMatches('aaaaaa', 'aaa')).assertEqual(2);
      // A pattern found once in the middle counts once.
      expect(StringUtils.countMatches('xyzzy', 'zz')).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_1800
     * @tc.name      testStrFmt0018
     * @tc.desc      Verify formatBytes renders small counts in plain bytes across the zero boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Zero bytes stays in the plain byte range.
      expect(formatBytes(0)).assertEqual('0 B');
      // A single byte stays in the plain byte range.
      expect(formatBytes(1)).assertEqual('1 B');
      // A mid range byte count stays unscaled.
      expect(formatBytes(512)).assertEqual('512 B');
      // The last byte below one kilobyte still renders unscaled.
      expect(formatBytes(1023)).assertEqual('1023 B');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_1900
     * @tc.name      testStrFmt0019
     * @tc.desc      Verify formatBytes scales kilobyte-range counts with two fraction digits including rounding at the range top.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Exactly one kilobyte scales with two fraction digits.
      expect(formatBytes(1024)).assertEqual('1.00 KB');
      // One and a half kilobytes keeps the two digit fraction.
      expect(formatBytes(1536)).assertEqual('1.50 KB');
      // A fractional value rounds to two digits.
      expect(formatBytes(1600)).assertEqual('1.56 KB');
      // Just below one megabyte the rounding can already show two kilobytes.
      expect(formatBytes(2047)).assertEqual('2.00 KB');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_2000
     * @tc.name      testStrFmt0020
     * @tc.desc      Verify formatBytes scales megabyte and gigabyte counts with two fraction digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Exactly one megabyte scales to the MB unit.
      expect(formatBytes(1048576)).assertEqual('1.00 MB');
      // One and a half megabytes keeps the two digit fraction.
      expect(formatBytes(1572864)).assertEqual('1.50 MB');
      // Exactly one gigabyte scales to the GB unit.
      expect(formatBytes(1073741824)).assertEqual('1.00 GB');
      // Three gigabytes keeps the two digit fraction in the GB unit.
      expect(formatBytes(3221225472)).assertEqual('3.00 GB');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_2100
     * @tc.name      testStrFmt0021
     * @tc.desc      Verify formatBytes returns the placeholder for negative counts while zero still renders as plain bytes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // A small negative count falls back to the placeholder.
      expect(formatBytes(-1)).assertEqual('-');
      // A large negative count falls back to the placeholder as well.
      expect(formatBytes(-1048576)).assertEqual('-');
      // Any negative value, even fractional, falls back to the placeholder.
      expect(formatBytes(-0.5)).assertEqual('-');
      // Zero sits on the positive side of the guard and renders as plain bytes.
      expect(formatBytes(0)).assertEqual('0 B');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_2200
     * @tc.name      testStrFmt0022
     * @tc.desc      Verify joinNumbers renders one element without a separator, several elements comma separated and the placeholder for an empty array.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Several numbers join with a comma and a space.
      expect(joinNumbers([1, 2, 3])).assertEqual('1, 2, 3');
      // A single number renders without any separator.
      expect(joinNumbers([42])).assertEqual('42');
      // An empty array falls back to the placeholder.
      expect(joinNumbers([])).assertEqual('-');
      // Two numbers carry exactly one separator between them.
      expect(joinNumbers([100, 200])).assertEqual('100, 200');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_2300
     * @tc.name      testStrFmt0023
     * @tc.desc      Verify joinNumbers keeps negative, fractional and large values in the joined line.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Negative, zero and positive values all join in order.
      expect(joinNumbers([-1, 0, 1])).assertEqual('-1, 0, 1');
      // Fractional values keep their decimal representation.
      expect(joinNumbers([1.5, 2.25])).assertEqual('1.5, 2.25');
      // Large values join without rounding or scaling.
      expect(joinNumbers([1024000, 2048000])).assertEqual('1024000, 2048000');
      // A single negative number renders with its sign and no separator.
      expect(joinNumbers([-999999])).assertEqual('-999999');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_2400
     * @tc.name      testStrFmt0024
     * @tc.desc      Verify elapsedMilliseconds reports a non-negative duration bounded by a short window for a synchronous call.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Capture a start mark and measure synchronously.
      const marked: number = Date.now();
      const first: number = elapsedMilliseconds(marked);
      // The elapsed duration can never be negative for a current timestamp.
      expect(first).assertLargerOrEqual(0);
      // A synchronous measurement stays inside a short window.
      expect(first).assertLessOrEqual(1000);
      // A second synchronous sample behaves the same way.
      const secondMark: number = Date.now();
      const second: number = elapsedMilliseconds(secondMark);
      expect(second).assertLargerOrEqual(0);
      expect(second).assertLessOrEqual(1000);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_2500
     * @tc.name      testStrFmt0025
     * @tc.desc      Verify elapsedMilliseconds grows with a real timer wait of 60 milliseconds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrFmt0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Capture the start mark, wait for the timer, then measure the real elapsed time.
      const startedAt: number = Date.now();
      await sleepMs(60);
      const waitedMs: number = Date.now() - startedAt;
      const elapsed: number = elapsedMilliseconds(startedAt);
      // The timer wait itself is at least the requested 60 milliseconds.
      expect(waitedMs).assertLargerOrEqual(60);
      // The reported duration covers at least the observed wait window.
      expect(elapsed).assertLargerOrEqual(waitedMs);
      // The reported duration stays close to the observed wait window.
      expect(elapsed).assertLessOrEqual(waitedMs + 100);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_2600
     * @tc.name      testStrFmt0026
     * @tc.desc      Verify elapsedMilliseconds returns a negative duration for a future timestamp and a large duration for past timestamps.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrFmt0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A start mark one minute ahead of the clock yields a negative duration.
      const futureMark: number = Date.now() + 60000;
      const futureElapsed: number = elapsedMilliseconds(futureMark);
      expect(futureElapsed < 0).assertTrue();
      // The negative duration stays close to the sixty-second offset instead of collapsing to zero.
      expect(futureElapsed > -70000).assertTrue();
      // A start mark five seconds in the past yields at least five seconds.
      const pastMark: number = Date.now() - 5000;
      const pastElapsed: number = elapsedMilliseconds(pastMark);
      expect(pastElapsed).assertLargerOrEqual(5000);
      // A start mark at the epoch origin yields the epoch milliseconds of the current clock.
      expect(elapsedMilliseconds(0)).assertLarger(1000000000);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_2700
     * @tc.name      testStrFmt0027
     * @tc.desc      Verify formatBytes and joinNumbers work together when rendering a size report line.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Prepare one size per rendering unit and scale each of them.
      const sizes: number[] = [512, 2048, 1048576];
      const scaled: string[] = [];
      for (let index = 0; index < sizes.length; index++) {
        scaled.push(formatBytes(sizes[index]));
      }
      // Each size lands in its own unit with the exact two digit fraction.
      expect(scaled[0]).assertEqual('512 B');
      expect(scaled[1]).assertEqual('2.00 KB');
      expect(scaled[2]).assertEqual('1.00 MB');
      // The raw sizes still join into one plain report line.
      expect(joinNumbers(sizes)).assertEqual('512, 2048, 1048576');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_2800
     * @tc.name      testStrFmt0028
     * @tc.desc      Verify trimToNull, capitalize and the prefix and suffix checks work together on one text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Clean a padded raw text and then inspect its head and tail.
      const rawText: string = '  network audit trail ';
      const cleaned: string | null = StringUtils.trimToNull(rawText);
      // The padded text survives cleaning with visible characters.
      expect(cleaned).not().assertNull();
      const visible: string = cleaned === null ? '' : cleaned;
      // Capitalizing the cleaned text touches only the first letter.
      const titled: string = StringUtils.capitalize(visible);
      expect(titled).assertEqual('Network audit trail');
      // The capitalized text still passes the case-insensitive head and tail checks.
      expect(StringUtils.startsWithIgnoreCase(titled, 'NETWORK')).assertTrue();
      expect(StringUtils.endWithIgnoreCase(titled, 'TRAIL')).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_STRFMT_2900
     * @tc.name      testStrFmt0029
     * @tc.desc      Verify repeat, countMatches, truncate and startsWithIgnoreCase work together on a generated banner.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrFmt0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Generate a banner and confirm its exact content.
      const banner: string = StringUtils.repeat('ab', 4);
      expect(banner).assertEqual('abababab');
      // The pattern scanner finds one match per repetition in the banner.
      expect(StringUtils.countMatches(banner, 'ab')).assertEqual(4);
      // Clipping the banner keeps the requested prefix.
      const clipped: string = StringUtils.truncate(banner, 5);
      expect(clipped).assertEqual('ababa');
      // The clipped text still starts with the banner pattern even in uppercase.
      expect(StringUtils.startsWithIgnoreCase(clipped, 'AB')).assertTrue();
      // The full banner ends with the same pattern.
      expect(StringUtils.endWithIgnoreCase(banner, 'AB')).assertTrue();
      // The odd length clip holds two full non-overlapping matches only.
      expect(StringUtils.countMatches(clipped, 'ab')).assertEqual(2);
    });
  });
}
