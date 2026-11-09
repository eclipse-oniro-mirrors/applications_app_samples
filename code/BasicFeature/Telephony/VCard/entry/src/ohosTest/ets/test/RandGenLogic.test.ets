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
import { RandGenUtils } from '../testutils/RandGenUtils';

const DOMAIN: number = 0xF811;

/**
 * Core behaviour suite for RandGenUtils. Every expected literal in this
 * file was hand computed from the recurrence
 * seed = (seed * 1103515245 + 12345) mod 2147483648 so that a regression
 * can never hide behind an uninitialized expectation.
 */
export default function randGenLogicTest() {
  describe('RandGenLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_0100
     * @tc.name      testNext0001
     * @tc.desc      Verify next() with the default seed produces the hand
     *               computed first LCG value 412829322 and replays the
     *               identical pair of values after each reset call.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNext0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNext0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const first: number = RandGenUtils.next();
      expect(first).assertEqual(412829322);
      expect(RandGenUtils.getSeed()).assertEqual(412829322);
      const second: number = RandGenUtils.next();
      expect(second).assertEqual(1649886459);
      expect(RandGenUtils.getSeed()).assertEqual(1649886459);
      RandGenUtils.reset();
      const replayFirst: number = RandGenUtils.next();
      expect(replayFirst).assertEqual(412829322);
      const replaySecond: number = RandGenUtils.next();
      expect(replaySecond).assertEqual(1649886459);
      expect(first).assertEqual(replayFirst);
      expect(second).assertEqual(replaySecond);
      RandGenUtils.reset();
      const third: number = RandGenUtils.next();
      expect(third).assertEqual(412829322);
      expect(third).assertLarger(0);
      expect(third).assertLess(2147483648);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_0200
     * @tc.name      testNext0002
     * @tc.desc      Verify the first five next() values of the default
     *               seed stream match the hand computed LCG sequence and
     *               that a second reset replays them one by one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNext0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNext0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const v1: number = RandGenUtils.next();
      const v2: number = RandGenUtils.next();
      const v3: number = RandGenUtils.next();
      const v4: number = RandGenUtils.next();
      const v5: number = RandGenUtils.next();
      expect(v1).assertEqual(412829322);
      expect(v2).assertEqual(1649886459);
      expect(v3).assertEqual(189729048);
      expect(v4).assertEqual(100425585);
      expect(v5).assertEqual(1945059670);
      const seqOne: number[] = [v1, v2, v3, v4, v5];
      RandGenUtils.reset();
      const w1: number = RandGenUtils.next();
      const w2: number = RandGenUtils.next();
      const w3: number = RandGenUtils.next();
      const w4: number = RandGenUtils.next();
      const w5: number = RandGenUtils.next();
      const seqTwo: number[] = [w1, w2, w3, w4, w5];
      expect(seqOne.join(',')).assertEqual(seqTwo.join(','));
      expect(seqOne.join(',')).assertEqual('412829322,1649886459,189729048,100425585,1945059670');
      expect(seqOne.length).assertEqual(5);
      expect(seqTwo.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_0300
     * @tc.name      testNext0003
     * @tc.desc      Verify twenty consecutive next() values stay inside
     *               [0, 2147483648), the eleventh draw equals the hand
     *               computed 1559356208 and reset restores the stream.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNext0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNext0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      let eleventh: number = 0;
      for (let i: number = 0; i < 20; i++) {
        const value: number = RandGenUtils.next();
        expect(value).assertLarger(-1);
        expect(value).assertLess(2147483648);
        if (i === 10) {
          eleventh = value;
        }
      }
      expect(eleventh).assertEqual(1559356208);
      const finalSeed: number = RandGenUtils.getSeed();
      expect(finalSeed).assertLarger(-1);
      expect(finalSeed).assertLess(2147483648);
      RandGenUtils.reset();
      expect(RandGenUtils.getSeed()).assertEqual(20261109);
      expect(RandGenUtils.next()).assertEqual(412829322);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_0400
     * @tc.name      testSeed0001
     * @tc.desc      Verify seed(123) normalizes the stored state, starts
     *               the hand computed sequence 440917656 then 1476151025
     *               and replays the same five draws when reseeded.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSeed0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSeed0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.seed(123);
      expect(RandGenUtils.getSeed()).assertEqual(123);
      const a1: number = RandGenUtils.next();
      const a2: number = RandGenUtils.next();
      const a3: number = RandGenUtils.next();
      const a4: number = RandGenUtils.next();
      const a5: number = RandGenUtils.next();
      expect(a1).assertEqual(440917656);
      expect(a2).assertEqual(1476151025);
      const seqOne: number[] = [a1, a2, a3, a4, a5];
      RandGenUtils.seed(123);
      const b1: number = RandGenUtils.next();
      const b2: number = RandGenUtils.next();
      const b3: number = RandGenUtils.next();
      const b4: number = RandGenUtils.next();
      const b5: number = RandGenUtils.next();
      const seqTwo: number[] = [b1, b2, b3, b4, b5];
      expect(seqOne.join(',')).assertEqual(seqTwo.join(','));
      RandGenUtils.seed(123);
      expect(RandGenUtils.next()).assertEqual(440917656);
      expect(RandGenUtils.getSeed()).assertEqual(440917656);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_0500
     * @tc.name      testReset0001
     * @tc.desc      Verify reset() restores the default seed state so the
     *               stream after a foreign seed resumes at the known
     *               default value 412829322 again.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testReset0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testReset0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.seed(999);
      expect(RandGenUtils.getSeed()).assertEqual(999);
      const foreign: number = RandGenUtils.next();
      expect(foreign).assertEqual(752630676);
      expect(foreign).assertEqual(RandGenUtils.getSeed());
      RandGenUtils.reset();
      expect(RandGenUtils.getSeed()).assertEqual(20261109);
      const restored: number = RandGenUtils.next();
      expect(restored).assertEqual(412829322);
      RandGenUtils.reset();
      RandGenUtils.reset();
      expect(RandGenUtils.next()).assertEqual(412829322);
      expect(RandGenUtils.next()).assertEqual(1649886459);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_0600
     * @tc.name      testNextInt0001
     * @tc.desc      Verify nextInt(1000) returns the hand computed draws
     *               322, 459, 48, 585, 670 and keeps every further draw
     *               inside the half open range [0, 1000).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextInt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextInt0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      expect(RandGenUtils.nextInt(1000)).assertEqual(322);
      expect(RandGenUtils.nextInt(1000)).assertEqual(459);
      expect(RandGenUtils.nextInt(1000)).assertEqual(48);
      expect(RandGenUtils.nextInt(1000)).assertEqual(585);
      expect(RandGenUtils.nextInt(1000)).assertEqual(670);
      RandGenUtils.reset();
      for (let i: number = 0; i < 8; i++) {
        const draw: number = RandGenUtils.nextInt(1000);
        expect(draw).assertLarger(-1);
        expect(draw).assertLess(1000);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_0700
     * @tc.name      testNextInt0002
     * @tc.desc      Verify the first ten nextInt(10) draws are the digit
     *               stream 2985014309 and agree with nextDigits(10).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextInt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextInt0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const d1: number = RandGenUtils.nextInt(10);
      const d2: number = RandGenUtils.nextInt(10);
      const d3: number = RandGenUtils.nextInt(10);
      const d4: number = RandGenUtils.nextInt(10);
      const d5: number = RandGenUtils.nextInt(10);
      const d6: number = RandGenUtils.nextInt(10);
      const d7: number = RandGenUtils.nextInt(10);
      const d8: number = RandGenUtils.nextInt(10);
      const d9: number = RandGenUtils.nextInt(10);
      const d10: number = RandGenUtils.nextInt(10);
      expect(d1).assertEqual(2);
      expect(d2).assertEqual(9);
      expect(d3).assertEqual(8);
      expect(d4).assertEqual(5);
      expect(d5).assertEqual(0);
      expect(d6).assertEqual(1);
      expect(d7).assertEqual(4);
      expect(d8).assertEqual(3);
      expect(d9).assertEqual(0);
      expect(d10).assertEqual(9);
      const digits: number[] = [d1, d2, d3, d4, d5, d6, d7, d8, d9, d10];
      expect(digits.join('')).assertEqual('2985014309');
      RandGenUtils.reset();
      expect(RandGenUtils.nextDigits(10)).assertEqual(digits.join(''));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_0800
     * @tc.name      testNextInt0003
     * @tc.desc      Verify nextInt(97) yields the hand computed residues
     *               38, 73, 55, 30, 53 and every draw is below 97.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextInt0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextInt0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const r1: number = RandGenUtils.nextInt(97);
      const r2: number = RandGenUtils.nextInt(97);
      const r3: number = RandGenUtils.nextInt(97);
      const r4: number = RandGenUtils.nextInt(97);
      const r5: number = RandGenUtils.nextInt(97);
      expect(r1).assertEqual(38);
      expect(r2).assertEqual(73);
      expect(r3).assertEqual(55);
      expect(r4).assertEqual(30);
      expect(r5).assertEqual(53);
      const residues: number[] = [r1, r2, r3, r4, r5];
      expect(residues.join(',')).assertEqual('38,73,55,30,53');
      RandGenUtils.reset();
      for (let i: number = 0; i < 5; i++) {
        const draw: number = RandGenUtils.nextInt(97);
        expect(draw).assertLarger(-1);
        expect(draw).assertLess(97);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_0900
     * @tc.name      testNextInt0004
     * @tc.desc      Verify nextInt keeps exact raw values for bounds at
     *               or above the state modulus and falls back to parity
     *               draws for the tight bound two.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextInt0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextInt0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const big1: number = RandGenUtils.nextInt(2147483648);
      expect(big1).assertEqual(412829322);
      const big2: number = RandGenUtils.nextInt(2147483647);
      expect(big2).assertEqual(1649886459);
      const parity: number = RandGenUtils.nextInt(2);
      expect(parity).assertEqual(0);
      RandGenUtils.reset();
      const bounded: number = RandGenUtils.nextInt(2147483648);
      expect(bounded).assertLarger(-1);
      expect(bounded).assertLess(2147483648);
      expect(bounded).assertEqual(RandGenUtils.getSeed());
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_1000
     * @tc.name      testNextRange0001
     * @tc.desc      Verify nextRange(1000, 9999) returns the hand
     *               computed offsets 1197, 1800 and 4131 with each draw
     *               inside the requested interval.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextRange0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextRange0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const g1: number = RandGenUtils.nextRange(1000, 9999);
      const g2: number = RandGenUtils.nextRange(1000, 9999);
      const g3: number = RandGenUtils.nextRange(1000, 9999);
      expect(g1).assertEqual(1197);
      expect(g2).assertEqual(1800);
      expect(g3).assertEqual(4131);
      expect(g1).assertLarger(999);
      expect(g1).assertLess(9999);
      expect(g2).assertLarger(999);
      expect(g2).assertLess(9999);
      expect(g3).assertLarger(999);
      expect(g3).assertLess(9999);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_1100
     * @tc.name      testNextRange0002
     * @tc.desc      Verify nextRange honours the min offset with the
     *               draws 522 and 559 on [500, 600) and 8 and 5 on the
     *               narrow interval [0, 10).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextRange0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextRange0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const shift1: number = RandGenUtils.nextRange(500, 600);
      const shift2: number = RandGenUtils.nextRange(500, 600);
      expect(shift1).assertEqual(522);
      expect(shift2).assertEqual(559);
      const narrow1: number = RandGenUtils.nextRange(0, 10);
      const narrow2: number = RandGenUtils.nextRange(0, 10);
      expect(narrow1).assertEqual(8);
      expect(narrow2).assertEqual(5);
      expect(shift1).assertLarger(499);
      expect(shift1).assertLess(600);
      expect(shift2).assertLarger(499);
      expect(shift2).assertLess(600);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_1200
     * @tc.name      testNextRange0003
     * @tc.desc      Verify nextRange returns raw stream values untouched
     *               for modulus sized intervals and the lower boundary
     *               itself for the single value interval [7, 8).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextRange0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextRange0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const full1: number = RandGenUtils.nextRange(0, 2147483648);
      expect(full1).assertEqual(412829322);
      const full2: number = RandGenUtils.nextRange(0, 2147483647);
      expect(full2).assertEqual(1649886459);
      const single: number = RandGenUtils.nextRange(7, 8);
      expect(single).assertEqual(7);
      expect(full1).assertLarger(-1);
      expect(full1).assertLess(2147483648);
      expect(full2).assertLarger(-1);
      expect(full2).assertLess(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_1300
     * @tc.name      testNextDigits0001
     * @tc.desc      Verify nextDigits builds digit strings of the exact
     *               requested length from successive draws, producing
     *               '298', then '5014', then '3' on the default stream.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextDigits0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextDigits0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const three: string = RandGenUtils.nextDigits(3);
      expect(three).assertEqual('298');
      const four: string = RandGenUtils.nextDigits(4);
      expect(four).assertEqual('5014');
      const one: string = RandGenUtils.nextDigits(1);
      expect(one).assertEqual('3');
      expect(three.length).assertEqual(3);
      expect(four.length).assertEqual(4);
      expect(one.length).assertEqual(1);
      RandGenUtils.reset();
      expect(RandGenUtils.nextDigits(1)).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_1400
     * @tc.name      testNextDigits0002
     * @tc.desc      Verify the concatenation of two nextDigits(5) calls
     *               equals the ten character string produced by a single
     *               nextDigits(10) call on the same reset stream.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextDigits0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextDigits0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const firstFive: string = RandGenUtils.nextDigits(5);
      const secondFive: string = RandGenUtils.nextDigits(5);
      expect(firstFive).assertEqual('29850');
      expect(secondFive).assertEqual('14309');
      const joined: string = firstFive + secondFive;
      expect(joined).assertEqual('2985014309');
      RandGenUtils.reset();
      const ten: string = RandGenUtils.nextDigits(10);
      expect(ten).assertEqual('2985014309');
      expect(joined).assertEqual(ten);
      expect(ten.length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_1500
     * @tc.name      testNextDigits0003
     * @tc.desc      Verify a twelve character draw equals the hand
     *               computed stream 298501430989, starts with '2', ends
     *               with '9' and contains digits only.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextDigits0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextDigits0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const twelve: string = RandGenUtils.nextDigits(12);
      expect(twelve).assertEqual('298501430989');
      expect(twelve.length).assertEqual(12);
      expect(twelve.charAt(0)).assertEqual('2');
      expect(twelve.charAt(1)).assertEqual('9');
      expect(twelve.charAt(11)).assertEqual('9');
      for (let i: number = 0; i < twelve.length; i++) {
        const ch: string = twelve.charAt(i);
        expect(ch.charCodeAt(0)).assertLarger('/'.charCodeAt(0));
        expect(ch.charCodeAt(0)).assertLess(':'.charCodeAt(0));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_1600
     * @tc.name      testPick0001
     * @tc.desc      Verify pick over a four entry table draws the hand
     *               computed entries gamma, delta and alpha and replays
     *               them identically after a reset.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPick0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPick0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const table: string[] = ['alpha', 'beta', 'gamma', 'delta'];
      RandGenUtils.reset();
      const drawn: string[] = RandGenUtils.pick(table, 3);
      expect(drawn.length).assertEqual(3);
      expect(drawn[0]).assertEqual('gamma');
      expect(drawn[1]).assertEqual('delta');
      expect(drawn[2]).assertEqual('alpha');
      RandGenUtils.reset();
      const replay: string[] = RandGenUtils.pick(table, 3);
      expect(replay.length).assertEqual(3);
      expect(replay[0]).assertEqual(drawn[0]);
      expect(replay[1]).assertEqual(drawn[1]);
      expect(replay[2]).assertEqual(drawn[2]);
      expect(table.length).assertEqual(4);
      expect(table.join(',')).assertEqual('alpha,beta,gamma,delta');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_1700
     * @tc.name      testPick0002
     * @tc.desc      Verify pick draws with replacement so a two entry
     *               table yields the five draw pattern A, B, A, B, A and
     *               every entry still belongs to the source table.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPick0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPick0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const table: string[] = ['A', 'B'];
      RandGenUtils.reset();
      const drawn: string[] = RandGenUtils.pick(table, 5);
      expect(drawn.length).assertEqual(5);
      expect(drawn[0]).assertEqual('A');
      expect(drawn[1]).assertEqual('B');
      expect(drawn[2]).assertEqual('A');
      expect(drawn[3]).assertEqual('B');
      expect(drawn[4]).assertEqual('A');
      for (let i: number = 0; i < drawn.length; i++) {
        const fromTable: boolean = drawn[i] === 'A' || drawn[i] === 'B';
        expect(fromTable).assertTrue();
      }
      expect(table.join('|')).assertEqual('A|B');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_1800
     * @tc.name      testPick0003
     * @tc.desc      Verify two pick runs on identical seeds produce the
     *               identical four entry sequence z, w, x, y from the
     *               shared table.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPick0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPick0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const table: string[] = ['x', 'y', 'z', 'w'];
      RandGenUtils.reset();
      const first: string[] = RandGenUtils.pick(table, 4);
      expect(first.length).assertEqual(4);
      expect(first[0]).assertEqual('z');
      expect(first[1]).assertEqual('w');
      expect(first[2]).assertEqual('x');
      expect(first[3]).assertEqual('y');
      RandGenUtils.reset();
      const second: string[] = RandGenUtils.pick(table, 4);
      expect(second.join('-')).assertEqual(first.join('-'));
      expect(second.join('-')).assertEqual('z-w-x-y');
      expect(table.join('')).assertEqual('xyzw');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_1900
     * @tc.name      testShuffle0001
     * @tc.desc      Verify shuffling the five letter deck produces the
     *               hand computed Fisher-Yates permutation e, b, a, d, c
     *               while the source array stays unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testShuffle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testShuffle0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const source: string[] = ['a', 'b', 'c', 'd', 'e'];
      RandGenUtils.reset();
      const shuffled: string[] = RandGenUtils.shuffle(source);
      expect(shuffled.length).assertEqual(5);
      expect(shuffled[0]).assertEqual('e');
      expect(shuffled[1]).assertEqual('b');
      expect(shuffled[2]).assertEqual('a');
      expect(shuffled[3]).assertEqual('d');
      expect(shuffled[4]).assertEqual('c');
      expect(shuffled.join('')).assertEqual('ebadc');
      expect(source.join('')).assertEqual('abcde');
      expect(source.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_2000
     * @tc.name      testShuffle0002
     * @tc.desc      Verify shuffling a four letter deck twice on the
     *               same seed produces the same permutation x, z, w, y
     *               and leaves the original array untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testShuffle0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testShuffle0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const source: string[] = ['w', 'x', 'y', 'z'];
      RandGenUtils.reset();
      const first: string[] = RandGenUtils.shuffle(source);
      expect(first.length).assertEqual(4);
      expect(first[0]).assertEqual('x');
      expect(first[1]).assertEqual('z');
      expect(first[2]).assertEqual('w');
      expect(first[3]).assertEqual('y');
      expect(first.join('')).assertEqual('xzwy');
      expect(source.join('')).assertEqual('wxyz');
      RandGenUtils.reset();
      const second: string[] = RandGenUtils.shuffle(source);
      expect(second.join('')).assertEqual(first.join(''));
      expect(source.join('')).assertEqual('wxyz');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_2100
     * @tc.name      testNext0004
     * @tc.desc      Verify seed(7) starts the hand computed sequence
     *               1282168116 then 642666333, replays on reseeding and
     *               differs from the default stream head.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNext0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNext0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.seed(7);
      expect(RandGenUtils.getSeed()).assertEqual(7);
      const s1: number = RandGenUtils.next();
      expect(s1).assertEqual(1282168116);
      const s2: number = RandGenUtils.next();
      expect(s2).assertEqual(642666333);
      RandGenUtils.seed(7);
      const replay: number = RandGenUtils.next();
      expect(replay).assertEqual(1282168116);
      RandGenUtils.reset();
      const defaultHead: number = RandGenUtils.next();
      expect(defaultHead).assertEqual(412829322);
      const distinct: boolean = replay !== defaultHead;
      expect(distinct).assertTrue();
      expect(defaultHead).assertLarger(-1);
      expect(defaultHead).assertLess(2147483648);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_2200
     * @tc.name      testNextInt0005
     * @tc.desc      Verify nextInt(65536) exposes the low sixteen bits of
     *               the raw stream as 18058 then 17659 and every further
     *               draw stays inside the requested bound.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextInt0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextInt0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const low1: number = RandGenUtils.nextInt(65536);
      expect(low1).assertEqual(18058);
      const low2: number = RandGenUtils.nextInt(65536);
      expect(low2).assertEqual(17659);
      expect(low1).assertLarger(-1);
      expect(low1).assertLess(65536);
      expect(low2).assertLarger(-1);
      expect(low2).assertLess(65536);
      RandGenUtils.reset();
      for (let i: number = 0; i < 6; i++) {
        const draw: number = RandGenUtils.nextInt(65536);
        expect(draw).assertLarger(-1);
        expect(draw).assertLess(65536);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_2300
     * @tc.name      testNextRange0004
     * @tc.desc      Verify nextRange(0, 2) alternates 0 and 1 following
     *               raw stream parity and nextRange(0, 4) yields the
     *               hand computed residue three on the sixth draw.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextRange0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextRange0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const p1: number = RandGenUtils.nextRange(0, 2);
      const p2: number = RandGenUtils.nextRange(0, 2);
      const p3: number = RandGenUtils.nextRange(0, 2);
      const p4: number = RandGenUtils.nextRange(0, 2);
      const p5: number = RandGenUtils.nextRange(0, 2);
      expect(p1).assertEqual(0);
      expect(p2).assertEqual(1);
      expect(p3).assertEqual(0);
      expect(p4).assertEqual(1);
      expect(p5).assertEqual(0);
      const quad: number = RandGenUtils.nextRange(0, 4);
      expect(quad).assertEqual(3);
      expect(quad).assertLarger(-1);
      expect(quad).assertLess(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_2400
     * @tc.name      testNextDigits0004
     * @tc.desc      Verify short nextDigits calls of length one and two
     *               concatenate to exactly the six character string that
     *               a single nextDigits(6) call produces after reset.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextDigits0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextDigits0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const partA: string = RandGenUtils.nextDigits(1);
      const partB: string = RandGenUtils.nextDigits(2);
      const partC: string = RandGenUtils.nextDigits(1);
      const partD: string = RandGenUtils.nextDigits(2);
      expect(partA).assertEqual('2');
      expect(partB).assertEqual('98');
      expect(partC).assertEqual('5');
      expect(partD).assertEqual('01');
      expect(partA.length).assertEqual(1);
      expect(partB.length).assertEqual(2);
      expect(partC.length).assertEqual(1);
      expect(partD.length).assertEqual(2);
      const joined: string = partA + partB + partC + partD;
      expect(joined).assertEqual('298501');
      RandGenUtils.reset();
      const whole: string = RandGenUtils.nextDigits(6);
      expect(whole).assertEqual('298501');
      expect(joined).assertEqual(whole);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_2500
     * @tc.name      testShuffle0003
     * @tc.desc      Verify shuffling a three letter deck reverses it to
     *               C, B, A under the default seed and the source array
     *               plus a reset replay both stay consistent.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testShuffle0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testShuffle0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const source: string[] = ['A', 'B', 'C'];
      RandGenUtils.reset();
      const shuffled: string[] = RandGenUtils.shuffle(source);
      expect(shuffled.length).assertEqual(3);
      expect(shuffled[0]).assertEqual('C');
      expect(shuffled[1]).assertEqual('B');
      expect(shuffled[2]).assertEqual('A');
      expect(shuffled.join('')).assertEqual('CBA');
      expect(source.join('')).assertEqual('ABC');
      RandGenUtils.reset();
      const replay: string[] = RandGenUtils.shuffle(source);
      expect(replay.join('')).assertEqual('CBA');
      expect(replay.join('')).assertEqual(shuffled.join(''));
      expect(source.join('')).assertEqual('ABC');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_2600
     * @tc.name      testSeed0005
     * @tc.desc      Verify reset restores both the state value and the
     *               default stream head after an explicit seed(7) run.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSeed0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSeed0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.seed(7);
      expect(RandGenUtils.getSeed()).assertEqual(7);
      const fromSeven: number = RandGenUtils.next();
      expect(fromSeven).assertEqual(1282168116);
      RandGenUtils.reset();
      expect(RandGenUtils.getSeed()).assertEqual(20261109);
      const defaultHead: number = RandGenUtils.next();
      expect(defaultHead).assertEqual(412829322);
      RandGenUtils.seed(20261109);
      expect(RandGenUtils.getSeed()).assertEqual(20261109);
      const replayHead: number = RandGenUtils.next();
      expect(replayHead).assertEqual(412829322);
      expect(replayHead).assertEqual(defaultHead);
      const distinct: boolean = replayHead !== fromSeven;
      expect(distinct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_2700
     * @tc.name      testNext0005
     * @tc.desc      Verify the first ten default stream values all lie
     *               inside [0, 2147483648) and the tenth equals the hand
     *               computed 19093619.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNext0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNext0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      let last: number = 0;
      for (let i: number = 0; i < 10; i++) {
        last = RandGenUtils.next();
        expect(last).assertLarger(-1);
        expect(last).assertLess(2147483648);
      }
      expect(last).assertEqual(19093619);
      RandGenUtils.reset();
      let again: number = 0;
      for (let i: number = 0; i < 10; i++) {
        again = RandGenUtils.next();
      }
      expect(again).assertEqual(19093619);
      expect(again).assertEqual(last);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RAND_2800
     * @tc.name      testPick0004
     * @tc.desc      Verify a six draw pick from a six entry table yields
     *               the hand computed residue pattern p1, p4, p1, p4,
     *               p5, p2 and preserves the source table.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPick0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPick0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const table: string[] = ['p1', 'p2', 'p3', 'p4', 'p5', 'p6'];
      RandGenUtils.reset();
      const drawn: string[] = RandGenUtils.pick(table, 6);
      expect(drawn.length).assertEqual(6);
      expect(drawn[0]).assertEqual('p1');
      expect(drawn[1]).assertEqual('p4');
      expect(drawn[2]).assertEqual('p1');
      expect(drawn[3]).assertEqual('p4');
      expect(drawn[4]).assertEqual('p5');
      expect(drawn[5]).assertEqual('p2');
      expect(drawn.join(',')).assertEqual('p1,p4,p1,p4,p5,p2');
      expect(table.length).assertEqual(6);
      expect(table.join('')).assertEqual('p1p2p3p4p5p6');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
