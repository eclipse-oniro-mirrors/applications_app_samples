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
const FIVE: number = 5;
const TWELVE: number = 12;
const HEX_RADIX: number = 16;
const MULTIPLIER: number = 37;
const OFFSET: number = 17;
const MODULUS: number = 101;
const TOKEN_WIDTH: number = 2;
const PERCENT_MAX: number = 100;
const HEADS_TEXT: string = 'heads';
const TAILS_TEXT: string = 'tails';
const UUID_WIDTHS: number[] = [8, 4, 4, 4, 12];

/**
 * Seeded pseudo random helpers backing the utility suites.
 *
 * Every member derives its value from the seed only, so a suite case is
 * repeatable and never depends on the wall clock or on a previous call.
 */
export class RandomUtils {
    /**
     * Returns the pseudo random value driven by the seed, inside zero ninety nine.
     */
    static nextValue(seed: number): number {
        hilog.info(DOMAIN, TAG, 'RandomUtils.nextValue seed=%{public}d', seed);
        const base: number = Math.trunc(Math.abs(seed));
        return (base * MULTIPLIER + OFFSET) % MODULUS;
    }

    /**
     * Returns the next boolean driven by the seed.
     */
    static nextBool(seed: number): boolean {
        hilog.info(DOMAIN, TAG, 'RandomUtils.nextBool seed=%{public}d', seed);
        return RandomUtils.nextValue(seed) % TWO === ZERO;
    }

    /**
     * Returns a value inside the closed interval driven by the seed.
     */
    static nextInRange(seed: number, min: number, max: number): number {
        hilog.info(DOMAIN, TAG, 'RandomUtils.nextInRange min=%{public}d max=%{public}d', min, max);
        if (max < min) {
            return min;
        }
        const span: number = max - min + ONE;
        return min + RandomUtils.nextValue(seed) % span;
    }

    /**
     * Returns a die face driven by the seed.
     */
    static diceRoll(seed: number): number {
        hilog.info(DOMAIN, TAG, 'RandomUtils.diceRoll seed=%{public}d', seed);
        return RandomUtils.nextInRange(seed, ONE, 6);
    }

    /**
     * Returns the seeded percentage inside zero hundred.
     */
    static percentFromSeed(seed: number): number {
        hilog.info(DOMAIN, TAG, 'RandomUtils.percentFromSeed seed=%{public}d', seed);
        return RandomUtils.nextValue(seed) % (PERCENT_MAX + ONE);
    }

    /**
     * Returns the bucket index driven by the seed.
     */
    static bucketOf(seed: number, buckets: number): number {
        hilog.info(DOMAIN, TAG, 'RandomUtils.bucketOf buckets=%{public}d', buckets);
        if (buckets <= ZERO) {
            return ZERO;
        }
        return RandomUtils.nextValue(seed) % buckets;
    }

    /**
     * Returns how many seeds land inside the requested bucket.
     */
    static countInBucket(seeds: number[], buckets: number, target: number): number {
        hilog.info(DOMAIN, TAG, 'RandomUtils.countInBucket count=%{public}d', seeds.length);
        let total: number = ZERO;
        let index: number = ZERO;
        while (index < seeds.length) {
            if (RandomUtils.bucketOf(seeds[index], buckets) === target) {
                total = total + 1;
            }
            index = index + 1;
        }
        return total;
    }

    /**
     * Returns the coin face text driven by the seed.
     */
    static coinFlipText(seed: number): string {
        hilog.info(DOMAIN, TAG, 'RandomUtils.coinFlipText seed=%{public}d', seed);
        if (RandomUtils.nextValue(seed) % TWO === ZERO) {
            return HEADS_TEXT;
        }
        return TAILS_TEXT;
    }

