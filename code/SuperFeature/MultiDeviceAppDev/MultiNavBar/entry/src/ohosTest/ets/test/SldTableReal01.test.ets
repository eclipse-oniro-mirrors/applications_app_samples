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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { sideListData } from '../../../main/ets/model/SideListData';
import { MenuType } from '../../../main/ets/model/MenuType';
import {
  SIDE_LIST_SIZE,
  SIDE_LIST_SUBTITLE_COUNTS,
  SIDE_LIST_VISIBLE_ON_WIDE
} from '../util/NavSpec';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

function subTitlesOf(index: number): MenuType[] {
  const entry: MenuType = sideListData[index];
  return entry.subTitleList as MenuType[];
}

/**
 * L1 cases for the frozen navigation table model/SideListData.ets:18.
 * The table drives the primary side bar; SideBarController.ets:175 hides its last entry on
 * every layout wider than 'sm'.
 */
export default function sldTableReal01Test() {
  describe('MultiNavBarSldTableReal01', () => {
    /**
     * @tc.name   testSldReal2101
     * @tc.number SUB_MNB_SLD_2101
     * @tc.desc   The frozen table exposes exactly five primary menu entries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSldReal2101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2101 begin');
      const size: number = sideListData.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'size=%{public}s expected=%{public}s', String(size), '5');
      expect(size).assertEqual(5);
      expect(size).assertEqual(SIDE_LIST_SIZE);
      expect(sideListData[size - 1] !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2101 end');
    });

    /**
     * @tc.name   testSldReal2102
     * @tc.number SUB_MNB_SLD_2102
     * @tc.desc   Entry 0 ('index') expands into three sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSldReal2102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2102 begin');
      const subTitles: MenuType[] = subTitlesOf(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'count=%{public}s expected=%{public}s',
        String(subTitles.length), String(SIDE_LIST_SUBTITLE_COUNTS[0]));
      expect(subTitles.length).assertEqual(3);
      expect(subTitles.length).assertEqual(SIDE_LIST_SUBTITLE_COUNTS[0]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check subTitles[2] !== undefined');
      expect(subTitles[2] !== undefined).assertTrue();
      expect(subTitles[0] !== subTitles[2]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2102 end');
    });

    /**
     * @tc.name   testSldReal2103
     * @tc.number SUB_MNB_SLD_2103
     * @tc.desc   Entry 1 ('app') expands into two sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSldReal2103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2103 begin');
      const subTitles: MenuType[] = subTitlesOf(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'count=%{public}s expected=%{public}s',
        String(subTitles.length), String(SIDE_LIST_SUBTITLE_COUNTS[1]));
      expect(subTitles.length).assertEqual(2);
      expect(subTitles.length).assertEqual(SIDE_LIST_SUBTITLE_COUNTS[1]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check subTitles[1] !== undefined');
      expect(subTitles[1] !== undefined).assertTrue();
      expect(subTitlesOf(0).length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2103 end');
    });

    /**
     * @tc.name   testSldReal2104
     * @tc.number SUB_MNB_SLD_2104
     * @tc.desc   Entry 2 ('game') expands into two sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSldReal2104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2104 begin');
      const subTitles: MenuType[] = subTitlesOf(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'count=%{public}s expected=%{public}s',
        String(subTitles.length), String(SIDE_LIST_SUBTITLE_COUNTS[2]));
      expect(subTitles.length).assertEqual(2);
      expect(subTitles.length).assertEqual(SIDE_LIST_SUBTITLE_COUNTS[2]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check subTitles[0] !== undefined');
      expect(subTitles[0] !== undefined).assertTrue();
      expect(sideListData[2].subTitleList === sideListData[1].subTitleList).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2104 end');
    });

    /**
     * @tc.name   testSldReal2105
     * @tc.number SUB_MNB_SLD_2105
     * @tc.desc   Entry 3 ('explore') expands into two sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSldReal2105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2105 begin');
      const subTitles: MenuType[] = subTitlesOf(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'count=%{public}s expected=%{public}s',
        String(subTitles.length), String(SIDE_LIST_SUBTITLE_COUNTS[3]));
      expect(subTitles.length).assertEqual(2);
      expect(subTitles.length).assertEqual(SIDE_LIST_SUBTITLE_COUNTS[3]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check subTitles[1] !== undefined');
      expect(subTitles[1] !== undefined).assertTrue();
      expect(subTitles[0] !== subTitles[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2105 end');
    });

    /**
     * @tc.name   testSldReal2106
     * @tc.number SUB_MNB_SLD_2106
     * @tc.desc   Entry 4 ('mine') expands into two sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSldReal2106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2106 begin');
      const subTitles: MenuType[] = subTitlesOf(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'count=%{public}s expected=%{public}s',
        String(subTitles.length), String(SIDE_LIST_SUBTITLE_COUNTS[4]));
      expect(subTitles.length).assertEqual(2);
      expect(subTitles.length).assertEqual(SIDE_LIST_SUBTITLE_COUNTS[4]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check subTitles[0] !== undefined');
      expect(subTitles[0] !== undefined).assertTrue();
      expect(sideListData[4].subTitleList === sideListData[0].subTitleList).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2106 end');
    });

    /**
     * @tc.name   testSldReal2107
     * @tc.number SUB_MNB_SLD_2107
     * @tc.desc   Every entry owns a wide-layout tab controller
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSldReal2107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2107 begin');
      let missing: number = 0;
      for (let i: number = 0; i < sideListData.length; i++) {
        if (sideListData[i].subController === undefined) {
          missing++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'missing=%{public}s total=%{public}s', String(missing),
        String(sideListData.length));
      expect(missing).assertEqual(0);
      expect(sideListData.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check sideListData[0].subController !== undefined');
      expect(sideListData[0].subController !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2107 end');
    });

    /**
     * @tc.name   testSldReal2108
     * @tc.number SUB_MNB_SLD_2108
     * @tc.desc   Every entry owns a compact-layout tab controller as well
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSldReal2108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2108 begin');
      let missing: number = 0;
      for (let i: number = 0; i < sideListData.length; i++) {
        if (sideListData[i].subController_sm === undefined) {
          missing++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'missing=%{public}s', String(missing));
      expect(missing).assertEqual(0);
      expect(sideListData[4].subController_sm !== undefined).assertTrue();
      expect(SIDE_LIST_VISIBLE_ON_WIDE).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2108 end');
    });

    /**
     * @tc.name   testSldReal2109
     * @tc.number SUB_MNB_SLD_2109
     * @tc.desc   Every entry carries an icon resource
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSldReal2109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2109 begin');
      let missing: number = 0;
      for (let i: number = 0; i < sideListData.length; i++) {
        if (sideListData[i].icon === undefined) {
          missing++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'missing=%{public}s', String(missing));
      expect(missing).assertEqual(0);
      expect(sideListData[2].icon !== undefined).assertTrue();
      expect(subTitlesOf(2).length).assertEqual(SIDE_LIST_SUBTITLE_COUNTS[2]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2109 end');
    });

    /**
     * @tc.name   testSldReal2110
     * @tc.number SUB_MNB_SLD_2110
     * @tc.desc   Every entry carries a name resource
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSldReal2110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2110 begin');
      let missing: number = 0;
      for (let i: number = 0; i < sideListData.length; i++) {
        if (sideListData[i].name === undefined) {
          missing++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'missing=%{public}s', String(missing));
      expect(missing).assertEqual(0);
      expect(sideListData[0].name !== undefined).assertTrue();
      expect(sideListData.length).assertEqual(SIDE_LIST_SIZE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2110 end');
    });

    /**
     * @tc.name   testSldReal2111
     * @tc.number SUB_MNB_SLD_2111
     * @tc.desc   The wide and compact controllers of one entry are different instances
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldReal2111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2111 begin');
      const entry: MenuType = sideListData[1];
      const sameInstance: boolean = entry.subController === entry.subController_sm;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sameInstance=%{public}s expected=%{public}s',
        String(sameInstance), 'false');
      expect(sameInstance).assertFalse();
      expect(entry.subController !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check entry.subController_sm !== undefined');
      expect(entry.subController_sm !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2111 end');
    });

    /**
     * @tc.name   testSldReal2112
     * @tc.number SUB_MNB_SLD_2112
     * @tc.desc   Sub title records only carry a name; they never own controllers or icons
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldReal2112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2112 begin');
      let withController: number = 0;
      let withIcon: number = 0;
      for (let i: number = 0; i < sideListData.length; i++) {
        const subTitles: MenuType[] = subTitlesOf(i);
        for (let j: number = 0; j < subTitles.length; j++) {
          if (subTitles[j].subController !== undefined) {
            withController++;
          }
          if (subTitles[j].icon !== undefined) {
            withIcon++;
          }
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'withController=%{public}s withIcon=%{public}s',
        String(withController), String(withIcon));
      expect(withController).assertEqual(0);
      expect(withIcon).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check subTitlesOf(0)[0].name !== undefined');
      expect(subTitlesOf(0)[0].name !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2112 end');
    });

    /**
     * @tc.name   testSldReal2113
     * @tc.number SUB_MNB_SLD_2113
     * @tc.desc   Property: the sub title counts add up to eleven records
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldReal2113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2113 begin');
      let total: number = 0;
      for (let i: number = 0; i < sideListData.length; i++) {
        total += subTitlesOf(i).length;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'total=%{public}s expected=%{public}s', String(total), '11');
      expect(total).assertEqual(11);
      expect(SIDE_LIST_SUBTITLE_COUNTS.length).assertEqual(5);
      expect(SIDE_LIST_SUBTITLE_COUNTS[0] + SIDE_LIST_SUBTITLE_COUNTS[1] +
        SIDE_LIST_SUBTITLE_COUNTS[2] + SIDE_LIST_SUBTITLE_COUNTS[3] + SIDE_LIST_SUBTITLE_COUNTS[4])
        .assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2113 end');
    });

    /**
     * @tc.name   testSldReal2114
     * @tc.number SUB_MNB_SLD_2114
     * @tc.desc   Anchor: the wide layout hides the last entry, leaving four visible items
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSldReal2114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2114 begin');
      const visibleOnWide: number = sideListData.length - 1;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'visible=%{public}s expected=%{public}s', String(visibleOnWide), '4');
      expect(visibleOnWide).assertEqual(4);
      expect(visibleOnWide).assertEqual(SIDE_LIST_VISIBLE_ON_WIDE);
      expect(sideListData.length - visibleOnWide).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2114 end');
    });

    /**
     * @tc.name   testSldReal2115
     * @tc.number SUB_MNB_SLD_2115
     * @tc.desc   Anchor: entries 3 and 4 share the same sub title configuration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldReal2115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2115 begin');
      const third: number = subTitlesOf(3).length;
      const fourth: number = subTitlesOf(4).length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'third=%{public}s fourth=%{public}s', String(third), String(fourth));
      expect(third).assertEqual(fourth);
      expect(third).assertEqual(2);
      expect(sideListData[3] !== sideListData[4]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2115 end');
    });

    /**
     * @tc.name   testSldReal2116
     * @tc.number SUB_MNB_SLD_2116
     * @tc.desc   Property: only the first entry owns three sub titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldReal2116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2116 begin');
      let threeSubTitles: number = 0;
      for (let i: number = 0; i < sideListData.length; i++) {
        if (subTitlesOf(i).length === 3) {
          threeSubTitles++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'entriesWithThree=%{public}s', String(threeSubTitles));
      expect(threeSubTitles).assertEqual(1);
      expect(subTitlesOf(0).length).assertEqual(3);
      expect(subTitlesOf(0).length > subTitlesOf(4).length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2116 end');
    });

    /**
     * @tc.name   testSldReal2117
     * @tc.number SUB_MNB_SLD_2117
     * @tc.desc   Combination: every entry matches the frozen sub title count table
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldReal2117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2117 begin');
      let mismatched: number = 0;
      for (let i: number = 0; i < SIDE_LIST_SIZE; i++) {
        if (subTitlesOf(i).length !== SIDE_LIST_SUBTITLE_COUNTS[i]) {
          mismatched++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mismatched=%{public}s', String(mismatched));
      expect(mismatched).assertEqual(0);
      expect(SIDE_LIST_SUBTITLE_COUNTS.length).assertEqual(SIDE_LIST_SIZE);
      expect(SIDE_LIST_SUBTITLE_COUNTS[SIDE_LIST_SIZE - 1]).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2117 end');
    });

    /**
     * @tc.name   testSldReal2118
     * @tc.number SUB_MNB_SLD_2118
     * @tc.desc   State: reading the table twice returns the same record instances
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldReal2118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2118 begin');
      const firstRead: MenuType = sideListData[0];
      const secondRead: MenuType = sideListData[0];
      const sameReference: boolean = firstRead === secondRead;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sameReference=%{public}s expected=%{public}s',
        String(sameReference), 'true');
      expect(sameReference).assertTrue();
      expect(subTitlesOf(0).length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check firstRead.subController === secondRead.subController');
      expect(firstRead.subController === secondRead.subController).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2118 end');
    });

    /**
     * @tc.name   testSldReal2119
     * @tc.number SUB_MNB_SLD_2119
     * @tc.desc   State: a shallow copy can be extended without touching the source table
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldReal2119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2119 begin');
      const workingCopy: MenuType[] = sideListData.slice();
      workingCopy.push(sideListData[0]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'copy=%{public}s source=%{public}s',
        String(workingCopy.length), String(sideListData.length));
      expect(workingCopy.length).assertEqual(6);
      expect(sideListData.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check workingCopy[5] === sideListData[0]');
      expect(workingCopy[5] === sideListData[0]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2119 end');
    });

    /**
     * @tc.name   testSldReal2120
     * @tc.number SUB_MNB_SLD_2120
     * @tc.desc   Property: no entry sets parentNode, so the tree stays flat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldReal2120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2120 begin');
      let withParent: number = 0;
      for (let i: number = 0; i < sideListData.length; i++) {
        if (sideListData[i].parentNode !== undefined) {
          withParent++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'withParent=%{public}s', String(withParent));
      expect(withParent).assertEqual(0);
      expect(String(sideListData[0].parentNode)).assertEqual('undefined');
      expect(String(sideListData[4].parentNode)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2120 end');
    });

    /**
     * @tc.name   testSldReal2121
     * @tc.number SUB_MNB_SLD_2121
     * @tc.desc   Property: no entry sets menuContent, so titles come from resources only
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSldReal2121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2121 begin');
      let withContent: number = 0;
      for (let i: number = 0; i < sideListData.length; i++) {
        if (sideListData[i].menuContent !== undefined) {
          withContent++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'withContent=%{public}s', String(withContent));
      expect(withContent).assertEqual(0);
      expect(String(sideListData[2].menuContent)).assertEqual('undefined');
      expect(sideListData[2].name !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2121 end');
    });

    /**
     * @tc.name   testSldReal2122
     * @tc.number SUB_MNB_SLD_2122
     * @tc.desc   Anchor: reading one past the last index yields undefined instead of throwing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSldReal2122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2122 begin');
      const beyond: MenuType | undefined = sideListData[5];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'beyond=%{public}s expected=%{public}s', String(beyond), 'undefined');
      expect(String(beyond)).assertEqual('undefined');
      expect(sideListData[4] !== undefined).assertTrue();
      expect(sideListData.length - 1).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSldReal2122 end');
    });
  });
}
