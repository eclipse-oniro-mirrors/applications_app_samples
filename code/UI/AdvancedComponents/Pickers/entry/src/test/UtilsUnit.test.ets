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
import { BreakpointUtils } from '../main/ets/utils/BreakpointUtils';
import { PickerUtils } from '../main/ets/utils/PickerUtils';

export default function utilsUnitTest() {
  describe('UtilsUnitTest', () => {
    it('PickerUtils_Format_001', 0, () => {
      expect(PickerUtils.formatDateParts(2026, 0, 5)).assertEqual('2026-01-05');
      expect(PickerUtils.formatTimeParts(9, 5, 7)).assertEqual('09:05:07');
      expect(PickerUtils.clampIndex(9, 5)).assertEqual(4);
      expect(PickerUtils.clampIndex(-2, 5)).assertEqual(0);
    });

    it('PickerUtils_Range_001', 0, () => {
      const start = new Date(2020, 0, 1);
      const end = new Date(2030, 11, 31);
      expect(PickerUtils.formatDateRange(start, end)).assertEqual('2020-01-01 ~ 2030-12-31');
      expect(PickerUtils.isWithinRange(new Date(2025, 5, 1), start, end)).assertTrue();
      expect(PickerUtils.formatDate(PickerUtils.clampDate(new Date(2040, 0, 1), start, end)))
        .assertEqual('2030-12-31');
      expect(PickerUtils.describeConfig(true, false, true, true))
        .assertEqual('lunar=true, loop=false, military=true, seconds=true');
    });

    it('BreakpointUtils_Template_001', 0, () => {
      expect(BreakpointUtils.gridTemplate(500)).assertEqual('1fr');
      expect(BreakpointUtils.gridTemplate(700)).assertEqual('1fr 1fr');
      expect(BreakpointUtils.gridTemplate(1000)).assertEqual('1fr 1fr 1fr');
      expect(BreakpointUtils.describe(700)).assertContain('breakpoint=md');
    });
  });
}
