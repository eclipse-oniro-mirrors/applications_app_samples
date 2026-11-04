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

export default function dateMatrix200Test(): void {
  describe('ReminderDateMatrix200Test', () => {
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX200_0100
     * @tc.name      testReminderDateMatrix2000001
     * @tc.desc      Verify 2022-01-01 to 2022-01-03 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix2000001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 1, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 1, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 1, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 1, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 1, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 1, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 1, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 1, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 2, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 2, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 2, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 2, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 2, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 2, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 2, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 2, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 3, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 3, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 3, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 3, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 3, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 3, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 3, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 3, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 4, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 4, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 4, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 4, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 4, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 4, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 4, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 4, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 5, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 5, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 5, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 5, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 5, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 5, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 5, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 5, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 6, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 6, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 6, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 6, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 6, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 6, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 6, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 6, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 7, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 7, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 7, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 7, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 7, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 7, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 7, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 7, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 8, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 8, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 8, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 8, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 8, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 8, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 8, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 8, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 8, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 9, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 9, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 9, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 9, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 9, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 9, 8, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 604800 - 2).assertTrue();
          expect(diff <= 604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 9, 9, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 691200 - 2).assertTrue();
          expect(diff <= 691200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 9, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 9, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 777600 - 2).assertTrue();
          expect(diff <= 777600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 10, 3, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 172800 - 2).assertTrue();
          expect(diff <= 172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 10, 4, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 10, 5, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 345600 - 2).assertTrue();
          expect(diff <= 345600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 10, 6, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 432000 - 2).assertTrue();
          expect(diff <= 432000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2022, 10, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2022, 10, 7, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 518400 - 2).assertTrue();
          expect(diff <= 518400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
      });  });
}
