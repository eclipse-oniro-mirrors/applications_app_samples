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
const NOT_FOUND: number = -1;

/**
 * Number array helpers backing the utility suites.
 *
 * All members copy their input before building the result, so a suite case
 * can never observe a mutation performed by a previous case.
 */
export class ArrayUtils {
    /**
     * Returns the sum of the values, zero for an empty array.
     */
    static sum(values: number[]): number {
        hilog.info(DOMAIN, TAG, 'ArrayUtils.sum count=%{public}d', values.length);
        let total: number = 0;
        let index: number = 0;
        while (index < values.length) {
            total = total + values[index];
            index = index + 1;
        }
        return total;
    }

    /**
     * Returns the arithmetic mean, zero for an empty array.
     */
    static average(values: number[]): number {
        hilog.info(DOMAIN, TAG, 'ArrayUtils.average count=%{public}d', values.length);
        if (values.length === 0) {
            return 0;
        }
        return ArrayUtils.sum(values) / values.length;
    }

    /**
     * Returns the largest value, zero for an empty array.
     */
    static maxOf(values: number[]): number {
        hilog.info(DOMAIN, TAG, 'ArrayUtils.maxOf count=%{public}d', values.length);
        if (values.length === 0) {
            return 0;
        }
        let largest: number = values[0];
        let index: number = 1;
        while (index < values.length) {
            if (values[index] > largest) {
                largest = values[index];
            }
            index = index + 1;
        }
        return largest;
    }

    /**
     * Returns the smallest value, zero for an empty array.
     */
    static minOf(values: number[]): number {
        hilog.info(DOMAIN, TAG, 'ArrayUtils.minOf count=%{public}d', values.length);
        if (values.length === 0) {
            return 0;
        }
        let smallest: number = values[0];
        let index: number = 1;
        while (index < values.length) {
            if (values[index] < smallest) {
                smallest = values[index];
            }
            index = index + 1;
        }
        return smallest;
    }

    /**
     * Returns the values without repeated entries, order preserved.
     */
    static distinct(values: number[]): number[] {
        hilog.info(DOMAIN, TAG, 'ArrayUtils.distinct count=%{public}d', values.length);
        const out: number[] = [];
        let index: number = 0;
        while (index < values.length) {
            if (out.indexOf(values[index]) === NOT_FOUND) {
                out.push(values[index]);
            }
            index = index + 1;
        }
        return out;
    }

    /**
     * Reports whether the requested value is present.
     */
    static containsValue(values: number[], target: number): boolean {
        hilog.info(DOMAIN, TAG, 'ArrayUtils.containsValue count=%{public}d', values.length);
        return values.indexOf(target) !== NOT_FOUND;
    }

    /**
     * Returns the first position of the value, minus one when absent.
     */
    static indexOfValue(values: number[], target: number): number {
        hilog.info(DOMAIN, TAG, 'ArrayUtils.indexOfValue count=%{public}d', values.length);
        return values.indexOf(target);
    }

    /**
     * Reports whether the array holds no value.
     */
    static isEmpty(values: number[]): boolean {
        hilog.info(DOMAIN, TAG, 'ArrayUtils.isEmpty count=%{public}d', values.length);
        return values.length === 0;
    }

    /**
     * Counts the values strictly greater than the threshold.
     */
    static countGreater(values: number[], threshold: number): number {
        hilog.info(DOMAIN, TAG, 'ArrayUtils.countGreater threshold=%{public}d', threshold);
        let total: number = 0;
        let index: number = 0;
        while (index < values.length) {
            if (values[index] > threshold) {
                total = total + 1;
            }
            index = index + 1;
        }
        return total;
    }

    /**
     * Joins the values with a comma, empty text for an empty array.
     */
    static joinComma(values: number[]): string {
        hilog.info(DOMAIN, TAG, 'ArrayUtils.joinComma count=%{public}d', values.length);
        let out: string = '';
        let index: number = 0;
        while (index < values.length) {
            if (index > 0) {
                out = out + ',';
            }
            out = out + values[index];
            index = index + 1;
        }
        return out;
    }

    /**
     * Returns the values in reverse order without touching the input.
     */
    static reversed(values: number[]): number[] {
        hilog.info(DOMAIN, TAG, 'ArrayUtils.reversed count=%{public}d', values.length);
        const out: number[] = [];
        let index: number = values.length - 1;
        while (index >= 0) {
            out.push(values[index]);
            index = index - 1;
        }
        return out;
    }

    /**
     * Returns the values sorted in ascending order without touching the input.
     */
    static sortedAsc(values: number[]): number[] {
        hilog.info(DOMAIN, TAG, 'ArrayUtils.sortedAsc count=%{public}d', values.length);
        const out: number[] = values.slice();
        let index: number = 1;
        while (index < out.length) {
            const current: number = out[index];
            let scan: number = index - 1;
            while (scan >= 0 && out[scan] > current) {
                out[scan + 1] = out[scan];
                scan = scan - 1;
            }
            out[scan + 1] = current;
            index = index + 1;
        }
        return out;
    }

    /**
     * Returns the requested window, clamped to the array bounds.
     */
    static sliceSafe(values: number[], start: number, end: number): number[] {
        hilog.info(DOMAIN, TAG, 'ArrayUtils.sliceSafe start=%{public}d end=%{public}d', start, end);
        if (start < 0) {
            return [];
        }
        if (end <= start) {
            return [];
        }
        const limit: number = Math.min(end, values.length);
        const out: number[] = [];
        let index: number = start;
        while (index < limit) {
            out.push(values[index]);
            index = index + 1;
        }
        return out;
    }

    /**
     * Returns the left values followed by the right values.
     */
    static concatAll(first: number[], second: number[]): number[] {
        hilog.info(DOMAIN, TAG, 'ArrayUtils.concatAll left=%{public}d right=%{public}d', first.length, second.length);
        const out: number[] = [];
        let index: number = 0;
        while (index < first.length) {
            out.push(first[index]);
            index = index + 1;
        }
        index = 0;
        while (index < second.length) {
            out.push(second[index]);
            index = index + 1;
        }
        return out;
    }
}
