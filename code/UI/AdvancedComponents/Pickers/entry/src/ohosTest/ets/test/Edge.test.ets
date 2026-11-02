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
import { DeviceInfoUtils } from '../../../main/ets/utils/DeviceInfoUtils';
import { PickerUtils } from '../../../main/ets/utils/PickerUtils';
import {
  clickId,
  existsId,
  runCase,
  scrollToId,
  startApp,
  textOfId,
  waitId,
  waitText
} from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.pickers';
const ABILITY_NAME: string = 'EntryAbility';

export default function edgeTest() {
  describe('PickersEdgeTest', () => {
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
     * @tc.number SUB_PICKERS_EDGE_0100
     * @tc.name testPickersEdgeDefaults0001
     * @tc.desc Verify optional date and time parts use stable defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersEdgeDefaults0001', 0, async (done: Function) => {
      await runCase('testPickersEdgeDefaults0001', async () => {
        expect(PickerUtils.pad2(0)).assertEqual('00');
        expect(PickerUtils.pad2(9)).assertEqual('09');
        expect(PickerUtils.pad2(10)).assertEqual('10');
        expect(PickerUtils.pad2(99)).assertEqual('99');
        expect(PickerUtils.formatDateParts()).assertEqual('0-00-00');
        expect(PickerUtils.formatDateParts(2024)).assertEqual('2024-00-00');
        expect(PickerUtils.formatDateParts(2024, 1)).assertEqual('2024-02-00');
        expect(PickerUtils.formatDateParts(999, 11, 31)).assertEqual('999-12-31');
        expect(PickerUtils.formatTimeParts()).assertEqual('00:00:00');
        expect(PickerUtils.formatTimeParts(5)).assertEqual('05:00:00');
        expect(PickerUtils.formatTimeParts(9, 5)).assertEqual('09:05:00');
        expect(PickerUtils.formatDate(new Date(1970, 0, 1))).assertEqual('1970-01-01');
        expect(PickerUtils.formatDate(new Date(2099, 11, 31))).assertEqual('2099-12-31');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_EDGE_0200
     * @tc.name testPickersEdgeWrap0002
     * @tc.desc Verify large deltas, negative indexes, and empty list lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersEdgeWrap0002', 0, async (done: Function) => {
      await runCase('testPickersEdgeWrap0002', async () => {
        expect(PickerUtils.wrapIndex(-6, 5)).assertEqual(4);
        expect(PickerUtils.wrapIndex(10, 5)).assertEqual(0);
        expect(PickerUtils.wrapIndex(-10, 5)).assertEqual(0);
        expect(PickerUtils.wrapIndex(0, 1)).assertEqual(0);
        expect(PickerUtils.wrapIndex(5, 1)).assertEqual(0);
        expect(PickerUtils.wrapIndex(2, -1)).assertEqual(0);
        expect(PickerUtils.stepIndex(2, 10, 5, true)).assertEqual(2);
        expect(PickerUtils.stepIndex(2, -10, 5, true)).assertEqual(2);
        expect(PickerUtils.stepIndex(2, 10, 5, false)).assertEqual(4);
        expect(PickerUtils.stepIndex(2, -10, 5, false)).assertEqual(0);
        expect(PickerUtils.stepIndex(0, 0, 5, true)).assertEqual(0);
        expect(PickerUtils.stepIndex(0, 0, 5, false)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_EDGE_0300
     * @tc.name testPickersEdgeRange0003
     * @tc.desc Verify equal range boundaries, in-range dates, and leap day formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersEdgeRange0003', 0, async (done: Function) => {
      await runCase('testPickersEdgeRange0003', async () => {
        const start = new Date(2020, 0, 1);
        const end = new Date(2030, 11, 31);
        expect(PickerUtils.isWithinRange(start, start, end)).assertTrue();
        expect(PickerUtils.isWithinRange(new Date(2025, 5, 15), start, end)).assertTrue();
        expect(PickerUtils.formatDate(PickerUtils.clampDate(new Date(2025, 5, 15), start, end)))
          .assertEqual('2025-06-15');
        expect(PickerUtils.formatDate(PickerUtils.clampDate(new Date(2020, 0, 1), start, start)))
          .assertEqual('2020-01-01');
        expect(PickerUtils.formatDateRange(start, start)).assertEqual('2020-01-01 ~ 2020-01-01');
        expect(PickerUtils.formatDate(new Date(2024, 1, 29))).assertEqual('2024-02-29');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_EDGE_0400
     * @tc.name testPickersEdgeDateBack0004
     * @tc.desc Verify the date picker page returns to the index directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersEdgeDateBack0004', 0, async (done: Function) => {
      await runCase('testPickersEdgeDateBack0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardDatePicker');
        await waitId('datePicker');
        await clickId('dateBack');
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_EDGE_0500
     * @tc.name testPickersEdgeHistory0005
     * @tc.desc Verify calendar event history and its clear empty state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersEdgeHistory0005', 0, async (done: Function) => {
      await runCase('testPickersEdgeHistory0005', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardCalendar');
        await clickId('calendarToday');
        expect(await textOfId('calendarEvent')).assertContain('today');
        await scrollToId('calendarClearHistory');
        await clickId('calendarClearHistory');
        await waitText('No events yet');
        expect(await existsId('calendarHistory')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_MATRIX_0100
     * @tc.name testPickersMatrixDateDefaults0006
     * @tc.desc Verify leap-day and year-boundary formatting behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersMatrixDateDefaults0006', 0, async (done: Function) => {
      await runCase('testPickersMatrixDateDefaults0006', async () => {
        expect(PickerUtils.formatDateParts(2000, 1, 29)).assertEqual('2000-02-29');
        expect(PickerUtils.formatDateParts(2100, 1, 29)).assertEqual('2100-02-29');
        expect(PickerUtils.formatDate(new Date(2000, 1, 29))).assertEqual('2000-02-29');
        expect(PickerUtils.formatDate(new Date(2024, 1, 29))).assertEqual('2024-02-29');
        expect(PickerUtils.formatTimeParts(0, 0, 0)).assertEqual('00:00:00');
        expect(PickerUtils.formatTimeParts(23, 59, 59)).assertEqual('23:59:59');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_MATRIX_0200
     * @tc.name testPickersMatrixRange0007
     * @tc.desc Verify equal endpoints, reversed range formatting, and clamping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersMatrixRange0007', 0, async (done: Function) => {
      await runCase('testPickersMatrixRange0007', async () => {
        const start = new Date(2020, 0, 1);
        const end = new Date(2030, 11, 31);
        expect(PickerUtils.formatDateRange(end, start)).assertEqual('2030-12-31 ~ 2020-01-01');
        expect(PickerUtils.clampDate(start, start, end)).assertEqual(start);
        expect(PickerUtils.clampDate(end, start, end)).assertEqual(end);
        expect(PickerUtils.isWithinRange(start, start, start)).assertTrue();
        expect(PickerUtils.isWithinRange(end, end, end)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_MATRIX_0300
     * @tc.name testPickersMatrixConfig0008
     * @tc.desc Verify configuration strings and empty selection labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersMatrixConfig0008', 0, async (done: Function) => {
      await runCase('testPickersMatrixConfig0008', async () => {
        expect(PickerUtils.describeConfig(false, false, false, false))
          .assertEqual('lunar=false, loop=false, military=false, seconds=false');
        expect(PickerUtils.describeConfig(true, true, true, true))
          .assertEqual('lunar=true, loop=true, military=true, seconds=true');
        expect(PickerUtils.describeSelection('', '')).assertEqual(': ');
        expect(PickerUtils.pad2(100)).assertEqual('100');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_MATRIX_0400
     * @tc.name testPickersMatrixStep0009
     * @tc.desc Verify large positive and negative steps with loop enabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersMatrixStep0009', 0, async (done: Function) => {
      await runCase('testPickersMatrixStep0009', async () => {
        expect(PickerUtils.wrapIndex(7, 2)).assertEqual(1);
        expect(PickerUtils.wrapIndex(-7, 2)).assertEqual(1);
        expect(PickerUtils.stepIndex(0, -1, 3, true)).assertEqual(2);
        expect(PickerUtils.stepIndex(5, -2, 3, true)).assertEqual(0);
        expect(PickerUtils.stepIndex(2, 1, 3, false)).assertEqual(2);
        expect(PickerUtils.stepIndex(-5, 2, 3, false)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_MATRIX_0500
     * @tc.name testPickersMatrixSelection0010
     * @tc.desc Verify selection and index helpers at exact boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersMatrixSelection0010', 0, async (done: Function) => {
      await runCase('testPickersMatrixSelection0010', async () => {
        expect(PickerUtils.clampIndex(2, 3)).assertEqual(2);
        expect(PickerUtils.clampIndex(3, 3)).assertEqual(2);
        expect(PickerUtils.wrapIndex(3, 3)).assertEqual(0);
        expect(PickerUtils.wrapIndex(-3, 3)).assertEqual(0);
        expect(PickerUtils.stepIndex(1, 1, 3, true)).assertEqual(2);
        expect(PickerUtils.stepIndex(2, 1, 3, true)).assertEqual(0);
      }, done);
    });


    /**
     * @tc.number SUB_PICKERS_MATRIX_0600
     * @tc.name testPickersMatrixBreakpointBounds0012
     * @tc.desc Verify resolve, width helpers, padding, and grid at breakpoint boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersMatrixBreakpointBounds0012', 0, async (done: Function) => {
      await runCase('testPickersMatrixBreakpointBounds0012', async () => {
        expect(BreakpointUtils.resolve(0)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(599)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(600)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(601)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.resolve(840)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.resolve(841)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(600)).assertEqual(560);
        expect(BreakpointUtils.contentMaxWidth(601)).assertEqual(720);
        expect(BreakpointUtils.contentMaxWidth(841)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(600)).assertEqual(16);
        expect(BreakpointUtils.pagePadding(601)).assertEqual(24);
        expect(BreakpointUtils.pagePadding(841)).assertEqual(32);
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_MATRIX_0700
     * @tc.name testPickersMatrixGridBounds0013
     * @tc.desc Verify grid template, column count, and wide flag boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersMatrixGridBounds0013', 0, async (done: Function) => {
      await runCase('testPickersMatrixGridBounds0013', async () => {
        expect(BreakpointUtils.gridTemplate(600)).assertEqual('1fr');
        expect(BreakpointUtils.gridTemplate(601)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.gridTemplate(841)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.columnCount(600)).assertEqual(1);
        expect(BreakpointUtils.columnCount(601)).assertEqual(2);
        expect(BreakpointUtils.columnCount(841)).assertEqual(3);
        expect(BreakpointUtils.isWide(600)).assertFalse();
        expect(BreakpointUtils.isWide(601)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_MATRIX_0800
     * @tc.name testPickersMatrixDescribe0014
     * @tc.desc Verify breakpoint descriptions at zero and exact boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersMatrixDescribe0014', 0, async (done: Function) => {
      await runCase('testPickersMatrixDescribe0014', async () => {
        expect(BreakpointUtils.describe(0)).assertEqual('width=0vp, breakpoint=sm');
        expect(BreakpointUtils.describe(600)).assertEqual('width=600vp, breakpoint=sm');
        expect(BreakpointUtils.describe(601)).assertEqual('width=601vp, breakpoint=md');
        expect(BreakpointUtils.describe(840)).assertEqual('width=840vp, breakpoint=md');
        expect(BreakpointUtils.describe(841)).assertEqual('width=841vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_MATRIX_0900
     * @tc.name testPickersMatrixDeviceInfo0015
     * @tc.desc Verify device screen information exposes every expected field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersMatrixDeviceInfo0015', 0, async (done: Function) => {
      await runCase('testPickersMatrixDeviceInfo0015', async () => {
        const screen = DeviceInfoUtils.screenInfo();
        expect(screen).assertContain('device=');
        expect(screen).assertContain('width=');
        expect(screen).assertContain('height=');
        expect(screen).assertContain('density=');
        expect(screen).assertContain('orientation=');
        expect(DeviceInfoUtils.deviceType().length > 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_MATRIX_1000
     * @tc.name testPickersMatrixCustom0016
     * @tc.desc Verify additional project-specific boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersMatrixCustom0016', 0, async (done: Function) => {
      await runCase('testPickersMatrixCustom0016', async () => {
        expect(PickerUtils.pad2(0)).assertEqual('00');
        expect(PickerUtils.pad2(9)).assertEqual('09');
        expect(PickerUtils.pad2(10)).assertEqual('10');
        expect(PickerUtils.pad2(99)).assertEqual('99');
        expect(PickerUtils.pad2(100)).assertEqual('100');
      }, done);
    });


    /**
     * @tc.number SUB_PICKERS_EXTRA_1100
     * @tc.name testPickersExtraDateParts0021
     * @tc.desc Verify date parts use zero based months
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersExtraDateParts0021', 0, async (done: Function) => {
      await runCase('testPickersExtraDateParts0021', async () => {
        expect(PickerUtils.formatDateParts(1970, 0, 1)).assertEqual('1970-01-01');
        expect(PickerUtils.formatDateParts(2099, 11, 31)).assertEqual('2099-12-31');
        expect(PickerUtils.formatDateParts(2024, 1, 29)).assertEqual('2024-02-29');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_EXTRA_1200
     * @tc.name testPickersExtraTimeParts0022
     * @tc.desc Verify time parts pad every component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersExtraTimeParts0022', 0, async (done: Function) => {
      await runCase('testPickersExtraTimeParts0022', async () => {
        expect(PickerUtils.formatTimeParts(0, 0, 0)).assertEqual('00:00:00');
        expect(PickerUtils.formatTimeParts(5, 6, 7)).assertEqual('05:06:07');
        expect(PickerUtils.formatTimeParts(23, 59, 59)).assertEqual('23:59:59');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_EXTRA_1300
     * @tc.name testPickersExtraRangeFormat0023
     * @tc.desc Verify range formatting keeps both endpoints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersExtraRangeFormat0023', 0, async (done: Function) => {
      await runCase('testPickersExtraRangeFormat0023', async () => {
        const start = new Date(2020, 0, 1);
        const end = new Date(2030, 11, 31);
        expect(PickerUtils.formatDateRange(start, end)).assertEqual('2020-01-01 ~ 2030-12-31');
        expect(PickerUtils.formatDateRange(end, start)).assertEqual('2030-12-31 ~ 2020-01-01');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_EXTRA_1400
     * @tc.name testPickersExtraClampDate0024
     * @tc.desc Verify date clamping covers below, inside, and above
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersExtraClampDate0024', 0, async (done: Function) => {
      await runCase('testPickersExtraClampDate0024', async () => {
        const start = new Date(2020, 0, 1);
        const end = new Date(2030, 11, 31);
        expect(PickerUtils.formatDate(PickerUtils.clampDate(new Date(2010, 0, 1), start, end)))
          .assertEqual('2020-01-01');
        expect(PickerUtils.formatDate(PickerUtils.clampDate(new Date(2025, 5, 15), start, end)))
          .assertEqual('2025-06-15');
        expect(PickerUtils.formatDate(PickerUtils.clampDate(new Date(2040, 0, 1), start, end)))
          .assertEqual('2030-12-31');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_EXTRA_1500
     * @tc.name testPickersExtraWithinRange0025
     * @tc.desc Verify range checks include both endpoints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersExtraWithinRange0025', 0, async (done: Function) => {
      await runCase('testPickersExtraWithinRange0025', async () => {
        const start = new Date(2020, 0, 1);
        const end = new Date(2030, 11, 31);
        expect(PickerUtils.isWithinRange(start, start, end)).assertTrue();
        expect(PickerUtils.isWithinRange(end, start, end)).assertTrue();
        expect(PickerUtils.isWithinRange(new Date(2019, 11, 31), start, end)).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_EXTRA_1600
     * @tc.name testPickersExtraWrap0026
     * @tc.desc Verify wrap index handles negative and oversized values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersExtraWrap0026', 0, async (done: Function) => {
      await runCase('testPickersExtraWrap0026', async () => {
        expect(PickerUtils.wrapIndex(-1, 4)).assertEqual(3);
        expect(PickerUtils.wrapIndex(4, 4)).assertEqual(0);
        expect(PickerUtils.wrapIndex(-5, 4)).assertEqual(3);
        expect(PickerUtils.wrapIndex(9, 4)).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_EXTRA_1700
     * @tc.name testPickersExtraStep0027
     * @tc.desc Verify steps honor loop and clamp modes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersExtraStep0027', 0, async (done: Function) => {
      await runCase('testPickersExtraStep0027', async () => {
        expect(PickerUtils.stepIndex(3, 1, 4, true)).assertEqual(0);
        expect(PickerUtils.stepIndex(3, 1, 4, false)).assertEqual(3);
        expect(PickerUtils.stepIndex(0, -1, 4, true)).assertEqual(3);
        expect(PickerUtils.stepIndex(0, -1, 4, false)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_EXTRA_1800
     * @tc.name testPickersExtraClampIndex0028
     * @tc.desc Verify index clamping handles empty and full ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersExtraClampIndex0028', 0, async (done: Function) => {
      await runCase('testPickersExtraClampIndex0028', async () => {
        expect(PickerUtils.clampIndex(-9, 4)).assertEqual(0);
        expect(PickerUtils.clampIndex(9, 4)).assertEqual(3);
        expect(PickerUtils.clampIndex(2, 4)).assertEqual(2);
        expect(PickerUtils.clampIndex(2, 0)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_EXTRA_1900
     * @tc.name testPickersExtraConfig0029
     * @tc.desc Verify configuration summaries cover all boolean states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersExtraConfig0029', 0, async (done: Function) => {
      await runCase('testPickersExtraConfig0029', async () => {
        expect(PickerUtils.describeConfig(false, true, false, true))
          .assertEqual('lunar=false, loop=true, military=false, seconds=true');
        expect(PickerUtils.describeConfig(true, false, true, false))
          .assertEqual('lunar=true, loop=false, military=true, seconds=false');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_EXTRA_2000
     * @tc.name testPickersExtraSelection0030
     * @tc.desc Verify selection labels keep empty and normal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersExtraSelection0030', 0, async (done: Function) => {
      await runCase('testPickersExtraSelection0030', async () => {
        expect(PickerUtils.describeSelection('', '')).assertEqual(': ');
        expect(PickerUtils.describeSelection('Selected', 'Done')).assertEqual('Selected: Done');
        expect(PickerUtils.pad2(0)).assertEqual('00');
        expect(PickerUtils.pad2(10)).assertEqual('10');
      }, done);
    });


    /**
     * @tc.number SUB_PICKERS_DEEP_1100
     * @tc.name testPickersDeepDateA0031
     * @tc.desc Verify epoch date stays stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersDeepDateA0031', 0, async (done: Function) => {
      await runCase('testPickersDeepDateA0031', async () => {
        expect(PickerUtils.formatDate(new Date(1970, 0, 1))).assertEqual('1970-01-01');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_DEEP_1200
     * @tc.name testPickersDeepDateB0032
     * @tc.desc Verify leap date stays stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersDeepDateB0032', 0, async (done: Function) => {
      await runCase('testPickersDeepDateB0032', async () => {
        expect(PickerUtils.formatDate(new Date(2024, 1, 29))).assertEqual('2024-02-29');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_DEEP_1300
     * @tc.name testPickersDeepTimeA0033
     * @tc.desc Verify midnight time stays stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersDeepTimeA0033', 0, async (done: Function) => {
      await runCase('testPickersDeepTimeA0033', async () => {
        expect(PickerUtils.formatTimeParts(0, 0, 0)).assertEqual('00:00:00');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_DEEP_1400
     * @tc.name testPickersDeepTimeB0034
     * @tc.desc Verify last second stays stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersDeepTimeB0034', 0, async (done: Function) => {
      await runCase('testPickersDeepTimeB0034', async () => {
        expect(PickerUtils.formatTimeParts(23, 59, 59)).assertEqual('23:59:59');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_DEEP_1500
     * @tc.name testPickersDeepClampA0035
     * @tc.desc Verify below range clamps to start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersDeepClampA0035', 0, async (done: Function) => {
      await runCase('testPickersDeepClampA0035', async () => {
        const start = new Date(2020, 0, 1);
        const end = new Date(2030, 11, 31);
        expect(PickerUtils.formatDate(PickerUtils.clampDate(new Date(2019, 0, 1), start, end)))
          .assertEqual('2020-01-01');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_DEEP_1600
     * @tc.name testPickersDeepClampB0036
     * @tc.desc Verify above range clamps to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersDeepClampB0036', 0, async (done: Function) => {
      await runCase('testPickersDeepClampB0036', async () => {
        const start = new Date(2020, 0, 1);
        const end = new Date(2030, 11, 31);
        expect(PickerUtils.formatDate(PickerUtils.clampDate(new Date(2031, 0, 1), start, end)))
          .assertEqual('2030-12-31');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_DEEP_1700
     * @tc.name testPickersDeepWrapA0037
     * @tc.desc Verify wrap index handles length three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersDeepWrapA0037', 0, async (done: Function) => {
      await runCase('testPickersDeepWrapA0037', async () => {
        expect(PickerUtils.wrapIndex(-1, 3)).assertEqual(2);
        expect(PickerUtils.wrapIndex(3, 3)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_DEEP_1800
     * @tc.name testPickersDeepWrapB0038
     * @tc.desc Verify wrap index handles length five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersDeepWrapB0038', 0, async (done: Function) => {
      await runCase('testPickersDeepWrapB0038', async () => {
        expect(PickerUtils.wrapIndex(-2, 5)).assertEqual(3);
        expect(PickerUtils.wrapIndex(6, 5)).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_DEEP_1900
     * @tc.name testPickersDeepStepA0039
     * @tc.desc Verify loop step wraps forward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersDeepStepA0039', 0, async (done: Function) => {
      await runCase('testPickersDeepStepA0039', async () => {
        expect(PickerUtils.stepIndex(2, 1, 3, true)).assertEqual(0);
        expect(PickerUtils.stepIndex(2, 1, 3, false)).assertEqual(2);
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_DEEP_2000
     * @tc.name testPickersDeepStepB0040
     * @tc.desc Verify loop step wraps backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersDeepStepB0040', 0, async (done: Function) => {
      await runCase('testPickersDeepStepB0040', async () => {
        expect(PickerUtils.stepIndex(0, -1, 3, true)).assertEqual(2);
        expect(PickerUtils.stepIndex(0, -1, 3, false)).assertEqual(0);
      }, done);
    });


    /**
     * @tc.number SUB_PICKERS_FINAL_1100
     * @tc.name testPickersFinalA0041
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersFinalA0041', 0, async (done: Function) => {
      await runCase('testPickersFinalA0041', async () => {
        expect(PickerUtils.pad2(0)).assertEqual('00');
        expect(PickerUtils.pad2(10)).assertEqual('10');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_FINAL_1200
     * @tc.name testPickersFinalB0042
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersFinalB0042', 0, async (done: Function) => {
      await runCase('testPickersFinalB0042', async () => {
        expect(PickerUtils.formatDateParts(2024, 1, 29)).assertEqual('2024-02-29');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_FINAL_1300
     * @tc.name testPickersFinalC0043
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersFinalC0043', 0, async (done: Function) => {
      await runCase('testPickersFinalC0043', async () => {
        expect(PickerUtils.formatTimeParts(0, 0, 0)).assertEqual('00:00:00');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_FINAL_1400
     * @tc.name testPickersFinalD0044
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersFinalD0044', 0, async (done: Function) => {
      await runCase('testPickersFinalD0044', async () => {
        expect(PickerUtils.formatTimeParts(23, 59, 59)).assertEqual('23:59:59');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_FINAL_1500
     * @tc.name testPickersFinalE0045
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersFinalE0045', 0, async (done: Function) => {
      await runCase('testPickersFinalE0045', async () => {
        expect(PickerUtils.wrapIndex(-1, 4)).assertEqual(3);
        expect(PickerUtils.wrapIndex(4, 4)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_FINAL_1600
     * @tc.name testPickersFinalF0046
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersFinalF0046', 0, async (done: Function) => {
      await runCase('testPickersFinalF0046', async () => {
        expect(PickerUtils.stepIndex(3, 1, 4, true)).assertEqual(0);
        expect(PickerUtils.stepIndex(3, 1, 4, false)).assertEqual(3);
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_FINAL_1700
     * @tc.name testPickersFinalG0047
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersFinalG0047', 0, async (done: Function) => {
      await runCase('testPickersFinalG0047', async () => {
        expect(PickerUtils.clampIndex(-1, 4)).assertEqual(0);
        expect(PickerUtils.clampIndex(9, 4)).assertEqual(3);
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_FINAL_1800
     * @tc.name testPickersFinalH0048
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersFinalH0048', 0, async (done: Function) => {
      await runCase('testPickersFinalH0048', async () => {
        expect(PickerUtils.describeConfig(true, true, true, true))
          .assertEqual('lunar=true, loop=true, military=true, seconds=true');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_FINAL_1900
     * @tc.name testPickersFinalI0049
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersFinalI0049', 0, async (done: Function) => {
      await runCase('testPickersFinalI0049', async () => {
        expect(PickerUtils.describeSelection('A', 'B')).assertEqual('A: B');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_FINAL_2000
     * @tc.name testPickersFinalJ0050
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersFinalJ0050', 0, async (done: Function) => {
      await runCase('testPickersFinalJ0050', async () => {
        const start = new Date(2020, 0, 1);
        const end = new Date(2030, 11, 31);
        expect(PickerUtils.isWithinRange(start, start, end)).assertTrue();
      }, done);
    });


    /**
     * @tc.number SUB_PICKERS_WIDTH_0100
     * @tc.name testPickersWidth0001
     * @tc.desc Verify breakpoint helpers at width -100vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersWidth0001', 0, async (done: Function) => {
      await runCase('testPickersWidth0001', async () => {
        expect(BreakpointUtils.resolve(-100)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(-100)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(-100)).assertEqual(16);
        expect(BreakpointUtils.columnCount(-100)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(-100)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(-100)).assertFalse();
        expect(BreakpointUtils.describe(-100)).assertEqual('width=-100vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_WIDTH_0200
     * @tc.name testPickersWidth0002
     * @tc.desc Verify breakpoint helpers at width 0vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersWidth0002', 0, async (done: Function) => {
      await runCase('testPickersWidth0002', async () => {
        expect(BreakpointUtils.resolve(0)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(0)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(0)).assertEqual(16);
        expect(BreakpointUtils.columnCount(0)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(0)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(0)).assertFalse();
        expect(BreakpointUtils.describe(0)).assertEqual('width=0vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_WIDTH_0300
     * @tc.name testPickersWidth0003
     * @tc.desc Verify breakpoint helpers at width 1vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersWidth0003', 0, async (done: Function) => {
      await runCase('testPickersWidth0003', async () => {
        expect(BreakpointUtils.resolve(1)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(1)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(1)).assertEqual(16);
        expect(BreakpointUtils.columnCount(1)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(1)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(1)).assertFalse();
        expect(BreakpointUtils.describe(1)).assertEqual('width=1vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_WIDTH_0400
     * @tc.name testPickersWidth0004
     * @tc.desc Verify breakpoint helpers at width 320vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersWidth0004', 0, async (done: Function) => {
      await runCase('testPickersWidth0004', async () => {
        expect(BreakpointUtils.resolve(320)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(320)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(320)).assertEqual(16);
        expect(BreakpointUtils.columnCount(320)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(320)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(320)).assertFalse();
        expect(BreakpointUtils.describe(320)).assertEqual('width=320vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_WIDTH_0500
     * @tc.name testPickersWidth0005
     * @tc.desc Verify breakpoint helpers at width 599vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersWidth0005', 0, async (done: Function) => {
      await runCase('testPickersWidth0005', async () => {
        expect(BreakpointUtils.resolve(599)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(599)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(599)).assertEqual(16);
        expect(BreakpointUtils.columnCount(599)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(599)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(599)).assertFalse();
        expect(BreakpointUtils.describe(599)).assertEqual('width=599vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_WIDTH_0600
     * @tc.name testPickersWidth0006
     * @tc.desc Verify breakpoint helpers at width 600vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersWidth0006', 0, async (done: Function) => {
      await runCase('testPickersWidth0006', async () => {
        expect(BreakpointUtils.resolve(600)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(600)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(600)).assertEqual(16);
        expect(BreakpointUtils.columnCount(600)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(600)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(600)).assertFalse();
        expect(BreakpointUtils.describe(600)).assertEqual('width=600vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_WIDTH_0700
     * @tc.name testPickersWidth0007
     * @tc.desc Verify breakpoint helpers at width 601vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersWidth0007', 0, async (done: Function) => {
      await runCase('testPickersWidth0007', async () => {
        expect(BreakpointUtils.resolve(601)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.contentMaxWidth(601)).assertEqual(720);
        expect(BreakpointUtils.pagePadding(601)).assertEqual(24);
        expect(BreakpointUtils.columnCount(601)).assertEqual(2);
        expect(BreakpointUtils.gridTemplate(601)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.isWide(601)).assertTrue();
        expect(BreakpointUtils.describe(601)).assertEqual('width=601vp, breakpoint=md');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_WIDTH_0800
     * @tc.name testPickersWidth0008
     * @tc.desc Verify breakpoint helpers at width 700vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersWidth0008', 0, async (done: Function) => {
      await runCase('testPickersWidth0008', async () => {
        expect(BreakpointUtils.resolve(700)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.contentMaxWidth(700)).assertEqual(720);
        expect(BreakpointUtils.pagePadding(700)).assertEqual(24);
        expect(BreakpointUtils.columnCount(700)).assertEqual(2);
        expect(BreakpointUtils.gridTemplate(700)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.isWide(700)).assertTrue();
        expect(BreakpointUtils.describe(700)).assertEqual('width=700vp, breakpoint=md');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_WIDTH_0900
     * @tc.name testPickersWidth0009
     * @tc.desc Verify breakpoint helpers at width 839vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersWidth0009', 0, async (done: Function) => {
      await runCase('testPickersWidth0009', async () => {
        expect(BreakpointUtils.resolve(839)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.contentMaxWidth(839)).assertEqual(720);
        expect(BreakpointUtils.pagePadding(839)).assertEqual(24);
        expect(BreakpointUtils.columnCount(839)).assertEqual(2);
        expect(BreakpointUtils.gridTemplate(839)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.isWide(839)).assertTrue();
        expect(BreakpointUtils.describe(839)).assertEqual('width=839vp, breakpoint=md');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_WIDTH_1000
     * @tc.name testPickersWidth0010
     * @tc.desc Verify breakpoint helpers at width 840vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersWidth0010', 0, async (done: Function) => {
      await runCase('testPickersWidth0010', async () => {
        expect(BreakpointUtils.resolve(840)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.contentMaxWidth(840)).assertEqual(720);
        expect(BreakpointUtils.pagePadding(840)).assertEqual(24);
        expect(BreakpointUtils.columnCount(840)).assertEqual(2);
        expect(BreakpointUtils.gridTemplate(840)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.isWide(840)).assertTrue();
        expect(BreakpointUtils.describe(840)).assertEqual('width=840vp, breakpoint=md');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_WIDTH_1100
     * @tc.name testPickersWidth0011
     * @tc.desc Verify breakpoint helpers at width 841vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersWidth0011', 0, async (done: Function) => {
      await runCase('testPickersWidth0011', async () => {
        expect(BreakpointUtils.resolve(841)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(841)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(841)).assertEqual(32);
        expect(BreakpointUtils.columnCount(841)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(841)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(841)).assertTrue();
        expect(BreakpointUtils.describe(841)).assertEqual('width=841vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_WIDTH_1200
     * @tc.name testPickersWidth0012
     * @tc.desc Verify breakpoint helpers at width 900vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersWidth0012', 0, async (done: Function) => {
      await runCase('testPickersWidth0012', async () => {
        expect(BreakpointUtils.resolve(900)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(900)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(900)).assertEqual(32);
        expect(BreakpointUtils.columnCount(900)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(900)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(900)).assertTrue();
        expect(BreakpointUtils.describe(900)).assertEqual('width=900vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_WIDTH_1300
     * @tc.name testPickersWidth0013
     * @tc.desc Verify breakpoint helpers at width 1000vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersWidth0013', 0, async (done: Function) => {
      await runCase('testPickersWidth0013', async () => {
        expect(BreakpointUtils.resolve(1000)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(1000)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(1000)).assertEqual(32);
        expect(BreakpointUtils.columnCount(1000)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(1000)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(1000)).assertTrue();
        expect(BreakpointUtils.describe(1000)).assertEqual('width=1000vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_WIDTH_1400
     * @tc.name testPickersWidth0014
     * @tc.desc Verify breakpoint helpers at width 1200vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersWidth0014', 0, async (done: Function) => {
      await runCase('testPickersWidth0014', async () => {
        expect(BreakpointUtils.resolve(1200)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(1200)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(1200)).assertEqual(32);
        expect(BreakpointUtils.columnCount(1200)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(1200)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(1200)).assertTrue();
        expect(BreakpointUtils.describe(1200)).assertEqual('width=1200vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_WIDTH_1500
     * @tc.name testPickersWidth0015
     * @tc.desc Verify breakpoint helpers at width 1440vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersWidth0015', 0, async (done: Function) => {
      await runCase('testPickersWidth0015', async () => {
        expect(BreakpointUtils.resolve(1440)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(1440)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(1440)).assertEqual(32);
        expect(BreakpointUtils.columnCount(1440)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(1440)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(1440)).assertTrue();
        expect(BreakpointUtils.describe(1440)).assertEqual('width=1440vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_WIDTH_1600
     * @tc.name testPickersWidth0016
     * @tc.desc Verify breakpoint helpers at width 1920vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersWidth0016', 0, async (done: Function) => {
      await runCase('testPickersWidth0016', async () => {
        expect(BreakpointUtils.resolve(1920)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(1920)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(1920)).assertEqual(32);
        expect(BreakpointUtils.columnCount(1920)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(1920)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(1920)).assertTrue();
        expect(BreakpointUtils.describe(1920)).assertEqual('width=1920vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_WIDTH_1700
     * @tc.name testPickersWidth0017
     * @tc.desc Verify breakpoint helpers at width 2000vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersWidth0017', 0, async (done: Function) => {
      await runCase('testPickersWidth0017', async () => {
        expect(BreakpointUtils.resolve(2000)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(2000)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(2000)).assertEqual(32);
        expect(BreakpointUtils.columnCount(2000)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(2000)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(2000)).assertTrue();
        expect(BreakpointUtils.describe(2000)).assertEqual('width=2000vp, breakpoint=lg');
      }, done);
    });


    /**
     * @tc.number SUB_PICKERS_REAL_0100
     * @tc.name testPickersRealDateBack0001
     * @tc.desc Verify page opens and returns through its back button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersRealDateBack0001', 0, async (done: Function) => {
      await runCase('testPickersRealDateBack0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardDatePicker');
        await waitId('dateTitle');
        await clickId('dateBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_REAL_0200
     * @tc.name testPickersRealUiBack0002
     * @tc.desc Verify page opens and returns through its back button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersRealUiBack0002', 0, async (done: Function) => {
      await runCase('testPickersRealUiBack0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardUIPicker');
        await waitId('uiTitle');
        await clickId('uiBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_REAL_0300
     * @tc.name testPickersRealCalendarBack0003
     * @tc.desc Verify page opens and returns through its back button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersRealCalendarBack0003', 0, async (done: Function) => {
      await runCase('testPickersRealCalendarBack0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardCalendar');
        await waitId('calendarTitle');
        await clickId('calendarBack');
        await waitId('pageTitle');
      }, done);
    });


    /**
     * @tc.number SUB_PICKERS_SCENE_0100
     * @tc.name testPickersSceneModeCycle0001
     * @tc.desc Verify date, time, and date-time modes can be cycled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersSceneModeCycle0001', 0, async (done: Function) => {
      await runCase('testPickersSceneModeCycle0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardDatePicker');
        await clickId('dateModeTime');
        await waitId('timePicker');
        await clickId('dateModeDateTime');
        await waitId('dateTimePicker');
        await clickId('dateModeDate');
        await waitId('datePicker');
        await clickId('dateBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_SCENE_0200
     * @tc.name testPickersSceneUiLoopOff0002
     * @tc.desc Verify UIPicker next and previous stay inside bounds without looping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersSceneUiLoopOff0002', 0, async (done: Function) => {
      await runCase('testPickersSceneUiLoopOff0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardUIPicker');
        await clickId('uiLoopToggle');
        for (let i = 0; i < 5; i++) {
          await clickId('uiNext');
        }
        expect(await textOfId('uiSelected')).assertContain('Review');
        await clickId('uiNext');
        expect(await textOfId('uiSelected')).assertContain('Review');
        await clickId('uiPrevious');
        expect(await textOfId('uiSelected')).assertContain('Done');
        await clickId('uiBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_SCENE_0300
     * @tc.name testPickersSceneCalendarToday0003
     * @tc.desc Verify calendar today selection and page back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersSceneCalendarToday0003', 0, async (done: Function) => {
      await runCase('testPickersSceneCalendarToday0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardCalendar');
        await clickId('calendarToday');
        expect(await textOfId('calendarEvent')).assertContain('today');
        expect(await textOfId('calendarSelected')).assertContain(`${new Date().getFullYear()}`);
        await clickId('calendarBack');
        await waitId('pageTitle');
      }, done);
    });

  });
}
