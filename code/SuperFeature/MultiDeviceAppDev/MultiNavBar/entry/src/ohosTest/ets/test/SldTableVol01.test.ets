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
import { SIDE_LIST_SUBTITLE_COUNTS } from '../util/NavSpec';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function sldTableVol01Test() {
  describe('MultiNavBarSldTableVol01', () => {

    /**
     * @tc.name   testSldTableVol010001
     * @tc.number SUB_MNB_SLD_2123
     * @tc.desc   sub title cell (0, 0) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010001 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010001 end');
    });

    /**
     * @tc.name   testSldTableVol010002
     * @tc.number SUB_MNB_SLD_2124
     * @tc.desc   sub title cell (0, 1) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010002 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010002 end');
    });

    /**
     * @tc.name   testSldTableVol010003
     * @tc.number SUB_MNB_SLD_2125
     * @tc.desc   sub title cell (0, 2) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010003 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010003 end');
    });

    /**
     * @tc.name   testSldTableVol010004
     * @tc.number SUB_MNB_SLD_2126
     * @tc.desc   sub title cell (1, 0) of entry 1 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010004 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010004 end');
    });

    /**
     * @tc.name   testSldTableVol010005
     * @tc.number SUB_MNB_SLD_2127
     * @tc.desc   sub title cell (1, 1) of entry 1 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010005 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010005 end');
    });

    /**
     * @tc.name   testSldTableVol010006
     * @tc.number SUB_MNB_SLD_2128
     * @tc.desc   sub title cell (2, 0) of entry 2 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010006 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010006 end');
    });

    /**
     * @tc.name   testSldTableVol010007
     * @tc.number SUB_MNB_SLD_2129
     * @tc.desc   sub title cell (2, 1) of entry 2 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010007 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010007 end');
    });

    /**
     * @tc.name   testSldTableVol010008
     * @tc.number SUB_MNB_SLD_2130
     * @tc.desc   sub title cell (3, 0) of entry 3 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010008 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010008 end');
    });

    /**
     * @tc.name   testSldTableVol010009
     * @tc.number SUB_MNB_SLD_2131
     * @tc.desc   sub title cell (3, 1) of entry 3 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010009 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010009 end');
    });

    /**
     * @tc.name   testSldTableVol010010
     * @tc.number SUB_MNB_SLD_2132
     * @tc.desc   sub title cell (4, 0) of entry 4 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010010 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010010 end');
    });

    /**
     * @tc.name   testSldTableVol010011
     * @tc.number SUB_MNB_SLD_2133
     * @tc.desc   sub title cell (4, 1) of entry 4 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010011 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010011 end');
    });

    /**
     * @tc.name   testSldTableVol010012
     * @tc.number SUB_MNB_SLD_2134
     * @tc.desc   sub title cell (0, 0) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010012 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010012 end');
    });

    /**
     * @tc.name   testSldTableVol010013
     * @tc.number SUB_MNB_SLD_2135
     * @tc.desc   sub title cell (0, 1) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010013 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010013 end');
    });

    /**
     * @tc.name   testSldTableVol010014
     * @tc.number SUB_MNB_SLD_2136
     * @tc.desc   sub title cell (0, 2) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010014 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010014 end');
    });

    /**
     * @tc.name   testSldTableVol010015
     * @tc.number SUB_MNB_SLD_2137
     * @tc.desc   sub title cell (1, 0) of entry 1 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010015 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010015 end');
    });

    /**
     * @tc.name   testSldTableVol010016
     * @tc.number SUB_MNB_SLD_2138
     * @tc.desc   sub title cell (1, 1) of entry 1 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010016 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010016 end');
    });

    /**
     * @tc.name   testSldTableVol010017
     * @tc.number SUB_MNB_SLD_2139
     * @tc.desc   sub title cell (2, 0) of entry 2 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010017 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010017 end');
    });

    /**
     * @tc.name   testSldTableVol010018
     * @tc.number SUB_MNB_SLD_2140
     * @tc.desc   sub title cell (2, 1) of entry 2 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010018 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010018 end');
    });

    /**
     * @tc.name   testSldTableVol010019
     * @tc.number SUB_MNB_SLD_2141
     * @tc.desc   sub title cell (3, 0) of entry 3 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010019 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010019 end');
    });

    /**
     * @tc.name   testSldTableVol010020
     * @tc.number SUB_MNB_SLD_2142
     * @tc.desc   sub title cell (3, 1) of entry 3 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010020 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010020 end');
    });

    /**
     * @tc.name   testSldTableVol010021
     * @tc.number SUB_MNB_SLD_2143
     * @tc.desc   sub title cell (4, 0) of entry 4 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010021 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010021 end');
    });

    /**
     * @tc.name   testSldTableVol010022
     * @tc.number SUB_MNB_SLD_2144
     * @tc.desc   sub title cell (4, 1) of entry 4 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010022 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010022 end');
    });

    /**
     * @tc.name   testSldTableVol010023
     * @tc.number SUB_MNB_SLD_2145
     * @tc.desc   sub title cell (0, 0) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010023 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010023 end');
    });

    /**
     * @tc.name   testSldTableVol010024
     * @tc.number SUB_MNB_SLD_2146
     * @tc.desc   sub title cell (0, 1) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010024 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010024 end');
    });

    /**
     * @tc.name   testSldTableVol010025
     * @tc.number SUB_MNB_SLD_2147
     * @tc.desc   sub title cell (0, 2) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010025 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010025 end');
    });

    /**
     * @tc.name   testSldTableVol010026
     * @tc.number SUB_MNB_SLD_2148
     * @tc.desc   sub title cell (1, 0) of entry 1 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010026 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010026 end');
    });

    /**
     * @tc.name   testSldTableVol010027
     * @tc.number SUB_MNB_SLD_2149
     * @tc.desc   sub title cell (1, 1) of entry 1 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010027 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010027 end');
    });

    /**
     * @tc.name   testSldTableVol010028
     * @tc.number SUB_MNB_SLD_2150
     * @tc.desc   sub title cell (2, 0) of entry 2 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010028 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010028 end');
    });

    /**
     * @tc.name   testSldTableVol010029
     * @tc.number SUB_MNB_SLD_2151
     * @tc.desc   sub title cell (2, 1) of entry 2 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010029 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010029 end');
    });

    /**
     * @tc.name   testSldTableVol010030
     * @tc.number SUB_MNB_SLD_2152
     * @tc.desc   sub title cell (3, 0) of entry 3 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010030 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010030 end');
    });

    /**
     * @tc.name   testSldTableVol010031
     * @tc.number SUB_MNB_SLD_2153
     * @tc.desc   sub title cell (3, 1) of entry 3 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010031 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010031 end');
    });

    /**
     * @tc.name   testSldTableVol010032
     * @tc.number SUB_MNB_SLD_2154
     * @tc.desc   sub title cell (4, 0) of entry 4 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010032 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010032 end');
    });

    /**
     * @tc.name   testSldTableVol010033
     * @tc.number SUB_MNB_SLD_2155
     * @tc.desc   sub title cell (4, 1) of entry 4 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010033 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010033 end');
    });

    /**
     * @tc.name   testSldTableVol010034
     * @tc.number SUB_MNB_SLD_2156
     * @tc.desc   sub title cell (0, 0) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010034 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010034 end');
    });

    /**
     * @tc.name   testSldTableVol010035
     * @tc.number SUB_MNB_SLD_2157
     * @tc.desc   sub title cell (0, 1) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010035 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010035 end');
    });

    /**
     * @tc.name   testSldTableVol010036
     * @tc.number SUB_MNB_SLD_2158
     * @tc.desc   sub title cell (0, 2) of entry 0 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010036 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010036 end');
    });

    /**
     * @tc.name   testSldTableVol010037
     * @tc.number SUB_MNB_SLD_2159
     * @tc.desc   sub title cell (1, 0) of entry 1 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010037 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010037 end');
    });

    /**
     * @tc.name   testSldTableVol010038
     * @tc.number SUB_MNB_SLD_2160
     * @tc.desc   sub title cell (1, 1) of entry 1 is a distinct child row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldTableVol010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010038 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldTableVol010038 end');
    });

  });
}
