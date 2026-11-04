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

export default function timeMatrix300Test(): void {
  describe('ReminderTimeMatrix300Test', () => {
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_0100
     * @tc.name      testReminderTimeMatrix3000001
     * @tc.desc      Verify 00:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_0200
     * @tc.name      testReminderTimeMatrix3000002
     * @tc.desc      Verify 00:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_0300
     * @tc.name      testReminderTimeMatrix3000003
     * @tc.desc      Verify 00:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_0400
     * @tc.name      testReminderTimeMatrix3000004
     * @tc.desc      Verify 00:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_0500
     * @tc.name      testReminderTimeMatrix3000005
     * @tc.desc      Verify 00:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_0600
     * @tc.name      testReminderTimeMatrix3000006
     * @tc.desc      Verify 00:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_0700
     * @tc.name      testReminderTimeMatrix3000007
     * @tc.desc      Verify 00:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_0800
     * @tc.name      testReminderTimeMatrix3000008
     * @tc.desc      Verify 00:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_0900
     * @tc.name      testReminderTimeMatrix3000009
     * @tc.desc      Verify 00:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_1000
     * @tc.name      testReminderTimeMatrix3000010
     * @tc.desc      Verify 00:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_1100
     * @tc.name      testReminderTimeMatrix3000011
     * @tc.desc      Verify 00:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_1200
     * @tc.name      testReminderTimeMatrix3000012
     * @tc.desc      Verify 00:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_1300
     * @tc.name      testReminderTimeMatrix3000013
     * @tc.desc      Verify 00:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 17);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_1400
     * @tc.name      testReminderTimeMatrix3000014
     * @tc.desc      Verify 01:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_1500
     * @tc.name      testReminderTimeMatrix3000015
     * @tc.desc      Verify 01:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_1600
     * @tc.name      testReminderTimeMatrix3000016
     * @tc.desc      Verify 01:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_1700
     * @tc.name      testReminderTimeMatrix3000017
     * @tc.desc      Verify 01:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_1800
     * @tc.name      testReminderTimeMatrix3000018
     * @tc.desc      Verify 01:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_1900
     * @tc.name      testReminderTimeMatrix3000019
     * @tc.desc      Verify 01:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_2000
     * @tc.name      testReminderTimeMatrix3000020
     * @tc.desc      Verify 01:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_2100
     * @tc.name      testReminderTimeMatrix3000021
     * @tc.desc      Verify 01:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_2200
     * @tc.name      testReminderTimeMatrix3000022
     * @tc.desc      Verify 01:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_2300
     * @tc.name      testReminderTimeMatrix3000023
     * @tc.desc      Verify 01:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_2400
     * @tc.name      testReminderTimeMatrix3000024
     * @tc.desc      Verify 01:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_2500
     * @tc.name      testReminderTimeMatrix3000025
     * @tc.desc      Verify 01:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_2600
     * @tc.name      testReminderTimeMatrix3000026
     * @tc.desc      Verify 01:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 17);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_2700
     * @tc.name      testReminderTimeMatrix3000027
     * @tc.desc      Verify 02:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_2800
     * @tc.name      testReminderTimeMatrix3000028
     * @tc.desc      Verify 02:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_2900
     * @tc.name      testReminderTimeMatrix3000029
     * @tc.desc      Verify 02:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_3000
     * @tc.name      testReminderTimeMatrix3000030
     * @tc.desc      Verify 02:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_3100
     * @tc.name      testReminderTimeMatrix3000031
     * @tc.desc      Verify 02:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_3200
     * @tc.name      testReminderTimeMatrix3000032
     * @tc.desc      Verify 02:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_3300
     * @tc.name      testReminderTimeMatrix3000033
     * @tc.desc      Verify 02:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_3400
     * @tc.name      testReminderTimeMatrix3000034
     * @tc.desc      Verify 02:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_3500
     * @tc.name      testReminderTimeMatrix3000035
     * @tc.desc      Verify 02:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_3600
     * @tc.name      testReminderTimeMatrix3000036
     * @tc.desc      Verify 02:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_3700
     * @tc.name      testReminderTimeMatrix3000037
     * @tc.desc      Verify 02:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_3800
     * @tc.name      testReminderTimeMatrix3000038
     * @tc.desc      Verify 02:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_3900
     * @tc.name      testReminderTimeMatrix3000039
     * @tc.desc      Verify 02:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_4000
     * @tc.name      testReminderTimeMatrix3000040
     * @tc.desc      Verify 03:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_4100
     * @tc.name      testReminderTimeMatrix3000041
     * @tc.desc      Verify 03:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_4200
     * @tc.name      testReminderTimeMatrix3000042
     * @tc.desc      Verify 03:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_4300
     * @tc.name      testReminderTimeMatrix3000043
     * @tc.desc      Verify 03:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_4400
     * @tc.name      testReminderTimeMatrix3000044
     * @tc.desc      Verify 03:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_4500
     * @tc.name      testReminderTimeMatrix3000045
     * @tc.desc      Verify 03:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_4600
     * @tc.name      testReminderTimeMatrix3000046
     * @tc.desc      Verify 03:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_4700
     * @tc.name      testReminderTimeMatrix3000047
     * @tc.desc      Verify 03:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_4800
     * @tc.name      testReminderTimeMatrix3000048
     * @tc.desc      Verify 03:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_4900
     * @tc.name      testReminderTimeMatrix3000049
     * @tc.desc      Verify 03:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_5000
     * @tc.name      testReminderTimeMatrix3000050
     * @tc.desc      Verify 03:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_5100
     * @tc.name      testReminderTimeMatrix3000051
     * @tc.desc      Verify 03:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_5200
     * @tc.name      testReminderTimeMatrix3000052
     * @tc.desc      Verify 03:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_5300
     * @tc.name      testReminderTimeMatrix3000053
     * @tc.desc      Verify 04:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_5400
     * @tc.name      testReminderTimeMatrix3000054
     * @tc.desc      Verify 04:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_5500
     * @tc.name      testReminderTimeMatrix3000055
     * @tc.desc      Verify 04:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_5600
     * @tc.name      testReminderTimeMatrix3000056
     * @tc.desc      Verify 04:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_5700
     * @tc.name      testReminderTimeMatrix3000057
     * @tc.desc      Verify 04:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_5800
     * @tc.name      testReminderTimeMatrix3000058
     * @tc.desc      Verify 04:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_5900
     * @tc.name      testReminderTimeMatrix3000059
     * @tc.desc      Verify 04:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_6000
     * @tc.name      testReminderTimeMatrix3000060
     * @tc.desc      Verify 04:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_6100
     * @tc.name      testReminderTimeMatrix3000061
     * @tc.desc      Verify 04:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_6200
     * @tc.name      testReminderTimeMatrix3000062
     * @tc.desc      Verify 04:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_6300
     * @tc.name      testReminderTimeMatrix3000063
     * @tc.desc      Verify 04:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_6400
     * @tc.name      testReminderTimeMatrix3000064
     * @tc.desc      Verify 04:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_6500
     * @tc.name      testReminderTimeMatrix3000065
     * @tc.desc      Verify 04:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_6600
     * @tc.name      testReminderTimeMatrix3000066
     * @tc.desc      Verify 05:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_6700
     * @tc.name      testReminderTimeMatrix3000067
     * @tc.desc      Verify 05:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_6800
     * @tc.name      testReminderTimeMatrix3000068
     * @tc.desc      Verify 05:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_6900
     * @tc.name      testReminderTimeMatrix3000069
     * @tc.desc      Verify 05:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_7000
     * @tc.name      testReminderTimeMatrix3000070
     * @tc.desc      Verify 05:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_7100
     * @tc.name      testReminderTimeMatrix3000071
     * @tc.desc      Verify 05:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_7200
     * @tc.name      testReminderTimeMatrix3000072
     * @tc.desc      Verify 05:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_7300
     * @tc.name      testReminderTimeMatrix3000073
     * @tc.desc      Verify 05:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_7400
     * @tc.name      testReminderTimeMatrix3000074
     * @tc.desc      Verify 05:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_7500
     * @tc.name      testReminderTimeMatrix3000075
     * @tc.desc      Verify 05:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_7600
     * @tc.name      testReminderTimeMatrix3000076
     * @tc.desc      Verify 05:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_7700
     * @tc.name      testReminderTimeMatrix3000077
     * @tc.desc      Verify 05:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_7800
     * @tc.name      testReminderTimeMatrix3000078
     * @tc.desc      Verify 05:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_7900
     * @tc.name      testReminderTimeMatrix3000079
     * @tc.desc      Verify 06:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_8000
     * @tc.name      testReminderTimeMatrix3000080
     * @tc.desc      Verify 06:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_8100
     * @tc.name      testReminderTimeMatrix3000081
     * @tc.desc      Verify 06:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_8200
     * @tc.name      testReminderTimeMatrix3000082
     * @tc.desc      Verify 06:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_8300
     * @tc.name      testReminderTimeMatrix3000083
     * @tc.desc      Verify 06:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_8400
     * @tc.name      testReminderTimeMatrix3000084
     * @tc.desc      Verify 06:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_8500
     * @tc.name      testReminderTimeMatrix3000085
     * @tc.desc      Verify 06:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_8600
     * @tc.name      testReminderTimeMatrix3000086
     * @tc.desc      Verify 06:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_8700
     * @tc.name      testReminderTimeMatrix3000087
     * @tc.desc      Verify 06:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000087',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_8800
     * @tc.name      testReminderTimeMatrix3000088
     * @tc.desc      Verify 06:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000088',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
      });  });
}
