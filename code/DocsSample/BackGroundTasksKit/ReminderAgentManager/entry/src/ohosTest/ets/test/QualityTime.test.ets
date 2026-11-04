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

export default function qualityTimeTest(): void {
  describe('ReminderQualityTimeTest', () => {
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_0100
     * @tc.name      testReminderQualityTimeFuture0001
     * @tc.desc      Verify a 1-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimeFuture0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 1 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 61).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_0200
     * @tc.name      testReminderQualityTimeFuture0002
     * @tc.desc      Verify a 2-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimeFuture0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 2 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 121).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_0300
     * @tc.name      testReminderQualityTimeFuture0003
     * @tc.desc      Verify a 3-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimeFuture0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 3 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 181).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_0400
     * @tc.name      testReminderQualityTimeFuture0004
     * @tc.desc      Verify a 5-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimeFuture0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 5 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 301).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_0500
     * @tc.name      testReminderQualityTimeFuture0005
     * @tc.desc      Verify a 7-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimeFuture0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 7 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 421).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_0600
     * @tc.name      testReminderQualityTimeFuture0006
     * @tc.desc      Verify a 10-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimeFuture0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 10 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 601).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_0700
     * @tc.name      testReminderQualityTimeFuture0007
     * @tc.desc      Verify a 15-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimeFuture0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 15 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 901).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_0800
     * @tc.name      testReminderQualityTimeFuture0008
     * @tc.desc      Verify a 20-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimeFuture0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 20 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 1201).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_0900
     * @tc.name      testReminderQualityTimeFuture0009
     * @tc.desc      Verify a 30-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimeFuture0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 30 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 1801).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_1000
     * @tc.name      testReminderQualityTimeFuture0010
     * @tc.desc      Verify a 45-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimeFuture0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 45 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 2701).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_1100
     * @tc.name      testReminderQualityTimeFuture0011
     * @tc.desc      Verify a 60-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimeFuture0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 60 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 3601).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_1200
     * @tc.name      testReminderQualityTimeFuture0012
     * @tc.desc      Verify a 90-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimeFuture0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 90 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 5401).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_1300
     * @tc.name      testReminderQualityTimeFuture0013
     * @tc.desc      Verify a 120-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimeFuture0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 120 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 7201).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_1400
     * @tc.name      testReminderQualityTimePast0014
     * @tc.desc      Verify a 1-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimePast0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 1 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -120).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_1500
     * @tc.name      testReminderQualityTimePast0015
     * @tc.desc      Verify a 2-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimePast0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 2 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -180).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_1600
     * @tc.name      testReminderQualityTimePast0016
     * @tc.desc      Verify a 3-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimePast0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 3 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -240).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_1700
     * @tc.name      testReminderQualityTimePast0017
     * @tc.desc      Verify a 5-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimePast0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 5 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -360).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_1800
     * @tc.name      testReminderQualityTimePast0018
     * @tc.desc      Verify a 7-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimePast0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 7 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -480).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_1900
     * @tc.name      testReminderQualityTimePast0019
     * @tc.desc      Verify a 10-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimePast0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 10 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -660).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_2000
     * @tc.name      testReminderQualityTimePast0020
     * @tc.desc      Verify a 15-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimePast0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 15 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -960).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_2100
     * @tc.name      testReminderQualityTimePast0021
     * @tc.desc      Verify a 20-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimePast0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 20 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -1260).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_2200
     * @tc.name      testReminderQualityTimePast0022
     * @tc.desc      Verify a 30-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimePast0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 30 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -1860).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_2300
     * @tc.name      testReminderQualityTimePast0023
     * @tc.desc      Verify a 45-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimePast0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 45 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -2760).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_2400
     * @tc.name      testReminderQualityTimePast0024
     * @tc.desc      Verify a 60-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimePast0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 60 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -3660).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_2500
     * @tc.name      testReminderQualityTimePast0025
     * @tc.desc      Verify a 90-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimePast0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 90 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -5460).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME_2600
     * @tc.name      testReminderQualityTimePast0026
     * @tc.desc      Verify a 120-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTimePast0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 120 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -7260).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });  });
}
