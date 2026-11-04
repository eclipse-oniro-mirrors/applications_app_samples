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

export default function dateMatrix200Test(): void {
  describe('ReminderDateMatrix200Test', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_0100
     * @tc.name      testReminderDateMatrix2000001
     * @tc.desc      Verify 2022-01-01 to 2022-01-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 1, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_0200
     * @tc.name      testReminderDateMatrix2000002
     * @tc.desc      Verify 2022-01-01 to 2022-01-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 1, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_0300
     * @tc.name      testReminderDateMatrix2000003
     * @tc.desc      Verify 2022-01-01 to 2022-01-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 1, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_0400
     * @tc.name      testReminderDateMatrix2000004
     * @tc.desc      Verify 2022-01-01 to 2022-01-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 1, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_0500
     * @tc.name      testReminderDateMatrix2000005
     * @tc.desc      Verify 2022-01-01 to 2022-01-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 1, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_0600
     * @tc.name      testReminderDateMatrix2000006
     * @tc.desc      Verify 2022-01-01 to 2022-01-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 1, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_0700
     * @tc.name      testReminderDateMatrix2000007
     * @tc.desc      Verify 2022-01-01 to 2022-01-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 1, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_0800
     * @tc.name      testReminderDateMatrix2000008
     * @tc.desc      Verify 2022-01-01 to 2022-01-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 1, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_0900
     * @tc.name      testReminderDateMatrix2000009
     * @tc.desc      Verify 2022-02-01 to 2022-02-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 2, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_1000
     * @tc.name      testReminderDateMatrix2000010
     * @tc.desc      Verify 2022-02-01 to 2022-02-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 2, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_1100
     * @tc.name      testReminderDateMatrix2000011
     * @tc.desc      Verify 2022-02-01 to 2022-02-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 2, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_1200
     * @tc.name      testReminderDateMatrix2000012
     * @tc.desc      Verify 2022-02-01 to 2022-02-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 2, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_1300
     * @tc.name      testReminderDateMatrix2000013
     * @tc.desc      Verify 2022-02-01 to 2022-02-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 2, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_1400
     * @tc.name      testReminderDateMatrix2000014
     * @tc.desc      Verify 2022-02-01 to 2022-02-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 2, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_1500
     * @tc.name      testReminderDateMatrix2000015
     * @tc.desc      Verify 2022-02-01 to 2022-02-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 2, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_1600
     * @tc.name      testReminderDateMatrix2000016
     * @tc.desc      Verify 2022-02-01 to 2022-02-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 2, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_1700
     * @tc.name      testReminderDateMatrix2000017
     * @tc.desc      Verify 2022-03-01 to 2022-03-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 3, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_1800
     * @tc.name      testReminderDateMatrix2000018
     * @tc.desc      Verify 2022-03-01 to 2022-03-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 3, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_1900
     * @tc.name      testReminderDateMatrix2000019
     * @tc.desc      Verify 2022-03-01 to 2022-03-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 3, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_2000
     * @tc.name      testReminderDateMatrix2000020
     * @tc.desc      Verify 2022-03-01 to 2022-03-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 3, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_2100
     * @tc.name      testReminderDateMatrix2000021
     * @tc.desc      Verify 2022-03-01 to 2022-03-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 3, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_2200
     * @tc.name      testReminderDateMatrix2000022
     * @tc.desc      Verify 2022-03-01 to 2022-03-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 3, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_2300
     * @tc.name      testReminderDateMatrix2000023
     * @tc.desc      Verify 2022-03-01 to 2022-03-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 3, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_2400
     * @tc.name      testReminderDateMatrix2000024
     * @tc.desc      Verify 2022-03-01 to 2022-03-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 3, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_2500
     * @tc.name      testReminderDateMatrix2000025
     * @tc.desc      Verify 2022-04-01 to 2022-04-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 4, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_2600
     * @tc.name      testReminderDateMatrix2000026
     * @tc.desc      Verify 2022-04-01 to 2022-04-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 4, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_2700
     * @tc.name      testReminderDateMatrix2000027
     * @tc.desc      Verify 2022-04-01 to 2022-04-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 4, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_2800
     * @tc.name      testReminderDateMatrix2000028
     * @tc.desc      Verify 2022-04-01 to 2022-04-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 4, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_2900
     * @tc.name      testReminderDateMatrix2000029
     * @tc.desc      Verify 2022-04-01 to 2022-04-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 4, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_3000
     * @tc.name      testReminderDateMatrix2000030
     * @tc.desc      Verify 2022-04-01 to 2022-04-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 4, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_3100
     * @tc.name      testReminderDateMatrix2000031
     * @tc.desc      Verify 2022-04-01 to 2022-04-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 4, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_3200
     * @tc.name      testReminderDateMatrix2000032
     * @tc.desc      Verify 2022-04-01 to 2022-04-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 4, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_3300
     * @tc.name      testReminderDateMatrix2000033
     * @tc.desc      Verify 2022-05-01 to 2022-05-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 5, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_3400
     * @tc.name      testReminderDateMatrix2000034
     * @tc.desc      Verify 2022-05-01 to 2022-05-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 5, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_3500
     * @tc.name      testReminderDateMatrix2000035
     * @tc.desc      Verify 2022-05-01 to 2022-05-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 5, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_3600
     * @tc.name      testReminderDateMatrix2000036
     * @tc.desc      Verify 2022-05-01 to 2022-05-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 5, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_3700
     * @tc.name      testReminderDateMatrix2000037
     * @tc.desc      Verify 2022-05-01 to 2022-05-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 5, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_3800
     * @tc.name      testReminderDateMatrix2000038
     * @tc.desc      Verify 2022-05-01 to 2022-05-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 5, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_3900
     * @tc.name      testReminderDateMatrix2000039
     * @tc.desc      Verify 2022-05-01 to 2022-05-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 5, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_4000
     * @tc.name      testReminderDateMatrix2000040
     * @tc.desc      Verify 2022-05-01 to 2022-05-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 5, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_4100
     * @tc.name      testReminderDateMatrix2000041
     * @tc.desc      Verify 2022-06-01 to 2022-06-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 6, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_4200
     * @tc.name      testReminderDateMatrix2000042
     * @tc.desc      Verify 2022-06-01 to 2022-06-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 6, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_4300
     * @tc.name      testReminderDateMatrix2000043
     * @tc.desc      Verify 2022-06-01 to 2022-06-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 6, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_4400
     * @tc.name      testReminderDateMatrix2000044
     * @tc.desc      Verify 2022-06-01 to 2022-06-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 6, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_4500
     * @tc.name      testReminderDateMatrix2000045
     * @tc.desc      Verify 2022-06-01 to 2022-06-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 6, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_4600
     * @tc.name      testReminderDateMatrix2000046
     * @tc.desc      Verify 2022-06-01 to 2022-06-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 6, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_4700
     * @tc.name      testReminderDateMatrix2000047
     * @tc.desc      Verify 2022-06-01 to 2022-06-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 6, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_4800
     * @tc.name      testReminderDateMatrix2000048
     * @tc.desc      Verify 2022-06-01 to 2022-06-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 6, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_4900
     * @tc.name      testReminderDateMatrix2000049
     * @tc.desc      Verify 2022-07-01 to 2022-07-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 7, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_5000
     * @tc.name      testReminderDateMatrix2000050
     * @tc.desc      Verify 2022-07-01 to 2022-07-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 7, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_5100
     * @tc.name      testReminderDateMatrix2000051
     * @tc.desc      Verify 2022-07-01 to 2022-07-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 7, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_5200
     * @tc.name      testReminderDateMatrix2000052
     * @tc.desc      Verify 2022-07-01 to 2022-07-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 7, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_5300
     * @tc.name      testReminderDateMatrix2000053
     * @tc.desc      Verify 2022-07-01 to 2022-07-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 7, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_5400
     * @tc.name      testReminderDateMatrix2000054
     * @tc.desc      Verify 2022-07-01 to 2022-07-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 7, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_5500
     * @tc.name      testReminderDateMatrix2000055
     * @tc.desc      Verify 2022-07-01 to 2022-07-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 7, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_5600
     * @tc.name      testReminderDateMatrix2000056
     * @tc.desc      Verify 2022-07-01 to 2022-07-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 7, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_5700
     * @tc.name      testReminderDateMatrix2000057
     * @tc.desc      Verify 2022-08-01 to 2022-08-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 8, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_5800
     * @tc.name      testReminderDateMatrix2000058
     * @tc.desc      Verify 2022-08-01 to 2022-08-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 8, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_5900
     * @tc.name      testReminderDateMatrix2000059
     * @tc.desc      Verify 2022-08-01 to 2022-08-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 8, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_6000
     * @tc.name      testReminderDateMatrix2000060
     * @tc.desc      Verify 2022-08-01 to 2022-08-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 8, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_6100
     * @tc.name      testReminderDateMatrix2000061
     * @tc.desc      Verify 2022-08-01 to 2022-08-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 8, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_6200
     * @tc.name      testReminderDateMatrix2000062
     * @tc.desc      Verify 2022-08-01 to 2022-08-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 8, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_6300
     * @tc.name      testReminderDateMatrix2000063
     * @tc.desc      Verify 2022-08-01 to 2022-08-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 8, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_6400
     * @tc.name      testReminderDateMatrix2000064
     * @tc.desc      Verify 2022-08-01 to 2022-08-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 8, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_6500
     * @tc.name      testReminderDateMatrix2000065
     * @tc.desc      Verify 2022-09-01 to 2022-09-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 9, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_6600
     * @tc.name      testReminderDateMatrix2000066
     * @tc.desc      Verify 2022-09-01 to 2022-09-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 9, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_6700
     * @tc.name      testReminderDateMatrix2000067
     * @tc.desc      Verify 2022-09-01 to 2022-09-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 9, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_6800
     * @tc.name      testReminderDateMatrix2000068
     * @tc.desc      Verify 2022-09-01 to 2022-09-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 9, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_6900
     * @tc.name      testReminderDateMatrix2000069
     * @tc.desc      Verify 2022-09-01 to 2022-09-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 9, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_7000
     * @tc.name      testReminderDateMatrix2000070
     * @tc.desc      Verify 2022-09-01 to 2022-09-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 9, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_7100
     * @tc.name      testReminderDateMatrix2000071
     * @tc.desc      Verify 2022-09-01 to 2022-09-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 9, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_7200
     * @tc.name      testReminderDateMatrix2000072
     * @tc.desc      Verify 2022-09-01 to 2022-09-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 9, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_7300
     * @tc.name      testReminderDateMatrix2000073
     * @tc.desc      Verify 2022-10-01 to 2022-10-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 10, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_7400
     * @tc.name      testReminderDateMatrix2000074
     * @tc.desc      Verify 2022-10-01 to 2022-10-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 10, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_7500
     * @tc.name      testReminderDateMatrix2000075
     * @tc.desc      Verify 2022-10-01 to 2022-10-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 10, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_7600
     * @tc.name      testReminderDateMatrix2000076
     * @tc.desc      Verify 2022-10-01 to 2022-10-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 10, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_7700
     * @tc.name      testReminderDateMatrix2000077
     * @tc.desc      Verify 2022-10-01 to 2022-10-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 10, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_7800
     * @tc.name      testReminderDateMatrix2000078
     * @tc.desc      Verify 2022-10-01 to 2022-10-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 10, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_7900
     * @tc.name      testReminderDateMatrix2000079
     * @tc.desc      Verify 2022-10-01 to 2022-10-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 10, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_8000
     * @tc.name      testReminderDateMatrix2000080
     * @tc.desc      Verify 2022-10-01 to 2022-10-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 10, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_8100
     * @tc.name      testReminderDateMatrix2000081
     * @tc.desc      Verify 2022-11-01 to 2022-11-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 11, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_8200
     * @tc.name      testReminderDateMatrix2000082
     * @tc.desc      Verify 2022-11-01 to 2022-11-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 11, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_8300
     * @tc.name      testReminderDateMatrix2000083
     * @tc.desc      Verify 2022-11-01 to 2022-11-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 11, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_8400
     * @tc.name      testReminderDateMatrix2000084
     * @tc.desc      Verify 2022-11-01 to 2022-11-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 11, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_8500
     * @tc.name      testReminderDateMatrix2000085
     * @tc.desc      Verify 2022-11-01 to 2022-11-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 11, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_8600
     * @tc.name      testReminderDateMatrix2000086
     * @tc.desc      Verify 2022-11-01 to 2022-11-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 11, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_8700
     * @tc.name      testReminderDateMatrix2000087
     * @tc.desc      Verify 2022-11-01 to 2022-11-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000087',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 11, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_8800
     * @tc.name      testReminderDateMatrix2000088
     * @tc.desc      Verify 2022-11-01 to 2022-11-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000088',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 11, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_8900
     * @tc.name      testReminderDateMatrix2000089
     * @tc.desc      Verify 2022-12-01 to 2022-12-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000089',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 12, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_9000
     * @tc.name      testReminderDateMatrix2000090
     * @tc.desc      Verify 2022-12-01 to 2022-12-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 12, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_9100
     * @tc.name      testReminderDateMatrix2000091
     * @tc.desc      Verify 2022-12-01 to 2022-12-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000091',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 12, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_9200
     * @tc.name      testReminderDateMatrix2000092
     * @tc.desc      Verify 2022-12-01 to 2022-12-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000092',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 12, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_9300
     * @tc.name      testReminderDateMatrix2000093
     * @tc.desc      Verify 2022-12-01 to 2022-12-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000093',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 12, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_9400
     * @tc.name      testReminderDateMatrix2000094
     * @tc.desc      Verify 2022-12-01 to 2022-12-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000094',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 12, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_9500
     * @tc.name      testReminderDateMatrix2000095
     * @tc.desc      Verify 2022-12-01 to 2022-12-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000095',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 12, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_9600
     * @tc.name      testReminderDateMatrix2000096
     * @tc.desc      Verify 2022-12-01 to 2022-12-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000096',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 12, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_9700
     * @tc.name      testReminderDateMatrix2000097
     * @tc.desc      Verify 2023-01-01 to 2023-01-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000097',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 1, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_9800
     * @tc.name      testReminderDateMatrix2000098
     * @tc.desc      Verify 2023-01-01 to 2023-01-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000098',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 1, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_9900
     * @tc.name      testReminderDateMatrix2000099
     * @tc.desc      Verify 2023-01-01 to 2023-01-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000099',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 1, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_10000
     * @tc.name      testReminderDateMatrix2000100
     * @tc.desc      Verify 2023-01-01 to 2023-01-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 1, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_10100
     * @tc.name      testReminderDateMatrix2000101
     * @tc.desc      Verify 2023-01-01 to 2023-01-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 1, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_10200
     * @tc.name      testReminderDateMatrix2000102
     * @tc.desc      Verify 2023-01-01 to 2023-01-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 1, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_10300
     * @tc.name      testReminderDateMatrix2000103
     * @tc.desc      Verify 2023-01-01 to 2023-01-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000103',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 1, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_10400
     * @tc.name      testReminderDateMatrix2000104
     * @tc.desc      Verify 2023-01-01 to 2023-01-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000104',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 1, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_10500
     * @tc.name      testReminderDateMatrix2000105
     * @tc.desc      Verify 2023-02-01 to 2023-02-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000105',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 2, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_10600
     * @tc.name      testReminderDateMatrix2000106
     * @tc.desc      Verify 2023-02-01 to 2023-02-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000106',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 2, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_10700
     * @tc.name      testReminderDateMatrix2000107
     * @tc.desc      Verify 2023-02-01 to 2023-02-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000107',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 2, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_10800
     * @tc.name      testReminderDateMatrix2000108
     * @tc.desc      Verify 2023-02-01 to 2023-02-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000108',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 2, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_10900
     * @tc.name      testReminderDateMatrix2000109
     * @tc.desc      Verify 2023-02-01 to 2023-02-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000109',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 2, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_11000
     * @tc.name      testReminderDateMatrix2000110
     * @tc.desc      Verify 2023-02-01 to 2023-02-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000110',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 2, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_11100
     * @tc.name      testReminderDateMatrix2000111
     * @tc.desc      Verify 2023-02-01 to 2023-02-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000111',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 2, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_11200
     * @tc.name      testReminderDateMatrix2000112
     * @tc.desc      Verify 2023-02-01 to 2023-02-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000112',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 2, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_11300
     * @tc.name      testReminderDateMatrix2000113
     * @tc.desc      Verify 2023-03-01 to 2023-03-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000113',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 3, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_11400
     * @tc.name      testReminderDateMatrix2000114
     * @tc.desc      Verify 2023-03-01 to 2023-03-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000114',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 3, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_11500
     * @tc.name      testReminderDateMatrix2000115
     * @tc.desc      Verify 2023-03-01 to 2023-03-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000115',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 3, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_11600
     * @tc.name      testReminderDateMatrix2000116
     * @tc.desc      Verify 2023-03-01 to 2023-03-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000116',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 3, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_11700
     * @tc.name      testReminderDateMatrix2000117
     * @tc.desc      Verify 2023-03-01 to 2023-03-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000117',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 3, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_11800
     * @tc.name      testReminderDateMatrix2000118
     * @tc.desc      Verify 2023-03-01 to 2023-03-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000118',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 3, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_11900
     * @tc.name      testReminderDateMatrix2000119
     * @tc.desc      Verify 2023-03-01 to 2023-03-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000119',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 3, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_12000
     * @tc.name      testReminderDateMatrix2000120
     * @tc.desc      Verify 2023-03-01 to 2023-03-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000120',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 3, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_12100
     * @tc.name      testReminderDateMatrix2000121
     * @tc.desc      Verify 2023-04-01 to 2023-04-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000121',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 4, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_12200
     * @tc.name      testReminderDateMatrix2000122
     * @tc.desc      Verify 2023-04-01 to 2023-04-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000122',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 4, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_12300
     * @tc.name      testReminderDateMatrix2000123
     * @tc.desc      Verify 2023-04-01 to 2023-04-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000123',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 4, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_12400
     * @tc.name      testReminderDateMatrix2000124
     * @tc.desc      Verify 2023-04-01 to 2023-04-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000124',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 4, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_12500
     * @tc.name      testReminderDateMatrix2000125
     * @tc.desc      Verify 2023-04-01 to 2023-04-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000125',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 4, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_12600
     * @tc.name      testReminderDateMatrix2000126
     * @tc.desc      Verify 2023-04-01 to 2023-04-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000126',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 4, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_12700
     * @tc.name      testReminderDateMatrix2000127
     * @tc.desc      Verify 2023-04-01 to 2023-04-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000127',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 4, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_12800
     * @tc.name      testReminderDateMatrix2000128
     * @tc.desc      Verify 2023-04-01 to 2023-04-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000128',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 4, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_12900
     * @tc.name      testReminderDateMatrix2000129
     * @tc.desc      Verify 2023-05-01 to 2023-05-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000129',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 5, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_13000
     * @tc.name      testReminderDateMatrix2000130
     * @tc.desc      Verify 2023-05-01 to 2023-05-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000130',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 5, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_13100
     * @tc.name      testReminderDateMatrix2000131
     * @tc.desc      Verify 2023-05-01 to 2023-05-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000131',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 5, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_13200
     * @tc.name      testReminderDateMatrix2000132
     * @tc.desc      Verify 2023-05-01 to 2023-05-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000132',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 5, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_13300
     * @tc.name      testReminderDateMatrix2000133
     * @tc.desc      Verify 2023-05-01 to 2023-05-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000133',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 5, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_13400
     * @tc.name      testReminderDateMatrix2000134
     * @tc.desc      Verify 2023-05-01 to 2023-05-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000134',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 5, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_13500
     * @tc.name      testReminderDateMatrix2000135
     * @tc.desc      Verify 2023-05-01 to 2023-05-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000135',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 5, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_13600
     * @tc.name      testReminderDateMatrix2000136
     * @tc.desc      Verify 2023-05-01 to 2023-05-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000136',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 5, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_13700
     * @tc.name      testReminderDateMatrix2000137
     * @tc.desc      Verify 2023-06-01 to 2023-06-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000137',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 6, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_13800
     * @tc.name      testReminderDateMatrix2000138
     * @tc.desc      Verify 2023-06-01 to 2023-06-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000138',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 6, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_13900
     * @tc.name      testReminderDateMatrix2000139
     * @tc.desc      Verify 2023-06-01 to 2023-06-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000139',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 6, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_14000
     * @tc.name      testReminderDateMatrix2000140
     * @tc.desc      Verify 2023-06-01 to 2023-06-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000140',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 6, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_14100
     * @tc.name      testReminderDateMatrix2000141
     * @tc.desc      Verify 2023-06-01 to 2023-06-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000141',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 6, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_14200
     * @tc.name      testReminderDateMatrix2000142
     * @tc.desc      Verify 2023-06-01 to 2023-06-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000142',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 6, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_14300
     * @tc.name      testReminderDateMatrix2000143
     * @tc.desc      Verify 2023-06-01 to 2023-06-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000143',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 6, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_14400
     * @tc.name      testReminderDateMatrix2000144
     * @tc.desc      Verify 2023-06-01 to 2023-06-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000144',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 6, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_14500
     * @tc.name      testReminderDateMatrix2000145
     * @tc.desc      Verify 2023-07-01 to 2023-07-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000145',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 7, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_14600
     * @tc.name      testReminderDateMatrix2000146
     * @tc.desc      Verify 2023-07-01 to 2023-07-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000146',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 7, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_14700
     * @tc.name      testReminderDateMatrix2000147
     * @tc.desc      Verify 2023-07-01 to 2023-07-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000147',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 7, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_14800
     * @tc.name      testReminderDateMatrix2000148
     * @tc.desc      Verify 2023-07-01 to 2023-07-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000148',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 7, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_14900
     * @tc.name      testReminderDateMatrix2000149
     * @tc.desc      Verify 2023-07-01 to 2023-07-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000149',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 7, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_15000
     * @tc.name      testReminderDateMatrix2000150
     * @tc.desc      Verify 2023-07-01 to 2023-07-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000150',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 7, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_15100
     * @tc.name      testReminderDateMatrix2000151
     * @tc.desc      Verify 2023-07-01 to 2023-07-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000151',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 7, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_15200
     * @tc.name      testReminderDateMatrix2000152
     * @tc.desc      Verify 2023-07-01 to 2023-07-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000152',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 7, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_15300
     * @tc.name      testReminderDateMatrix2000153
     * @tc.desc      Verify 2023-08-01 to 2023-08-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000153',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 8, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_15400
     * @tc.name      testReminderDateMatrix2000154
     * @tc.desc      Verify 2023-08-01 to 2023-08-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000154',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 8, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_15500
     * @tc.name      testReminderDateMatrix2000155
     * @tc.desc      Verify 2023-08-01 to 2023-08-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000155',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 8, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_15600
     * @tc.name      testReminderDateMatrix2000156
     * @tc.desc      Verify 2023-08-01 to 2023-08-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000156',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 8, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_15700
     * @tc.name      testReminderDateMatrix2000157
     * @tc.desc      Verify 2023-08-01 to 2023-08-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000157',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 8, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_15800
     * @tc.name      testReminderDateMatrix2000158
     * @tc.desc      Verify 2023-08-01 to 2023-08-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000158',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 8, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_15900
     * @tc.name      testReminderDateMatrix2000159
     * @tc.desc      Verify 2023-08-01 to 2023-08-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000159',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 8, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_16000
     * @tc.name      testReminderDateMatrix2000160
     * @tc.desc      Verify 2023-08-01 to 2023-08-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000160',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 8, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_16100
     * @tc.name      testReminderDateMatrix2000161
     * @tc.desc      Verify 2023-09-01 to 2023-09-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000161',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 9, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_16200
     * @tc.name      testReminderDateMatrix2000162
     * @tc.desc      Verify 2023-09-01 to 2023-09-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000162',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 9, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_16300
     * @tc.name      testReminderDateMatrix2000163
     * @tc.desc      Verify 2023-09-01 to 2023-09-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000163',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 9, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_16400
     * @tc.name      testReminderDateMatrix2000164
     * @tc.desc      Verify 2023-09-01 to 2023-09-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000164',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 9, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_16500
     * @tc.name      testReminderDateMatrix2000165
     * @tc.desc      Verify 2023-09-01 to 2023-09-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000165',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 9, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_16600
     * @tc.name      testReminderDateMatrix2000166
     * @tc.desc      Verify 2023-09-01 to 2023-09-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000166',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 9, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_16700
     * @tc.name      testReminderDateMatrix2000167
     * @tc.desc      Verify 2023-09-01 to 2023-09-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000167',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 9, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_16800
     * @tc.name      testReminderDateMatrix2000168
     * @tc.desc      Verify 2023-09-01 to 2023-09-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000168',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 9, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_16900
     * @tc.name      testReminderDateMatrix2000169
     * @tc.desc      Verify 2023-10-01 to 2023-10-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000169',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 10, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_17000
     * @tc.name      testReminderDateMatrix2000170
     * @tc.desc      Verify 2023-10-01 to 2023-10-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000170',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 10, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_17100
     * @tc.name      testReminderDateMatrix2000171
     * @tc.desc      Verify 2023-10-01 to 2023-10-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000171',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 10, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_17200
     * @tc.name      testReminderDateMatrix2000172
     * @tc.desc      Verify 2023-10-01 to 2023-10-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000172',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 10, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_17300
     * @tc.name      testReminderDateMatrix2000173
     * @tc.desc      Verify 2023-10-01 to 2023-10-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000173',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 10, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_17400
     * @tc.name      testReminderDateMatrix2000174
     * @tc.desc      Verify 2023-10-01 to 2023-10-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000174',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 10, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_17500
     * @tc.name      testReminderDateMatrix2000175
     * @tc.desc      Verify 2023-10-01 to 2023-10-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000175',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 10, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_17600
     * @tc.name      testReminderDateMatrix2000176
     * @tc.desc      Verify 2023-10-01 to 2023-10-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000176',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 10, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_17700
     * @tc.name      testReminderDateMatrix2000177
     * @tc.desc      Verify 2023-11-01 to 2023-11-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000177',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 11, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_17800
     * @tc.name      testReminderDateMatrix2000178
     * @tc.desc      Verify 2023-11-01 to 2023-11-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000178',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 11, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_17900
     * @tc.name      testReminderDateMatrix2000179
     * @tc.desc      Verify 2023-11-01 to 2023-11-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000179',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 11, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_18000
     * @tc.name      testReminderDateMatrix2000180
     * @tc.desc      Verify 2023-11-01 to 2023-11-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000180',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 11, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_18100
     * @tc.name      testReminderDateMatrix2000181
     * @tc.desc      Verify 2023-11-01 to 2023-11-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000181',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 11, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_18200
     * @tc.name      testReminderDateMatrix2000182
     * @tc.desc      Verify 2023-11-01 to 2023-11-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000182',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 11, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_18300
     * @tc.name      testReminderDateMatrix2000183
     * @tc.desc      Verify 2023-11-01 to 2023-11-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000183',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 11, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_18400
     * @tc.name      testReminderDateMatrix2000184
     * @tc.desc      Verify 2023-11-01 to 2023-11-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000184',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 11, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 11, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_18500
     * @tc.name      testReminderDateMatrix2000185
     * @tc.desc      Verify 2023-12-01 to 2023-12-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000185',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 12, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_18600
     * @tc.name      testReminderDateMatrix2000186
     * @tc.desc      Verify 2023-12-01 to 2023-12-04 spans 3 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000186',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 12, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_18700
     * @tc.name      testReminderDateMatrix2000187
     * @tc.desc      Verify 2023-12-01 to 2023-12-05 spans 4 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000187',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 12, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_18800
     * @tc.name      testReminderDateMatrix2000188
     * @tc.desc      Verify 2023-12-01 to 2023-12-06 spans 5 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000188',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 12, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_18900
     * @tc.name      testReminderDateMatrix2000189
     * @tc.desc      Verify 2023-12-01 to 2023-12-07 spans 6 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000189',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 12, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_19000
     * @tc.name      testReminderDateMatrix2000190
     * @tc.desc      Verify 2023-12-01 to 2023-12-08 spans 7 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000190',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 12, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_19100
     * @tc.name      testReminderDateMatrix2000191
     * @tc.desc      Verify 2023-12-01 to 2023-12-09 spans 8 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000191',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 12, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_19200
     * @tc.name      testReminderDateMatrix2000192
     * @tc.desc      Verify 2023-12-01 to 2023-12-10 spans 9 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000192',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 12, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 12, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_19300
     * @tc.name      testReminderDateMatrix2000193
     * @tc.desc      Verify 2022-01-01 to 2022-01-11 spans 10 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000193',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 1, 11, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 864000 - 2).assertTrue();
          expect(diff <= 864000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_19400
     * @tc.name      testReminderDateMatrix2000194
     * @tc.desc      Verify 2022-02-01 to 2022-02-11 spans 10 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000194',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 2, 11, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 864000 - 2).assertTrue();
          expect(diff <= 864000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_19500
     * @tc.name      testReminderDateMatrix2000195
     * @tc.desc      Verify 2022-03-01 to 2022-03-11 spans 10 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000195',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 3, 11, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 864000 - 2).assertTrue();
          expect(diff <= 864000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_19600
     * @tc.name      testReminderDateMatrix2000196
     * @tc.desc      Verify 2022-04-01 to 2022-04-11 spans 10 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000196',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 4, 11, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 864000 - 2).assertTrue();
          expect(diff <= 864000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_19700
     * @tc.name      testReminderDateMatrix2000197
     * @tc.desc      Verify 2022-05-01 to 2022-05-11 spans 10 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000197',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 5, 11, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 864000 - 2).assertTrue();
          expect(diff <= 864000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_19800
     * @tc.name      testReminderDateMatrix2000198
     * @tc.desc      Verify 2022-06-01 to 2022-06-11 spans 10 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000198',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 6, 11, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 864000 - 2).assertTrue();
          expect(diff <= 864000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_19900
     * @tc.name      testReminderDateMatrix2000199
     * @tc.desc      Verify 2022-07-01 to 2022-07-11 spans 10 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000199',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 7, 11, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 864000 - 2).assertTrue();
          expect(diff <= 864000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_20000
     * @tc.name      testReminderDateMatrix2000200
     * @tc.desc      Verify 2022-08-01 to 2022-08-11 spans 10 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 8, 11, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 864000 - 2).assertTrue();
          expect(diff <= 864000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });  });
}
