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

export default function bptTypeVol01BTest() {
  describe('MultiNavBarBptTypeVol01B', () => {

    /**
     * @tc.name   testBptTypeVol010039
     * @tc.number SUB_MNB_BPT_0061
     * @tc.desc   BreakpointType<number>(39/1038/2038) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010039 begin');
      const result: number | undefined = new BreakpointType<number>(39, 1038, 2038).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2038'));
      expect(String(result)).assertEqual('2038');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(39, 1038, 2038).GetValue('sm')), String('39'));
      expect(String(new BreakpointType<number>(39, 1038, 2038).GetValue('sm'))).assertEqual('39');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(39, 1038, 2038).GetValue('md')), String('1038'));
      expect(String(new BreakpointType<number>(39, 1038, 2038).GetValue('md'))).assertEqual('1038');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(39, 1038, 2038).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(39, 1038, 2038).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(39, 1038, 2038).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(39, 1038, 2038).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010039 end');
    });

    /**
     * @tc.name   testBptTypeVol010040
     * @tc.number SUB_MNB_BPT_0062
     * @tc.desc   BreakpointType<number>(40/1039/2039) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010040 begin');
      const result: number | undefined = new BreakpointType<number>(40, 1039, 2039).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('40'));
      expect(String(result)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(40, 1039, 2039).GetValue('md')), String('1039'));
      expect(String(new BreakpointType<number>(40, 1039, 2039).GetValue('md'))).assertEqual('1039');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(40, 1039, 2039).GetValue('lg')), String('2039'));
      expect(String(new BreakpointType<number>(40, 1039, 2039).GetValue('lg'))).assertEqual('2039');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(40, 1039, 2039).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(40, 1039, 2039).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(40, 1039, 2039).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(40, 1039, 2039).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010040 end');
    });

    /**
     * @tc.name   testBptTypeVol010041
     * @tc.number SUB_MNB_BPT_0063
     * @tc.desc   BreakpointType<number>(41/1040/2040) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010041 begin');
      const result: number | undefined = new BreakpointType<number>(41, 1040, 2040).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1040'));
      expect(String(result)).assertEqual('1040');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(41, 1040, 2040).GetValue('sm')), String('41'));
      expect(String(new BreakpointType<number>(41, 1040, 2040).GetValue('sm'))).assertEqual('41');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(41, 1040, 2040).GetValue('lg')), String('2040'));
      expect(String(new BreakpointType<number>(41, 1040, 2040).GetValue('lg'))).assertEqual('2040');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(41, 1040, 2040).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(41, 1040, 2040).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(41, 1040, 2040).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(41, 1040, 2040).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010041 end');
    });

    /**
     * @tc.name   testBptTypeVol010042
     * @tc.number SUB_MNB_BPT_0064
     * @tc.desc   BreakpointType<number>(42/1041/2041) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010042 begin');
      const result: number | undefined = new BreakpointType<number>(42, 1041, 2041).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2041'));
      expect(String(result)).assertEqual('2041');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(42, 1041, 2041).GetValue('sm')), String('42'));
      expect(String(new BreakpointType<number>(42, 1041, 2041).GetValue('sm'))).assertEqual('42');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(42, 1041, 2041).GetValue('md')), String('1041'));
      expect(String(new BreakpointType<number>(42, 1041, 2041).GetValue('md'))).assertEqual('1041');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(42, 1041, 2041).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(42, 1041, 2041).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(42, 1041, 2041).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(42, 1041, 2041).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010042 end');
    });

    /**
     * @tc.name   testBptTypeVol010043
     * @tc.number SUB_MNB_BPT_0065
     * @tc.desc   BreakpointType<number>(43/1042/2042) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010043 begin');
      const result: number | undefined = new BreakpointType<number>(43, 1042, 2042).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('43'));
      expect(String(result)).assertEqual('43');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(43, 1042, 2042).GetValue('md')), String('1042'));
      expect(String(new BreakpointType<number>(43, 1042, 2042).GetValue('md'))).assertEqual('1042');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(43, 1042, 2042).GetValue('lg')), String('2042'));
      expect(String(new BreakpointType<number>(43, 1042, 2042).GetValue('lg'))).assertEqual('2042');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(43, 1042, 2042).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(43, 1042, 2042).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(43, 1042, 2042).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(43, 1042, 2042).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010043 end');
    });

    /**
     * @tc.name   testBptTypeVol010044
     * @tc.number SUB_MNB_BPT_0066
     * @tc.desc   BreakpointType<number>(44/1043/2043) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010044 begin');
      const result: number | undefined = new BreakpointType<number>(44, 1043, 2043).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1043'));
      expect(String(result)).assertEqual('1043');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(44, 1043, 2043).GetValue('sm')), String('44'));
      expect(String(new BreakpointType<number>(44, 1043, 2043).GetValue('sm'))).assertEqual('44');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(44, 1043, 2043).GetValue('lg')), String('2043'));
      expect(String(new BreakpointType<number>(44, 1043, 2043).GetValue('lg'))).assertEqual('2043');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(44, 1043, 2043).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(44, 1043, 2043).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(44, 1043, 2043).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(44, 1043, 2043).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010044 end');
    });

    /**
     * @tc.name   testBptTypeVol010045
     * @tc.number SUB_MNB_BPT_0067
     * @tc.desc   BreakpointType<number>(45/1044/2044) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010045 begin');
      const result: number | undefined = new BreakpointType<number>(45, 1044, 2044).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2044'));
      expect(String(result)).assertEqual('2044');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(45, 1044, 2044).GetValue('sm')), String('45'));
      expect(String(new BreakpointType<number>(45, 1044, 2044).GetValue('sm'))).assertEqual('45');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(45, 1044, 2044).GetValue('md')), String('1044'));
      expect(String(new BreakpointType<number>(45, 1044, 2044).GetValue('md'))).assertEqual('1044');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(45, 1044, 2044).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(45, 1044, 2044).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(45, 1044, 2044).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(45, 1044, 2044).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010045 end');
    });

    /**
     * @tc.name   testBptTypeVol010046
     * @tc.number SUB_MNB_BPT_0068
     * @tc.desc   BreakpointType<number>(46/1045/2045) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010046 begin');
      const result: number | undefined = new BreakpointType<number>(46, 1045, 2045).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('46'));
      expect(String(result)).assertEqual('46');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(46, 1045, 2045).GetValue('md')), String('1045'));
      expect(String(new BreakpointType<number>(46, 1045, 2045).GetValue('md'))).assertEqual('1045');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(46, 1045, 2045).GetValue('lg')), String('2045'));
      expect(String(new BreakpointType<number>(46, 1045, 2045).GetValue('lg'))).assertEqual('2045');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(46, 1045, 2045).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(46, 1045, 2045).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(46, 1045, 2045).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(46, 1045, 2045).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010046 end');
    });

    /**
     * @tc.name   testBptTypeVol010047
     * @tc.number SUB_MNB_BPT_0069
     * @tc.desc   BreakpointType<number>(47/1046/2046) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010047 begin');
      const result: number | undefined = new BreakpointType<number>(47, 1046, 2046).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1046'));
      expect(String(result)).assertEqual('1046');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(47, 1046, 2046).GetValue('sm')), String('47'));
      expect(String(new BreakpointType<number>(47, 1046, 2046).GetValue('sm'))).assertEqual('47');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(47, 1046, 2046).GetValue('lg')), String('2046'));
      expect(String(new BreakpointType<number>(47, 1046, 2046).GetValue('lg'))).assertEqual('2046');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(47, 1046, 2046).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(47, 1046, 2046).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(47, 1046, 2046).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(47, 1046, 2046).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010047 end');
    });

    /**
     * @tc.name   testBptTypeVol010048
     * @tc.number SUB_MNB_BPT_0070
     * @tc.desc   BreakpointType<number>(48/1047/2047) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010048 begin');
      const result: number | undefined = new BreakpointType<number>(48, 1047, 2047).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2047'));
      expect(String(result)).assertEqual('2047');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 1047, 2047).GetValue('sm')), String('48'));
      expect(String(new BreakpointType<number>(48, 1047, 2047).GetValue('sm'))).assertEqual('48');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 1047, 2047).GetValue('md')), String('1047'));
      expect(String(new BreakpointType<number>(48, 1047, 2047).GetValue('md'))).assertEqual('1047');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 1047, 2047).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(48, 1047, 2047).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 1047, 2047).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(48, 1047, 2047).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010048 end');
    });

    /**
     * @tc.name   testBptTypeVol010049
     * @tc.number SUB_MNB_BPT_0071
     * @tc.desc   BreakpointType<number>(49/1048/2048) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010049 begin');
      const result: number | undefined = new BreakpointType<number>(49, 1048, 2048).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('49'));
      expect(String(result)).assertEqual('49');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(49, 1048, 2048).GetValue('md')), String('1048'));
      expect(String(new BreakpointType<number>(49, 1048, 2048).GetValue('md'))).assertEqual('1048');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(49, 1048, 2048).GetValue('lg')), String('2048'));
      expect(String(new BreakpointType<number>(49, 1048, 2048).GetValue('lg'))).assertEqual('2048');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(49, 1048, 2048).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(49, 1048, 2048).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(49, 1048, 2048).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(49, 1048, 2048).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010049 end');
    });

    /**
     * @tc.name   testBptTypeVol010050
     * @tc.number SUB_MNB_BPT_0072
     * @tc.desc   BreakpointType<number>(50/1049/2049) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010050 begin');
      const result: number | undefined = new BreakpointType<number>(50, 1049, 2049).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1049'));
      expect(String(result)).assertEqual('1049');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(50, 1049, 2049).GetValue('sm')), String('50'));
      expect(String(new BreakpointType<number>(50, 1049, 2049).GetValue('sm'))).assertEqual('50');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(50, 1049, 2049).GetValue('lg')), String('2049'));
      expect(String(new BreakpointType<number>(50, 1049, 2049).GetValue('lg'))).assertEqual('2049');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(50, 1049, 2049).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(50, 1049, 2049).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(50, 1049, 2049).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(50, 1049, 2049).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010050 end');
    });

    /**
     * @tc.name   testBptTypeVol010051
     * @tc.number SUB_MNB_BPT_0073
     * @tc.desc   BreakpointType<number>(51/1050/2050) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010051 begin');
      const result: number | undefined = new BreakpointType<number>(51, 1050, 2050).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2050'));
      expect(String(result)).assertEqual('2050');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(51, 1050, 2050).GetValue('sm')), String('51'));
      expect(String(new BreakpointType<number>(51, 1050, 2050).GetValue('sm'))).assertEqual('51');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(51, 1050, 2050).GetValue('md')), String('1050'));
      expect(String(new BreakpointType<number>(51, 1050, 2050).GetValue('md'))).assertEqual('1050');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(51, 1050, 2050).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(51, 1050, 2050).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(51, 1050, 2050).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(51, 1050, 2050).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010051 end');
    });

    /**
     * @tc.name   testBptTypeVol010052
     * @tc.number SUB_MNB_BPT_0074
     * @tc.desc   BreakpointType<number>(52/1051/2051) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010052 begin');
      const result: number | undefined = new BreakpointType<number>(52, 1051, 2051).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('52'));
      expect(String(result)).assertEqual('52');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(52, 1051, 2051).GetValue('md')), String('1051'));
      expect(String(new BreakpointType<number>(52, 1051, 2051).GetValue('md'))).assertEqual('1051');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(52, 1051, 2051).GetValue('lg')), String('2051'));
      expect(String(new BreakpointType<number>(52, 1051, 2051).GetValue('lg'))).assertEqual('2051');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(52, 1051, 2051).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(52, 1051, 2051).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(52, 1051, 2051).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(52, 1051, 2051).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010052 end');
    });

    /**
     * @tc.name   testBptTypeVol010053
     * @tc.number SUB_MNB_BPT_0075
     * @tc.desc   BreakpointType<number>(53/1052/2052) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010053 begin');
      const result: number | undefined = new BreakpointType<number>(53, 1052, 2052).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1052'));
      expect(String(result)).assertEqual('1052');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(53, 1052, 2052).GetValue('sm')), String('53'));
      expect(String(new BreakpointType<number>(53, 1052, 2052).GetValue('sm'))).assertEqual('53');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(53, 1052, 2052).GetValue('lg')), String('2052'));
      expect(String(new BreakpointType<number>(53, 1052, 2052).GetValue('lg'))).assertEqual('2052');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(53, 1052, 2052).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(53, 1052, 2052).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(53, 1052, 2052).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(53, 1052, 2052).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010053 end');
    });

    /**
     * @tc.name   testBptTypeVol010054
     * @tc.number SUB_MNB_BPT_0076
     * @tc.desc   BreakpointType<number>(54/1053/2053) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010054 begin');
      const result: number | undefined = new BreakpointType<number>(54, 1053, 2053).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2053'));
      expect(String(result)).assertEqual('2053');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(54, 1053, 2053).GetValue('sm')), String('54'));
      expect(String(new BreakpointType<number>(54, 1053, 2053).GetValue('sm'))).assertEqual('54');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(54, 1053, 2053).GetValue('md')), String('1053'));
      expect(String(new BreakpointType<number>(54, 1053, 2053).GetValue('md'))).assertEqual('1053');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(54, 1053, 2053).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(54, 1053, 2053).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(54, 1053, 2053).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(54, 1053, 2053).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010054 end');
    });

    /**
     * @tc.name   testBptTypeVol010055
     * @tc.number SUB_MNB_BPT_0077
     * @tc.desc   BreakpointType<number>(55/1054/2054) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010055 begin');
      const result: number | undefined = new BreakpointType<number>(55, 1054, 2054).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('55'));
      expect(String(result)).assertEqual('55');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(55, 1054, 2054).GetValue('md')), String('1054'));
      expect(String(new BreakpointType<number>(55, 1054, 2054).GetValue('md'))).assertEqual('1054');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(55, 1054, 2054).GetValue('lg')), String('2054'));
      expect(String(new BreakpointType<number>(55, 1054, 2054).GetValue('lg'))).assertEqual('2054');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(55, 1054, 2054).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(55, 1054, 2054).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(55, 1054, 2054).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(55, 1054, 2054).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010055 end');
    });

    /**
     * @tc.name   testBptTypeVol010056
     * @tc.number SUB_MNB_BPT_0078
     * @tc.desc   BreakpointType<number>(56/1055/2055) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010056 begin');
      const result: number | undefined = new BreakpointType<number>(56, 1055, 2055).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1055'));
      expect(String(result)).assertEqual('1055');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(56, 1055, 2055).GetValue('sm')), String('56'));
      expect(String(new BreakpointType<number>(56, 1055, 2055).GetValue('sm'))).assertEqual('56');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(56, 1055, 2055).GetValue('lg')), String('2055'));
      expect(String(new BreakpointType<number>(56, 1055, 2055).GetValue('lg'))).assertEqual('2055');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(56, 1055, 2055).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(56, 1055, 2055).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(56, 1055, 2055).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(56, 1055, 2055).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010056 end');
    });

    /**
     * @tc.name   testBptTypeVol010057
     * @tc.number SUB_MNB_BPT_0079
     * @tc.desc   BreakpointType<number>(57/1056/2056) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010057 begin');
      const result: number | undefined = new BreakpointType<number>(57, 1056, 2056).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2056'));
      expect(String(result)).assertEqual('2056');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(57, 1056, 2056).GetValue('sm')), String('57'));
      expect(String(new BreakpointType<number>(57, 1056, 2056).GetValue('sm'))).assertEqual('57');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(57, 1056, 2056).GetValue('md')), String('1056'));
      expect(String(new BreakpointType<number>(57, 1056, 2056).GetValue('md'))).assertEqual('1056');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(57, 1056, 2056).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(57, 1056, 2056).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(57, 1056, 2056).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(57, 1056, 2056).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010057 end');
    });

    /**
     * @tc.name   testBptTypeVol010058
     * @tc.number SUB_MNB_BPT_0080
     * @tc.desc   BreakpointType<number>(58/1057/2057) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010058 begin');
      const result: number | undefined = new BreakpointType<number>(58, 1057, 2057).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('58'));
      expect(String(result)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(58, 1057, 2057).GetValue('md')), String('1057'));
      expect(String(new BreakpointType<number>(58, 1057, 2057).GetValue('md'))).assertEqual('1057');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(58, 1057, 2057).GetValue('lg')), String('2057'));
      expect(String(new BreakpointType<number>(58, 1057, 2057).GetValue('lg'))).assertEqual('2057');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(58, 1057, 2057).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(58, 1057, 2057).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(58, 1057, 2057).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(58, 1057, 2057).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010058 end');
    });

    /**
     * @tc.name   testBptTypeVol010059
     * @tc.number SUB_MNB_BPT_0081
     * @tc.desc   BreakpointType<number>(59/1058/2058) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010059 begin');
      const result: number | undefined = new BreakpointType<number>(59, 1058, 2058).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1058'));
      expect(String(result)).assertEqual('1058');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(59, 1058, 2058).GetValue('sm')), String('59'));
      expect(String(new BreakpointType<number>(59, 1058, 2058).GetValue('sm'))).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(59, 1058, 2058).GetValue('lg')), String('2058'));
      expect(String(new BreakpointType<number>(59, 1058, 2058).GetValue('lg'))).assertEqual('2058');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(59, 1058, 2058).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(59, 1058, 2058).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(59, 1058, 2058).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(59, 1058, 2058).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010059 end');
    });

    /**
     * @tc.name   testBptTypeVol010060
     * @tc.number SUB_MNB_BPT_0082
     * @tc.desc   BreakpointType<number>(60/1059/2059) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010060 begin');
      const result: number | undefined = new BreakpointType<number>(60, 1059, 2059).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2059'));
      expect(String(result)).assertEqual('2059');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(60, 1059, 2059).GetValue('sm')), String('60'));
      expect(String(new BreakpointType<number>(60, 1059, 2059).GetValue('sm'))).assertEqual('60');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(60, 1059, 2059).GetValue('md')), String('1059'));
      expect(String(new BreakpointType<number>(60, 1059, 2059).GetValue('md'))).assertEqual('1059');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(60, 1059, 2059).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(60, 1059, 2059).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(60, 1059, 2059).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(60, 1059, 2059).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010060 end');
    });

    /**
     * @tc.name   testBptTypeVol010061
     * @tc.number SUB_MNB_BPT_0083
     * @tc.desc   BreakpointType<number>(61/1060/2060) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010061 begin');
      const result: number | undefined = new BreakpointType<number>(61, 1060, 2060).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('61'));
      expect(String(result)).assertEqual('61');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(61, 1060, 2060).GetValue('md')), String('1060'));
      expect(String(new BreakpointType<number>(61, 1060, 2060).GetValue('md'))).assertEqual('1060');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(61, 1060, 2060).GetValue('lg')), String('2060'));
      expect(String(new BreakpointType<number>(61, 1060, 2060).GetValue('lg'))).assertEqual('2060');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(61, 1060, 2060).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(61, 1060, 2060).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(61, 1060, 2060).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(61, 1060, 2060).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010061 end');
    });

    /**
     * @tc.name   testBptTypeVol010062
     * @tc.number SUB_MNB_BPT_0084
     * @tc.desc   BreakpointType<number>(62/1061/2061) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010062 begin');
      const result: number | undefined = new BreakpointType<number>(62, 1061, 2061).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1061'));
      expect(String(result)).assertEqual('1061');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(62, 1061, 2061).GetValue('sm')), String('62'));
      expect(String(new BreakpointType<number>(62, 1061, 2061).GetValue('sm'))).assertEqual('62');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(62, 1061, 2061).GetValue('lg')), String('2061'));
      expect(String(new BreakpointType<number>(62, 1061, 2061).GetValue('lg'))).assertEqual('2061');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(62, 1061, 2061).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(62, 1061, 2061).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(62, 1061, 2061).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(62, 1061, 2061).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010062 end');
    });

    /**
     * @tc.name   testBptTypeVol010063
     * @tc.number SUB_MNB_BPT_0085
     * @tc.desc   BreakpointType<number>(63/1062/2062) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010063 begin');
      const result: number | undefined = new BreakpointType<number>(63, 1062, 2062).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2062'));
      expect(String(result)).assertEqual('2062');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(63, 1062, 2062).GetValue('sm')), String('63'));
      expect(String(new BreakpointType<number>(63, 1062, 2062).GetValue('sm'))).assertEqual('63');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(63, 1062, 2062).GetValue('md')), String('1062'));
      expect(String(new BreakpointType<number>(63, 1062, 2062).GetValue('md'))).assertEqual('1062');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(63, 1062, 2062).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(63, 1062, 2062).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(63, 1062, 2062).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(63, 1062, 2062).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010063 end');
    });

    /**
     * @tc.name   testBptTypeVol010064
     * @tc.number SUB_MNB_BPT_0086
     * @tc.desc   BreakpointType<number>(64/1063/2063) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010064 begin');
      const result: number | undefined = new BreakpointType<number>(64, 1063, 2063).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('64'));
      expect(String(result)).assertEqual('64');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(64, 1063, 2063).GetValue('md')), String('1063'));
      expect(String(new BreakpointType<number>(64, 1063, 2063).GetValue('md'))).assertEqual('1063');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(64, 1063, 2063).GetValue('lg')), String('2063'));
      expect(String(new BreakpointType<number>(64, 1063, 2063).GetValue('lg'))).assertEqual('2063');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(64, 1063, 2063).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(64, 1063, 2063).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(64, 1063, 2063).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(64, 1063, 2063).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010064 end');
    });

    /**
     * @tc.name   testBptTypeVol010065
     * @tc.number SUB_MNB_BPT_0087
     * @tc.desc   BreakpointType<number>(65/1064/2064) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010065 begin');
      const result: number | undefined = new BreakpointType<number>(65, 1064, 2064).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1064'));
      expect(String(result)).assertEqual('1064');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(65, 1064, 2064).GetValue('sm')), String('65'));
      expect(String(new BreakpointType<number>(65, 1064, 2064).GetValue('sm'))).assertEqual('65');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(65, 1064, 2064).GetValue('lg')), String('2064'));
      expect(String(new BreakpointType<number>(65, 1064, 2064).GetValue('lg'))).assertEqual('2064');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(65, 1064, 2064).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(65, 1064, 2064).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(65, 1064, 2064).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(65, 1064, 2064).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010065 end');
    });

    /**
     * @tc.name   testBptTypeVol010066
     * @tc.number SUB_MNB_BPT_0088
     * @tc.desc   BreakpointType<number>(66/1065/2065) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010066 begin');
      const result: number | undefined = new BreakpointType<number>(66, 1065, 2065).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2065'));
      expect(String(result)).assertEqual('2065');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(66, 1065, 2065).GetValue('sm')), String('66'));
      expect(String(new BreakpointType<number>(66, 1065, 2065).GetValue('sm'))).assertEqual('66');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(66, 1065, 2065).GetValue('md')), String('1065'));
      expect(String(new BreakpointType<number>(66, 1065, 2065).GetValue('md'))).assertEqual('1065');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(66, 1065, 2065).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(66, 1065, 2065).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(66, 1065, 2065).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(66, 1065, 2065).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010066 end');
    });

    /**
     * @tc.name   testBptTypeVol010067
     * @tc.number SUB_MNB_BPT_0089
     * @tc.desc   BreakpointType<number>(67/1066/2066) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010067 begin');
      const result: number | undefined = new BreakpointType<number>(67, 1066, 2066).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('67'));
      expect(String(result)).assertEqual('67');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(67, 1066, 2066).GetValue('md')), String('1066'));
      expect(String(new BreakpointType<number>(67, 1066, 2066).GetValue('md'))).assertEqual('1066');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(67, 1066, 2066).GetValue('lg')), String('2066'));
      expect(String(new BreakpointType<number>(67, 1066, 2066).GetValue('lg'))).assertEqual('2066');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(67, 1066, 2066).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(67, 1066, 2066).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(67, 1066, 2066).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(67, 1066, 2066).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010067 end');
    });

    /**
     * @tc.name   testBptTypeVol010068
     * @tc.number SUB_MNB_BPT_0090
     * @tc.desc   BreakpointType<number>(68/1067/2067) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010068 begin');
      const result: number | undefined = new BreakpointType<number>(68, 1067, 2067).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1067'));
      expect(String(result)).assertEqual('1067');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(68, 1067, 2067).GetValue('sm')), String('68'));
      expect(String(new BreakpointType<number>(68, 1067, 2067).GetValue('sm'))).assertEqual('68');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(68, 1067, 2067).GetValue('lg')), String('2067'));
      expect(String(new BreakpointType<number>(68, 1067, 2067).GetValue('lg'))).assertEqual('2067');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(68, 1067, 2067).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(68, 1067, 2067).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(68, 1067, 2067).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(68, 1067, 2067).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010068 end');
    });

    /**
     * @tc.name   testBptTypeVol010069
     * @tc.number SUB_MNB_BPT_0091
     * @tc.desc   BreakpointType<number>(69/1068/2068) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010069 begin');
      const result: number | undefined = new BreakpointType<number>(69, 1068, 2068).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2068'));
      expect(String(result)).assertEqual('2068');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(69, 1068, 2068).GetValue('sm')), String('69'));
      expect(String(new BreakpointType<number>(69, 1068, 2068).GetValue('sm'))).assertEqual('69');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(69, 1068, 2068).GetValue('md')), String('1068'));
      expect(String(new BreakpointType<number>(69, 1068, 2068).GetValue('md'))).assertEqual('1068');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(69, 1068, 2068).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(69, 1068, 2068).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(69, 1068, 2068).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(69, 1068, 2068).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010069 end');
    });

    /**
     * @tc.name   testBptTypeVol010070
     * @tc.number SUB_MNB_BPT_0092
     * @tc.desc   BreakpointType<number>(70/1069/2069) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010070 begin');
      const result: number | undefined = new BreakpointType<number>(70, 1069, 2069).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('70'));
      expect(String(result)).assertEqual('70');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(70, 1069, 2069).GetValue('md')), String('1069'));
      expect(String(new BreakpointType<number>(70, 1069, 2069).GetValue('md'))).assertEqual('1069');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(70, 1069, 2069).GetValue('lg')), String('2069'));
      expect(String(new BreakpointType<number>(70, 1069, 2069).GetValue('lg'))).assertEqual('2069');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(70, 1069, 2069).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(70, 1069, 2069).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(70, 1069, 2069).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(70, 1069, 2069).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010070 end');
    });

    /**
     * @tc.name   testBptTypeVol010071
     * @tc.number SUB_MNB_BPT_0093
     * @tc.desc   BreakpointType<number>(71/1070/2070) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010071 begin');
      const result: number | undefined = new BreakpointType<number>(71, 1070, 2070).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1070'));
      expect(String(result)).assertEqual('1070');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(71, 1070, 2070).GetValue('sm')), String('71'));
      expect(String(new BreakpointType<number>(71, 1070, 2070).GetValue('sm'))).assertEqual('71');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(71, 1070, 2070).GetValue('lg')), String('2070'));
      expect(String(new BreakpointType<number>(71, 1070, 2070).GetValue('lg'))).assertEqual('2070');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(71, 1070, 2070).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(71, 1070, 2070).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(71, 1070, 2070).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(71, 1070, 2070).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010071 end');
    });

    /**
     * @tc.name   testBptTypeVol010072
     * @tc.number SUB_MNB_BPT_0094
     * @tc.desc   BreakpointType<number>(72/1071/2071) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010072 begin');
      const result: number | undefined = new BreakpointType<number>(72, 1071, 2071).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2071'));
      expect(String(result)).assertEqual('2071');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(72, 1071, 2071).GetValue('sm')), String('72'));
      expect(String(new BreakpointType<number>(72, 1071, 2071).GetValue('sm'))).assertEqual('72');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(72, 1071, 2071).GetValue('md')), String('1071'));
      expect(String(new BreakpointType<number>(72, 1071, 2071).GetValue('md'))).assertEqual('1071');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(72, 1071, 2071).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(72, 1071, 2071).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(72, 1071, 2071).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(72, 1071, 2071).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010072 end');
    });

    /**
     * @tc.name   testBptTypeVol010073
     * @tc.number SUB_MNB_BPT_0095
     * @tc.desc   BreakpointType<number>(73/1072/2072) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010073 begin');
      const result: number | undefined = new BreakpointType<number>(73, 1072, 2072).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('73'));
      expect(String(result)).assertEqual('73');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(73, 1072, 2072).GetValue('md')), String('1072'));
      expect(String(new BreakpointType<number>(73, 1072, 2072).GetValue('md'))).assertEqual('1072');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(73, 1072, 2072).GetValue('lg')), String('2072'));
      expect(String(new BreakpointType<number>(73, 1072, 2072).GetValue('lg'))).assertEqual('2072');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(73, 1072, 2072).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(73, 1072, 2072).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(73, 1072, 2072).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(73, 1072, 2072).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010073 end');
    });

    /**
     * @tc.name   testBptTypeVol010074
     * @tc.number SUB_MNB_BPT_0096
     * @tc.desc   BreakpointType<number>(74/1073/2073) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010074 begin');
      const result: number | undefined = new BreakpointType<number>(74, 1073, 2073).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1073'));
      expect(String(result)).assertEqual('1073');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(74, 1073, 2073).GetValue('sm')), String('74'));
      expect(String(new BreakpointType<number>(74, 1073, 2073).GetValue('sm'))).assertEqual('74');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(74, 1073, 2073).GetValue('lg')), String('2073'));
      expect(String(new BreakpointType<number>(74, 1073, 2073).GetValue('lg'))).assertEqual('2073');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(74, 1073, 2073).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(74, 1073, 2073).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(74, 1073, 2073).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(74, 1073, 2073).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010074 end');
    });

    /**
     * @tc.name   testBptTypeVol010075
     * @tc.number SUB_MNB_BPT_0097
     * @tc.desc   Anchor: three identical slots still resolve by position, so sm/md/lg all return 5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol010075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010075 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(5, 5, 5);
      const sm: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sm=%{public}s md=%{public}s lg=%{public}s', String(sm),
        String(sut.GetValue('md')), String(sut.GetValue('lg')));
      expect(sm).assertEqual(5);
      expect(sut.GetValue('md')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check String(sut.GetValue(\'SM\'))');
      expect(String(sut.GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol010075 end');
    });
  });
}
