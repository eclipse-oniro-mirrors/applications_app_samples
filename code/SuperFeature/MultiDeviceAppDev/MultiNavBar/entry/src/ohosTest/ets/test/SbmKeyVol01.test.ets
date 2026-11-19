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
import { SideBarMode } from '../../../main/ets/common/BreakpointSystem';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function sbmKeyVol01Test() {
  describe('MultiNavBarSbmKeyVol01', () => {

    /**
     * @tc.name   testSbmKeyVol010001
     * @tc.number SUB_MNB_SBM_0571
     * @tc.desc   side bar mode key 'list' against slots 7/9 resolves to 7
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010001 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('7'));
      expect(String(result)).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010001 end');
    });

    /**
     * @tc.name   testSbmKeyVol010002
     * @tc.number SUB_MNB_SBM_0572
     * @tc.desc   side bar mode key 'tabs' against slots 7/9 resolves to 9
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010002 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('9'));
      expect(String(result)).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010002 end');
    });

    /**
     * @tc.name   testSbmKeyVol010003
     * @tc.number SUB_MNB_SBM_0573
     * @tc.desc   side bar mode key '' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010003 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010003 end');
    });

    /**
     * @tc.name   testSbmKeyVol010004
     * @tc.number SUB_MNB_SBM_0574
     * @tc.desc   side bar mode key 'List' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010004 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('List');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010004 end');
    });

    /**
     * @tc.name   testSbmKeyVol010005
     * @tc.number SUB_MNB_SBM_0575
     * @tc.desc   side bar mode key 'TABS' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010005 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('TABS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010005 end');
    });

    /**
     * @tc.name   testSbmKeyVol010006
     * @tc.number SUB_MNB_SBM_0576
     * @tc.desc   side bar mode key 'tabs ' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010006 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('tabs ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010006 end');
    });

    /**
     * @tc.name   testSbmKeyVol010007
     * @tc.number SUB_MNB_SBM_0577
     * @tc.desc   side bar mode key ' tab' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010007 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue(' tab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010007 end');
    });

    /**
     * @tc.name   testSbmKeyVol010008
     * @tc.number SUB_MNB_SBM_0578
     * @tc.desc   side bar mode key 'vertical' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010008 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('vertical');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010008 end');
    });

    /**
     * @tc.name   testSbmKeyVol010009
     * @tc.number SUB_MNB_SBM_0579
     * @tc.desc   side bar mode key '0' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010009 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010009 end');
    });

    /**
     * @tc.name   testSbmKeyVol010010
     * @tc.number SUB_MNB_SBM_0580
     * @tc.desc   side bar mode key 'listtabs' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010010 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('listtabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010010 end');
    });

    /**
     * @tc.name   testSbmKeyVol010011
     * @tc.number SUB_MNB_SBM_0581
     * @tc.desc   side bar mode key 'LIST' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010011 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('LIST');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010011 end');
    });

    /**
     * @tc.name   testSbmKeyVol010012
     * @tc.number SUB_MNB_SBM_0582
     * @tc.desc   side bar mode key 'list\t' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010012 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('list\t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010012 end');
    });

    /**
     * @tc.name   testSbmKeyVol010013
     * @tc.number SUB_MNB_SBM_0583
     * @tc.desc   side bar mode key '\tlist' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010013 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('\tlist');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010013 end');
    });

    /**
     * @tc.name   testSbmKeyVol010014
     * @tc.number SUB_MNB_SBM_0584
     * @tc.desc   side bar mode key 'lists' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010014 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('lists');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010014 end');
    });

    /**
     * @tc.name   testSbmKeyVol010015
     * @tc.number SUB_MNB_SBM_0585
     * @tc.desc   side bar mode key 'tab' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010015 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('tab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010015 end');
    });

    /**
     * @tc.name   testSbmKeyVol010016
     * @tc.number SUB_MNB_SBM_0586
     * @tc.desc   side bar mode key 'LIST ' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010016 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('LIST ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010016 end');
    });

    /**
     * @tc.name   testSbmKeyVol010017
     * @tc.number SUB_MNB_SBM_0587
     * @tc.desc   side bar mode key 'Tabs' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010017 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('Tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010017 end');
    });

    /**
     * @tc.name   testSbmKeyVol010018
     * @tc.number SUB_MNB_SBM_0588
     * @tc.desc   side bar mode key 'list list' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010018 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('list list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010018 end');
    });

    /**
     * @tc.name   testSbmKeyVol010019
     * @tc.number SUB_MNB_SBM_0589
     * @tc.desc   side bar mode key 'tabs\t' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010019 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('tabs\t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010019 end');
    });

    /**
     * @tc.name   testSbmKeyVol010020
     * @tc.number SUB_MNB_SBM_0590
     * @tc.desc   side bar mode key 'tabss' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010020 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('tabss');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010020 end');
    });

    /**
     * @tc.name   testSbmKeyVol010021
     * @tc.number SUB_MNB_SBM_0591
     * @tc.desc   side bar mode key 'lsit' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010021 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('lsit');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010021 end');
    });

    /**
     * @tc.name   testSbmKeyVol010022
     * @tc.number SUB_MNB_SBM_0592
     * @tc.desc   side bar mode key 'l' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010022 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('l');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010022 end');
    });

    /**
     * @tc.name   testSbmKeyVol010023
     * @tc.number SUB_MNB_SBM_0593
     * @tc.desc   side bar mode key 't' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010023 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010023 end');
    });

    /**
     * @tc.name   testSbmKeyVol010024
     * @tc.number SUB_MNB_SBM_0594
     * @tc.desc   side bar mode key 'list\n' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010024 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('list\n');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010024 end');
    });

    /**
     * @tc.name   testSbmKeyVol010025
     * @tc.number SUB_MNB_SBM_0595
     * @tc.desc   side bar mode key 'tabs\n' against slots 7/9 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010025 begin');
      const result: number | undefined = new SideBarMode<number>(7, 9).GetValue('tabs\n');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('undefined'));
      expect(String(result)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('list')), String('7'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('list'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('tabs')), String('9'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('tabs'))).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 9).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 9).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010025 end');
    });

    /**
     * @tc.name   testSbmKeyVol010026
     * @tc.number SUB_MNB_SBM_0596
     * @tc.desc   side bar mode key 'list' against slots 17/19 resolves to 17
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010026 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('17'));
      expect(String(result)).assertEqual('17');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010026 end');
    });

    /**
     * @tc.name   testSbmKeyVol010027
     * @tc.number SUB_MNB_SBM_0597
     * @tc.desc   side bar mode key 'tabs' against slots 17/19 resolves to 19
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010027 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('19'));
      expect(String(result)).assertEqual('19');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010027 end');
    });

    /**
     * @tc.name   testSbmKeyVol010028
     * @tc.number SUB_MNB_SBM_0598
     * @tc.desc   side bar mode key '' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010028 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010028 end');
    });

    /**
     * @tc.name   testSbmKeyVol010029
     * @tc.number SUB_MNB_SBM_0599
     * @tc.desc   side bar mode key 'List' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010029 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('List');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010029 end');
    });

    /**
     * @tc.name   testSbmKeyVol010030
     * @tc.number SUB_MNB_SBM_0600
     * @tc.desc   side bar mode key 'TABS' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010030 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('TABS');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010030 end');
    });

    /**
     * @tc.name   testSbmKeyVol010031
     * @tc.number SUB_MNB_SBM_0601
     * @tc.desc   side bar mode key 'tabs ' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010031 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('tabs ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010031 end');
    });

    /**
     * @tc.name   testSbmKeyVol010032
     * @tc.number SUB_MNB_SBM_0602
     * @tc.desc   side bar mode key ' tab' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010032 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue(' tab');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010032 end');
    });

    /**
     * @tc.name   testSbmKeyVol010033
     * @tc.number SUB_MNB_SBM_0603
     * @tc.desc   side bar mode key 'vertical' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010033 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('vertical');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010033 end');
    });

    /**
     * @tc.name   testSbmKeyVol010034
     * @tc.number SUB_MNB_SBM_0604
     * @tc.desc   side bar mode key '0' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010034 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('0');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010034 end');
    });

    /**
     * @tc.name   testSbmKeyVol010035
     * @tc.number SUB_MNB_SBM_0605
     * @tc.desc   side bar mode key 'listtabs' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010035 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('listtabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010035 end');
    });

    /**
     * @tc.name   testSbmKeyVol010036
     * @tc.number SUB_MNB_SBM_0606
     * @tc.desc   side bar mode key 'LIST' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010036 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('LIST');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010036 end');
    });

    /**
     * @tc.name   testSbmKeyVol010037
     * @tc.number SUB_MNB_SBM_0607
     * @tc.desc   side bar mode key 'list\t' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010037 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('list\t');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010037 end');
    });

    /**
     * @tc.name   testSbmKeyVol010038
     * @tc.number SUB_MNB_SBM_0608
     * @tc.desc   side bar mode key '\tlist' against slots 17/19 resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmKeyVol010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010038 begin');
      const result: number | undefined = new SideBarMode<number>(17, 19).GetValue('\tlist');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmKeyVol010038 end');
    });

  });
}
