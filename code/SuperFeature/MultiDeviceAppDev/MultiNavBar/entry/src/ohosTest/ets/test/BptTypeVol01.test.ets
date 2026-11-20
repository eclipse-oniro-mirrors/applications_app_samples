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

// @volume rule=input-value basis=main-frozen cases=38
// Volume cases, see section 4 of ohosTest.md for the generation rule. Hand-written anchor cases must be added
// to the same describe and marked with an @tc.desc starting with 'Anchor:'.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function bptTypeVol01Test() {
  describe('MultiNavBarBptTypeVol01', () => {

    /**
     * @tc.name   testBptTypeVol010001
     * @tc.number SUB_MNB_BPT_0023
     * @tc.desc   BreakpointType<number>(1/1000/2000) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010001 begin');
      const result: number | undefined = new BreakpointType<number>(1, 1000, 2000).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(String(result)).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 1000, 2000).GetValue('md')), String('1000'));
      expect(String(new BreakpointType<number>(1, 1000, 2000).GetValue('md'))).assertEqual('1000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 1000, 2000).GetValue('lg')), String('2000'));
      expect(String(new BreakpointType<number>(1, 1000, 2000).GetValue('lg'))).assertEqual('2000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 1000, 2000).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(1, 1000, 2000).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 1000, 2000).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(1, 1000, 2000).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010001 end');
    });

    /**
     * @tc.name   testBptTypeVol010002
     * @tc.number SUB_MNB_BPT_0024
     * @tc.desc   BreakpointType<number>(2/1001/2001) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010002 begin');
      const result: number | undefined = new BreakpointType<number>(2, 1001, 2001).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1001'));
      expect(String(result)).assertEqual('1001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2, 1001, 2001).GetValue('sm')), String('2'));
      expect(String(new BreakpointType<number>(2, 1001, 2001).GetValue('sm'))).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2, 1001, 2001).GetValue('lg')), String('2001'));
      expect(String(new BreakpointType<number>(2, 1001, 2001).GetValue('lg'))).assertEqual('2001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2, 1001, 2001).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(2, 1001, 2001).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2, 1001, 2001).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(2, 1001, 2001).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010002 end');
    });

    /**
     * @tc.name   testBptTypeVol010003
     * @tc.number SUB_MNB_BPT_0025
     * @tc.desc   BreakpointType<number>(3/1002/2002) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010003 begin');
      const result: number | undefined = new BreakpointType<number>(3, 1002, 2002).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2002'));
      expect(String(result)).assertEqual('2002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 1002, 2002).GetValue('sm')), String('3'));
      expect(String(new BreakpointType<number>(3, 1002, 2002).GetValue('sm'))).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 1002, 2002).GetValue('md')), String('1002'));
      expect(String(new BreakpointType<number>(3, 1002, 2002).GetValue('md'))).assertEqual('1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 1002, 2002).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(3, 1002, 2002).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 1002, 2002).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(3, 1002, 2002).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010003 end');
    });

    /**
     * @tc.name   testBptTypeVol010004
     * @tc.number SUB_MNB_BPT_0026
     * @tc.desc   BreakpointType<number>(4/1003/2003) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010004 begin');
      const result: number | undefined = new BreakpointType<number>(4, 1003, 2003).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('4'));
      expect(String(result)).assertEqual('4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(4, 1003, 2003).GetValue('md')), String('1003'));
      expect(String(new BreakpointType<number>(4, 1003, 2003).GetValue('md'))).assertEqual('1003');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(4, 1003, 2003).GetValue('lg')), String('2003'));
      expect(String(new BreakpointType<number>(4, 1003, 2003).GetValue('lg'))).assertEqual('2003');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(4, 1003, 2003).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(4, 1003, 2003).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(4, 1003, 2003).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(4, 1003, 2003).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010004 end');
    });

    /**
     * @tc.name   testBptTypeVol010005
     * @tc.number SUB_MNB_BPT_0027
     * @tc.desc   BreakpointType<number>(5/1004/2004) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010005 begin');
      const result: number | undefined = new BreakpointType<number>(5, 1004, 2004).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1004'));
      expect(String(result)).assertEqual('1004');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(5, 1004, 2004).GetValue('sm')), String('5'));
      expect(String(new BreakpointType<number>(5, 1004, 2004).GetValue('sm'))).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(5, 1004, 2004).GetValue('lg')), String('2004'));
      expect(String(new BreakpointType<number>(5, 1004, 2004).GetValue('lg'))).assertEqual('2004');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(5, 1004, 2004).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(5, 1004, 2004).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(5, 1004, 2004).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(5, 1004, 2004).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010005 end');
    });

    /**
     * @tc.name   testBptTypeVol010006
     * @tc.number SUB_MNB_BPT_0028
     * @tc.desc   BreakpointType<number>(6/1005/2005) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010006 begin');
      const result: number | undefined = new BreakpointType<number>(6, 1005, 2005).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2005'));
      expect(String(result)).assertEqual('2005');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(6, 1005, 2005).GetValue('sm')), String('6'));
      expect(String(new BreakpointType<number>(6, 1005, 2005).GetValue('sm'))).assertEqual('6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(6, 1005, 2005).GetValue('md')), String('1005'));
      expect(String(new BreakpointType<number>(6, 1005, 2005).GetValue('md'))).assertEqual('1005');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(6, 1005, 2005).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(6, 1005, 2005).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(6, 1005, 2005).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(6, 1005, 2005).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010006 end');
    });

    /**
     * @tc.name   testBptTypeVol010007
     * @tc.number SUB_MNB_BPT_0029
     * @tc.desc   BreakpointType<number>(7/1006/2006) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010007 begin');
      const result: number | undefined = new BreakpointType<number>(7, 1006, 2006).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('7'));
      expect(String(result)).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 1006, 2006).GetValue('md')), String('1006'));
      expect(String(new BreakpointType<number>(7, 1006, 2006).GetValue('md'))).assertEqual('1006');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 1006, 2006).GetValue('lg')), String('2006'));
      expect(String(new BreakpointType<number>(7, 1006, 2006).GetValue('lg'))).assertEqual('2006');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 1006, 2006).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(7, 1006, 2006).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 1006, 2006).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(7, 1006, 2006).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010007 end');
    });

    /**
     * @tc.name   testBptTypeVol010008
     * @tc.number SUB_MNB_BPT_0030
     * @tc.desc   BreakpointType<number>(8/1007/2007) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010008 begin');
      const result: number | undefined = new BreakpointType<number>(8, 1007, 2007).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1007'));
      expect(String(result)).assertEqual('1007');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(8, 1007, 2007).GetValue('sm')), String('8'));
      expect(String(new BreakpointType<number>(8, 1007, 2007).GetValue('sm'))).assertEqual('8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(8, 1007, 2007).GetValue('lg')), String('2007'));
      expect(String(new BreakpointType<number>(8, 1007, 2007).GetValue('lg'))).assertEqual('2007');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(8, 1007, 2007).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(8, 1007, 2007).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(8, 1007, 2007).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(8, 1007, 2007).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010008 end');
    });

    /**
     * @tc.name   testBptTypeVol010009
     * @tc.number SUB_MNB_BPT_0031
     * @tc.desc   BreakpointType<number>(9/1008/2008) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010009 begin');
      const result: number | undefined = new BreakpointType<number>(9, 1008, 2008).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2008'));
      expect(String(result)).assertEqual('2008');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(9, 1008, 2008).GetValue('sm')), String('9'));
      expect(String(new BreakpointType<number>(9, 1008, 2008).GetValue('sm'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(9, 1008, 2008).GetValue('md')), String('1008'));
      expect(String(new BreakpointType<number>(9, 1008, 2008).GetValue('md'))).assertEqual('1008');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(9, 1008, 2008).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(9, 1008, 2008).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(9, 1008, 2008).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(9, 1008, 2008).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010009 end');
    });

    /**
     * @tc.name   testBptTypeVol010010
     * @tc.number SUB_MNB_BPT_0032
     * @tc.desc   BreakpointType<number>(10/1009/2009) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010010 begin');
      const result: number | undefined = new BreakpointType<number>(10, 1009, 2009).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10'));
      expect(String(result)).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 1009, 2009).GetValue('md')), String('1009'));
      expect(String(new BreakpointType<number>(10, 1009, 2009).GetValue('md'))).assertEqual('1009');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 1009, 2009).GetValue('lg')), String('2009'));
      expect(String(new BreakpointType<number>(10, 1009, 2009).GetValue('lg'))).assertEqual('2009');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 1009, 2009).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 1009, 2009).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 1009, 2009).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 1009, 2009).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010010 end');
    });

    /**
     * @tc.name   testBptTypeVol010011
     * @tc.number SUB_MNB_BPT_0033
     * @tc.desc   BreakpointType<number>(11/1010/2010) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010011 begin');
      const result: number | undefined = new BreakpointType<number>(11, 1010, 2010).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1010'));
      expect(String(result)).assertEqual('1010');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(11, 1010, 2010).GetValue('sm')), String('11'));
      expect(String(new BreakpointType<number>(11, 1010, 2010).GetValue('sm'))).assertEqual('11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(11, 1010, 2010).GetValue('lg')), String('2010'));
      expect(String(new BreakpointType<number>(11, 1010, 2010).GetValue('lg'))).assertEqual('2010');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(11, 1010, 2010).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(11, 1010, 2010).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(11, 1010, 2010).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(11, 1010, 2010).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010011 end');
    });

    /**
     * @tc.name   testBptTypeVol010012
     * @tc.number SUB_MNB_BPT_0034
     * @tc.desc   BreakpointType<number>(12/1011/2011) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010012 begin');
      const result: number | undefined = new BreakpointType<number>(12, 1011, 2011).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2011'));
      expect(String(result)).assertEqual('2011');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 1011, 2011).GetValue('sm')), String('12'));
      expect(String(new BreakpointType<number>(12, 1011, 2011).GetValue('sm'))).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 1011, 2011).GetValue('md')), String('1011'));
      expect(String(new BreakpointType<number>(12, 1011, 2011).GetValue('md'))).assertEqual('1011');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 1011, 2011).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(12, 1011, 2011).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 1011, 2011).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(12, 1011, 2011).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010012 end');
    });

    /**
     * @tc.name   testBptTypeVol010013
     * @tc.number SUB_MNB_BPT_0035
     * @tc.desc   BreakpointType<number>(13/1012/2012) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010013 begin');
      const result: number | undefined = new BreakpointType<number>(13, 1012, 2012).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('13'));
      expect(String(result)).assertEqual('13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(13, 1012, 2012).GetValue('md')), String('1012'));
      expect(String(new BreakpointType<number>(13, 1012, 2012).GetValue('md'))).assertEqual('1012');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(13, 1012, 2012).GetValue('lg')), String('2012'));
      expect(String(new BreakpointType<number>(13, 1012, 2012).GetValue('lg'))).assertEqual('2012');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(13, 1012, 2012).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(13, 1012, 2012).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(13, 1012, 2012).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(13, 1012, 2012).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010013 end');
    });

    /**
     * @tc.name   testBptTypeVol010014
     * @tc.number SUB_MNB_BPT_0036
     * @tc.desc   BreakpointType<number>(14/1013/2013) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010014 begin');
      const result: number | undefined = new BreakpointType<number>(14, 1013, 2013).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1013'));
      expect(String(result)).assertEqual('1013');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(14, 1013, 2013).GetValue('sm')), String('14'));
      expect(String(new BreakpointType<number>(14, 1013, 2013).GetValue('sm'))).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(14, 1013, 2013).GetValue('lg')), String('2013'));
      expect(String(new BreakpointType<number>(14, 1013, 2013).GetValue('lg'))).assertEqual('2013');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(14, 1013, 2013).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(14, 1013, 2013).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(14, 1013, 2013).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(14, 1013, 2013).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010014 end');
    });

    /**
     * @tc.name   testBptTypeVol010015
     * @tc.number SUB_MNB_BPT_0037
     * @tc.desc   BreakpointType<number>(15/1014/2014) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010015 begin');
      const result: number | undefined = new BreakpointType<number>(15, 1014, 2014).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2014'));
      expect(String(result)).assertEqual('2014');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(15, 1014, 2014).GetValue('sm')), String('15'));
      expect(String(new BreakpointType<number>(15, 1014, 2014).GetValue('sm'))).assertEqual('15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(15, 1014, 2014).GetValue('md')), String('1014'));
      expect(String(new BreakpointType<number>(15, 1014, 2014).GetValue('md'))).assertEqual('1014');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(15, 1014, 2014).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(15, 1014, 2014).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(15, 1014, 2014).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(15, 1014, 2014).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010015 end');
    });

    /**
     * @tc.name   testBptTypeVol010016
     * @tc.number SUB_MNB_BPT_0038
     * @tc.desc   BreakpointType<number>(16/1015/2015) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010016 begin');
      const result: number | undefined = new BreakpointType<number>(16, 1015, 2015).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('16'));
      expect(String(result)).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 1015, 2015).GetValue('md')), String('1015'));
      expect(String(new BreakpointType<number>(16, 1015, 2015).GetValue('md'))).assertEqual('1015');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 1015, 2015).GetValue('lg')), String('2015'));
      expect(String(new BreakpointType<number>(16, 1015, 2015).GetValue('lg'))).assertEqual('2015');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 1015, 2015).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(16, 1015, 2015).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 1015, 2015).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(16, 1015, 2015).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010016 end');
    });

    /**
     * @tc.name   testBptTypeVol010017
     * @tc.number SUB_MNB_BPT_0039
     * @tc.desc   BreakpointType<number>(17/1016/2016) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010017 begin');
      const result: number | undefined = new BreakpointType<number>(17, 1016, 2016).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1016'));
      expect(String(result)).assertEqual('1016');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(17, 1016, 2016).GetValue('sm')), String('17'));
      expect(String(new BreakpointType<number>(17, 1016, 2016).GetValue('sm'))).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(17, 1016, 2016).GetValue('lg')), String('2016'));
      expect(String(new BreakpointType<number>(17, 1016, 2016).GetValue('lg'))).assertEqual('2016');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(17, 1016, 2016).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(17, 1016, 2016).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(17, 1016, 2016).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(17, 1016, 2016).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010017 end');
    });

    /**
     * @tc.name   testBptTypeVol010018
     * @tc.number SUB_MNB_BPT_0040
     * @tc.desc   BreakpointType<number>(18/1017/2017) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010018 begin');
      const result: number | undefined = new BreakpointType<number>(18, 1017, 2017).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2017'));
      expect(String(result)).assertEqual('2017');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(18, 1017, 2017).GetValue('sm')), String('18'));
      expect(String(new BreakpointType<number>(18, 1017, 2017).GetValue('sm'))).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(18, 1017, 2017).GetValue('md')), String('1017'));
      expect(String(new BreakpointType<number>(18, 1017, 2017).GetValue('md'))).assertEqual('1017');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(18, 1017, 2017).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(18, 1017, 2017).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(18, 1017, 2017).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(18, 1017, 2017).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010018 end');
    });

    /**
     * @tc.name   testBptTypeVol010019
     * @tc.number SUB_MNB_BPT_0041
     * @tc.desc   BreakpointType<number>(19/1018/2018) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010019 begin');
      const result: number | undefined = new BreakpointType<number>(19, 1018, 2018).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('19'));
      expect(String(result)).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(19, 1018, 2018).GetValue('md')), String('1018'));
      expect(String(new BreakpointType<number>(19, 1018, 2018).GetValue('md'))).assertEqual('1018');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(19, 1018, 2018).GetValue('lg')), String('2018'));
      expect(String(new BreakpointType<number>(19, 1018, 2018).GetValue('lg'))).assertEqual('2018');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(19, 1018, 2018).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(19, 1018, 2018).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(19, 1018, 2018).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(19, 1018, 2018).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010019 end');
    });

    /**
     * @tc.name   testBptTypeVol010020
     * @tc.number SUB_MNB_BPT_0042
     * @tc.desc   BreakpointType<number>(20/1019/2019) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010020 begin');
      const result: number | undefined = new BreakpointType<number>(20, 1019, 2019).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1019'));
      expect(String(result)).assertEqual('1019');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(20, 1019, 2019).GetValue('sm')), String('20'));
      expect(String(new BreakpointType<number>(20, 1019, 2019).GetValue('sm'))).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(20, 1019, 2019).GetValue('lg')), String('2019'));
      expect(String(new BreakpointType<number>(20, 1019, 2019).GetValue('lg'))).assertEqual('2019');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(20, 1019, 2019).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(20, 1019, 2019).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(20, 1019, 2019).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(20, 1019, 2019).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010020 end');
    });

    /**
     * @tc.name   testBptTypeVol010021
     * @tc.number SUB_MNB_BPT_0043
     * @tc.desc   BreakpointType<number>(21/1020/2020) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010021 begin');
      const result: number | undefined = new BreakpointType<number>(21, 1020, 2020).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2020'));
      expect(String(result)).assertEqual('2020');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(21, 1020, 2020).GetValue('sm')), String('21'));
      expect(String(new BreakpointType<number>(21, 1020, 2020).GetValue('sm'))).assertEqual('21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(21, 1020, 2020).GetValue('md')), String('1020'));
      expect(String(new BreakpointType<number>(21, 1020, 2020).GetValue('md'))).assertEqual('1020');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(21, 1020, 2020).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(21, 1020, 2020).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(21, 1020, 2020).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(21, 1020, 2020).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010021 end');
    });

    /**
     * @tc.name   testBptTypeVol010022
     * @tc.number SUB_MNB_BPT_0044
     * @tc.desc   BreakpointType<number>(22/1021/2021) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010022 begin');
      const result: number | undefined = new BreakpointType<number>(22, 1021, 2021).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('22'));
      expect(String(result)).assertEqual('22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(22, 1021, 2021).GetValue('md')), String('1021'));
      expect(String(new BreakpointType<number>(22, 1021, 2021).GetValue('md'))).assertEqual('1021');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(22, 1021, 2021).GetValue('lg')), String('2021'));
      expect(String(new BreakpointType<number>(22, 1021, 2021).GetValue('lg'))).assertEqual('2021');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(22, 1021, 2021).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(22, 1021, 2021).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(22, 1021, 2021).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(22, 1021, 2021).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010022 end');
    });

    /**
     * @tc.name   testBptTypeVol010023
     * @tc.number SUB_MNB_BPT_0045
     * @tc.desc   BreakpointType<number>(23/1022/2022) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010023 begin');
      const result: number | undefined = new BreakpointType<number>(23, 1022, 2022).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1022'));
      expect(String(result)).assertEqual('1022');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(23, 1022, 2022).GetValue('sm')), String('23'));
      expect(String(new BreakpointType<number>(23, 1022, 2022).GetValue('sm'))).assertEqual('23');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(23, 1022, 2022).GetValue('lg')), String('2022'));
      expect(String(new BreakpointType<number>(23, 1022, 2022).GetValue('lg'))).assertEqual('2022');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(23, 1022, 2022).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(23, 1022, 2022).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(23, 1022, 2022).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(23, 1022, 2022).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010023 end');
    });

    /**
     * @tc.name   testBptTypeVol010024
     * @tc.number SUB_MNB_BPT_0046
     * @tc.desc   BreakpointType<number>(24/1023/2023) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010024 begin');
      const result: number | undefined = new BreakpointType<number>(24, 1023, 2023).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2023'));
      expect(String(result)).assertEqual('2023');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(24, 1023, 2023).GetValue('sm')), String('24'));
      expect(String(new BreakpointType<number>(24, 1023, 2023).GetValue('sm'))).assertEqual('24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(24, 1023, 2023).GetValue('md')), String('1023'));
      expect(String(new BreakpointType<number>(24, 1023, 2023).GetValue('md'))).assertEqual('1023');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(24, 1023, 2023).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(24, 1023, 2023).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(24, 1023, 2023).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(24, 1023, 2023).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010024 end');
    });

    /**
     * @tc.name   testBptTypeVol010025
     * @tc.number SUB_MNB_BPT_0047
     * @tc.desc   BreakpointType<number>(25/1024/2024) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010025 begin');
      const result: number | undefined = new BreakpointType<number>(25, 1024, 2024).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('25'));
      expect(String(result)).assertEqual('25');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(25, 1024, 2024).GetValue('md')), String('1024'));
      expect(String(new BreakpointType<number>(25, 1024, 2024).GetValue('md'))).assertEqual('1024');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(25, 1024, 2024).GetValue('lg')), String('2024'));
      expect(String(new BreakpointType<number>(25, 1024, 2024).GetValue('lg'))).assertEqual('2024');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(25, 1024, 2024).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(25, 1024, 2024).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(25, 1024, 2024).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(25, 1024, 2024).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010025 end');
    });

    /**
     * @tc.name   testBptTypeVol010026
     * @tc.number SUB_MNB_BPT_0048
     * @tc.desc   BreakpointType<number>(26/1025/2025) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010026 begin');
      const result: number | undefined = new BreakpointType<number>(26, 1025, 2025).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1025'));
      expect(String(result)).assertEqual('1025');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(26, 1025, 2025).GetValue('sm')), String('26'));
      expect(String(new BreakpointType<number>(26, 1025, 2025).GetValue('sm'))).assertEqual('26');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(26, 1025, 2025).GetValue('lg')), String('2025'));
      expect(String(new BreakpointType<number>(26, 1025, 2025).GetValue('lg'))).assertEqual('2025');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(26, 1025, 2025).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(26, 1025, 2025).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(26, 1025, 2025).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(26, 1025, 2025).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010026 end');
    });

    /**
     * @tc.name   testBptTypeVol010027
     * @tc.number SUB_MNB_BPT_0049
     * @tc.desc   BreakpointType<number>(27/1026/2026) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010027 begin');
      const result: number | undefined = new BreakpointType<number>(27, 1026, 2026).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2026'));
      expect(String(result)).assertEqual('2026');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(27, 1026, 2026).GetValue('sm')), String('27'));
      expect(String(new BreakpointType<number>(27, 1026, 2026).GetValue('sm'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(27, 1026, 2026).GetValue('md')), String('1026'));
      expect(String(new BreakpointType<number>(27, 1026, 2026).GetValue('md'))).assertEqual('1026');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(27, 1026, 2026).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(27, 1026, 2026).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(27, 1026, 2026).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(27, 1026, 2026).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010027 end');
    });

    /**
     * @tc.name   testBptTypeVol010028
     * @tc.number SUB_MNB_BPT_0050
     * @tc.desc   BreakpointType<number>(28/1027/2027) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010028 begin');
      const result: number | undefined = new BreakpointType<number>(28, 1027, 2027).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('28'));
      expect(String(result)).assertEqual('28');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(28, 1027, 2027).GetValue('md')), String('1027'));
      expect(String(new BreakpointType<number>(28, 1027, 2027).GetValue('md'))).assertEqual('1027');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(28, 1027, 2027).GetValue('lg')), String('2027'));
      expect(String(new BreakpointType<number>(28, 1027, 2027).GetValue('lg'))).assertEqual('2027');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(28, 1027, 2027).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(28, 1027, 2027).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(28, 1027, 2027).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(28, 1027, 2027).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010028 end');
    });

    /**
     * @tc.name   testBptTypeVol010029
     * @tc.number SUB_MNB_BPT_0051
     * @tc.desc   BreakpointType<number>(29/1028/2028) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010029 begin');
      const result: number | undefined = new BreakpointType<number>(29, 1028, 2028).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1028'));
      expect(String(result)).assertEqual('1028');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(29, 1028, 2028).GetValue('sm')), String('29'));
      expect(String(new BreakpointType<number>(29, 1028, 2028).GetValue('sm'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(29, 1028, 2028).GetValue('lg')), String('2028'));
      expect(String(new BreakpointType<number>(29, 1028, 2028).GetValue('lg'))).assertEqual('2028');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(29, 1028, 2028).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(29, 1028, 2028).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(29, 1028, 2028).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(29, 1028, 2028).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010029 end');
    });

    /**
     * @tc.name   testBptTypeVol010030
     * @tc.number SUB_MNB_BPT_0052
     * @tc.desc   BreakpointType<number>(30/1029/2029) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010030 begin');
      const result: number | undefined = new BreakpointType<number>(30, 1029, 2029).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2029'));
      expect(String(result)).assertEqual('2029');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(30, 1029, 2029).GetValue('sm')), String('30'));
      expect(String(new BreakpointType<number>(30, 1029, 2029).GetValue('sm'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(30, 1029, 2029).GetValue('md')), String('1029'));
      expect(String(new BreakpointType<number>(30, 1029, 2029).GetValue('md'))).assertEqual('1029');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(30, 1029, 2029).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(30, 1029, 2029).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(30, 1029, 2029).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(30, 1029, 2029).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010030 end');
    });

    /**
     * @tc.name   testBptTypeVol010031
     * @tc.number SUB_MNB_BPT_0053
     * @tc.desc   BreakpointType<number>(31/1030/2030) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010031 begin');
      const result: number | undefined = new BreakpointType<number>(31, 1030, 2030).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('31'));
      expect(String(result)).assertEqual('31');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(31, 1030, 2030).GetValue('md')), String('1030'));
      expect(String(new BreakpointType<number>(31, 1030, 2030).GetValue('md'))).assertEqual('1030');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(31, 1030, 2030).GetValue('lg')), String('2030'));
      expect(String(new BreakpointType<number>(31, 1030, 2030).GetValue('lg'))).assertEqual('2030');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(31, 1030, 2030).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(31, 1030, 2030).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(31, 1030, 2030).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(31, 1030, 2030).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010031 end');
    });

    /**
     * @tc.name   testBptTypeVol010032
     * @tc.number SUB_MNB_BPT_0054
     * @tc.desc   BreakpointType<number>(32/1031/2031) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010032 begin');
      const result: number | undefined = new BreakpointType<number>(32, 1031, 2031).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1031'));
      expect(String(result)).assertEqual('1031');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(32, 1031, 2031).GetValue('sm')), String('32'));
      expect(String(new BreakpointType<number>(32, 1031, 2031).GetValue('sm'))).assertEqual('32');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(32, 1031, 2031).GetValue('lg')), String('2031'));
      expect(String(new BreakpointType<number>(32, 1031, 2031).GetValue('lg'))).assertEqual('2031');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(32, 1031, 2031).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(32, 1031, 2031).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(32, 1031, 2031).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(32, 1031, 2031).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010032 end');
    });

    /**
     * @tc.name   testBptTypeVol010033
     * @tc.number SUB_MNB_BPT_0055
     * @tc.desc   BreakpointType<number>(33/1032/2032) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010033 begin');
      const result: number | undefined = new BreakpointType<number>(33, 1032, 2032).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2032'));
      expect(String(result)).assertEqual('2032');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(33, 1032, 2032).GetValue('sm')), String('33'));
      expect(String(new BreakpointType<number>(33, 1032, 2032).GetValue('sm'))).assertEqual('33');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(33, 1032, 2032).GetValue('md')), String('1032'));
      expect(String(new BreakpointType<number>(33, 1032, 2032).GetValue('md'))).assertEqual('1032');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(33, 1032, 2032).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(33, 1032, 2032).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(33, 1032, 2032).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(33, 1032, 2032).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010033 end');
    });

    /**
     * @tc.name   testBptTypeVol010034
     * @tc.number SUB_MNB_BPT_0056
     * @tc.desc   BreakpointType<number>(34/1033/2033) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010034 begin');
      const result: number | undefined = new BreakpointType<number>(34, 1033, 2033).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('34'));
      expect(String(result)).assertEqual('34');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(34, 1033, 2033).GetValue('md')), String('1033'));
      expect(String(new BreakpointType<number>(34, 1033, 2033).GetValue('md'))).assertEqual('1033');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(34, 1033, 2033).GetValue('lg')), String('2033'));
      expect(String(new BreakpointType<number>(34, 1033, 2033).GetValue('lg'))).assertEqual('2033');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(34, 1033, 2033).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(34, 1033, 2033).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(34, 1033, 2033).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(34, 1033, 2033).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010034 end');
    });

    /**
     * @tc.name   testBptTypeVol010035
     * @tc.number SUB_MNB_BPT_0057
     * @tc.desc   BreakpointType<number>(35/1034/2034) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010035 begin');
      const result: number | undefined = new BreakpointType<number>(35, 1034, 2034).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1034'));
      expect(String(result)).assertEqual('1034');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(35, 1034, 2034).GetValue('sm')), String('35'));
      expect(String(new BreakpointType<number>(35, 1034, 2034).GetValue('sm'))).assertEqual('35');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(35, 1034, 2034).GetValue('lg')), String('2034'));
      expect(String(new BreakpointType<number>(35, 1034, 2034).GetValue('lg'))).assertEqual('2034');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(35, 1034, 2034).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(35, 1034, 2034).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(35, 1034, 2034).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(35, 1034, 2034).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010035 end');
    });

    /**
     * @tc.name   testBptTypeVol010036
     * @tc.number SUB_MNB_BPT_0058
     * @tc.desc   BreakpointType<number>(36/1035/2035) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010036 begin');
      const result: number | undefined = new BreakpointType<number>(36, 1035, 2035).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2035'));
      expect(String(result)).assertEqual('2035');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(36, 1035, 2035).GetValue('sm')), String('36'));
      expect(String(new BreakpointType<number>(36, 1035, 2035).GetValue('sm'))).assertEqual('36');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(36, 1035, 2035).GetValue('md')), String('1035'));
      expect(String(new BreakpointType<number>(36, 1035, 2035).GetValue('md'))).assertEqual('1035');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(36, 1035, 2035).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(36, 1035, 2035).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(36, 1035, 2035).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(36, 1035, 2035).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010036 end');
    });

    /**
     * @tc.name   testBptTypeVol010037
     * @tc.number SUB_MNB_BPT_0059
     * @tc.desc   BreakpointType<number>(37/1036/2036) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010037 begin');
      const result: number | undefined = new BreakpointType<number>(37, 1036, 2036).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('37'));
      expect(String(result)).assertEqual('37');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(37, 1036, 2036).GetValue('md')), String('1036'));
      expect(String(new BreakpointType<number>(37, 1036, 2036).GetValue('md'))).assertEqual('1036');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(37, 1036, 2036).GetValue('lg')), String('2036'));
      expect(String(new BreakpointType<number>(37, 1036, 2036).GetValue('lg'))).assertEqual('2036');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(37, 1036, 2036).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(37, 1036, 2036).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(37, 1036, 2036).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(37, 1036, 2036).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010037 end');
    });

    /**
     * @tc.name   testBptTypeVol010038
     * @tc.number SUB_MNB_BPT_0060
     * @tc.desc   BreakpointType<number>(38/1037/2037) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010038 begin');
      const result: number | undefined = new BreakpointType<number>(38, 1037, 2037).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1037'));
      expect(String(result)).assertEqual('1037');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(38, 1037, 2037).GetValue('sm')), String('38'));
      expect(String(new BreakpointType<number>(38, 1037, 2037).GetValue('sm'))).assertEqual('38');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(38, 1037, 2037).GetValue('lg')), String('2037'));
      expect(String(new BreakpointType<number>(38, 1037, 2037).GetValue('lg'))).assertEqual('2037');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(38, 1037, 2037).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(38, 1037, 2037).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(38, 1037, 2037).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(38, 1037, 2037).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010038 end');
    });

  });
}
