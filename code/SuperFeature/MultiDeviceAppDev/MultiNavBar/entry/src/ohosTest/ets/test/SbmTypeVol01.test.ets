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

export default function sbmTypeVol01Test() {
  describe('MultiNavBarSbmTypeVol01', () => {

    /**
     * @tc.name   testSbmTypeVol010001
     * @tc.number SUB_MNB_SBM_0421
     * @tc.desc   SideBarMode<number>(1/500) probed with 'list' returns 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010001 begin');
      const result: number | undefined = new SideBarMode<number>(1, 500).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(String(result)).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(1, 500).GetValue('tabs')), String('500'));
      expect(String(new SideBarMode<number>(1, 500).GetValue('tabs'))).assertEqual('500');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(1, 500).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(1, 500).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(1, 500).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(1, 500).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(1, 500).GetValue('')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(1, 500).GetValue('')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010001 end');
    });

    /**
     * @tc.name   testSbmTypeVol010002
     * @tc.number SUB_MNB_SBM_0422
     * @tc.desc   SideBarMode<number>(2/501) probed with 'tabs' returns 501
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010002 begin');
      const result: number | undefined = new SideBarMode<number>(2, 501).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('501'));
      expect(String(result)).assertEqual('501');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(2, 501).GetValue('list')), String('2'));
      expect(String(new SideBarMode<number>(2, 501).GetValue('list'))).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(2, 501).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(2, 501).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(2, 501).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(2, 501).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(2, 501).GetValue('List')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(2, 501).GetValue('List')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010002 end');
    });

    /**
     * @tc.name   testSbmTypeVol010003
     * @tc.number SUB_MNB_SBM_0423
     * @tc.desc   SideBarMode<number>(3/502) probed with 'list' returns 3
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010003 begin');
      const result: number | undefined = new SideBarMode<number>(3, 502).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('3'));
      expect(String(result)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(3, 502).GetValue('tabs')), String('502'));
      expect(String(new SideBarMode<number>(3, 502).GetValue('tabs'))).assertEqual('502');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(3, 502).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(3, 502).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(3, 502).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(3, 502).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(3, 502).GetValue('TABS')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(3, 502).GetValue('TABS')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010003 end');
    });

    /**
     * @tc.name   testSbmTypeVol010004
     * @tc.number SUB_MNB_SBM_0424
     * @tc.desc   SideBarMode<number>(4/503) probed with 'tabs' returns 503
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010004 begin');
      const result: number | undefined = new SideBarMode<number>(4, 503).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('503'));
      expect(String(result)).assertEqual('503');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(4, 503).GetValue('list')), String('4'));
      expect(String(new SideBarMode<number>(4, 503).GetValue('list'))).assertEqual('4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(4, 503).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(4, 503).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(4, 503).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(4, 503).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(4, 503).GetValue('tabs ')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(4, 503).GetValue('tabs ')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010004 end');
    });

    /**
     * @tc.name   testSbmTypeVol010005
     * @tc.number SUB_MNB_SBM_0425
     * @tc.desc   SideBarMode<number>(5/504) probed with 'list' returns 5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010005 begin');
      const result: number | undefined = new SideBarMode<number>(5, 504).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('5'));
      expect(String(result)).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(5, 504).GetValue('tabs')), String('504'));
      expect(String(new SideBarMode<number>(5, 504).GetValue('tabs'))).assertEqual('504');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(5, 504).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(5, 504).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(5, 504).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(5, 504).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(5, 504).GetValue(' tab')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(5, 504).GetValue(' tab')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010005 end');
    });

    /**
     * @tc.name   testSbmTypeVol010006
     * @tc.number SUB_MNB_SBM_0426
     * @tc.desc   SideBarMode<number>(6/505) probed with 'tabs' returns 505
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010006 begin');
      const result: number | undefined = new SideBarMode<number>(6, 505).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('505'));
      expect(String(result)).assertEqual('505');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(6, 505).GetValue('list')), String('6'));
      expect(String(new SideBarMode<number>(6, 505).GetValue('list'))).assertEqual('6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(6, 505).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(6, 505).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(6, 505).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(6, 505).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(6, 505).GetValue('vertical')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(6, 505).GetValue('vertical')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010006 end');
    });

    /**
     * @tc.name   testSbmTypeVol010007
     * @tc.number SUB_MNB_SBM_0427
     * @tc.desc   SideBarMode<number>(7/506) probed with 'list' returns 7
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010007 begin');
      const result: number | undefined = new SideBarMode<number>(7, 506).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('7'));
      expect(String(result)).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 506).GetValue('tabs')), String('506'));
      expect(String(new SideBarMode<number>(7, 506).GetValue('tabs'))).assertEqual('506');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 506).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 506).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(7, 506).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(7, 506).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(7, 506).GetValue('0')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(7, 506).GetValue('0')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010007 end');
    });

    /**
     * @tc.name   testSbmTypeVol010008
     * @tc.number SUB_MNB_SBM_0428
     * @tc.desc   SideBarMode<number>(8/507) probed with 'tabs' returns 507
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010008 begin');
      const result: number | undefined = new SideBarMode<number>(8, 507).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('507'));
      expect(String(result)).assertEqual('507');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(8, 507).GetValue('list')), String('8'));
      expect(String(new SideBarMode<number>(8, 507).GetValue('list'))).assertEqual('8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(8, 507).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(8, 507).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(8, 507).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(8, 507).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(8, 507).GetValue('listtabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(8, 507).GetValue('listtabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010008 end');
    });

    /**
     * @tc.name   testSbmTypeVol010009
     * @tc.number SUB_MNB_SBM_0429
     * @tc.desc   SideBarMode<number>(9/508) probed with 'list' returns 9
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010009 begin');
      const result: number | undefined = new SideBarMode<number>(9, 508).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('9'));
      expect(String(result)).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(9, 508).GetValue('tabs')), String('508'));
      expect(String(new SideBarMode<number>(9, 508).GetValue('tabs'))).assertEqual('508');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(9, 508).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(9, 508).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(9, 508).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(9, 508).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(9, 508).GetValue('LIST')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(9, 508).GetValue('LIST')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010009 end');
    });

    /**
     * @tc.name   testSbmTypeVol010010
     * @tc.number SUB_MNB_SBM_0430
     * @tc.desc   SideBarMode<number>(10/509) probed with 'tabs' returns 509
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010010 begin');
      const result: number | undefined = new SideBarMode<number>(10, 509).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('509'));
      expect(String(result)).assertEqual('509');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(10, 509).GetValue('list')), String('10'));
      expect(String(new SideBarMode<number>(10, 509).GetValue('list'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(10, 509).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(10, 509).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(10, 509).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(10, 509).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(10, 509).GetValue('lists')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(10, 509).GetValue('lists')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010010 end');
    });

    /**
     * @tc.name   testSbmTypeVol010011
     * @tc.number SUB_MNB_SBM_0431
     * @tc.desc   SideBarMode<number>(11/510) probed with 'list' returns 11
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010011 begin');
      const result: number | undefined = new SideBarMode<number>(11, 510).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11'));
      expect(String(result)).assertEqual('11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(11, 510).GetValue('tabs')), String('510'));
      expect(String(new SideBarMode<number>(11, 510).GetValue('tabs'))).assertEqual('510');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(11, 510).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(11, 510).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(11, 510).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(11, 510).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(11, 510).GetValue('')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(11, 510).GetValue('')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010011 end');
    });

    /**
     * @tc.name   testSbmTypeVol010012
     * @tc.number SUB_MNB_SBM_0432
     * @tc.desc   SideBarMode<number>(12/511) probed with 'tabs' returns 511
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010012 begin');
      const result: number | undefined = new SideBarMode<number>(12, 511).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('511'));
      expect(String(result)).assertEqual('511');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(12, 511).GetValue('list')), String('12'));
      expect(String(new SideBarMode<number>(12, 511).GetValue('list'))).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(12, 511).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(12, 511).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(12, 511).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(12, 511).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(12, 511).GetValue('List')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(12, 511).GetValue('List')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010012 end');
    });

    /**
     * @tc.name   testSbmTypeVol010013
     * @tc.number SUB_MNB_SBM_0433
     * @tc.desc   SideBarMode<number>(13/512) probed with 'list' returns 13
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010013 begin');
      const result: number | undefined = new SideBarMode<number>(13, 512).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('13'));
      expect(String(result)).assertEqual('13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(13, 512).GetValue('tabs')), String('512'));
      expect(String(new SideBarMode<number>(13, 512).GetValue('tabs'))).assertEqual('512');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(13, 512).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(13, 512).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(13, 512).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(13, 512).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(13, 512).GetValue('TABS')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(13, 512).GetValue('TABS')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010013 end');
    });

    /**
     * @tc.name   testSbmTypeVol010014
     * @tc.number SUB_MNB_SBM_0434
     * @tc.desc   SideBarMode<number>(14/513) probed with 'tabs' returns 513
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010014 begin');
      const result: number | undefined = new SideBarMode<number>(14, 513).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('513'));
      expect(String(result)).assertEqual('513');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(14, 513).GetValue('list')), String('14'));
      expect(String(new SideBarMode<number>(14, 513).GetValue('list'))).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(14, 513).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(14, 513).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(14, 513).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(14, 513).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(14, 513).GetValue('tabs ')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(14, 513).GetValue('tabs ')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010014 end');
    });

    /**
     * @tc.name   testSbmTypeVol010015
     * @tc.number SUB_MNB_SBM_0435
     * @tc.desc   SideBarMode<number>(15/514) probed with 'list' returns 15
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010015 begin');
      const result: number | undefined = new SideBarMode<number>(15, 514).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('15'));
      expect(String(result)).assertEqual('15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(15, 514).GetValue('tabs')), String('514'));
      expect(String(new SideBarMode<number>(15, 514).GetValue('tabs'))).assertEqual('514');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(15, 514).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(15, 514).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(15, 514).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(15, 514).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(15, 514).GetValue(' tab')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(15, 514).GetValue(' tab')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010015 end');
    });

    /**
     * @tc.name   testSbmTypeVol010016
     * @tc.number SUB_MNB_SBM_0436
     * @tc.desc   SideBarMode<number>(16/515) probed with 'tabs' returns 515
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010016 begin');
      const result: number | undefined = new SideBarMode<number>(16, 515).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('515'));
      expect(String(result)).assertEqual('515');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(16, 515).GetValue('list')), String('16'));
      expect(String(new SideBarMode<number>(16, 515).GetValue('list'))).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(16, 515).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(16, 515).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(16, 515).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(16, 515).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(16, 515).GetValue('vertical')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(16, 515).GetValue('vertical')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010016 end');
    });

    /**
     * @tc.name   testSbmTypeVol010017
     * @tc.number SUB_MNB_SBM_0437
     * @tc.desc   SideBarMode<number>(17/516) probed with 'list' returns 17
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010017 begin');
      const result: number | undefined = new SideBarMode<number>(17, 516).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('17'));
      expect(String(result)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 516).GetValue('tabs')), String('516'));
      expect(String(new SideBarMode<number>(17, 516).GetValue('tabs'))).assertEqual('516');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 516).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 516).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(17, 516).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(17, 516).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(17, 516).GetValue('0')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(17, 516).GetValue('0')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010017 end');
    });

    /**
     * @tc.name   testSbmTypeVol010018
     * @tc.number SUB_MNB_SBM_0438
     * @tc.desc   SideBarMode<number>(18/517) probed with 'tabs' returns 517
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010018 begin');
      const result: number | undefined = new SideBarMode<number>(18, 517).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('517'));
      expect(String(result)).assertEqual('517');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(18, 517).GetValue('list')), String('18'));
      expect(String(new SideBarMode<number>(18, 517).GetValue('list'))).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(18, 517).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(18, 517).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(18, 517).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(18, 517).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(18, 517).GetValue('listtabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(18, 517).GetValue('listtabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010018 end');
    });

    /**
     * @tc.name   testSbmTypeVol010019
     * @tc.number SUB_MNB_SBM_0439
     * @tc.desc   SideBarMode<number>(19/518) probed with 'list' returns 19
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010019 begin');
      const result: number | undefined = new SideBarMode<number>(19, 518).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('19'));
      expect(String(result)).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(19, 518).GetValue('tabs')), String('518'));
      expect(String(new SideBarMode<number>(19, 518).GetValue('tabs'))).assertEqual('518');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(19, 518).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(19, 518).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(19, 518).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(19, 518).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(19, 518).GetValue('LIST')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(19, 518).GetValue('LIST')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010019 end');
    });

    /**
     * @tc.name   testSbmTypeVol010020
     * @tc.number SUB_MNB_SBM_0440
     * @tc.desc   SideBarMode<number>(20/519) probed with 'tabs' returns 519
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010020 begin');
      const result: number | undefined = new SideBarMode<number>(20, 519).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('519'));
      expect(String(result)).assertEqual('519');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(20, 519).GetValue('list')), String('20'));
      expect(String(new SideBarMode<number>(20, 519).GetValue('list'))).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(20, 519).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(20, 519).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(20, 519).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(20, 519).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(20, 519).GetValue('lists')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(20, 519).GetValue('lists')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010020 end');
    });

    /**
     * @tc.name   testSbmTypeVol010021
     * @tc.number SUB_MNB_SBM_0441
     * @tc.desc   SideBarMode<number>(21/520) probed with 'list' returns 21
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010021 begin');
      const result: number | undefined = new SideBarMode<number>(21, 520).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('21'));
      expect(String(result)).assertEqual('21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(21, 520).GetValue('tabs')), String('520'));
      expect(String(new SideBarMode<number>(21, 520).GetValue('tabs'))).assertEqual('520');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(21, 520).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(21, 520).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(21, 520).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(21, 520).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(21, 520).GetValue('')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(21, 520).GetValue('')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010021 end');
    });

    /**
     * @tc.name   testSbmTypeVol010022
     * @tc.number SUB_MNB_SBM_0442
     * @tc.desc   SideBarMode<number>(22/521) probed with 'tabs' returns 521
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010022 begin');
      const result: number | undefined = new SideBarMode<number>(22, 521).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('521'));
      expect(String(result)).assertEqual('521');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(22, 521).GetValue('list')), String('22'));
      expect(String(new SideBarMode<number>(22, 521).GetValue('list'))).assertEqual('22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(22, 521).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(22, 521).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(22, 521).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(22, 521).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(22, 521).GetValue('List')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(22, 521).GetValue('List')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010022 end');
    });

    /**
     * @tc.name   testSbmTypeVol010023
     * @tc.number SUB_MNB_SBM_0443
     * @tc.desc   SideBarMode<number>(23/522) probed with 'list' returns 23
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010023 begin');
      const result: number | undefined = new SideBarMode<number>(23, 522).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('23'));
      expect(String(result)).assertEqual('23');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(23, 522).GetValue('tabs')), String('522'));
      expect(String(new SideBarMode<number>(23, 522).GetValue('tabs'))).assertEqual('522');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(23, 522).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(23, 522).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(23, 522).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(23, 522).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(23, 522).GetValue('TABS')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(23, 522).GetValue('TABS')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010023 end');
    });

    /**
     * @tc.name   testSbmTypeVol010024
     * @tc.number SUB_MNB_SBM_0444
     * @tc.desc   SideBarMode<number>(24/523) probed with 'tabs' returns 523
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010024 begin');
      const result: number | undefined = new SideBarMode<number>(24, 523).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('523'));
      expect(String(result)).assertEqual('523');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(24, 523).GetValue('list')), String('24'));
      expect(String(new SideBarMode<number>(24, 523).GetValue('list'))).assertEqual('24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(24, 523).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(24, 523).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(24, 523).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(24, 523).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(24, 523).GetValue('tabs ')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(24, 523).GetValue('tabs ')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010024 end');
    });

    /**
     * @tc.name   testSbmTypeVol010025
     * @tc.number SUB_MNB_SBM_0445
     * @tc.desc   SideBarMode<number>(25/524) probed with 'list' returns 25
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010025 begin');
      const result: number | undefined = new SideBarMode<number>(25, 524).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('25'));
      expect(String(result)).assertEqual('25');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(25, 524).GetValue('tabs')), String('524'));
      expect(String(new SideBarMode<number>(25, 524).GetValue('tabs'))).assertEqual('524');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(25, 524).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(25, 524).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(25, 524).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(25, 524).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(25, 524).GetValue(' tab')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(25, 524).GetValue(' tab')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010025 end');
    });

    /**
     * @tc.name   testSbmTypeVol010026
     * @tc.number SUB_MNB_SBM_0446
     * @tc.desc   SideBarMode<number>(26/525) probed with 'tabs' returns 525
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010026 begin');
      const result: number | undefined = new SideBarMode<number>(26, 525).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('525'));
      expect(String(result)).assertEqual('525');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(26, 525).GetValue('list')), String('26'));
      expect(String(new SideBarMode<number>(26, 525).GetValue('list'))).assertEqual('26');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(26, 525).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(26, 525).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(26, 525).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(26, 525).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(26, 525).GetValue('vertical')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(26, 525).GetValue('vertical')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010026 end');
    });

    /**
     * @tc.name   testSbmTypeVol010027
     * @tc.number SUB_MNB_SBM_0447
     * @tc.desc   SideBarMode<number>(27/526) probed with 'list' returns 27
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010027 begin');
      const result: number | undefined = new SideBarMode<number>(27, 526).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('27'));
      expect(String(result)).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 526).GetValue('tabs')), String('526'));
      expect(String(new SideBarMode<number>(27, 526).GetValue('tabs'))).assertEqual('526');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 526).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 526).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(27, 526).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(27, 526).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(27, 526).GetValue('0')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(27, 526).GetValue('0')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010027 end');
    });

    /**
     * @tc.name   testSbmTypeVol010028
     * @tc.number SUB_MNB_SBM_0448
     * @tc.desc   SideBarMode<number>(28/527) probed with 'tabs' returns 527
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010028 begin');
      const result: number | undefined = new SideBarMode<number>(28, 527).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('527'));
      expect(String(result)).assertEqual('527');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(28, 527).GetValue('list')), String('28'));
      expect(String(new SideBarMode<number>(28, 527).GetValue('list'))).assertEqual('28');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(28, 527).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(28, 527).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(28, 527).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(28, 527).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(28, 527).GetValue('listtabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(28, 527).GetValue('listtabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010028 end');
    });

    /**
     * @tc.name   testSbmTypeVol010029
     * @tc.number SUB_MNB_SBM_0449
     * @tc.desc   SideBarMode<number>(29/528) probed with 'list' returns 29
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010029 begin');
      const result: number | undefined = new SideBarMode<number>(29, 528).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('29'));
      expect(String(result)).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(29, 528).GetValue('tabs')), String('528'));
      expect(String(new SideBarMode<number>(29, 528).GetValue('tabs'))).assertEqual('528');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(29, 528).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(29, 528).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(29, 528).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(29, 528).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(29, 528).GetValue('LIST')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(29, 528).GetValue('LIST')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010029 end');
    });

    /**
     * @tc.name   testSbmTypeVol010030
     * @tc.number SUB_MNB_SBM_0450
     * @tc.desc   SideBarMode<number>(30/529) probed with 'tabs' returns 529
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010030 begin');
      const result: number | undefined = new SideBarMode<number>(30, 529).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('529'));
      expect(String(result)).assertEqual('529');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(30, 529).GetValue('list')), String('30'));
      expect(String(new SideBarMode<number>(30, 529).GetValue('list'))).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(30, 529).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(30, 529).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(30, 529).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(30, 529).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(30, 529).GetValue('lists')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(30, 529).GetValue('lists')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010030 end');
    });

    /**
     * @tc.name   testSbmTypeVol010031
     * @tc.number SUB_MNB_SBM_0451
     * @tc.desc   SideBarMode<number>(31/530) probed with 'list' returns 31
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010031 begin');
      const result: number | undefined = new SideBarMode<number>(31, 530).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('31'));
      expect(String(result)).assertEqual('31');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(31, 530).GetValue('tabs')), String('530'));
      expect(String(new SideBarMode<number>(31, 530).GetValue('tabs'))).assertEqual('530');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(31, 530).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(31, 530).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(31, 530).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(31, 530).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(31, 530).GetValue('')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(31, 530).GetValue('')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010031 end');
    });

    /**
     * @tc.name   testSbmTypeVol010032
     * @tc.number SUB_MNB_SBM_0452
     * @tc.desc   SideBarMode<number>(32/531) probed with 'tabs' returns 531
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010032 begin');
      const result: number | undefined = new SideBarMode<number>(32, 531).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('531'));
      expect(String(result)).assertEqual('531');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(32, 531).GetValue('list')), String('32'));
      expect(String(new SideBarMode<number>(32, 531).GetValue('list'))).assertEqual('32');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(32, 531).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(32, 531).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(32, 531).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(32, 531).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(32, 531).GetValue('List')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(32, 531).GetValue('List')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010032 end');
    });

    /**
     * @tc.name   testSbmTypeVol010033
     * @tc.number SUB_MNB_SBM_0453
     * @tc.desc   SideBarMode<number>(33/532) probed with 'list' returns 33
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010033 begin');
      const result: number | undefined = new SideBarMode<number>(33, 532).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('33'));
      expect(String(result)).assertEqual('33');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(33, 532).GetValue('tabs')), String('532'));
      expect(String(new SideBarMode<number>(33, 532).GetValue('tabs'))).assertEqual('532');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(33, 532).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(33, 532).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(33, 532).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(33, 532).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(33, 532).GetValue('TABS')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(33, 532).GetValue('TABS')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010033 end');
    });

    /**
     * @tc.name   testSbmTypeVol010034
     * @tc.number SUB_MNB_SBM_0454
     * @tc.desc   SideBarMode<number>(34/533) probed with 'tabs' returns 533
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010034 begin');
      const result: number | undefined = new SideBarMode<number>(34, 533).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('533'));
      expect(String(result)).assertEqual('533');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(34, 533).GetValue('list')), String('34'));
      expect(String(new SideBarMode<number>(34, 533).GetValue('list'))).assertEqual('34');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(34, 533).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(34, 533).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(34, 533).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(34, 533).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(34, 533).GetValue('tabs ')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(34, 533).GetValue('tabs ')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010034 end');
    });

    /**
     * @tc.name   testSbmTypeVol010035
     * @tc.number SUB_MNB_SBM_0455
     * @tc.desc   SideBarMode<number>(35/534) probed with 'list' returns 35
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010035 begin');
      const result: number | undefined = new SideBarMode<number>(35, 534).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('35'));
      expect(String(result)).assertEqual('35');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(35, 534).GetValue('tabs')), String('534'));
      expect(String(new SideBarMode<number>(35, 534).GetValue('tabs'))).assertEqual('534');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(35, 534).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(35, 534).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(35, 534).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(35, 534).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(35, 534).GetValue(' tab')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(35, 534).GetValue(' tab')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010035 end');
    });

    /**
     * @tc.name   testSbmTypeVol010036
     * @tc.number SUB_MNB_SBM_0456
     * @tc.desc   SideBarMode<number>(36/535) probed with 'tabs' returns 535
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010036 begin');
      const result: number | undefined = new SideBarMode<number>(36, 535).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('535'));
      expect(String(result)).assertEqual('535');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(36, 535).GetValue('list')), String('36'));
      expect(String(new SideBarMode<number>(36, 535).GetValue('list'))).assertEqual('36');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(36, 535).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(36, 535).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(36, 535).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(36, 535).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(36, 535).GetValue('vertical')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(36, 535).GetValue('vertical')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010036 end');
    });

    /**
     * @tc.name   testSbmTypeVol010037
     * @tc.number SUB_MNB_SBM_0457
     * @tc.desc   SideBarMode<number>(37/536) probed with 'list' returns 37
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010037 begin');
      const result: number | undefined = new SideBarMode<number>(37, 536).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('37'));
      expect(String(result)).assertEqual('37');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(37, 536).GetValue('tabs')), String('536'));
      expect(String(new SideBarMode<number>(37, 536).GetValue('tabs'))).assertEqual('536');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(37, 536).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(37, 536).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(37, 536).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(37, 536).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(37, 536).GetValue('0')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(37, 536).GetValue('0')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010037 end');
    });

    /**
     * @tc.name   testSbmTypeVol010038
     * @tc.number SUB_MNB_SBM_0458
     * @tc.desc   SideBarMode<number>(38/537) probed with 'tabs' returns 537
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010038 begin');
      const result: number | undefined = new SideBarMode<number>(38, 537).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('537'));
      expect(String(result)).assertEqual('537');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(38, 537).GetValue('list')), String('38'));
      expect(String(new SideBarMode<number>(38, 537).GetValue('list'))).assertEqual('38');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(38, 537).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(38, 537).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(38, 537).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(38, 537).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(38, 537).GetValue('listtabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(38, 537).GetValue('listtabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010038 end');
    });

  });
}
