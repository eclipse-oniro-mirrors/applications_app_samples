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

// @volume rule=record basis=spec cases=38
// Volume cases, see section 4 of ohosTest.md for the generation rule. Hand-written anchor cases must be added
// to the same describe and marked with an @tc.desc starting with 'Anchor:'.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { sideListData } from '../../../main/ets/model/SideListData';
import { MenuType } from '../../../main/ets/model/MenuType';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function sldTableVol02Test() {
  describe('MultiNavBarSldTableVol02', () => {

    /**
     * @tc.name   testSldTableVol020001
     * @tc.number SUB_MNB_SLD_2198
     * @tc.desc   entry 0 owns two independent tab controllers and 3 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020001 begin');
      const result: MenuType = sideListData[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[1].subController), String('false'));
      expect(String(result.subController === sideListData[1].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('3'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020001 end');
    });

    /**
     * @tc.name   testSldTableVol020002
     * @tc.number SUB_MNB_SLD_2199
     * @tc.desc   entry 1 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020002 begin');
      const result: MenuType = sideListData[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[3].subController), String('false'));
      expect(String(result.subController === sideListData[3].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020002 end');
    });

    /**
     * @tc.name   testSldTableVol020003
     * @tc.number SUB_MNB_SLD_2200
     * @tc.desc   entry 2 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020003 begin');
      const result: MenuType = sideListData[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[0].subController), String('false'));
      expect(String(result.subController === sideListData[0].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020003 end');
    });

    /**
     * @tc.name   testSldTableVol020004
     * @tc.number SUB_MNB_SLD_2201
     * @tc.desc   entry 3 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020004 begin');
      const result: MenuType = sideListData[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[2].subController), String('false'));
      expect(String(result.subController === sideListData[2].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020004 end');
    });

    /**
     * @tc.name   testSldTableVol020005
     * @tc.number SUB_MNB_SLD_2202
     * @tc.desc   entry 4 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020005 begin');
      const result: MenuType = sideListData[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[0].subController), String('false'));
      expect(String(result.subController === sideListData[0].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020005 end');
    });

    /**
     * @tc.name   testSldTableVol020006
     * @tc.number SUB_MNB_SLD_2203
     * @tc.desc   entry 0 owns two independent tab controllers and 3 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020006 begin');
      const result: MenuType = sideListData[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[1].subController), String('false'));
      expect(String(result.subController === sideListData[1].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('3'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020006 end');
    });

    /**
     * @tc.name   testSldTableVol020007
     * @tc.number SUB_MNB_SLD_2204
     * @tc.desc   entry 1 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020007 begin');
      const result: MenuType = sideListData[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[3].subController), String('false'));
      expect(String(result.subController === sideListData[3].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020007 end');
    });

    /**
     * @tc.name   testSldTableVol020008
     * @tc.number SUB_MNB_SLD_2205
     * @tc.desc   entry 2 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020008 begin');
      const result: MenuType = sideListData[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[0].subController), String('false'));
      expect(String(result.subController === sideListData[0].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020008 end');
    });

    /**
     * @tc.name   testSldTableVol020009
     * @tc.number SUB_MNB_SLD_2206
     * @tc.desc   entry 3 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020009 begin');
      const result: MenuType = sideListData[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[2].subController), String('false'));
      expect(String(result.subController === sideListData[2].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020009 end');
    });

    /**
     * @tc.name   testSldTableVol020010
     * @tc.number SUB_MNB_SLD_2207
     * @tc.desc   entry 4 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020010 begin');
      const result: MenuType = sideListData[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[0].subController), String('false'));
      expect(String(result.subController === sideListData[0].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020010 end');
    });

    /**
     * @tc.name   testSldTableVol020011
     * @tc.number SUB_MNB_SLD_2208
     * @tc.desc   entry 0 owns two independent tab controllers and 3 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020011 begin');
      const result: MenuType = sideListData[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[1].subController), String('false'));
      expect(String(result.subController === sideListData[1].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('3'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020011 end');
    });

    /**
     * @tc.name   testSldTableVol020012
     * @tc.number SUB_MNB_SLD_2209
     * @tc.desc   entry 1 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020012 begin');
      const result: MenuType = sideListData[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[3].subController), String('false'));
      expect(String(result.subController === sideListData[3].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020012 end');
    });

    /**
     * @tc.name   testSldTableVol020013
     * @tc.number SUB_MNB_SLD_2210
     * @tc.desc   entry 2 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020013 begin');
      const result: MenuType = sideListData[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[0].subController), String('false'));
      expect(String(result.subController === sideListData[0].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020013 end');
    });

    /**
     * @tc.name   testSldTableVol020014
     * @tc.number SUB_MNB_SLD_2211
     * @tc.desc   entry 3 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020014 begin');
      const result: MenuType = sideListData[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[2].subController), String('false'));
      expect(String(result.subController === sideListData[2].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020014 end');
    });

    /**
     * @tc.name   testSldTableVol020015
     * @tc.number SUB_MNB_SLD_2212
     * @tc.desc   entry 4 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020015 begin');
      const result: MenuType = sideListData[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[0].subController), String('false'));
      expect(String(result.subController === sideListData[0].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020015 end');
    });

    /**
     * @tc.name   testSldTableVol020016
     * @tc.number SUB_MNB_SLD_2213
     * @tc.desc   entry 0 owns two independent tab controllers and 3 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020016 begin');
      const result: MenuType = sideListData[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[1].subController), String('false'));
      expect(String(result.subController === sideListData[1].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('3'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020016 end');
    });

    /**
     * @tc.name   testSldTableVol020017
     * @tc.number SUB_MNB_SLD_2214
     * @tc.desc   entry 1 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020017 begin');
      const result: MenuType = sideListData[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[3].subController), String('false'));
      expect(String(result.subController === sideListData[3].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020017 end');
    });

    /**
     * @tc.name   testSldTableVol020018
     * @tc.number SUB_MNB_SLD_2215
     * @tc.desc   entry 2 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020018 begin');
      const result: MenuType = sideListData[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[0].subController), String('false'));
      expect(String(result.subController === sideListData[0].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020018 end');
    });

    /**
     * @tc.name   testSldTableVol020019
     * @tc.number SUB_MNB_SLD_2216
     * @tc.desc   entry 3 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020019 begin');
      const result: MenuType = sideListData[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[2].subController), String('false'));
      expect(String(result.subController === sideListData[2].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020019 end');
    });

    /**
     * @tc.name   testSldTableVol020020
     * @tc.number SUB_MNB_SLD_2217
     * @tc.desc   entry 4 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020020 begin');
      const result: MenuType = sideListData[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[0].subController), String('false'));
      expect(String(result.subController === sideListData[0].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020020 end');
    });

    /**
     * @tc.name   testSldTableVol020021
     * @tc.number SUB_MNB_SLD_2218
     * @tc.desc   entry 0 owns two independent tab controllers and 3 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020021 begin');
      const result: MenuType = sideListData[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[1].subController), String('false'));
      expect(String(result.subController === sideListData[1].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('3'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020021 end');
    });

    /**
     * @tc.name   testSldTableVol020022
     * @tc.number SUB_MNB_SLD_2219
     * @tc.desc   entry 1 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020022 begin');
      const result: MenuType = sideListData[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[3].subController), String('false'));
      expect(String(result.subController === sideListData[3].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020022 end');
    });

    /**
     * @tc.name   testSldTableVol020023
     * @tc.number SUB_MNB_SLD_2220
     * @tc.desc   entry 2 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020023 begin');
      const result: MenuType = sideListData[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[0].subController), String('false'));
      expect(String(result.subController === sideListData[0].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020023 end');
    });

    /**
     * @tc.name   testSldTableVol020024
     * @tc.number SUB_MNB_SLD_2221
     * @tc.desc   entry 3 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020024 begin');
      const result: MenuType = sideListData[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[2].subController), String('false'));
      expect(String(result.subController === sideListData[2].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020024 end');
    });

    /**
     * @tc.name   testSldTableVol020025
     * @tc.number SUB_MNB_SLD_2222
     * @tc.desc   entry 4 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020025 begin');
      const result: MenuType = sideListData[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[0].subController), String('false'));
      expect(String(result.subController === sideListData[0].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020025 end');
    });

    /**
     * @tc.name   testSldTableVol020026
     * @tc.number SUB_MNB_SLD_2223
     * @tc.desc   entry 0 owns two independent tab controllers and 3 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020026 begin');
      const result: MenuType = sideListData[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[1].subController), String('false'));
      expect(String(result.subController === sideListData[1].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('3'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020026 end');
    });

    /**
     * @tc.name   testSldTableVol020027
     * @tc.number SUB_MNB_SLD_2224
     * @tc.desc   entry 1 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020027 begin');
      const result: MenuType = sideListData[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[3].subController), String('false'));
      expect(String(result.subController === sideListData[3].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020027 end');
    });

    /**
     * @tc.name   testSldTableVol020028
     * @tc.number SUB_MNB_SLD_2225
     * @tc.desc   entry 2 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020028 begin');
      const result: MenuType = sideListData[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[0].subController), String('false'));
      expect(String(result.subController === sideListData[0].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020028 end');
    });

    /**
     * @tc.name   testSldTableVol020029
     * @tc.number SUB_MNB_SLD_2226
     * @tc.desc   entry 3 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020029 begin');
      const result: MenuType = sideListData[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[2].subController), String('false'));
      expect(String(result.subController === sideListData[2].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020029 end');
    });

    /**
     * @tc.name   testSldTableVol020030
     * @tc.number SUB_MNB_SLD_2227
     * @tc.desc   entry 4 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020030 begin');
      const result: MenuType = sideListData[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[0].subController), String('false'));
      expect(String(result.subController === sideListData[0].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020030 end');
    });

    /**
     * @tc.name   testSldTableVol020031
     * @tc.number SUB_MNB_SLD_2228
     * @tc.desc   entry 0 owns two independent tab controllers and 3 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020031 begin');
      const result: MenuType = sideListData[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[1].subController), String('false'));
      expect(String(result.subController === sideListData[1].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('3'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020031 end');
    });

    /**
     * @tc.name   testSldTableVol020032
     * @tc.number SUB_MNB_SLD_2229
     * @tc.desc   entry 1 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020032 begin');
      const result: MenuType = sideListData[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[3].subController), String('false'));
      expect(String(result.subController === sideListData[3].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020032 end');
    });

    /**
     * @tc.name   testSldTableVol020033
     * @tc.number SUB_MNB_SLD_2230
     * @tc.desc   entry 2 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020033 begin');
      const result: MenuType = sideListData[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[0].subController), String('false'));
      expect(String(result.subController === sideListData[0].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020033 end');
    });

    /**
     * @tc.name   testSldTableVol020034
     * @tc.number SUB_MNB_SLD_2231
     * @tc.desc   entry 3 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020034 begin');
      const result: MenuType = sideListData[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[2].subController), String('false'));
      expect(String(result.subController === sideListData[2].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020034 end');
    });

    /**
     * @tc.name   testSldTableVol020035
     * @tc.number SUB_MNB_SLD_2232
     * @tc.desc   entry 4 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020035 begin');
      const result: MenuType = sideListData[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[0].subController), String('false'));
      expect(String(result.subController === sideListData[0].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020035 end');
    });

    /**
     * @tc.name   testSldTableVol020036
     * @tc.number SUB_MNB_SLD_2233
     * @tc.desc   entry 0 owns two independent tab controllers and 3 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020036 begin');
      const result: MenuType = sideListData[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[1].subController), String('false'));
      expect(String(result.subController === sideListData[1].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('3'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020036 end');
    });

    /**
     * @tc.name   testSldTableVol020037
     * @tc.number SUB_MNB_SLD_2234
     * @tc.desc   entry 1 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020037 begin');
      const result: MenuType = sideListData[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[3].subController), String('false'));
      expect(String(result.subController === sideListData[3].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020037 end');
    });

    /**
     * @tc.name   testSldTableVol020038
     * @tc.number SUB_MNB_SLD_2235
     * @tc.desc   entry 2 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020038 begin');
      const result: MenuType = sideListData[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController !== undefined), String('true'));
      expect(String(result.subController !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController_sm !== undefined), String('true'));
      expect(String(result.subController_sm !== undefined)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === result.subController_sm), String('false'));
      expect(String(result.subController === result.subController_sm)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.subController === sideListData[0].subController), String('false'));
      expect(String(result.subController === sideListData[0].subController)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((result.subTitleList as MenuType[]).length), String('2'));
      expect(String((result.subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020038 end');
    });

  });
}
