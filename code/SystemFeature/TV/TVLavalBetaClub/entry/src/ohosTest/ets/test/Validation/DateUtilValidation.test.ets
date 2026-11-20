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

import { describe, it, expect } from '@ohos/hypium';

const FAULT_TIME_LENGTH: number = 14;

const MIN_YEAR: number = 2000;

const MAX_YEAR: number = 2100;

const MS_PER_DAY: number = 86400000;

interface DateParts {
  year: number;
  month: number;
  day: number;
  hour: number;
  minute: number;
  second: number;
}

// Validates the fault time format used by issue reports
class FaultTimeValidator {
  public static isDigits(value: string): boolean {
    const pattern: RegExp = new RegExp('^[0-9]+$');
    return pattern.test(value);
  }

  public static isLengthValid(value: string): boolean {
    return value.length === FAULT_TIME_LENGTH;
  }

  public static parse(value: string): DateParts | undefined {
    if (!FaultTimeValidator.isLengthValid(value) || !FaultTimeValidator.isDigits(value)) {
      return undefined;
    }
    return {
      year: Number(value.substring(0, 4)),
      month: Number(value.substring(4, 6)),
      day: Number(value.substring(6, 8)),
      hour: Number(value.substring(8, 10)),
      minute: Number(value.substring(10, 12)),
      second: Number(value.substring(12, 14))
    };
  }

  public static isRangeValid(parts: DateParts): boolean {
    return parts.year >= MIN_YEAR && parts.year <= MAX_YEAR &&
      parts.month >= 1 && parts.month <= 12 &&
      parts.day >= 1 && parts.day <= 31 &&
      parts.hour >= 0 && parts.hour <= 23 &&
      parts.minute >= 0 && parts.minute <= 59 &&
      parts.second >= 0 && parts.second <= 59;
  }

  public static isValid(value: string): boolean {
    const parts = FaultTimeValidator.parse(value);
    return parts !== undefined && FaultTimeValidator.isRangeValid(parts);
  }

  public static isLeapYear(year: number): boolean {
    return (year % 4 === 0 && year % 100 !== 0) || year % 400 === 0;
  }

  public static daysInMonth(year: number, month: number): number {
    if (month === 2) {
      return FaultTimeValidator.isLeapYear(year) ? 29 : 28;
    }
    if (month === 4 || month === 6 || month === 9 || month === 11) {
      return 30;
    }
    return 31;
  }

  public static isCalendarValid(value: string): boolean {
    const parts = FaultTimeValidator.parse(value);
    if (parts === undefined || !FaultTimeValidator.isRangeValid(parts)) {
      return false;
    }
    return parts.day <= FaultTimeValidator.daysInMonth(parts.year, parts.month);
  }
}

// Utilities for formatting and comparing fault times
class FaultTimeUtil {
  public static pad(value: number): string {
    return value < 10 ? `0${value}` : `${value}`;
  }

  public static format(parts: DateParts): string {
    return `${parts.year}${FaultTimeUtil.pad(parts.month)}${FaultTimeUtil.pad(parts.day)}` +
      `${FaultTimeUtil.pad(parts.hour)}${FaultTimeUtil.pad(parts.minute)}` +
      `${FaultTimeUtil.pad(parts.second)}`;
  }

  public static toMillis(value: string): number {
    const parts = FaultTimeValidator.parse(value);
    if (parts === undefined) {
      return -1;
    }
    return Date.UTC(parts.year, parts.month - 1, parts.day, parts.hour, parts.minute, parts.second);
  }

  public static daysBetween(first: string, second: string): number {
    const firstMs = FaultTimeUtil.toMillis(first);
    const secondMs = FaultTimeUtil.toMillis(second);
    if (firstMs < 0 || secondMs < 0) {
      return -1;
    }
    return Math.abs(secondMs - firstMs) / MS_PER_DAY;
  }

  public static isBefore(first: string, second: string): boolean {
    const firstMs = FaultTimeUtil.toMillis(first);
    const secondMs = FaultTimeUtil.toMillis(second);
    return firstMs >= 0 && secondMs >= 0 && firstMs < secondMs;
  }

  public static nowString(parts: DateParts): string {
    return FaultTimeUtil.format(parts);
  }
}

// Validates time ranges used by log collection
class TimeRangeValidator {
  public static isOrdered(start: string, end: string): boolean {
    return !FaultTimeUtil.isBefore(end, start);
  }

  public static isWithinMaxSpan(start: string, end: string, maxDays: number): boolean {
    const days = FaultTimeUtil.daysBetween(start, end);
    return days >= 0 && days <= maxDays;
  }

  public static overlap(firstStart: string, firstEnd: string,
    secondStart: string, secondEnd: string): boolean {
    return FaultTimeUtil.isBefore(firstStart, secondEnd) &&
      FaultTimeUtil.isBefore(secondStart, firstEnd);
  }

  public static isRecent(value: string, now: string, maxDays: number): boolean {
    const days = FaultTimeUtil.daysBetween(value, now);
    return days >= 0 && days <= maxDays;
  }
}

