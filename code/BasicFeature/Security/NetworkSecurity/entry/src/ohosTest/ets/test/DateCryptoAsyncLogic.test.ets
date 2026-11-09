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
import { DateUtils, CryptoUtils, AsyncUtils } from 'library';

// Waits for the given duration so timer based logic cases can observe real elapsed time.
function sleepMs(durationMs: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, durationMs);
  });
}

// Oracle helper: pads a calendar number below one hundred with one leading zero.
function padOracle(value: number): string {
  if (value < 10) {
    return '0' + value.toString();
  }
  return value.toString();
}

// Oracle helper: builds the expected local 'yyyy-MM-dd HH:mm:ss' text of a timestamp
// from the platform Date API itself, so expectations hold in every device timezone.
function localOracle(timestamp: number): string {
  const moment: Date = new Date(timestamp);
  const year: string = moment.getFullYear().toString();
  const month: string = padOracle(moment.getMonth() + 1);
  const day: string = padOracle(moment.getDate());
  const hour: string = padOracle(moment.getHours());
  const minute: string = padOracle(moment.getMinutes());
  const second: string = padOracle(moment.getSeconds());
  return year + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
}

// Oracle helper: builds the expected local 'yyyy-MM-dd' date part of a timestamp.
function datePartOracle(timestamp: number): string {
  const moment: Date = new Date(timestamp);
  return moment.getFullYear().toString() + '-' + padOracle(moment.getMonth() + 1) + '-' + padOracle(moment.getDate());
}

// Oracle helper: builds the expected local 'HH:mm:ss' time part of a timestamp.
function timePartOracle(timestamp: number): string {
  const moment: Date = new Date(timestamp);
  return padOracle(moment.getHours()) + ':' + padOracle(moment.getMinutes()) + ':' + padOracle(moment.getSeconds());
}

