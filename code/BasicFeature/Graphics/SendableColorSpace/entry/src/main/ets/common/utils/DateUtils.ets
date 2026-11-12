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

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_SendableColorSpace]';
const ZERO: number = 0;
const ONE: number = 1;
const TWO: number = 2;
const THREE: number = 3;
const FOUR: number = 4;
const TWELVE: number = 12;
const MILLIS_PER_DAY: number = 86400000;
const MILLIS_PER_MINUTE: number = 60000;
const MILLIS_PER_HOUR: number = 3600000;
const MIN_YEAR: number = 1970;
const MAX_YEAR: number = 2200;

/**
 * Calendar helpers backing the utility suites.
 *
 * Every member reads the instant in coordinated universal time, so a suite
 * running on any device zone reports the same value.
 */
export class DateUtils {
    /**
     * Returns a new instant moved by the requested number of days.
     */
    static addDays(timestamp: number, days: number): number {
        hilog.info(DOMAIN, TAG, 'DateUtils.addDays days=%{public}d', days);
        return timestamp + days * MILLIS_PER_DAY;
    }

    /**
     * Returns the day of the month of the instant.
     */
    static dayOf(timestamp: number): number {
        hilog.info(DOMAIN, TAG, 'DateUtils.dayOf timestamp=%{public}d', timestamp);
        return new Date(timestamp).getUTCDate();
    }

    /**
     * Returns the day count of the month holding the instant.
     */
    static daysInMonthOf(timestamp: number): number {
        hilog.info(DOMAIN, TAG, 'DateUtils.daysInMonthOf timestamp=%{public}d', timestamp);
        const date: Date = new Date(timestamp);
        const month: number = date.getUTCMonth();
        if (month === 1) {
            if (DateUtils.isLeapYearOf(timestamp)) {
                return 29;
            }
            return 28;
        }
        if (month === THREE || month === 5 || month === 8 || month === 10) {
            return 30;
        }
        return 31;
    }

    /**
     * Returns the whole day count between both instants.
     */
    static diffDays(from: number, to: number): number {
        hilog.info(DOMAIN, TAG, 'DateUtils.diffDays from=%{public}d to=%{public}d', from, to);
        return Math.trunc((to - from) / MILLIS_PER_DAY);
    }

    /**
     * Renders the instant as a calendar date.
     */
    static formatDate(timestamp: number): string {
        hilog.info(DOMAIN, TAG, 'DateUtils.formatDate timestamp=%{public}d', timestamp);
        const date: Date = new Date(timestamp);
        return DateUtils.pad(date.getUTCFullYear(), FOUR) + '-' + DateUtils.pad(date.getUTCMonth() + ONE, TWO) + '-' +
            DateUtils.pad(date.getUTCDate(), TWO);
    }

    /**
     * Renders the instant as a clock time.
     */
    static formatTime(timestamp: number): string {
        hilog.info(DOMAIN, TAG, 'DateUtils.formatTime timestamp=%{public}d', timestamp);
        const date: Date = new Date(timestamp);
        return DateUtils.pad(date.getUTCHours(), TWO) + ':' + DateUtils.pad(date.getUTCMinutes(), TWO) + ':' +
            DateUtils.pad(date.getUTCSeconds(), TWO);
    }

    /**
     * Returns the hour of the instant.
     */
    static hourOf(timestamp: number): number {
        hilog.info(DOMAIN, TAG, 'DateUtils.hourOf timestamp=%{public}d', timestamp);
        return new Date(timestamp).getUTCHours();
    }

    /**
     * Reports whether the year holding the instant is a leap year.
     */
    static isLeapYearOf(timestamp: number): boolean {
        hilog.info(DOMAIN, TAG, 'DateUtils.isLeapYearOf timestamp=%{public}d', timestamp);
        const year: number = new Date(timestamp).getUTCFullYear();
        if (year % 400 === ZERO) {
            return true;
        }
        if (year % 100 === ZERO) {
            return false;
        }
        return year % FOUR === ZERO;
    }

    /**
     * Reports whether the value is a usable instant.
     */
    static isValidTimestamp(timestamp: number): boolean {
        hilog.info(DOMAIN, TAG, 'DateUtils.isValidTimestamp timestamp=%{public}d', timestamp);
        if (!Number.isFinite(timestamp)) {
            return false;
        }
        const year: number = new Date(timestamp).getUTCFullYear();
        return year >= MIN_YEAR && year <= MAX_YEAR;
    }

    /**
     * Returns the minute of the instant.
     */
    static minuteOf(timestamp: number): number {
        hilog.info(DOMAIN, TAG, 'DateUtils.minuteOf timestamp=%{public}d', timestamp);
        return new Date(timestamp).getUTCMinutes();
    }

    /**
     * Returns the month index of the instant, zero based.
     */
    static monthOf(timestamp: number): number {
        hilog.info(DOMAIN, TAG, 'DateUtils.monthOf timestamp=%{public}d', timestamp);
        return new Date(timestamp).getUTCMonth();
    }

    /**
     * Returns the instant moved to the start of its day.
     */
    static startOfDay(timestamp: number): number {
        hilog.info(DOMAIN, TAG, 'DateUtils.startOfDay timestamp=%{public}d', timestamp);
        return Math.floor(timestamp / MILLIS_PER_DAY) * MILLIS_PER_DAY;
    }

    /**
     * Returns the weekday index of the instant, zero for Sunday.
     */
    static weekdayOf(timestamp: number): number {
        hilog.info(DOMAIN, TAG, 'DateUtils.weekdayOf timestamp=%{public}d', timestamp);
        return new Date(timestamp).getUTCDay();
    }

    /**
     * Returns the year of the instant.
     */
    static yearOf(timestamp: number): number {
        hilog.info(DOMAIN, TAG, 'DateUtils.yearOf timestamp=%{public}d', timestamp);
        return new Date(timestamp).getUTCFullYear();
    }

    /**
     * Returns the elapsed hours inside the day of the instant.
     */
    static elapsedHours(timestamp: number): number {
        hilog.info(DOMAIN, TAG, 'DateUtils.elapsedHours timestamp=%{public}d', timestamp);
        return Math.floor(timestamp / MILLIS_PER_HOUR);
    }

    /**
     * Returns the elapsed minutes inside the day of the instant.
     */
    static elapsedMinutes(timestamp: number): number {
        hilog.info(DOMAIN, TAG, 'DateUtils.elapsedMinutes timestamp=%{public}d', timestamp);
        return Math.floor(timestamp / MILLIS_PER_MINUTE);
    }

    private static pad(value: number, width: number): string {
        let text: string = value.toString();
        while (text.length < width) {
            text = '0' + text;
        }
        return text;
    }
}
