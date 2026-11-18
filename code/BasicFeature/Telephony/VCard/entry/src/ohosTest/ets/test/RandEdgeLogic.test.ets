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
 * Edge behaviour suite for RandGenUtils. It concentrates on extreme
 * seeds, degenerate bounds and tiny inputs, asserting for every
 * documented non consuming operation that the raw stream position is
 * left untouched by comparing against the hand computed default head
 * value 412829322.
 */
export default function randEdgeLogicTest() {
  describe('RandEdgeLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_0100
     * @tc.name      testSeed0001
     * @tc.desc      Verify seed(0) is a legal seed: the state stays zero,
     *               the first draw is the pure increment 12345 and the
     *               next step is the hand computed 1406932606.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSeed0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSeed0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.seed(0);
      expect(RandGenUtils.getSeed()).assertEqual(0);
      const first: number = RandGenUtils.next();
      expect(first).assertEqual(12345);
      const second: number = RandGenUtils.next();
      expect(second).assertEqual(1406932606);
      RandGenUtils.seed(0);
      const replay: number = RandGenUtils.next();
      expect(replay).assertEqual(12345);
      expect(replay).assertLarger(-1);
      expect(replay).assertLess(2147483648);
      RandGenUtils.reset();
      const back: number = RandGenUtils.next();
      expect(back).assertEqual(412829322);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_0200
     * @tc.name      testSeed0002
     * @tc.desc      Verify negative seeds are used through their absolute
     *               value so seed(-20261109), seed(-7) and seed(-1)
     *               mirror the positive streams exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSeed0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSeed0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.seed(-20261109);
      expect(RandGenUtils.getSeed()).assertEqual(20261109);
      expect(RandGenUtils.next()).assertEqual(412829322);
      RandGenUtils.seed(-7);
      expect(RandGenUtils.getSeed()).assertEqual(7);
      expect(RandGenUtils.next()).assertEqual(1282168116);
      RandGenUtils.seed(-1);
      expect(RandGenUtils.getSeed()).assertEqual(1);
      expect(RandGenUtils.next()).assertEqual(1103527590);
      RandGenUtils.seed(-7);
      expect(RandGenUtils.next()).assertEqual(1282168116);
      RandGenUtils.reset();
      expect(RandGenUtils.getSeed()).assertEqual(20261109);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_0300
     * @tc.name      testSeed0003
     * @tc.desc      Verify extreme seeds normalize deterministically:
     *               2147483647 keeps its value, MAX_SAFE_INTEGER folds to
     *               the same stream, 2147483648 folds to zero and
     *               2147483649 folds to one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSeed0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSeed0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.seed(2147483647);
      expect(RandGenUtils.getSeed()).assertEqual(2147483647);
      expect(RandGenUtils.next()).assertEqual(1043980748);
      RandGenUtils.seed(9007199254740991);
      expect(RandGenUtils.getSeed()).assertEqual(2147483647);
      expect(RandGenUtils.next()).assertEqual(1043980748);
      RandGenUtils.seed(2147483648);
      expect(RandGenUtils.getSeed()).assertEqual(0);
      expect(RandGenUtils.next()).assertEqual(12345);
      RandGenUtils.seed(2147483649);
      expect(RandGenUtils.getSeed()).assertEqual(1);
      expect(RandGenUtils.next()).assertEqual(1103527590);
      RandGenUtils.reset();
      expect(RandGenUtils.getSeed()).assertEqual(20261109);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_0400
     * @tc.name      testNextInt0001
     * @tc.desc      Verify nextInt(1) always returns zero while still
     *               consuming one raw draw per call, so the following
     *               next() lands on the sixth default stream value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextInt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextInt0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const d1: number = RandGenUtils.nextInt(1);
      expect(d1).assertEqual(0);
      const d2: number = RandGenUtils.nextInt(1);
      expect(d2).assertEqual(0);
      const d3: number = RandGenUtils.nextInt(1);
      expect(d3).assertEqual(0);
      const d4: number = RandGenUtils.nextInt(1);
      expect(d4).assertEqual(0);
      const d5: number = RandGenUtils.nextInt(1);
      expect(d5).assertEqual(0);
      const raw: number = RandGenUtils.next();
      expect(raw).assertEqual(558577111);
      expect(raw).assertLarger(0);
      expect(raw).assertLess(2147483648);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_0500
     * @tc.name      testNextInt0002
     * @tc.desc      Verify nextInt with bound zero or a negative bound
     *               returns zero and consumes nothing, proven by the
     *               untouched default head value afterwards.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextInt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextInt0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const zeroBound: number = RandGenUtils.nextInt(0);
      expect(zeroBound).assertEqual(0);
      const negativeBound: number = RandGenUtils.nextInt(-5);
      expect(negativeBound).assertEqual(0);
      const deepNegative: number = RandGenUtils.nextInt(-2147483647);
      expect(deepNegative).assertEqual(0);
      const raw: number = RandGenUtils.next();
      expect(raw).assertEqual(412829322);
      expect(RandGenUtils.getSeed()).assertEqual(412829322);
      RandGenUtils.reset();
      expect(RandGenUtils.getSeed()).assertEqual(20261109);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_0600
     * @tc.name      testNextInt0003
     * @tc.desc      Verify nextInt(2) follows the raw stream parity and
     *               produces the alternating pattern 0, 1, 0, 1, 0.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextInt0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextInt0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const p1: number = RandGenUtils.nextInt(2);
      expect(p1).assertEqual(0);
      const p2: number = RandGenUtils.nextInt(2);
      expect(p2).assertEqual(1);
      const p3: number = RandGenUtils.nextInt(2);
      expect(p3).assertEqual(0);
      const p4: number = RandGenUtils.nextInt(2);
      expect(p4).assertEqual(1);
      const p5: number = RandGenUtils.nextInt(2);
      expect(p5).assertEqual(0);
      const p6: number = RandGenUtils.nextInt(2);
      expect(p6).assertEqual(1);
      for (let i: number = 0; i < 6; i++) {
        const parity: number = RandGenUtils.nextInt(2);
        const inRange: boolean = parity === 0 || parity === 1;
        expect(inRange).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_0700
     * @tc.name      testNextInt0004
     * @tc.desc      Verify mixed invalid bounds leave the stream intact
     *               and nextInt(648) plus nextInt(1000) then produce the
     *               hand computed residues 186 and 459.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextInt0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextInt0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      expect(RandGenUtils.nextInt(0)).assertEqual(0);
      expect(RandGenUtils.nextInt(-7)).assertEqual(0);
      expect(RandGenUtils.next()).assertEqual(412829322);
      RandGenUtils.reset();
      const spanDraw: number = RandGenUtils.nextInt(648);
      expect(spanDraw).assertEqual(186);
      expect(spanDraw).assertLarger(-1);
      expect(spanDraw).assertLess(648);
      const millenniumDraw: number = RandGenUtils.nextInt(1000);
      expect(millenniumDraw).assertEqual(459);
      expect(millenniumDraw).assertLarger(-1);
      expect(millenniumDraw).assertLess(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_0800
     * @tc.name      testNextRange0001
     * @tc.desc      Verify reversed intervals return the lower bound and
     *               consume nothing, so the raw head value stays
     *               available for the following draw.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextRange0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextRange0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const reversed: number = RandGenUtils.nextRange(9, 3);
      expect(reversed).assertEqual(9);
      const wideReversed: number = RandGenUtils.nextRange(50, 10);
      expect(wideReversed).assertEqual(50);
      const equalWidth: number = RandGenUtils.nextRange(42, 42);
      expect(equalWidth).assertEqual(42);
      const raw: number = RandGenUtils.next();
      expect(raw).assertEqual(412829322);
      expect(reversed).assertLess(wideReversed - 1);
      expect(equalWidth).assertEqual(reversed === 9 ? 42 : reversed);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_0900
     * @tc.name      testNextRange0002
     * @tc.desc      Verify equal width intervals return the lower bound
     *               without consuming random values, including negative
     *               bounds, while width-one intervals consume one draw.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextRange0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextRange0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const point: number = RandGenUtils.nextRange(5, 5);
      expect(point).assertEqual(5);
      const negativePoint: number = RandGenUtils.nextRange(-3, -3);
      expect(negativePoint).assertEqual(-3);
      const unitWidth: number = RandGenUtils.nextRange(0, 1);
      expect(unitWidth).assertEqual(0);
      const raw: number = RandGenUtils.next();
      expect(raw).assertEqual(1649886459);
      expect(negativePoint).assertLess(point);
      expect(unitWidth).assertEqual(negativePoint + 3);
      RandGenUtils.reset();
      expect(RandGenUtils.next()).assertEqual(412829322);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_1000
     * @tc.name      testNextRange0003
     * @tc.desc      Verify nextRange(0, 2) reproduces the raw stream
     *               parity with the alternating sequence 0, 1, 0, 1, 0
     *               across five consecutive draws.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextRange0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextRange0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      expect(RandGenUtils.nextRange(0, 2)).assertEqual(0);
      expect(RandGenUtils.nextRange(0, 2)).assertEqual(1);
      expect(RandGenUtils.nextRange(0, 2)).assertEqual(0);
      expect(RandGenUtils.nextRange(0, 2)).assertEqual(1);
      expect(RandGenUtils.nextRange(0, 2)).assertEqual(0);
      RandGenUtils.reset();
      let zeroCount: number = 0;
      let oneCount: number = 0;
      for (let i: number = 0; i < 10; i++) {
        const draw: number = RandGenUtils.nextRange(0, 2);
        if (draw === 0) {
          zeroCount += 1;
        } else {
          oneCount += 1;
        }
      }
      expect(zeroCount).assertEqual(5);
      expect(oneCount).assertEqual(5);
      expect(zeroCount + oneCount).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_1100
     * @tc.name      testNextRange0004
     * @tc.desc      Verify a huge interval ending at the state modulus
     *               keeps the draw at 2147483186 and strictly inside the
     *               requested half open bounds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextRange0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextRange0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const huge: number = RandGenUtils.nextRange(2147483000, 2147483648);
      expect(huge).assertEqual(2147483186);
      expect(huge).assertLarger(2147482999);
      expect(huge).assertLess(2147483648);
      expect(huge).assertLarger(2147483000 - 1);
      const tail: number = huge - 2147483000;
      expect(tail).assertEqual(186);
      expect(tail).assertLarger(-1);
      expect(tail).assertLess(648);
      RandGenUtils.reset();
      expect(RandGenUtils.nextRange(2147483000, 2147483648)).assertEqual(2147483186);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_1200
     * @tc.name      testNextDigits0001
     * @tc.desc      Verify non positive digit counts return the empty
     *               string without consuming any draw, keeping the raw
     *               head value 412829322 reachable afterwards.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextDigits0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextDigits0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const zeroDigits: string = RandGenUtils.nextDigits(0);
      expect(zeroDigits).assertEqual('');
      expect(zeroDigits.length).assertEqual(0);
      const negativeDigits: string = RandGenUtils.nextDigits(-3);
      expect(negativeDigits).assertEqual('');
      expect(negativeDigits.length).assertEqual(0);
      const deepNegative: string = RandGenUtils.nextDigits(-100);
      expect(deepNegative).assertEqual('');
      const raw: number = RandGenUtils.next();
      expect(raw).assertEqual(412829322);
      RandGenUtils.reset();
      expect(RandGenUtils.nextDigits(1)).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_1300
     * @tc.name      testNextDigits0002
     * @tc.desc      Verify a single digit draw equals the string '2' on
     *               the default seed, has length one and stays inside
     *               the ASCII digit range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextDigits0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextDigits0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const single: string = RandGenUtils.nextDigits(1);
      expect(single).assertEqual('2');
      expect(single.length).assertEqual(1);
      const head: string = single.charAt(0);
      const isDigit: boolean = head >= '0' && head <= '9';
      expect(isDigit).assertTrue();
      const numeric: number = RandGenUtils.nextInt(10);
      expect(numeric).assertEqual(9);
      expect(RandGenUtils.nextInt(0)).assertEqual(0);
      RandGenUtils.reset();
      expect(RandGenUtils.nextDigits(2)).assertEqual('29');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_1400
     * @tc.name      testNextDigits0003
     * @tc.desc      Verify six consecutive digit draws spell 298501, keep
     *               the exact requested length and expose the hand
     *               computed head and tail characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextDigits0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextDigits0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const digits: string = RandGenUtils.nextDigits(6);
      expect(digits).assertEqual('298501');
      expect(digits.length).assertEqual(6);
      expect(digits.charAt(0)).assertEqual('2');
      expect(digits.charAt(1)).assertEqual('9');
      expect(digits.charAt(5)).assertEqual('1');
      let allDigits: boolean = true;
      for (let i: number = 0; i < digits.length; i++) {
        const ch: string = digits.charAt(i);
        if (ch < '0' || ch > '9') {
          allDigits = false;
        }
      }
      expect(allDigits).assertTrue();
      expect(digits).not().assertContain('-');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_1500
     * @tc.name      testPick0001
     * @tc.desc      Verify picking from an empty table returns an empty
     *               array and consumes nothing, so the raw head value is
     *               still produced by the next call.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPick0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPick0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const empty: string[] = [];
      RandGenUtils.reset();
      const drawn: string[] = RandGenUtils.pick(empty, 5);
      expect(drawn.length).assertEqual(0);
      expect(drawn).not().assertNull();
      const raw: number = RandGenUtils.next();
      expect(raw).assertEqual(412829322);
      const second: string[] = RandGenUtils.pick(empty, 1);
      expect(second.length).assertEqual(0);
      expect(RandGenUtils.next()).assertEqual(1649886459);
      RandGenUtils.reset();
      expect(RandGenUtils.next()).assertEqual(412829322);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_1600
     * @tc.name      testPick0002
     * @tc.desc      Verify a single entry table always returns that
     *               entry because the residue of every raw value modulo
     *               one is zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPick0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPick0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const singleton: string[] = ['x'];
      RandGenUtils.reset();
      const drawn: string[] = RandGenUtils.pick(singleton, 3);
      expect(drawn.length).assertEqual(3);
      expect(drawn[0]).assertEqual('x');
      expect(drawn[1]).assertEqual('x');
      expect(drawn[2]).assertEqual('x');
      expect(drawn.join('')).assertEqual('xxx');
      const after: number = RandGenUtils.next();
      expect(after).assertEqual(100425585);
      expect(singleton.join('')).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_1700
     * @tc.name      testPick0003
     * @tc.desc      Verify a zero or negative pick count returns an empty
     *               array without consuming draws, proven against the
     *               untouched default head value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPick0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPick0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const table: string[] = ['a', 'b'];
      RandGenUtils.reset();
      const zeroCount: string[] = RandGenUtils.pick(table, 0);
      expect(zeroCount.length).assertEqual(0);
      const negativeCount: string[] = RandGenUtils.pick(table, -2);
      expect(negativeCount.length).assertEqual(0);
      const raw: number = RandGenUtils.next();
      expect(raw).assertEqual(412829322);
      expect(table.join('-')).assertEqual('a-b');
      const firstReal: string[] = RandGenUtils.pick(table, 1);
      expect(firstReal.length).assertEqual(1);
      expect(firstReal[0]).assertEqual('b');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_1800
     * @tc.name      testShuffle0001
     * @tc.desc      Verify shuffling empty and single element decks
     *               returns equal copies without consuming any draw.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testShuffle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testShuffle0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const empty: string[] = [];
      const single: string[] = ['only'];
      RandGenUtils.reset();
      const shuffledEmpty: string[] = RandGenUtils.shuffle(empty);
      expect(shuffledEmpty.length).assertEqual(0);
      expect(shuffledEmpty).not().assertNull();
      const shuffledSingle: string[] = RandGenUtils.shuffle(single);
      expect(shuffledSingle.length).assertEqual(1);
      expect(shuffledSingle[0]).assertEqual('only');
      const raw: number = RandGenUtils.next();
      expect(raw).assertEqual(412829322);
      expect(single.join('')).assertEqual('only');
      expect(empty.join('')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_1900
     * @tc.name      testShuffle0002
     * @tc.desc      Verify shuffling a two letter deck swaps it to b, a
     *               under the default seed, keeps the source intact and
     *               replays identically after reset.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testShuffle0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testShuffle0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const source: string[] = ['a', 'b'];
      RandGenUtils.reset();
      const shuffled: string[] = RandGenUtils.shuffle(source);
      expect(shuffled.length).assertEqual(2);
      expect(shuffled[0]).assertEqual('b');
      expect(shuffled[1]).assertEqual('a');
      expect(shuffled.join('')).assertEqual('ba');
      expect(source.join('')).assertEqual('ab');
      RandGenUtils.reset();
      const replay: string[] = RandGenUtils.shuffle(source);
      expect(replay.join('')).assertEqual('ba');
      expect(replay.join('')).assertEqual(shuffled.join(''));
      const consumed: number = RandGenUtils.next();
      expect(consumed).assertEqual(1649886459);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_2000
     * @tc.name      testShuffle0003
     * @tc.desc      Verify shuffling a three letter deck yields the hand
     *               computed permutation r, q, p with the untouched
     *               source and an identical reset replay.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testShuffle0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testShuffle0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const source: string[] = ['p', 'q', 'r'];
      RandGenUtils.reset();
      const shuffled: string[] = RandGenUtils.shuffle(source);
      expect(shuffled.length).assertEqual(3);
      expect(shuffled[0]).assertEqual('r');
      expect(shuffled[1]).assertEqual('q');
      expect(shuffled[2]).assertEqual('p');
      expect(shuffled.join('')).assertEqual('rqp');
      expect(source.join('')).assertEqual('pqr');
      RandGenUtils.reset();
      const replay: string[] = RandGenUtils.shuffle(source);
      expect(replay.join('')).assertEqual('rqp');
      expect(replay.join('')).assertEqual(shuffled.join(''));
      expect(source.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_2100
     * @tc.name      testSeed0004
     * @tc.desc      Verify switching between seed(123) and seed(999)
     *               restarts each dedicated stream at 440917656 and
     *               752630676 without mutual interference.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSeed0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSeed0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.seed(123);
      expect(RandGenUtils.getSeed()).assertEqual(123);
      const fromSmall: number = RandGenUtils.next();
      expect(fromSmall).assertEqual(440917656);
      RandGenUtils.seed(999);
      expect(RandGenUtils.getSeed()).assertEqual(999);
      const fromLarge: number = RandGenUtils.next();
      expect(fromLarge).assertEqual(752630676);
      RandGenUtils.seed(123);
      const replaySmall: number = RandGenUtils.next();
      expect(replaySmall).assertEqual(440917656);
      RandGenUtils.seed(999);
      const replayLarge: number = RandGenUtils.next();
      expect(replayLarge).assertEqual(752630676);
      expect(fromSmall).assertEqual(replaySmall);
      expect(fromLarge).assertEqual(replayLarge);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_2200
     * @tc.name      testNextInt0005
     * @tc.desc      Verify nextInt(3) on the default stream yields four
     *               consecutive zeros before the first one because the
     *               first five raw values are divisible as documented.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextInt0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextInt0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const r1: number = RandGenUtils.nextInt(3);
      const r2: number = RandGenUtils.nextInt(3);
      const r3: number = RandGenUtils.nextInt(3);
      const r4: number = RandGenUtils.nextInt(3);
      const r5: number = RandGenUtils.nextInt(3);
      expect(r1).assertEqual(0);
      expect(r2).assertEqual(0);
      expect(r3).assertEqual(0);
      expect(r4).assertEqual(0);
      expect(r5).assertEqual(1);
      expect(r1).assertLarger(-1);
      expect(r5).assertLess(3);
      const sixth: number = RandGenUtils.next();
      expect(sixth).assertEqual(558577111);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_2300
     * @tc.name      testNextInt0006
     * @tc.desc      Verify successive nextInt calls with growing bounds
     *               two, four, eight and sixteen consume exactly one raw
     *               value each and produce the hand computed residues.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextInt0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextInt0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const by2: number = RandGenUtils.nextInt(2);
      const by4: number = RandGenUtils.nextInt(4);
      const by8: number = RandGenUtils.nextInt(8);
      const by16: number = RandGenUtils.nextInt(16);
      expect(by2).assertEqual(0);
      expect(by4).assertEqual(3);
      expect(by8).assertEqual(0);
      expect(by16).assertEqual(1);
      expect(by4).assertLess(4);
      expect(by8).assertLess(8);
      expect(by16).assertLess(16);
      const fifthRaw: number = RandGenUtils.next();
      expect(fifthRaw).assertEqual(1945059670);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_2400
     * @tc.name      testNextRange0005
     * @tc.desc      Verify nextRange works over negative intervals,
     *               returning -8 from (-10, -5) and 1 from (-3, 4) on
     *               the two first default stream draws.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextRange0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextRange0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const negative: number = RandGenUtils.nextRange(-10, -5);
      expect(negative).assertEqual(-8);
      expect(negative).assertLarger(-11);
      expect(negative).assertLess(-5);
      const crossing: number = RandGenUtils.nextRange(-3, 4);
      expect(crossing).assertEqual(1);
      expect(crossing).assertLarger(-4);
      expect(crossing).assertLess(4);
      const thirdRaw: number = RandGenUtils.next();
      expect(thirdRaw).assertEqual(189729048);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_2500
     * @tc.name      testNextDigits0004
     * @tc.desc      Verify a four character call followed by a two
     *               character call concatenates to the same '298501'
     *               that a single six character call produces.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextDigits0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextDigits0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const head: string = RandGenUtils.nextDigits(4);
      const tail: string = RandGenUtils.nextDigits(2);
      expect(head).assertEqual('2985');
      expect(tail).assertEqual('01');
      expect(head.length).assertEqual(4);
      expect(tail.length).assertEqual(2);
      const joined: string = head + tail;
      expect(joined).assertEqual('298501');
      RandGenUtils.reset();
      const whole: string = RandGenUtils.nextDigits(6);
      expect(whole).assertEqual('298501');
      expect(joined).assertEqual(whole);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_2600
     * @tc.name      testShuffle0004
     * @tc.desc      Verify shuffling a four letter deck yields the hand
     *               computed permutation n, p, m, o and preserves both
     *               element multiset and source array order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testShuffle0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testShuffle0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const source: string[] = ['m', 'n', 'o', 'p'];
      RandGenUtils.reset();
      const shuffled: string[] = RandGenUtils.shuffle(source);
      expect(shuffled.length).assertEqual(4);
      expect(shuffled[0]).assertEqual('n');
      expect(shuffled[1]).assertEqual('p');
      expect(shuffled[2]).assertEqual('m');
      expect(shuffled[3]).assertEqual('o');
      expect(shuffled.join('')).assertEqual('npmo');
      expect(source.join('')).assertEqual('mnop');
      let mCount: number = 0;
      for (let i: number = 0; i < shuffled.length; i++) {
        if (shuffled[i] === 'm') {
          mCount += 1;
        }
      }
      expect(mCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_2700
     * @tc.name      testSeed0005
     * @tc.desc      Verify the largest safe integer seed collapses to
     *               state 2147483647, negative zero seeds to 0 and small
     *               negative seeds mirror their positives.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSeed0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSeed0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.seed(9007199254740991);
      expect(RandGenUtils.getSeed()).assertEqual(2147483647);
      const huge: number = RandGenUtils.next();
      expect(huge).assertEqual(1043980748);
      RandGenUtils.seed(-0);
      expect(RandGenUtils.getSeed()).assertEqual(0);
      const zeroDraw: number = RandGenUtils.next();
      expect(zeroDraw).assertEqual(12345);
      RandGenUtils.seed(-123);
      expect(RandGenUtils.getSeed()).assertEqual(123);
      const mirrored: number = RandGenUtils.next();
      expect(mirrored).assertEqual(440917656);
      RandGenUtils.seed(123);
      const positive: number = RandGenUtils.next();
      expect(positive).assertEqual(440917656);
      expect(positive).assertEqual(mirrored);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_2800
     * @tc.name      testNextInt0007
     * @tc.desc      Verify nextInt with the state modulus bound equals
     *               the raw stream value and nextInt(1) after a draw
     *               keeps consuming exactly one value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextInt0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextInt0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const bounded: number = RandGenUtils.nextInt(2147483648);
      expect(bounded).assertEqual(412829322);
      const zeroBound: number = RandGenUtils.nextInt(1);
      expect(zeroBound).assertEqual(0);
      const raw: number = RandGenUtils.next();
      expect(raw).assertEqual(189729048);
      RandGenUtils.reset();
      const direct: number = RandGenUtils.next();
      expect(direct).assertEqual(412829322);
      expect(bounded).assertEqual(direct);
      expect(direct).assertLess(2147483648);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_RNGE_2900
     * @tc.name      testNextRange0006
     * @tc.desc      Verify nextRange over the full state interval equals
     *               the raw values in order and a shifted interval adds
     *               exactly its minimum.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextRange0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNextRange0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      RandGenUtils.reset();
      const first: number = RandGenUtils.nextRange(0, 2147483648);
      expect(first).assertEqual(412829322);
      const second: number = RandGenUtils.nextRange(0, 2147483648);
      expect(second).assertEqual(1649886459);
      const shifted: number = RandGenUtils.nextRange(1, 2147483648);
      expect(shifted).assertEqual(189729049);
      expect(shifted).assertLarger(0);
      expect(shifted).assertLess(2147483648);
      const fourth: number = RandGenUtils.nextRange(100, 2147483648);
      expect(fourth).assertEqual(100425685);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
