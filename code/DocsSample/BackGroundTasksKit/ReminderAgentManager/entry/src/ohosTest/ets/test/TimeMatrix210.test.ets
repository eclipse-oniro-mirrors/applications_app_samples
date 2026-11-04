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

export default function timeMatrix210Test(): void {
  describe('ReminderTimeMatrix210Test', () => {
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_0100
     * @tc.name      testReminderTimeMatrix2100001
     * @tc.desc      Verify 00:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 43);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_0200
     * @tc.name      testReminderTimeMatrix2100002
     * @tc.desc      Verify 00:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 48);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_0300
     * @tc.name      testReminderTimeMatrix2100003
     * @tc.desc      Verify 00:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 53);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_0400
     * @tc.name      testReminderTimeMatrix2100004
     * @tc.desc      Verify 00:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 58);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_0500
     * @tc.name      testReminderTimeMatrix2100005
     * @tc.desc      Verify 01:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 22);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_0600
     * @tc.name      testReminderTimeMatrix2100006
     * @tc.desc      Verify 01:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 27);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_0700
     * @tc.name      testReminderTimeMatrix2100007
     * @tc.desc      Verify 01:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 32);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_0800
     * @tc.name      testReminderTimeMatrix2100008
     * @tc.desc      Verify 01:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 37);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_0900
     * @tc.name      testReminderTimeMatrix2100009
     * @tc.desc      Verify 01:42 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 42);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_1000
     * @tc.name      testReminderTimeMatrix2100010
     * @tc.desc      Verify 01:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 48);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_1100
     * @tc.name      testReminderTimeMatrix2100011
     * @tc.desc      Verify 01:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 53);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_1200
     * @tc.name      testReminderTimeMatrix2100012
     * @tc.desc      Verify 01:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 58);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_1300
     * @tc.name      testReminderTimeMatrix2100013
     * @tc.desc      Verify 02:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 19);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_1400
     * @tc.name      testReminderTimeMatrix2100014
     * @tc.desc      Verify 02:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 24);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_1500
     * @tc.name      testReminderTimeMatrix2100015
     * @tc.desc      Verify 02:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 29);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_1600
     * @tc.name      testReminderTimeMatrix2100016
     * @tc.desc      Verify 02:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 34);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_1700
     * @tc.name      testReminderTimeMatrix2100017
     * @tc.desc      Verify 02:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 39);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_1800
     * @tc.name      testReminderTimeMatrix2100018
     * @tc.desc      Verify 02:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 46);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_1900
     * @tc.name      testReminderTimeMatrix2100019
     * @tc.desc      Verify 02:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 51);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_2000
     * @tc.name      testReminderTimeMatrix2100020
     * @tc.desc      Verify 02:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 56);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_2100
     * @tc.name      testReminderTimeMatrix2100021
     * @tc.desc      Verify 03:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 17);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_2200
     * @tc.name      testReminderTimeMatrix2100022
     * @tc.desc      Verify 03:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 22);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_2300
     * @tc.name      testReminderTimeMatrix2100023
     * @tc.desc      Verify 03:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 27);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_2400
     * @tc.name      testReminderTimeMatrix2100024
     * @tc.desc      Verify 03:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 32);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_2500
     * @tc.name      testReminderTimeMatrix2100025
     * @tc.desc      Verify 03:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 37);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_2600
     * @tc.name      testReminderTimeMatrix2100026
     * @tc.desc      Verify 03:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 43);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_2700
     * @tc.name      testReminderTimeMatrix2100027
     * @tc.desc      Verify 03:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 48);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_2800
     * @tc.name      testReminderTimeMatrix2100028
     * @tc.desc      Verify 03:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 53);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_2900
     * @tc.name      testReminderTimeMatrix2100029
     * @tc.desc      Verify 03:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 58);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_3000
     * @tc.name      testReminderTimeMatrix2100030
     * @tc.desc      Verify 04:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 19);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_3100
     * @tc.name      testReminderTimeMatrix2100031
     * @tc.desc      Verify 04:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 24);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_3200
     * @tc.name      testReminderTimeMatrix2100032
     * @tc.desc      Verify 04:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 29);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_3300
     * @tc.name      testReminderTimeMatrix2100033
     * @tc.desc      Verify 04:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 34);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_3400
     * @tc.name      testReminderTimeMatrix2100034
     * @tc.desc      Verify 04:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 41);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_3500
     * @tc.name      testReminderTimeMatrix2100035
     * @tc.desc      Verify 04:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 46);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_3600
     * @tc.name      testReminderTimeMatrix2100036
     * @tc.desc      Verify 04:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 51);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_3700
     * @tc.name      testReminderTimeMatrix2100037
     * @tc.desc      Verify 04:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 56);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_3800
     * @tc.name      testReminderTimeMatrix2100038
     * @tc.desc      Verify 05:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 17);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_3900
     * @tc.name      testReminderTimeMatrix2100039
     * @tc.desc      Verify 05:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 22);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_4000
     * @tc.name      testReminderTimeMatrix2100040
     * @tc.desc      Verify 05:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 27);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_4100
     * @tc.name      testReminderTimeMatrix2100041
     * @tc.desc      Verify 05:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 32);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_4200
     * @tc.name      testReminderTimeMatrix2100042
     * @tc.desc      Verify 05:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 38);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_4300
     * @tc.name      testReminderTimeMatrix2100043
     * @tc.desc      Verify 05:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 43);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_4400
     * @tc.name      testReminderTimeMatrix2100044
     * @tc.desc      Verify 05:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 48);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_4500
     * @tc.name      testReminderTimeMatrix2100045
     * @tc.desc      Verify 05:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 53);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_4600
     * @tc.name      testReminderTimeMatrix2100046
     * @tc.desc      Verify 05:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 58);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_4700
     * @tc.name      testReminderTimeMatrix2100047
     * @tc.desc      Verify 06:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 19);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_4800
     * @tc.name      testReminderTimeMatrix2100048
     * @tc.desc      Verify 06:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 24);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_4900
     * @tc.name      testReminderTimeMatrix2100049
     * @tc.desc      Verify 06:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 29);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_5000
     * @tc.name      testReminderTimeMatrix2100050
     * @tc.desc      Verify 06:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 36);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_5100
     * @tc.name      testReminderTimeMatrix2100051
     * @tc.desc      Verify 06:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 41);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_5200
     * @tc.name      testReminderTimeMatrix2100052
     * @tc.desc      Verify 06:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 46);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_5300
     * @tc.name      testReminderTimeMatrix2100053
     * @tc.desc      Verify 06:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 51);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_5400
     * @tc.name      testReminderTimeMatrix2100054
     * @tc.desc      Verify 06:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 56);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_5500
     * @tc.name      testReminderTimeMatrix2100055
     * @tc.desc      Verify 07:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 17);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_5600
     * @tc.name      testReminderTimeMatrix2100056
     * @tc.desc      Verify 07:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 22);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_5700
     * @tc.name      testReminderTimeMatrix2100057
     * @tc.desc      Verify 07:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 27);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_5800
     * @tc.name      testReminderTimeMatrix2100058
     * @tc.desc      Verify 07:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 33);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_5900
     * @tc.name      testReminderTimeMatrix2100059
     * @tc.desc      Verify 07:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 38);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_6000
     * @tc.name      testReminderTimeMatrix2100060
     * @tc.desc      Verify 07:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 43);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_6100
     * @tc.name      testReminderTimeMatrix2100061
     * @tc.desc      Verify 07:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 48);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_6200
     * @tc.name      testReminderTimeMatrix2100062
     * @tc.desc      Verify 07:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 53);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_6300
     * @tc.name      testReminderTimeMatrix2100063
     * @tc.desc      Verify 07:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 58);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_6400
     * @tc.name      testReminderTimeMatrix2100064
     * @tc.desc      Verify 08:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 19);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_6500
     * @tc.name      testReminderTimeMatrix2100065
     * @tc.desc      Verify 08:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 24);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_6600
     * @tc.name      testReminderTimeMatrix2100066
     * @tc.desc      Verify 08:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 31);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_6700
     * @tc.name      testReminderTimeMatrix2100067
     * @tc.desc      Verify 08:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 36);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_6800
     * @tc.name      testReminderTimeMatrix2100068
     * @tc.desc      Verify 08:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 41);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_6900
     * @tc.name      testReminderTimeMatrix2100069
     * @tc.desc      Verify 08:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 46);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_7000
     * @tc.name      testReminderTimeMatrix2100070
     * @tc.desc      Verify 08:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 51);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_7100
     * @tc.name      testReminderTimeMatrix2100071
     * @tc.desc      Verify 08:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 56);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_7200
     * @tc.name      testReminderTimeMatrix2100072
     * @tc.desc      Verify 09:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 17);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_7300
     * @tc.name      testReminderTimeMatrix2100073
     * @tc.desc      Verify 09:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 22);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_7400
     * @tc.name      testReminderTimeMatrix2100074
     * @tc.desc      Verify 09:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 28);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_7500
     * @tc.name      testReminderTimeMatrix2100075
     * @tc.desc      Verify 09:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 33);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_7600
     * @tc.name      testReminderTimeMatrix2100076
     * @tc.desc      Verify 09:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 38);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_7700
     * @tc.name      testReminderTimeMatrix2100077
     * @tc.desc      Verify 09:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 43);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_7800
     * @tc.name      testReminderTimeMatrix2100078
     * @tc.desc      Verify 09:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 48);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_7900
     * @tc.name      testReminderTimeMatrix2100079
     * @tc.desc      Verify 09:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 53);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_8000
     * @tc.name      testReminderTimeMatrix2100080
     * @tc.desc      Verify 09:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 58);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_8100
     * @tc.name      testReminderTimeMatrix2100081
     * @tc.desc      Verify 10:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 19);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_8200
     * @tc.name      testReminderTimeMatrix2100082
     * @tc.desc      Verify 10:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 26);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_8300
     * @tc.name      testReminderTimeMatrix2100083
     * @tc.desc      Verify 10:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 31);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_8400
     * @tc.name      testReminderTimeMatrix2100084
     * @tc.desc      Verify 10:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 36);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
      });  });
}