    /**
     * Returns the seed scaled into the closed zero to maximum interval.
     */
    static scaleBySeed(seed: number, maximum: number): number {
        hilog.info(DOMAIN, TAG, 'RandomUtils.scaleBySeed maximum=%{public}d', maximum);
        if (maximum <= ZERO) {
            return ZERO;
        }
        return RandomUtils.nextValue(seed) % (maximum + ONE);
    }

    /**
     * Returns the scaled percentage with a single decimal place.
     */
    static formatScaledPercent(seed: number): string {
        hilog.info(DOMAIN, TAG, 'RandomUtils.formatScaledPercent seed=%{public}d', seed);
        return RandomUtils.percentFromSeed(seed).toFixed(ONE) + '%';
    }

    /**
     * Returns an index inside the list length driven by the seed.
     */
    static pickIndex(seed: number, size: number): number {
        hilog.info(DOMAIN, TAG, 'RandomUtils.pickIndex size=%{public}d', size);
        if (size <= ZERO) {
            return ZERO;
        }
        return RandomUtils.nextValue(seed) % size;
    }

    /**
     * Returns the list entry driven by the seed, empty for an empty list.
     */
    static pickFromList(seed: number, values: string[]): string {
        hilog.info(DOMAIN, TAG, 'RandomUtils.pickFromList size=%{public}d', values.length);
        if (values.length === ZERO) {
            return '';
        }
        return values[RandomUtils.pickIndex(seed, values.length)];
    }

    /**
     * Returns the seed mixed with a constant and the multiplier.
     */
    static hashSeed(seed: number): number {
        hilog.info(DOMAIN, TAG, 'RandomUtils.hashSeed seed=%{public}d', seed);
        const base: number = Math.trunc(Math.abs(seed));
        return base * 31 + 7;
    }

    /**
     * Reports whether the seeded value is even.
     */
    static isEvenSeed(seed: number): boolean {
        hilog.info(DOMAIN, TAG, 'RandomUtils.isEvenSeed seed=%{public}d', seed);
        return RandomUtils.nextValue(seed) % TWO === ZERO;
    }

    /**
     * Returns the mean of the two seeded values.
     */
    static averageOfTwoSeeds(first: number, second: number): number {
        hilog.info(DOMAIN, TAG, 'RandomUtils.averageOfTwoSeeds first=%{public}d second=%{public}d', first, second);
        return (RandomUtils.nextValue(first) + RandomUtils.nextValue(second)) / TWO;
    }

    /**
     * Returns a short hexadecimal token driven by the seed.
     */
    static tokenFromSeed(seed: number): string {
        hilog.info(DOMAIN, TAG, 'RandomUtils.tokenFromSeed seed=%{public}d', seed);
        let text: string = RandomUtils.nextValue(seed).toString(HEX_RADIX).toUpperCase();
        while (text.length < TOKEN_WIDTH) {
            text = '0' + text;
        }
        return text;
    }

    /**
     * Returns a grouped hexadecimal identifier driven by the seed.
     */
    static uuidFromSeed(seed: number): string {
        hilog.info(DOMAIN, TAG, 'RandomUtils.uuidFromSeed seed=%{public}d', seed);
        let current: number = RandomUtils.nextValue(seed);
        let out: string = '';
        let group: number = ZERO;
        while (group < UUID_WIDTHS.length) {
            if (group > ZERO) {
                out = out + '-';
            }
            let inner: number = ZERO;
            while (inner < UUID_WIDTHS[group]) {
                out = out + (current % HEX_RADIX).toString(HEX_RADIX).toLowerCase();
                current = RandomUtils.nextValue(current);
                inner = inner + 1;
            }
            group = group + 1;
        }
        return out;
    }

    /**
     * Returns the seeded digit count of the value.
     */
    static digitCountOfSeed(seed: number): number {
        hilog.info(DOMAIN, TAG, 'RandomUtils.digitCountOfSeed seed=%{public}d', seed);
        const value: number = RandomUtils.nextValue(seed);
        if (value === ZERO) {
            return ONE;
        }
        return value < 10 ? ONE : TWO;
    }
}
