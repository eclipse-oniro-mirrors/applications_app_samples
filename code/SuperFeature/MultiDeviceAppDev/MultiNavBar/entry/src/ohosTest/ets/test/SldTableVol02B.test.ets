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

// @volume rule=record basis=spec cases=37
// Volume cases, see section 4 of ohosTest.md for the generation rule. Hand-written anchor cases must be added
// to the same describe and marked with an @tc.desc starting with 'Anchor:'.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { sideListData } from '../../../main/ets/model/SideListData';
import { MenuType } from '../../../main/ets/model/MenuType';
import { SIDE_LIST_VISIBLE_ON_WIDE } from '../util/NavSpec';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function sldTableVol02BTest() {
  describe('MultiNavBarSldTableVol02B', () => {

    /**
     * @tc.name   testSldTableVol020039
     * @tc.number SUB_MNB_SLD_2236
     * @tc.desc   entry 3 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020039 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020039 end');
    });

    /**
     * @tc.name   testSldTableVol020040
     * @tc.number SUB_MNB_SLD_2237
     * @tc.desc   entry 4 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020040 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020040 end');
    });

    /**
     * @tc.name   testSldTableVol020041
     * @tc.number SUB_MNB_SLD_2238
     * @tc.desc   entry 0 owns two independent tab controllers and 3 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020041 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020041 end');
    });

    /**
     * @tc.name   testSldTableVol020042
     * @tc.number SUB_MNB_SLD_2239
     * @tc.desc   entry 1 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020042 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020042 end');
    });

    /**
     * @tc.name   testSldTableVol020043
     * @tc.number SUB_MNB_SLD_2240
     * @tc.desc   entry 2 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020043 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020043 end');
    });

    /**
     * @tc.name   testSldTableVol020044
     * @tc.number SUB_MNB_SLD_2241
     * @tc.desc   entry 3 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020044 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020044 end');
    });

    /**
     * @tc.name   testSldTableVol020045
     * @tc.number SUB_MNB_SLD_2242
     * @tc.desc   entry 4 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020045 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020045 end');
    });

    /**
     * @tc.name   testSldTableVol020046
     * @tc.number SUB_MNB_SLD_2243
     * @tc.desc   entry 0 owns two independent tab controllers and 3 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020046 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020046 end');
    });

    /**
     * @tc.name   testSldTableVol020047
     * @tc.number SUB_MNB_SLD_2244
     * @tc.desc   entry 1 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020047 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020047 end');
    });

    /**
     * @tc.name   testSldTableVol020048
     * @tc.number SUB_MNB_SLD_2245
     * @tc.desc   entry 2 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020048 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020048 end');
    });

    /**
     * @tc.name   testSldTableVol020049
     * @tc.number SUB_MNB_SLD_2246
     * @tc.desc   entry 3 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020049 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020049 end');
    });

    /**
     * @tc.name   testSldTableVol020050
     * @tc.number SUB_MNB_SLD_2247
     * @tc.desc   entry 4 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020050 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020050 end');
    });

    /**
     * @tc.name   testSldTableVol020051
     * @tc.number SUB_MNB_SLD_2248
     * @tc.desc   entry 0 owns two independent tab controllers and 3 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020051 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020051 end');
    });

    /**
     * @tc.name   testSldTableVol020052
     * @tc.number SUB_MNB_SLD_2249
     * @tc.desc   entry 1 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020052 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020052 end');
    });

    /**
     * @tc.name   testSldTableVol020053
     * @tc.number SUB_MNB_SLD_2250
     * @tc.desc   entry 2 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020053 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020053 end');
    });

    /**
     * @tc.name   testSldTableVol020054
     * @tc.number SUB_MNB_SLD_2251
     * @tc.desc   entry 3 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020054 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020054 end');
    });

    /**
     * @tc.name   testSldTableVol020055
     * @tc.number SUB_MNB_SLD_2252
     * @tc.desc   entry 4 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020055 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020055 end');
    });

    /**
     * @tc.name   testSldTableVol020056
     * @tc.number SUB_MNB_SLD_2253
     * @tc.desc   entry 0 owns two independent tab controllers and 3 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020056 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020056 end');
    });

    /**
     * @tc.name   testSldTableVol020057
     * @tc.number SUB_MNB_SLD_2254
     * @tc.desc   entry 1 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020057 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020057 end');
    });

    /**
     * @tc.name   testSldTableVol020058
     * @tc.number SUB_MNB_SLD_2255
     * @tc.desc   entry 2 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020058 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020058 end');
    });

    /**
     * @tc.name   testSldTableVol020059
     * @tc.number SUB_MNB_SLD_2256
     * @tc.desc   entry 3 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020059 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020059 end');
    });

    /**
     * @tc.name   testSldTableVol020060
     * @tc.number SUB_MNB_SLD_2257
     * @tc.desc   entry 4 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020060 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020060 end');
    });

    /**
     * @tc.name   testSldTableVol020061
     * @tc.number SUB_MNB_SLD_2258
     * @tc.desc   entry 0 owns two independent tab controllers and 3 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020061 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020061 end');
    });

    /**
     * @tc.name   testSldTableVol020062
     * @tc.number SUB_MNB_SLD_2259
     * @tc.desc   entry 1 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020062 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020062 end');
    });

    /**
     * @tc.name   testSldTableVol020063
     * @tc.number SUB_MNB_SLD_2260
     * @tc.desc   entry 2 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020063 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020063 end');
    });

    /**
     * @tc.name   testSldTableVol020064
     * @tc.number SUB_MNB_SLD_2261
     * @tc.desc   entry 3 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020064 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020064 end');
    });

    /**
     * @tc.name   testSldTableVol020065
     * @tc.number SUB_MNB_SLD_2262
     * @tc.desc   entry 4 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020065 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020065 end');
    });

    /**
     * @tc.name   testSldTableVol020066
     * @tc.number SUB_MNB_SLD_2263
     * @tc.desc   entry 0 owns two independent tab controllers and 3 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020066 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020066 end');
    });

    /**
     * @tc.name   testSldTableVol020067
     * @tc.number SUB_MNB_SLD_2264
     * @tc.desc   entry 1 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020067 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020067 end');
    });

    /**
     * @tc.name   testSldTableVol020068
     * @tc.number SUB_MNB_SLD_2265
     * @tc.desc   entry 2 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020068 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020068 end');
    });

    /**
     * @tc.name   testSldTableVol020069
     * @tc.number SUB_MNB_SLD_2266
     * @tc.desc   entry 3 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020069 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020069 end');
    });

    /**
     * @tc.name   testSldTableVol020070
     * @tc.number SUB_MNB_SLD_2267
     * @tc.desc   entry 4 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020070 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020070 end');
    });

    /**
     * @tc.name   testSldTableVol020071
     * @tc.number SUB_MNB_SLD_2268
     * @tc.desc   entry 0 owns two independent tab controllers and 3 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020071 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020071 end');
    });

    /**
     * @tc.name   testSldTableVol020072
     * @tc.number SUB_MNB_SLD_2269
     * @tc.desc   entry 1 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020072 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020072 end');
    });

    /**
     * @tc.name   testSldTableVol020073
     * @tc.number SUB_MNB_SLD_2270
     * @tc.desc   entry 2 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020073 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020073 end');
    });

    /**
     * @tc.name   testSldTableVol020074
     * @tc.number SUB_MNB_SLD_2271
     * @tc.desc   entry 3 owns two independent tab controllers and 2 sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020074 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020074 end');
    });

    /**
     * @tc.name   testSldTableVol020075
     * @tc.number SUB_MNB_SLD_2272
     * @tc.desc   Anchor: the wide layout hides the fifth entry, so only four primary rows stay reachable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol020075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020075 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'size=%{public}s visible=%{public}s', String(sideListData.length),
        String(SIDE_LIST_VISIBLE_ON_WIDE));
      expect(sideListData.length).assertEqual(5);
      expect(SIDE_LIST_VISIBLE_ON_WIDE).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check sideListData.length === SIDE_LIST_VISIBLE_ON_WIDE');
      expect(sideListData.length === SIDE_LIST_VISIBLE_ON_WIDE).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol020075 end');
    });
  });
}
