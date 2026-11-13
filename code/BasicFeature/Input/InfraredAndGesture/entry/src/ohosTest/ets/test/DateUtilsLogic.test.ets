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
import { DateUtils } from 'common';

/**
 * Applies a pattern to a millisecond timestamp by substituting the six supported
 * tokens with padded local time components. This stays one substitution per token
 * and never loops over the components the way the production token table does.
 */
function applyPattern(millis: number, pattern: string): string {
  const date: Date = new Date(millis);
  let text: string = pattern;
  text = text.split('yyyy').join(date.getFullYear().toString());
  text = text.split('MM').join(padTwo(date.getMonth() + 1));
  text = text.split('dd').join(padTwo(date.getDate()));
  text = text.split('HH').join(padTwo(date.getHours()));
  text = text.split('mm').join(padTwo(date.getMinutes()));
  text = text.split('ss').join(padTwo(date.getSeconds()));
  return text;
}






/** Renders the expected 'yyyy-MM-dd HH:mm:ss' text of the wall clock instant. */
function expectedNow(): string {
  return applyPattern(Date.now(), DEFAULT_PATTERN);
}








/**
 * DateUtils 纯逻辑补充套件。
 *
 * 覆盖范围：formatTimestamp / formatTimestampWithPattern / formatDuration /
 *          elapsedSince / isSameDay / nowMillis 六个公开静态方法。
 *
 * 期望值来源：时间戳均为固定常量（0、1000、1700000000000、1700000000001、
 * 1735689599000 等）。格式化类用例的期望字符串用本地 Date 组件取年/月/日/时/分/秒，
 * 再用本文件自写的 padTwo 补零拼接得到，不依赖设备时区；isSameDay 等日界用例的
 * 常量按 UTC+8 构造，需在 UTC+8 时区执行；elapsedSince 与 nowMillis 相关用例
 * 读取设备当前时间，要求系统时间准确。
 *
 * 明确不覆盖的分支：AppLogger.warn 只写日志没有返回值，非法入参的告警日志
 * 无法从外部观测，只能通过“返回空串/返回 0/false 且不抛异常”间接覆盖。
 */

/** Hilog domain reserved for the DateUtils logic tests. */
const DOMAIN: number = 0xF825;
/** Prefix added to every case log so the logs can be filtered by suite. */
const SUITE_PREFIX: string = 'MeetingScene_DateUtils_';

/** Milliseconds in one second. */
const MS_PER_SECOND: number = 1000;
/** Seconds in one minute. */
const SECONDS_PER_MINUTE: number = 60;
/** Minutes in one hour. */
const MINUTES_PER_HOUR: number = 60;
/** One hour expressed in milliseconds. */
const ONE_HOUR_MS: number = 3600000;
/** One day expressed in milliseconds. */
const ONE_DAY_MS: number = 86400000;
/** One minute expressed in milliseconds. */
const ONE_MINUTE_MS: number = 60000;
/** Offset between UTC and UTC+8, used to build zone independent day boundaries. */
const UTC_PLUS_EIGHT_OFFSET_MS: number = 8 * ONE_HOUR_MS;
/** Every day starts eight hours after the UTC epoch in UTC+8. */
const DAY_ORIGIN_OFFSET_MS: number = UTC_PLUS_EIGHT_OFFSET_MS;

/** 1970-01-01 08:00:00 in UTC+8, the first positive timestamp of the epoch day. */
const T_EPOCH_DAY: number = 0;
/** One millisecond after the epoch, still the same second. */
const T_EPOCH_ONE_MS: number = 1;
/** 1970-01-01 08:00:59 in UTC+8, last second of the epoch minute. */
const T_EPOCH_59S: number = 59999;
/** 1970-01-01 08:01:00 in UTC+8, first second of the second minute. */
const T_EPOCH_1M: number = 60000;
/** 1970-01-01 08:59:59 in UTC+8, last second of the epoch hour. */
const T_EPOCH_59M59S: number = 3599999;
/** 1970-01-01 09:00:00 in UTC+8, first second of the second hour. */
const T_EPOCH_1H: number = 3600000;
/** 1970-01-02 08:00:00 in UTC+8, exactly one UTC+8 day after the epoch day start. */
const T_EPOCH_NEXT_DAY: number = 86400000;
/** 2023-11-15 06:13:20 in UTC+8. */
const T_20231115: number = 1700000000000;
/** One millisecond after {@link T_20231115}. */
const T_20231115_PLUS_1: number = 1700000000001;
/** 2025-01-01 07:59:59 in UTC+8, last second of the previous year. */
const T_2025_EVE: number = 1735689599000;
/** 2025-01-01 08:00:00 in UTC+8, first second of the new year day. */
const T_2025_START: number = 1735689600000;
/** 2023-01-01 08:00:00 in UTC+8, first day of 2023. */
const T_2023_START: number = 1672531200000;
/** 2024-01-01 08:00:00 in UTC+8, first day of the leap year 2024. */
const T_2024_START: number = 1704067200000;
/** 2024-01-02 08:00:00 in UTC+8, the day after {@link T_2024_START}. */
const T_2024_SECOND_DAY: number = 1704153600000;
/** 2024-01-03 08:00:00 in UTC+8, the third day of 2024. */
const T_2024_THIRD_DAY: number = 1704240000000;
/** 2024-01-04 08:00:00 in UTC+8, the fourth day of 2024. */
const T_2024_FOURTH_DAY: number = 1704326400000;
/** 2024-01-08 08:00:00 in UTC+8, one UTC+8 week after {@link T_2024_START}. */
const T_2024_WEEK_LATER: number = 1704672000000;
/** 2024-01-12 08:00:00 in UTC+8. */
const T_2024_TWELVE: number = 1705017600000;
/** 2024-02-01 08:00:00 in UTC+8, first day of the second month. */
const T_2024_FEB_START: number = 1706745600000;
/** 2024-02-29 08:00:00 in UTC+8, leap day of 2024. */
const T_2024_LEAP_DAY: number = 1709164800000;
/** 2024-03-01 07:59:59 in UTC+8, last second of March 1st, one day after the leap day. */
const T_2024_MAR_FIRST_END: number = 1709251199000;
/** 2024-03-01 08:00:00 in UTC+8, first second of March. */
const T_2024_MAR_START: number = 1709251200000;
/** 2024-03-02 08:00:00 in UTC+8. */
/** 2023-12-31 08:00:00 in UTC+8, last day of 2023. */
const T_2023_LAST_DAY: number = 1703980800000;
/** 2025-01-03 08:00:00 in UTC+8. */