export default function dateUtilValidationTest() {
  describe('DateUtilValidation_Test', () => {

    it('validator_should_check_format', 0, () => {
      expect(FaultTimeValidator.isLengthValid('20260101120000')).assertTrue();
      expect(FaultTimeValidator.isLengthValid('20260101')).assertFalse();
      expect(FaultTimeValidator.isDigits('20260101120000')).assertTrue();
      expect(FaultTimeValidator.isDigits('2026-01-01')).assertFalse();
      expect(FaultTimeValidator.parse('20260101120000') !== undefined).assertTrue();
      expect(FaultTimeValidator.parse('bad') === undefined).assertTrue();
    });

    it('validator_should_parse_fields', 0, () => {
      const parts = FaultTimeValidator.parse('20260101120000') as DateParts;
      expect(parts.year).assertEqual(2026);
      expect(parts.month).assertEqual(1);
      expect(parts.day).assertEqual(1);
      expect(parts.hour).assertEqual(12);
      expect(parts.minute).assertEqual(0);
      expect(parts.second).assertEqual(0);
    });

    it('validator_should_check_ranges', 0, () => {
      expect(FaultTimeValidator.isValid('20260101120000')).assertTrue();
      expect(FaultTimeValidator.isValid('19991231235959')).assertFalse();
      expect(FaultTimeValidator.isValid('20261301120000')).assertFalse();
      expect(FaultTimeValidator.isValid('20260132120000')).assertFalse();
      expect(FaultTimeValidator.isValid('20260101240000')).assertFalse();
      expect(FaultTimeValidator.isValid('20260101126000')).assertFalse();
      expect(FaultTimeValidator.isValid('20260101120060')).assertFalse();
    });

    it('validator_should_handle_leap_years', 0, () => {
      expect(FaultTimeValidator.isLeapYear(2024)).assertTrue();
      expect(FaultTimeValidator.isLeapYear(2026)).assertFalse();
      expect(FaultTimeValidator.isLeapYear(2000)).assertTrue();
      expect(FaultTimeValidator.isLeapYear(1900)).assertFalse();
      expect(FaultTimeValidator.daysInMonth(2024, 2)).assertEqual(29);
      expect(FaultTimeValidator.daysInMonth(2026, 2)).assertEqual(28);
      expect(FaultTimeValidator.daysInMonth(2026, 4)).assertEqual(30);
    });

    it('validator_should_check_calendar_days', 0, () => {
      expect(FaultTimeValidator.isCalendarValid('20280229120000')).assertTrue();
      expect(FaultTimeValidator.isCalendarValid('20260230120000')).assertFalse();
      expect(FaultTimeValidator.isCalendarValid('20260431120000')).assertFalse();
      expect(FaultTimeValidator.isCalendarValid('20260430120000')).assertTrue();
    });

    it('util_should_format_and_pad', 0, () => {
      expect(FaultTimeUtil.pad(0)).assertEqual('00');
      expect(FaultTimeUtil.pad(9)).assertEqual('09');
      expect(FaultTimeUtil.pad(12)).assertEqual('12');
      const parts: DateParts = {
        year: 2026, month: 1, day: 2, hour: 3, minute: 4, second: 5
      };
      expect(FaultTimeUtil.format(parts)).assertEqual('20260102030405');
      expect(FaultTimeUtil.nowString(parts)).assertEqual('20260102030405');
    });

    it('util_should_convert_to_millis', 0, () => {
      expect(FaultTimeUtil.toMillis('bad')).assertEqual(-1);
      const millis = FaultTimeUtil.toMillis('20260101120000');
      expect(millis).assertLarger(0);
      expect(FaultTimeUtil.toMillis('20260102000000')).assertLarger(millis);
    });

    it('util_should_compute_days_between', 0, () => {
      expect(FaultTimeUtil.daysBetween('20260101000000', '20260102000000')).assertEqual(1);
      expect(FaultTimeUtil.daysBetween('20260101000000', '20260111000000')).assertEqual(10);
      expect(FaultTimeUtil.daysBetween('bad', '20260101000000')).assertEqual(-1);
      expect(FaultTimeUtil.isBefore('20260101000000', '20260102000000')).assertTrue();
      expect(FaultTimeUtil.isBefore('20260102000000', '20260101000000')).assertFalse();
    });

    it('range_should_validate_order_and_span', 0, () => {
      expect(TimeRangeValidator.isOrdered('20260101000000', '20260102000000')).assertTrue();
      expect(TimeRangeValidator.isOrdered('20260102000000', '20260101000000')).assertFalse();
      expect(TimeRangeValidator.isWithinMaxSpan('20260101000000', '20260103000000', 3)).assertTrue();
      expect(TimeRangeValidator.isWithinMaxSpan('20260101000000', '20260110000000', 3)).assertFalse();
    });

    it('range_should_detect_overlap', 0, () => {
      expect(TimeRangeValidator.overlap(
        '20260101000000', '20260103000000',
        '20260102000000', '20260104000000'
      )).assertTrue();
      expect(TimeRangeValidator.overlap(
        '20260101000000', '20260102000000',
        '20260103000000', '20260104000000'
      )).assertFalse();
      expect(TimeRangeValidator.isRecent('20260101000000', '20260102000000', 1)).assertTrue();
      expect(TimeRangeValidator.isRecent('20260101000000', '20260110000000', 1)).assertFalse();
    });

    it('date_flow_should_validate_fault_time', 0, () => {
      const faultTime = '20260101120000';
      expect(FaultTimeValidator.isValid(faultTime)).assertTrue();
      expect(FaultTimeValidator.isCalendarValid(faultTime)).assertTrue();
      const parts = FaultTimeValidator.parse(faultTime) as DateParts;
      expect(FaultTimeUtil.format(parts)).assertEqual(faultTime);
      expect(TimeRangeValidator.isOrdered(faultTime, '20260102120000')).assertTrue();
      expect(FaultTimeUtil.daysBetween(faultTime, '20260102120000')).assertEqual(1);
    });

    it('date_constants_should_be_stable', 0, () => {
      expect(FAULT_TIME_LENGTH).assertEqual(14);
      expect(MIN_YEAR).assertEqual(2000);
      expect(MAX_YEAR).assertEqual(2100);
      expect(MS_PER_DAY).assertEqual(86400000);
    });
  });
}

