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

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const MULTIPLIER: number = 1103515245;
const INCREMENT: number = 12345;
const MODULUS: number = 2147483648;
const HEX_BASE_RADIX: number = 16;
const PERCENT_SPAN: number = 101;
const DICE_FACES: number = 6;
const DICE_OFFSET: number = 1;
const TOKEN_ALPHABET: string = 'abcdefghijklmnopqrstuvwxyz0123456789';
const HEX_DIGITS: string = '0123456789abcdef';
const UUID_LENGTH: number = 32;
const UUID_GROUP_FIRST: number = 8;
const UUID_GROUP_SECOND: number = 12;
const UUID_GROUP_THIRD: number = 16;
const UUID_GROUP_FOURTH: number = 20;
const THOUSAND: number = 1000;
const TEN: number = 10;

/**
 * Deterministic pseudo random helpers backing the ohosTest utility suites.
 *
 * Every member is derived from an explicit seed instead of a global generator,
 * which keeps the assertions reproducible across runs and devices.
 */
export class RandomUtils {
  /**
   * Mixes the seed into a non negative pseudo random value.
   */
  static nextValue(seed: number): number {
    hilog.info(DOMAIN, TAG, 'RandomUtils.nextValue seed=%{public}d', seed);
    return RandomUtils.mix(seed);
  }

  /**
   * Returns a pseudo random integer inside the inclusive window.
   */
  static nextInRange(seed: number, low: number, high: number): number {
    hilog.info(DOMAIN, TAG, 'RandomUtils.nextInRange low=%{public}d high=%{public}d', low, high);
    if (high < low) {
      return low;
    }
    const span: number = high - low + 1;
    return low + RandomUtils.mix(seed) % span;
  }

  /**
   * Returns a pseudo random boolean drawn from the seed parity.
   */
  static nextBool(seed: number): boolean {
    hilog.info(DOMAIN, TAG, 'RandomUtils.nextBool seed=%{public}d', seed);
    return RandomUtils.mix(seed) % 2 === 0;
  }

  /**
   * Returns a pseudo random index below the requested size.
   */
  static pickIndex(seed: number, size: number): number {
    hilog.info(DOMAIN, TAG, 'RandomUtils.pickIndex size=%{public}d', size);
    if (size <= 0) {
      return 0;
    }
    return RandomUtils.mix(seed) % size;
  }

  /**
   * Returns a pseudo random percentage in [0, 100].
   */
  static percentFromSeed(seed: number): number {
    hilog.info(DOMAIN, TAG, 'RandomUtils.percentFromSeed seed=%{public}d', seed);
    return RandomUtils.mix(seed) % PERCENT_SPAN;
  }

  /**
   * Returns a pseudo random dice face in [1, 6].
   */
  static diceRoll(seed: number): number {
    hilog.info(DOMAIN, TAG, 'RandomUtils.diceRoll seed=%{public}d', seed);
    return DICE_OFFSET + RandomUtils.mix(seed) % DICE_FACES;
  }

  /**
   * Builds a pseudo random lower case alphanumeric token of the requested length.
   */
  static tokenFromSeed(seed: number, length: number): string {
    hilog.info(DOMAIN, TAG, 'RandomUtils.tokenFromSeed length=%{public}d', length);
    let state: number = Math.abs(Math.trunc(seed));
    let out: string = '';
    let index: number = 0;
    while (index < length) {
      state = RandomUtils.mix(state + index + 1);
      out = out + TOKEN_ALPHABET.charAt(state % TOKEN_ALPHABET.length);
      index = index + 1;
    }
    return out;
  }

  /**
   * Builds a pseudo random UUID shaped identifier of the requested seed.
   */
  static uuidFromSeed(seed: number): string {
    hilog.info(DOMAIN, TAG, 'RandomUtils.uuidFromSeed seed=%{public}d', seed);
    const digits: string[] = [];
    let state: number = Math.abs(Math.trunc(seed));
    let index: number = 0;
    while (index < UUID_LENGTH) {
      state = RandomUtils.mix(state + index + 1);
      digits.push(HEX_DIGITS.charAt(state % HEX_BASE_RADIX));
      index = index + 1;
    }
    return digits.slice(0, UUID_GROUP_FIRST).join('') + '-' +
      digits.slice(UUID_GROUP_FIRST, UUID_GROUP_SECOND).join('') + '-' +
      digits.slice(UUID_GROUP_SECOND, UUID_GROUP_THIRD).join('') + '-' +
      digits.slice(UUID_GROUP_THIRD, UUID_GROUP_FOURTH).join('') + '-' +
      digits.slice(UUID_GROUP_FOURTH).join('');
  }

