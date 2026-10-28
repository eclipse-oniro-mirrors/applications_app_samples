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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { BreakpointUtils } from '../../../main/ets/utils/BreakpointUtils';
import { PickerUtils } from '../../../main/ets/utils/PickerUtils';
import { DeviceInfoUtils } from '../../../main/ets/utils/DeviceInfoUtils';
import { runCase } from '../testkit/SharedDriver';

export default function logicTest() {
  describe('PickersLogicTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number SUB_PICKERS_LOGIC_0100
     * @tc.name testPickersLogicDate0001
     * @tc.desc Verify logic date behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersLogicDate0001', 0, async (done: Function) => {
      await runCase('testPickersLogicDate0001', async () => {
        expect(PickerUtils.formatDateParts(2026, 0, 5)).assertEqual('2026-01-05');
        expect(PickerUtils.formatDateParts(2026, 11, 31)).assertEqual('2026-12-31');
        expect(PickerUtils.formatTimeParts(9, 5, 7)).assertEqual('09:05:07');
        expect(PickerUtils.formatTimeParts(23, 59, 59)).assertEqual('23:59:59');
        expect(PickerUtils.formatDate(new Date(2026, 0, 5))).assertEqual('2026-01-05');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_LOGIC_0200
     * @tc.name testPickersLogicClamp0002
     * @tc.desc Verify logic clamp behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersLogicClamp0002', 0, async (done: Function) => {
      await runCase('testPickersLogicClamp0002', async () => {
        expect(PickerUtils.clampIndex(-1, 5)).assertEqual(0);
        expect(PickerUtils.clampIndex(0, 5)).assertEqual(0);
        expect(PickerUtils.clampIndex(4, 5)).assertEqual(4);
        expect(PickerUtils.clampIndex(5, 5)).assertEqual(4);
        expect(PickerUtils.clampIndex(3, 0)).assertEqual(0);
        expect(PickerUtils.describeSelection('Selected', 'Todo')).assertEqual('Selected: Todo');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_LOGIC_0300
     * @tc.name testPickersLogicBreakpoint0003
     * @tc.desc Verify logic breakpoint behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersLogicBreakpoint0003', 0, async (done: Function) => {
      await runCase('testPickersLogicBreakpoint0003', async () => {
        expect(BreakpointUtils.resolve(600)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(601)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.resolve(841)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.gridTemplate(500)).assertEqual('1fr');
        expect(BreakpointUtils.gridTemplate(700)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.gridTemplate(1000)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.columnCount(1000)).assertEqual(3);
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_LOGIC_0400
     * @tc.name testPickersLogicRange0004
     * @tc.desc Verify logic range behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersLogicRange0004', 0, async (done: Function) => {
      await runCase('testPickersLogicRange0004', async () => {
        const start = new Date(2020, 0, 1);
        const end = new Date(2030, 11, 31);
        expect(PickerUtils.formatDateRange(start, end)).assertEqual('2020-01-01 ~ 2030-12-31');
        expect(PickerUtils.isWithinRange(new Date(2026, 9, 27), start, end)).assertTrue();
        expect(PickerUtils.isWithinRange(new Date(2019, 0, 1), start, end)).assertFalse();
        const low = PickerUtils.clampDate(new Date(2010, 0, 1), start, end);
        expect(PickerUtils.formatDate(low)).assertEqual('2020-01-01');
        const high = PickerUtils.clampDate(new Date(2040, 0, 1), start, end);
        expect(PickerUtils.formatDate(high)).assertEqual('2030-12-31');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_LOGIC_0500
     * @tc.name testPickersLogicConfig0005
     * @tc.desc Verify logic config behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersLogicConfig0005', 0, async (done: Function) => {
      await runCase('testPickersLogicConfig0005', async () => {
        expect(PickerUtils.describeConfig(false, false, true, false))
          .assertEqual('lunar=false, loop=false, military=true, seconds=false');
        expect(PickerUtils.describeConfig(true, true, false, true))
          .assertEqual('lunar=true, loop=true, military=false, seconds=true');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_LOGIC_0600
     * @tc.name testPickersLogicDevice0006
     * @tc.desc Verify logic device behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersLogicDevice0006', 0, async (done: Function) => {
      await runCase('testPickersLogicDevice0006', async () => {
        const screen = DeviceInfoUtils.screenInfo();
        expect(screen).assertContain('device=');
        expect(screen).assertContain('width=');
        expect(DeviceInfoUtils.deviceType().length > 0).assertTrue();
      }, done);
    });
  });
}
