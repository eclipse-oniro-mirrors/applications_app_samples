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
const PERCENT_MAX: number = 100;
const FIB_LIMIT: number = 20;

/**
 * Arithmetic helpers backing the utility suites.
 *
 * The guarded members return zero instead of throwing, which keeps the suites
 * free of try blocks around a division by zero.
 */
export class MathUtils {
    /**
     * Returns the sum of both values.
     */
    static add(first: number, second: number): number {
        hilog.info(DOMAIN, TAG, 'MathUtils.add first=%{public}d second=%{public}d', first, second);
        return first + second;
    }

    /**
     * Returns the left value minus the right value.
     */
    static sub(first: number, second: number): number {
        hilog.info(DOMAIN, TAG, 'MathUtils.sub first=%{public}d second=%{public}d', first, second);
        return first - second;
    }

    /**
     * Returns the product of both values.
     */
    static mul(first: number, second: number): number {
        hilog.info(DOMAIN, TAG, 'MathUtils.mul first=%{public}d second=%{public}d', first, second);
        return first * second;
    }

    /**
     * Returns the quotient, zero when the divisor is zero.
     */
    static divSafe(first: number, second: number): number {
        hilog.info(DOMAIN, TAG, 'MathUtils.divSafe first=%{public}d second=%{public}d', first, second);
        if (second === ZERO) {
            return ZERO;
        }
        return first / second;
    }

    /**
     * Returns the remainder, zero when the divisor is zero.
     */
    static modSafe(first: number, second: number): number {
        hilog.info(DOMAIN, TAG, 'MathUtils.modSafe first=%{public}d second=%{public}d', first, second);
        if (second === ZERO) {
            return ZERO;
        }
        return first % second;
    }

    /**
     * Returns the mean of both values.
     */
    static averageOfTwo(first: number, second: number): number {
        hilog.info(DOMAIN, TAG, 'MathUtils.averageOfTwo first=%{public}d second=%{public}d', first, second);
        return (first + second) / TWO;
    }

    /**
     * Returns the percentage that the part represents of the whole, zero when the whole is zero.
     */
    static percentOf(part: number, whole: number): number {
        hilog.info(DOMAIN, TAG, 'MathUtils.percentOf part=%{public}d whole=%{public}d', part, whole);
        if (whole === ZERO) {
            return ZERO;
        }
        return part * PERCENT_MAX / whole;
    }

    /**
     * Returns the percentage limited to the closed zero hundred interval.
     */
    static clampPercent(value: number): number {
        hilog.info(DOMAIN, TAG, 'MathUtils.clampPercent value=%{public}d', value);
        if (value < ZERO) {
            return ZERO;
        }
        if (value > PERCENT_MAX) {
            return PERCENT_MAX;
        }
        return value;
    }

    /**
     * Returns the euclidean distance from the origin.
     */
    static distanceToOrigin(x: number, y: number): number {
        hilog.info(DOMAIN, TAG, 'MathUtils.distanceToOrigin x=%{public}d y=%{public}d', x, y);
        return Math.sqrt(x * x + y * y);
    }

    /**
     * Returns the fibonacci number at the requested position, zero when the position is invalid.
     */
    static fib(position: number): number {
        hilog.info(DOMAIN, TAG, 'MathUtils.fib position=%{public}d', position);
        if (position < ZERO || position > FIB_LIMIT) {
            return ZERO;
        }
        let previous: number = ZERO;
        let current: number = ONE;
        let index: number = ZERO;
        while (index < position) {
            const next: number = previous + current;
            previous = current;
            current = next;
            index = index + 1;
        }
        return previous;
    }

    /**
     * Reports whether the value is a prime number.
     */
    static isPrime(value: number): boolean {
        hilog.info(DOMAIN, TAG, 'MathUtils.isPrime value=%{public}d', value);
        if (value < TWO) {
            return false;
        }
        let divisor: number = TWO;
        while (divisor * divisor <= value) {
            if (value % divisor === ZERO) {
                return false;
            }
            divisor = divisor + 1;
        }
        return true;
    }

    /**
     * Returns the middle value of the three arguments.
     */
    static medianOfThree(first: number, second: number, third: number): number {
        hilog.info(DOMAIN, TAG, 'MathUtils.medianOfThree first=%{public}d second=%{public}d', first, second);
        if ((first <= second && second <= third) || (third <= second && second <= first)) {
            return second;
        }
        if ((second <= first && first <= third) || (third <= first && first <= second)) {
            return first;
        }
        return third;
    }

    /**
     * Returns the number of bits set in the value.
     */
    static popCount(value: number): number {
        hilog.info(DOMAIN, TAG, 'MathUtils.popCount value=%{public}d', value);
        let remaining: number = Math.trunc(value);
        if (remaining < ZERO) {
            remaining = -remaining;
        }
        let total: number = ZERO;
        while (remaining > ZERO) {
            if (remaining % TWO === ONE) {
                total = total + 1;
            }
            remaining = Math.floor(remaining / TWO);
        }
        return total;
    }

    /**
     * Returns the sum of the decimal digits, zero when no digit is present.
     */
    static sumDigits(value: number): number {
        hilog.info(DOMAIN, TAG, 'MathUtils.sumDigits value=%{public}d', value);
        let remaining: number = Math.trunc(value);
        if (remaining < ZERO) {
            remaining = -remaining;
        }
        let total: number = ZERO;
        while (remaining > ZERO) {
            total = total + remaining % 10;
            remaining = Math.floor(remaining / 10);
        }
        return total;
    }
}
