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

/**
 * Deterministic pseudo random utilities shared by the VCard hypium test
 * suites. The generator is a classic linear congruential generator (LCG)
 * in the glibc flavour:
 *
 *   seed(next) = (seed * 1103515245 + 12345) mod 2147483648
 *
 * All methods are static and the emitted sequence depends only on the
 * current seed, so reseeding with the same value always replays exactly
 * the same sequence. Tests therefore never depend on wall clock time,
 * device model or execution order and every randomized assertion stays
 * fully reproducible.
 *
 * Exactness note. The normalized state is always smaller than 2^31 and
 * the multiplier 1103515245 is smaller than 2^31, so the naive product
 * seed * 1103515245 can approach 2^62 which exceeds the exact integer
 * range (2^53) of IEEE doubles. A naive multiply-then-mod would silently
 * round low bits and break reproducibility. The implementation below
 * therefore splits both operands into 16-bit halves:
 *
 *   state = sHigh * 65536 + sLow        (sHigh < 2^15, sLow < 2^16)
 *   MULT  = mHigh * 65536 + mLow        (mHigh = 16838, mLow = 20077)
 *   state * MULT = sHigh * mHigh * 2^32
 *                + (sHigh * mLow + sLow * mHigh) * 2^16
 *                + sLow * mLow
 *
 * The sHigh * mHigh * 2^32 term is a multiple of 2^31 and therefore
 * vanishes in the final mod 2147483648 reduction, so it is never even
 * computed. Every half product stays below 2^32 and the combined term
 * (p0 + (p1 + p2) * 65536) stays below 2^49, both comfortably inside the
 * exact double range, which keeps the whole generator bit exact. With
 * the default seed 20261109 the first three raw outputs are 412829322,
 * 1649886459 and 189729048, values the suites assert literally.
 *
 * Reproducibility contract. A test that wants a known stream calls
 * reset() first; from that point on the k-th call of next() returns a
 * value fixed by k alone. seed(v) swaps the stream for the one defined
 * by v, reset() swaps back, and no method other than next() ever
 * advances the state: nextInt with an invalid bound, nextRange on an
 * empty interval, nextDigits(0), pick on an empty table or a non
 * positive count, and shuffle of zero or one elements are all
 * documented as non consuming operations, and the edge suites assert
 * that contract directly instead of trusting the comment.
 */
export class RandGenUtils {
  /** Default seed restored by reset() and used as the initial state. */
  private static readonly DEFAULT_SEED: number = 20261109;
  /** State modulus 2^31: every stored and returned value lies in [0, 2^31). */
  private static readonly STATE_MODULUS: number = 2147483648;
  /** High 16 bits of the multiplier 1103515245 = 16838 * 65536 + 20077. */
  private static readonly MULTIPLIER_HIGH: number = 16838;
  /** Low 16 bits of the multiplier 1103515245. */
  private static readonly MULTIPLIER_LOW: number = 20077;
  /** LCG increment constant. */
  private static readonly INCREMENT: number = 12345;
  /** Current generator state, always normalized into [0, 2^31). */
  private static currentSeed: number = RandGenUtils.DEFAULT_SEED;

  /**
   * Reinitializes the generator with an explicit seed. Non positive
   * values are used through their absolute value, so seed(-7) behaves
   * exactly like seed(7) and seed(0) is a legal seed of its own. The
   * stored state is normalized into [0, 2147483648), which means even
   * huge seeds such as 2147483649 or Number.MAX_SAFE_INTEGER collapse
   * onto a well defined state instead of overflowing. Non finite inputs
   * (NaN and both infinities) fall back to the default seed so the
   * generator can never enter an undefined state.
   *
   * Normalization examples asserted by the edge suite: seed(2147483647)
   * keeps 2147483647, seed(2147483648) collapses to 0, seed(2147483649)
   * collapses to 1 and Number.MAX_SAFE_INTEGER (2^53 - 1) collapses to
   * 2147483647 because 2^53 is an exact multiple of 2^31. Negative
   * seeds mirror their positives: seed(-20261109) stores 20261109 and
   * seed(-1) stores 1.
   */
  static seed(value: number): void {
    if (value === Infinity || value === -Infinity || value !== value) {
      RandGenUtils.currentSeed = RandGenUtils.DEFAULT_SEED;
      return;
    }
    const normalized: number = Math.abs(Math.floor(value));
    RandGenUtils.currentSeed = normalized % RandGenUtils.STATE_MODULUS;
  }

  /**
   * Restores the default seed 20261109 so that the very same default
   * sequence can be replayed at any point of any test case. This is the
   * recommended way for a test to obtain a known stream of pseudo
   * random values regardless of what earlier cases consumed.
   */
  static reset(): void {
    RandGenUtils.currentSeed = RandGenUtils.DEFAULT_SEED;
  }

  /**
   * Returns the current internal state, always normalized into
   * [0, 2147483648). Reading the state does not advance the sequence,
   * which makes it convenient for asserting the normalization of
   * extreme seeds without consuming any random value.
   */
  static getSeed(): number {
    return RandGenUtils.currentSeed;
  }