/** Expectation source used by the pattern probes: the local Date component. */
const DEFAULT_PATTERN: string = 'yyyy-MM-dd HH:mm:ss';
/** Slash separated date pattern. */
const SLASH_DATE_PATTERN: string = 'yyyy/MM/dd';
/** Time only pattern. */
const TIME_ONLY_PATTERN: string = 'HH:mm:ss';
/** Year only pattern. */
const YEAR_ONLY_PATTERN: string = 'yyyy';
/** Day first pattern. */
const DAY_FIRST_PATTERN: string = 'dd-MM-yyyy';
/** Pattern with no token at all, it must be returned verbatim. */
const LITERAL_PATTERN: string = 'Room A3';
/** Pattern with two different tokens separated by a dash. */
const MONTH_DAY_PATTERN: string = 'MM-dd';
/** Pattern with hour and minute only. */
const HOUR_MINUTE_PATTERN: string = 'HH:mm';
/** Pattern with second only. */
const SECOND_ONLY_PATTERN: string = 'ss';
/** Pattern using only a colon, no token can be substituted. */
const COLON_PATTERN: string = ':';
/** Empty pattern, the production code falls back to the default pattern. */
const EMPTY_PATTERN: string = '';

/** Regular expression describing the default output layout. */
const DEFAULT_PATTERN_REGEX: RegExp = /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$/;
/** Regular expression describing the slash separated date layout. */
const SLASH_PATTERN_REGEX: RegExp = /^\d{4}\/\d{2}\/\d{2}$/;
/** Regular expression describing the time only layout. */
const TIME_PATTERN_REGEX: RegExp = /^\d{2}:\d{2}:\d{2}$/;
/** Regular expression describing the day first layout. */
const DAY_FIRST_REGEX: RegExp = /^\d{2}-\d{2}-\d{4}$/;
/** Regular expression describing the four digit year layout. */
const YEAR_REGEX: RegExp = /^\d{4}$/;

/** Padding width of a time component, mirrors the production constant. */
const PAD_WIDTH_TWO: number = 2;
/** Width of the year component rendered by the yyyy token. */
const YEAR_WIDTH: number = 4;

/** Lower bound of the loose elapsed window used by the elapsedSince probes. */
const ELAPSED_MIN: number = 0;
/** Upper bound of the loose elapsed window used by the elapsedSince probes. */
const ELAPSED_MAX: number = 60000;
/** A start point one hour in the past, elapsed must stay positive. */
const ONE_HOUR_AGO_START: number = 1000;
/** A start point one day in the past, elapsed must stay positive. */
const ONE_DAY_AGO_START: number = 0;

/**
 * Pads a numeric component to at least two digits.
 * This is the oracle for the production padding and must be kept independent.
 */
function padTwo(value: number): string {
  let text: string = value.toString();
  while (text.length < PAD_WIDTH_TWO) {
    text = '0' + text;
  }
  return text;
}

/** Local year of the given timestamp, used by the yyyy expectations. */
function yearOf(millis: number): number {
  return new Date(millis).getFullYear();
}

/** Local month (1 based) of the given timestamp. */
function monthOf(millis: number): number {
  return new Date(millis).getMonth() + 1;
}

/** Local day of month of the given timestamp. */
function dayOf(millis: number): number {
  return new Date(millis).getDate();
}

/** Local hour of the given timestamp. */
function hourOf(millis: number): number {
  return new Date(millis).getHours();
}

/** Local minute of the given timestamp. */
function minuteOf(millis: number): number {
  return new Date(millis).getMinutes();
}

/** Local second of the given timestamp, already padded to two digits. */
function secondOf(millis: number): string {
  return padTwo(new Date(millis).getSeconds());
}

/** Builds 'yyyy-MM-dd HH:mm:ss' from the local Date components. */
function expectedDefault(millis: number): string {
  return `${yearOf(millis)}-${padTwo(monthOf(millis))}-${padTwo(dayOf(millis))} `
    + `${padTwo(hourOf(millis))}:${padTwo(minuteOf(millis))}:${secondOf(millis)}`;
}

/** Builds 'yyyy/MM/dd' from the local Date components. */
function expectedSlashDate(millis: number): string {
  return `${yearOf(millis)}/${padTwo(monthOf(millis))}/${padTwo(dayOf(millis))}`;
}

/** Builds 'HH:mm:ss' from the local Date components. */
function expectedTimeOnly(millis: number): string {
  return `${padTwo(hourOf(millis))}:${padTwo(minuteOf(millis))}:${secondOf(millis)}`;
}

/** Builds 'yyyy' from the local Date components. */
function expectedYearOnly(millis: number): string {
  return yearOf(millis).toString();
}

/** Builds 'dd-MM-yyyy' from the local Date components. */
function expectedDayFirst(millis: number): string {
  return `${padTwo(dayOf(millis))}-${padTwo(monthOf(millis))}-${yearOf(millis)}`;
}

/** Builds 'MM-dd' from the local Date components. */
function expectedMonthDay(millis: number): string {
  return `${padTwo(monthOf(millis))}-${padTwo(dayOf(millis))}`;
}

/** Builds 'HH:mm' from the local Date components. */
function expectedHourMinute(millis: number): string {
  return `${padTwo(hourOf(millis))}:${padTwo(minuteOf(millis))}`;
}

