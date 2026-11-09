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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import TimeConversion from '../../../main/ets/util/TimeConversion';
import { installCaseIsolation } from './TestRuntime';

export default function dateMatrixExtraTest(): void {
  describe('ReminderDateMatrixExtraTest', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_0100
     * @tc.name      testReminderDateMatrixExtra0001
     * @tc.desc      Verify month 01 day 01 to day 03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 1, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_0200
     * @tc.name      testReminderDateMatrixExtra0002
     * @tc.desc      Verify month 01 day 01 to day 04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 1, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_0300
     * @tc.name      testReminderDateMatrixExtra0003
     * @tc.desc      Verify month 01 day 01 to day 05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 1, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_0400
     * @tc.name      testReminderDateMatrixExtra0004
     * @tc.desc      Verify month 01 day 01 to day 06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 1, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_0500
     * @tc.name      testReminderDateMatrixExtra0005
     * @tc.desc      Verify month 01 day 01 to day 07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 1, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_0600
     * @tc.name      testReminderDateMatrixExtra0006
     * @tc.desc      Verify month 01 day 01 to day 08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 1, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_0700
     * @tc.name      testReminderDateMatrixExtra0007
     * @tc.desc      Verify month 01 day 01 to day 09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 1, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_0800
     * @tc.name      testReminderDateMatrixExtra0008
     * @tc.desc      Verify month 02 day 01 to day 03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 2, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_0900
     * @tc.name      testReminderDateMatrixExtra0009
     * @tc.desc      Verify month 02 day 01 to day 04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 2, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_1000
     * @tc.name      testReminderDateMatrixExtra0010
     * @tc.desc      Verify month 02 day 01 to day 05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 2, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_1100
     * @tc.name      testReminderDateMatrixExtra0011
     * @tc.desc      Verify month 02 day 01 to day 06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 2, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_1200
     * @tc.name      testReminderDateMatrixExtra0012
     * @tc.desc      Verify month 02 day 01 to day 07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 2, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_1300
     * @tc.name      testReminderDateMatrixExtra0013
     * @tc.desc      Verify month 02 day 01 to day 08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 2, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_1400
     * @tc.name      testReminderDateMatrixExtra0014
     * @tc.desc      Verify month 02 day 01 to day 09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 2, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_1500
     * @tc.name      testReminderDateMatrixExtra0015
     * @tc.desc      Verify month 03 day 01 to day 03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 3, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_1600
     * @tc.name      testReminderDateMatrixExtra0016
     * @tc.desc      Verify month 03 day 01 to day 04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 3, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_1700
     * @tc.name      testReminderDateMatrixExtra0017
     * @tc.desc      Verify month 03 day 01 to day 05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 3, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_1800
     * @tc.name      testReminderDateMatrixExtra0018
     * @tc.desc      Verify month 03 day 01 to day 06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 3, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_1900
     * @tc.name      testReminderDateMatrixExtra0019
     * @tc.desc      Verify month 03 day 01 to day 07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 3, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_2000
     * @tc.name      testReminderDateMatrixExtra0020
     * @tc.desc      Verify month 03 day 01 to day 08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 3, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_2100
     * @tc.name      testReminderDateMatrixExtra0021
     * @tc.desc      Verify month 03 day 01 to day 09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 3, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_2200
     * @tc.name      testReminderDateMatrixExtra0022
     * @tc.desc      Verify month 04 day 01 to day 03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 4, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_2300
     * @tc.name      testReminderDateMatrixExtra0023
     * @tc.desc      Verify month 04 day 01 to day 04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 4, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_2400
     * @tc.name      testReminderDateMatrixExtra0024
     * @tc.desc      Verify month 04 day 01 to day 05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 4, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_2500
     * @tc.name      testReminderDateMatrixExtra0025
     * @tc.desc      Verify month 04 day 01 to day 06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 4, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_2600
     * @tc.name      testReminderDateMatrixExtra0026
     * @tc.desc      Verify month 04 day 01 to day 07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 4, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_2700
     * @tc.name      testReminderDateMatrixExtra0027
     * @tc.desc      Verify month 04 day 01 to day 08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 4, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_2800
     * @tc.name      testReminderDateMatrixExtra0028
     * @tc.desc      Verify month 04 day 01 to day 09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 4, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_2900
     * @tc.name      testReminderDateMatrixExtra0029
     * @tc.desc      Verify month 05 day 01 to day 03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 5, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_3000
     * @tc.name      testReminderDateMatrixExtra0030
     * @tc.desc      Verify month 05 day 01 to day 04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 5, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_3100
     * @tc.name      testReminderDateMatrixExtra0031
     * @tc.desc      Verify month 05 day 01 to day 05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 5, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_3200
     * @tc.name      testReminderDateMatrixExtra0032
     * @tc.desc      Verify month 05 day 01 to day 06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 5, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_3300
     * @tc.name      testReminderDateMatrixExtra0033
     * @tc.desc      Verify month 05 day 01 to day 07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 5, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_3400
     * @tc.name      testReminderDateMatrixExtra0034
     * @tc.desc      Verify month 05 day 01 to day 08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 5, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_3500
     * @tc.name      testReminderDateMatrixExtra0035
     * @tc.desc      Verify month 05 day 01 to day 09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 5, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_3600
     * @tc.name      testReminderDateMatrixExtra0036
     * @tc.desc      Verify month 06 day 01 to day 03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 6, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_3700
     * @tc.name      testReminderDateMatrixExtra0037
     * @tc.desc      Verify month 06 day 01 to day 04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 6, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_3800
     * @tc.name      testReminderDateMatrixExtra0038
     * @tc.desc      Verify month 06 day 01 to day 05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 6, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_3900
     * @tc.name      testReminderDateMatrixExtra0039
     * @tc.desc      Verify month 06 day 01 to day 06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 6, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_4000
     * @tc.name      testReminderDateMatrixExtra0040
     * @tc.desc      Verify month 06 day 01 to day 07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 6, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_4100
     * @tc.name      testReminderDateMatrixExtra0041
     * @tc.desc      Verify month 06 day 01 to day 08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 6, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_4200
     * @tc.name      testReminderDateMatrixExtra0042
     * @tc.desc      Verify month 06 day 01 to day 09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 6, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_4300
     * @tc.name      testReminderDateMatrixExtra0043
     * @tc.desc      Verify month 07 day 01 to day 03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 7, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_4400
     * @tc.name      testReminderDateMatrixExtra0044
     * @tc.desc      Verify month 07 day 01 to day 04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 7, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_4500
     * @tc.name      testReminderDateMatrixExtra0045
     * @tc.desc      Verify month 07 day 01 to day 05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 7, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_4600
     * @tc.name      testReminderDateMatrixExtra0046
     * @tc.desc      Verify month 07 day 01 to day 06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 7, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_4700
     * @tc.name      testReminderDateMatrixExtra0047
     * @tc.desc      Verify month 07 day 01 to day 07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 7, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_4800
     * @tc.name      testReminderDateMatrixExtra0048
     * @tc.desc      Verify month 07 day 01 to day 08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 7, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_4900
     * @tc.name      testReminderDateMatrixExtra0049
     * @tc.desc      Verify month 07 day 01 to day 09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 7, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_5000
     * @tc.name      testReminderDateMatrixExtra0050
     * @tc.desc      Verify month 08 day 01 to day 03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 8, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_5100
     * @tc.name      testReminderDateMatrixExtra0051
     * @tc.desc      Verify month 08 day 01 to day 04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 8, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_5200
     * @tc.name      testReminderDateMatrixExtra0052
     * @tc.desc      Verify month 08 day 01 to day 05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 8, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_5300
     * @tc.name      testReminderDateMatrixExtra0053
     * @tc.desc      Verify month 08 day 01 to day 06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 8, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_5400
     * @tc.name      testReminderDateMatrixExtra0054
     * @tc.desc      Verify month 08 day 01 to day 07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 8, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_5500
     * @tc.name      testReminderDateMatrixExtra0055
     * @tc.desc      Verify month 08 day 01 to day 08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 8, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_5600
     * @tc.name      testReminderDateMatrixExtra0056
     * @tc.desc      Verify month 08 day 01 to day 09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 8, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_5700
     * @tc.name      testReminderDateMatrixExtra0057
     * @tc.desc      Verify month 09 day 01 to day 03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 9, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_5800
     * @tc.name      testReminderDateMatrixExtra0058
     * @tc.desc      Verify month 09 day 01 to day 04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 9, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_5900
     * @tc.name      testReminderDateMatrixExtra0059
     * @tc.desc      Verify month 09 day 01 to day 05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 9, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_6000
     * @tc.name      testReminderDateMatrixExtra0060
     * @tc.desc      Verify month 09 day 01 to day 06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 9, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_6100
     * @tc.name      testReminderDateMatrixExtra0061
     * @tc.desc      Verify month 09 day 01 to day 07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 9, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_6200
     * @tc.name      testReminderDateMatrixExtra0062
     * @tc.desc      Verify month 09 day 01 to day 08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 9, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_6300
     * @tc.name      testReminderDateMatrixExtra0063
     * @tc.desc      Verify month 09 day 01 to day 09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 9, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_6400
     * @tc.name      testReminderDateMatrixExtra0064
     * @tc.desc      Verify month 10 day 01 to day 03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 10, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_6500
     * @tc.name      testReminderDateMatrixExtra0065
     * @tc.desc      Verify month 10 day 01 to day 04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 10, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_6600
     * @tc.name      testReminderDateMatrixExtra0066
     * @tc.desc      Verify month 10 day 01 to day 05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 10, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_6700
     * @tc.name      testReminderDateMatrixExtra0067
     * @tc.desc      Verify month 10 day 01 to day 06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 10, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_6800
     * @tc.name      testReminderDateMatrixExtra0068
     * @tc.desc      Verify month 10 day 01 to day 07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 10, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_6900
     * @tc.name      testReminderDateMatrixExtra0069
     * @tc.desc      Verify month 10 day 01 to day 08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 10, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_7000
     * @tc.name      testReminderDateMatrixExtra0070
     * @tc.desc      Verify month 10 day 01 to day 09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 10, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_7100
     * @tc.name      testReminderDateMatrixExtra0071
     * @tc.desc      Verify month 11 day 01 to day 03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 11, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_7200
     * @tc.name      testReminderDateMatrixExtra0072
     * @tc.desc      Verify month 11 day 01 to day 04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 11, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_7300
     * @tc.name      testReminderDateMatrixExtra0073
     * @tc.desc      Verify month 11 day 01 to day 05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 11, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_7400
     * @tc.name      testReminderDateMatrixExtra0074
     * @tc.desc      Verify month 11 day 01 to day 06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 11, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_7500
     * @tc.name      testReminderDateMatrixExtra0075
     * @tc.desc      Verify month 11 day 01 to day 07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 11, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_7600
     * @tc.name      testReminderDateMatrixExtra0076
     * @tc.desc      Verify month 11 day 01 to day 08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 11, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_7700
     * @tc.name      testReminderDateMatrixExtra0077
     * @tc.desc      Verify month 11 day 01 to day 09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 11, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_7800
     * @tc.name      testReminderDateMatrixExtra0078
     * @tc.desc      Verify month 12 day 01 to day 03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 12, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_7900
     * @tc.name      testReminderDateMatrixExtra0079
     * @tc.desc      Verify month 12 day 01 to day 04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 12, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_8000
     * @tc.name      testReminderDateMatrixExtra0080
     * @tc.desc      Verify month 12 day 01 to day 05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 12, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_8100
     * @tc.name      testReminderDateMatrixExtra0081
     * @tc.desc      Verify month 12 day 01 to day 06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 12, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_8200
     * @tc.name      testReminderDateMatrixExtra0082
     * @tc.desc      Verify month 12 day 01 to day 07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 12, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_8300
     * @tc.name      testReminderDateMatrixExtra0083
     * @tc.desc      Verify month 12 day 01 to day 08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 12, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_8400
     * @tc.name      testReminderDateMatrixExtra0084
     * @tc.desc      Verify month 12 day 01 to day 09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 12, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX_EXTRA_8500
     * @tc.name      testReminderDateMatrixExtra0085
     * @tc.desc      Verify month 02 day 01 to day 10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrixExtra0085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 2, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });  });
}
