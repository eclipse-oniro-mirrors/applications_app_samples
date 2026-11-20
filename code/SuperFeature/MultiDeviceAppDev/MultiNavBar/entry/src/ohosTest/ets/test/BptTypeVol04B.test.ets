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

export default function bptTypeVol04BTest() {
  describe('MultiNavBarBptTypeVol04B', () => {

    /**
     * @tc.name   testBptTypeVol040039
     * @tc.number SUB_MNB_BPT_0286
     * @tc.desc   BreakpointType<number>(56/4/40) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040039 begin');
      const result: number | undefined = new BreakpointType<number>(56, 4, 40).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('40'));
      expect(String(result)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(56, 4, 40).GetValue('sm')), String('56'));
      expect(String(new BreakpointType<number>(56, 4, 40).GetValue('sm'))).assertEqual('56');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(56, 4, 40).GetValue('md')), String('4'));
      expect(String(new BreakpointType<number>(56, 4, 40).GetValue('md'))).assertEqual('4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(56, 4, 40).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(56, 4, 40).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(56, 4, 40).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(56, 4, 40).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040039 end');
    });

    /**
     * @tc.name   testBptTypeVol040040
     * @tc.number SUB_MNB_BPT_0287
     * @tc.desc   BreakpointType<number>(18/2/7) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040040 begin');
      const result: number | undefined = new BreakpointType<number>(18, 2, 7).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('18'));
      expect(String(result)).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(18, 2, 7).GetValue('md')), String('2'));
      expect(String(new BreakpointType<number>(18, 2, 7).GetValue('md'))).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(18, 2, 7).GetValue('lg')), String('7'));
      expect(String(new BreakpointType<number>(18, 2, 7).GetValue('lg'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(18, 2, 7).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(18, 2, 7).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(18, 2, 7).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(18, 2, 7).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040040 end');
    });

    /**
     * @tc.name   testBptTypeVol040041
     * @tc.number SUB_MNB_BPT_0288
     * @tc.desc   BreakpointType<number>(12/3/10) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040041 begin');
      const result: number | undefined = new BreakpointType<number>(12, 3, 10).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('3'));
      expect(String(result)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 3, 10).GetValue('sm')), String('12'));
      expect(String(new BreakpointType<number>(12, 3, 10).GetValue('sm'))).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 3, 10).GetValue('lg')), String('10'));
      expect(String(new BreakpointType<number>(12, 3, 10).GetValue('lg'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 3, 10).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(12, 3, 10).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 3, 10).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(12, 3, 10).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040041 end');
    });

    /**
     * @tc.name   testBptTypeVol040042
     * @tc.number SUB_MNB_BPT_0289
     * @tc.desc   BreakpointType<number>(8/5/14) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040042 begin');
      const result: number | undefined = new BreakpointType<number>(8, 5, 14).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('14'));
      expect(String(result)).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(8, 5, 14).GetValue('sm')), String('8'));
      expect(String(new BreakpointType<number>(8, 5, 14).GetValue('sm'))).assertEqual('8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(8, 5, 14).GetValue('md')), String('5'));
      expect(String(new BreakpointType<number>(8, 5, 14).GetValue('md'))).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(8, 5, 14).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(8, 5, 14).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(8, 5, 14).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(8, 5, 14).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040042 end');
    });

    /**
     * @tc.name   testBptTypeVol040043
     * @tc.number SUB_MNB_BPT_0290
     * @tc.desc   BreakpointType<number>(44/6/284) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040043 begin');
      const result: number | undefined = new BreakpointType<number>(44, 6, 284).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('44'));
      expect(String(result)).assertEqual('44');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(44, 6, 284).GetValue('md')), String('6'));
      expect(String(new BreakpointType<number>(44, 6, 284).GetValue('md'))).assertEqual('6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(44, 6, 284).GetValue('lg')), String('284'));
      expect(String(new BreakpointType<number>(44, 6, 284).GetValue('lg'))).assertEqual('284');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(44, 6, 284).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(44, 6, 284).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(44, 6, 284).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(44, 6, 284).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040043 end');
    });

    /**
     * @tc.name   testBptTypeVol040044
     * @tc.number SUB_MNB_BPT_0291
     * @tc.desc   BreakpointType<number>(0/24/138) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040044 begin');
      const result: number | undefined = new BreakpointType<number>(0, 24, 138).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('24'));
      expect(String(result)).assertEqual('24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 24, 138).GetValue('sm')), String('0'));
      expect(String(new BreakpointType<number>(0, 24, 138).GetValue('sm'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 24, 138).GetValue('lg')), String('138'));
      expect(String(new BreakpointType<number>(0, 24, 138).GetValue('lg'))).assertEqual('138');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 24, 138).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(0, 24, 138).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 24, 138).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(0, 24, 138).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040044 end');
    });

    /**
     * @tc.name   testBptTypeVol040045
     * @tc.number SUB_MNB_BPT_0292
     * @tc.desc   BreakpointType<number>(1/40/576) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040045 begin');
      const result: number | undefined = new BreakpointType<number>(1, 40, 576).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('576'));
      expect(String(result)).assertEqual('576');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 40, 576).GetValue('sm')), String('1'));
      expect(String(new BreakpointType<number>(1, 40, 576).GetValue('sm'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 40, 576).GetValue('md')), String('40'));
      expect(String(new BreakpointType<number>(1, 40, 576).GetValue('md'))).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 40, 576).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(1, 40, 576).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 40, 576).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(1, 40, 576).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040045 end');
    });

    /**
     * @tc.name   testBptTypeVol040046
     * @tc.number SUB_MNB_BPT_0293
     * @tc.desc   BreakpointType<number>(4/7/16) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040046 begin');
      const result: number | undefined = new BreakpointType<number>(4, 7, 16).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('4'));
      expect(String(result)).assertEqual('4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(4, 7, 16).GetValue('md')), String('7'));
      expect(String(new BreakpointType<number>(4, 7, 16).GetValue('md'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(4, 7, 16).GetValue('lg')), String('16'));
      expect(String(new BreakpointType<number>(4, 7, 16).GetValue('lg'))).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(4, 7, 16).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(4, 7, 16).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(4, 7, 16).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(4, 7, 16).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040046 end');
    });

    /**
     * @tc.name   testBptTypeVol040047
     * @tc.number SUB_MNB_BPT_0294
     * @tc.desc   BreakpointType<number>(2/10/22) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040047 begin');
      const result: number | undefined = new BreakpointType<number>(2, 10, 22).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10'));
      expect(String(result)).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2, 10, 22).GetValue('sm')), String('2'));
      expect(String(new BreakpointType<number>(2, 10, 22).GetValue('sm'))).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2, 10, 22).GetValue('lg')), String('22'));
      expect(String(new BreakpointType<number>(2, 10, 22).GetValue('lg'))).assertEqual('22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2, 10, 22).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(2, 10, 22).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2, 10, 22).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(2, 10, 22).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040047 end');
    });

    /**
     * @tc.name   testBptTypeVol040048
     * @tc.number SUB_MNB_BPT_0295
     * @tc.desc   BreakpointType<number>(3/14/106) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040048 begin');
      const result: number | undefined = new BreakpointType<number>(3, 14, 106).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('106'));
      expect(String(result)).assertEqual('106');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 14, 106).GetValue('sm')), String('3'));
      expect(String(new BreakpointType<number>(3, 14, 106).GetValue('sm'))).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 14, 106).GetValue('md')), String('14'));
      expect(String(new BreakpointType<number>(3, 14, 106).GetValue('md'))).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 14, 106).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(3, 14, 106).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 14, 106).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(3, 14, 106).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040048 end');
    });

    /**
     * @tc.name   testBptTypeVol040049
     * @tc.number SUB_MNB_BPT_0296
     * @tc.desc   BreakpointType<number>(5/284/220) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040049 begin');
      const result: number | undefined = new BreakpointType<number>(5, 284, 220).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('5'));
      expect(String(result)).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(5, 284, 220).GetValue('md')), String('284'));
      expect(String(new BreakpointType<number>(5, 284, 220).GetValue('md'))).assertEqual('284');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(5, 284, 220).GetValue('lg')), String('220'));
      expect(String(new BreakpointType<number>(5, 284, 220).GetValue('lg'))).assertEqual('220');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(5, 284, 220).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(5, 284, 220).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(5, 284, 220).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(5, 284, 220).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040049 end');
    });

    /**
     * @tc.name   testBptTypeVol040050
     * @tc.number SUB_MNB_BPT_0297
     * @tc.desc   BreakpointType<number>(6/138/48) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040050 begin');
      const result: number | undefined = new BreakpointType<number>(6, 138, 48).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('138'));
      expect(String(result)).assertEqual('138');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(6, 138, 48).GetValue('sm')), String('6'));
      expect(String(new BreakpointType<number>(6, 138, 48).GetValue('sm'))).assertEqual('6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(6, 138, 48).GetValue('lg')), String('48'));
      expect(String(new BreakpointType<number>(6, 138, 48).GetValue('lg'))).assertEqual('48');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(6, 138, 48).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(6, 138, 48).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(6, 138, 48).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(6, 138, 48).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040050 end');
    });

    /**
     * @tc.name   testBptTypeVol040051
     * @tc.number SUB_MNB_BPT_0298
     * @tc.desc   BreakpointType<number>(24/576/56) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040051 begin');
      const result: number | undefined = new BreakpointType<number>(24, 576, 56).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('56'));
      expect(String(result)).assertEqual('56');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(24, 576, 56).GetValue('sm')), String('24'));
      expect(String(new BreakpointType<number>(24, 576, 56).GetValue('sm'))).assertEqual('24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(24, 576, 56).GetValue('md')), String('576'));
      expect(String(new BreakpointType<number>(24, 576, 56).GetValue('md'))).assertEqual('576');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(24, 576, 56).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(24, 576, 56).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(24, 576, 56).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(24, 576, 56).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040051 end');
    });

    /**
     * @tc.name   testBptTypeVol040052
     * @tc.number SUB_MNB_BPT_0299
     * @tc.desc   BreakpointType<number>(40/16/18) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040052 begin');
      const result: number | undefined = new BreakpointType<number>(40, 16, 18).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('40'));
      expect(String(result)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(40, 16, 18).GetValue('md')), String('16'));
      expect(String(new BreakpointType<number>(40, 16, 18).GetValue('md'))).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(40, 16, 18).GetValue('lg')), String('18'));
      expect(String(new BreakpointType<number>(40, 16, 18).GetValue('lg'))).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(40, 16, 18).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(40, 16, 18).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(40, 16, 18).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(40, 16, 18).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040052 end');
    });

    /**
     * @tc.name   testBptTypeVol040053
     * @tc.number SUB_MNB_BPT_0300
     * @tc.desc   BreakpointType<number>(7/22/12) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040053 begin');
      const result: number | undefined = new BreakpointType<number>(7, 22, 12).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('22'));
      expect(String(result)).assertEqual('22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 22, 12).GetValue('sm')), String('7'));
      expect(String(new BreakpointType<number>(7, 22, 12).GetValue('sm'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 22, 12).GetValue('lg')), String('12'));
      expect(String(new BreakpointType<number>(7, 22, 12).GetValue('lg'))).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 22, 12).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(7, 22, 12).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 22, 12).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(7, 22, 12).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040053 end');
    });

    /**
     * @tc.name   testBptTypeVol040054
     * @tc.number SUB_MNB_BPT_0301
     * @tc.desc   BreakpointType<number>(10/106/8) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040054 begin');
      const result: number | undefined = new BreakpointType<number>(10, 106, 8).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('8'));
      expect(String(result)).assertEqual('8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 106, 8).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 106, 8).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 106, 8).GetValue('md')), String('106'));
      expect(String(new BreakpointType<number>(10, 106, 8).GetValue('md'))).assertEqual('106');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 106, 8).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 106, 8).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 106, 8).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 106, 8).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040054 end');
    });

    /**
     * @tc.name   testBptTypeVol040055
     * @tc.number SUB_MNB_BPT_0302
     * @tc.desc   BreakpointType<number>(14/220/44) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040055 begin');
      const result: number | undefined = new BreakpointType<number>(14, 220, 44).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('14'));
      expect(String(result)).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(14, 220, 44).GetValue('md')), String('220'));
      expect(String(new BreakpointType<number>(14, 220, 44).GetValue('md'))).assertEqual('220');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(14, 220, 44).GetValue('lg')), String('44'));
      expect(String(new BreakpointType<number>(14, 220, 44).GetValue('lg'))).assertEqual('44');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(14, 220, 44).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(14, 220, 44).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(14, 220, 44).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(14, 220, 44).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040055 end');
    });

    /**
     * @tc.name   testBptTypeVol040056
     * @tc.number SUB_MNB_BPT_0303
     * @tc.desc   BreakpointType<number>(284/48/0) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040056 begin');
      const result: number | undefined = new BreakpointType<number>(284, 48, 0).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48'));
      expect(String(result)).assertEqual('48');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(284, 48, 0).GetValue('sm')), String('284'));
      expect(String(new BreakpointType<number>(284, 48, 0).GetValue('sm'))).assertEqual('284');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(284, 48, 0).GetValue('lg')), String('0'));
      expect(String(new BreakpointType<number>(284, 48, 0).GetValue('lg'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(284, 48, 0).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(284, 48, 0).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(284, 48, 0).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(284, 48, 0).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040056 end');
    });

    /**
     * @tc.name   testBptTypeVol040057
     * @tc.number SUB_MNB_BPT_0304
     * @tc.desc   BreakpointType<number>(138/56/1) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040057 begin');
      const result: number | undefined = new BreakpointType<number>(138, 56, 1).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(String(result)).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 56, 1).GetValue('sm')), String('138'));
      expect(String(new BreakpointType<number>(138, 56, 1).GetValue('sm'))).assertEqual('138');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 56, 1).GetValue('md')), String('56'));
      expect(String(new BreakpointType<number>(138, 56, 1).GetValue('md'))).assertEqual('56');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 56, 1).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(138, 56, 1).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 56, 1).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(138, 56, 1).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040057 end');
    });

    /**
     * @tc.name   testBptTypeVol040058
     * @tc.number SUB_MNB_BPT_0305
     * @tc.desc   BreakpointType<number>(576/18/4) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040058 begin');
      const result: number | undefined = new BreakpointType<number>(576, 18, 4).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('576'));
      expect(String(result)).assertEqual('576');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(576, 18, 4).GetValue('md')), String('18'));
      expect(String(new BreakpointType<number>(576, 18, 4).GetValue('md'))).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(576, 18, 4).GetValue('lg')), String('4'));
      expect(String(new BreakpointType<number>(576, 18, 4).GetValue('lg'))).assertEqual('4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(576, 18, 4).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(576, 18, 4).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(576, 18, 4).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(576, 18, 4).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040058 end');
    });

    /**
     * @tc.name   testBptTypeVol040059
     * @tc.number SUB_MNB_BPT_0306
     * @tc.desc   BreakpointType<number>(16/12/2) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040059 begin');
      const result: number | undefined = new BreakpointType<number>(16, 12, 2).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('12'));
      expect(String(result)).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 12, 2).GetValue('sm')), String('16'));
      expect(String(new BreakpointType<number>(16, 12, 2).GetValue('sm'))).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 12, 2).GetValue('lg')), String('2'));
      expect(String(new BreakpointType<number>(16, 12, 2).GetValue('lg'))).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 12, 2).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(16, 12, 2).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 12, 2).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(16, 12, 2).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040059 end');
    });

    /**
     * @tc.name   testBptTypeVol040060
     * @tc.number SUB_MNB_BPT_0307
     * @tc.desc   BreakpointType<number>(22/8/3) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040060 begin');
      const result: number | undefined = new BreakpointType<number>(22, 8, 3).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('3'));
      expect(String(result)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(22, 8, 3).GetValue('sm')), String('22'));
      expect(String(new BreakpointType<number>(22, 8, 3).GetValue('sm'))).assertEqual('22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(22, 8, 3).GetValue('md')), String('8'));
      expect(String(new BreakpointType<number>(22, 8, 3).GetValue('md'))).assertEqual('8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(22, 8, 3).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(22, 8, 3).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(22, 8, 3).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(22, 8, 3).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040060 end');
    });

    /**
     * @tc.name   testBptTypeVol040061
     * @tc.number SUB_MNB_BPT_0308
     * @tc.desc   BreakpointType<number>(106/44/5) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040061 begin');
      const result: number | undefined = new BreakpointType<number>(106, 44, 5).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('106'));
      expect(String(result)).assertEqual('106');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 44, 5).GetValue('md')), String('44'));
      expect(String(new BreakpointType<number>(106, 44, 5).GetValue('md'))).assertEqual('44');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 44, 5).GetValue('lg')), String('5'));
      expect(String(new BreakpointType<number>(106, 44, 5).GetValue('lg'))).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 44, 5).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(106, 44, 5).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 44, 5).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(106, 44, 5).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040061 end');
    });

    /**
     * @tc.name   testBptTypeVol040062
     * @tc.number SUB_MNB_BPT_0309
     * @tc.desc   BreakpointType<number>(220/0/6) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040062 begin');
      const result: number | undefined = new BreakpointType<number>(220, 0, 6).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(220, 0, 6).GetValue('sm')), String('220'));
      expect(String(new BreakpointType<number>(220, 0, 6).GetValue('sm'))).assertEqual('220');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(220, 0, 6).GetValue('lg')), String('6'));
      expect(String(new BreakpointType<number>(220, 0, 6).GetValue('lg'))).assertEqual('6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(220, 0, 6).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(220, 0, 6).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(220, 0, 6).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(220, 0, 6).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040062 end');
    });

    /**
     * @tc.name   testBptTypeVol040063
     * @tc.number SUB_MNB_BPT_0310
     * @tc.desc   BreakpointType<number>(48/1/24) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040063 begin');
      const result: number | undefined = new BreakpointType<number>(48, 1, 24).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('24'));
      expect(String(result)).assertEqual('24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 1, 24).GetValue('sm')), String('48'));
      expect(String(new BreakpointType<number>(48, 1, 24).GetValue('sm'))).assertEqual('48');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 1, 24).GetValue('md')), String('1'));
      expect(String(new BreakpointType<number>(48, 1, 24).GetValue('md'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 1, 24).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(48, 1, 24).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 1, 24).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(48, 1, 24).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040063 end');
    });

    /**
     * @tc.name   testBptTypeVol040064
     * @tc.number SUB_MNB_BPT_0311
     * @tc.desc   BreakpointType<number>(56/4/40) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040064 begin');
      const result: number | undefined = new BreakpointType<number>(56, 4, 40).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('56'));
      expect(String(result)).assertEqual('56');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(56, 4, 40).GetValue('md')), String('4'));
      expect(String(new BreakpointType<number>(56, 4, 40).GetValue('md'))).assertEqual('4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(56, 4, 40).GetValue('lg')), String('40'));
      expect(String(new BreakpointType<number>(56, 4, 40).GetValue('lg'))).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(56, 4, 40).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(56, 4, 40).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(56, 4, 40).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(56, 4, 40).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040064 end');
    });

    /**
     * @tc.name   testBptTypeVol040065
     * @tc.number SUB_MNB_BPT_0312
     * @tc.desc   BreakpointType<number>(18/2/7) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040065 begin');
      const result: number | undefined = new BreakpointType<number>(18, 2, 7).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(18, 2, 7).GetValue('sm')), String('18'));
      expect(String(new BreakpointType<number>(18, 2, 7).GetValue('sm'))).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(18, 2, 7).GetValue('lg')), String('7'));
      expect(String(new BreakpointType<number>(18, 2, 7).GetValue('lg'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(18, 2, 7).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(18, 2, 7).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(18, 2, 7).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(18, 2, 7).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040065 end');
    });

    /**
     * @tc.name   testBptTypeVol040066
     * @tc.number SUB_MNB_BPT_0313
     * @tc.desc   BreakpointType<number>(12/3/10) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040066 begin');
      const result: number | undefined = new BreakpointType<number>(12, 3, 10).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10'));
      expect(String(result)).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 3, 10).GetValue('sm')), String('12'));
      expect(String(new BreakpointType<number>(12, 3, 10).GetValue('sm'))).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 3, 10).GetValue('md')), String('3'));
      expect(String(new BreakpointType<number>(12, 3, 10).GetValue('md'))).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 3, 10).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(12, 3, 10).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 3, 10).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(12, 3, 10).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040066 end');
    });

    /**
     * @tc.name   testBptTypeVol040067
     * @tc.number SUB_MNB_BPT_0314
     * @tc.desc   BreakpointType<number>(8/5/14) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040067 begin');
      const result: number | undefined = new BreakpointType<number>(8, 5, 14).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('8'));
      expect(String(result)).assertEqual('8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(8, 5, 14).GetValue('md')), String('5'));
      expect(String(new BreakpointType<number>(8, 5, 14).GetValue('md'))).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(8, 5, 14).GetValue('lg')), String('14'));
      expect(String(new BreakpointType<number>(8, 5, 14).GetValue('lg'))).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(8, 5, 14).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(8, 5, 14).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(8, 5, 14).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(8, 5, 14).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040067 end');
    });

    /**
     * @tc.name   testBptTypeVol040068
     * @tc.number SUB_MNB_BPT_0315
     * @tc.desc   BreakpointType<number>(44/6/284) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040068 begin');
      const result: number | undefined = new BreakpointType<number>(44, 6, 284).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('6'));
      expect(String(result)).assertEqual('6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(44, 6, 284).GetValue('sm')), String('44'));
      expect(String(new BreakpointType<number>(44, 6, 284).GetValue('sm'))).assertEqual('44');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(44, 6, 284).GetValue('lg')), String('284'));
      expect(String(new BreakpointType<number>(44, 6, 284).GetValue('lg'))).assertEqual('284');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(44, 6, 284).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(44, 6, 284).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(44, 6, 284).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(44, 6, 284).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040068 end');
    });

    /**
     * @tc.name   testBptTypeVol040069
     * @tc.number SUB_MNB_BPT_0316
     * @tc.desc   BreakpointType<number>(0/24/138) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040069 begin');
      const result: number | undefined = new BreakpointType<number>(0, 24, 138).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('138'));
      expect(String(result)).assertEqual('138');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 24, 138).GetValue('sm')), String('0'));
      expect(String(new BreakpointType<number>(0, 24, 138).GetValue('sm'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 24, 138).GetValue('md')), String('24'));
      expect(String(new BreakpointType<number>(0, 24, 138).GetValue('md'))).assertEqual('24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 24, 138).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(0, 24, 138).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 24, 138).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(0, 24, 138).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040069 end');
    });

    /**
     * @tc.name   testBptTypeVol040070
     * @tc.number SUB_MNB_BPT_0317
     * @tc.desc   BreakpointType<number>(1/40/576) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040070 begin');
      const result: number | undefined = new BreakpointType<number>(1, 40, 576).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(String(result)).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 40, 576).GetValue('md')), String('40'));
      expect(String(new BreakpointType<number>(1, 40, 576).GetValue('md'))).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 40, 576).GetValue('lg')), String('576'));
      expect(String(new BreakpointType<number>(1, 40, 576).GetValue('lg'))).assertEqual('576');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 40, 576).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(1, 40, 576).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 40, 576).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(1, 40, 576).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040070 end');
    });

    /**
     * @tc.name   testBptTypeVol040071
     * @tc.number SUB_MNB_BPT_0318
     * @tc.desc   BreakpointType<number>(4/7/16) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040071 begin');
      const result: number | undefined = new BreakpointType<number>(4, 7, 16).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('7'));
      expect(String(result)).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(4, 7, 16).GetValue('sm')), String('4'));
      expect(String(new BreakpointType<number>(4, 7, 16).GetValue('sm'))).assertEqual('4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(4, 7, 16).GetValue('lg')), String('16'));
      expect(String(new BreakpointType<number>(4, 7, 16).GetValue('lg'))).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(4, 7, 16).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(4, 7, 16).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(4, 7, 16).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(4, 7, 16).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040071 end');
    });

    /**
     * @tc.name   testBptTypeVol040072
     * @tc.number SUB_MNB_BPT_0319
     * @tc.desc   BreakpointType<number>(2/10/22) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040072 begin');
      const result: number | undefined = new BreakpointType<number>(2, 10, 22).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('22'));
      expect(String(result)).assertEqual('22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2, 10, 22).GetValue('sm')), String('2'));
      expect(String(new BreakpointType<number>(2, 10, 22).GetValue('sm'))).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2, 10, 22).GetValue('md')), String('10'));
      expect(String(new BreakpointType<number>(2, 10, 22).GetValue('md'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2, 10, 22).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(2, 10, 22).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2, 10, 22).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(2, 10, 22).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040072 end');
    });

    /**
     * @tc.name   testBptTypeVol040073
     * @tc.number SUB_MNB_BPT_0320
     * @tc.desc   BreakpointType<number>(3/14/106) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040073 begin');
      const result: number | undefined = new BreakpointType<number>(3, 14, 106).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('3'));
      expect(String(result)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 14, 106).GetValue('md')), String('14'));
      expect(String(new BreakpointType<number>(3, 14, 106).GetValue('md'))).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 14, 106).GetValue('lg')), String('106'));
      expect(String(new BreakpointType<number>(3, 14, 106).GetValue('lg'))).assertEqual('106');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 14, 106).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(3, 14, 106).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 14, 106).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(3, 14, 106).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040073 end');
    });

    /**
     * @tc.name   testBptTypeVol040074
     * @tc.number SUB_MNB_BPT_0321
     * @tc.desc   BreakpointType<number>(5/284/220) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040074 begin');
      const result: number | undefined = new BreakpointType<number>(5, 284, 220).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('284'));
      expect(String(result)).assertEqual('284');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(5, 284, 220).GetValue('sm')), String('5'));
      expect(String(new BreakpointType<number>(5, 284, 220).GetValue('sm'))).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(5, 284, 220).GetValue('lg')), String('220'));
      expect(String(new BreakpointType<number>(5, 284, 220).GetValue('lg'))).assertEqual('220');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(5, 284, 220).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(5, 284, 220).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(5, 284, 220).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(5, 284, 220).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040074 end');
    });

    /**
     * @tc.name   testBptTypeVol040075
     * @tc.number SUB_MNB_BPT_0322
     * @tc.desc   Anchor: the frozen style values 24/40/56 are positional and never swap slots
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040075 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(24, 40, 56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sm=%{public}s tabsSlot=%{public}s', String(sut.GetValue('sm')),
        String(sut.GetValue('lg')));
      expect(sut.GetValue('sm')).assertEqual(24);
      expect(sut.GetValue('lg')).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check sut.GetValue(\'sm\') === sut.GetValue(\'md\')');
      expect(sut.GetValue('sm') === sut.GetValue('md')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040075 end');
    });
  });
}
