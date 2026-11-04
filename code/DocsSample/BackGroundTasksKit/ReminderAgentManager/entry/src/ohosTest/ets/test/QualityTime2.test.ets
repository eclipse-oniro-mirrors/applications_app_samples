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

export default function qualityTime2Test(): void {
  describe('ReminderQualityTime2Test', () => {
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_0100
     * @tc.name      testReminderQualityTime2Future0001
     * @tc.desc      Verify a 4-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Future0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 4 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 241).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_0200
     * @tc.name      testReminderQualityTime2Future0002
     * @tc.desc      Verify a 6-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Future0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 6 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 361).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_0300
     * @tc.name      testReminderQualityTime2Future0003
     * @tc.desc      Verify a 8-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Future0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 8 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 481).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_0400
     * @tc.name      testReminderQualityTime2Future0004
     * @tc.desc      Verify a 12-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Future0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 12 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 721).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_0500
     * @tc.name      testReminderQualityTime2Future0005
     * @tc.desc      Verify a 18-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Future0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 18 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 1081).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_0600
     * @tc.name      testReminderQualityTime2Future0006
     * @tc.desc      Verify a 24-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Future0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 24 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 1441).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_0700
     * @tc.name      testReminderQualityTime2Future0007
     * @tc.desc      Verify a 36-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Future0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 36 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 2161).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_0800
     * @tc.name      testReminderQualityTime2Future0008
     * @tc.desc      Verify a 48-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Future0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 48 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 2881).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_0900
     * @tc.name      testReminderQualityTime2Future0009
     * @tc.desc      Verify a 72-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Future0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 72 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 4321).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_1000
     * @tc.name      testReminderQualityTime2Future0010
     * @tc.desc      Verify a 96-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Future0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 96 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 5761).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_1100
     * @tc.name      testReminderQualityTime2Past0011
     * @tc.desc      Verify a 4-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Past0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 4 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -300).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_1200
     * @tc.name      testReminderQualityTime2Past0012
     * @tc.desc      Verify a 6-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Past0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 6 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -420).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_1300
     * @tc.name      testReminderQualityTime2Past0013
     * @tc.desc      Verify a 8-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Past0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 8 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -540).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_1400
     * @tc.name      testReminderQualityTime2Past0014
     * @tc.desc      Verify a 12-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Past0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 12 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -780).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_1500
     * @tc.name      testReminderQualityTime2Past0015
     * @tc.desc      Verify a 18-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Past0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 18 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -1140).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_1600
     * @tc.name      testReminderQualityTime2Past0016
     * @tc.desc      Verify a 24-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Past0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 24 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -1500).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_1700
     * @tc.name      testReminderQualityTime2Past0017
     * @tc.desc      Verify a 36-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Past0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 36 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -2220).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_1800
     * @tc.name      testReminderQualityTime2Past0018
     * @tc.desc      Verify a 48-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Past0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 48 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -2940).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_1900
     * @tc.name      testReminderQualityTime2Past0019
     * @tc.desc      Verify a 72-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Past0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 72 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -4380).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_TIME2_2000
     * @tc.name      testReminderQualityTime2Past0020
     * @tc.desc      Verify a 96-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityTime2Past0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 96 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -5820).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });  });
}
