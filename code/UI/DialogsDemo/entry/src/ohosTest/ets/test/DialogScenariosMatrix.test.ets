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

import { describe, it, expect } from '@ohos/hypium';
import {
  listScenarios, getScenario, formatDateValue, formatTimeValue, formatTextValue, DialogEventLog, ScenarioInfo
} from '../../../main/ets/model/DialogModels';

/**
 * 弹窗场景目录与结果格式化的边界/组合测试
 * 覆盖：分组计数、标题与 API 唯一性、目录返回副本独立性、目录与查询一致性、分组边界、
 * 日期年份/单数字/时间部分忽略、时间边界、文本 Unicode 与越界下标、两位 sceneId 事件行格式
 */
export default function dialogScenariosMatrixTest() {
  describe('dialogScenariosMatrixTest', () => {
    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOSMATRIX_0100
     * @tc.name groupCountsAreStable
     * @tc.desc Verify each group has the expected number of scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('groupCountsAreStable', 0, () => {
      let dialogV2: number = 0;
      let interstitial: number = 0;
      let systemPrompt: number = 0;
      let systemPicker: number = 0;
      for (const item of listScenarios()) {
        if (item.group === 'DialogV2') {
          dialogV2++;
        } else if (item.group === 'Interstitial') {
          interstitial++;
        } else if (item.group === 'SystemPrompt') {
          systemPrompt++;
        } else if (item.group === 'SystemPicker') {
          systemPicker++;
        }
      }
      expect(dialogV2).assertEqual(7);
      expect(interstitial).assertEqual(1);
      expect(systemPrompt).assertEqual(3);
      expect(systemPicker).assertEqual(3);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOSMATRIX_0200
     * @tc.name titlesAndApisAreUnique
     * @tc.desc Verify scenario titles and API names are unique across the catalog
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('titlesAndApisAreUnique', 0, () => {
      const titles: Set<string> = new Set<string>();
      const apis: Set<string> = new Set<string>();
      for (const item of listScenarios()) {
        titles.add(item.title);
        apis.add(item.api);
      }
      expect(titles.size).assertEqual(14);
      expect(apis.size).assertEqual(14);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOSMATRIX_0300
     * @tc.name listScenariosReturnsIndependentCopies
     * @tc.desc Verify each call returns an independent array and does not mutate the catalog
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listScenariosReturnsIndependentCopies', 0, () => {
      const first: ScenarioInfo[] = listScenarios();
      const second: ScenarioInfo[] = listScenarios();
      first[0] = new ScenarioInfo(99, '临时', 'temp', 'Temp');
      expect(second[0].id).assertEqual(1);
      expect(listScenarios()[0].id).assertEqual(1);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOSMATRIX_0400
     * @tc.name catalogEntriesMatchLookup
     * @tc.desc Verify every catalog entry can be found by id with identical fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('catalogEntriesMatchLookup', 0, () => {
      const all: ScenarioInfo[] = listScenarios();
      for (const item of all) {
        const found: ScenarioInfo | null = getScenario(item.id);
        expect(found !== null).assertTrue();
        expect(found!.title).assertEqual(item.title);
        expect(found!.api).assertEqual(item.api);
        expect(found!.group).assertEqual(item.group);
      }
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOSMATRIX_0500
     * @tc.name groupBoundaryScenarios
     * @tc.desc Verify group membership at catalog boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('groupBoundaryScenarios', 0, () => {
      expect(getScenario(1)!.group).assertEqual('DialogV2');
      expect(getScenario(7)!.group).assertEqual('DialogV2');
      expect(getScenario(8)!.group).assertEqual('Interstitial');
      expect(getScenario(9)!.group).assertEqual('SystemPrompt');
      expect(getScenario(10)!.group).assertEqual('SystemPicker');
      expect(getScenario(13)!.group).assertEqual('SystemPrompt');
      expect(getScenario(14)!.group).assertEqual('SystemPrompt');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOSMATRIX_0600
     * @tc.name formatDateYearBoundaries
     * @tc.desc Verify date formatting across early, common and late years
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDateYearBoundaries', 0, () => {
      expect(formatDateValue(new Date(1970, 0, 1))).assertEqual('1970-01-01');
      expect(formatDateValue(new Date(2000, 11, 31))).assertEqual('2000-12-31');
      expect(formatDateValue(new Date(2099, 5, 15))).assertEqual('2099-06-15');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOSMATRIX_0700
     * @tc.name formatDateIgnoresTimePart
     * @tc.desc Verify date formatting ignores hour, minute and second fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDateIgnoresTimePart', 0, () => {
      expect(formatDateValue(new Date(2026, 5, 15, 23, 59, 59))).assertEqual('2026-06-15');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOSMATRIX_0800
     * @tc.name formatDateSingleDigitMonthDay
     * @tc.desc Verify single-digit month and day are padded on both sides
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDateSingleDigitMonthDay', 0, () => {
      expect(formatDateValue(new Date(2026, 0, 9))).assertEqual('2026-01-09');
      expect(formatDateValue(new Date(2026, 8, 1))).assertEqual('2026-09-01');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOSMATRIX_0900
     * @tc.name formatTimeBoundaries
     * @tc.desc Verify time formatting at hour and minute boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTimeBoundaries', 0, () => {
      expect(formatTimeValue(0, 0)).assertEqual('00:00');
      expect(formatTimeValue(0, 59)).assertEqual('00:59');
      expect(formatTimeValue(23, 0)).assertEqual('23:00');
      expect(formatTimeValue(23, 59)).assertEqual('23:59');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOSMATRIX_1000
     * @tc.name formatTextUnicodeAndSpaces
     * @tc.desc Verify text formatting preserves unicode characters and inner spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTextUnicodeAndSpaces', 0, () => {
      expect(formatTextValue('上海 浦东', 1)).assertEqual('index=1 value=上海 浦东');
      expect(formatTextValue('🙂', 0)).assertEqual('index=0 value=🙂');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOSMATRIX_1100
     * @tc.name formatTextOutOfRangeIndex
     * @tc.desc Verify text formatting keeps negative and large indexes as-is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTextOutOfRangeIndex', 0, () => {
      expect(formatTextValue('x', -1)).assertEqual('index=-1 value=x');
      expect(formatTextValue('x', 9999)).assertEqual('index=9999 value=x');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOSMATRIX_1200
     * @tc.name eventLogTwoDigitSceneIds
     * @tc.desc Verify event line formats keep two-digit scene ids intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('eventLogTwoDigitSceneIds', 0, () => {
      expect(DialogEventLog.formatOpen(10, '日期')).assertEqual('open#10 日期');
      expect(DialogEventLog.formatClose(14, '弹窗')).assertEqual('close#14 弹窗');
      expect(DialogEventLog.formatClick(12)).assertEqual('click#12');
      expect(DialogEventLog.formatSelect(12, 3)).assertEqual('select#12 index=3');
      expect(DialogEventLog.formatCheck(13, true)).assertEqual('check#13 checked=true');
      expect(DialogEventLog.formatError(14, 'e')).assertEqual('error#14 e');
    });
  });
}
