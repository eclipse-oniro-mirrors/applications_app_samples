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

export default function dateBoundaryExtraTest(): void {
  describe('ReminderDateBoundaryExtraTest', () => {
    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_0100
     * @tc.name      testReminderDateBoundaryExtra0001
     * @tc.desc      Verify A same timestamp has zero delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 15, 10, 30);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 15, 10, 30);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 0 - 2).assertTrue();
          expect(diff <= 0 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_0200
     * @tc.name      testReminderDateBoundaryExtra0002
     * @tc.desc      Verify B plus one minute equals 60 seconds.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 15, 10, 30);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 15, 10, 31);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 60 - 2).assertTrue();
          expect(diff <= 60 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_0300
     * @tc.name      testReminderDateBoundaryExtra0003
     * @tc.desc      Verify C minus one minute equals -60 seconds.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 15, 10, 30);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 15, 10, 29);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= -60 - 2).assertTrue();
          expect(diff <= -60 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_0400
     * @tc.name      testReminderDateBoundaryExtra0004
     * @tc.desc      Verify D plus one hour equals 3600 seconds.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 15, 10, 30);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 15, 11, 30);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 3600 - 2).assertTrue();
          expect(diff <= 3600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_0500
     * @tc.name      testReminderDateBoundaryExtra0005
     * @tc.desc      Verify E minus one hour equals -3600 seconds.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 15, 10, 30);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 15, 9, 30);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= -3600 - 2).assertTrue();
          expect(diff <= -3600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_0600
     * @tc.name      testReminderDateBoundaryExtra0006
     * @tc.desc      Verify F plus one day equals 86400 seconds.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 16, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 86400 - 2).assertTrue();
          expect(diff <= 86400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_0700
     * @tc.name      testReminderDateBoundaryExtra0007
     * @tc.desc      Verify G minus one day equals -86400 seconds.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 14, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= -86400 - 2).assertTrue();
          expect(diff <= -86400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_0800
     * @tc.name      testReminderDateBoundaryExtra0008
     * @tc.desc      Verify H plus seven days equals one week.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 8, 0, 0);
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
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_0900
     * @tc.name      testReminderDateBoundaryExtra0009
     * @tc.desc      Verify I minus seven days equals one week.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 8, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 1, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= -604800 - 2).assertTrue();
          expect(diff <= -604800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_1000
     * @tc.name      testReminderDateBoundaryExtra0010
     * @tc.desc      Verify J plus one month equals 30 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 2, 1, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 2592000 - 2).assertTrue();
          expect(diff <= 2592000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_1100
     * @tc.name      testReminderDateBoundaryExtra0011
     * @tc.desc      Verify K minus one month equals 30 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 1, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= -2592000 - 2).assertTrue();
          expect(diff <= -2592000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_1200
     * @tc.name      testReminderDateBoundaryExtra0012
     * @tc.desc      Verify L plus one year equals 365 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 1, 1, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 31536000 - 2).assertTrue();
          expect(diff <= 31536000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_1300
     * @tc.name      testReminderDateBoundaryExtra0013
     * @tc.desc      Verify M minus one year equals 365 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 1, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= -31536000 - 2).assertTrue();
          expect(diff <= -31536000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_1400
     * @tc.name      testReminderDateBoundaryExtra0014
     * @tc.desc      Verify N plus ten years equals ten years.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2034, 1, 1, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 315360000 - 2).assertTrue();
          expect(diff <= 315360000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_1500
     * @tc.name      testReminderDateBoundaryExtra0015
     * @tc.desc      Verify O minus ten years equals ten years.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2034, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 1, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= -315360000 - 2).assertTrue();
          expect(diff <= -315360000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_1600
     * @tc.name      testReminderDateBoundaryExtra0016
     * @tc.desc      Verify P leap day starts after Feb 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 2, 28, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 2, 29, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 86400 - 2).assertTrue();
          expect(diff <= 86400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_1700
     * @tc.name      testReminderDateBoundaryExtra0017
     * @tc.desc      Verify Q leap day to March 1 spans 2 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 2, 29, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 3, 1, 0, 0);
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
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_1800
     * @tc.name      testReminderDateBoundaryExtra0018
     * @tc.desc      Verify R year 2000 leap day to March 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2000, 2, 29, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2000, 3, 1, 0, 0);
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
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_1900
     * @tc.name      testReminderDateBoundaryExtra0019
     * @tc.desc      Verify S year 2028 leap day to March 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2028, 2, 29, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2028, 3, 1, 0, 0);
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
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_2000
     * @tc.name      testReminderDateBoundaryExtra0020
     * @tc.desc      Verify T leap day noon offset.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 2, 29, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 2, 29, 12, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 43200 - 2).assertTrue();
          expect(diff <= 43200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_2100
     * @tc.name      testReminderDateBoundaryExtra0021
     * @tc.desc      Verify U leap day last minute offset.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 2, 29, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 2, 29, 23, 59);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 86340 - 2).assertTrue();
          expect(diff <= 86340 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_2200
     * @tc.name      testReminderDateBoundaryExtra0022
     * @tc.desc      Verify V year 2000 first minute offset.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2000, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2000, 1, 1, 0, 1);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 60 - 2).assertTrue();
          expect(diff <= 60 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_2300
     * @tc.name      testReminderDateBoundaryExtra0023
     * @tc.desc      Verify W epoch first day offset.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(1970, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(1970, 1, 2, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 86400 - 2).assertTrue();
          expect(diff <= 86400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_2400
     * @tc.name      testReminderDateBoundaryExtra0024
     * @tc.desc      Verify X century offset is 100 years.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2000, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2100, 1, 1, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 3153600000 - 2).assertTrue();
          expect(diff <= 3153600000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_2500
     * @tc.name      testReminderDateBoundaryExtra0025
     * @tc.desc      Verify Y last minute of day offset.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 1, 23, 59);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 86340 - 2).assertTrue();
          expect(diff <= 86340 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_2600
     * @tc.name      testReminderDateBoundaryExtra0026
     * @tc.desc      Verify Z noon to next midnight.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 1, 12, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 2, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 43200 - 2).assertTrue();
          expect(diff <= 43200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_2700
     * @tc.name      testReminderDateBoundaryExtra0027
     * @tc.desc      Verify AA first minute of year.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 1, 0, 1);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 60 - 2).assertTrue();
          expect(diff <= 60 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_2800
     * @tc.name      testReminderDateBoundaryExtra0028
     * @tc.desc      Verify AB midnight rollover in one minute.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 1, 23, 59);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 2, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 60 - 2).assertTrue();
          expect(diff <= 60 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_2900
     * @tc.name      testReminderDateBoundaryExtra0029
     * @tc.desc      Verify AC midnight to noon.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 1, 12, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 43200 - 2).assertTrue();
          expect(diff <= 43200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_BOUNDARY_EXTRA_3000
     * @tc.name      testReminderDateBoundaryExtra0030
     * @tc.desc      Verify AD leap day hour offset.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateBoundaryExtra0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 2, 29, 12, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 2, 29, 13, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 3600 - 2).assertTrue();
          expect(diff <= 3600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
