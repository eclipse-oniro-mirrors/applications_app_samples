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
  listScenarios, getScenario, formatDateValue, formatTimeValue, formatTextValue, ScenarioInfo
} from '../../../main/ets/model/DialogModels';

/**
 * 弹窗场景目录与选择结果格式化的设备侧测试
 * 覆盖：场景目录完整性（14 项）、id 连续、系统弹窗场景 API 映射、越界查询、日期/时间/文本结果格式化
 */
export default function dialogScenariosTest() {
  describe('dialogScenariosTest', () => {
    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOS_0100
     * @tc.name scenarioCountIsFourteen
     * @tc.desc Verify the dialog scenario catalog contains fourteen entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scenarioCountIsFourteen', 0, () => {
      expect(listScenarios().length).assertEqual(14);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOS_0200
     * @tc.name scenarioIdsAreSequential
     * @tc.desc Verify ids are sequential from one and every entry has title, api and group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scenarioIdsAreSequential', 0, () => {
      const all: ScenarioInfo[] = listScenarios();
      for (let i = 0; i < all.length; i++) {
        expect(all[i].id).assertEqual(i + 1);
        expect(all[i].title.length > 0).assertTrue();
        expect(all[i].api.length > 0).assertTrue();
        expect(all[i].group.length > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOS_0300
     * @tc.name systemScenarioApisAreMapped
     * @tc.desc Verify scenarios nine to fourteen map to the expected system dialog APIs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('systemScenarioApisAreMapped', 0, () => {
      expect(getScenario(9)!.api).assertEqual('showActionSheet');
      expect(getScenario(10)!.api).assertEqual('showDatePickerDialog');
      expect(getScenario(11)!.api).assertEqual('showTimePickerDialog');
      expect(getScenario(12)!.api).assertEqual('showTextPickerDialog');
      expect(getScenario(13)!.api).assertEqual('openToast');
      expect(getScenario(14)!.api).assertEqual('showDialog');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOS_0400
     * @tc.name scenarioLookupBoundary
     * @tc.desc Verify lookup returns null for out-of-range ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scenarioLookupBoundary', 0, () => {
      expect(getScenario(0)).assertNull();
      expect(getScenario(15)).assertNull();
      expect(getScenario(-1)).assertNull();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOS_0500
     * @tc.name formatDatePadsMonthAndDay
     * @tc.desc Verify date result formatting pads month and day to two digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDatePadsMonthAndDay', 0, () => {
      expect(formatDateValue(new Date(2026, 0, 5))).assertEqual('2026-01-05');
      expect(formatDateValue(new Date(2026, 11, 31))).assertEqual('2026-12-31');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOS_0600
     * @tc.name formatTimePadsHourAndMinute
     * @tc.desc Verify time result formatting pads hour and minute to two digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTimePadsHourAndMinute', 0, () => {
      expect(formatTimeValue(9, 5)).assertEqual('09:05');
      expect(formatTimeValue(0, 0)).assertEqual('00:00');
      expect(formatTimeValue(23, 59)).assertEqual('23:59');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_SCENARIOS_0700
     * @tc.name formatTextIncludesIndexAndValue
     * @tc.desc Verify text picker result formatting includes index and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTextIncludesIndexAndValue', 0, () => {
      expect(formatTextValue('北京', 2)).assertEqual('index=2 value=北京');
      expect(formatTextValue('', 0)).assertEqual('index=0 value=');
    });
  });
}
