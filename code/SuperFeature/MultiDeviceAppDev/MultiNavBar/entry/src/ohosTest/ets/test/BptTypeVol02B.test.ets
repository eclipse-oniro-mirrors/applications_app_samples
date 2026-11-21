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

export default function bptTypeVol02BTest() {
  describe('MultiNavBarBptTypeVol02B', () => {

    /**
     * @tc.name   testBptTypeVol020039
     * @tc.number SUB_MNB_BPT_0136
     * @tc.desc   BreakpointType<string> triple #13 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020039 begin');
      const result: string | undefined = new BreakpointType<string>('0', '1', '2').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('0', '1', '2').GetValue('sm')), String('0'));
      expect(String(new BreakpointType<string>('0', '1', '2').GetValue('sm'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('0', '1', '2').GetValue('md')), String('1'));
      expect(String(new BreakpointType<string>('0', '1', '2').GetValue('md'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('0', '1', '2').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('0', '1', '2').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('0', '1', '2').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('0', '1', '2').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020039 end');
    });

    /**
     * @tc.name   testBptTypeVol020040
     * @tc.number SUB_MNB_BPT_0137
     * @tc.desc   BreakpointType<string> triple #14 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020040 begin');
      const result: string | undefined = new BreakpointType<string>('-1', '-2', '-3').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(String(result)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('-1', '-2', '-3').GetValue('md')), String('-2'));
      expect(String(new BreakpointType<string>('-1', '-2', '-3').GetValue('md'))).assertEqual('-2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('-1', '-2', '-3').GetValue('lg')), String('-3'));
      expect(String(new BreakpointType<string>('-1', '-2', '-3').GetValue('lg'))).assertEqual('-3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('-1', '-2', '-3').GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<string>('-1', '-2', '-3').GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('-1', '-2', '-3').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('-1', '-2', '-3').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020040 end');
    });

    /**
     * @tc.name   testBptTypeVol020041
     * @tc.number SUB_MNB_BPT_0138
     * @tc.desc   BreakpointType<string> triple #15 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020041 begin');
      const result: string | undefined = new BreakpointType<string>('v1', 'v2', 'v3').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('v2'));
      expect(String(result)).assertEqual('v2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('sm')), String('v1'));
      expect(String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('sm'))).assertEqual('v1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('lg')), String('v3'));
      expect(String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('lg'))).assertEqual('v3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020041 end');
    });

    /**
     * @tc.name   testBptTypeVol020042
     * @tc.number SUB_MNB_BPT_0139
     * @tc.desc   BreakpointType<string> triple #16 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020042 begin');
      const result: string | undefined = new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gamma'));
      expect(String(result)).assertEqual('gamma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('sm')), String('alpha'));
      expect(String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('sm'))).assertEqual('alpha');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('md')), String('beta'));
      expect(String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('md'))).assertEqual('beta');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020042 end');
    });

    /**
     * @tc.name   testBptTypeVol020043
     * @tc.number SUB_MNB_BPT_0140
     * @tc.desc   BreakpointType<string> triple #17 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020043 begin');
      const result: string | undefined = new BreakpointType<string>('one', 'two', 'three').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('one'));
      expect(String(result)).assertEqual('one');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('one', 'two', 'three').GetValue('md')), String('two'));
      expect(String(new BreakpointType<string>('one', 'two', 'three').GetValue('md'))).assertEqual('two');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('one', 'two', 'three').GetValue('lg')), String('three'));
      expect(String(new BreakpointType<string>('one', 'two', 'three').GetValue('lg'))).assertEqual('three');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('one', 'two', 'three').GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<string>('one', 'two', 'three').GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('one', 'two', 'three').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('one', 'two', 'three').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020043 end');
    });

    /**
     * @tc.name   testBptTypeVol020044
     * @tc.number SUB_MNB_BPT_0141
     * @tc.desc   BreakpointType<string> triple #18 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020044 begin');
      const result: string | undefined = new BreakpointType<string>('row', 'column', 'stack').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('column'));
      expect(String(result)).assertEqual('column');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('row', 'column', 'stack').GetValue('sm')), String('row'));
      expect(String(new BreakpointType<string>('row', 'column', 'stack').GetValue('sm'))).assertEqual('row');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('row', 'column', 'stack').GetValue('lg')), String('stack'));
      expect(String(new BreakpointType<string>('row', 'column', 'stack').GetValue('lg'))).assertEqual('stack');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('row', 'column', 'stack').GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<string>('row', 'column', 'stack').GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('row', 'column', 'stack').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('row', 'column', 'stack').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020044 end');
    });

    /**
     * @tc.name   testBptTypeVol020045
     * @tc.number SUB_MNB_BPT_0142
     * @tc.desc   BreakpointType<string> triple #19 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020045 begin');
      const result: string | undefined = new BreakpointType<string>('start', 'center', 'end').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('end'));
      expect(String(result)).assertEqual('end');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('start', 'center', 'end').GetValue('sm')), String('start'));
      expect(String(new BreakpointType<string>('start', 'center', 'end').GetValue('sm'))).assertEqual('start');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('start', 'center', 'end').GetValue('md')), String('center'));
      expect(String(new BreakpointType<string>('start', 'center', 'end').GetValue('md'))).assertEqual('center');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('start', 'center', 'end').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('start', 'center', 'end').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('start', 'center', 'end').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('start', 'center', 'end').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020045 end');
    });

    /**
     * @tc.name   testBptTypeVol020046
     * @tc.number SUB_MNB_BPT_0143
     * @tc.desc   BreakpointType<string> triple #20 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020046 begin');
      const result: string | undefined = new BreakpointType<string>('p', 'q', 'r').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('p'));
      expect(String(result)).assertEqual('p');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('p', 'q', 'r').GetValue('md')), String('q'));
      expect(String(new BreakpointType<string>('p', 'q', 'r').GetValue('md'))).assertEqual('q');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('p', 'q', 'r').GetValue('lg')), String('r'));
      expect(String(new BreakpointType<string>('p', 'q', 'r').GetValue('lg'))).assertEqual('r');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('p', 'q', 'r').GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<string>('p', 'q', 'r').GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('p', 'q', 'r').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('p', 'q', 'r').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020046 end');
    });

    /**
     * @tc.name   testBptTypeVol020047
     * @tc.number SUB_MNB_BPT_0144
     * @tc.desc   BreakpointType<string> triple #21 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020047 begin');
      const result: string | undefined = new BreakpointType<string>('k1', 'k2', 'k3').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('k2'));
      expect(String(result)).assertEqual('k2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('sm')), String('k1'));
      expect(String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('sm'))).assertEqual('k1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('lg')), String('k3'));
      expect(String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('lg'))).assertEqual('k3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020047 end');
    });

    /**
     * @tc.name   testBptTypeVol020048
     * @tc.number SUB_MNB_BPT_0145
     * @tc.desc   BreakpointType<string> triple #22 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020048 begin');
      const result: string | undefined = new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nav-grid'));
      expect(String(result)).assertEqual('nav-grid');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('sm')), String('nav-list'));
      expect(
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('sm'))
      ).assertEqual('nav-list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('md')), String('nav-tabs'));
      expect(
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('md'))
      ).assertEqual('nav-tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('md\t')), String('undefined'));
      expect(
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('md\t'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('Md')), String('undefined'));
      expect(
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('Md'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020048 end');
    });

    /**
     * @tc.name   testBptTypeVol020049
     * @tc.number SUB_MNB_BPT_0146
     * @tc.desc   BreakpointType<string> triple #23 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020049 begin');
      const result: string | undefined = new BreakpointType<string>('north', 'south', 'west').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('north'));
      expect(String(result)).assertEqual('north');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('north', 'south', 'west').GetValue('md')), String('south'));
      expect(String(new BreakpointType<string>('north', 'south', 'west').GetValue('md'))).assertEqual('south');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('north', 'south', 'west').GetValue('lg')), String('west'));
      expect(String(new BreakpointType<string>('north', 'south', 'west').GetValue('lg'))).assertEqual('west');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('north', 'south', 'west').GetValue('')), String('undefined'));
      expect(String(new BreakpointType<string>('north', 'south', 'west').GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('north', 'south', 'west').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('north', 'south', 'west').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020049 end');
    });

    /**
     * @tc.name   testBptTypeVol020050
     * @tc.number SUB_MNB_BPT_0147
     * @tc.desc   BreakpointType<string> triple #24 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020050 begin');
      const result: string | undefined = new BreakpointType<string>('#000', '#111', '#222').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('#111'));
      expect(String(result)).assertEqual('#111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#000', '#111', '#222').GetValue('sm')), String('#000'));
      expect(String(new BreakpointType<string>('#000', '#111', '#222').GetValue('sm'))).assertEqual('#000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#000', '#111', '#222').GetValue('lg')), String('#222'));
      expect(String(new BreakpointType<string>('#000', '#111', '#222').GetValue('lg'))).assertEqual('#222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#000', '#111', '#222').GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<string>('#000', '#111', '#222').GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#000', '#111', '#222').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('#000', '#111', '#222').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020050 end');
    });

    /**
     * @tc.name   testBptTypeVol020051
     * @tc.number SUB_MNB_BPT_0148
     * @tc.desc   BreakpointType<string> triple #0 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020051 begin');
      const result: string | undefined = new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nav-game'));
      expect(String(result)).assertEqual('nav-game');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('sm')), String('nav-home'));
      expect(
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('sm'))
      ).assertEqual('nav-home');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('md')), String('nav-app'));
      expect(
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('md'))
      ).assertEqual('nav-app');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('Md')), String('undefined'));
      expect(
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('Md'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('md\t')), String('undefined'));
      expect(
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('md\t'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020051 end');
    });

    /**
     * @tc.name   testBptTypeVol020052
     * @tc.number SUB_MNB_BPT_0149
     * @tc.desc   BreakpointType<string> triple #1 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020052 begin');
      const result: string | undefined = new BreakpointType<string>('', 'b', 'c').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(String(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('', 'b', 'c').GetValue('md')), String('b'));
      expect(String(new BreakpointType<string>('', 'b', 'c').GetValue('md'))).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('', 'b', 'c').GetValue('lg')), String('c'));
      expect(String(new BreakpointType<string>('', 'b', 'c').GetValue('lg'))).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('', 'b', 'c').GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<string>('', 'b', 'c').GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('', 'b', 'c').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('', 'b', 'c').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020052 end');
    });

    /**
     * @tc.name   testBptTypeVol020053
     * @tc.number SUB_MNB_BPT_0150
     * @tc.desc   BreakpointType<string> triple #2 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020053 begin');
      const result: string | undefined = new BreakpointType<string>('x', '', 'z').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(String(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('x', '', 'z').GetValue('sm')), String('x'));
      expect(String(new BreakpointType<string>('x', '', 'z').GetValue('sm'))).assertEqual('x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('x', '', 'z').GetValue('lg')), String('z'));
      expect(String(new BreakpointType<string>('x', '', 'z').GetValue('lg'))).assertEqual('z');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('x', '', 'z').GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<string>('x', '', 'z').GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('x', '', 'z').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('x', '', 'z').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020053 end');
    });

    /**
     * @tc.name   testBptTypeVol020054
     * @tc.number SUB_MNB_BPT_0151
     * @tc.desc   BreakpointType<string> triple #3 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020054 begin');
      const result: string | undefined = new BreakpointType<string>('a', 'b', '').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(String(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a', 'b', '').GetValue('sm')), String('a'));
      expect(String(new BreakpointType<string>('a', 'b', '').GetValue('sm'))).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a', 'b', '').GetValue('md')), String('b'));
      expect(String(new BreakpointType<string>('a', 'b', '').GetValue('md'))).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a', 'b', '').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('a', 'b', '').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a', 'b', '').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('a', 'b', '').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020054 end');
    });

    /**
     * @tc.name   testBptTypeVol020055
     * @tc.number SUB_MNB_BPT_0152
     * @tc.desc   BreakpointType<string> triple #4 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020055 begin');
      const result: string | undefined = new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tab-0'));
      expect(String(result)).assertEqual('tab-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('md')), String('tab-1'));
      expect(String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('md'))).assertEqual('tab-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('lg')), String('tab-2'));
      expect(String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('lg'))).assertEqual('tab-2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020055 end');
    });

    /**
     * @tc.name   testBptTypeVol020056
     * @tc.number SUB_MNB_BPT_0153
     * @tc.desc   BreakpointType<string> triple #5 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020056 begin');
      const result: string | undefined = new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('#182431'));
      expect(String(result)).assertEqual('#182431');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('sm')), String('#0a59f7'));
      expect(String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('sm'))).assertEqual('#0a59f7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('lg')), String('#fff'));
      expect(String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('lg'))).assertEqual('#fff');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020056 end');
    });

    /**
     * @tc.name   testBptTypeVol020057
     * @tc.number SUB_MNB_BPT_0154
     * @tc.desc   BreakpointType<string> triple #6 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020057 begin');
      const result: string | undefined = new BreakpointType<string>('56vp', '100%', '20%').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20%'));
      expect(String(result)).assertEqual('20%');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('sm')), String('56vp'));
      expect(String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('sm'))).assertEqual('56vp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('md')), String('100%'));
      expect(String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('md'))).assertEqual('100%');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020057 end');
    });

    /**
     * @tc.name   testBptTypeVol020058
     * @tc.number SUB_MNB_BPT_0155
     * @tc.desc   BreakpointType<string> triple #7 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020058 begin');
      const result: string | undefined = new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('f1f3f5'));
      expect(String(result)).assertEqual('f1f3f5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('md')), String('fff'));
      expect(String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('md'))).assertEqual('fff');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('lg')), String('#fff'));
      expect(String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('lg'))).assertEqual('#fff');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020058 end');
    });

    /**
     * @tc.name   testBptTypeVol020059
     * @tc.number SUB_MNB_BPT_0156
     * @tc.desc   BreakpointType<string> triple #8 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020059 begin');
      const result: string | undefined = new BreakpointType<string>('list', 'tabs', 'sm').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tabs'));
      expect(String(result)).assertEqual('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('sm')), String('list'));
      expect(String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('sm'))).assertEqual('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('lg')), String('sm'));
      expect(String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('lg'))).assertEqual('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020059 end');
    });

    /**
     * @tc.name   testBptTypeVol020060
     * @tc.number SUB_MNB_BPT_0157
     * @tc.desc   BreakpointType<string> triple #9 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020060 begin');
      const result: string | undefined = new BreakpointType<string>('sm', 'md', 'lg').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lg'));
      expect(String(result)).assertEqual('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('sm')), String('sm'));
      expect(String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('sm'))).assertEqual('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('md')), String('md'));
      expect(String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('md'))).assertEqual('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020060 end');
    });

    /**
     * @tc.name   testBptTypeVol020061
     * @tc.number SUB_MNB_BPT_0158
     * @tc.desc   BreakpointType<string> triple #10 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020061 begin');
      const result: string | undefined = new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('LEFT'));
      expect(String(result)).assertEqual('LEFT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('md')), String('RIGHT'));
      expect(String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('md'))).assertEqual('RIGHT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('lg')), String('CENTER'));
      expect(String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('lg'))).assertEqual('CENTER');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('')), String('undefined'));
      expect(String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020061 end');
    });

    /**
     * @tc.name   testBptTypeVol020062
     * @tc.number SUB_MNB_BPT_0159
     * @tc.desc   BreakpointType<string> triple #11 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020062 begin');
      const result: string | undefined = new BreakpointType<string>('top', 'bottom', 'middle').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('bottom'));
      expect(String(result)).assertEqual('bottom');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('sm')), String('top'));
      expect(String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('sm'))).assertEqual('top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('lg')), String('middle'));
      expect(String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('lg'))).assertEqual('middle');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020062 end');
    });

    /**
     * @tc.name   testBptTypeVol020063
     * @tc.number SUB_MNB_BPT_0160
     * @tc.desc   BreakpointType<string> triple #12 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020063 begin');
      const result: string | undefined = new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(' a b'));
      expect(String(result)).assertEqual(' a b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('sm')), String('a b'));
      expect(String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('sm'))).assertEqual('a b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('md')), String('a  b'));
      expect(String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('md'))).assertEqual('a  b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020063 end');
    });

    /**
     * @tc.name   testBptTypeVol020064
     * @tc.number SUB_MNB_BPT_0161
     * @tc.desc   BreakpointType<string> triple #13 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020064 begin');
      const result: string | undefined = new BreakpointType<string>('0', '1', '2').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('0', '1', '2').GetValue('md')), String('1'));
      expect(String(new BreakpointType<string>('0', '1', '2').GetValue('md'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('0', '1', '2').GetValue('lg')), String('2'));
      expect(String(new BreakpointType<string>('0', '1', '2').GetValue('lg'))).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('0', '1', '2').GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<string>('0', '1', '2').GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('0', '1', '2').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('0', '1', '2').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020064 end');
    });

    /**
     * @tc.name   testBptTypeVol020065
     * @tc.number SUB_MNB_BPT_0162
     * @tc.desc   BreakpointType<string> triple #14 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020065 begin');
      const result: string | undefined = new BreakpointType<string>('-1', '-2', '-3').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-2'));
      expect(String(result)).assertEqual('-2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('-1', '-2', '-3').GetValue('sm')), String('-1'));
      expect(String(new BreakpointType<string>('-1', '-2', '-3').GetValue('sm'))).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('-1', '-2', '-3').GetValue('lg')), String('-3'));
      expect(String(new BreakpointType<string>('-1', '-2', '-3').GetValue('lg'))).assertEqual('-3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('-1', '-2', '-3').GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<string>('-1', '-2', '-3').GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('-1', '-2', '-3').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('-1', '-2', '-3').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020065 end');
    });

    /**
     * @tc.name   testBptTypeVol020066
     * @tc.number SUB_MNB_BPT_0163
     * @tc.desc   BreakpointType<string> triple #15 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020066 begin');
      const result: string | undefined = new BreakpointType<string>('v1', 'v2', 'v3').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('v3'));
      expect(String(result)).assertEqual('v3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('sm')), String('v1'));
      expect(String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('sm'))).assertEqual('v1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('md')), String('v2'));
      expect(String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('md'))).assertEqual('v2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020066 end');
    });

    /**
     * @tc.name   testBptTypeVol020067
     * @tc.number SUB_MNB_BPT_0164
     * @tc.desc   BreakpointType<string> triple #16 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020067 begin');
      const result: string | undefined = new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('alpha'));
      expect(String(result)).assertEqual('alpha');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('md')), String('beta'));
      expect(String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('md'))).assertEqual('beta');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('lg')), String('gamma'));
      expect(String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('lg'))).assertEqual('gamma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020067 end');
    });

    /**
     * @tc.name   testBptTypeVol020068
     * @tc.number SUB_MNB_BPT_0165
     * @tc.desc   BreakpointType<string> triple #17 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020068 begin');
      const result: string | undefined = new BreakpointType<string>('one', 'two', 'three').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('two'));
      expect(String(result)).assertEqual('two');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('one', 'two', 'three').GetValue('sm')), String('one'));
      expect(String(new BreakpointType<string>('one', 'two', 'three').GetValue('sm'))).assertEqual('one');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('one', 'two', 'three').GetValue('lg')), String('three'));
      expect(String(new BreakpointType<string>('one', 'two', 'three').GetValue('lg'))).assertEqual('three');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('one', 'two', 'three').GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<string>('one', 'two', 'three').GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('one', 'two', 'three').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('one', 'two', 'three').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020068 end');
    });

    /**
     * @tc.name   testBptTypeVol020069
     * @tc.number SUB_MNB_BPT_0166
     * @tc.desc   BreakpointType<string> triple #18 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020069 begin');
      const result: string | undefined = new BreakpointType<string>('row', 'column', 'stack').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('stack'));
      expect(String(result)).assertEqual('stack');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('row', 'column', 'stack').GetValue('sm')), String('row'));
      expect(String(new BreakpointType<string>('row', 'column', 'stack').GetValue('sm'))).assertEqual('row');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('row', 'column', 'stack').GetValue('md')), String('column'));
      expect(String(new BreakpointType<string>('row', 'column', 'stack').GetValue('md'))).assertEqual('column');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('row', 'column', 'stack').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('row', 'column', 'stack').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('row', 'column', 'stack').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('row', 'column', 'stack').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020069 end');
    });

    /**
     * @tc.name   testBptTypeVol020070
     * @tc.number SUB_MNB_BPT_0167
     * @tc.desc   BreakpointType<string> triple #19 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020070 begin');
      const result: string | undefined = new BreakpointType<string>('start', 'center', 'end').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('start'));
      expect(String(result)).assertEqual('start');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('start', 'center', 'end').GetValue('md')), String('center'));
      expect(String(new BreakpointType<string>('start', 'center', 'end').GetValue('md'))).assertEqual('center');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('start', 'center', 'end').GetValue('lg')), String('end'));
      expect(String(new BreakpointType<string>('start', 'center', 'end').GetValue('lg'))).assertEqual('end');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('start', 'center', 'end').GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<string>('start', 'center', 'end').GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('start', 'center', 'end').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('start', 'center', 'end').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020070 end');
    });

    /**
     * @tc.name   testBptTypeVol020071
     * @tc.number SUB_MNB_BPT_0168
     * @tc.desc   BreakpointType<string> triple #20 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020071 begin');
      const result: string | undefined = new BreakpointType<string>('p', 'q', 'r').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('q'));
      expect(String(result)).assertEqual('q');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('p', 'q', 'r').GetValue('sm')), String('p'));
      expect(String(new BreakpointType<string>('p', 'q', 'r').GetValue('sm'))).assertEqual('p');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('p', 'q', 'r').GetValue('lg')), String('r'));
      expect(String(new BreakpointType<string>('p', 'q', 'r').GetValue('lg'))).assertEqual('r');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('p', 'q', 'r').GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<string>('p', 'q', 'r').GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('p', 'q', 'r').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('p', 'q', 'r').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020071 end');
    });

    /**
     * @tc.name   testBptTypeVol020072
     * @tc.number SUB_MNB_BPT_0169
     * @tc.desc   BreakpointType<string> triple #21 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020072 begin');
      const result: string | undefined = new BreakpointType<string>('k1', 'k2', 'k3').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('k3'));
      expect(String(result)).assertEqual('k3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('sm')), String('k1'));
      expect(String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('sm'))).assertEqual('k1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('md')), String('k2'));
      expect(String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('md'))).assertEqual('k2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020072 end');
    });

    /**
     * @tc.name   testBptTypeVol020073
     * @tc.number SUB_MNB_BPT_0170
     * @tc.desc   BreakpointType<string> triple #22 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020073 begin');
      const result: string | undefined = new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nav-list'));
      expect(String(result)).assertEqual('nav-list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('md')), String('nav-tabs'));
      expect(
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('md'))
      ).assertEqual('nav-tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('lg')), String('nav-grid'));
      expect(
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('lg'))
      ).assertEqual('nav-grid');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('')), String('undefined'));
      expect(
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue(''))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('xs')), String('undefined'));
      expect(
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('xs'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020073 end');
    });

    /**
     * @tc.name   testBptTypeVol020074
     * @tc.number SUB_MNB_BPT_0171
     * @tc.desc   BreakpointType<string> triple #23 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020074 begin');
      const result: string | undefined = new BreakpointType<string>('north', 'south', 'west').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('south'));
      expect(String(result)).assertEqual('south');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('north', 'south', 'west').GetValue('sm')), String('north'));
      expect(String(new BreakpointType<string>('north', 'south', 'west').GetValue('sm'))).assertEqual('north');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('north', 'south', 'west').GetValue('lg')), String('west'));
      expect(String(new BreakpointType<string>('north', 'south', 'west').GetValue('lg'))).assertEqual('west');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('north', 'south', 'west').GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<string>('north', 'south', 'west').GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('north', 'south', 'west').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('north', 'south', 'west').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020074 end');
    });

    /**
     * @tc.name   testBptTypeVol020075
     * @tc.number SUB_MNB_BPT_0172
     * @tc.desc   Anchor: an empty string slot is a real value, GetValue must not fold it into undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020075 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('', 'tabs', 'grid');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sm=[%{public}s] tabs=%{public}s', String(sut.GetValue('sm')),
        String(sut.GetValue('lg')));
      expect(String(sut.GetValue('sm'))).assertEqual('');
      expect(String(sut.GetValue('md'))).assertEqual('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check String(sut.GetValue(\'lg\'))');
      expect(String(sut.GetValue('lg'))).assertEqual('grid');
      expect(String(sut.GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020075 end');
    });
  });
}
