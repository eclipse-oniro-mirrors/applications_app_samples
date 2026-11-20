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

export default function bptKeyVol01Test() {
  describe('MultiNavBarBptKeyVol01', () => {

    /**
     * @tc.name   testBptKeyVol010001
     * @tc.number SUB_MNB_BPT_0323
     * @tc.desc   key 'sm' against slots 10/20/30 resolves to 10
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010001 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10'));
      expect(String(result)).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010001 end');
    });

    /**
     * @tc.name   testBptKeyVol010002
     * @tc.number SUB_MNB_BPT_0324
     * @tc.desc   key 'md' against slots 10/20/30 resolves to 20
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010002 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20'));
      expect(String(result)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010002 end');
    });

    /**
     * @tc.name   testBptKeyVol010003
     * @tc.number SUB_MNB_BPT_0325
     * @tc.desc   key 'lg' against slots 10/20/30 resolves to 30
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010003 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('30'));
      expect(String(result)).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010003 end');
    });

    /**
     * @tc.name   testBptKeyVol010004
     * @tc.number SUB_MNB_BPT_0326
     * @tc.desc   key '' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010004 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010004 end');
    });

    /**
     * @tc.name   testBptKeyVol010005
     * @tc.number SUB_MNB_BPT_0327
     * @tc.desc   key 'SM' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010005 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010005 end');
    });

    /**
     * @tc.name   testBptKeyVol010006
     * @tc.number SUB_MNB_BPT_0328
     * @tc.desc   key 'Md' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010006 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('Md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010006 end');
    });

    /**
     * @tc.name   testBptKeyVol010007
     * @tc.number SUB_MNB_BPT_0329
     * @tc.desc   key 'LG' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010007 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('LG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010007 end');
    });

    /**
     * @tc.name   testBptKeyVol010008
     * @tc.number SUB_MNB_BPT_0330
     * @tc.desc   key ' sm' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010008 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue(' sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010008 end');
    });

    /**
     * @tc.name   testBptKeyVol010009
     * @tc.number SUB_MNB_BPT_0331
     * @tc.desc   key 'lg ' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010009 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('lg ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010009 end');
    });

    /**
     * @tc.name   testBptKeyVol010010
     * @tc.number SUB_MNB_BPT_0332
     * @tc.desc   key 'xs' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010010 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('xs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010010 end');
    });

    /**
     * @tc.name   testBptKeyVol010011
     * @tc.number SUB_MNB_BPT_0333
     * @tc.desc   key 'xl' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010011 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('xl');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010011 end');
    });

    /**
     * @tc.name   testBptKeyVol010012
     * @tc.number SUB_MNB_BPT_0334
     * @tc.desc   key 'xxl' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010012 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('xxl');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010012 end');
    });

    /**
     * @tc.name   testBptKeyVol010013
     * @tc.number SUB_MNB_BPT_0335
     * @tc.desc   key '0' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010013 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010013 end');
    });

    /**
     * @tc.name   testBptKeyVol010014
     * @tc.number SUB_MNB_BPT_0336
     * @tc.desc   key 's' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010014 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('s');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010014 end');
    });

    /**
     * @tc.name   testBptKeyVol010015
     * @tc.number SUB_MNB_BPT_0337
     * @tc.desc   key 'smlg' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010015 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('smlg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010015 end');
    });

    /**
     * @tc.name   testBptKeyVol010016
     * @tc.number SUB_MNB_BPT_0338
     * @tc.desc   key 'tab' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010016 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('tab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010016 end');
    });

    /**
     * @tc.name   testBptKeyVol010017
     * @tc.number SUB_MNB_BPT_0339
     * @tc.desc   key 'sm sm' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010017 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('sm sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010017 end');
    });

    /**
     * @tc.name   testBptKeyVol010018
     * @tc.number SUB_MNB_BPT_0340
     * @tc.desc   key 'md\t' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010018 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('md\t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010018 end');
    });

    /**
     * @tc.name   testBptKeyVol010019
     * @tc.number SUB_MNB_BPT_0341
     * @tc.desc   key 'small' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010019 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('small');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010019 end');
    });

    /**
     * @tc.name   testBptKeyVol010020
     * @tc.number SUB_MNB_BPT_0342
     * @tc.desc   key 'medium' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010020 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('medium');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010020 end');
    });

    /**
     * @tc.name   testBptKeyVol010021
     * @tc.number SUB_MNB_BPT_0343
     * @tc.desc   key 'large' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010021 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('large');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010021 end');
    });

    /**
     * @tc.name   testBptKeyVol010022
     * @tc.number SUB_MNB_BPT_0344
     * @tc.desc   key 'Sm' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010022 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('Sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010022 end');
    });

    /**
     * @tc.name   testBptKeyVol010023
     * @tc.number SUB_MNB_BPT_0345
     * @tc.desc   key 'SMALL' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010023 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('SMALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010023 end');
    });

    /**
     * @tc.name   testBptKeyVol010024
     * @tc.number SUB_MNB_BPT_0346
     * @tc.desc   key 'sm\t' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010024 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('sm\t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010024 end');
    });

    /**
     * @tc.name   testBptKeyVol010025
     * @tc.number SUB_MNB_BPT_0347
     * @tc.desc   key '\tsm' against slots 10/20/30 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010025 begin');
      const result: number | undefined = new BreakpointType<number>(10, 20, 30).GetValue('\tsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('lg')), String('30'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('lg'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 20, 30).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 20, 30).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010025 end');
    });

    /**
     * @tc.name   testBptKeyVol010026
     * @tc.number SUB_MNB_BPT_0348
     * @tc.desc   key 'sm' against slots 110/120/130 resolves to 110
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010026 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('110'));
      expect(String(result)).assertEqual('110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('sm')), String('110'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('sm'))).assertEqual('110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('lg')), String('130'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('lg'))).assertEqual('130');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010026 end');
    });

    /**
     * @tc.name   testBptKeyVol010027
     * @tc.number SUB_MNB_BPT_0349
     * @tc.desc   key 'md' against slots 110/120/130 resolves to 120
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010027 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('120'));
      expect(String(result)).assertEqual('120');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('sm')), String('110'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('sm'))).assertEqual('110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('lg')), String('130'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('lg'))).assertEqual('130');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010027 end');
    });

    /**
     * @tc.name   testBptKeyVol010028
     * @tc.number SUB_MNB_BPT_0350
     * @tc.desc   key 'lg' against slots 110/120/130 resolves to 130
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010028 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('130'));
      expect(String(result)).assertEqual('130');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('sm')), String('110'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('sm'))).assertEqual('110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('lg')), String('130'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('lg'))).assertEqual('130');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010028 end');
    });

    /**
     * @tc.name   testBptKeyVol010029
     * @tc.number SUB_MNB_BPT_0351
     * @tc.desc   key '' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010029 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('sm')), String('110'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('sm'))).assertEqual('110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('lg')), String('130'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('lg'))).assertEqual('130');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010029 end');
    });

    /**
     * @tc.name   testBptKeyVol010030
     * @tc.number SUB_MNB_BPT_0352
     * @tc.desc   key 'SM' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010030 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('sm')), String('110'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('sm'))).assertEqual('110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('lg')), String('130'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('lg'))).assertEqual('130');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010030 end');
    });

    /**
     * @tc.name   testBptKeyVol010031
     * @tc.number SUB_MNB_BPT_0353
     * @tc.desc   key 'Md' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010031 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('Md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('sm')), String('110'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('sm'))).assertEqual('110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('lg')), String('130'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('lg'))).assertEqual('130');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010031 end');
    });

    /**
     * @tc.name   testBptKeyVol010032
     * @tc.number SUB_MNB_BPT_0354
     * @tc.desc   key 'LG' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010032 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('LG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('sm')), String('110'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('sm'))).assertEqual('110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('lg')), String('130'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('lg'))).assertEqual('130');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010032 end');
    });

    /**
     * @tc.name   testBptKeyVol010033
     * @tc.number SUB_MNB_BPT_0355
     * @tc.desc   key ' sm' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010033 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue(' sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('sm')), String('110'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('sm'))).assertEqual('110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('lg')), String('130'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('lg'))).assertEqual('130');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010033 end');
    });

    /**
     * @tc.name   testBptKeyVol010034
     * @tc.number SUB_MNB_BPT_0356
     * @tc.desc   key 'lg ' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010034 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('lg ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('sm')), String('110'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('sm'))).assertEqual('110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('lg')), String('130'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('lg'))).assertEqual('130');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010034 end');
    });

    /**
     * @tc.name   testBptKeyVol010035
     * @tc.number SUB_MNB_BPT_0357
     * @tc.desc   key 'xs' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010035 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('xs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('sm')), String('110'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('sm'))).assertEqual('110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('lg')), String('130'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('lg'))).assertEqual('130');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010035 end');
    });

    /**
     * @tc.name   testBptKeyVol010036
     * @tc.number SUB_MNB_BPT_0358
     * @tc.desc   key 'xl' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010036 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('xl');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('sm')), String('110'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('sm'))).assertEqual('110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('lg')), String('130'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('lg'))).assertEqual('130');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010036 end');
    });

    /**
     * @tc.name   testBptKeyVol010037
     * @tc.number SUB_MNB_BPT_0359
     * @tc.desc   key 'xxl' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010037 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('xxl');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('sm')), String('110'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('sm'))).assertEqual('110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('lg')), String('130'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('lg'))).assertEqual('130');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010037 end');
    });

    /**
     * @tc.name   testBptKeyVol010038
     * @tc.number SUB_MNB_BPT_0360
     * @tc.desc   key '0' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010038 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('sm')), String('110'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('sm'))).assertEqual('110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('lg')), String('130'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('lg'))).assertEqual('130');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(110, 120, 130).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(110, 120, 130).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010038 end');
    });

  });
}
