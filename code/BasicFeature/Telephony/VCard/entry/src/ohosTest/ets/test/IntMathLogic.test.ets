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
import { IntMathUtils } from '../testutils/IntMathUtils';

const DOMAIN: number = 0xF811;

export default function intMathLogicTest() {
  describe('IntMathLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_0100
     * @tc.name      testGcd0001
     * @tc.desc      Verify gcd returns the greatest common divisor for
     *               plain positive integer pairs in both argument orders.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testGcd0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testGcd0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.gcd(48, 18)).assertEqual(6);
      expect(IntMathUtils.gcd(18, 48)).assertEqual(6);
      expect(IntMathUtils.gcd(100, 75)).assertEqual(25);
      expect(IntMathUtils.gcd(270, 192)).assertEqual(6);
      expect(IntMathUtils.gcd(7, 13)).assertEqual(1);
      expect(IntMathUtils.gcd(12, 18)).assertEqual(6);
      const pair: number = IntMathUtils.gcd(64, 96);
      expect(pair).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_0200
     * @tc.name      testGcd0002
     * @tc.desc      Verify gcd follows the zero convention returning the
     *               absolute value of the other argument and zero for 0,0.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGcd0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testGcd0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.gcd(0, 5)).assertEqual(5);
      expect(IntMathUtils.gcd(5, 0)).assertEqual(5);
      expect(IntMathUtils.gcd(0, -7)).assertEqual(7);
      expect(IntMathUtils.gcd(0, 0)).assertEqual(0);
      expect(IntMathUtils.gcd(0, 1)).assertEqual(1);
      const zeroFirst: number = IntMathUtils.gcd(0, 999);
      expect(zeroFirst).assertEqual(999);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_0300
     * @tc.name      testGcd0003
     * @tc.desc      Verify gcd normalizes negative arguments to their
     *               absolute values before running the algorithm.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGcd0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testGcd0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.gcd(-48, 18)).assertEqual(6);
      expect(IntMathUtils.gcd(48, -18)).assertEqual(6);
      expect(IntMathUtils.gcd(-9, -6)).assertEqual(3);
      expect(IntMathUtils.gcd(-100, 75)).assertEqual(25);
      expect(IntMathUtils.gcd(-17, -17)).assertEqual(17);
      const negResult: number = IntMathUtils.gcd(-64, 96);
      expect(negResult).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_0400
     * @tc.name      testGcd0004
     * @tc.desc      Verify gcd resolves multiple-of pairs and coprime pairs
     *               with large magnitudes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testGcd0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testGcd0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.gcd(17, 289)).assertEqual(17);
      expect(IntMathUtils.gcd(13, 17)).assertEqual(1);
      expect(IntMathUtils.gcd(1000000, 500000)).assertEqual(500000);
      expect(IntMathUtils.gcd(6, 35)).assertEqual(1);
      expect(IntMathUtils.gcd(64, 96)).assertEqual(32);
      expect(IntMathUtils.gcd(1024, 512)).assertEqual(512);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_0500
     * @tc.name      testLcm0001
     * @tc.desc      Verify lcm computes the least common multiple for
     *               positive pairs including equal and coprime inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLcm0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLcm0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.lcm(4, 6)).assertEqual(12);
      expect(IntMathUtils.lcm(3, 7)).assertEqual(21);
      expect(IntMathUtils.lcm(5, 5)).assertEqual(5);
      expect(IntMathUtils.lcm(8, 12)).assertEqual(24);
      expect(IntMathUtils.lcm(6, 8)).assertEqual(24);
      expect(IntMathUtils.lcm(1, 99)).assertEqual(99);
      const pairLcm: number = IntMathUtils.lcm(9, 6);
      expect(pairLcm).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_0600
     * @tc.name      testLcm0002
     * @tc.desc      Verify lcm returns zero when either argument is zero
     *               and normalizes negative inputs through gcd.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLcm0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLcm0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.lcm(0, 5)).assertEqual(0);
      expect(IntMathUtils.lcm(5, 0)).assertEqual(0);
      expect(IntMathUtils.lcm(0, 0)).assertEqual(0);
      expect(IntMathUtils.lcm(-4, 6)).assertEqual(12);
      expect(IntMathUtils.lcm(-6, -4)).assertEqual(12);
      const negPair: number = IntMathUtils.lcm(-3, -7);
      expect(negPair).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_0700
     * @tc.name      testLcm0003
     * @tc.desc      Verify lcm scales to larger magnitudes and satisfies
     *               the lcm times gcd equals product identity.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLcm0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testLcm0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.lcm(3000000, 4000000)).assertEqual(12000000);
      expect(IntMathUtils.lcm(12, 18)).assertEqual(36);
      expect(IntMathUtils.lcm(25, 10)).assertEqual(50);
      const product: number = IntMathUtils.lcm(12, 18) * IntMathUtils.gcd(12, 18);
      expect(product).assertEqual(12 * 18);
      const product2: number = IntMathUtils.lcm(8, 12) * IntMathUtils.gcd(8, 12);
      expect(product2).assertEqual(96);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_0800
     * @tc.name      testIsPrime0001
     * @tc.desc      Verify isPrime accepts every single digit prime and the
     *               next primes up to nineteen.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIsPrime0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testIsPrime0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.isPrime(2)).assertTrue();
      expect(IntMathUtils.isPrime(3)).assertTrue();
      expect(IntMathUtils.isPrime(5)).assertTrue();
      expect(IntMathUtils.isPrime(7)).assertTrue();
      expect(IntMathUtils.isPrime(11)).assertTrue();
      expect(IntMathUtils.isPrime(13)).assertTrue();
      expect(IntMathUtils.isPrime(17)).assertTrue();
      expect(IntMathUtils.isPrime(19)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_0900
     * @tc.name      testIsPrime0002
     * @tc.desc      Verify isPrime rejects composite numbers including
     *               prime squares and small multiples.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsPrime0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsPrime0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.isPrime(4)).assertFalse();
      expect(IntMathUtils.isPrime(6)).assertFalse();
      expect(IntMathUtils.isPrime(8)).assertFalse();
      expect(IntMathUtils.isPrime(9)).assertFalse();
      expect(IntMathUtils.isPrime(10)).assertFalse();
      expect(IntMathUtils.isPrime(15)).assertFalse();
      expect(IntMathUtils.isPrime(21)).assertFalse();
      expect(IntMathUtils.isPrime(25)).assertFalse();
      expect(IntMathUtils.isPrime(27)).assertFalse();
      expect(IntMathUtils.isPrime(33)).assertFalse();
      expect(IntMathUtils.isPrime(49)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_1000
     * @tc.name      testIsPrime0003
     * @tc.desc      Verify isPrime returns false below two and for
     *               non-integer input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsPrime0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsPrime0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.isPrime(-7)).assertFalse();
      expect(IntMathUtils.isPrime(0)).assertFalse();
      expect(IntMathUtils.isPrime(1)).assertFalse();
      expect(IntMathUtils.isPrime(-1)).assertFalse();
      expect(IntMathUtils.isPrime(2.5)).assertFalse();
      expect(IntMathUtils.isPrime(-3.5)).assertFalse();
      expect(IntMathUtils.isPrime(1.999)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_1100
     * @tc.name      testIsPrime0004
     * @tc.desc      Verify isPrime stays exact for known large primes up to
     *               104729 and rejects the round number 100.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsPrime0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsPrime0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.isPrime(97)).assertTrue();
      expect(IntMathUtils.isPrime(101)).assertTrue();
      expect(IntMathUtils.isPrime(997)).assertTrue();
      const k1000: boolean = IntMathUtils.isPrime(7919);
      expect(k1000).assertTrue();
      const k10000: boolean = IntMathUtils.isPrime(104729);
      expect(k10000).assertTrue();
      expect(IntMathUtils.isPrime(100)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_1200
     * @tc.name      testPrimeFactors0001
     * @tc.desc      Verify primeFactors returns ascending factor lists with
     *               multiplicity for typical composite values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimeFactors0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPrimeFactors0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const factors12: number[] = IntMathUtils.primeFactors(12);
      expect(factors12.length).assertEqual(3);
      expect(factors12[0]).assertEqual(2);
      expect(factors12[1]).assertEqual(2);
      expect(factors12[2]).assertEqual(3);
      const factors17: number[] = IntMathUtils.primeFactors(17);
      expect(factors17.length).assertEqual(1);
      expect(factors17[0]).assertEqual(17);
      const factors60: number[] = IntMathUtils.primeFactors(60);
      expect(factors60.length).assertEqual(4);
      expect(factors60[3]).assertEqual(5);
      const factors97: number[] = IntMathUtils.primeFactors(97);
      expect(factors97.length).assertEqual(1);
      expect(factors97[0]).assertEqual(97);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_1300
     * @tc.name      testPrimeFactors0002
     * @tc.desc      Verify primeFactors expands powers of two into the
     *               exact number of repeated factors.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimeFactors0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPrimeFactors0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const factors2: number[] = IntMathUtils.primeFactors(2);
      expect(factors2.length).assertEqual(1);
      expect(factors2[0]).assertEqual(2);
      const factors8: number[] = IntMathUtils.primeFactors(8);
      expect(factors8.length).assertEqual(3);
      expect(factors8[2]).assertEqual(2);
      const factors128: number[] = IntMathUtils.primeFactors(128);
      expect(factors128.length).assertEqual(7);
      expect(factors128[0]).assertEqual(2);
      expect(factors128[6]).assertEqual(2);
      const factors1024: number[] = IntMathUtils.primeFactors(1024);
      expect(factors1024.length).assertEqual(10);
      expect(factors1024[5]).assertEqual(2);
      expect(factors1024[9]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_1400
     * @tc.name      testPrimeFactors0003
     * @tc.desc      Verify primeFactors returns empty arrays below two and
     *               exact lists for 360 and 999.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPrimeFactors0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testPrimeFactors0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.primeFactors(1).length).assertEqual(0);
      expect(IntMathUtils.primeFactors(0).length).assertEqual(0);
      expect(IntMathUtils.primeFactors(-12).length).assertEqual(0);
      expect(IntMathUtils.primeFactors(2.5).length).assertEqual(0);
      const factors360: number[] = IntMathUtils.primeFactors(360);
      expect(factors360.length).assertEqual(6);
      expect(factors360[0]).assertEqual(2);
      expect(factors360[2]).assertEqual(2);
      expect(factors360[4]).assertEqual(3);
      expect(factors360[5]).assertEqual(5);
      const factors999: number[] = IntMathUtils.primeFactors(999);
      expect(factors999.length).assertEqual(4);
      expect(factors999[0]).assertEqual(3);
      expect(factors999[3]).assertEqual(37);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_1500
     * @tc.name      testFibonacci0001
     * @tc.desc      Verify fibonacci returns the sequence starting from
     *               1, 1 for the first few counts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFibonacci0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testFibonacci0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const seq1: number[] = IntMathUtils.fibonacci(1);
      expect(seq1.length).assertEqual(1);
      expect(seq1[0]).assertEqual(1);
      const seq2: number[] = IntMathUtils.fibonacci(2);
      expect(seq2.length).assertEqual(2);
      expect(seq2[0]).assertEqual(1);
      expect(seq2[1]).assertEqual(1);
      const seq3: number[] = IntMathUtils.fibonacci(3);
      expect(seq3.length).assertEqual(3);
      expect(seq3[2]).assertEqual(2);
      const seq5: number[] = IntMathUtils.fibonacci(5);
      expect(seq5.length).assertEqual(5);
      expect(seq5[4]).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_1600
     * @tc.name      testFibonacci0002
     * @tc.desc      Verify fibonacci produces all ten standard values and
     *               the twentieth term equals 6765.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFibonacci0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFibonacci0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const seq: number[] = IntMathUtils.fibonacci(10);
      expect(seq.length).assertEqual(10);
      expect(seq[0]).assertEqual(1);
      expect(seq[1]).assertEqual(1);
      expect(seq[2]).assertEqual(2);
      expect(seq[3]).assertEqual(3);
      expect(seq[4]).assertEqual(5);
      expect(seq[5]).assertEqual(8);
      expect(seq[6]).assertEqual(13);
      expect(seq[7]).assertEqual(21);
      expect(seq[8]).assertEqual(34);
      expect(seq[9]).assertEqual(55);
      const longSeq: number[] = IntMathUtils.fibonacci(20);
      expect(longSeq.length).assertEqual(20);
      expect(longSeq[18]).assertEqual(4181);
      expect(longSeq[19]).assertEqual(6765);
      expect(longSeq[19]).assertEqual(longSeq[18] + longSeq[17]);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_1700
     * @tc.name      testFibonacci0003
     * @tc.desc      Verify fibonacci returns empty arrays for zero,
     *               negative and non-integer counts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFibonacci0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFibonacci0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.fibonacci(0).length).assertEqual(0);
      expect(IntMathUtils.fibonacci(-3).length).assertEqual(0);
      expect(IntMathUtils.fibonacci(2.5).length).assertEqual(0);
      expect(IntMathUtils.fibonacci(-100).length).assertEqual(0);
      expect(IntMathUtils.fibonacci(0.5).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_1800
     * @tc.name      testFactorial0001
     * @tc.desc      Verify factorial returns 1 for 0 and 1 and exact small
     *               products up to 720.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFactorial0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testFactorial0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.factorial(0)).assertEqual(1);
      expect(IntMathUtils.factorial(1)).assertEqual(1);
      expect(IntMathUtils.factorial(2)).assertEqual(2);
      expect(IntMathUtils.factorial(3)).assertEqual(6);
      expect(IntMathUtils.factorial(4)).assertEqual(24);
      expect(IntMathUtils.factorial(5)).assertEqual(120);
      expect(IntMathUtils.factorial(6)).assertEqual(720);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_1900
     * @tc.name      testFactorial0002
     * @tc.desc      Verify factorial stays exact for mid-range values up to
     *               1307674368000.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFactorial0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFactorial0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.factorial(7)).assertEqual(5040);
      expect(IntMathUtils.factorial(10)).assertEqual(3628800);
      expect(IntMathUtils.factorial(12)).assertEqual(479001600);
      expect(IntMathUtils.factorial(13)).assertEqual(6227020800);
      const big: number = IntMathUtils.factorial(15);
      expect(big).assertEqual(1307674368000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_2000
     * @tc.name      testFactorial0003
     * @tc.desc      Verify factorial renders the exact 18 through 20
     *               values at the top of the supported range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFactorial0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFactorial0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.factorial(16)).assertEqual(20922789888000);
      expect(IntMathUtils.factorial(17)).assertEqual(355687428096000);
      expect(IntMathUtils.factorial(18)).assertEqual(6402373705728000);
      expect(IntMathUtils.factorial(19)).assertEqual(121645100408832000);
      const top: number = IntMathUtils.factorial(20);
      expect(top).assertEqual(2432902008176640000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_2100
     * @tc.name      testFactorial0004
     * @tc.desc      Verify factorial applies the overflow convention beyond
     *               twenty and rejects negative and fractional input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFactorial0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testFactorial0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.factorial(21)).assertEqual(0);
      expect(IntMathUtils.factorial(25)).assertEqual(0);
      expect(IntMathUtils.factorial(-1)).assertEqual(0);
      expect(IntMathUtils.factorial(-100)).assertEqual(0);
      expect(IntMathUtils.factorial(2.5)).assertEqual(0);
      expect(IntMathUtils.factorial(1.5)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_2200
     * @tc.name      testDigitCount0001
     * @tc.desc      Verify digitCount reports one digit for zero and exact
     *               counts for small positive values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDigitCount0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDigitCount0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.digitCount(0)).assertEqual(1);
      expect(IntMathUtils.digitCount(5)).assertEqual(1);
      expect(IntMathUtils.digitCount(9)).assertEqual(1);
      expect(IntMathUtils.digitCount(10)).assertEqual(2);
      expect(IntMathUtils.digitCount(99)).assertEqual(2);
      expect(IntMathUtils.digitCount(100)).assertEqual(3);
      expect(IntMathUtils.digitCount(999)).assertEqual(3);
      expect(IntMathUtils.digitCount(1000)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_2300
     * @tc.name      testDigitCount0002
     * @tc.desc      Verify digitCount takes the absolute value of negative
     *               input and rejects fractional values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDigitCount0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testDigitCount0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.digitCount(-1)).assertEqual(1);
      expect(IntMathUtils.digitCount(-987654)).assertEqual(6);
      expect(IntMathUtils.digitCount(12345)).assertEqual(5);
      expect(IntMathUtils.digitCount(1000000)).assertEqual(7);
      const intMax: number = IntMathUtils.digitCount(2147483647);
      expect(intMax).assertEqual(10);
      expect(IntMathUtils.digitCount(2.5)).assertEqual(0);
      expect(IntMathUtils.digitCount(-0.5)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_2400
     * @tc.name      testReverseNumber0001
     * @tc.desc      Verify reverseNumber flips positive digit strings and
     *               drops trailing zeros.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testReverseNumber0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testReverseNumber0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.reverseNumber(0)).assertEqual(0);
      expect(IntMathUtils.reverseNumber(7)).assertEqual(7);
      expect(IntMathUtils.reverseNumber(12)).assertEqual(21);
      expect(IntMathUtils.reverseNumber(123)).assertEqual(321);
      expect(IntMathUtils.reverseNumber(1200)).assertEqual(21);
      expect(IntMathUtils.reverseNumber(100)).assertEqual(1);
      expect(IntMathUtils.reverseNumber(9999)).assertEqual(9999);
      const big: number = IntMathUtils.reverseNumber(12345);
      expect(big).assertEqual(54321);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_2500
     * @tc.name      testReverseNumber0002
     * @tc.desc      Verify reverseNumber keeps the minus sign for negative
     *               values and rejects fractional input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testReverseNumber0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testReverseNumber0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.reverseNumber(-456)).assertEqual(-654);
      expect(IntMathUtils.reverseNumber(-1)).assertEqual(-1);
      expect(IntMathUtils.reverseNumber(-1200)).assertEqual(-21);
      expect(IntMathUtils.reverseNumber(-9)).assertEqual(-9);
      expect(IntMathUtils.reverseNumber(-100)).assertEqual(-1);
      expect(IntMathUtils.reverseNumber(1.5)).assertEqual(0);
      expect(IntMathUtils.reverseNumber(-2.5)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_2600
     * @tc.name      testModPow0001
     * @tc.desc      Verify modPow reproduces known modular power results
     *               for classic base exponent modulus triples.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testModPow0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testModPow0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.modPow(2, 10, 1000)).assertEqual(24);
      expect(IntMathUtils.modPow(5, 3, 7)).assertEqual(6);
      expect(IntMathUtils.modPow(7, 0, 13)).assertEqual(1);
      expect(IntMathUtils.modPow(3, 4, 5)).assertEqual(1);
      expect(IntMathUtils.modPow(10, 3, 999)).assertEqual(1);
      const ninth: number = IntMathUtils.modPow(9, 9, 1000);
      expect(ninth).assertEqual(489);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_2700
     * @tc.name      testModPow0002
     * @tc.desc      Verify modPow conventions for zero modulus, negative
     *               modulus, negative exponent and negative base.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testModPow0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testModPow0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.modPow(2, 5, 0)).assertEqual(0);
      expect(IntMathUtils.modPow(2, 5, -3)).assertEqual(0);
      expect(IntMathUtils.modPow(2, -1, 5)).assertEqual(0);
      expect(IntMathUtils.modPow(-2, 3, 5)).assertEqual(2);
      expect(IntMathUtils.modPow(0, 0, 5)).assertEqual(1);
      expect(IntMathUtils.modPow(0, 5, 7)).assertEqual(0);
      expect(IntMathUtils.modPow(2, 10, 1)).assertEqual(0);
      expect(IntMathUtils.modPow(5, 1, 7)).assertEqual(5);
      expect(IntMathUtils.modPow(100, 2, 100)).assertEqual(0);
      const identity: number = IntMathUtils.modPow(1, 1000000, 97);
      expect(identity).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_2800
     * @tc.name      testModPow0003
     * @tc.desc      Verify modPow agrees with directly computed powers for
     *               small exponents.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testModPow0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testModPow0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.modPow(2, 8, 100)).assertEqual(Math.pow(2, 8) % 100);
      expect(IntMathUtils.modPow(6, 2, 10)).assertEqual(36 % 10);
      expect(IntMathUtils.modPow(7, 2, 100)).assertEqual(49);
      expect(IntMathUtils.modPow(4, 3, 13)).assertEqual(64 % 13);
      expect(IntMathUtils.modPow(9, 2, 81)).assertEqual(0);
      expect(IntMathUtils.modPow(3, 3, 10)).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_2900
     * @tc.name      testGcd0005
     * @tc.desc      Verify the gcd times lcm product identity holds for
     *               several representative pairs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testGcd0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testGcd0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const p1: number = IntMathUtils.gcd(12, 18) * IntMathUtils.lcm(12, 18);
      expect(p1).assertEqual(216);
      const p2: number = IntMathUtils.gcd(9, 6) * IntMathUtils.lcm(9, 6);
      expect(p2).assertEqual(54);
      const p3: number = IntMathUtils.gcd(7, 13) * IntMathUtils.lcm(7, 13);
      expect(p3).assertEqual(91);
      const p4: number = IntMathUtils.gcd(4, 6) * IntMathUtils.lcm(4, 6);
      expect(p4).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_3000
     * @tc.name      testFibonacci0004
     * @tc.desc      Verify the twelve term sequence satisfies the adjacent
     *               recurrence at several interior positions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFibonacci0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testFibonacci0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const seq: number[] = IntMathUtils.fibonacci(12);
      expect(seq.length).assertEqual(12);
      expect(seq[0]).assertEqual(1);
      expect(seq[1]).assertEqual(1);
      expect(seq[4]).assertEqual(5);
      expect(seq[8]).assertEqual(34);
      expect(seq[10]).assertEqual(89);
      expect(seq[11]).assertEqual(144);
      expect(seq[10]).assertEqual(seq[9] + seq[8]);
      expect(seq[11]).assertEqual(seq[10] + seq[9]);
      expect(seq[6]).assertEqual(seq[5] + seq[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_3100
     * @tc.name      testPrimeFactors0004
     * @tc.desc      Verify the product of returned factors reconstructs the
     *               original value exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPrimeFactors0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testPrimeFactors0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const factors60: number[] = IntMathUtils.primeFactors(60);
      const product60: number = factors60[0] * factors60[1] * factors60[2] * factors60[3];
      expect(product60).assertEqual(60);
      const factors999: number[] = IntMathUtils.primeFactors(999);
      const product999: number = factors999[0] * factors999[1] * factors999[2] * factors999[3];
      expect(product999).assertEqual(999);
      const factors128: number[] = IntMathUtils.primeFactors(128);
      let product128: number = 1;
      for (let i = 0; i < factors128.length; i++) {
        product128 = product128 * factors128[i];
      }
      expect(product128).assertEqual(128);
      const factorsPrime: number[] = IntMathUtils.primeFactors(97);
      expect(factorsPrime[0]).assertEqual(97);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_3200
     * @tc.name      testModPow0004
     * @tc.desc      Verify modPow satisfies Fermat's little theorem for
     *               several prime modulus choices.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testModPow0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testModPow0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.modPow(3, 6, 7)).assertEqual(1);
      expect(IntMathUtils.modPow(2, 4, 5)).assertEqual(1);
      expect(IntMathUtils.modPow(5, 12, 13)).assertEqual(1);
      expect(IntMathUtils.modPow(2, 10, 11)).assertEqual(1);
      expect(IntMathUtils.modPow(10, 12, 13)).assertEqual(1);
      expect(IntMathUtils.modPow(6, 10, 11)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_3300
     * @tc.name      testIsPrime0005
     * @tc.desc      Verify isPrime rejects perfect squares around 100 and
     *               accepts the primes 103, 107 and 109.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsPrime0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsPrime0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.isPrime(81)).assertFalse();
      expect(IntMathUtils.isPrime(121)).assertFalse();
      expect(IntMathUtils.isPrime(169)).assertFalse();
      expect(IntMathUtils.isPrime(120)).assertFalse();
      expect(IntMathUtils.isPrime(102)).assertFalse();
      expect(IntMathUtils.isPrime(103)).assertTrue();
      expect(IntMathUtils.isPrime(107)).assertTrue();
      expect(IntMathUtils.isPrime(109)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_3400
     * @tc.name      testDigitCount0003
     * @tc.desc      Verify digitCount maps powers of ten to the exact digit
     *               count from one to seven digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDigitCount0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testDigitCount0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.digitCount(1)).assertEqual(1);
      expect(IntMathUtils.digitCount(10)).assertEqual(2);
      expect(IntMathUtils.digitCount(100)).assertEqual(3);
      expect(IntMathUtils.digitCount(1000)).assertEqual(4);
      expect(IntMathUtils.digitCount(10000)).assertEqual(5);
      expect(IntMathUtils.digitCount(100000)).assertEqual(6);
      expect(IntMathUtils.digitCount(1000000)).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_3500
     * @tc.name      testLcm0004
     * @tc.desc      Verify lcm of coprime pairs equals the plain product of
     *               the two arguments.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLcm0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testLcm0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.lcm(7, 13)).assertEqual(91);
      expect(IntMathUtils.lcm(3, 5)).assertEqual(15);
      expect(IntMathUtils.lcm(8, 9)).assertEqual(72);
      expect(IntMathUtils.lcm(11, 13)).assertEqual(143);
      expect(IntMathUtils.lcm(1, 1)).assertEqual(1);
      const product: number = 11 * 13;
      expect(IntMathUtils.lcm(11, 13)).assertEqual(product);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_3600
     * @tc.name      testReverseNumber0003
     * @tc.desc      Verify reverseNumber keeps numeric palindromes unchanged
     *               including their negative sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testReverseNumber0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testReverseNumber0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.reverseNumber(11)).assertEqual(11);
      expect(IntMathUtils.reverseNumber(121)).assertEqual(121);
      expect(IntMathUtils.reverseNumber(12321)).assertEqual(12321);
      expect(IntMathUtils.reverseNumber(77)).assertEqual(77);
      expect(IntMathUtils.reverseNumber(-121)).assertEqual(-121);
      expect(IntMathUtils.reverseNumber(1000001)).assertEqual(1000001);
      const mirrored: number = IntMathUtils.reverseNumber(1234);
      expect(mirrored).assertEqual(4321);
      expect(mirrored).assertLarger(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_INTM_3700
     * @tc.name      testFactorial0005
     * @tc.desc      Verify the factorial recurrence n! equals n times the
     *               previous factorial across several values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFactorial0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFactorial0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(IntMathUtils.factorial(5)).assertEqual(5 * IntMathUtils.factorial(4));
      expect(IntMathUtils.factorial(6)).assertEqual(6 * IntMathUtils.factorial(5));
      expect(IntMathUtils.factorial(10)).assertEqual(10 * IntMathUtils.factorial(9));
      const f13: number = IntMathUtils.factorial(13);
      expect(f13).assertEqual(13 * IntMathUtils.factorial(12));
      expect(f13).assertEqual(6227020800);
      expect(f13).assertLarger(IntMathUtils.factorial(12));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
