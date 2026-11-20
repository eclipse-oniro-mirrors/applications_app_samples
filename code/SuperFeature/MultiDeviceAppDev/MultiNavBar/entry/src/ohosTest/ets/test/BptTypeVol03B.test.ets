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

// @volume rule=input-value basis=main-frozen cases=37
// Volume cases, see section 4 of ohosTest.md for the generation rule. Hand-written anchor cases must be added
// to the same describe and marked with an @tc.desc starting with 'Anchor:'.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function bptTypeVol03BTest() {
  describe('MultiNavBarBptTypeVol03B', () => {

    /**
     * @tc.name   testBptTypeVol030039
     * @tc.number SUB_MNB_BPT_0211
     * @tc.desc   BreakpointType<number>(0/0/1) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030039 begin');
      const result: number | undefined = new BreakpointType<number>(0, 0, 1).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(String(result)).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 0, 1).GetValue('sm')), String('0'));
      expect(String(new BreakpointType<number>(0, 0, 1).GetValue('sm'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 0, 1).GetValue('md')), String('0'));
      expect(String(new BreakpointType<number>(0, 0, 1).GetValue('md'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 0, 1).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(0, 0, 1).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 0, 1).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(0, 0, 1).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030039 end');
    });

    /**
     * @tc.name   testBptTypeVol030040
     * @tc.number SUB_MNB_BPT_0212
     * @tc.desc   BreakpointType<number>(0.1/0.2/0.3) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030040 begin');
      const result: number | undefined = new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0.1'));
      expect(String(result)).assertEqual('0.1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('md')), String('0.2'));
      expect(String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('md'))).assertEqual('0.2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('lg')), String('0.3'));
      expect(String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('lg'))).assertEqual('0.3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030040 end');
    });

    /**
     * @tc.name   testBptTypeVol030041
     * @tc.number SUB_MNB_BPT_0213
     * @tc.desc   BreakpointType<number>(7/7/7) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030041 begin');
      const result: number | undefined = new BreakpointType<number>(7, 7, 7).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('7'));
      expect(String(result)).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 7, 7).GetValue('sm')), String('7'));
      expect(String(new BreakpointType<number>(7, 7, 7).GetValue('sm'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 7, 7).GetValue('lg')), String('7'));
      expect(String(new BreakpointType<number>(7, 7, 7).GetValue('lg'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 7, 7).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(7, 7, 7).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 7, 7).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(7, 7, 7).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030041 end');
    });

    /**
     * @tc.name   testBptTypeVol030042
     * @tc.number SUB_MNB_BPT_0214
     * @tc.desc   BreakpointType<number>(16/24/32) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030042 begin');
      const result: number | undefined = new BreakpointType<number>(16, 24, 32).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('32'));
      expect(String(result)).assertEqual('32');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 24, 32).GetValue('sm')), String('16'));
      expect(String(new BreakpointType<number>(16, 24, 32).GetValue('sm'))).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 24, 32).GetValue('md')), String('24'));
      expect(String(new BreakpointType<number>(16, 24, 32).GetValue('md'))).assertEqual('24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 24, 32).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(16, 24, 32).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 24, 32).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(16, 24, 32).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030042 end');
    });

    /**
     * @tc.name   testBptTypeVol030043
     * @tc.number SUB_MNB_BPT_0215
     * @tc.desc   BreakpointType<number>(48/56/64) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030043 begin');
      const result: number | undefined = new BreakpointType<number>(48, 56, 64).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48'));
      expect(String(result)).assertEqual('48');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 56, 64).GetValue('md')), String('56'));
      expect(String(new BreakpointType<number>(48, 56, 64).GetValue('md'))).assertEqual('56');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 56, 64).GetValue('lg')), String('64'));
      expect(String(new BreakpointType<number>(48, 56, 64).GetValue('lg'))).assertEqual('64');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 56, 64).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(48, 56, 64).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 56, 64).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(48, 56, 64).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030043 end');
    });

    /**
     * @tc.name   testBptTypeVol030044
     * @tc.number SUB_MNB_BPT_0216
     * @tc.desc   BreakpointType<number>(12/18/24) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030044 begin');
      const result: number | undefined = new BreakpointType<number>(12, 18, 24).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('18'));
      expect(String(result)).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 18, 24).GetValue('sm')), String('12'));
      expect(String(new BreakpointType<number>(12, 18, 24).GetValue('sm'))).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 18, 24).GetValue('lg')), String('24'));
      expect(String(new BreakpointType<number>(12, 18, 24).GetValue('lg'))).assertEqual('24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 18, 24).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(12, 18, 24).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 18, 24).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(12, 18, 24).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030044 end');
    });

    /**
     * @tc.name   testBptTypeVol030045
     * @tc.number SUB_MNB_BPT_0217
     * @tc.desc   BreakpointType<number>(10/14/16) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030045 begin');
      const result: number | undefined = new BreakpointType<number>(10, 14, 16).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('16'));
      expect(String(result)).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 14, 16).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 14, 16).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 14, 16).GetValue('md')), String('14'));
      expect(String(new BreakpointType<number>(10, 14, 16).GetValue('md'))).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 14, 16).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 14, 16).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 14, 16).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 14, 16).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030045 end');
    });

    /**
     * @tc.name   testBptTypeVol030046
     * @tc.number SUB_MNB_BPT_0218
     * @tc.desc   BreakpointType<number>(106/220/284) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030046 begin');
      const result: number | undefined = new BreakpointType<number>(106, 220, 284).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('106'));
      expect(String(result)).assertEqual('106');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 220, 284).GetValue('md')), String('220'));
      expect(String(new BreakpointType<number>(106, 220, 284).GetValue('md'))).assertEqual('220');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 220, 284).GetValue('lg')), String('284'));
      expect(String(new BreakpointType<number>(106, 220, 284).GetValue('lg'))).assertEqual('284');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 220, 284).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(106, 220, 284).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 220, 284).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(106, 220, 284).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030046 end');
    });

    /**
     * @tc.name   testBptTypeVol030047
     * @tc.number SUB_MNB_BPT_0219
     * @tc.desc   BreakpointType<number>(138/576/0) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030047 begin');
      const result: number | undefined = new BreakpointType<number>(138, 576, 0).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('576'));
      expect(String(result)).assertEqual('576');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 576, 0).GetValue('sm')), String('138'));
      expect(String(new BreakpointType<number>(138, 576, 0).GetValue('sm'))).assertEqual('138');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 576, 0).GetValue('lg')), String('0'));
      expect(String(new BreakpointType<number>(138, 576, 0).GetValue('lg'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 576, 0).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(138, 576, 0).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 576, 0).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(138, 576, 0).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030047 end');
    });

    /**
     * @tc.name   testBptTypeVol030048
     * @tc.number SUB_MNB_BPT_0220
     * @tc.desc   BreakpointType<number>(1/10/100) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030048 begin');
      const result: number | undefined = new BreakpointType<number>(1, 10, 100).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('100'));
      expect(String(result)).assertEqual('100');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 10, 100).GetValue('sm')), String('1'));
      expect(String(new BreakpointType<number>(1, 10, 100).GetValue('sm'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 10, 100).GetValue('md')), String('10'));
      expect(String(new BreakpointType<number>(1, 10, 100).GetValue('md'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 10, 100).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(1, 10, 100).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 10, 100).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(1, 10, 100).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030048 end');
    });

    /**
     * @tc.name   testBptTypeVol030049
     * @tc.number SUB_MNB_BPT_0221
     * @tc.desc   BreakpointType<number>(1000/10000/100000) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030049 begin');
      const result: number | undefined = new BreakpointType<number>(1000, 10000, 100000).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1000'));
      expect(String(result)).assertEqual('1000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1000, 10000, 100000).GetValue('md')), String('10000'));
      expect(String(new BreakpointType<number>(1000, 10000, 100000).GetValue('md'))).assertEqual('10000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1000, 10000, 100000).GetValue('lg')), String('100000'));
      expect(String(new BreakpointType<number>(1000, 10000, 100000).GetValue('lg'))).assertEqual('100000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1000, 10000, 100000).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(1000, 10000, 100000).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1000, 10000, 100000).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(1000, 10000, 100000).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030049 end');
    });

    /**
     * @tc.name   testBptTypeVol030050
     * @tc.number SUB_MNB_BPT_0222
     * @tc.desc   BreakpointType<number>(3/5/7) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030050 begin');
      const result: number | undefined = new BreakpointType<number>(3, 5, 7).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('5'));
      expect(String(result)).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 5, 7).GetValue('sm')), String('3'));
      expect(String(new BreakpointType<number>(3, 5, 7).GetValue('sm'))).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 5, 7).GetValue('lg')), String('7'));
      expect(String(new BreakpointType<number>(3, 5, 7).GetValue('lg'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 5, 7).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(3, 5, 7).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 5, 7).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(3, 5, 7).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030050 end');
    });

    /**
     * @tc.name   testBptTypeVol030051
     * @tc.number SUB_MNB_BPT_0223
     * @tc.desc   BreakpointType<number>(0/-1/1) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030051 begin');
      const result: number | undefined = new BreakpointType<number>(0, -1, 1).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(String(result)).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, -1, 1).GetValue('sm')), String('0'));
      expect(String(new BreakpointType<number>(0, -1, 1).GetValue('sm'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, -1, 1).GetValue('md')), String('-1'));
      expect(String(new BreakpointType<number>(0, -1, 1).GetValue('md'))).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, -1, 1).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(0, -1, 1).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, -1, 1).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(0, -1, 1).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030051 end');
    });

    /**
     * @tc.name   testBptTypeVol030052
     * @tc.number SUB_MNB_BPT_0224
     * @tc.desc   BreakpointType<number>(9007199254740991/-9007199254740991/0) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030052 begin');
      const result: number | undefined =
        new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('9007199254740991'));
      expect(String(result)).assertEqual('9007199254740991');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('md')),
        String('-9007199254740991'));
      expect(
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('md'))
      ).assertEqual('-9007199254740991');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('lg')), String('0'));
      expect(
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('lg'))
      ).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue(' sm')),
        String('undefined'));
      expect(
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue(' sm'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('Md')), String('undefined'));
      expect(
        String(new BreakpointType<number>(9007199254740991, -9007199254740991, 0).GetValue('Md'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030052 end');
    });

    /**
     * @tc.name   testBptTypeVol030053
     * @tc.number SUB_MNB_BPT_0225
     * @tc.desc   BreakpointType<number>(1e+21/-1e+21/0) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030053 begin');
      const result: number | undefined = new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1e+21'));
      expect(String(result)).assertEqual('-1e+21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('sm')), String('1e+21'));
      expect(String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('sm'))).assertEqual('1e+21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('lg')), String('0'));
      expect(String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('lg'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(1e+21, -1e+21, 0).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030053 end');
    });

    /**
     * @tc.name   testBptTypeVol030054
     * @tc.number SUB_MNB_BPT_0226
     * @tc.desc   BreakpointType<number>(NaN/0/1) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030054 begin');
      const result: number | undefined = new BreakpointType<number>(NaN, 0, 1).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(String(result)).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(NaN, 0, 1).GetValue('sm')), String('NaN'));
      expect(String(new BreakpointType<number>(NaN, 0, 1).GetValue('sm'))).assertEqual('NaN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(NaN, 0, 1).GetValue('md')), String('0'));
      expect(String(new BreakpointType<number>(NaN, 0, 1).GetValue('md'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(NaN, 0, 1).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(NaN, 0, 1).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(NaN, 0, 1).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(NaN, 0, 1).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030054 end');
    });

    /**
     * @tc.name   testBptTypeVol030055
     * @tc.number SUB_MNB_BPT_0227
     * @tc.desc   BreakpointType<number>(Infinity/-Infinity/0) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030055 begin');
      const result: number | undefined = new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Infinity'));
      expect(String(result)).assertEqual('Infinity');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('md')), String('-Infinity'));
      expect(String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('md'))).assertEqual('-Infinity');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('lg')), String('0'));
      expect(String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('lg'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(Infinity, -Infinity, 0).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030055 end');
    });

    /**
     * @tc.name   testBptTypeVol030056
     * @tc.number SUB_MNB_BPT_0228
     * @tc.desc   BreakpointType<number>(0.5/-0.5/0) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030056 begin');
      const result: number | undefined = new BreakpointType<number>(0.5, -0.5, 0).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-0.5'));
      expect(String(result)).assertEqual('-0.5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('sm')), String('0.5'));
      expect(String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('sm'))).assertEqual('0.5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('lg')), String('0'));
      expect(String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('lg'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(0.5, -0.5, 0).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030056 end');
    });

    /**
     * @tc.name   testBptTypeVol030057
     * @tc.number SUB_MNB_BPT_0229
     * @tc.desc   BreakpointType<number>(1e-7/2e-7/3e-7) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030057 begin');
      const result: number | undefined = new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('3e-7'));
      expect(String(result)).assertEqual('3e-7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('sm')), String('1e-7'));
      expect(String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('sm'))).assertEqual('1e-7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('md')), String('2e-7'));
      expect(String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('md'))).assertEqual('2e-7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(1e-7, 2e-7, 3e-7).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030057 end');
    });

    /**
     * @tc.name   testBptTypeVol030058
     * @tc.number SUB_MNB_BPT_0230
     * @tc.desc   BreakpointType<number>(MAX_NUMBER/-MAX_NUMBER/0) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030058 begin');
      const result: number | undefined =
        new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('1.7976931348623157e+308'));
      expect(String(result)).assertEqual('1.7976931348623157e+308');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('md')),
        String('-1.7976931348623157e+308'));
      expect(
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('md'))
      ).assertEqual('-1.7976931348623157e+308');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('lg')),
        String('0'));
      expect(
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('lg'))
      ).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('tab')),
        String('undefined'));
      expect(
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('tab'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('smlg')),
        String('undefined'));
      expect(
        String(new BreakpointType<number>(1.7976931348623157e+308, -1.7976931348623157e+308, 0).GetValue('smlg'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030058 end');
    });

    /**
     * @tc.name   testBptTypeVol030059
     * @tc.number SUB_MNB_BPT_0231
     * @tc.desc   BreakpointType<number>(2.220446049250313e-16/0/1) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030059 begin');
      const result: number | undefined = new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('sm')),
        String('2.220446049250313e-16'));
      expect(
        String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('sm'))
      ).assertEqual('2.220446049250313e-16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('lg')), String('1'));
      expect(String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('lg'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('sm sm')), String('undefined'));
      expect(
        String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('sm sm'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(2.220446049250313e-16, 0, 1).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030059 end');
    });

    /**
     * @tc.name   testBptTypeVol030060
     * @tc.number SUB_MNB_BPT_0232
     * @tc.desc   BreakpointType<number>(2147483647/-2147483648/0) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030060 begin');
      const result: number | undefined = new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('sm')), String('2147483647'));
      expect(String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('sm'))).assertEqual('2147483647');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('md')), String('-2147483648'));
      expect(String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('md'))).assertEqual('-2147483648');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(2147483647, -2147483648, 0).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030060 end');
    });

    /**
     * @tc.name   testBptTypeVol030061
     * @tc.number SUB_MNB_BPT_0233
     * @tc.desc   BreakpointType<number>(999999/-999999/1) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030061 begin');
      const result: number | undefined = new BreakpointType<number>(999999, -999999, 1).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('999999'));
      expect(String(result)).assertEqual('999999');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(999999, -999999, 1).GetValue('md')), String('-999999'));
      expect(String(new BreakpointType<number>(999999, -999999, 1).GetValue('md'))).assertEqual('-999999');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(999999, -999999, 1).GetValue('lg')), String('1'));
      expect(String(new BreakpointType<number>(999999, -999999, 1).GetValue('lg'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(999999, -999999, 1).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(999999, -999999, 1).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(999999, -999999, 1).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(999999, -999999, 1).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030061 end');
    });

    /**
     * @tc.name   testBptTypeVol030062
     * @tc.number SUB_MNB_BPT_0234
     * @tc.desc   BreakpointType<number>(65/66/67) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030062 begin');
      const result: number | undefined = new BreakpointType<number>(65, 66, 67).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('66'));
      expect(String(result)).assertEqual('66');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(65, 66, 67).GetValue('sm')), String('65'));
      expect(String(new BreakpointType<number>(65, 66, 67).GetValue('sm'))).assertEqual('65');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(65, 66, 67).GetValue('lg')), String('67'));
      expect(String(new BreakpointType<number>(65, 66, 67).GetValue('lg'))).assertEqual('67');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(65, 66, 67).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(65, 66, 67).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(65, 66, 67).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(65, 66, 67).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030062 end');
    });

    /**
     * @tc.name   testBptTypeVol030063
     * @tc.number SUB_MNB_BPT_0235
     * @tc.desc   BreakpointType<number>(1024/2048/4096) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030063 begin');
      const result: number | undefined = new BreakpointType<number>(1024, 2048, 4096).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('4096'));
      expect(String(result)).assertEqual('4096');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1024, 2048, 4096).GetValue('sm')), String('1024'));
      expect(String(new BreakpointType<number>(1024, 2048, 4096).GetValue('sm'))).assertEqual('1024');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1024, 2048, 4096).GetValue('md')), String('2048'));
      expect(String(new BreakpointType<number>(1024, 2048, 4096).GetValue('md'))).assertEqual('2048');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1024, 2048, 4096).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(1024, 2048, 4096).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1024, 2048, 4096).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(1024, 2048, 4096).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030063 end');
    });

    /**
     * @tc.name   testBptTypeVol030064
     * @tc.number SUB_MNB_BPT_0236
     * @tc.desc   BreakpointType<number>(0/0/1) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030064 begin');
      const result: number | undefined = new BreakpointType<number>(0, 0, 1).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 0, 1).GetValue('md')), String('0'));
      expect(String(new BreakpointType<number>(0, 0, 1).GetValue('md'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 0, 1).GetValue('lg')), String('1'));
      expect(String(new BreakpointType<number>(0, 0, 1).GetValue('lg'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 0, 1).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(0, 0, 1).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 0, 1).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(0, 0, 1).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030064 end');
    });

    /**
     * @tc.name   testBptTypeVol030065
     * @tc.number SUB_MNB_BPT_0237
     * @tc.desc   BreakpointType<number>(0.1/0.2/0.3) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030065 begin');
      const result: number | undefined = new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0.2'));
      expect(String(result)).assertEqual('0.2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('sm')), String('0.1'));
      expect(String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('sm'))).assertEqual('0.1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('lg')), String('0.3'));
      expect(String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('lg'))).assertEqual('0.3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(0.1, 0.2, 0.3).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030065 end');
    });

    /**
     * @tc.name   testBptTypeVol030066
     * @tc.number SUB_MNB_BPT_0238
     * @tc.desc   BreakpointType<number>(7/7/7) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030066 begin');
      const result: number | undefined = new BreakpointType<number>(7, 7, 7).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('7'));
      expect(String(result)).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 7, 7).GetValue('sm')), String('7'));
      expect(String(new BreakpointType<number>(7, 7, 7).GetValue('sm'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 7, 7).GetValue('md')), String('7'));
      expect(String(new BreakpointType<number>(7, 7, 7).GetValue('md'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 7, 7).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(7, 7, 7).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 7, 7).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(7, 7, 7).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030066 end');
    });

    /**
     * @tc.name   testBptTypeVol030067
     * @tc.number SUB_MNB_BPT_0239
     * @tc.desc   BreakpointType<number>(16/24/32) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030067 begin');
      const result: number | undefined = new BreakpointType<number>(16, 24, 32).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('16'));
      expect(String(result)).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 24, 32).GetValue('md')), String('24'));
      expect(String(new BreakpointType<number>(16, 24, 32).GetValue('md'))).assertEqual('24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 24, 32).GetValue('lg')), String('32'));
      expect(String(new BreakpointType<number>(16, 24, 32).GetValue('lg'))).assertEqual('32');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 24, 32).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(16, 24, 32).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 24, 32).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(16, 24, 32).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030067 end');
    });

    /**
     * @tc.name   testBptTypeVol030068
     * @tc.number SUB_MNB_BPT_0240
     * @tc.desc   BreakpointType<number>(48/56/64) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030068 begin');
      const result: number | undefined = new BreakpointType<number>(48, 56, 64).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('56'));
      expect(String(result)).assertEqual('56');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 56, 64).GetValue('sm')), String('48'));
      expect(String(new BreakpointType<number>(48, 56, 64).GetValue('sm'))).assertEqual('48');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 56, 64).GetValue('lg')), String('64'));
      expect(String(new BreakpointType<number>(48, 56, 64).GetValue('lg'))).assertEqual('64');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 56, 64).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(48, 56, 64).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 56, 64).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(48, 56, 64).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030068 end');
    });

    /**
     * @tc.name   testBptTypeVol030069
     * @tc.number SUB_MNB_BPT_0241
     * @tc.desc   BreakpointType<number>(12/18/24) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030069 begin');
      const result: number | undefined = new BreakpointType<number>(12, 18, 24).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('24'));
      expect(String(result)).assertEqual('24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 18, 24).GetValue('sm')), String('12'));
      expect(String(new BreakpointType<number>(12, 18, 24).GetValue('sm'))).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 18, 24).GetValue('md')), String('18'));
      expect(String(new BreakpointType<number>(12, 18, 24).GetValue('md'))).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 18, 24).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(12, 18, 24).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 18, 24).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(12, 18, 24).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030069 end');
    });

    /**
     * @tc.name   testBptTypeVol030070
     * @tc.number SUB_MNB_BPT_0242
     * @tc.desc   BreakpointType<number>(10/14/16) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030070 begin');
      const result: number | undefined = new BreakpointType<number>(10, 14, 16).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10'));
      expect(String(result)).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 14, 16).GetValue('md')), String('14'));
      expect(String(new BreakpointType<number>(10, 14, 16).GetValue('md'))).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 14, 16).GetValue('lg')), String('16'));
      expect(String(new BreakpointType<number>(10, 14, 16).GetValue('lg'))).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 14, 16).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 14, 16).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 14, 16).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 14, 16).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030070 end');
    });

    /**
     * @tc.name   testBptTypeVol030071
     * @tc.number SUB_MNB_BPT_0243
     * @tc.desc   BreakpointType<number>(106/220/284) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030071 begin');
      const result: number | undefined = new BreakpointType<number>(106, 220, 284).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('220'));
      expect(String(result)).assertEqual('220');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 220, 284).GetValue('sm')), String('106'));
      expect(String(new BreakpointType<number>(106, 220, 284).GetValue('sm'))).assertEqual('106');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 220, 284).GetValue('lg')), String('284'));
      expect(String(new BreakpointType<number>(106, 220, 284).GetValue('lg'))).assertEqual('284');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 220, 284).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(106, 220, 284).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 220, 284).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(106, 220, 284).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030071 end');
    });

    /**
     * @tc.name   testBptTypeVol030072
     * @tc.number SUB_MNB_BPT_0244
     * @tc.desc   BreakpointType<number>(138/576/0) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030072 begin');
      const result: number | undefined = new BreakpointType<number>(138, 576, 0).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 576, 0).GetValue('sm')), String('138'));
      expect(String(new BreakpointType<number>(138, 576, 0).GetValue('sm'))).assertEqual('138');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 576, 0).GetValue('md')), String('576'));
      expect(String(new BreakpointType<number>(138, 576, 0).GetValue('md'))).assertEqual('576');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 576, 0).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(138, 576, 0).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 576, 0).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(138, 576, 0).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030072 end');
    });

    /**
     * @tc.name   testBptTypeVol030073
     * @tc.number SUB_MNB_BPT_0245
     * @tc.desc   BreakpointType<number>(1/10/100) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030073 begin');
      const result: number | undefined = new BreakpointType<number>(1, 10, 100).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(String(result)).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 10, 100).GetValue('md')), String('10'));
      expect(String(new BreakpointType<number>(1, 10, 100).GetValue('md'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 10, 100).GetValue('lg')), String('100'));
      expect(String(new BreakpointType<number>(1, 10, 100).GetValue('lg'))).assertEqual('100');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 10, 100).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(1, 10, 100).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 10, 100).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(1, 10, 100).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030073 end');
    });

    /**
     * @tc.name   testBptTypeVol030074
     * @tc.number SUB_MNB_BPT_0246
     * @tc.desc   BreakpointType<number>(1000/10000/100000) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030074 begin');
      const result: number | undefined = new BreakpointType<number>(1000, 10000, 100000).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10000'));
      expect(String(result)).assertEqual('10000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1000, 10000, 100000).GetValue('sm')), String('1000'));
      expect(String(new BreakpointType<number>(1000, 10000, 100000).GetValue('sm'))).assertEqual('1000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1000, 10000, 100000).GetValue('lg')), String('100000'));
      expect(String(new BreakpointType<number>(1000, 10000, 100000).GetValue('lg'))).assertEqual('100000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1000, 10000, 100000).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(1000, 10000, 100000).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1000, 10000, 100000).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(1000, 10000, 100000).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030074 end');
    });

    /**
     * @tc.name   testBptTypeVol030075
     * @tc.number SUB_MNB_BPT_0247
     * @tc.desc   Anchor: a NaN slot keeps its position instead of being treated as an absent value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol030075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030075 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(1, NaN, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'md=%{public}s lg=%{public}s', String(sut.GetValue('md')),
        String(sut.GetValue('lg')));
      expect(String(sut.GetValue('md'))).assertEqual('NaN');
      expect(String(sut.GetValue('lg'))).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check String(sut.GetValue(\'lg\')) === \'NaN\'');
      expect(String(sut.GetValue('lg')) === 'NaN').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol030075 end');
    });
  });
}