// Registers the pure logic test suite for the date, crypto and async helpers.
export default function dateCryptoAsyncLogicTest() {
  // Define the logic test suite that contains all DateUtils, CryptoUtils and AsyncUtils cases.
  describe('DateCryptoAsyncLogicSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_0100
     * @tc.name      testDateCrypto0001
     * @tc.desc      Verify now returns the current epoch time inside the surrounding clock bounds and moves forward on repeated calls.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Capture the clock window around the call under test.
      const before: number = Date.now();
      const current: number = DateUtils.now();
      const after: number = Date.now();
      // The reported timestamp cannot predate the window entry.
      expect(current >= before).assertTrue();
      // The reported timestamp cannot exceed the window exit.
      expect(current <= after).assertTrue();
      // A follow-up call keeps moving forward instead of returning a stale value.
      expect(DateUtils.now() >= current).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_0200
     * @tc.name      testDateCrypto0002
     * @tc.desc      Verify format renders every supported token of a real timestamp with the expected separators and keeps the local calendar reading.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // A fixed real timestamp in 2026 keeps the case reproducible.
      const timestamp: number = 1767225600123;
      // The full pattern must match the platform Date reading of the same instant.
      expect(DateUtils.format(timestamp, 'yyyy-MM-dd HH:mm:ss')).assertEqual(localOracle(timestamp));
      // Custom separators pass through verbatim between the rendered parts.
      const moment: Date = new Date(timestamp);
      const expectedSlash: string = moment.getFullYear().toString() + '/' + padOracle(moment.getMonth() + 1) + '/'
        + padOracle(moment.getDate());
      expect(DateUtils.format(timestamp, 'yyyy/MM/dd')).assertEqual(expectedSlash);
      // A time-only pattern renders only the clock part of the same instant.
      expect(DateUtils.format(timestamp, 'HH:mm:ss')).assertEqual(timePartOracle(timestamp));
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_0300
     * @tc.name      testDateCrypto0003
     * @tc.desc      Verify format handles a negative timestamp by rendering the pre-epoch local calendar reading through the platform Date.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // One millisecond before the epoch exercises the negative timestamp boundary.
      const timestamp: number = -1;
      // The full pattern keeps the complete local reading of the pre-epoch instant.
      expect(DateUtils.format(timestamp, 'yyyy-MM-dd HH:mm:ss')).assertEqual(localOracle(timestamp));
      // The year token alone matches the platform year of the same instant.
      expect(DateUtils.format(timestamp, 'yyyy')).assertEqual(new Date(timestamp).getFullYear().toString());
      // The clock part alone matches the platform clock of the same instant.
      expect(DateUtils.format(timestamp, 'HH:mm:ss')).assertEqual(timePartOracle(timestamp));
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_0400
     * @tc.name      testDateCrypto0004
     * @tc.desc      Verify format handles the zero timestamp boundary and stops substitution at the minute token for a shorter pattern.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The epoch itself is the smallest non-negative timestamp.
      const timestamp: number = 0;
      // The full pattern keeps the complete local reading of the epoch instant.
      expect(DateUtils.format(timestamp, 'yyyy-MM-dd HH:mm:ss')).assertEqual(localOracle(timestamp));
      // A pattern without the seconds token renders only the substituted prefix parts.
      expect(DateUtils.format(timestamp, 'yyyy-MM-dd HH:mm')).assertEqual(localOracle(timestamp).substring(0, 16));
      // The year token alone matches the platform year of the epoch instant.
      expect(DateUtils.format(timestamp, 'yyyy')).assertEqual(new Date(timestamp).getFullYear().toString());
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_0500
     * @tc.name      testDateCrypto0005
     * @tc.desc      Verify format copies unknown tokens verbatim and substitutes only the first occurrence of a repeated token.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Text without any supported token is returned unchanged.
      expect(DateUtils.format(0, 'no tokens here')).assertEqual('no tokens here');
      // Uppercase and unknown letters are not part of the token set and stay verbatim.
      expect(DateUtils.format(0, 'YYYY/qq/ww')).assertEqual('YYYY/qq/ww');
      // A token appearing twice is substituted at its first occurrence only.
      const epochYear: string = new Date(0).getFullYear().toString();
      expect(DateUtils.format(0, 'yyyy-yyyy')).assertEqual(epochYear + '-yyyy');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_0600
     * @tc.name      testDateCrypto0006
     * @tc.desc      Verify format renders NaN parts for a timestamp beyond the platform date range while the maximum valid timestamp still renders numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // One millisecond past the platform date range produces an invalid Date.
      const beyond: number = 8640000000000001;
      // Every date token degrades to the NaN text on the invalid timestamp.
      expect(DateUtils.format(beyond, 'yyyy-MM-dd')).assertEqual('NaN-NaN-NaN');
      // The clock token reaches the padding helper with a NaN part and degrades too.
      expect(DateUtils.format(beyond, 'ss')).assertEqual('NaN');
      // The maximum valid timestamp still renders a numeric year.
      const maximum: number = 8640000000000000;
      expect(DateUtils.format(maximum, 'yyyy')).assertEqual(new Date(maximum).getFullYear().toString());
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_0700
     * @tc.name      testDateCrypto0007
     * @tc.desc      Verify addDays shifts timestamps by whole positive, negative and fractional day amounts in plain milliseconds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // One day forward from the epoch is exactly the day millisecond count.
      expect(DateUtils.addDays(0, 1)).assertEqual(86400000);
      // One day backward from the epoch reaches the negative epoch side.
      expect(DateUtils.addDays(0, -1)).assertEqual(-86400000);
      // A fractional day amount shifts by the proportional milliseconds.
      expect(DateUtils.addDays(86400000, 0.5)).assertEqual(129600000);
      // The shifted timestamp formats back to the next UTC calendar day.
      expect(DateUtils.toUtc(DateUtils.addDays(0, 1))).assertEqual('1970-01-02T00:00:00.000Z');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_0800
     * @tc.name      testDateCrypto0008
     * @tc.desc      Verify addDays keeps exact millisecond arithmetic at the platform date range limits and returns to the origin after a full round trip.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Adding the maximum representable number of days reaches the range limit.
      expect(DateUtils.addDays(0, 100000000)).assertEqual(8640000000000000);
      // One more day lands one whole day past the limit without clamping.
      expect(DateUtils.addDays(0, 100000001)).assertEqual(8640000086400000);
      // A negative base recovered by one day returns exactly to the epoch.
      expect(DateUtils.addDays(-86400000, 1)).assertEqual(0);
      // Subtracting the same day count from the range limit returns to the epoch.
      expect(DateUtils.addDays(8640000000000000, -100000000)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_0900
     * @tc.name      testDateCrypto0009
     * @tc.desc      Verify addMonths normalizes the January 31 plus one month overflow into March 3 while keeping the clock time.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Both base and expectation use the local Date constructor so the case holds in every timezone.
      const base: number = new Date(2026, 0, 31, 12, 0, 0).getTime();
      const shifted: number = DateUtils.addMonths(base, 1);
      // The overflowing day normalizes to March 3 of the same year.
      expect(shifted).assertEqual(new Date(2026, 2, 3, 12, 0, 0).getTime());
      // The shifted calendar month is March.
      expect(new Date(shifted).getMonth()).assertEqual(2);
      // The shifted day of month carries the overflow remainder.
      expect(new Date(shifted).getDate()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_1000
     * @tc.name      testDateCrypto0010
     * @tc.desc      Verify addMonths rolls over the year boundary, accepts negative month amounts and keeps the timestamp for zero months.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // December plus one month rolls into January of the next year.
      const december: number = new Date(2026, 11, 15, 12, 0, 0).getTime();
      expect(DateUtils.addMonths(december, 1)).assertEqual(new Date(2027, 0, 15, 12, 0, 0).getTime());
      // Thirteen months backward from January lands in December two years earlier.
      const january: number = new Date(2026, 0, 10, 9, 0, 0).getTime();
      expect(DateUtils.addMonths(january, -13)).assertEqual(new Date(2024, 11, 10, 9, 0, 0).getTime());
      // Zero months keep the timestamp unchanged.
      expect(DateUtils.addMonths(december, 0)).assertEqual(december);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_1100
     * @tc.name      testDateCrypto0011
     * @tc.desc      Verify diffDays returns zero for one calendar day, one for adjacent days and stays symmetric on a longer span.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Morning and evening of the same calendar day have a zero day distance.
      const morning: number = new Date(2026, 4, 20, 8, 30, 0).getTime();
      const evening: number = new Date(2026, 4, 20, 22, 45, 0).getTime();
      expect(DateUtils.diffDays(morning, evening)).assertEqual(0);
      // Late evening and midnight of the next calendar day have a one day distance.
      const nextMidnight: number = new Date(2026, 4, 21, 0, 0, 0).getTime();
      expect(DateUtils.diffDays(evening, nextMidnight)).assertEqual(1);
      // January to February 2026 spans the 31 days of January.
      const january: number = new Date(2026, 0, 1, 12, 0, 0).getTime();
      const february: number = new Date(2026, 1, 1, 12, 0, 0).getTime();
      expect(DateUtils.diffDays(january, february)).assertEqual(31);
      // The day distance is symmetric when the arguments swap.
      expect(DateUtils.diffDays(february, january)).assertEqual(31);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_1200
     * @tc.name      testDateCrypto0012
     * @tc.desc      Verify diffDays counts leap day months, non-leap spans and the year boundary correctly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // February to March 2024 spans 29 days because 2024 is a leap year.
      const leapStart: number = new Date(2024, 1, 1, 12, 0, 0).getTime();
      const march: number = new Date(2024, 2, 1, 12, 0, 0).getTime();
      expect(DateUtils.diffDays(leapStart, march)).assertEqual(29);
      // January to March 2026 spans 59 days because 2026 has no leap day.
      const january2026: number = new Date(2026, 0, 1, 12, 0, 0).getTime();
      const march2026: number = new Date(2026, 2, 1, 12, 0, 0).getTime();
      expect(DateUtils.diffDays(january2026, march2026)).assertEqual(59);
      // December 31 and January 1 of the next year are one calendar day apart.
      const newYearsEve: number = new Date(2025, 11, 31, 12, 0, 0).getTime();
      const newYearsDay: number = new Date(2026, 0, 1, 12, 0, 0).getTime();
      expect(DateUtils.diffDays(newYearsEve, newYearsDay)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_1300
     * @tc.name      testDateCrypto0013
     * @tc.desc      Verify isSameDay matches timestamps on one calendar day and separates them across day, month and year boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Midnight and late night of the same local day belong to one calendar day.
      const midnight: number = new Date(2026, 2, 8, 0, 0, 0).getTime();
      const night: number = new Date(2026, 2, 8, 23, 59, 59).getTime();
      expect(DateUtils.isSameDay(midnight, night)).assertTrue();
      // The following calendar day separates the two timestamps.
      const nextDay: number = new Date(2026, 2, 9, 0, 0, 0).getTime();
      expect(DateUtils.isSameDay(midnight, nextDay)).assertFalse();
      // The same month and day one year later still separates them.
      const nextYear: number = new Date(2027, 2, 8, 12, 0, 0).getTime();
      expect(DateUtils.isSameDay(midnight, nextYear)).assertFalse();
      // The same day number one month later separates them as well.
      const nextMonth: number = new Date(2026, 3, 8, 12, 0, 0).getTime();
      expect(DateUtils.isSameDay(midnight, nextMonth)).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_1400
     * @tc.name      testDateCrypto0014
     * @tc.desc      Verify toUtc renders known epoch instants as ISO-8601 UTC text with millisecond precision, including the pre-epoch side.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The epoch renders as the zero point of the ISO-8601 UTC scale.
      expect(DateUtils.toUtc(0)).assertEqual('1970-01-01T00:00:00.000Z');
      // One millisecond before the epoch renders on the 1969 side.
      expect(DateUtils.toUtc(-1)).assertEqual('1969-12-31T23:59:59.999Z');
      // A real 2026 instant renders with its known UTC text.
      expect(DateUtils.toUtc(1767225600000)).assertEqual('2026-01-01T00:00:00.000Z');
      // Milliseconds survive into the rendered text with three digits.
      expect(DateUtils.toUtc(1767225600123)).assertEqual('2026-01-01T00:00:00.123Z');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_1500
     * @tc.name      testDateCrypto0015
     * @tc.desc      Verify md5 computes the known RFC 1321 digest values for empty and short inputs through the real crypto framework.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // The empty input digest matches the published MD5 vector.
      expect(await CryptoUtils.md5('')).assertEqual('d41d8cd98f00b204e9800998ecf8427e');
      // The three letter digest matches the published MD5 vector.
      expect(await CryptoUtils.md5('abc')).assertEqual('900150983cd24fb0d6963f7d28e17f72');
      // The phrase digest matches the published MD5 suite vector.
      expect(await CryptoUtils.md5('message digest')).assertEqual('f96b697d7cb7938d525a2f31aaf161d0');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_1600
     * @tc.name      testDateCrypto0016
     * @tc.desc      Verify md5 is deterministic across repeated runs for ASCII and Chinese inputs and always returns 32 lowercase hex characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // Two runs over the same ASCII payload produce the same digest.
      const firstRun: string = await CryptoUtils.md5('payload-token-42');
      const secondRun: string = await CryptoUtils.md5('payload-token-42');
      expect(firstRun).assertEqual(secondRun);
      // The digest length stays at the fixed 32 hex characters of MD5.
      expect(firstRun.length).assertEqual(32);
      // The digest text is lowercase hexadecimal only.
      expect(firstRun).assertEqual(firstRun.toLowerCase());
      // Two runs over a Chinese payload agree as well.
      const zhFirst: string = await CryptoUtils.md5('网络安全审计');
      const zhSecond: string = await CryptoUtils.md5('网络安全审计');
      expect(zhFirst).assertEqual(zhSecond);
      // A different input never repeats the ASCII digest.
      expect(zhFirst).not().assertEqual(firstRun);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_1700
     * @tc.name      testDateCrypto0017
     * @tc.desc      Verify sha256 computes the known NIST digest values for empty, short and word inputs through the real crypto framework.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // The empty input digest matches the published SHA-256 vector.
      expect(await CryptoUtils.sha256('')).assertEqual('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855');
      // The three letter digest matches the published SHA-256 vector.
      expect(await CryptoUtils.sha256('abc')).assertEqual('ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad');
      // The well known word digest matches its published SHA-256 value.
      expect(await CryptoUtils.sha256('hello world')).assertEqual('b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_1800
     * @tc.name      testDateCrypto0018
     * @tc.desc      Verify sha256 is deterministic across runs, returns 64 hex characters and differs from the MD5 digest of the same input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // Two runs over the same payload produce the same digest.
      const firstRun: string = await CryptoUtils.sha256('session-anchor');
      const secondRun: string = await CryptoUtils.sha256('session-anchor');
      expect(firstRun).assertEqual(secondRun);
      // The digest length stays at the fixed 64 hex characters of SHA-256.
      expect(firstRun.length).assertEqual(64);
      // The SHA-256 digest of a shared input differs from its MD5 digest.
      const md5Digest: string = await CryptoUtils.md5('abc');
      const shaDigest: string = await CryptoUtils.sha256('abc');
      expect(shaDigest).not().assertEqual(md5Digest);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_1900
     * @tc.name      testDateCrypto0019
     * @tc.desc      Verify bytesToHex renders bytes as two lowercase hex characters each, pads low nibbles and keeps an empty input empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Each byte renders as two hex characters in input order.
      expect(CryptoUtils.bytesToHex(new Uint8Array([0x00, 0x0f, 0xab]))).assertEqual('000fab');
      // An empty byte array renders as empty text.
      expect(CryptoUtils.bytesToHex(new Uint8Array([]))).assertEqual('');
      // The nibble boundary bytes 0x7f and 0x80 both render with padding preserved.
      expect(CryptoUtils.bytesToHex(new Uint8Array([0x7f, 0x80]))).assertEqual('7f80');
      // A 16 byte digest-sized input renders exactly 32 hex characters.
      expect(CryptoUtils.bytesToHex(new Uint8Array(16))).assertEqual('00000000000000000000000000000000');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_2000
     * @tc.name      testDateCrypto0020
     * @tc.desc      Verify base64Encode produces the RFC 4648 reference text for short inputs and round trips Chinese text through decode.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Empty text encodes to empty Base64 text.
      expect(CryptoUtils.base64Encode('')).assertEqual('');
      // One byte of payload uses one padding character per the reference vector.
      expect(CryptoUtils.base64Encode('f')).assertEqual('Zg==');
      // Six bytes of payload encode without padding per the reference vector.
      expect(CryptoUtils.base64Encode('foobar')).assertEqual('Zm9vYmFy');
      // Chinese text survives an encode then decode round trip.
      expect(CryptoUtils.base64Decode(CryptoUtils.base64Encode('鸿蒙网络安全'))).assertEqual('鸿蒙网络安全');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_2100
     * @tc.name      testDateCrypto0021
     * @tc.desc      Verify base64Decode restores reference vectors, degrades illegal input to empty text and round trips ASCII payloads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The padded reference vector decodes to its original text.
      expect(CryptoUtils.base64Decode('aGVsbG8=')).assertEqual('hello');
      // The unpadded reference vector decodes to its original text.
      expect(CryptoUtils.base64Decode('Zm9vYmFy')).assertEqual('foobar');
      // Text outside the Base64 alphabet degrades to empty text through the failure branch.
      expect(CryptoUtils.base64Decode('****')).assertEqual('');
      // An ASCII payload survives an encode then decode round trip.
      expect(CryptoUtils.base64Decode(CryptoUtils.base64Encode('NetworkSecurity-2026'))).assertEqual('NetworkSecurity-2026');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_2200
     * @tc.name      testDateCrypto0022
     * @tc.desc      Verify md5 and sha256 stay deterministic and input sensitive on a multi block payload longer than the cipher block size.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateCrypto0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // Build a payload far longer than one digest block so multiple update rounds run.
      let longText: string = '';
      for (let i = 0; i < 10; i++) {
        longText = longText + 'networksecurity-sample-payload-block-';
      }
      // Two runs over the long payload produce the same MD5 digest.
      const md5First: string = await CryptoUtils.md5(longText);
      const md5Second: string = await CryptoUtils.md5(longText);
      expect(md5First).assertEqual(md5Second);
      // The long payload digest keeps the 64 character SHA-256 length.
      const shaFirst: string = await CryptoUtils.sha256(longText);
      expect(shaFirst.length).assertEqual(64);
      // The two algorithms still produce different digests for the long payload.
      expect(shaFirst).not().assertEqual(md5First);
      // A small input change changes the SHA-256 digest.
      const shaTail: string = await CryptoUtils.sha256(longText + 'tail');
      expect(shaFirst).not().assertEqual(shaTail);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_2300
     * @tc.name      testDateCrypto0023
     * @tc.desc      Verify delay resolves only after the requested duration and accumulates the full requested time across back to back waits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateCrypto0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Two consecutive waits of 40 and 25 milliseconds must each honor their duration.
      const startTotal: number = Date.now();
      await AsyncUtils.delay(40);
      const afterFirst: number = Date.now();
      await AsyncUtils.delay(25);
      const afterSecond: number = Date.now();
      // The first wait ran at least the requested 40 milliseconds.
      expect(afterFirst - startTotal >= 40).assertTrue();
      // The second wait ran at least the requested 25 milliseconds.
      expect(afterSecond - afterFirst >= 25).assertTrue();
      // Both waits together consumed at least the combined 65 milliseconds.
      expect(afterSecond - startTotal >= 65).assertTrue();
      // The timer chain finished promptly instead of hanging.
      expect(afterSecond - startTotal < 10000).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_2400
     * @tc.name      testDateCrypto0024
     * @tc.desc      Verify debounce defers execution, collapses a rapid call burst into one run and does not fire again without new calls.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateCrypto0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Count executions of the debounced callback.
      let runCount: number = 0;
      const wrapped: () => void = AsyncUtils.debounce((): void => {
        runCount++;
      }, 50);
      // A rapid burst of three calls stays deferred while the quiet period runs.
      wrapped();
      wrapped();
      wrapped();
      expect(runCount).assertEqual(0);
      // After the quiet period exactly one execution happened.
      await sleepMs(120);
      expect(runCount).assertEqual(1);
      // Waiting longer without new calls does not fire the callback again.
      await sleepMs(120);
      expect(runCount).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_2500
     * @tc.name      testDateCrypto0025
     * @tc.desc      Verify debounce re-arms after each settled quiet period and independent wrappers keep separate timers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateCrypto0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Two independent wrappers count into separate counters.
      let aCount: number = 0;
      let bCount: number = 0;
      const wrapperA: () => void = AsyncUtils.debounce((): void => {
        aCount++;
      }, 60);
      const wrapperB: () => void = AsyncUtils.debounce((): void => {
        bCount++;
      }, 60);
      // The first settled call fires exactly once.
      wrapperA();
      await sleepMs(90);
      expect(aCount).assertEqual(1);
      // A later call re-arms the wrapper and fires once more.
      wrapperA();
      await sleepMs(90);
      expect(aCount).assertEqual(2);
      // The wrapper that was never called stayed silent.
      expect(bCount).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_2600
     * @tc.name      testDateCrypto0026
     * @tc.desc      Verify throttle runs the first call immediately, collapses a burst into one trailing run and adds no further runs afterwards.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateCrypto0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Count executions of the throttled callback.
      let runCount: number = 0;
      const wrapped: () => void = AsyncUtils.throttle((): void => {
        runCount++;
      }, 60);
      // The leading call runs synchronously and extra burst calls stay inside the interval.
      wrapped();
      wrapped();
      wrapped();
      expect(runCount).assertEqual(1);
      // After the interval exactly one trailing execution was added.
      await sleepMs(100);
      expect(runCount).assertEqual(2);
      // Further waiting does not produce additional executions.
      await sleepMs(100);
      expect(runCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_2700
     * @tc.name      testDateCrypto0027
     * @tc.desc      Verify throttle re-arms its leading edge after a quiet interval and schedules no trailing run for an isolated call.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateCrypto0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Count executions of the throttled callback.
      let runCount: number = 0;
      const wrapped: () => void = AsyncUtils.throttle((): void => {
        runCount++;
      }, 50);
      // The first call runs immediately.
      wrapped();
      expect(runCount).assertEqual(1);
      // After a quiet interval the next call runs immediately again.
      await sleepMs(100);
      wrapped();
      expect(runCount).assertEqual(2);
      // An isolated leading call schedules no trailing execution.
      await sleepMs(100);
      expect(runCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_2800
     * @tc.name      testDateCrypto0028
     * @tc.desc      Verify withRetry succeeds on the first attempt without consuming retries and without applying any backoff delay.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateCrypto0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Count attempts of an action that succeeds immediately.
      let attempts: number = 0;
      const before: number = Date.now();
      const result: boolean = await AsyncUtils.withRetry(async (): Promise<void> => {
        attempts++;
      }, 3, 40);
      const after: number = Date.now();
      // One successful attempt reports success.
      expect(result).assertTrue();
      // The action ran exactly once because no retry was needed.
      expect(attempts).assertEqual(1);
      // No backoff delay was applied on the immediate success path.
      expect(after - before < 40).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_2900
     * @tc.name      testDateCrypto0029
     * @tc.desc      Verify withRetry exhausts the configured retries on a permanently failing action, reports failure and applies the exponential backoff.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateCrypto0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // An action that fails on every attempt with two retries and a 10 millisecond base delay.
      let attempts: number = 0;
      const before: number = Date.now();
      const result: boolean = await AsyncUtils.withRetry(async (): Promise<void> => {
        attempts++;
        throw new Error('always fails');
      }, 2, 10);
      const after: number = Date.now();
      // All attempts failed so the wrapper reports failure.
      expect(result).assertFalse();
      // The first attempt plus two retries ran three times in total.
      expect(attempts).assertEqual(3);
      // The two backoff waits of 10 and 20 milliseconds really elapsed.
      expect(after - before >= 30).assertTrue();
      // The exhausted retries still finished promptly.
      expect(after - before < 10000).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_3000
     * @tc.name      testDateCrypto0030
     * @tc.desc      Verify withRetry recovers when a transient action fails twice and succeeds on the third attempt within the retry budget.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateCrypto0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // An action that fails twice and succeeds on the third attempt.
      let attempts: number = 0;
      const before: number = Date.now();
      const result: boolean = await AsyncUtils.withRetry(async (): Promise<void> => {
        attempts++;
        if (attempts < 3) {
          throw new Error('transient failure');
        }
      }, 3, 10);
      const after: number = Date.now();
      // The third attempt succeeded so the wrapper reports success.
      expect(result).assertTrue();
      // Exactly the two failing attempts plus the successful one ran.
      expect(attempts).assertEqual(3);
      // The two backoff waits of 10 and 20 milliseconds really elapsed before recovery.
      expect(after - before >= 30).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_DATECRYPTO_3100
     * @tc.name      testDateCrypto0031
     * @tc.desc      Verify withRetry clamps a negative retry count to zero retries so a failing action runs once with no backoff waits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateCrypto0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // A negative retry count must behave like zero retries.
      let attempts: number = 0;
      const before: number = Date.now();
      const result: boolean = await AsyncUtils.withRetry(async (): Promise<void> => {
        attempts++;
        throw new Error('no recovery');
      }, -5, 25);
      const after: number = Date.now();
      // The single attempt failed so the wrapper reports failure.
      expect(result).assertFalse();
      // The clamped retry budget ran the action exactly once.
      expect(attempts).assertEqual(1);
      // No backoff wait elapsed because zero retries were configured.
      expect(after - before < 50).assertTrue();
    });
  });
}
