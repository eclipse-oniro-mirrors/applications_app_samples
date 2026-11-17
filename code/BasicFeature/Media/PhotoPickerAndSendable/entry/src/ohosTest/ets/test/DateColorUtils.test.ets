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
import { DateUtils, ColorUtils } from 'photopickersendable';

/** Milliseconds of one day, reused by the calendar arithmetic checks. */
const MS_PER_DAY: number = 86400000;
/** Fallback ARGB integer returned by hexToNumber for invalid text, equals 0xFF000000. */
const FALLBACK_COLOR: number = -16777216;

/**
 * Registers every date and color helper case of the shared library.
 * Date inputs are built from local Date constructors so the expectations stay
 * stable in any device time zone. Color helpers are pure math without any
 * platform dependency, no UI context is required.
 */
export default function dateColorUtilsTest() {
  describe('DateColorUtilsTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0100
     * @tc.name      testDateColorUtil0001
     * @tc.desc      Verify formatDate renders zero padded year, month and day
     *               fields including the leap day and the month boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateColorUtil0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const janMorning: number = new Date(2026, 0, 15, 10, 30, 45).getTime();
      expect(DateUtils.formatDate(janMorning)).assertEqual('2026-01-15');
      const yearEnd: number = new Date(2026, 11, 31, 23, 59, 59).getTime();
      expect(DateUtils.formatDate(yearEnd)).assertEqual('2026-12-31');
      const leapDay: number = new Date(2024, 1, 29).getTime();
      expect(DateUtils.formatDate(leapDay)).assertEqual('2024-02-29');
      const earlyApril: number = new Date(2025, 3, 5).getTime();
      expect(DateUtils.formatDate(earlyApril)).assertEqual('2025-04-05');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0101
     * @tc.name      testDateColorUtil0002
     * @tc.desc      Verify formatTime renders zero padded hour, minute and
     *               second fields across the whole daily range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateColorUtil0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const morning: number = new Date(2026, 0, 15, 9, 5, 3).getTime();
      expect(DateUtils.formatTime(morning)).assertEqual('09:05:03');
      const lateNight: number = new Date(2026, 5, 1, 23, 59, 59).getTime();
      expect(DateUtils.formatTime(lateNight)).assertEqual('23:59:59');
      const midnight: number = new Date(2026, 5, 1, 0, 0, 0).getTime();
      expect(DateUtils.formatTime(midnight)).assertEqual('00:00:00');
      const noonish: number = new Date(2026, 5, 1, 12, 30, 15).getTime();
      expect(DateUtils.formatTime(noonish)).assertEqual('12:30:15');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0102
     * @tc.name      testDateColorUtil0003
     * @tc.desc      Verify formatDateTime joins the date part and the time
     *               part with one space for daytime and near midnight inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateColorUtil0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const instant: number = new Date(2026, 5, 20, 14, 8, 9).getTime();
      expect(DateUtils.formatDateTime(instant)).assertEqual('2026-06-20 14:08:09');
      expect(DateUtils.formatDateTime(instant)).assertEqual(
        DateUtils.formatDate(instant) + ' ' + DateUtils.formatTime(instant));
      const newYear: number = new Date(2027, 0, 1, 0, 0, 1).getTime();
      expect(DateUtils.formatDateTime(newYear)).assertEqual('2027-01-01 00:00:01');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0103
     * @tc.name      testDateColorUtil0004
     * @tc.desc      Verify dayStart moves an instant to the local midnight of
     *               the same day and dayEnd lands on the last millisecond of
     *               that day.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateColorUtil0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const base: number = new Date(2026, 0, 15, 10, 30, 45, 500).getTime();
      const start: number = DateUtils.dayStart(base);
      const end: number = DateUtils.dayEnd(base);
      expect(start).assertEqual(new Date(2026, 0, 15).getTime());
      expect(end - start).assertEqual(86399999);
      expect(DateUtils.formatTime(start)).assertEqual('00:00:00');
      expect(DateUtils.formatTime(end)).assertEqual('23:59:59');
      expect(DateUtils.formatDate(end)).assertEqual('2026-01-15');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0104
     * @tc.name      testDateColorUtil0005
     * @tc.desc      Verify todayStart returns the local midnight of the
     *               current day, never ahead of the current instant and never
     *               older than one day.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateColorUtil0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const now: number = Date.now();
      const today: number = DateUtils.todayStart();
      expect(today <= now).assertTrue();
      expect(now - today < MS_PER_DAY).assertTrue();
      expect(DateUtils.formatTime(today)).assertEqual('00:00:00');
      expect(DateUtils.dayStart(today)).assertEqual(today);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0105
     * @tc.name      testDateColorUtil0006
     * @tc.desc      Verify addDays and addHours shift the instant by the
     *               requested amount, support zero and negative offsets and
     *               cross the month boundary on the formatted calendar.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateColorUtil0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const base: number = new Date(2026, 0, 15, 12, 0, 0).getTime();
      expect(DateUtils.addDays(base, 3)).assertEqual(base + 259200000);
      expect(DateUtils.addDays(base, -1)).assertEqual(base - MS_PER_DAY);
      expect(DateUtils.addDays(base, 0)).assertEqual(base);
      expect(DateUtils.formatDate(DateUtils.addDays(base, 20))).assertEqual('2026-02-04');
      expect(DateUtils.addHours(base, 5)).assertEqual(base + 18000000);
      expect(DateUtils.addHours(base, -2)).assertEqual(base - 7200000);
      expect(DateUtils.formatTime(DateUtils.addHours(base, 5))).assertEqual('17:00:00');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0106
     * @tc.name      testDateColorUtil0007
     * @tc.desc      Verify diffMs returns the signed millisecond distance for
     *               forward, backward and equal instants.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateColorUtil0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(DateUtils.diffMs(1000, 3500)).assertEqual(2500);
      expect(DateUtils.diffMs(3500, 1000)).assertEqual(-2500);
      expect(DateUtils.diffMs(500, 500)).assertEqual(0);
      const morning: number = new Date(2026, 0, 15, 8, 0, 0).getTime();
      const evening: number = new Date(2026, 0, 15, 20, 0, 0).getTime();
      expect(DateUtils.diffMs(morning, evening)).assertEqual(43200000);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0107
     * @tc.name      testDateColorUtil0008
     * @tc.desc      Verify diffDays truncates the distance toward zero so a
     *               partial day counts as zero, a full day as one and a
     *               reversed pair as negative.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateColorUtil0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(DateUtils.diffDays(0, MS_PER_DAY)).assertEqual(1);
      expect(DateUtils.diffDays(0, MS_PER_DAY - 1)).assertEqual(0);
      expect(DateUtils.diffDays(MS_PER_DAY, 0)).assertEqual(-1);
      expect(DateUtils.diffDays(0, MS_PER_DAY * 2.5)).assertEqual(2);
      expect(DateUtils.diffDays(-MS_PER_DAY, 0)).assertEqual(1);
      expect(DateUtils.diffDays(0, 0)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0108
     * @tc.name      testDateColorUtil0009
     * @tc.desc      Verify relativeTime labels recent past instants with the
     *               fitting unit and plural form, measured against the current
     *               clock with a wide timing margin.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateColorUtil0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Ten seconds back stays inside the one minute window with fifty seconds of slack.
      expect(DateUtils.relativeTime(Date.now() - 10000)).assertEqual('just now');
      // Ninety seconds back yields one minute until the two minute mark with thirty seconds of slack.
      expect(DateUtils.relativeTime(Date.now() - 90000)).assertEqual('1 minute ago');
      // Two hours back yields two hours until the three hour mark with one hour of slack.
      expect(DateUtils.relativeTime(Date.now() - 7200000)).assertEqual('2 hours ago');
      // Three days back yields three days until the seven day mark with four days of slack.
      expect(DateUtils.relativeTime(Date.now() - 3 * MS_PER_DAY)).assertEqual('3 days ago');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0109
     * @tc.name      testDateColorUtil0010
     * @tc.desc      Verify relativeTime prefixes future instants with the in
     *               direction and approximates one week and beyond as months.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateColorUtil0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Half an hour of margin avoids crossing the two-hour boundary as the clock advances.
      expect(DateUtils.relativeTime(Date.now() + 9000000)).assertEqual('in 2 hours');
      // Twenty eight days back approximates to one month until the two month mark.
      expect(DateUtils.relativeTime(Date.now() - 28 * MS_PER_DAY)).assertEqual('1 month ago');
      // Fifty six days back approximates to two months until the three month mark.
      expect(DateUtils.relativeTime(Date.now() - 56 * MS_PER_DAY)).assertEqual('2 months ago');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0110
     * @tc.name      testDateColorUtil0011
     * @tc.desc      Verify isSameDay groups instants of one local calendar day
     *               and splits them across the midnight boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateColorUtil0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const morningTs: number = new Date(2026, 0, 15, 8, 0, 0).getTime();
      const nightTs: number = new Date(2026, 0, 15, 23, 59, 59).getTime();
      expect(DateUtils.isSameDay(morningTs, nightTs)).assertTrue();
      expect(DateUtils.isSameDay(morningTs, morningTs)).assertTrue();
      const nextMorningTs: number = new Date(2026, 0, 16, 0, 0, 1).getTime();
      expect(DateUtils.isSameDay(morningTs, nextMorningTs)).assertFalse();
      const midnightBoundary: number = new Date(2026, 0, 16, 0, 0, 0).getTime();
      expect(DateUtils.isSameDay(nightTs, midnightBoundary)).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0111
     * @tc.name      testDateColorUtil0012
     * @tc.desc      Verify nowMs tracks the platform clock with monotonic
     *               readings and stays within a small window of Date.now.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateColorUtil0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const first: number = DateUtils.nowMs();
      const second: number = DateUtils.nowMs();
      expect(second >= first).assertTrue();
      expect(first > 0).assertTrue();
      expect(Math.abs(DateUtils.nowMs() - Date.now()) < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0112
     * @tc.name      testDateColorUtil0013
     * @tc.desc      Verify isValidHex accepts six and eight digit bodies with
     *               an optional hash and rejects wrong lengths and non hex
     *               characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateColorUtil0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(ColorUtils.isValidHex('#123456')).assertTrue();
      expect(ColorUtils.isValidHex('123456')).assertTrue();
      expect(ColorUtils.isValidHex('#12345678')).assertTrue();
      expect(ColorUtils.isValidHex('#ABCDEF')).assertTrue();
      expect(ColorUtils.isValidHex('#12345')).assertFalse();
      expect(ColorUtils.isValidHex('#123456789')).assertFalse();
      expect(ColorUtils.isValidHex('#GGGGGG')).assertFalse();
      expect(ColorUtils.isValidHex('#12 456')).assertFalse();
      expect(ColorUtils.isValidHex('')).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0113
     * @tc.name      testDateColorUtil0014
     * @tc.desc      Verify hexToNumber expands six digit bodies with an opaque
     *               alpha byte and wraps the ARGB integer into the signed
     *               thirty two bit representation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateColorUtil0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // 0xFFFF0000 wraps to the signed value minus 65536.
      expect(ColorUtils.hexToNumber('#FF0000')).assertEqual(-65536);
      // The hash prefix is optional and must not change the result.
      expect(ColorUtils.hexToNumber('FF0000')).assertEqual(-65536);
      // 0xFF00FF00 wraps to the signed value minus 16711936.
      expect(ColorUtils.hexToNumber('#00FF00')).assertEqual(-16711936);
      expect(ColorUtils.hexToNumber('#000000')).assertEqual(-16777216);
      expect(ColorUtils.hexToNumber('#7FFFFFFF')).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0114
     * @tc.name      testDateColorUtil0015
     * @tc.desc      Verify hexToNumber falls back to opaque black for wrong
     *               lengths, non hex characters and missing text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateColorUtil0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(ColorUtils.hexToNumber('#12345')).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.hexToNumber('abc')).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.hexToNumber('#GGHHII')).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.hexToNumber('#123456789')).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.hexToNumber('')).assertEqual(FALLBACK_COLOR);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0115
     * @tc.name      testDateColorUtil0016
     * @tc.desc      Verify numberToHex renders every ARGB channel as two
     *               upper case digits with a leading hash.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateColorUtil0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(ColorUtils.numberToHex(-65536)).assertEqual('#FFFF0000');
      expect(ColorUtils.numberToHex(255)).assertEqual('#000000FF');
      expect(ColorUtils.numberToHex(2147483647)).assertEqual('#7FFFFFFF');
      expect(ColorUtils.numberToHex(0)).assertEqual('#00000000');
      expect(ColorUtils.numberToHex(-16777216)).assertEqual('#FF000000');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0116
     * @tc.name      testDateColorUtil0017
     * @tc.desc      Verify hexToNumber and numberToHex convert back and forth
     *               without losing any channel.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateColorUtil0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(ColorUtils.numberToHex(ColorUtils.hexToNumber('#00FF7F'))).assertEqual('#FF00FF7F');
      expect(ColorUtils.hexToNumber(ColorUtils.numberToHex(-16711936))).assertEqual(-16711936);
      expect(ColorUtils.numberToHex(ColorUtils.hexToNumber('abcdef'))).assertEqual('#FFABCDEF');
      // 0xFFABCDEF wraps to the signed value minus 5517841.
      expect(ColorUtils.hexToNumber('#FFABCDEF')).assertEqual(-5517841);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0117
     * @tc.name      testDateColorUtil0018
     * @tc.desc      Verify withAlpha replaces the alpha channel, clamps out of
     *               range alpha values and rounds a fractional alpha.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateColorUtil0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(ColorUtils.numberToHex(ColorUtils.withAlpha(-65536, 128))).assertEqual('#80FF0000');
      // The fractional alpha is rounded to the byte grid.
      expect(ColorUtils.numberToHex(ColorUtils.withAlpha(-65536, 127.6))).assertEqual('#80FF0000');
      expect(ColorUtils.numberToHex(ColorUtils.withAlpha(-65536, 0))).assertEqual('#00FF0000');
      expect(ColorUtils.withAlpha(0, 300)).assertEqual(FALLBACK_COLOR);
      expect(ColorUtils.withAlpha(-1, -5)).assertEqual(16777215);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0118
     * @tc.name      testDateColorUtil0019
     * @tc.desc      Verify blend interpolates the channels at the midpoint,
     *               returns the base color for weight zero and the overlay
     *               color for weight one, and clamps out of range weights.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateColorUtil0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const black: number = -16777216;
      const white: number = -1;
      expect(ColorUtils.numberToHex(ColorUtils.blend(black, white, 0.5))).assertEqual('#FF808080');
      expect(ColorUtils.blend(black, white, 0.5)).assertEqual(-8355712);
      expect(ColorUtils.blend(black, white, 0)).assertEqual(black);
      expect(ColorUtils.blend(black, white, 1)).assertEqual(white);
      expect(ColorUtils.blend(black, white, -3)).assertEqual(black);
      expect(ColorUtils.blend(black, white, 2)).assertEqual(white);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0119
     * @tc.name      testDateColorUtil0020
     * @tc.desc      Verify blend rounds the interpolated red channel of a
     *               narrow ten to twenty mix to fifteen and keeps the other
     *               channels untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateColorUtil0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // 0xFF0A0000 wraps to the signed value minus 16121856.
      const redTen: number = -16121856;
      // 0xFF140000 wraps to the signed value minus 15466496.
      const redTwenty: number = -15466496;
      const blended: number = ColorUtils.blend(redTen, redTwenty, 0.5);
      expect(ColorUtils.numberToHex(blended)).assertEqual('#FF0F0000');
      expect(ColorUtils.toRgbString(blended)).assertEqual('rgb(15, 0, 0)');
      expect(blended).assertEqual(-15794176);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0120
     * @tc.name      testDateColorUtil0021
     * @tc.desc      Verify invert negates the RGB channels while keeping the
     *               alpha channel, for opaque and semi transparent colors.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateColorUtil0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(ColorUtils.invert(-16777216)).assertEqual(-1);
      expect(ColorUtils.invert(-1)).assertEqual(-16777216);
      expect(ColorUtils.numberToHex(ColorUtils.invert(-65536))).assertEqual('#FF00FFFF');
      // 0x80FF0000 wraps to the signed value minus 2130771968.
      const semiRed: number = -2130771968;
      expect(ColorUtils.numberToHex(ColorUtils.invert(semiRed))).assertEqual('#8000FFFF');
      expect(ColorUtils.invert(semiRed)).assertEqual(-2147418113);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATECOLOR_0121
     * @tc.name      testDateColorUtil0022
     * @tc.desc      Verify toRgbString renders the red, green and blue
     *               channels in CSS order and ignores the alpha channel.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateColorUtil0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(ColorUtils.toRgbString(-65536)).assertEqual('rgb(255, 0, 0)');
      expect(ColorUtils.toRgbString(255)).assertEqual('rgb(0, 0, 255)');
      expect(ColorUtils.toRgbString(-15654349)).assertEqual('rgb(17, 34, 51)');
      // 0x00FF0000 has a transparent alpha byte that must not leak into the text.
      expect(ColorUtils.toRgbString(16711680)).assertEqual('rgb(255, 0, 0)');
      expect(ColorUtils.toRgbString(-16777216)).assertEqual('rgb(0, 0, 0)');
    });
  });
}
