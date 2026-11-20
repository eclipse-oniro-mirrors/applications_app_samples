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
 * Pure integer math helpers shared by the VCard hypium test suites. All
 * methods are static and side-effect free; every overflow or invalid-input
 * case has an explicitly documented convention so the tests can assert
 * exact expectations without relying on undefined behavior. Typical
 * usages covered by the suites include gcd/lcm factorization checks,
 * prime matrices, Fibonacci sequences and the factorial overflow rule.
 */
export class IntMathUtils {
  /**
   * Largest exact integer value (2^53 - 1). Every method that builds or
   * multiplies intermediate numbers checks against this bound so no
   * silent double precision rounding can leak into the test expectations.
   */
  private static readonly MAX_SAFE: number = 9007199254740991;

  /**
   * Greatest common divisor computed with the Euclidean algorithm. If
   * either argument is 0 the absolute value of the other argument is
   * returned; gcd(0, 0) is 0. Non-integer or infinite input returns 0.
   * For example gcd(48, 18) is 6, gcd(-48, 18) is 6 and gcd(0, -7) is 7.
   */
  static gcd(a: number, b: number): number {
    if (a === Infinity || a === -Infinity || b === Infinity || b === -Infinity) {
      return 0;
    }
    if (a !== Math.floor(a) || b !== Math.floor(b)) {
      return 0;
    }
    let x: number = Math.abs(a);
    let y: number = Math.abs(b);
    while (y !== 0) {
      const t: number = x % y;
      x = y;
      y = t;
    }
    return x;
  }

  /**
   * Least common multiple computed through gcd. If either argument is 0
   * the result is 0. Results beyond the safe integer range return 0.
   * For example lcm(4, 6) is 12, lcm(5, 5) is 5 and lcm(-4, 6) is 12.
   */
  static lcm(a: number, b: number): number {
    if (a === 0 || b === 0) {
      return 0;
    }
    const g: number = IntMathUtils.gcd(a, b);
    if (g === 0) {
      return 0;
    }
    const left: number = Math.abs(a) / g;
    const result: number = left * Math.abs(b);
    if (result !== result || result > IntMathUtils.MAX_SAFE) {
      return 0;
    }
    return result;
  }

  /**
   * Primality test by trial division up to the square root. n < 2,
   * non-integers, infinite values and values beyond the safe integer range
   * return false.
   * For example isPrime(2) is true while isPrime(9), isPrime(1) and
   * isPrime(-7) are false.
   */
  static isPrime(n: number): boolean {
    if (n !== Math.floor(n) || n < 2 || n > IntMathUtils.MAX_SAFE) {
      return false;
    }
    if (n === 2) {
      return true;
    }
    if (n % 2 === 0) {
      return false;
    }
    let i: number = 3;
    while (i * i <= n) {
      if (n % i === 0) {
        return false;
      }
      i = i + 2;
    }
    return true;
  }

  /**
   * Prime factorization in ascending order with multiplicity, e.g.
   * 12 -> [2, 2, 3]. n < 2, non-integers and values beyond the safe integer
   * range return an empty array.
   * For example primeFactors(360) is [2, 2, 2, 3, 3, 5] and
   * primeFactors(97) is [97].
   */
  static primeFactors(n: number): number[] {
    const out: number[] = [];
    if (n !== Math.floor(n) || n < 2 || n > IntMathUtils.MAX_SAFE) {
      return out;
    }
    let m: number = n;
    let d: number = 2;
    while (d * d <= m) {
      while (m % d === 0) {
        out.push(d);
        m = m / d;
      }
      if (d === 2) {
        d = 3;
      } else {
        d = d + 2;
      }
    }
    if (m > 1) {
      out.push(m);
    }
    return out;
  }

  /**
   * First count Fibonacci numbers starting from 1, 1. count <= 0 or a
   * non-integer count returns an empty array.
   * For example fibonacci(5) is [1, 1, 2, 3, 5] and fibonacci(10) ends
   * with the value 55.
   */
  static fibonacci(count: number): number[] {
    const out: number[] = [];
    if (count === Infinity || count === -Infinity) {
      return out;
    }
    if (count !== Math.floor(count) || count <= 0) {
      return out;
    }
    let a: number = 1;
    let b: number = 1;
    for (let i = 0; i < count; i++) {
      out.push(a);
      const next: number = a + b;
      a = b;
      b = next;
    }
    return out;
  }

  /**
   * Factorial of a non-negative integer. By convention n > 20 and n < 0
   * return 0, and non-integer input returns 0 as well.
   * For example factorial(0) is 1, factorial(20) is 2432902008176640000
   * and factorial(21) is 0 by the documented overflow convention.
   */
  static factorial(n: number): number {
    if (n !== Math.floor(n) || n < 0 || n > 20) {
      return 0;
    }
    let result: number = 1;
    for (let i = 2; i <= n; i++) {
      result = result * i;
    }
    return result;
  }

  /**
   * Number of decimal digits of the absolute value of n. digitCount(0) is
   * 1 by convention. Non-integer or infinite input returns 0.
   * For example digitCount(999) is 3 and digitCount(-987654) is 6.
   */
  static digitCount(n: number): number {
    if (n === Infinity || n === -Infinity || n !== Math.floor(n)) {
      return 0;
    }
    let m: number = Math.abs(n);
    if (m === 0) {
      return 1;
    }
    let count: number = 0;
    while (m > 0) {
      m = Math.floor(m / 10);
      count = count + 1;
    }
    return count;
  }

  /**
   * Reverse the decimal digits of n keeping the sign, e.g. 1200 -> 21 and
   * -456 -> -654. Non-integer input, infinite input and intermediate
   * results beyond the safe integer range return 0.
   * For example reverseNumber(12345) is 54321 and reverseNumber(100)
   * collapses to 1 because trailing zeros vanish.
   */
  static reverseNumber(n: number): number {
    if (n === Infinity || n === -Infinity || n !== Math.floor(n)) {
      return 0;
    }
    const sign: number = n < 0 ? -1 : 1;
    let m: number = Math.abs(n);
    let result: number = 0;
    while (m > 0) {
      const digit: number = m % 10;
      const next: number = result * 10 + digit;
      if (next > IntMathUtils.MAX_SAFE) {
        return 0;
      }
      result = next;
      m = Math.floor(m / 10);
    }
    return sign * result;
  }

  /**
   * Modular exponentiation with the fast-power (square and multiply)
   * algorithm. exp must be a non-negative integer and mod must be
   * positive; otherwise the result is 0. Negative bases are normalized
   * into [0, mod) so the result is always non-negative. Intermediate
   * products beyond the safe integer range also return 0.
   * For example modPow(2, 10, 1000) is 24, modPow(7, 0, 13) is 1 and
   * modPow(-2, 3, 5) is 2.
   */
  static modPow(base: number, exp: number, mod: number): number {
    if (mod <= 0 || exp < 0 || exp === Infinity || exp !== Math.floor(exp)) {
      return 0;
    }
    const bRaw: number = ((base % mod) + mod) % mod;
    if (bRaw !== bRaw) {
      return 0;
    }
    let result: number = 1 % mod;
    let b: number = bRaw;
    let e: number = exp;
    while (e > 0) {
      if (e % 2 === 1) {
        const next: number = result * b;
        if (next > IntMathUtils.MAX_SAFE) {
          return 0;
        }
        result = next % mod;
      }
      e = Math.floor(e / 2);
      if (e > 0) {
        const square: number = b * b;
        if (square > IntMathUtils.MAX_SAFE) {
          return 0;
        }
        b = square % mod;
      }
    }
    return result;
  }
}
