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
import { SideBarMode } from '../../../main/ets/common/BreakpointSystem';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function sbmKeyVol01BTest() {
  describe('MultiNavBarSbmKeyVol01B', () => {

    /**
     * @tc.name   testSbmKeyVol010039
     * @tc.number SUB_MNB_SBM_0609
     * @tc.desc   side bar mode key 'lists' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010039 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('lists');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('list')), String('17'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('list'))).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('tabs')), String('19'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('tabs'))).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010039 end');
    });

    /**
     * @tc.name   testSbmKeyVol010040
     * @tc.number SUB_MNB_SBM_0610
     * @tc.desc   side bar mode key 'tab' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010040 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('tab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('list')), String('17'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('list'))).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('tabs')), String('19'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('tabs'))).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010040 end');
    });

    /**
     * @tc.name   testSbmKeyVol010041
     * @tc.number SUB_MNB_SBM_0611
     * @tc.desc   side bar mode key 'LIST ' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010041 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('LIST ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('list')), String('17'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('list'))).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('tabs')), String('19'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('tabs'))).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010041 end');
    });

    /**
     * @tc.name   testSbmKeyVol010042
     * @tc.number SUB_MNB_SBM_0612
     * @tc.desc   side bar mode key 'Tabs' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010042 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('Tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('list')), String('17'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('list'))).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('tabs')), String('19'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('tabs'))).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010042 end');
    });

    /**
     * @tc.name   testSbmKeyVol010043
     * @tc.number SUB_MNB_SBM_0613
     * @tc.desc   side bar mode key 'list list' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010043 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('list list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('list')), String('17'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('list'))).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('tabs')), String('19'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('tabs'))).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010043 end');
    });

    /**
     * @tc.name   testSbmKeyVol010044
     * @tc.number SUB_MNB_SBM_0614
     * @tc.desc   side bar mode key 'tabs\t' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010044 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('tabs\t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('list')), String('17'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('list'))).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('tabs')), String('19'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('tabs'))).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010044 end');
    });

    /**
     * @tc.name   testSbmKeyVol010045
     * @tc.number SUB_MNB_SBM_0615
     * @tc.desc   side bar mode key 'tabss' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010045 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('tabss');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('list')), String('17'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('list'))).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('tabs')), String('19'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('tabs'))).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010045 end');
    });

    /**
     * @tc.name   testSbmKeyVol010046
     * @tc.number SUB_MNB_SBM_0616
     * @tc.desc   side bar mode key 'lsit' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010046 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('lsit');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('list')), String('17'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('list'))).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('tabs')), String('19'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('tabs'))).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010046 end');
    });

    /**
     * @tc.name   testSbmKeyVol010047
     * @tc.number SUB_MNB_SBM_0617
     * @tc.desc   side bar mode key 'l' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010047 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('l');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('list')), String('17'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('list'))).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('tabs')), String('19'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('tabs'))).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010047 end');
    });

    /**
     * @tc.name   testSbmKeyVol010048
     * @tc.number SUB_MNB_SBM_0618
     * @tc.desc   side bar mode key 't' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010048 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('list')), String('17'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('list'))).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('tabs')), String('19'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('tabs'))).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010048 end');
    });

    /**
     * @tc.name   testSbmKeyVol010049
     * @tc.number SUB_MNB_SBM_0619
     * @tc.desc   side bar mode key 'list\n' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010049 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('list\n');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('list')), String('17'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('list'))).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('tabs')), String('19'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('tabs'))).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010049 end');
    });

    /**
     * @tc.name   testSbmKeyVol010050
     * @tc.number SUB_MNB_SBM_0620
     * @tc.desc   side bar mode key 'tabs\n' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010050 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('tabs\n');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('list')), String('17'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('list'))).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('tabs')), String('19'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('tabs'))).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 19).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 19).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010050 end');
    });

    /**
     * @tc.name   testSbmKeyVol010051
     * @tc.number SUB_MNB_SBM_0621
     * @tc.desc   side bar mode key 'list' against slots 27/29 resolves to 27
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010051 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('27'));
      expect(String(result)).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010051 end');
    });

    /**
     * @tc.name   testSbmKeyVol010052
     * @tc.number SUB_MNB_SBM_0622
     * @tc.desc   side bar mode key 'tabs' against slots 27/29 resolves to 29
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010052 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('29'));
      expect(String(result)).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010052 end');
    });

    /**
     * @tc.name   testSbmKeyVol010053
     * @tc.number SUB_MNB_SBM_0623
     * @tc.desc   side bar mode key '' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010053 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010053 end');
    });

    /**
     * @tc.name   testSbmKeyVol010054
     * @tc.number SUB_MNB_SBM_0624
     * @tc.desc   side bar mode key 'List' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010054 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('List');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010054 end');
    });

    /**
     * @tc.name   testSbmKeyVol010055
     * @tc.number SUB_MNB_SBM_0625
     * @tc.desc   side bar mode key 'TABS' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010055 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('TABS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010055 end');
    });

    /**
     * @tc.name   testSbmKeyVol010056
     * @tc.number SUB_MNB_SBM_0626
     * @tc.desc   side bar mode key 'tabs ' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010056 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('tabs ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010056 end');
    });

    /**
     * @tc.name   testSbmKeyVol010057
     * @tc.number SUB_MNB_SBM_0627
     * @tc.desc   side bar mode key ' tab' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010057 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue(' tab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010057 end');
    });

    /**
     * @tc.name   testSbmKeyVol010058
     * @tc.number SUB_MNB_SBM_0628
     * @tc.desc   side bar mode key 'vertical' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010058 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('vertical');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010058 end');
    });

    /**
     * @tc.name   testSbmKeyVol010059
     * @tc.number SUB_MNB_SBM_0629
     * @tc.desc   side bar mode key '0' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010059 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010059 end');
    });

    /**
     * @tc.name   testSbmKeyVol010060
     * @tc.number SUB_MNB_SBM_0630
     * @tc.desc   side bar mode key 'listtabs' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010060 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('listtabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010060 end');
    });

    /**
     * @tc.name   testSbmKeyVol010061
     * @tc.number SUB_MNB_SBM_0631
     * @tc.desc   side bar mode key 'LIST' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010061 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('LIST');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010061 end');
    });

    /**
     * @tc.name   testSbmKeyVol010062
     * @tc.number SUB_MNB_SBM_0632
     * @tc.desc   side bar mode key 'list\t' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010062 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('list\t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010062 end');
    });

    /**
     * @tc.name   testSbmKeyVol010063
     * @tc.number SUB_MNB_SBM_0633
     * @tc.desc   side bar mode key '\tlist' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010063 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('\tlist');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010063 end');
    });

    /**
     * @tc.name   testSbmKeyVol010064
     * @tc.number SUB_MNB_SBM_0634
     * @tc.desc   side bar mode key 'lists' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010064 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('lists');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010064 end');
    });

    /**
     * @tc.name   testSbmKeyVol010065
     * @tc.number SUB_MNB_SBM_0635
     * @tc.desc   side bar mode key 'tab' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010065 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('tab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010065 end');
    });

    /**
     * @tc.name   testSbmKeyVol010066
     * @tc.number SUB_MNB_SBM_0636
     * @tc.desc   side bar mode key 'LIST ' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010066 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('LIST ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010066 end');
    });

    /**
     * @tc.name   testSbmKeyVol010067
     * @tc.number SUB_MNB_SBM_0637
     * @tc.desc   side bar mode key 'Tabs' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010067 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('Tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010067 end');
    });

    /**
     * @tc.name   testSbmKeyVol010068
     * @tc.number SUB_MNB_SBM_0638
     * @tc.desc   side bar mode key 'list list' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010068 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('list list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010068 end');
    });

    /**
     * @tc.name   testSbmKeyVol010069
     * @tc.number SUB_MNB_SBM_0639
     * @tc.desc   side bar mode key 'tabs\t' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010069 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('tabs\t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010069 end');
    });

    /**
     * @tc.name   testSbmKeyVol010070
     * @tc.number SUB_MNB_SBM_0640
     * @tc.desc   side bar mode key 'tabss' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010070 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('tabss');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010070 end');
    });

    /**
     * @tc.name   testSbmKeyVol010071
     * @tc.number SUB_MNB_SBM_0641
     * @tc.desc   side bar mode key 'lsit' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010071 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('lsit');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010071 end');
    });

    /**
     * @tc.name   testSbmKeyVol010072
     * @tc.number SUB_MNB_SBM_0642
     * @tc.desc   side bar mode key 'l' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010072 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('l');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010072 end');
    });

    /**
     * @tc.name   testSbmKeyVol010073
     * @tc.number SUB_MNB_SBM_0643
     * @tc.desc   side bar mode key 't' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010073 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010073 end');
    });

    /**
     * @tc.name   testSbmKeyVol010074
     * @tc.number SUB_MNB_SBM_0644
     * @tc.desc   side bar mode key 'list\n' against slots 27/29 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010074 begin');
      const result: number | undefined = new SideBarMode<number>(27, 29).GetValue('list\n');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('list')), String('27'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('list'))).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('tabs')), String('29'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('tabs'))).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 29).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 29).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010074 end');
    });

    /**
     * @tc.name   testSbmKeyVol010075
     * @tc.number SUB_MNB_SBM_0645
     * @tc.desc   Anchor: 'list\n' carries a trailing newline and is not the list mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010075 begin');
      const sut: SideBarMode<number> = new SideBarMode<number>(4, 8);
      const newline: string = 'list\n';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'newline=%{public}s list=%{public}s', String(sut.GetValue(newline)),
        String(sut.GetValue('list')));
      expect(String(sut.GetValue(newline))).assertEqual('undefined');
      expect(sut.GetValue('list')).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check sut.GetValue(\'tabs\')');
      expect(sut.GetValue('tabs')).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010075 end');
    });
  });
}
