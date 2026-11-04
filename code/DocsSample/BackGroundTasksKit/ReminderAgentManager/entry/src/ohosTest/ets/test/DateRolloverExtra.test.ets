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

export default function dateRolloverExtraTest(): void {
  describe('ReminderDateRolloverExtraTest', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_TESTREMINDERDATEROLLOVEREXTRA_0100
     * @tc.name      testReminderDateRolloverExtra0001
     * @tc.desc      Verify day 15 from month 1 to month 2 spans 30 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateRolloverExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 2, 15, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 2592000 - 2).assertTrue();
          expect(diff <= 2592000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_TESTREMINDERDATEROLLOVEREXTRA_0200
     * @tc.name      testReminderDateRolloverExtra0002
     * @tc.desc      Verify day 15 from month 2 to month 3 spans 30 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateRolloverExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 2, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 3, 15, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 2592000 - 2).assertTrue();
          expect(diff <= 2592000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_TESTREMINDERDATEROLLOVEREXTRA_0300
     * @tc.name      testReminderDateRolloverExtra0003
     * @tc.desc      Verify day 15 from month 3 to month 4 spans 30 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateRolloverExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 3, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 4, 15, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 2592000 - 2).assertTrue();
          expect(diff <= 2592000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_TESTREMINDERDATEROLLOVEREXTRA_0400
     * @tc.name      testReminderDateRolloverExtra0004
     * @tc.desc      Verify day 15 from month 4 to month 5 spans 30 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateRolloverExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 4, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 5, 15, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 2592000 - 2).assertTrue();
          expect(diff <= 2592000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_TESTREMINDERDATEROLLOVEREXTRA_0500
     * @tc.name      testReminderDateRolloverExtra0005
     * @tc.desc      Verify day 15 from month 5 to month 6 spans 30 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateRolloverExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 5, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 6, 15, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 2592000 - 2).assertTrue();
          expect(diff <= 2592000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_TESTREMINDERDATEROLLOVEREXTRA_0600
     * @tc.name      testReminderDateRolloverExtra0006
     * @tc.desc      Verify day 15 from month 6 to month 7 spans 30 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateRolloverExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 6, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 7, 15, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 2592000 - 2).assertTrue();
          expect(diff <= 2592000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_TESTREMINDERDATEROLLOVEREXTRA_0700
     * @tc.name      testReminderDateRolloverExtra0007
     * @tc.desc      Verify day 15 from month 7 to month 8 spans 30 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateRolloverExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 7, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 8, 15, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 2592000 - 2).assertTrue();
          expect(diff <= 2592000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_TESTREMINDERDATEROLLOVEREXTRA_0800
     * @tc.name      testReminderDateRolloverExtra0008
     * @tc.desc      Verify day 15 from month 8 to month 9 spans 30 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateRolloverExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 8, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 9, 15, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 2592000 - 2).assertTrue();
          expect(diff <= 2592000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_TESTREMINDERDATEROLLOVEREXTRA_0900
     * @tc.name      testReminderDateRolloverExtra0009
     * @tc.desc      Verify day 15 from month 9 to month 10 spans 30 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateRolloverExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 9, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 10, 15, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 2592000 - 2).assertTrue();
          expect(diff <= 2592000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_TESTREMINDERDATEROLLOVEREXTRA_1000
     * @tc.name      testReminderDateRolloverExtra0010
     * @tc.desc      Verify day 15 from month 10 to month 11 spans 30 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateRolloverExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 10, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 11, 15, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 2592000 - 2).assertTrue();
          expect(diff <= 2592000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_TESTREMINDERDATEROLLOVEREXTRA_1100
     * @tc.name      testReminderDateRolloverExtra0011
     * @tc.desc      Verify day 15 from month 11 to month 12 spans 30 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateRolloverExtra0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 11, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 12, 15, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 2592000 - 2).assertTrue();
          expect(diff <= 2592000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_TESTREMINDERDATEROLLOVEREXTRA_1200
     * @tc.name      testReminderDateRolloverExtra0012
     * @tc.desc      Verify one year from 2023 to 2024 spans 365 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateRolloverExtra0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 6, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 6, 15, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 31536000 - 2).assertTrue();
          expect(diff <= 31536000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_TESTREMINDERDATEROLLOVEREXTRA_1300
     * @tc.name      testReminderDateRolloverExtra0013
     * @tc.desc      Verify one year from 1999 to 2000 spans 365 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateRolloverExtra0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(1999, 6, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2000, 6, 15, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 31536000 - 2).assertTrue();
          expect(diff <= 31536000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_TESTREMINDERDATEROLLOVEREXTRA_1400
     * @tc.name      testReminderDateRolloverExtra0014
     * @tc.desc      Verify one year from 2099 to 2100 spans 365 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateRolloverExtra0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2099, 6, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2100, 6, 15, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 31536000 - 2).assertTrue();
          expect(diff <= 31536000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_TESTREMINDERDATEROLLOVEREXTRA_1500
     * @tc.name      testReminderDateRolloverExtra0015
     * @tc.desc      Verify thirty years from 1970 to 2000 spans 10950 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateRolloverExtra0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(1970, 6, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2000, 6, 15, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 946080000 - 2).assertTrue();
          expect(diff <= 946080000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

  });
}
