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
const TEN: number = 10;
const FACTORIAL_LIMIT: number = 12;

/**
 * Scalar number helpers backing the utility suites.
 *
 * The helpers avoid Math.round on values that a suite could feed with a
 * fractional overflow, so every returned value stays inside the documented
 * range and can be compared with a strict equality assertion.
 */
export class NumberUtils {
    /**
     * Returns the value limited to the closed interval.
     */
    static clamp(value: number, min: number, max: number): number {
        hilog.info(DOMAIN, TAG, 'NumberUtils.clamp value=%{public}d', value);
        if (value < min) {
            return min;
        }
        if (value > max) {
            return max;
        }
        return value;
    }

    /**
     * Returns the absolute value.
     */
    static absOf(value: number): number {
        hilog.info(DOMAIN, TAG, 'NumberUtils.absOf value=%{public}d', value);
        if (value < ZERO) {
            return -value;
        }
        return value;
    }

    /**
     * Returns the digit count of the integer part, one for zero.
     */
    static digitCount(value: number): number {
        hilog.info(DOMAIN, TAG, 'NumberUtils.digitCount value=%{public}d', value);
        let remaining: number = Math.trunc(NumberUtils.absOf(value));
        if (remaining === ZERO) {
            return ONE;
        }
        let total: number = ZERO;
        while (remaining >= ONE) {
            remaining = Math.floor(remaining / TEN);
            total = total + 1;
        }
        return total;
    }

    /**
     * Returns the factorial of the value, zero for negative values.
     */
    static factorial(value: number): number {
        hilog.info(DOMAIN, TAG, 'NumberUtils.factorial value=%{public}d', value);
        if (value < ZERO || value > FACTORIAL_LIMIT) {
            return ZERO;
        }
        let out: number = ONE;
        let index: number = 2;
        while (index <= value) {
            out = out * index;
            index = index + 1;
        }
        return out;
    }

    /**
     * Returns the greatest common divisor, zero when both values are zero.
     */
    static gcd(first: number, second: number): number {
        hilog.info(DOMAIN, TAG, 'NumberUtils.gcd first=%{public}d second=%{public}d', first, second);
        let left: number = Math.trunc(NumberUtils.absOf(first));
        let right: number = Math.trunc(NumberUtils.absOf(second));
        while (right !== ZERO) {
            const rest: number = left % right;
            left = right;
            right = rest;
        }
        return left;
    }

    /**
     * Returns the least common multiple, zero when a value is zero.
     */
    static lcm(first: number, second: number): number {
        hilog.info(DOMAIN, TAG, 'NumberUtils.lcm first=%{public}d second=%{public}d', first, second);
        if (first === ZERO || second === ZERO) {
            return ZERO;
        }
        const divisor: number = NumberUtils.gcd(first, second);
        return Math.trunc(NumberUtils.absOf(first) / divisor) * NumberUtils.absOf(second);
    }

    /**
     * Reports whether the value is an even integer.
     */
    static isEven(value: number): boolean {
        hilog.info(DOMAIN, TAG, 'NumberUtils.isEven value=%{public}d', value);
        return Math.trunc(value) % 2 === ZERO;
    }

    /**
     * Reports whether the value is an odd integer.
     */
    static isOdd(value: number): boolean {
        hilog.info(DOMAIN, TAG, 'NumberUtils.isOdd value=%{public}d', value);
        return Math.trunc(value) % 2 !== ZERO;
    }

    /**
     * Reports whether the value sits inside the closed interval.
     */
    static isInRange(value: number, min: number, max: number): boolean {
        hilog.info(DOMAIN, TAG, 'NumberUtils.isInRange value=%{public}d', value);
        return value >= min && value <= max;
    }

    /**
     * Returns the value rounded to a single decimal place.
     */
    static roundTo1(value: number): number {
        hilog.info(DOMAIN, TAG, 'NumberUtils.roundTo1 value=%{public}d', value);
        return Math.round(value * TEN) / TEN;
    }

    /**
     * Returns the value rounded up to the next step, unchanged for a zero step.
     */
    static roundUpToStep(value: number, step: number): number {
        hilog.info(DOMAIN, TAG, 'NumberUtils.roundUpToStep value=%{public}d step=%{public}d', value, step);
        if (step <= ZERO) {
            return value;
        }
        return Math.ceil(value / step) * step;
    }

    /**
     * Returns minus one, zero or one following the value sign.
     */
    static signOf(value: number): number {
        hilog.info(DOMAIN, TAG, 'NumberUtils.signOf value=%{public}d', value);
        if (value < ZERO) {
            return -ONE;
        }
        if (value > ZERO) {
            return ONE;
        }
        return ZERO;
    }

    /**
     * Returns the value multiplied by itself.
     */
    static square(value: number): number {
        hilog.info(DOMAIN, TAG, 'NumberUtils.square value=%{public}d', value);
        return value * value;
    }

    /**
     * Returns the inclusive sum from the lower bound to the upper bound.
     */
    static sumRange(from: number, to: number): number {
        hilog.info(DOMAIN, TAG, 'NumberUtils.sumRange from=%{public}d to=%{public}d', from, to);
        if (to < from) {
            return ZERO;
        }
        let total: number = ZERO;
        let index: number = from;
        while (index <= to) {
            total = total + index;
            index = index + 1;
        }
        return total;
    }
}
