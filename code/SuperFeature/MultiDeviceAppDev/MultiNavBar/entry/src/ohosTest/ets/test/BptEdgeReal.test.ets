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
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import {
  BP_SM,
  BP_MD,
  BP_LG,
  NON_SM_BREAKPOINTS,
  UNKNOWN_BREAKPOINTS
} from '../util/NavSpec';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

/**
 * L1 cases for BreakpointType<T>.GetValue (common/BreakpointSystem.ets:27).
 * GetValue maps 'sm' / 'md' / 'lg' to the three frozen constructor slots and returns
 * undefined for every other key - the match is case sensitive and whitespace sensitive.
 */
export default function bptEdgeRealTest() {
  describe('MultiNavBarBptEdgeReal', () => {
    /**
     * @tc.name   testBptReal0001
     * @tc.number SUB_MNB_BPT_0001
     * @tc.desc   GetValue('sm') returns the sm slot of a number triple
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBptReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0001 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const actual: number = sut.GetValue(BP_SM) as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actual), '10');
      expect(actual).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'md=%{public}s lg=%{public}s', String(sut.GetValue(BP_MD)),
        String(sut.GetValue(BP_LG)));
      expect(sut.GetValue(BP_MD)).assertEqual(20);
      expect(sut.GetValue(BP_LG)).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0001 end');
    });

    /**
     * @tc.name   testBptReal0002
     * @tc.number SUB_MNB_BPT_0002
     * @tc.desc   GetValue('md') returns the md slot and leaves sm/lg untouched
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBptReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0002 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('a', 'b', 'c');
      const actual: string = sut.GetValue(BP_MD) as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'b');
      expect(actual).assertEqual('b');
      expect(sut.GetValue(BP_SM)).assertEqual('a');
      expect(sut.GetValue(BP_LG)).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0002 end');
    });

    /**
     * @tc.name   testBptReal0003
     * @tc.number SUB_MNB_BPT_0003
     * @tc.desc   GetValue('lg') returns the lg slot and the three slots stay distinct
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBptReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0003 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('compact', 'medium', 'large');
      const lg: string = sut.GetValue(BP_LG) as string;
      const sm: string = sut.GetValue(BP_SM) as string;
      const md: string = sut.GetValue(BP_MD) as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', lg, 'large');
      expect(lg).assertEqual('large');
      expect(sm === lg).assertFalse();
      expect(md === lg).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0003 end');
    });

    /**
     * @tc.name   testBptReal0004
     * @tc.number SUB_MNB_BPT_0004
     * @tc.desc   Anchor: empty string key resolves to undefined, not to the sm slot
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBptReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0004 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(1, 2, 3);
      const raw: number | undefined = sut.GetValue('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(raw), 'undefined');
      expect(String(raw)).assertEqual('undefined');
      expect(sut.GetValue(BP_SM)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'slots=%{public}s',
        `${String(sut.GetValue(BP_MD))}/${String(sut.GetValue(BP_LG))}`);
      expect(String(sut.GetValue(BP_MD))).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0004 end');
    });

    /**
     * @tc.name   testBptReal0005
     * @tc.number SUB_MNB_BPT_0005
     * @tc.desc   Anchor: uppercase 'SM' is rejected because the key match is case sensitive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBptReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0005 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('small', 'middle', 'large');
      const upper: string | undefined = sut.GetValue('SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(upper), 'undefined');
      expect(String(upper)).assertEqual('undefined');
      expect(sut.GetValue(BP_SM)).assertEqual('small');
      expect(String(sut.GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0005 end');
    });

    /**
     * @tc.name   testBptReal0006
     * @tc.number SUB_MNB_BPT_0006
     * @tc.desc   Anchor: leading and trailing spaces are not trimmed before matching
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBptReal0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0006 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(7, 8, 9);
      const padded: number | undefined = sut.GetValue(' sm');
      const trailing: number | undefined = sut.GetValue('lg ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'padded=%{public}s trailing=%{public}s', String(padded), String(trailing));
      expect(String(padded)).assertEqual('undefined');
      expect(String(trailing)).assertEqual('undefined');
      expect(sut.GetValue(BP_SM)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0006 end');
    });

    /**
     * @tc.name   testBptReal0007
     * @tc.number SUB_MNB_BPT_0007
     * @tc.desc   Unknown short keys 'xs' / 'xs_' resolve to undefined (no fuzzy matching)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBptReal0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0007 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(1, 2, 3);
      const xs: number | undefined = sut.GetValue('xs');
      const sms: number | undefined = sut.GetValue('sms');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'xs=%{public}s sms=%{public}s', String(xs), String(sms));
      expect(String(xs)).assertEqual('undefined');
      expect(String(sms)).assertEqual('undefined');
      expect(sut.GetValue(BP_MD)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0007 end');
    });

    /**
     * @tc.name   testBptReal0008
     * @tc.number SUB_MNB_BPT_0008
     * @tc.desc   Unknown long keys 'xxl' / 'smlg' resolve to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBptReal0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0008 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(4, 5, 6);
      const xxl: number | undefined = sut.GetValue('xxl');
      const smlg: number | undefined = sut.GetValue('smlg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'xxl=%{public}s smlg=%{public}s', String(xxl), String(smlg));
      expect(String(xxl)).assertEqual('undefined');
      expect(String(smlg)).assertEqual('undefined');
      expect(sut.GetValue(BP_LG)).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0008 end');
    });

    /**
     * @tc.name   testBptReal0009
     * @tc.number SUB_MNB_BPT_0009
     * @tc.desc   A numeric string key like '0' is not coerced to a slot index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptReal0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0009 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(100, 200, 300);
      const numeric: number | undefined = sut.GetValue('0');
      const two: number | undefined = sut.GetValue('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'zero=%{public}s two=%{public}s', String(numeric), String(two));
      expect(String(numeric)).assertEqual('undefined');
      expect(String(two)).assertEqual('undefined');
      expect(sut.GetValue(BP_LG)).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0009 end');
    });

    /**
     * @tc.name   testBptReal0010
     * @tc.number SUB_MNB_BPT_0010
     * @tc.desc   Extreme: a 64 character key still resolves to undefined without throwing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptReal0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0010 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(11, 12, 13);
      const longKey: string = 'sm'.repeat(32);
      const long: number | undefined = sut.GetValue(longKey);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'keyLen=%{public}s actual=%{public}s', String(longKey.length), String(long));
      expect(String(long)).assertEqual('undefined');
      expect(String(sut.GetValue(BP_LG))).assertEqual('13');
      expect(sut.GetValue(BP_SM)).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0010 end');
    });

    /**
     * @tc.name   testBptReal0011
     * @tc.number SUB_MNB_BPT_0011
     * @tc.desc   Extreme: a 255 character key resolves to undefined and the shorter prefix still works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptReal0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0011 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(21, 22, 23);
      const hugeKey: string = 'md'.repeat(127) + 'x';
      const huge: number | undefined = sut.GetValue(hugeKey);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'keyLen=%{public}s actual=%{public}s', String(hugeKey.length), String(huge));
      expect(String(huge)).assertEqual('undefined');
      expect(String(sut.GetValue(BP_LG))).assertEqual('23');
      expect(sut.GetValue(BP_MD)).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0011 end');
    });

    /**
     * @tc.name   testBptReal0012
     * @tc.number SUB_MNB_BPT_0012
     * @tc.desc   Combination: BreakpointType<boolean> routes false/true/false without treating false as missing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBptReal0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0012 begin');
      const sut: BreakpointType<boolean> = new BreakpointType<boolean>(false, true, false);
      const smValue: boolean = sut.GetValue(BP_SM) as boolean;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sm=%{public}s expected=%{public}s', String(smValue), 'false');
      expect(smValue).assertFalse();
      expect(sut.GetValue(BP_MD) as boolean).assertTrue();
      expect(String(sut.GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0012 end');
    });

    /**
     * @tc.name   testBptReal0013
     * @tc.number SUB_MNB_BPT_0013
     * @tc.desc   Combination: BreakpointType<Array<number>> returns the array that belongs to each key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBptReal0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0013 begin');
      const sut: BreakpointType<Array<number>> =
        new BreakpointType<Array<number>>([1, 2], [3, 4, 5], [6]);
      const smJoin: string = (sut.GetValue(BP_SM) as Array<number>).join(',');
      const mdJoin: string = (sut.GetValue(BP_MD) as Array<number>).join(',');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sm=%{public}s md=%{public}s', smJoin, mdJoin);
      expect(smJoin).assertEqual('1,2');
      expect(mdJoin).assertEqual('3,4,5');
      expect((sut.GetValue(BP_LG) as Array<number>).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0013 end');
    });

    /**
     * @tc.name   testBptReal0014
     * @tc.number SUB_MNB_BPT_0014
     * @tc.desc   Boundary: an empty array slot is returned as an empty array, not as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptReal0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0014 begin');
      const sut: BreakpointType<Array<string>> = new BreakpointType<Array<string>>([], ['x'], []);
      const smValue: Array<string> = sut.GetValue(BP_SM) as Array<string>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smLen=%{public}s', String(smValue.length));
      expect(smValue.length).assertEqual(0);
      expect((sut.GetValue(BP_MD) as Array<string>)[0]).assertEqual('x');
      expect(String(sut.GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0014 end');
    });

    /**
     * @tc.name   testBptReal0015
     * @tc.number SUB_MNB_BPT_0015
     * @tc.desc   Boundary: false / 0 / empty string slots are returned as-is, not collapsed to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptReal0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0015 begin');
      const zero: BreakpointType<number> = new BreakpointType<number>(0, 1, 2);
      const empty: BreakpointType<string> = new BreakpointType<string>('', 'm', 'l');
      const zeroValue: number = zero.GetValue(BP_SM) as number;
      const emptyValue: string = empty.GetValue(BP_SM) as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'zero=%{public}s empty=[%{public}s]', String(zeroValue), emptyValue);
      expect(zeroValue).assertEqual(0);
      expect(emptyValue).assertEqual('');
      expect(String(empty.GetValue(BP_LG))).assertEqual('l');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0015 end');
    });

    /**
     * @tc.name   testBptReal0016
     * @tc.number SUB_MNB_BPT_0016
     * @tc.desc   State: three consecutive lookups on one instance are independent and repeatable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBptReal0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0016 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(3, 6, 9);
      const first: number = sut.GetValue(BP_LG) as number;
      const middle: number = sut.GetValue(BP_SM) as number;
      const last: number = sut.GetValue(BP_LG) as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}s last=%{public}s', String(first), String(last));
      expect(first).assertEqual(9);
      expect(last).assertEqual(9);
      expect(middle).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0016 end');
    });

    /**
     * @tc.name   testBptReal0017
     * @tc.number SUB_MNB_BPT_0017
     * @tc.desc   State: a lookup with an unknown key does not poison later valid lookups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBptReal0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0017 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('s', 'm', 'l');
      const bad: string | undefined = sut.GetValue('xl');
      const afterBad: string = sut.GetValue(BP_MD) as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'bad=%{public}s after=%{public}s', String(bad), afterBad);
      expect(String(bad)).assertEqual('undefined');
      expect(afterBad).assertEqual('m');
      expect(sut.GetValue(BP_SM)).assertEqual('s');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0017 end');
    });

    /**
     * @tc.name   testBptReal0018
     * @tc.number SUB_MNB_BPT_0018
     * @tc.desc   Combination: every key of UNKNOWN_BREAKPOINTS resolves to undefined on one instance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptReal0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0018 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(1, 2, 3);
      const resolved: string[] = [];
      for (let i: number = 0; i < UNKNOWN_BREAKPOINTS.length; i++) {
        const probe: string = UNKNOWN_BREAKPOINTS[i];
        const value: number | undefined = sut.GetValue(probe);
        if (value !== undefined) {
          resolved.push(probe);
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unexpected=%{public}s count=%{public}s',
        resolved.join('|'), String(resolved.length));
      expect(resolved.length).assertEqual(0);
      expect(UNKNOWN_BREAKPOINTS.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check sut.GetValue(BP_LG)');
      expect(sut.GetValue(BP_LG)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0018 end');
    });

    /**
     * @tc.name   testBptReal0019
     * @tc.number SUB_MNB_BPT_0019
     * @tc.desc   Property: the three valid slots stay distinct for arbitrary number triples
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptReal0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0019 begin');
      const triples: number[][] = [[0, 1, 2], [-1, 0, 1], [100, 200, 300], [7, 7, 8]];
      let mismatched: number = 0;
      for (let i: number = 0; i < triples.length; i++) {
        const t: number[] = triples[i];
        const sut: BreakpointType<number> = new BreakpointType<number>(t[0], t[1], t[2]);
        if ((sut.GetValue(BP_SM) as number) !== t[0] || (sut.GetValue(BP_MD) as number) !== t[1] ||
          (sut.GetValue(BP_LG) as number) !== t[2]) {
          mismatched++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mismatched=%{public}s', String(mismatched));
      expect(mismatched).assertEqual(0);
      expect(triples.length).assertEqual(4);
      expect(triples[3][1]).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0019 end');
    });

    /**
     * @tc.name   testBptReal0020
     * @tc.number SUB_MNB_BPT_0020
     * @tc.desc   Property: two slots holding the same value report that value for both keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptReal0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0020 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('same', 'same', 'other');
      const sm: string = sut.GetValue(BP_SM) as string;
      const md: string = sut.GetValue(BP_MD) as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sm=%{public}s md=%{public}s', sm, md);
      expect(sm).assertEqual('same');
      expect(md).assertEqual('same');
      expect(sut.GetValue(BP_LG)).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0020 end');
    });

    /**
     * @tc.name   testBptReal0021
     * @tc.number SUB_MNB_BPT_0021
     * @tc.desc   Combination: NON_SM_BREAKPOINTS never reaches the sm slot of a string instance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptReal0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0021 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('SM-SLOT', 'MD-SLOT', 'LG-SLOT');
      let smHits: number = 0;
      for (let i: number = 0; i < NON_SM_BREAKPOINTS.length; i++) {
        if ((sut.GetValue(NON_SM_BREAKPOINTS[i]) as string) === 'SM-SLOT') {
          smHits++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smHits=%{public}s probes=%{public}s', String(smHits),
        String(NON_SM_BREAKPOINTS.length));
      expect(smHits).assertEqual(0);
      expect(NON_SM_BREAKPOINTS.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check sut.GetValue(BP_SM)');
      expect(sut.GetValue(BP_SM)).assertEqual('SM-SLOT');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0021 end');
    });

    /**
     * @tc.name   testBptReal0022
     * @tc.number SUB_MNB_BPT_0022
     * @tc.desc   Anchor: a tab character inside the key is not normalised before matching
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBptReal0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0022 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(31, 32, 33);
      const tabbed: number | undefined = sut.GetValue('md\t');
      const newline: number | undefined = sut.GetValue('sm\n');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'tabbed=%{public}s newline=%{public}s', String(tabbed), String(newline));
      expect(String(tabbed)).assertEqual('undefined');
      expect(String(newline)).assertEqual('undefined');
      expect(sut.GetValue(BP_MD)).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptReal0022 end');
    });
  });
}