  /**
   * Reports whether the magnitude of the seed is even.
   */
  static isEvenSeed(seed: number): boolean {
    hilog.info(DOMAIN, TAG, 'RandomUtils.isEvenSeed seed=%{public}d', seed);
    return Math.abs(seed) % 2 === 0;
  }

  /**
   * Renders a seed driven coin flip as text.
   */
  static coinFlipText(seed: number): string {
    hilog.info(DOMAIN, TAG, 'RandomUtils.coinFlipText seed=%{public}d', seed);
    return RandomUtils.nextBool(seed) ? 'HEAD' : 'TAIL';
  }

  /**
   * Returns the bucket index of the seed within the requested bucket count.
   */
  static bucketOf(seed: number, buckets: number): number {
    hilog.info(DOMAIN, TAG, 'RandomUtils.bucketOf buckets=%{public}d', buckets);
    if (buckets <= 0) {
      return 0;
    }
    return RandomUtils.mix(seed) % buckets;
  }

  /**
   * Picks one entry of the list driven by the seed.
   */
  static pickFromList(seed: number, items: string[]): string {
    hilog.info(DOMAIN, TAG, 'RandomUtils.pickFromList size=%{public}d', items.length);
    if (items.length === 0) {
      return '';
    }
    return items[RandomUtils.mix(seed) % items.length];
  }

  /**
   * Scales the factor by a tenth step derived from the seed.
   */
  static scaleBySeed(seed: number, factor: number): number {
    hilog.info(DOMAIN, TAG, 'RandomUtils.scaleBySeed factor=%{public}d', factor);
    const step: number = RandomUtils.mix(seed) % TEN;
    return factor * step / TEN;
  }

  /**
   * Returns a shifted mix of the seed used as a stable identifier hash.
   */
  static hashSeed(seed: number): number {
    hilog.info(DOMAIN, TAG, 'RandomUtils.hashSeed seed=%{public}d', seed);
    return RandomUtils.mix(seed + 7);
  }

  /**
   * Linear congruential mix shared by every member of this class.
   */
  static mix(seed: number): number {
    const mixed: number = seed * MULTIPLIER + INCREMENT;
    return Math.abs(mixed % MODULUS);
  }

  /**
   * Renders a value scaled to a three digit percentage string.
   */
  static formatScaledPercent(seed: number): string {
    hilog.info(DOMAIN, TAG, 'RandomUtils.formatScaledPercent seed=%{public}d', seed);
    const percent: number = RandomUtils.percentFromSeed(seed);
    let text: string = percent.toString();
    while (text.length < 3) {
      text = '0' + text;
    }
    return text + '%';
  }

  /**
   * Returns the mean of two seeded draws rounded down.
   */
  static averageOfTwoSeeds(first: number, second: number): number {
    hilog.info(DOMAIN, TAG, 'RandomUtils.averageOfTwoSeeds second=%{public}d', second);
    const left: number = RandomUtils.mix(first);
    const right: number = RandomUtils.mix(second);
    return Math.floor((left + right) / 2);
  }

  /**
   * Counts how many draws land in the requested bucket.
   */
  static countInBucket(seed: number, buckets: number, bucket: number): number {
    hilog.info(DOMAIN, TAG, 'RandomUtils.countInBucket bucket=%{public}d', bucket);
    let total: number = 0;
    let state: number = Math.abs(Math.trunc(seed));
    let round: number = 0;
    while (round < THOUSAND / THOUSAND * 10) {
      state = RandomUtils.mix(state + round + 1);
      if (buckets > 0 && state % buckets === bucket) {
        total = total + 1;
      }
      round = round + 1;
    }
    return total;
  }
}