/** Builds the fixed duration layout 'HH:mm:ss' from a millisecond duration. */
function expectedDuration(millis: number): string {
  const totalSeconds: number = Math.floor(millis / MS_PER_SECOND);
  const seconds: number = totalSeconds % SECONDS_PER_MINUTE;
  const totalMinutes: number = Math.floor(totalSeconds / SECONDS_PER_MINUTE);
  const minutes: number = totalMinutes % MINUTES_PER_HOUR;
  const hours: number = Math.floor(totalMinutes / MINUTES_PER_HOUR);
  return `${padTwo(hours)}:${padTwo(minutes)}:${padTwo(seconds)}`;
}

/** Returns true when the given millis value cannot be rendered. */
function isInvalidMillis(millis: number): boolean {
  return !Number.isFinite(millis) || millis < 0;
}

/** Returns true when the text contains at least one supported pattern token. */
function containsAnyToken(text: string): boolean {
  const tokens: string[] = ['yyyy', 'MM', 'dd', 'HH', 'mm', 'ss'];
  for (const token of tokens) {
    if (text.includes(token)) {
      return true;
    }
  }
  return false;
}

export default function dateUtilsLogicTest() {
  describe('DateUtilsLogicTest', () => {

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0100
     * @tc.name      testDateUtils0001
     * @tc.desc      Verify formatTimestamp renders the epoch constant with the fixed default layout.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0001';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const formatted: string = DateUtils.formatTimestamp(T_EPOCH_DAY);
      expect(formatted).assertEqual(expectedDefault(T_EPOCH_DAY));
      expect(formatted.length).assertEqual(DEFAULT_PATTERN.length);
      expect(DEFAULT_PATTERN_REGEX.test(formatted)).assertTrue();
      // The epoch day keeps the fixed layout separators at index 4, 7 and 10.
      expect(formatted.charAt(4)).assertEqual('-');
      expect(formatted.charAt(7)).assertEqual('-');
      expect(formatted.charAt(10)).assertEqual(' ');
      expect(formatted.charAt(13)).assertEqual(':');
      expect(formatted.charAt(16)).assertEqual(':');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0101
     * @tc.name      testDateUtils0002
     * @tc.desc      Verify formatTimestamp matches the local Date components on the reference constants.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0002';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const samples: number[] = [T_20231115, T_20231115_PLUS_1, T_2025_EVE, T_2025_START, T_2024_LEAP_DAY];
      for (const millis of samples) {
        const formatted: string = DateUtils.formatTimestamp(millis);
        expect(formatted).assertEqual(expectedDefault(millis));
        expect(DEFAULT_PATTERN_REGEX.test(formatted)).assertTrue();
      }
      // Five fixed constants, each rendered once.
      expect(samples.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0102
     * @tc.name      testDateUtils0003
     * @tc.desc      Verify formatTimestamp keeps the year component four digits wide for every fixture.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0003';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const samples: number[] = [T_EPOCH_DAY, T_2023_START, T_2024_START, T_2025_START];
      for (const millis of samples) {
        const formatted: string = DateUtils.formatTimestamp(millis);
        const yearText: string = formatted.substring(0, YEAR_WIDTH);
        expect(yearText.length).assertEqual(YEAR_WIDTH);
        expect(yearText).assertEqual(yearOf(millis).toString());
        expect(YEAR_REGEX.test(yearText)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0103
     * @tc.name      testDateUtils0004
     * @tc.desc      Verify formatTimestamp is deterministic: the same constant always yields the same text.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0004';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const first: string = DateUtils.formatTimestamp(T_20231115);
      const second: string = DateUtils.formatTimestamp(T_20231115);
      const third: string = DateUtils.formatTimestamp(T_20231115);
      expect(second).assertEqual(first);
      expect(third).assertEqual(first);
      expect(first.length).assertEqual(expectedDefault(T_20231115).length);
      // A one millisecond difference stays inside the same second of the layout.
      expect(DateUtils.formatTimestamp(T_20231115_PLUS_1)).assertEqual(expectedDefault(T_20231115_PLUS_1));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0104
     * @tc.name      testDateUtils0005
     * @tc.desc      Verify formatTimestamp yields an empty string for a negative timestamp.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0005';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.formatTimestamp(-1)).assertEqual('');
      expect(DateUtils.formatTimestamp(-1000)).assertEqual('');
      expect(DateUtils.formatTimestamp(-ONE_DAY_MS)).assertEqual('');
      expect(DateUtils.formatTimestamp(-1).length).assertEqual(0);
      expect(Number.isFinite(DateUtils.formatTimestamp(-1).length)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0105
     * @tc.name      testDateUtils0006
     * @tc.desc      Verify formatTimestamp yields an empty string for NaN and both infinities.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0006';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.formatTimestamp(NaN)).assertEqual('');
      expect(DateUtils.formatTimestamp(Infinity)).assertEqual('');
      expect(DateUtils.formatTimestamp(-Infinity)).assertEqual('');
      // The invalid branches must never throw and never emit the layout separators.
      expect(DateUtils.formatTimestamp(NaN) === '').assertTrue();
      expect(DEFAULT_PATTERN_REGEX.test(DateUtils.formatTimestamp(Infinity))).assertFalse();
      expect(DEFAULT_PATTERN_REGEX.test(DateUtils.formatTimestamp(-Infinity))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0106
     * @tc.name      testDateUtils0007
     * @tc.desc      Verify formatTimestamp rejects every invalid constant while accepting the valid ones.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0007';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const probes: number[] = [-1, -ONE_HOUR_MS, NaN, Infinity, -Infinity, 0, T_EPOCH_ONE_MS, T_20231115];
      let invalidCount: number = 0;
      let validCount: number = 0;
      for (const millis of probes) {
        const formatted: string = DateUtils.formatTimestamp(millis);
        if (isInvalidMillis(millis)) {
          expect(formatted).assertEqual('');
          invalidCount++;
        } else {
          expect(formatted).assertEqual(expectedDefault(millis));
          validCount++;
        }
      }
      expect(invalidCount).assertEqual(5);
      expect(validCount).assertEqual(3);
      expect(invalidCount + validCount).assertEqual(probes.length);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0107
     * @tc.name      testDateUtils0008
     * @tc.desc      Verify formatTimestampWithPattern renders an explicit default pattern like formatTimestamp.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0008';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const explicit: string = DateUtils.formatTimestampWithPattern(T_20231115, DEFAULT_PATTERN);
      expect(explicit).assertEqual(DateUtils.formatTimestamp(T_20231115));
      expect(explicit).assertEqual(expectedDefault(T_20231115));
      expect(DEFAULT_PATTERN_REGEX.test(explicit)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0108
     * @tc.name      testDateUtils0009
     * @tc.desc      Verify the empty pattern falls back to the default layout instead of an empty result.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0009';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const withEmptyPattern: string = DateUtils.formatTimestampWithPattern(T_20231115, EMPTY_PATTERN);
      expect(withEmptyPattern).assertEqual(DateUtils.formatTimestamp(T_20231115));
      expect(withEmptyPattern).assertEqual(expectedDefault(T_20231115));
      expect(withEmptyPattern.length).assertEqual(DEFAULT_PATTERN.length);
      expect(withEmptyPattern.length > 0).assertTrue();
      expect(DEFAULT_PATTERN_REGEX.test(withEmptyPattern)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0109
     * @tc.name      testDateUtils0010
     * @tc.desc      Verify the slash separated date pattern renders year, month and day only.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0010';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const formatted: string = DateUtils.formatTimestampWithPattern(T_2024_LEAP_DAY, SLASH_DATE_PATTERN);
      expect(formatted).assertEqual(expectedSlashDate(T_2024_LEAP_DAY));
      expect(SLASH_PATTERN_REGEX.test(formatted)).assertTrue();
      // The date only layout never emits the time separator.
      expect(formatted.split(':').length).assertEqual(1);
      expect(formatted.split('/').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0110
     * @tc.name      testDateUtils0011
     * @tc.desc      Verify the time only pattern renders hours, minutes and seconds without any date part.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0011';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const formatted: string = DateUtils.formatTimestampWithPattern(T_20231115, TIME_ONLY_PATTERN);
      expect(formatted).assertEqual(expectedTimeOnly(T_20231115));
      expect(TIME_PATTERN_REGEX.test(formatted)).assertTrue();
      // The time only layout never emits a date separator.
      expect(formatted.split('-').length).assertEqual(1);
      expect(formatted.split('/').length).assertEqual(1);
      expect(formatted.split(':').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0111
     * @tc.name      testDateUtils0012
     * @tc.desc      Verify the year only pattern renders exactly the four digit year.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0012';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const formatted: string = DateUtils.formatTimestampWithPattern(T_2025_START, YEAR_ONLY_PATTERN);
      expect(formatted).assertEqual(expectedYearOnly(T_2025_START));
      expect(formatted.length).assertEqual(YEAR_WIDTH);
      expect(YEAR_REGEX.test(formatted)).assertTrue();
      expect(DateUtils.formatTimestampWithPattern(T_2024_START, YEAR_ONLY_PATTERN))
        .assertEqual(expectedYearOnly(T_2024_START));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0112
     * @tc.name      testDateUtils0013
     * @tc.desc      Verify the day first pattern puts the day before the month and the year.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0013';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const formatted: string = DateUtils.formatTimestampWithPattern(T_2024_LEAP_DAY, DAY_FIRST_PATTERN);
      expect(formatted).assertEqual(expectedDayFirst(T_2024_LEAP_DAY));
      expect(DAY_FIRST_REGEX.test(formatted)).assertTrue();
      expect(formatted.substring(formatted.length - YEAR_WIDTH)).assertEqual(yearOf(T_2024_LEAP_DAY).toString());
      expect(formatted.split('-').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0113
     * @tc.name      testDateUtils0014
     * @tc.desc      Verify a literal pattern without any token is returned unchanged.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDateUtils0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testDateUtils0014';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const formatted: string = DateUtils.formatTimestampWithPattern(T_20231115, LITERAL_PATTERN);
      expect(formatted).assertEqual(LITERAL_PATTERN);
      expect(containsAnyToken(LITERAL_PATTERN)).assertFalse();
      expect(formatted.length).assertEqual(LITERAL_PATTERN.length);
      // A pattern made of a separator only is also token free.
      expect(DateUtils.formatTimestampWithPattern(T_20231115, COLON_PATTERN)).assertEqual(COLON_PATTERN);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0114
     * @tc.name      testDateUtils0015
     * @tc.desc      Verify month-day, hour-minute and second patterns each substitute only their own tokens.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0015';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const monthDay: string = DateUtils.formatTimestampWithPattern(T_2024_MAR_START, MONTH_DAY_PATTERN);
      expect(monthDay).assertEqual(expectedMonthDay(T_2024_MAR_START));
      const hourMinute: string = DateUtils.formatTimestampWithPattern(T_2024_MAR_START, HOUR_MINUTE_PATTERN);
      expect(hourMinute).assertEqual(expectedHourMinute(T_2024_MAR_START));
      const secondOnly: string = DateUtils.formatTimestampWithPattern(T_2024_MAR_START, SECOND_ONLY_PATTERN);
      expect(secondOnly).assertEqual(secondOf(T_2024_MAR_START));
      expect(secondOnly.length).assertEqual(PAD_WIDTH_TWO);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0115
     * @tc.name      testDateUtils0016
     * @tc.desc      Verify the custom patterns reject negative, NaN and infinite timestamps with an empty string.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0016';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const patterns: string[] = [DEFAULT_PATTERN, SLASH_DATE_PATTERN, TIME_ONLY_PATTERN, YEAR_ONLY_PATTERN,
        DAY_FIRST_PATTERN];
      for (const pattern of patterns) {
        expect(DateUtils.formatTimestampWithPattern(-1, pattern)).assertEqual('');
        expect(DateUtils.formatTimestampWithPattern(NaN, pattern)).assertEqual('');
        expect(DateUtils.formatTimestampWithPattern(Infinity, pattern)).assertEqual('');
        expect(DateUtils.formatTimestampWithPattern(-Infinity, pattern)).assertEqual('');
      }
      expect(patterns.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0116
     * @tc.name      testDateUtils0017
     * @tc.desc      Verify every supported pattern renders the fixed reference constant consistently.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0017';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const millis: number = T_20231115;
      expect(DateUtils.formatTimestampWithPattern(millis, DEFAULT_PATTERN)).assertEqual(expectedDefault(millis));
      expect(DateUtils.formatTimestampWithPattern(millis, SLASH_DATE_PATTERN)).assertEqual(expectedSlashDate(millis));
      expect(DateUtils.formatTimestampWithPattern(millis, TIME_ONLY_PATTERN)).assertEqual(expectedTimeOnly(millis));
      expect(DateUtils.formatTimestampWithPattern(millis, YEAR_ONLY_PATTERN)).assertEqual(expectedYearOnly(millis));
      expect(DateUtils.formatTimestampWithPattern(millis, DAY_FIRST_PATTERN)).assertEqual(expectedDayFirst(millis));
      expect(DateUtils.formatTimestampWithPattern(millis, MONTH_DAY_PATTERN)).assertEqual(expectedMonthDay(millis));
      expect(DateUtils.formatTimestampWithPattern(millis, HOUR_MINUTE_PATTERN)).assertEqual(expectedHourMinute(millis));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0117
     * @tc.name      testDateUtils0018
     * @tc.desc      Verify the second-level component advances on the minute and hour boundaries.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0018';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // The last second of the epoch minute and the first second of the next minute.
      const beforeMinute: string = DateUtils.formatTimestampWithPattern(T_EPOCH_59S, TIME_ONLY_PATTERN);
      const atMinute: string = DateUtils.formatTimestampWithPattern(T_EPOCH_1M, TIME_ONLY_PATTERN);
      expect(beforeMinute).assertEqual(expectedTimeOnly(T_EPOCH_59S));
      expect(atMinute).assertEqual(expectedTimeOnly(T_EPOCH_1M));
      expect(beforeMinute === atMinute).assertFalse();
      // The last second of the epoch hour and the first second of the next hour.
      const beforeHour: string = DateUtils.formatTimestampWithPattern(T_EPOCH_59M59S, TIME_ONLY_PATTERN);
      const atHour: string = DateUtils.formatTimestampWithPattern(T_EPOCH_1H, TIME_ONLY_PATTERN);
      expect(beforeHour).assertEqual(expectedTimeOnly(T_EPOCH_59M59S));
      expect(atHour).assertEqual(expectedTimeOnly(T_EPOCH_1H));
      expect(beforeHour === atHour).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0118
     * @tc.name      testDateUtils0019
     * @tc.desc      Verify formatDuration renders zero and sub second durations as the zero layout.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0019';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.formatDuration(0)).assertEqual('00:00:00');
      expect(DateUtils.formatDuration(1)).assertEqual('00:00:00');
      expect(DateUtils.formatDuration(999)).assertEqual('00:00:00');
      expect(DateUtils.formatDuration(999)).assertEqual(expectedDuration(999));
      expect(DateUtils.formatDuration(0).length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0119
     * @tc.name      testDateUtils0020
     * @tc.desc      Verify formatDuration renders the one second boundary as '00:00:01'.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0020';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.formatDuration(1000)).assertEqual('00:00:01');
      expect(DateUtils.formatDuration(MS_PER_SECOND)).assertEqual('00:00:01');
      expect(DateUtils.formatDuration(1999)).assertEqual('00:00:01');
      expect(DateUtils.formatDuration(1000)).assertEqual(expectedDuration(1000));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0120
     * @tc.name      testDateUtils0021
     * @tc.desc      Verify formatDuration renders the last second of the first minute as '00:00:59'.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0021';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.formatDuration(59999)).assertEqual('00:00:59');
      expect(DateUtils.formatDuration(59000)).assertEqual('00:00:59');
      expect(DateUtils.formatDuration(59999)).assertEqual(expectedDuration(59999));
      expect(DateUtils.formatDuration(59999)).assertEqual('00:00:59');
      // One millisecond below the minute boundary must not be promoted a unit.
      expect(DateUtils.formatDuration(59999) === '00:01:00').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0121
     * @tc.name      testDateUtils0022
     * @tc.desc      Verify formatDuration renders the one minute boundary as '00:01:00'.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0022';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.formatDuration(60000)).assertEqual('00:01:00');
      expect(DateUtils.formatDuration(ONE_MINUTE_MS)).assertEqual('00:01:00');
      expect(DateUtils.formatDuration(61000)).assertEqual('00:01:01');
      expect(DateUtils.formatDuration(ONE_MINUTE_MS)).assertEqual(expectedDuration(ONE_MINUTE_MS));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0122
     * @tc.name      testDateUtils0023
     * @tc.desc      Verify formatDuration renders the last second before the first hour as '00:59:59'.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0023';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.formatDuration(3599999)).assertEqual('00:59:59');
      expect(DateUtils.formatDuration(3599000)).assertEqual('00:59:59');
      expect(DateUtils.formatDuration(3599999)).assertEqual(expectedDuration(3599999));
      expect(DateUtils.formatDuration(3599999)).assertEqual('00:59:59');
      // One millisecond below the hour boundary must not be promoted a unit.
      expect(DateUtils.formatDuration(3599999) === '01:00:00').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0123
     * @tc.name      testDateUtils0024
     * @tc.desc      Verify formatDuration renders the one hour boundary as '01:00:00'.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0024';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.formatDuration(3600000)).assertEqual('01:00:00');
      expect(DateUtils.formatDuration(ONE_HOUR_MS)).assertEqual('01:00:00');
      expect(DateUtils.formatDuration(3600000)).assertEqual(expectedDuration(ONE_HOUR_MS));
      expect(DateUtils.formatDuration(ONE_HOUR_MS + MS_PER_SECOND)).assertEqual('01:00:01');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0124
     * @tc.name      testDateUtils0025
     * @tc.desc      Verify formatDuration renders one day as '24:00:00' because the hour part is not capped.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0025';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.formatDuration(86400000)).assertEqual('24:00:00');
      expect(DateUtils.formatDuration(ONE_DAY_MS)).assertEqual('24:00:00');
      expect(DateUtils.formatDuration(ONE_DAY_MS)).assertEqual(expectedDuration(ONE_DAY_MS));
      expect(DateUtils.formatDuration(ONE_DAY_MS + ONE_HOUR_MS)).assertEqual('25:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0125
     * @tc.name      testDateUtils0026
     * @tc.desc      Verify formatDuration renders a hundred hours as '100:00:00' with a three digit hour part.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0026';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.formatDuration(360000000)).assertEqual('100:00:00');
      expect(DateUtils.formatDuration(360000000)).assertEqual(expectedDuration(360000000));
      expect(DateUtils.formatDuration(360000000).length).assertEqual(9);
      expect(DateUtils.formatDuration(360000000).split(':').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0126
     * @tc.name      testDateUtils0027
     * @tc.desc      Verify formatDuration matches the padding oracle on a fixed duration ladder.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0027';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const ladder: number[] = [0, 999, MS_PER_SECOND, 59999, ONE_MINUTE_MS, 3599999, ONE_HOUR_MS, ONE_DAY_MS,
        360000000];
      for (const millis of ladder) {
        const formatted: string = DateUtils.formatDuration(millis);
        expect(formatted).assertEqual(expectedDuration(millis));
        expect(formatted.split(':').length).assertEqual(3);
        expect(formatted.length >= 8).assertTrue();
      }
      expect(ladder.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0127
     * @tc.name      testDateUtils0028
     * @tc.desc      Verify formatDuration yields an empty string for a negative duration.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0028';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.formatDuration(-1)).assertEqual('');
      expect(DateUtils.formatDuration(-MS_PER_SECOND)).assertEqual('');
      expect(DateUtils.formatDuration(-ONE_HOUR_MS)).assertEqual('');
      expect(DateUtils.formatDuration(-1).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0128
     * @tc.name      testDateUtils0029
     * @tc.desc      Verify formatDuration yields an empty string for NaN and both infinities.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0029';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.formatDuration(NaN)).assertEqual('');
      expect(DateUtils.formatDuration(Infinity)).assertEqual('');
      expect(DateUtils.formatDuration(-Infinity)).assertEqual('');
      // An invalid duration renders no separator at all.
      expect(DateUtils.formatDuration(Infinity).split(':').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0129
     * @tc.name      testDateUtils0030
     * @tc.desc      Verify formatDuration stays one-to-one on consecutive seconds of the first minute.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDateUtils0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testDateUtils0030';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const seen: Set<string> = new Set<string>();
      for (let secondValue: number = 0; secondValue < 5; secondValue++) {
        const probeMillis: number = secondValue * MS_PER_SECOND;
        const formatted: string = DateUtils.formatDuration(probeMillis);
        seen.add(formatted);
        // Each probe is compared with the locally rendered expectation.
        const expected: string = expectedDuration(probeMillis);
        expect(formatted).assertEqual(expected);
        expect(formatted.length).assertEqual('00:00:00'.length);
      }
      expect(seen.size).assertEqual(5);
      expect(DateUtils.formatDuration(0)).assertEqual('00:00:00');
      expect(DateUtils.formatDuration(4 * MS_PER_SECOND)).assertEqual('00:00:04');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0130
     * @tc.name      testDateUtils0031
     * @tc.desc      Verify isSameDay accepts two different times of the same calendar day.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0031';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // 08:00:00 and 12:00:00 of the same fixed day, four hours apart.
      expect(DateUtils.isSameDay(T_2024_START, T_2024_START + 4 * ONE_HOUR_MS)).assertTrue();
      expect(DateUtils.isSameDay(T_2024_START + 4 * ONE_HOUR_MS, T_2024_START)).assertTrue();
      expect(DateUtils.isSameDay(T_2024_START, T_2024_START)).assertTrue();
      expect(DateUtils.isSameDay(T_20231115, T_20231115_PLUS_1)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0131
     * @tc.name      testDateUtils0032
     * @tc.desc      Verify isSameDay in UTC+8 accepts two times ten hours apart and one second before 08:00 of the same day, and rejects the third day, one week later and 07:59:59 of the next day.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0032';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const T_START_DAY: number = 1704067200000;
      const T_SECOND_DAY: number = 1704103200000;
      expect(DateUtils.isSameDay(T_START_DAY, T_SECOND_DAY)).assertTrue();
      expect(DateUtils.isSameDay(T_SECOND_DAY, T_START_DAY)).assertTrue();
      expect(DateUtils.isSameDay(T_START_DAY, T_2024_THIRD_DAY)).assertFalse();
      expect(DateUtils.isSameDay(T_START_DAY, T_2024_WEEK_LATER)).assertFalse();
      // In UTC+8, 07:59:59 of the second day already belongs to the second day,
      // while 07:59:59 and 08:00 of the third day fall on the same day.
      expect(DateUtils.isSameDay(T_START_DAY, T_2024_SECOND_DAY - MS_PER_SECOND)).assertFalse();
      expect(DateUtils.isSameDay(T_2024_THIRD_DAY, T_2024_THIRD_DAY - MS_PER_SECOND)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0132
     * @tc.name      testDateUtils0033
     * @tc.desc      Verify isSameDay rejects constants in different months of the same year, including the leap day against March 1 in UTC+8, and accepts two times of March 1.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0033';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.isSameDay(T_2024_START, T_2024_FEB_START)).assertFalse();
      expect(DateUtils.isSameDay(T_2024_FEB_START, T_2024_START)).assertFalse();
      expect(DateUtils.isSameDay(T_2024_LEAP_DAY, T_2024_MAR_START)).assertFalse();
      // The leap day is in February, the last second of March 1st is one day later in March.
      expect(DateUtils.isSameDay(T_2024_LEAP_DAY, T_2024_MAR_FIRST_END)).assertFalse();
      // 2024-03-01 08:00:00 and 2024-03-01 07:59:59 share the calendar day March 1st.
      expect(DateUtils.isSameDay(T_2024_MAR_START, T_2024_MAR_FIRST_END)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0134
     * @tc.name      testDateUtils0034
     * @tc.desc      Verify isSameDay rejects two constants that are in different years.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0034';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.isSameDay(T_2023_START, T_2024_START)).assertFalse();
      expect(DateUtils.isSameDay(T_2024_START, T_2025_START)).assertFalse();
      // The same month and day in two different years is still a different day.
      expect(DateUtils.isSameDay(T_2024_START, T_2025_START)).assertEqual(
        DateUtils.isSameDay(T_2025_START, T_2024_START));
      expect(DateUtils.isSameDay(T_2023_LAST_DAY, T_2025_START)).assertFalse();
      expect(DateUtils.isSameDay(T_2023_LAST_DAY, T_2024_START)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0135
     * @tc.name      testDateUtils0035
     * @tc.desc      Verify isSameDay returns false when either constant is negative.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0035';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.isSameDay(-1, -1)).assertFalse();
      expect(DateUtils.isSameDay(-1, T_2024_START)).assertFalse();
      expect(DateUtils.isSameDay(T_2024_START, -1)).assertFalse();
      expect(DateUtils.isSameDay(-ONE_DAY_MS, 0)).assertFalse();
      expect(DateUtils.isSameDay(0, -ONE_DAY_MS)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0136
     * @tc.name      testDateUtils0036
     * @tc.desc      Verify isSameDay returns false when either constant is NaN or infinite.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0036';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.isSameDay(NaN, NaN)).assertFalse();
      expect(DateUtils.isSameDay(NaN, T_2024_START)).assertFalse();
      expect(DateUtils.isSameDay(T_2024_START, NaN)).assertFalse();
      expect(DateUtils.isSameDay(Infinity, Infinity)).assertFalse();
      expect(DateUtils.isSameDay(-Infinity, T_2024_START)).assertFalse();
      expect(DateUtils.isSameDay(T_2024_START, Infinity)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0137
     * @tc.name      testDateUtils0037
     * @tc.desc      Verify isSameDay is symmetric and keeps the epoch day separate from the next day.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0037';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.isSameDay(T_EPOCH_DAY, T_EPOCH_59M59S)).assertTrue();
      expect(DateUtils.isSameDay(T_EPOCH_DAY, T_EPOCH_NEXT_DAY)).assertFalse();
      expect(DateUtils.isSameDay(T_EPOCH_NEXT_DAY, T_EPOCH_DAY)).assertFalse();
      // Symmetry holds for every pair of fixtures.
      const pairs: number[] = [T_EPOCH_DAY, T_2024_START, T_2024_SECOND_DAY, T_2025_START];
      for (const left of pairs) {
        for (const right of pairs) {
          expect(DateUtils.isSameDay(left, right)).assertEqual(DateUtils.isSameDay(right, left));
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0138
     * @tc.name      testDateUtils0038
     * @tc.desc      Verify isSameDay agrees with the local Date components on a fixed fixture list.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0038';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const first: number[] = [T_2024_START, T_2024_START + ONE_HOUR_MS, T_2023_LAST_DAY, T_2024_LEAP_DAY];
      const second: number[] = [T_2024_START + 5 * ONE_HOUR_MS, T_2024_START, T_2024_START, T_2024_FEB_START];
      const expectedFlags: boolean[] = [true, true, false, false];
      for (let index: number = 0; index < first.length; index++) {
        const left: number = first[index];
        const right: number = second[index];
        const sameYear: boolean = yearOf(left) === yearOf(right);
        const sameMonth: boolean = monthOf(left) === monthOf(right);
        const sameDay: boolean = dayOf(left) === dayOf(right);
        expect(DateUtils.isSameDay(left, right)).assertEqual(sameYear && sameMonth && sameDay);
        expect(DateUtils.isSameDay(left, right)).assertEqual(expectedFlags[index]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0139
     * @tc.name      testDateUtils0039
     * @tc.desc      Verify elapsedSince returns 0 for a negative, NaN or infinite start point.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0039';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.elapsedSince(-1)).assertEqual(0);
      expect(DateUtils.elapsedSince(-ONE_DAY_MS)).assertEqual(0);
      expect(DateUtils.elapsedSince(NaN)).assertEqual(0);
      expect(DateUtils.elapsedSince(Infinity)).assertEqual(0);
      expect(DateUtils.elapsedSince(-Infinity)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0140
     * @tc.name      testDateUtils0040
     * @tc.desc      Verify elapsedSince returns a finite non negative integer above 60000 ms for a start point of 1000.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0040';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const elapsed: number = DateUtils.elapsedSince(ONE_HOUR_AGO_START);
      expect(elapsed >= ELAPSED_MIN).assertTrue();
      expect(elapsed <= ELAPSED_MAX).assertFalse();
      expect(Number.isFinite(elapsed)).assertTrue();
      expect(Number.isInteger(elapsed)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0141
     * @tc.name      testDateUtils0041
     * @tc.desc      Verify elapsedSince stays finite, non negative and above 60000 ms for several fixed start points.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0041';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const starts: number[] = [ONE_DAY_AGO_START, ONE_HOUR_AGO_START, T_20231115, T_2024_START];
      for (const start of starts) {
        const elapsed: number = DateUtils.elapsedSince(start);
        expect(elapsed >= ELAPSED_MIN).assertTrue();
        expect(Number.isFinite(elapsed)).assertTrue();
        // The start point is in the past, so the difference is larger than one loose window.
        expect(elapsed > ELAPSED_MAX).assertTrue();
      }
      expect(starts.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0142
     * @tc.name      testDateUtils0042
     * @tc.desc      Verify elapsedSince never decreases along consecutive calls for the same start point.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDateUtils0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testDateUtils0042';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const first: number = DateUtils.elapsedSince(T_2024_START);
      const second: number = DateUtils.elapsedSince(T_2024_START);
      expect(second >= first).assertTrue();
      expect(first >= ELAPSED_MIN).assertTrue();
      expect(second >= ELAPSED_MIN).assertTrue();
      expect(Number.isFinite(first) && Number.isFinite(second)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0143
     * @tc.name      testDateUtils0043
     * @tc.desc      Verify nowMillis returns a positive finite integer later than 2024-01-01 00:00:00 UTC.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateUtils0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateUtils0043';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const now: number = DateUtils.nowMillis();
      expect(now > 0).assertTrue();
      expect(Number.isInteger(now)).assertTrue();
      expect(Number.isFinite(now)).assertTrue();
      // The fixed constants are all in the past, so the wall clock is larger.
      expect(now > T_2024_START).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0144
     * @tc.name      testDateUtils0044
     * @tc.desc      Verify nowMillis is monotonic across two consecutive reads.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0044';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const first: number = DateUtils.nowMillis();
      const second: number = DateUtils.nowMillis();
      expect(second >= first).assertTrue();
      expect(second - first >= ELAPSED_MIN).assertTrue();
      expect(second > 0).assertTrue();
      expect(Number.isInteger(second)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0145
     * @tc.name      testDateUtils0045
     * @tc.desc      Verify nowMillis feeds formatTimestamp with a well formed default layout.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0045';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const now: number = DateUtils.nowMillis();
      const formatted: string = DateUtils.formatTimestamp(now);
      expect(DEFAULT_PATTERN_REGEX.test(formatted)).assertTrue();
      expect(formatted.length).assertEqual(DEFAULT_PATTERN.length);
      // The year of the wall clock must match the year of the formatted text.
      const yearText: string = formatted.substring(0, YEAR_WIDTH);
      expect(yearText).assertEqual(yearOf(now).toString());
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0146
     * @tc.name      testDateUtils0046
     * @tc.desc      Verify nowMillis is usable as an elapsedSince start point without an invalid fallback.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0046';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const elapsed: number = DateUtils.elapsedSince(DateUtils.nowMillis());
      expect(elapsed >= ELAPSED_MIN).assertTrue();
      expect(elapsed <= ELAPSED_MAX).assertTrue();
      expect(Number.isInteger(elapsed)).assertTrue();
      expect(elapsed === 0).assertEqual(elapsed < MS_PER_SECOND);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0147
     * @tc.name      testDateUtils0047
     * @tc.desc      Verify isSameDay, formatTimestampWithPattern and formatDuration give consistent results for the leap day constant, which falls on February 29 in UTC+8.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDateUtils0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testDateUtils0047';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const millis: number = T_2024_LEAP_DAY;
      const dateText: string = DateUtils.formatTimestampWithPattern(millis, SLASH_DATE_PATTERN);
      const durationText: string = DateUtils.formatDuration(millis);
      expect(DateUtils.isSameDay(millis, millis)).assertTrue();
      expect(dateText).assertEqual(expectedSlashDate(millis));
      expect(durationText).assertEqual(expectedDuration(millis));
      expect(durationText.length >= 8).assertTrue();
      // The leap day is inside the leap year, so the day part reads 29.
      expect(dayOf(millis)).assertEqual(29);
      expect(monthOf(millis)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0148
     * @tc.name      testDateUtils0048
     * @tc.desc      Verify one day and one hour offsets from 2024-01-01 move the local day and hour by one and give the expected isSameDay results in UTC+8.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtils0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateUtils0048';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // Shifting by a UTC+8 day keeps the time of day, only the day part moves.
      const shifted: number = T_2024_START + ONE_DAY_MS;
      expect(dayOf(shifted)).assertEqual(dayOf(T_2024_START) + 1);
      expect(DateUtils.isSameDay(T_2024_START, shifted)).assertFalse();
      expect(DateUtils.isSameDay(shifted, T_2024_TWELVE)).assertFalse();
      // Shifting by one hour keeps the same UTC+8 day in the morning.
      const plusHour: number = T_2024_START + ONE_HOUR_MS;
      expect(DateUtils.isSameDay(T_2024_START, plusHour)).assertTrue();
      expect(hourOf(plusHour)).assertEqual(hourOf(T_2024_START) + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0149
     * @tc.name      testDateUtils0049
     * @tc.desc      Verify the day origin offset constant is one UTC+8 day and stays a positive integer.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDateUtils0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testDateUtils0049';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DAY_ORIGIN_OFFSET_MS).assertEqual(UTC_PLUS_EIGHT_OFFSET_MS);
      expect(DAY_ORIGIN_OFFSET_MS).assertEqual(8 * ONE_HOUR_MS);
      expect(DAY_ORIGIN_OFFSET_MS > 0).assertTrue();
      expect(Number.isInteger(DAY_ORIGIN_OFFSET_MS)).assertTrue();
      expect(T_EPOCH_DAY + DAY_ORIGIN_OFFSET_MS).assertEqual(DAY_ORIGIN_OFFSET_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_DATE_0150
     * @tc.name      testDateUtils0050
     * @tc.desc      Verify that every rendered fixture keeps the documented two digit component widths.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDateUtils0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testDateUtils0050';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const fixtures: number[] = [T_EPOCH_DAY, T_20231115, T_2024_LEAP_DAY, T_2025_EVE];
      for (const millis of fixtures) {
        const formatted: string = DateUtils.formatTimestamp(millis);
        // Fixed offsets: 5..7 month, 8..10 day, 11..13 hour, 14..16 minute, 17..19 second.
        expect(formatted.substring(5, 7).length).assertEqual(PAD_WIDTH_TWO);
        expect(formatted.substring(8, 10).length).assertEqual(PAD_WIDTH_TWO);
        expect(formatted.substring(11, 13).length).assertEqual(PAD_WIDTH_TWO);
        expect(formatted.substring(14, 16).length).assertEqual(PAD_WIDTH_TWO);
        expect(formatted.substring(17, 19).length).assertEqual(PAD_WIDTH_TWO);
        expect(formatted.substring(8, 10)).assertEqual(padTwo(dayOf(millis)));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });
  });
}
