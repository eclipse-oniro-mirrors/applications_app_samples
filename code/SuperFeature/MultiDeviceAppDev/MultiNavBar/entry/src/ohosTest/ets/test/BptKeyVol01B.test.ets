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

export default function bptKeyVol01BTest() {
  describe('MultiNavBarBptKeyVol01B', () => {

    /**
     * @tc.name   testBptKeyVol010039
     * @tc.number SUB_MNB_BPT_0361
     * @tc.desc   key 's' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010039 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('s');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010039 end');
    });

    /**
     * @tc.name   testBptKeyVol010040
     * @tc.number SUB_MNB_BPT_0362
     * @tc.desc   key 'smlg' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010040 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('smlg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010040 end');
    });

    /**
     * @tc.name   testBptKeyVol010041
     * @tc.number SUB_MNB_BPT_0363
     * @tc.desc   key 'tab' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010041 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('tab');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010041 end');
    });

    /**
     * @tc.name   testBptKeyVol010042
     * @tc.number SUB_MNB_BPT_0364
     * @tc.desc   key 'sm sm' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010042 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('sm sm');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010042 end');
    });

    /**
     * @tc.name   testBptKeyVol010043
     * @tc.number SUB_MNB_BPT_0365
     * @tc.desc   key 'md\t' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010043 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('md\t');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010043 end');
    });

    /**
     * @tc.name   testBptKeyVol010044
     * @tc.number SUB_MNB_BPT_0366
     * @tc.desc   key 'small' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010044 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('small');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010044 end');
    });

    /**
     * @tc.name   testBptKeyVol010045
     * @tc.number SUB_MNB_BPT_0367
     * @tc.desc   key 'medium' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010045 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('medium');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010045 end');
    });

    /**
     * @tc.name   testBptKeyVol010046
     * @tc.number SUB_MNB_BPT_0368
     * @tc.desc   key 'large' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010046 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('large');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010046 end');
    });

    /**
     * @tc.name   testBptKeyVol010047
     * @tc.number SUB_MNB_BPT_0369
     * @tc.desc   key 'Sm' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010047 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('Sm');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010047 end');
    });

    /**
     * @tc.name   testBptKeyVol010048
     * @tc.number SUB_MNB_BPT_0370
     * @tc.desc   key 'SMALL' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010048 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('SMALL');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010048 end');
    });

    /**
     * @tc.name   testBptKeyVol010049
     * @tc.number SUB_MNB_BPT_0371
     * @tc.desc   key 'sm\t' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010049 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('sm\t');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010049 end');
    });

    /**
     * @tc.name   testBptKeyVol010050
     * @tc.number SUB_MNB_BPT_0372
     * @tc.desc   key '\tsm' against slots 110/120/130 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010050 begin');
      const result: number | undefined = new BreakpointType<number>(110, 120, 130).GetValue('\tsm');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010050 end');
    });

    /**
     * @tc.name   testBptKeyVol010051
     * @tc.number SUB_MNB_BPT_0373
     * @tc.desc   key 'sm' against slots 210/220/230 resolves to 210
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010051 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('210'));
      expect(String(result)).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010051 end');
    });

    /**
     * @tc.name   testBptKeyVol010052
     * @tc.number SUB_MNB_BPT_0374
     * @tc.desc   key 'md' against slots 210/220/230 resolves to 220
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010052 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('220'));
      expect(String(result)).assertEqual('220');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010052 end');
    });

    /**
     * @tc.name   testBptKeyVol010053
     * @tc.number SUB_MNB_BPT_0375
     * @tc.desc   key 'lg' against slots 210/220/230 resolves to 230
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010053 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('230'));
      expect(String(result)).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010053 end');
    });

    /**
     * @tc.name   testBptKeyVol010054
     * @tc.number SUB_MNB_BPT_0376
     * @tc.desc   key '' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010054 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010054 end');
    });

    /**
     * @tc.name   testBptKeyVol010055
     * @tc.number SUB_MNB_BPT_0377
     * @tc.desc   key 'SM' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010055 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010055 end');
    });

    /**
     * @tc.name   testBptKeyVol010056
     * @tc.number SUB_MNB_BPT_0378
     * @tc.desc   key 'Md' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010056 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('Md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010056 end');
    });

    /**
     * @tc.name   testBptKeyVol010057
     * @tc.number SUB_MNB_BPT_0379
     * @tc.desc   key 'LG' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010057 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('LG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010057 end');
    });

    /**
     * @tc.name   testBptKeyVol010058
     * @tc.number SUB_MNB_BPT_0380
     * @tc.desc   key ' sm' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010058 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue(' sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010058 end');
    });

    /**
     * @tc.name   testBptKeyVol010059
     * @tc.number SUB_MNB_BPT_0381
     * @tc.desc   key 'lg ' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010059 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('lg ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010059 end');
    });

    /**
     * @tc.name   testBptKeyVol010060
     * @tc.number SUB_MNB_BPT_0382
     * @tc.desc   key 'xs' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010060 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('xs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010060 end');
    });

    /**
     * @tc.name   testBptKeyVol010061
     * @tc.number SUB_MNB_BPT_0383
     * @tc.desc   key 'xl' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010061 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('xl');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010061 end');
    });

    /**
     * @tc.name   testBptKeyVol010062
     * @tc.number SUB_MNB_BPT_0384
     * @tc.desc   key 'xxl' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010062 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('xxl');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010062 end');
    });

    /**
     * @tc.name   testBptKeyVol010063
     * @tc.number SUB_MNB_BPT_0385
     * @tc.desc   key '0' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010063 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010063 end');
    });

    /**
     * @tc.name   testBptKeyVol010064
     * @tc.number SUB_MNB_BPT_0386
     * @tc.desc   key 's' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010064 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('s');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010064 end');
    });

    /**
     * @tc.name   testBptKeyVol010065
     * @tc.number SUB_MNB_BPT_0387
     * @tc.desc   key 'smlg' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010065 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('smlg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010065 end');
    });

    /**
     * @tc.name   testBptKeyVol010066
     * @tc.number SUB_MNB_BPT_0388
     * @tc.desc   key 'tab' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010066 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('tab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010066 end');
    });

    /**
     * @tc.name   testBptKeyVol010067
     * @tc.number SUB_MNB_BPT_0389
     * @tc.desc   key 'sm sm' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010067 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('sm sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010067 end');
    });

    /**
     * @tc.name   testBptKeyVol010068
     * @tc.number SUB_MNB_BPT_0390
     * @tc.desc   key 'md\t' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010068 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('md\t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010068 end');
    });

    /**
     * @tc.name   testBptKeyVol010069
     * @tc.number SUB_MNB_BPT_0391
     * @tc.desc   key 'small' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010069 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('small');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010069 end');
    });

    /**
     * @tc.name   testBptKeyVol010070
     * @tc.number SUB_MNB_BPT_0392
     * @tc.desc   key 'medium' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010070 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('medium');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010070 end');
    });

    /**
     * @tc.name   testBptKeyVol010071
     * @tc.number SUB_MNB_BPT_0393
     * @tc.desc   key 'large' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010071 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('large');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010071 end');
    });

    /**
     * @tc.name   testBptKeyVol010072
     * @tc.number SUB_MNB_BPT_0394
     * @tc.desc   key 'Sm' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010072 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('Sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010072 end');
    });

    /**
     * @tc.name   testBptKeyVol010073
     * @tc.number SUB_MNB_BPT_0395
     * @tc.desc   key 'SMALL' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010073 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('SMALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010073 end');
    });

    /**
     * @tc.name   testBptKeyVol010074
     * @tc.number SUB_MNB_BPT_0396
     * @tc.desc   key 'sm\t' against slots 210/220/230 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010074 begin');
      const result: number | undefined = new BreakpointType<number>(210, 220, 230).GetValue('sm\t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('sm')), String('210'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('sm'))).assertEqual('210');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('lg')), String('230'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('lg'))).assertEqual('230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(210, 220, 230).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(210, 220, 230).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010074 end');
    });

    /**
     * @tc.name   testBptKeyVol010075
     * @tc.number SUB_MNB_BPT_0397
     * @tc.desc   Anchor: a key carrying a NUL code unit is not the literal sm and must resolve to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptKeyVol010075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010075 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(1, 2, 3);
      const nulKey: string = 'sm\u0000';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nul=%{public}s sm=%{public}s', String(sut.GetValue(nulKey)),
        String(sut.GetValue('sm')));
      expect(String(sut.GetValue(nulKey))).assertEqual('undefined');
      expect(sut.GetValue('sm')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s',
        'check String(sut.GetValue(\'sm\u0000\')) === String(sut.GetValue(\'sm\'))');
      expect(String(sut.GetValue('sm\u0000')) === String(sut.GetValue('sm'))).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptKeyVol010075 end');
    });
  });
}
