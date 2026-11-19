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

export default function bptTypeVol03Test() {
  describe('MultiNavBarBptTypeVol03', () => {

    /**
     * @tc.name   testBptTypeVol030001
     * @tc.number SUB_MNB_BPT_0173
     * @tc.desc   BreakpointType<number>(0/-1/1) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030001 begin');
      const result: number | undefined = new BreakpointType<number>(0, -1, 1).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, -1, 1).GetValue('md')), String('-1'));
      expect(String(new BreakpointType<number>(0, -1, 1).GetValue('md'))).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, -1, 1).GetValue('lg')), String('1'));
      expect(String(new BreakpointType<number>(0, -1, 1).GetValue('lg'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, -1, 1).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(0, -1, 1).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, -1, 1).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(0, -1, 1).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030001 end');
    });

    /**
     * @tc.name   testBptTypeVol030002
     * @tc.number SUB_MNB_BPT_0174
     * @tc.desc   BreakpointType<number>(9007199254740991/-9007199254740991/0) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030002 begin');
      const result: number | undefined =
        new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('-9007199254740991'));
      expect(String(result)).assertEqual('-9007199254740991');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('sm')),
        String('9007199254740991'));
      expect(
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('sm'))
      ).assertEqual('9007199254740991');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('lg')), String('0'));
      expect(
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('lg'))
      ).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('SM')), String('undefined'));
      expect(
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('SM'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('smlg')),
        String('undefined'));
      expect(
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('smlg'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030002 end');
    });

    /**
     * @tc.name   testBptTypeVol030003
     * @tc.number SUB_MNB_BPT_0175
     * @tc.desc   BreakpointType<number>(1e+21/-1e+21/0) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030003 begin');
      const result: number | undefined = new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('sm')), String('1e+21'));
      expect(String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('sm'))).assertEqual('1e+21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('md')), String('-1e+21'));
      expect(String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('md'))).assertEqual('-1e+21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030003 end');
    });

    /**
     * @tc.name   testBptTypeVol030004
     * @tc.number SUB_MNB_BPT_0176
     * @tc.desc   BreakpointType<number>(NaN/0/1) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030004 begin');
      const result: number | undefined = new BreakpointType<number>(NaN, 0, 1).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('NaN'));
      expect(String(result)).assertEqual('NaN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(NaN, 0, 1).GetValue('md')), String('0'));
      expect(String(new BreakpointType<number>(NaN, 0, 1).GetValue('md'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(NaN, 0, 1).GetValue('lg')), String('1'));
      expect(String(new BreakpointType<number>(NaN, 0, 1).GetValue('lg'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(NaN, 0, 1).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(NaN, 0, 1).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(NaN, 0, 1).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(NaN, 0, 1).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030004 end');
    });

    /**
     * @tc.name   testBptTypeVol030005
     * @tc.number SUB_MNB_BPT_0177
     * @tc.desc   BreakpointType<number>(Infinity/-Infinity/0) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030005 begin');
      const result: number | undefined = new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-Infinity'));
      expect(String(result)).assertEqual('-Infinity');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('sm')), String('Infinity'));
      expect(String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('sm'))).assertEqual('Infinity');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('lg')), String('0'));
      expect(String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('lg'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030005 end');
    });

    /**
     * @tc.name   testBptTypeVol030006
     * @tc.number SUB_MNB_BPT_0178
     * @tc.desc   BreakpointType<number>(0.5/-0.5/0) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030006 begin');
      const result: number | undefined = new BreakpointType<number>(0.5, -0.5, 0).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('sm')), String('0.5'));
      expect(String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('sm'))).assertEqual('0.5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('md')), String('-0.5'));
      expect(String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('md'))).assertEqual('-0.5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030006 end');
    });

    /**
     * @tc.name   testBptTypeVol030007
     * @tc.number SUB_MNB_BPT_0179
     * @tc.desc   BreakpointType<number>(1e-7/2e-7/3e-7) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030007 begin');
      const result: number | undefined = new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1e-7'));
      expect(String(result)).assertEqual('1e-7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('md')), String('2e-7'));
      expect(String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('md'))).assertEqual('2e-7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('lg')), String('3e-7'));
      expect(String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('lg'))).assertEqual('3e-7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030007 end');
    });

    /**
     * @tc.name   testBptTypeVol030008
     * @tc.number SUB_MNB_BPT_0180
     * @tc.desc   BreakpointType<number>(MAX_NUMBER/-MAX_NUMBER/0) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030008 begin');
      const result: number | undefined =
        new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('-1.7976931348623157e+308'));
      expect(String(result)).assertEqual('-1.7976931348623157e+308');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('sm')),
        String('1.7976931348623157e+308'));
      expect(
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('sm'))
      ).assertEqual('1.7976931348623157e+308');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('lg')),
        String('0'));
      expect(
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('lg'))
      ).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('s')),
        String('undefined'));
      expect(
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('s'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('Md')),
        String('undefined'));
      expect(
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('Md'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030008 end');
    });

    /**
     * @tc.name   testBptTypeVol030009
     * @tc.number SUB_MNB_BPT_0181
     * @tc.desc   BreakpointType<number>(2.220446049250313e-16/0/1) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030009 begin');
      const result: number | undefined = new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(String(result)).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('sm')),
        String('2.220446049250313e-16'));
      expect(
        String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('sm'))
      ).assertEqual('2.220446049250313e-16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('md')), String('0'));
      expect(String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('md'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030009 end');
    });

    /**
     * @tc.name   testBptTypeVol030010
     * @tc.number SUB_MNB_BPT_0182
     * @tc.desc   BreakpointType<number>(2147483647/-2147483648/0) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030010 begin');
      const result: number | undefined = new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2147483647'));
      expect(String(result)).assertEqual('2147483647');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('md')), String('-2147483648'));
      expect(String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('md'))).assertEqual('-2147483648');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('lg')), String('0'));
      expect(String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('lg'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030010 end');
    });

    /**
     * @tc.name   testBptTypeVol030011
     * @tc.number SUB_MNB_BPT_0183
     * @tc.desc   BreakpointType<number>(999999/-999999/1) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030011 begin');
      const result: number | undefined = new BreakpointType<number>(999999, -999999, 1).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-999999'));
      expect(String(result)).assertEqual('-999999');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(999999, -999999, 1).GetValue('sm')), String('999999'));
      expect(String(new BreakpointType<number>(999999, -999999, 1).GetValue('sm'))).assertEqual('999999');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(999999, -999999, 1).GetValue('lg')), String('1'));
      expect(String(new BreakpointType<number>(999999, -999999, 1).GetValue('lg'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(999999, -999999, 1).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(999999, -999999, 1).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(999999, -999999, 1).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(999999, -999999, 1).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030011 end');
    });

    /**
     * @tc.name   testBptTypeVol030012
     * @tc.number SUB_MNB_BPT_0184
     * @tc.desc   BreakpointType<number>(65/66/67) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030012 begin');
      const result: number | undefined = new BreakpointType<number>(65, 66, 67).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('67'));
      expect(String(result)).assertEqual('67');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(65, 66, 67).GetValue('sm')), String('65'));
      expect(String(new BreakpointType<number>(65, 66, 67).GetValue('sm'))).assertEqual('65');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(65, 66, 67).GetValue('md')), String('66'));
      expect(String(new BreakpointType<number>(65, 66, 67).GetValue('md'))).assertEqual('66');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(65, 66, 67).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(65, 66, 67).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(65, 66, 67).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(65, 66, 67).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030012 end');
    });

    /**
     * @tc.name   testBptTypeVol030013
     * @tc.number SUB_MNB_BPT_0185
     * @tc.desc   BreakpointType<number>(1024/2048/4096) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030013 begin');
      const result: number | undefined = new BreakpointType<number>(1024, 2048, 4096).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1024'));
      expect(String(result)).assertEqual('1024');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1024, 2048, 4096).GetValue('md')), String('2048'));
      expect(String(new BreakpointType<number>(1024, 2048, 4096).GetValue('md'))).assertEqual('2048');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1024, 2048, 4096).GetValue('lg')), String('4096'));
      expect(String(new BreakpointType<number>(1024, 2048, 4096).GetValue('lg'))).assertEqual('4096');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1024, 2048, 4096).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(1024, 2048, 4096).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1024, 2048, 4096).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(1024, 2048, 4096).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030013 end');
    });

    /**
     * @tc.name   testBptTypeVol030014
     * @tc.number SUB_MNB_BPT_0186
     * @tc.desc   BreakpointType<number>(0/0/1) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030014 begin');
      const result: number | undefined = new BreakpointType<number>(0, 0, 1).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 0, 1).GetValue('sm')), String('0'));
      expect(String(new BreakpointType<number>(0, 0, 1).GetValue('sm'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 0, 1).GetValue('lg')), String('1'));
      expect(String(new BreakpointType<number>(0, 0, 1).GetValue('lg'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 0, 1).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(0, 0, 1).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 0, 1).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(0, 0, 1).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030014 end');
    });

    /**
     * @tc.name   testBptTypeVol030015
     * @tc.number SUB_MNB_BPT_0187
     * @tc.desc   BreakpointType<number>(0.1/0.2/0.3) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030015 begin');
      const result: number | undefined = new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0.3'));
      expect(String(result)).assertEqual('0.3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('sm')), String('0.1'));
      expect(String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('sm'))).assertEqual('0.1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('md')), String('0.2'));
      expect(String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('md'))).assertEqual('0.2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030015 end');
    });

    /**
     * @tc.name   testBptTypeVol030016
     * @tc.number SUB_MNB_BPT_0188
     * @tc.desc   BreakpointType<number>(7/7/7) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030016 begin');
      const result: number | undefined = new BreakpointType<number>(7, 7, 7).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('7'));
      expect(String(result)).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 7, 7).GetValue('md')), String('7'));
      expect(String(new BreakpointType<number>(7, 7, 7).GetValue('md'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 7, 7).GetValue('lg')), String('7'));
      expect(String(new BreakpointType<number>(7, 7, 7).GetValue('lg'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 7, 7).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(7, 7, 7).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 7, 7).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(7, 7, 7).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030016 end');
    });

    /**
     * @tc.name   testBptTypeVol030017
     * @tc.number SUB_MNB_BPT_0189
     * @tc.desc   BreakpointType<number>(16/24/32) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030017 begin');
      const result: number | undefined = new BreakpointType<number>(16, 24, 32).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('24'));
      expect(String(result)).assertEqual('24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 24, 32).GetValue('sm')), String('16'));
      expect(String(new BreakpointType<number>(16, 24, 32).GetValue('sm'))).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 24, 32).GetValue('lg')), String('32'));
      expect(String(new BreakpointType<number>(16, 24, 32).GetValue('lg'))).assertEqual('32');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 24, 32).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(16, 24, 32).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 24, 32).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(16, 24, 32).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030017 end');
    });

    /**
     * @tc.name   testBptTypeVol030018
     * @tc.number SUB_MNB_BPT_0190
     * @tc.desc   BreakpointType<number>(48/56/64) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030018 begin');
      const result: number | undefined = new BreakpointType<number>(48, 56, 64).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('64'));
      expect(String(result)).assertEqual('64');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 56, 64).GetValue('sm')), String('48'));
      expect(String(new BreakpointType<number>(48, 56, 64).GetValue('sm'))).assertEqual('48');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 56, 64).GetValue('md')), String('56'));
      expect(String(new BreakpointType<number>(48, 56, 64).GetValue('md'))).assertEqual('56');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 56, 64).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(48, 56, 64).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 56, 64).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(48, 56, 64).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030018 end');
    });

    /**
     * @tc.name   testBptTypeVol030019
     * @tc.number SUB_MNB_BPT_0191
     * @tc.desc   BreakpointType<number>(12/18/24) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030019 begin');
      const result: number | undefined = new BreakpointType<number>(12, 18, 24).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('12'));
      expect(String(result)).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 18, 24).GetValue('md')), String('18'));
      expect(String(new BreakpointType<number>(12, 18, 24).GetValue('md'))).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 18, 24).GetValue('lg')), String('24'));
      expect(String(new BreakpointType<number>(12, 18, 24).GetValue('lg'))).assertEqual('24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 18, 24).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(12, 18, 24).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 18, 24).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(12, 18, 24).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030019 end');
    });

    /**
     * @tc.name   testBptTypeVol030020
     * @tc.number SUB_MNB_BPT_0192
     * @tc.desc   BreakpointType<number>(10/14/16) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030020 begin');
      const result: number | undefined = new BreakpointType<number>(10, 14, 16).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('14'));
      expect(String(result)).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 14, 16).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 14, 16).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 14, 16).GetValue('lg')), String('16'));
      expect(String(new BreakpointType<number>(10, 14, 16).GetValue('lg'))).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 14, 16).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 14, 16).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 14, 16).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 14, 16).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030020 end');
    });

    /**
     * @tc.name   testBptTypeVol030021
     * @tc.number SUB_MNB_BPT_0193
     * @tc.desc   BreakpointType<number>(106/220/284) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030021 begin');
      const result: number | undefined = new BreakpointType<number>(106, 220, 284).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('284'));
      expect(String(result)).assertEqual('284');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 220, 284).GetValue('sm')), String('106'));
      expect(String(new BreakpointType<number>(106, 220, 284).GetValue('sm'))).assertEqual('106');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 220, 284).GetValue('md')), String('220'));
      expect(String(new BreakpointType<number>(106, 220, 284).GetValue('md'))).assertEqual('220');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 220, 284).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(106, 220, 284).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 220, 284).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(106, 220, 284).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030021 end');
    });

    /**
     * @tc.name   testBptTypeVol030022
     * @tc.number SUB_MNB_BPT_0194
     * @tc.desc   BreakpointType<number>(138/576/0) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030022 begin');
      const result: number | undefined = new BreakpointType<number>(138, 576, 0).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('138'));
      expect(String(result)).assertEqual('138');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 576, 0).GetValue('md')), String('576'));
      expect(String(new BreakpointType<number>(138, 576, 0).GetValue('md'))).assertEqual('576');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 576, 0).GetValue('lg')), String('0'));
      expect(String(new BreakpointType<number>(138, 576, 0).GetValue('lg'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 576, 0).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(138, 576, 0).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 576, 0).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(138, 576, 0).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030022 end');
    });

    /**
     * @tc.name   testBptTypeVol030023
     * @tc.number SUB_MNB_BPT_0195
     * @tc.desc   BreakpointType<number>(1/10/100) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030023 begin');
      const result: number | undefined = new BreakpointType<number>(1, 10, 100).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10'));
      expect(String(result)).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 10, 100).GetValue('sm')), String('1'));
      expect(String(new BreakpointType<number>(1, 10, 100).GetValue('sm'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 10, 100).GetValue('lg')), String('100'));
      expect(String(new BreakpointType<number>(1, 10, 100).GetValue('lg'))).assertEqual('100');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 10, 100).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(1, 10, 100).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 10, 100).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(1, 10, 100).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030023 end');
    });

    /**
     * @tc.name   testBptTypeVol030024
     * @tc.number SUB_MNB_BPT_0196
     * @tc.desc   BreakpointType<number>(1000/10000/100000) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030024 begin');
      const result: number | undefined = new BreakpointType<number>(1000, 10000, 100000).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('100000'));
      expect(String(result)).assertEqual('100000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1000, 10000, 100000).GetValue('sm')), String('1000'));
      expect(String(new BreakpointType<number>(1000, 10000, 100000).GetValue('sm'))).assertEqual('1000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1000, 10000, 100000).GetValue('md')), String('10000'));
      expect(String(new BreakpointType<number>(1000, 10000, 100000).GetValue('md'))).assertEqual('10000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1000, 10000, 100000).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(1000, 10000, 100000).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1000, 10000, 100000).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(1000, 10000, 100000).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030024 end');
    });

    /**
     * @tc.name   testBptTypeVol030025
     * @tc.number SUB_MNB_BPT_0197
     * @tc.desc   BreakpointType<number>(3/5/7) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030025 begin');
      const result: number | undefined = new BreakpointType<number>(3, 5, 7).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('3'));
      expect(String(result)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 5, 7).GetValue('md')), String('5'));
      expect(String(new BreakpointType<number>(3, 5, 7).GetValue('md'))).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 5, 7).GetValue('lg')), String('7'));
      expect(String(new BreakpointType<number>(3, 5, 7).GetValue('lg'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 5, 7).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(3, 5, 7).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 5, 7).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(3, 5, 7).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030025 end');
    });

    /**
     * @tc.name   testBptTypeVol030026
     * @tc.number SUB_MNB_BPT_0198
     * @tc.desc   BreakpointType<number>(0/-1/1) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030026 begin');
      const result: number | undefined = new BreakpointType<number>(0, -1, 1).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(String(result)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, -1, 1).GetValue('sm')), String('0'));
      expect(String(new BreakpointType<number>(0, -1, 1).GetValue('sm'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, -1, 1).GetValue('lg')), String('1'));
      expect(String(new BreakpointType<number>(0, -1, 1).GetValue('lg'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, -1, 1).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(0, -1, 1).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, -1, 1).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(0, -1, 1).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030026 end');
    });

    /**
     * @tc.name   testBptTypeVol030027
     * @tc.number SUB_MNB_BPT_0199
     * @tc.desc   BreakpointType<number>(9007199254740991/-9007199254740991/0) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030027 begin');
      const result: number | undefined =
        new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('sm')),
        String('9007199254740991'));
      expect(
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('sm'))
      ).assertEqual('9007199254740991');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('md')),
        String('-9007199254740991'));
      expect(
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('md'))
      ).assertEqual('-9007199254740991');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('Md')), String('undefined'));
      expect(
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('Md'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('md\t')),
        String('undefined'));
      expect(
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('md\t'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030027 end');
    });

    /**
     * @tc.name   testBptTypeVol030028
     * @tc.number SUB_MNB_BPT_0200
     * @tc.desc   BreakpointType<number>(1e+21/-1e+21/0) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030028 begin');
      const result: number | undefined = new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1e+21'));
      expect(String(result)).assertEqual('1e+21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('md')), String('-1e+21'));
      expect(String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('md'))).assertEqual('-1e+21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('lg')), String('0'));
      expect(String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('lg'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030028 end');
    });

    /**
     * @tc.name   testBptTypeVol030029
     * @tc.number SUB_MNB_BPT_0201
     * @tc.desc   BreakpointType<number>(NaN/0/1) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030029 begin');
      const result: number | undefined = new BreakpointType<number>(NaN, 0, 1).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(NaN, 0, 1).GetValue('sm')), String('NaN'));
      expect(String(new BreakpointType<number>(NaN, 0, 1).GetValue('sm'))).assertEqual('NaN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(NaN, 0, 1).GetValue('lg')), String('1'));
      expect(String(new BreakpointType<number>(NaN, 0, 1).GetValue('lg'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(NaN, 0, 1).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(NaN, 0, 1).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(NaN, 0, 1).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(NaN, 0, 1).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030029 end');
    });

    /**
     * @tc.name   testBptTypeVol030030
     * @tc.number SUB_MNB_BPT_0202
     * @tc.desc   BreakpointType<number>(Infinity/-Infinity/0) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030030 begin');
      const result: number | undefined = new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('sm')), String('Infinity'));
      expect(String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('sm'))).assertEqual('Infinity');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('md')), String('-Infinity'));
      expect(String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('md'))).assertEqual('-Infinity');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030030 end');
    });

    /**
     * @tc.name   testBptTypeVol030031
     * @tc.number SUB_MNB_BPT_0203
     * @tc.desc   BreakpointType<number>(0.5/-0.5/0) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030031 begin');
      const result: number | undefined = new BreakpointType<number>(0.5, -0.5, 0).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0.5'));
      expect(String(result)).assertEqual('0.5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('md')), String('-0.5'));
      expect(String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('md'))).assertEqual('-0.5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('lg')), String('0'));
      expect(String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('lg'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030031 end');
    });

    /**
     * @tc.name   testBptTypeVol030032
     * @tc.number SUB_MNB_BPT_0204
     * @tc.desc   BreakpointType<number>(1e-7/2e-7/3e-7) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030032 begin');
      const result: number | undefined = new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2e-7'));
      expect(String(result)).assertEqual('2e-7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('sm')), String('1e-7'));
      expect(String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('sm'))).assertEqual('1e-7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('lg')), String('3e-7'));
      expect(String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('lg'))).assertEqual('3e-7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030032 end');
    });

    /**
     * @tc.name   testBptTypeVol030033
     * @tc.number SUB_MNB_BPT_0205
     * @tc.desc   BreakpointType<number>(MAX_NUMBER/-MAX_NUMBER/0) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030033 begin');
      const result: number | undefined =
        new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('sm')),
        String('1.7976931348623157e+308'));
      expect(
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('sm'))
      ).assertEqual('1.7976931348623157e+308');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('md')),
        String('-1.7976931348623157e+308'));
      expect(
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('md'))
      ).assertEqual('-1.7976931348623157e+308');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('smlg')),
        String('undefined'));
      expect(
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('smlg'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('xs')),
        String('undefined'));
      expect(
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('xs'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030033 end');
    });

    /**
     * @tc.name   testBptTypeVol030034
     * @tc.number SUB_MNB_BPT_0206
     * @tc.desc   BreakpointType<number>(2.220446049250313e-16/0/1) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030034 begin');
      const result: number | undefined = new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('2.220446049250313e-16'));
      expect(String(result)).assertEqual('2.220446049250313e-16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('md')), String('0'));
      expect(String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('md'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('lg')), String('1'));
      expect(String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('lg'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030034 end');
    });

    /**
     * @tc.name   testBptTypeVol030035
     * @tc.number SUB_MNB_BPT_0207
     * @tc.desc   BreakpointType<number>(2147483647/-2147483648/0) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030035 begin');
      const result: number | undefined = new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-2147483648'));
      expect(String(result)).assertEqual('-2147483648');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('sm')), String('2147483647'));
      expect(String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('sm'))).assertEqual('2147483647');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('lg')), String('0'));
      expect(String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('lg'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030035 end');
    });

    /**
     * @tc.name   testBptTypeVol030036
     * @tc.number SUB_MNB_BPT_0208
     * @tc.desc   BreakpointType<number>(999999/-999999/1) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030036 begin');
      const result: number | undefined = new BreakpointType<number>(999999, -999999, 1).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(String(result)).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(999999, -999999, 1).GetValue('sm')), String('999999'));
      expect(String(new BreakpointType<number>(999999, -999999, 1).GetValue('sm'))).assertEqual('999999');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(999999, -999999, 1).GetValue('md')), String('-999999'));
      expect(String(new BreakpointType<number>(999999, -999999, 1).GetValue('md'))).assertEqual('-999999');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(999999, -999999, 1).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(999999, -999999, 1).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(999999, -999999, 1).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(999999, -999999, 1).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030036 end');
    });

    /**
     * @tc.name   testBptTypeVol030037
     * @tc.number SUB_MNB_BPT_0209
     * @tc.desc   BreakpointType<number>(65/66/67) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030037 begin');
      const result: number | undefined = new BreakpointType<number>(65, 66, 67).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('65'));
      expect(String(result)).assertEqual('65');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(65, 66, 67).GetValue('md')), String('66'));
      expect(String(new BreakpointType<number>(65, 66, 67).GetValue('md'))).assertEqual('66');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(65, 66, 67).GetValue('lg')), String('67'));
      expect(String(new BreakpointType<number>(65, 66, 67).GetValue('lg'))).assertEqual('67');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(65, 66, 67).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(65, 66, 67).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(65, 66, 67).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(65, 66, 67).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030037 end');
    });

    /**
     * @tc.name   testBptTypeVol030038
     * @tc.number SUB_MNB_BPT_0210
     * @tc.desc   BreakpointType<number>(1024/2048/4096) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030038 begin');
      const result: number | undefined = new BreakpointType<number>(1024, 2048, 4096).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2048'));
      expect(String(result)).assertEqual('2048');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1024, 2048, 4096).GetValue('sm')), String('1024'));
      expect(String(new BreakpointType<number>(1024, 2048, 4096).GetValue('sm'))).assertEqual('1024');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1024, 2048, 4096).GetValue('lg')), String('4096'));
      expect(String(new BreakpointType<number>(1024, 2048, 4096).GetValue('lg'))).assertEqual('4096');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1024, 2048, 4096).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(1024, 2048, 4096).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1024, 2048, 4096).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(1024, 2048, 4096).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030038 end');
    });

  });
}
