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
import { SIDE_LIST_SUBTITLE_COUNTS } from '../util/NavSpec';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function sldTableVol01BTest() {
  describe('MultiNavBarSldTableVol01B', () => {

    /**
     * @tc.name   testSldTableVol010039
     * @tc.number SUB_MNB_SLD_2161
     * @tc.desc   sub title cell (2, 0) of entry 2 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010039 begin');
      const result: MenuType = (sideListData[2].subTitleList as MenuType[])[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[2].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[])[0] === result), String('true'));
      expect(String((sideListData[2].subTitleList as MenuType[])[0] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[])[0] === (sideListData[2].subTitleList as MenuType[])[1]),
        String('false'));
      expect(
        String((sideListData[2].subTitleList as MenuType[])[0] === (sideListData[2].subTitleList as MenuType[])[1])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[2] === (sideListData[2].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[2] === (sideListData[2].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[2]),
        String('true'));
      expect(String(result !== sideListData[2])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010039 end');
    });

    /**
     * @tc.name   testSldTableVol010040
     * @tc.number SUB_MNB_SLD_2162
     * @tc.desc   sub title cell (2, 1) of entry 2 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010040 begin');
      const result: MenuType = (sideListData[2].subTitleList as MenuType[])[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[2].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[])[1] === result), String('true'));
      expect(String((sideListData[2].subTitleList as MenuType[])[1] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[])[1] === (sideListData[2].subTitleList as MenuType[])[0]),
        String('false'));
      expect(
        String((sideListData[2].subTitleList as MenuType[])[1] === (sideListData[2].subTitleList as MenuType[])[0])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[2] === (sideListData[2].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[2] === (sideListData[2].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[2]),
        String('true'));
      expect(String(result !== sideListData[2])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010040 end');
    });

    /**
     * @tc.name   testSldTableVol010041
     * @tc.number SUB_MNB_SLD_2163
     * @tc.desc   sub title cell (3, 0) of entry 3 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010041 begin');
      const result: MenuType = (sideListData[3].subTitleList as MenuType[])[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[3].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[])[0] === result), String('true'));
      expect(String((sideListData[3].subTitleList as MenuType[])[0] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[])[0] === (sideListData[3].subTitleList as MenuType[])[1]),
        String('false'));
      expect(
        String((sideListData[3].subTitleList as MenuType[])[0] === (sideListData[3].subTitleList as MenuType[])[1])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[3] === (sideListData[3].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[3] === (sideListData[3].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[3]),
        String('true'));
      expect(String(result !== sideListData[3])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010041 end');
    });

    /**
     * @tc.name   testSldTableVol010042
     * @tc.number SUB_MNB_SLD_2164
     * @tc.desc   sub title cell (3, 1) of entry 3 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010042 begin');
      const result: MenuType = (sideListData[3].subTitleList as MenuType[])[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[3].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[])[1] === result), String('true'));
      expect(String((sideListData[3].subTitleList as MenuType[])[1] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[])[1] === (sideListData[3].subTitleList as MenuType[])[0]),
        String('false'));
      expect(
        String((sideListData[3].subTitleList as MenuType[])[1] === (sideListData[3].subTitleList as MenuType[])[0])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[3] === (sideListData[3].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[3] === (sideListData[3].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[3]),
        String('true'));
      expect(String(result !== sideListData[3])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010042 end');
    });

    /**
     * @tc.name   testSldTableVol010043
     * @tc.number SUB_MNB_SLD_2165
     * @tc.desc   sub title cell (4, 0) of entry 4 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010043 begin');
      const result: MenuType = (sideListData[4].subTitleList as MenuType[])[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[4].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[4].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[4].subTitleList as MenuType[])[0] === result), String('true'));
      expect(String((sideListData[4].subTitleList as MenuType[])[0] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[4].subTitleList as MenuType[])[0] === (sideListData[4].subTitleList as MenuType[])[1]),
        String('false'));
      expect(
        String((sideListData[4].subTitleList as MenuType[])[0] === (sideListData[4].subTitleList as MenuType[])[1])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[4] === (sideListData[4].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[4] === (sideListData[4].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[4]),
        String('true'));
      expect(String(result !== sideListData[4])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010043 end');
    });

    /**
     * @tc.name   testSldTableVol010044
     * @tc.number SUB_MNB_SLD_2166
     * @tc.desc   sub title cell (4, 1) of entry 4 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010044 begin');
      const result: MenuType = (sideListData[4].subTitleList as MenuType[])[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[4].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[4].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[4].subTitleList as MenuType[])[1] === result), String('true'));
      expect(String((sideListData[4].subTitleList as MenuType[])[1] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[4].subTitleList as MenuType[])[1] === (sideListData[4].subTitleList as MenuType[])[0]),
        String('false'));
      expect(
        String((sideListData[4].subTitleList as MenuType[])[1] === (sideListData[4].subTitleList as MenuType[])[0])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[4] === (sideListData[4].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[4] === (sideListData[4].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[4]),
        String('true'));
      expect(String(result !== sideListData[4])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010044 end');
    });

    /**
     * @tc.name   testSldTableVol010045
     * @tc.number SUB_MNB_SLD_2167
     * @tc.desc   sub title cell (0, 0) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010045 begin');
      const result: MenuType = (sideListData[0].subTitleList as MenuType[])[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[]).length), String('3'));
      expect(String((sideListData[0].subTitleList as MenuType[]).length)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[])[0] === result), String('true'));
      expect(String((sideListData[0].subTitleList as MenuType[])[0] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[])[0] === (sideListData[0].subTitleList as MenuType[])[1]),
        String('false'));
      expect(
        String((sideListData[0].subTitleList as MenuType[])[0] === (sideListData[0].subTitleList as MenuType[])[1])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[0] === (sideListData[0].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[0] === (sideListData[0].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[0]),
        String('true'));
      expect(String(result !== sideListData[0])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010045 end');
    });

    /**
     * @tc.name   testSldTableVol010046
     * @tc.number SUB_MNB_SLD_2168
     * @tc.desc   sub title cell (0, 1) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010046 begin');
      const result: MenuType = (sideListData[0].subTitleList as MenuType[])[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[]).length), String('3'));
      expect(String((sideListData[0].subTitleList as MenuType[]).length)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[])[1] === result), String('true'));
      expect(String((sideListData[0].subTitleList as MenuType[])[1] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[])[1] === (sideListData[0].subTitleList as MenuType[])[2]),
        String('false'));
      expect(
        String((sideListData[0].subTitleList as MenuType[])[1] === (sideListData[0].subTitleList as MenuType[])[2])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[0] === (sideListData[0].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[0] === (sideListData[0].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[0]),
        String('true'));
      expect(String(result !== sideListData[0])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010046 end');
    });

    /**
     * @tc.name   testSldTableVol010047
     * @tc.number SUB_MNB_SLD_2169
     * @tc.desc   sub title cell (0, 2) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010047 begin');
      const result: MenuType = (sideListData[0].subTitleList as MenuType[])[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[]).length), String('3'));
      expect(String((sideListData[0].subTitleList as MenuType[]).length)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[])[2] === result), String('true'));
      expect(String((sideListData[0].subTitleList as MenuType[])[2] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[])[2] === (sideListData[0].subTitleList as MenuType[])[0]),
        String('false'));
      expect(
        String((sideListData[0].subTitleList as MenuType[])[2] === (sideListData[0].subTitleList as MenuType[])[0])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[0] === (sideListData[0].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[0] === (sideListData[0].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[0]),
        String('true'));
      expect(String(result !== sideListData[0])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010047 end');
    });

    /**
     * @tc.name   testSldTableVol010048
     * @tc.number SUB_MNB_SLD_2170
     * @tc.desc   sub title cell (1, 0) of entry 1 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010048 begin');
      const result: MenuType = (sideListData[1].subTitleList as MenuType[])[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[1].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[1].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[1].subTitleList as MenuType[])[0] === result), String('true'));
      expect(String((sideListData[1].subTitleList as MenuType[])[0] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[1].subTitleList as MenuType[])[0] === (sideListData[1].subTitleList as MenuType[])[1]),
        String('false'));
      expect(
        String((sideListData[1].subTitleList as MenuType[])[0] === (sideListData[1].subTitleList as MenuType[])[1])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[1] === (sideListData[1].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[1] === (sideListData[1].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[1]),
        String('true'));
      expect(String(result !== sideListData[1])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010048 end');
    });

    /**
     * @tc.name   testSldTableVol010049
     * @tc.number SUB_MNB_SLD_2171
     * @tc.desc   sub title cell (1, 1) of entry 1 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010049 begin');
      const result: MenuType = (sideListData[1].subTitleList as MenuType[])[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[1].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[1].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[1].subTitleList as MenuType[])[1] === result), String('true'));
      expect(String((sideListData[1].subTitleList as MenuType[])[1] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[1].subTitleList as MenuType[])[1] === (sideListData[1].subTitleList as MenuType[])[0]),
        String('false'));
      expect(
        String((sideListData[1].subTitleList as MenuType[])[1] === (sideListData[1].subTitleList as MenuType[])[0])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[1] === (sideListData[1].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[1] === (sideListData[1].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[1]),
        String('true'));
      expect(String(result !== sideListData[1])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010049 end');
    });

    /**
     * @tc.name   testSldTableVol010050
     * @tc.number SUB_MNB_SLD_2172
     * @tc.desc   sub title cell (2, 0) of entry 2 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010050 begin');
      const result: MenuType = (sideListData[2].subTitleList as MenuType[])[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[2].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[])[0] === result), String('true'));
      expect(String((sideListData[2].subTitleList as MenuType[])[0] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[])[0] === (sideListData[2].subTitleList as MenuType[])[1]),
        String('false'));
      expect(
        String((sideListData[2].subTitleList as MenuType[])[0] === (sideListData[2].subTitleList as MenuType[])[1])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[2] === (sideListData[2].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[2] === (sideListData[2].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[2]),
        String('true'));
      expect(String(result !== sideListData[2])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010050 end');
    });

    /**
     * @tc.name   testSldTableVol010051
     * @tc.number SUB_MNB_SLD_2173
     * @tc.desc   sub title cell (2, 1) of entry 2 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010051 begin');
      const result: MenuType = (sideListData[2].subTitleList as MenuType[])[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[2].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[])[1] === result), String('true'));
      expect(String((sideListData[2].subTitleList as MenuType[])[1] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[])[1] === (sideListData[2].subTitleList as MenuType[])[0]),
        String('false'));
      expect(
        String((sideListData[2].subTitleList as MenuType[])[1] === (sideListData[2].subTitleList as MenuType[])[0])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[2] === (sideListData[2].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[2] === (sideListData[2].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[2]),
        String('true'));
      expect(String(result !== sideListData[2])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010051 end');
    });

    /**
     * @tc.name   testSldTableVol010052
     * @tc.number SUB_MNB_SLD_2174
     * @tc.desc   sub title cell (3, 0) of entry 3 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010052 begin');
      const result: MenuType = (sideListData[3].subTitleList as MenuType[])[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[3].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[])[0] === result), String('true'));
      expect(String((sideListData[3].subTitleList as MenuType[])[0] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[])[0] === (sideListData[3].subTitleList as MenuType[])[1]),
        String('false'));
      expect(
        String((sideListData[3].subTitleList as MenuType[])[0] === (sideListData[3].subTitleList as MenuType[])[1])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[3] === (sideListData[3].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[3] === (sideListData[3].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[3]),
        String('true'));
      expect(String(result !== sideListData[3])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010052 end');
    });

    /**
     * @tc.name   testSldTableVol010053
     * @tc.number SUB_MNB_SLD_2175
     * @tc.desc   sub title cell (3, 1) of entry 3 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010053 begin');
      const result: MenuType = (sideListData[3].subTitleList as MenuType[])[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[3].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[])[1] === result), String('true'));
      expect(String((sideListData[3].subTitleList as MenuType[])[1] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[])[1] === (sideListData[3].subTitleList as MenuType[])[0]),
        String('false'));
      expect(
        String((sideListData[3].subTitleList as MenuType[])[1] === (sideListData[3].subTitleList as MenuType[])[0])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[3] === (sideListData[3].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[3] === (sideListData[3].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[3]),
        String('true'));
      expect(String(result !== sideListData[3])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010053 end');
    });

    /**
     * @tc.name   testSldTableVol010054
     * @tc.number SUB_MNB_SLD_2176
     * @tc.desc   sub title cell (4, 0) of entry 4 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010054 begin');
      const result: MenuType = (sideListData[4].subTitleList as MenuType[])[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[4].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[4].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[4].subTitleList as MenuType[])[0] === result), String('true'));
      expect(String((sideListData[4].subTitleList as MenuType[])[0] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[4].subTitleList as MenuType[])[0] === (sideListData[4].subTitleList as MenuType[])[1]),
        String('false'));
      expect(
        String((sideListData[4].subTitleList as MenuType[])[0] === (sideListData[4].subTitleList as MenuType[])[1])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[4] === (sideListData[4].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[4] === (sideListData[4].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[4]),
        String('true'));
      expect(String(result !== sideListData[4])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010054 end');
    });

    /**
     * @tc.name   testSldTableVol010055
     * @tc.number SUB_MNB_SLD_2177
     * @tc.desc   sub title cell (4, 1) of entry 4 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010055 begin');
      const result: MenuType = (sideListData[4].subTitleList as MenuType[])[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[4].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[4].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[4].subTitleList as MenuType[])[1] === result), String('true'));
      expect(String((sideListData[4].subTitleList as MenuType[])[1] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[4].subTitleList as MenuType[])[1] === (sideListData[4].subTitleList as MenuType[])[0]),
        String('false'));
      expect(
        String((sideListData[4].subTitleList as MenuType[])[1] === (sideListData[4].subTitleList as MenuType[])[0])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[4] === (sideListData[4].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[4] === (sideListData[4].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[4]),
        String('true'));
      expect(String(result !== sideListData[4])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010055 end');
    });

    /**
     * @tc.name   testSldTableVol010056
     * @tc.number SUB_MNB_SLD_2178
     * @tc.desc   sub title cell (0, 0) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010056 begin');
      const result: MenuType = (sideListData[0].subTitleList as MenuType[])[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[]).length), String('3'));
      expect(String((sideListData[0].subTitleList as MenuType[]).length)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[])[0] === result), String('true'));
      expect(String((sideListData[0].subTitleList as MenuType[])[0] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[])[0] === (sideListData[0].subTitleList as MenuType[])[1]),
        String('false'));
      expect(
        String((sideListData[0].subTitleList as MenuType[])[0] === (sideListData[0].subTitleList as MenuType[])[1])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[0] === (sideListData[0].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[0] === (sideListData[0].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[0]),
        String('true'));
      expect(String(result !== sideListData[0])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010056 end');
    });

    /**
     * @tc.name   testSldTableVol010057
     * @tc.number SUB_MNB_SLD_2179
     * @tc.desc   sub title cell (0, 1) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010057 begin');
      const result: MenuType = (sideListData[0].subTitleList as MenuType[])[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[]).length), String('3'));
      expect(String((sideListData[0].subTitleList as MenuType[]).length)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[])[1] === result), String('true'));
      expect(String((sideListData[0].subTitleList as MenuType[])[1] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[])[1] === (sideListData[0].subTitleList as MenuType[])[2]),
        String('false'));
      expect(
        String((sideListData[0].subTitleList as MenuType[])[1] === (sideListData[0].subTitleList as MenuType[])[2])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[0] === (sideListData[0].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[0] === (sideListData[0].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[0]),
        String('true'));
      expect(String(result !== sideListData[0])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010057 end');
    });

    /**
     * @tc.name   testSldTableVol010058
     * @tc.number SUB_MNB_SLD_2180
     * @tc.desc   sub title cell (0, 2) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010058 begin');
      const result: MenuType = (sideListData[0].subTitleList as MenuType[])[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[]).length), String('3'));
      expect(String((sideListData[0].subTitleList as MenuType[]).length)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[])[2] === result), String('true'));
      expect(String((sideListData[0].subTitleList as MenuType[])[2] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[])[2] === (sideListData[0].subTitleList as MenuType[])[0]),
        String('false'));
      expect(
        String((sideListData[0].subTitleList as MenuType[])[2] === (sideListData[0].subTitleList as MenuType[])[0])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[0] === (sideListData[0].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[0] === (sideListData[0].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[0]),
        String('true'));
      expect(String(result !== sideListData[0])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010058 end');
    });

    /**
     * @tc.name   testSldTableVol010059
     * @tc.number SUB_MNB_SLD_2181
     * @tc.desc   sub title cell (1, 0) of entry 1 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010059 begin');
      const result: MenuType = (sideListData[1].subTitleList as MenuType[])[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[1].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[1].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[1].subTitleList as MenuType[])[0] === result), String('true'));
      expect(String((sideListData[1].subTitleList as MenuType[])[0] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[1].subTitleList as MenuType[])[0] === (sideListData[1].subTitleList as MenuType[])[1]),
        String('false'));
      expect(
        String((sideListData[1].subTitleList as MenuType[])[0] === (sideListData[1].subTitleList as MenuType[])[1])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[1] === (sideListData[1].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[1] === (sideListData[1].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[1]),
        String('true'));
      expect(String(result !== sideListData[1])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010059 end');
    });

    /**
     * @tc.name   testSldTableVol010060
     * @tc.number SUB_MNB_SLD_2182
     * @tc.desc   sub title cell (1, 1) of entry 1 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010060 begin');
      const result: MenuType = (sideListData[1].subTitleList as MenuType[])[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[1].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[1].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[1].subTitleList as MenuType[])[1] === result), String('true'));
      expect(String((sideListData[1].subTitleList as MenuType[])[1] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[1].subTitleList as MenuType[])[1] === (sideListData[1].subTitleList as MenuType[])[0]),
        String('false'));
      expect(
        String((sideListData[1].subTitleList as MenuType[])[1] === (sideListData[1].subTitleList as MenuType[])[0])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[1] === (sideListData[1].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[1] === (sideListData[1].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[1]),
        String('true'));
      expect(String(result !== sideListData[1])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010060 end');
    });

    /**
     * @tc.name   testSldTableVol010061
     * @tc.number SUB_MNB_SLD_2183
     * @tc.desc   sub title cell (2, 0) of entry 2 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010061 begin');
      const result: MenuType = (sideListData[2].subTitleList as MenuType[])[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[2].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[])[0] === result), String('true'));
      expect(String((sideListData[2].subTitleList as MenuType[])[0] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[])[0] === (sideListData[2].subTitleList as MenuType[])[1]),
        String('false'));
      expect(
        String((sideListData[2].subTitleList as MenuType[])[0] === (sideListData[2].subTitleList as MenuType[])[1])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[2] === (sideListData[2].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[2] === (sideListData[2].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[2]),
        String('true'));
      expect(String(result !== sideListData[2])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010061 end');
    });

    /**
     * @tc.name   testSldTableVol010062
     * @tc.number SUB_MNB_SLD_2184
     * @tc.desc   sub title cell (2, 1) of entry 2 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010062 begin');
      const result: MenuType = (sideListData[2].subTitleList as MenuType[])[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[2].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[])[1] === result), String('true'));
      expect(String((sideListData[2].subTitleList as MenuType[])[1] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[])[1] === (sideListData[2].subTitleList as MenuType[])[0]),
        String('false'));
      expect(
        String((sideListData[2].subTitleList as MenuType[])[1] === (sideListData[2].subTitleList as MenuType[])[0])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[2] === (sideListData[2].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[2] === (sideListData[2].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[2]),
        String('true'));
      expect(String(result !== sideListData[2])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010062 end');
    });

    /**
     * @tc.name   testSldTableVol010063
     * @tc.number SUB_MNB_SLD_2185
     * @tc.desc   sub title cell (3, 0) of entry 3 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010063 begin');
      const result: MenuType = (sideListData[3].subTitleList as MenuType[])[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[3].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[])[0] === result), String('true'));
      expect(String((sideListData[3].subTitleList as MenuType[])[0] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[])[0] === (sideListData[3].subTitleList as MenuType[])[1]),
        String('false'));
      expect(
        String((sideListData[3].subTitleList as MenuType[])[0] === (sideListData[3].subTitleList as MenuType[])[1])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[3] === (sideListData[3].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[3] === (sideListData[3].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[3]),
        String('true'));
      expect(String(result !== sideListData[3])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010063 end');
    });

    /**
     * @tc.name   testSldTableVol010064
     * @tc.number SUB_MNB_SLD_2186
     * @tc.desc   sub title cell (3, 1) of entry 3 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010064 begin');
      const result: MenuType = (sideListData[3].subTitleList as MenuType[])[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[3].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[])[1] === result), String('true'));
      expect(String((sideListData[3].subTitleList as MenuType[])[1] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[])[1] === (sideListData[3].subTitleList as MenuType[])[0]),
        String('false'));
      expect(
        String((sideListData[3].subTitleList as MenuType[])[1] === (sideListData[3].subTitleList as MenuType[])[0])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[3] === (sideListData[3].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[3] === (sideListData[3].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[3]),
        String('true'));
      expect(String(result !== sideListData[3])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010064 end');
    });

    /**
     * @tc.name   testSldTableVol010065
     * @tc.number SUB_MNB_SLD_2187
     * @tc.desc   sub title cell (4, 0) of entry 4 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010065 begin');
      const result: MenuType = (sideListData[4].subTitleList as MenuType[])[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[4].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[4].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[4].subTitleList as MenuType[])[0] === result), String('true'));
      expect(String((sideListData[4].subTitleList as MenuType[])[0] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[4].subTitleList as MenuType[])[0] === (sideListData[4].subTitleList as MenuType[])[1]),
        String('false'));
      expect(
        String((sideListData[4].subTitleList as MenuType[])[0] === (sideListData[4].subTitleList as MenuType[])[1])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[4] === (sideListData[4].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[4] === (sideListData[4].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[4]),
        String('true'));
      expect(String(result !== sideListData[4])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010065 end');
    });

    /**
     * @tc.name   testSldTableVol010066
     * @tc.number SUB_MNB_SLD_2188
     * @tc.desc   sub title cell (4, 1) of entry 4 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010066 begin');
      const result: MenuType = (sideListData[4].subTitleList as MenuType[])[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[4].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[4].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[4].subTitleList as MenuType[])[1] === result), String('true'));
      expect(String((sideListData[4].subTitleList as MenuType[])[1] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[4].subTitleList as MenuType[])[1] === (sideListData[4].subTitleList as MenuType[])[0]),
        String('false'));
      expect(
        String((sideListData[4].subTitleList as MenuType[])[1] === (sideListData[4].subTitleList as MenuType[])[0])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[4] === (sideListData[4].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[4] === (sideListData[4].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[4]),
        String('true'));
      expect(String(result !== sideListData[4])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010066 end');
    });

    /**
     * @tc.name   testSldTableVol010067
     * @tc.number SUB_MNB_SLD_2189
     * @tc.desc   sub title cell (0, 0) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010067 begin');
      const result: MenuType = (sideListData[0].subTitleList as MenuType[])[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[]).length), String('3'));
      expect(String((sideListData[0].subTitleList as MenuType[]).length)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[])[0] === result), String('true'));
      expect(String((sideListData[0].subTitleList as MenuType[])[0] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[])[0] === (sideListData[0].subTitleList as MenuType[])[1]),
        String('false'));
      expect(
        String((sideListData[0].subTitleList as MenuType[])[0] === (sideListData[0].subTitleList as MenuType[])[1])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[0] === (sideListData[0].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[0] === (sideListData[0].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[0]),
        String('true'));
      expect(String(result !== sideListData[0])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010067 end');
    });

    /**
     * @tc.name   testSldTableVol010068
     * @tc.number SUB_MNB_SLD_2190
     * @tc.desc   sub title cell (0, 1) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010068 begin');
      const result: MenuType = (sideListData[0].subTitleList as MenuType[])[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[]).length), String('3'));
      expect(String((sideListData[0].subTitleList as MenuType[]).length)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[])[1] === result), String('true'));
      expect(String((sideListData[0].subTitleList as MenuType[])[1] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[])[1] === (sideListData[0].subTitleList as MenuType[])[2]),
        String('false'));
      expect(
        String((sideListData[0].subTitleList as MenuType[])[1] === (sideListData[0].subTitleList as MenuType[])[2])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[0] === (sideListData[0].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[0] === (sideListData[0].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[0]),
        String('true'));
      expect(String(result !== sideListData[0])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010068 end');
    });

    /**
     * @tc.name   testSldTableVol010069
     * @tc.number SUB_MNB_SLD_2191
     * @tc.desc   sub title cell (0, 2) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010069 begin');
      const result: MenuType = (sideListData[0].subTitleList as MenuType[])[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[]).length), String('3'));
      expect(String((sideListData[0].subTitleList as MenuType[]).length)).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[])[2] === result), String('true'));
      expect(String((sideListData[0].subTitleList as MenuType[])[2] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[0].subTitleList as MenuType[])[2] === (sideListData[0].subTitleList as MenuType[])[0]),
        String('false'));
      expect(
        String((sideListData[0].subTitleList as MenuType[])[2] === (sideListData[0].subTitleList as MenuType[])[0])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[0] === (sideListData[0].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[0] === (sideListData[0].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[0]),
        String('true'));
      expect(String(result !== sideListData[0])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010069 end');
    });

    /**
     * @tc.name   testSldTableVol010070
     * @tc.number SUB_MNB_SLD_2192
     * @tc.desc   sub title cell (1, 0) of entry 1 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010070 begin');
      const result: MenuType = (sideListData[1].subTitleList as MenuType[])[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[1].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[1].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[1].subTitleList as MenuType[])[0] === result), String('true'));
      expect(String((sideListData[1].subTitleList as MenuType[])[0] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[1].subTitleList as MenuType[])[0] === (sideListData[1].subTitleList as MenuType[])[1]),
        String('false'));
      expect(
        String((sideListData[1].subTitleList as MenuType[])[0] === (sideListData[1].subTitleList as MenuType[])[1])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[1] === (sideListData[1].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[1] === (sideListData[1].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[1]),
        String('true'));
      expect(String(result !== sideListData[1])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010070 end');
    });

    /**
     * @tc.name   testSldTableVol010071
     * @tc.number SUB_MNB_SLD_2193
     * @tc.desc   sub title cell (1, 1) of entry 1 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010071 begin');
      const result: MenuType = (sideListData[1].subTitleList as MenuType[])[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[1].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[1].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[1].subTitleList as MenuType[])[1] === result), String('true'));
      expect(String((sideListData[1].subTitleList as MenuType[])[1] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[1].subTitleList as MenuType[])[1] === (sideListData[1].subTitleList as MenuType[])[0]),
        String('false'));
      expect(
        String((sideListData[1].subTitleList as MenuType[])[1] === (sideListData[1].subTitleList as MenuType[])[0])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[1] === (sideListData[1].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[1] === (sideListData[1].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[1]),
        String('true'));
      expect(String(result !== sideListData[1])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010071 end');
    });

    /**
     * @tc.name   testSldTableVol010072
     * @tc.number SUB_MNB_SLD_2194
     * @tc.desc   sub title cell (2, 0) of entry 2 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010072 begin');
      const result: MenuType = (sideListData[2].subTitleList as MenuType[])[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[2].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[])[0] === result), String('true'));
      expect(String((sideListData[2].subTitleList as MenuType[])[0] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[])[0] === (sideListData[2].subTitleList as MenuType[])[1]),
        String('false'));
      expect(
        String((sideListData[2].subTitleList as MenuType[])[0] === (sideListData[2].subTitleList as MenuType[])[1])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[2] === (sideListData[2].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[2] === (sideListData[2].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[2]),
        String('true'));
      expect(String(result !== sideListData[2])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010072 end');
    });

    /**
     * @tc.name   testSldTableVol010073
     * @tc.number SUB_MNB_SLD_2195
     * @tc.desc   sub title cell (2, 1) of entry 2 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010073 begin');
      const result: MenuType = (sideListData[2].subTitleList as MenuType[])[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[2].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[])[1] === result), String('true'));
      expect(String((sideListData[2].subTitleList as MenuType[])[1] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[2].subTitleList as MenuType[])[1] === (sideListData[2].subTitleList as MenuType[])[0]),
        String('false'));
      expect(
        String((sideListData[2].subTitleList as MenuType[])[1] === (sideListData[2].subTitleList as MenuType[])[0])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[2] === (sideListData[2].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[2] === (sideListData[2].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[2]),
        String('true'));
      expect(String(result !== sideListData[2])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010073 end');
    });

    /**
     * @tc.name   testSldTableVol010074
     * @tc.number SUB_MNB_SLD_2196
     * @tc.desc   sub title cell (3, 0) of entry 3 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010074 begin');
      const result: MenuType = (sideListData[3].subTitleList as MenuType[])[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[]).length), String('2'));
      expect(String((sideListData[3].subTitleList as MenuType[]).length)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[])[0] === result), String('true'));
      expect(String((sideListData[3].subTitleList as MenuType[])[0] === result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((sideListData[3].subTitleList as MenuType[])[0] === (sideListData[3].subTitleList as MenuType[])[1]),
        String('false'));
      expect(
        String((sideListData[3].subTitleList as MenuType[])[0] === (sideListData[3].subTitleList as MenuType[])[1])
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(SIDE_LIST_SUBTITLE_COUNTS[3] === (sideListData[3].subTitleList as MenuType[]).length), String('true'));
      expect(
        String(SIDE_LIST_SUBTITLE_COUNTS[3] === (sideListData[3].subTitleList as MenuType[]).length)
      ).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result !== sideListData[3]),
        String('true'));
      expect(String(result !== sideListData[3])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010074 end');
    });

    /**
     * @tc.name   testSldTableVol010075
     * @tc.number SUB_MNB_SLD_2197
     * @tc.desc   Anchor: entry 0 is the only row with three sub titles, so sub index 2 is out of range for entry 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010075 begin');
      const firstRow: MenuType = sideListData[0];
      const secondRow: MenuType = sideListData[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}s second=%{public}s',
        String((firstRow.subTitleList as MenuType[]).length), String((secondRow.subTitleList as MenuType[]).length));
      expect(SIDE_LIST_SUBTITLE_COUNTS[0]).assertEqual(3);
      expect((firstRow.subTitleList as MenuType[]).length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check (secondRow.subTitleList as MenuType[]).length === 3');
      expect((secondRow.subTitleList as MenuType[]).length === 3).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010075 end');
    });
  });
}