  /**
   * Advances the generator one step and returns the new state value in
   * [0, 2147483648). The step is
   *
   *   state = (state * 1103515245 + 12345) mod 2147483648
   *
   * computed with the exact 16-bit split multiplication described in
   * the class comment so that no double rounding can ever shift a bit.
   * Starting from the default seed 20261109 the first five outputs are
   * 412829322, 1649886459, 189729048, 100425585 and 1945059670.
   *
   * The returned value is also the new internal state, so getSeed()
   * right after next() always equals the value just returned, a
   * trivial but useful invariant for tests that want to resume a
   * stream later via seed(savedState).
   */
  static next(): number {
    let state: number = RandGenUtils.currentSeed % RandGenUtils.STATE_MODULUS;
    if (state < 0) {
      state += RandGenUtils.STATE_MODULUS;
    }
    const stateHigh: number = Math.floor(state / 65536);
    const stateLow: number = state % 65536;
    const p0: number = stateLow * RandGenUtils.MULTIPLIER_LOW;
    const p1: number = stateLow * RandGenUtils.MULTIPLIER_HIGH;
    const p2: number = stateHigh * RandGenUtils.MULTIPLIER_LOW;
    const combined: number = p0 + (p1 + p2) * 65536;
    let result: number = combined % RandGenUtils.STATE_MODULUS;
    result = (result + RandGenUtils.INCREMENT) % RandGenUtils.STATE_MODULUS;
    RandGenUtils.currentSeed = result;
    return result;
  }

  /**
   * Returns the next raw value reduced into [0, maxExclusive). A non
   * positive bound yields 0 without consuming any random value, so the
   * sequence position stays untouched for invalid bounds; only a bound
   * of at least 1 actually advances the generator. With the default
   * seed the first draws of nextInt(1000) are 322, 459, 48, 585, 670.
   *
   * Bound handling details: nextInt(1) always returns 0 yet still
   * consumes one raw draw, which keeps bounded streams aligned with
   * their raw counterpart; nextInt(0) and nextInt(-5) return 0 and
   * consume nothing. A bound not smaller than the state modulus, for
   * example nextInt(2147483648), simply returns the raw value
   * unchanged because the state is already smaller than the bound.
   */
  static nextInt(maxExclusive: number): number {
    if (maxExclusive <= 0) {
      return 0;
    }
    return RandGenUtils.next() % maxExclusive;
  }

  /**
   * Returns a value in [minInclusive, maxExclusive). When maxExclusive
   * is not greater than minInclusive the interval is empty and the
   * boundary minInclusive itself is returned without consuming random
   * values. Otherwise the draw equals minInclusive + nextInt(span),
   * where span is the distance between the two bounds.
   *
   * Examples on the default stream: nextRange(1000, 9999) yields
   * 1197 then 1800, nextRange(500, 600) yields 522, while a reversed
   * interval such as (9, 3) or a degenerate one such as (5, 5) returns
   * the lower bound without consuming anything.
   */
  static nextRange(minInclusive: number, maxExclusive: number): number {
    if (maxExclusive <= minInclusive) {
      return minInclusive;
    }
    const span: number = maxExclusive - minInclusive;
    return minInclusive + RandGenUtils.nextInt(span);
  }

  /**
   * Builds a decimal digit string of exactly count characters. The
   * first character may well be '0' because digits come from successive
   * nextInt(10) draws instead of a plain numeric conversion, so the
   * result always has the requested length. count <= 0 returns the
   * empty string without consuming the sequence. With the default seed
   * nextDigits(5) is '29850' and nextDigits(10) is '2985014309'.
   *
   * Because each character costs exactly one draw, splitting a call
   * into pieces reproduces the joined single call: nextDigits(1) plus
   * nextDigits(2) plus nextDigits(3) on the default seed spells
   * '2' + '98' + '501', identical to the first six characters that
   * nextDigits(6) would return after reset().
   */
  static nextDigits(count: number): string {
    if (count <= 0) {
      return '';
    }
    let result: string = '';
    for (let i: number = 0; i < count; i++) {
      result += String(RandGenUtils.nextInt(10));
    }
    return result;
  }

  /**
   * Draws count elements from source with replacement, so the same
   * entry may appear several times in the returned array while the
   * source array itself is never modified. An empty source or a non
   * positive count yields an empty result; in both cases no random
   * value is consumed because the short circuit happens first. Each
   * draw uses nextInt(source.length) so the pick is reproducible.
   *
   * Examples on the default stream: picking three entries from a four
   * element table yields gamma, delta, alpha (raw residues 2, 3, 0)
   * and picking five entries from a two element table yields the
   * alternating pattern A, B, A, B, A (raw residues 0, 1, 0, 1, 0).
   */
  static pick(source: string[], count: number): string[] {
    const out: string[] = [];
    if (source.length === 0 || count <= 0) {
      return out;
    }
    for (let i: number = 0; i < count; i++) {
      out.push(source[RandGenUtils.nextInt(source.length)]);
    }
    return out;
  }

  /**
   * Fisher-Yates shuffle performed over a defensive copy, so the source
   * array is never modified and the returned array holds exactly the
   * same elements in a possibly different order. Each swap position is
   * drawn with nextInt(i + 1), which makes the permutation fully
   * determined by the current seed. With the default seed shuffling the
   * list ['a','b','c','d','e'] produces ['e','b','a','d','c'] and
   * shuffling ['w','x','y','z'] produces ['x','z','w','y'].
   *
   * Zero and one element inputs skip the swap loop entirely, so they
   * return a fresh copy without consuming any draw, a property the
   * edge suite asserts together with the untouched source invariant.
   */
  static shuffle(source: string[]): string[] {
    const out: string[] = [];
    for (let i: number = 0; i < source.length; i++) {
      out.push(source[i]);
    }
    for (let i: number = out.length - 1; i > 0; i--) {
      const j: number = RandGenUtils.nextInt(i + 1);
      const tmp: string = out[i];
      out[i] = out[j];
      out[j] = tmp;
    }
    return out;
  }
}
