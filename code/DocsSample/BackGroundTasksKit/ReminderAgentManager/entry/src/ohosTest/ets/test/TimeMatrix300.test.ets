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

export default function timeMatrix300Test(): void {
  describe('ReminderTimeMatrix300Test', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_0100
     * @tc.name      testReminderTimeMatrix3000001
     * @tc.desc      Verify 00:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 17);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 17);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_8900
     * @tc.name      testReminderTimeMatrix3000089
     * @tc.desc      Verify 06:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000089',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_9000
     * @tc.name      testReminderTimeMatrix3000090
     * @tc.desc      Verify 06:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_9100
     * @tc.name      testReminderTimeMatrix3000091
     * @tc.desc      Verify 06:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000091',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_9200
     * @tc.name      testReminderTimeMatrix3000092
     * @tc.desc      Verify 07:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000092',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_9300
     * @tc.name      testReminderTimeMatrix3000093
     * @tc.desc      Verify 07:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000093',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_9400
     * @tc.name      testReminderTimeMatrix3000094
     * @tc.desc      Verify 07:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000094',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_9500
     * @tc.name      testReminderTimeMatrix3000095
     * @tc.desc      Verify 07:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000095',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_9600
     * @tc.name      testReminderTimeMatrix3000096
     * @tc.desc      Verify 07:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000096',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_9700
     * @tc.name      testReminderTimeMatrix3000097
     * @tc.desc      Verify 07:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000097',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_9800
     * @tc.name      testReminderTimeMatrix3000098
     * @tc.desc      Verify 07:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000098',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_9900
     * @tc.name      testReminderTimeMatrix3000099
     * @tc.desc      Verify 07:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000099',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_10000
     * @tc.name      testReminderTimeMatrix3000100
     * @tc.desc      Verify 07:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_10100
     * @tc.name      testReminderTimeMatrix3000101
     * @tc.desc      Verify 07:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_10200
     * @tc.name      testReminderTimeMatrix3000102
     * @tc.desc      Verify 07:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_10300
     * @tc.name      testReminderTimeMatrix3000103
     * @tc.desc      Verify 07:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000103',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_10400
     * @tc.name      testReminderTimeMatrix3000104
     * @tc.desc      Verify 07:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000104',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_10500
     * @tc.name      testReminderTimeMatrix3000105
     * @tc.desc      Verify 08:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000105',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_10600
     * @tc.name      testReminderTimeMatrix3000106
     * @tc.desc      Verify 08:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000106',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_10700
     * @tc.name      testReminderTimeMatrix3000107
     * @tc.desc      Verify 08:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000107',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_10800
     * @tc.name      testReminderTimeMatrix3000108
     * @tc.desc      Verify 08:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000108',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_10900
     * @tc.name      testReminderTimeMatrix3000109
     * @tc.desc      Verify 08:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000109',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_11000
     * @tc.name      testReminderTimeMatrix3000110
     * @tc.desc      Verify 08:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000110',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_11100
     * @tc.name      testReminderTimeMatrix3000111
     * @tc.desc      Verify 08:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000111',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_11200
     * @tc.name      testReminderTimeMatrix3000112
     * @tc.desc      Verify 08:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000112',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_11300
     * @tc.name      testReminderTimeMatrix3000113
     * @tc.desc      Verify 08:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000113',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_11400
     * @tc.name      testReminderTimeMatrix3000114
     * @tc.desc      Verify 08:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000114',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_11500
     * @tc.name      testReminderTimeMatrix3000115
     * @tc.desc      Verify 08:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000115',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_11600
     * @tc.name      testReminderTimeMatrix3000116
     * @tc.desc      Verify 08:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000116',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_11700
     * @tc.name      testReminderTimeMatrix3000117
     * @tc.desc      Verify 08:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000117',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_11800
     * @tc.name      testReminderTimeMatrix3000118
     * @tc.desc      Verify 09:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000118',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_11900
     * @tc.name      testReminderTimeMatrix3000119
     * @tc.desc      Verify 09:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000119',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_12000
     * @tc.name      testReminderTimeMatrix3000120
     * @tc.desc      Verify 09:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000120',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_12100
     * @tc.name      testReminderTimeMatrix3000121
     * @tc.desc      Verify 09:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000121',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_12200
     * @tc.name      testReminderTimeMatrix3000122
     * @tc.desc      Verify 09:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000122',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_12300
     * @tc.name      testReminderTimeMatrix3000123
     * @tc.desc      Verify 09:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000123',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_12400
     * @tc.name      testReminderTimeMatrix3000124
     * @tc.desc      Verify 09:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000124',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_12500
     * @tc.name      testReminderTimeMatrix3000125
     * @tc.desc      Verify 09:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000125',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_12600
     * @tc.name      testReminderTimeMatrix3000126
     * @tc.desc      Verify 09:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000126',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_12700
     * @tc.name      testReminderTimeMatrix3000127
     * @tc.desc      Verify 09:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000127',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_12800
     * @tc.name      testReminderTimeMatrix3000128
     * @tc.desc      Verify 09:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000128',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_12900
     * @tc.name      testReminderTimeMatrix3000129
     * @tc.desc      Verify 09:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000129',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_13000
     * @tc.name      testReminderTimeMatrix3000130
     * @tc.desc      Verify 09:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000130',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_13100
     * @tc.name      testReminderTimeMatrix3000131
     * @tc.desc      Verify 10:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000131',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_13200
     * @tc.name      testReminderTimeMatrix3000132
     * @tc.desc      Verify 10:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000132',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_13300
     * @tc.name      testReminderTimeMatrix3000133
     * @tc.desc      Verify 10:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000133',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_13400
     * @tc.name      testReminderTimeMatrix3000134
     * @tc.desc      Verify 10:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000134',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_13500
     * @tc.name      testReminderTimeMatrix3000135
     * @tc.desc      Verify 10:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000135',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_13600
     * @tc.name      testReminderTimeMatrix3000136
     * @tc.desc      Verify 10:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000136',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_13700
     * @tc.name      testReminderTimeMatrix3000137
     * @tc.desc      Verify 10:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000137',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_13800
     * @tc.name      testReminderTimeMatrix3000138
     * @tc.desc      Verify 10:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000138',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_13900
     * @tc.name      testReminderTimeMatrix3000139
     * @tc.desc      Verify 10:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000139',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_14000
     * @tc.name      testReminderTimeMatrix3000140
     * @tc.desc      Verify 10:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000140',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_14100
     * @tc.name      testReminderTimeMatrix3000141
     * @tc.desc      Verify 10:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000141',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_14200
     * @tc.name      testReminderTimeMatrix3000142
     * @tc.desc      Verify 10:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000142',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_14300
     * @tc.name      testReminderTimeMatrix3000143
     * @tc.desc      Verify 10:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000143',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_14400
     * @tc.name      testReminderTimeMatrix3000144
     * @tc.desc      Verify 11:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000144',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_14500
     * @tc.name      testReminderTimeMatrix3000145
     * @tc.desc      Verify 11:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000145',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_14600
     * @tc.name      testReminderTimeMatrix3000146
     * @tc.desc      Verify 11:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000146',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_14700
     * @tc.name      testReminderTimeMatrix3000147
     * @tc.desc      Verify 11:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000147',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_14800
     * @tc.name      testReminderTimeMatrix3000148
     * @tc.desc      Verify 11:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000148',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_14900
     * @tc.name      testReminderTimeMatrix3000149
     * @tc.desc      Verify 11:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000149',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_15000
     * @tc.name      testReminderTimeMatrix3000150
     * @tc.desc      Verify 11:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000150',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_15100
     * @tc.name      testReminderTimeMatrix3000151
     * @tc.desc      Verify 11:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000151',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_15200
     * @tc.name      testReminderTimeMatrix3000152
     * @tc.desc      Verify 11:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000152',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_15300
     * @tc.name      testReminderTimeMatrix3000153
     * @tc.desc      Verify 11:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000153',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_15400
     * @tc.name      testReminderTimeMatrix3000154
     * @tc.desc      Verify 11:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000154',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_15500
     * @tc.name      testReminderTimeMatrix3000155
     * @tc.desc      Verify 11:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000155',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_15600
     * @tc.name      testReminderTimeMatrix3000156
     * @tc.desc      Verify 11:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000156',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_15700
     * @tc.name      testReminderTimeMatrix3000157
     * @tc.desc      Verify 12:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000157',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_15800
     * @tc.name      testReminderTimeMatrix3000158
     * @tc.desc      Verify 12:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000158',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_15900
     * @tc.name      testReminderTimeMatrix3000159
     * @tc.desc      Verify 12:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000159',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_16000
     * @tc.name      testReminderTimeMatrix3000160
     * @tc.desc      Verify 12:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000160',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_16100
     * @tc.name      testReminderTimeMatrix3000161
     * @tc.desc      Verify 12:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000161',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_16200
     * @tc.name      testReminderTimeMatrix3000162
     * @tc.desc      Verify 12:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000162',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_16300
     * @tc.name      testReminderTimeMatrix3000163
     * @tc.desc      Verify 12:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000163',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_16400
     * @tc.name      testReminderTimeMatrix3000164
     * @tc.desc      Verify 12:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000164',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_16500
     * @tc.name      testReminderTimeMatrix3000165
     * @tc.desc      Verify 12:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000165',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_16600
     * @tc.name      testReminderTimeMatrix3000166
     * @tc.desc      Verify 12:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000166',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_16700
     * @tc.name      testReminderTimeMatrix3000167
     * @tc.desc      Verify 12:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000167',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_16800
     * @tc.name      testReminderTimeMatrix3000168
     * @tc.desc      Verify 12:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000168',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_16900
     * @tc.name      testReminderTimeMatrix3000169
     * @tc.desc      Verify 12:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000169',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_17000
     * @tc.name      testReminderTimeMatrix3000170
     * @tc.desc      Verify 13:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000170',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_17100
     * @tc.name      testReminderTimeMatrix3000171
     * @tc.desc      Verify 13:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000171',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_17200
     * @tc.name      testReminderTimeMatrix3000172
     * @tc.desc      Verify 13:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000172',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_17300
     * @tc.name      testReminderTimeMatrix3000173
     * @tc.desc      Verify 13:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000173',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_17400
     * @tc.name      testReminderTimeMatrix3000174
     * @tc.desc      Verify 13:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000174',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_17500
     * @tc.name      testReminderTimeMatrix3000175
     * @tc.desc      Verify 13:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000175',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_17600
     * @tc.name      testReminderTimeMatrix3000176
     * @tc.desc      Verify 13:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000176',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_17700
     * @tc.name      testReminderTimeMatrix3000177
     * @tc.desc      Verify 13:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000177',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_17800
     * @tc.name      testReminderTimeMatrix3000178
     * @tc.desc      Verify 13:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000178',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_17900
     * @tc.name      testReminderTimeMatrix3000179
     * @tc.desc      Verify 13:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000179',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_18000
     * @tc.name      testReminderTimeMatrix3000180
     * @tc.desc      Verify 13:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000180',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_18100
     * @tc.name      testReminderTimeMatrix3000181
     * @tc.desc      Verify 13:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000181',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_18200
     * @tc.name      testReminderTimeMatrix3000182
     * @tc.desc      Verify 13:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000182',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_18300
     * @tc.name      testReminderTimeMatrix3000183
     * @tc.desc      Verify 14:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000183',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_18400
     * @tc.name      testReminderTimeMatrix3000184
     * @tc.desc      Verify 14:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000184',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_18500
     * @tc.name      testReminderTimeMatrix3000185
     * @tc.desc      Verify 14:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000185',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_18600
     * @tc.name      testReminderTimeMatrix3000186
     * @tc.desc      Verify 14:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000186',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_18700
     * @tc.name      testReminderTimeMatrix3000187
     * @tc.desc      Verify 14:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000187',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_18800
     * @tc.name      testReminderTimeMatrix3000188
     * @tc.desc      Verify 14:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000188',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_18900
     * @tc.name      testReminderTimeMatrix3000189
     * @tc.desc      Verify 14:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000189',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_19000
     * @tc.name      testReminderTimeMatrix3000190
     * @tc.desc      Verify 14:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000190',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_19100
     * @tc.name      testReminderTimeMatrix3000191
     * @tc.desc      Verify 14:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000191',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_19200
     * @tc.name      testReminderTimeMatrix3000192
     * @tc.desc      Verify 14:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000192',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_19300
     * @tc.name      testReminderTimeMatrix3000193
     * @tc.desc      Verify 14:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000193',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_19400
     * @tc.name      testReminderTimeMatrix3000194
     * @tc.desc      Verify 14:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000194',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_19500
     * @tc.name      testReminderTimeMatrix3000195
     * @tc.desc      Verify 14:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000195',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_19600
     * @tc.name      testReminderTimeMatrix3000196
     * @tc.desc      Verify 15:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000196',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_19700
     * @tc.name      testReminderTimeMatrix3000197
     * @tc.desc      Verify 15:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000197',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_19800
     * @tc.name      testReminderTimeMatrix3000198
     * @tc.desc      Verify 15:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000198',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_19900
     * @tc.name      testReminderTimeMatrix3000199
     * @tc.desc      Verify 15:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000199',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_20000
     * @tc.name      testReminderTimeMatrix3000200
     * @tc.desc      Verify 15:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_20100
     * @tc.name      testReminderTimeMatrix3000201
     * @tc.desc      Verify 15:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000201',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_20200
     * @tc.name      testReminderTimeMatrix3000202
     * @tc.desc      Verify 15:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000202',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_20300
     * @tc.name      testReminderTimeMatrix3000203
     * @tc.desc      Verify 15:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000203',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_20400
     * @tc.name      testReminderTimeMatrix3000204
     * @tc.desc      Verify 15:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000204',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_20500
     * @tc.name      testReminderTimeMatrix3000205
     * @tc.desc      Verify 15:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000205',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_20600
     * @tc.name      testReminderTimeMatrix3000206
     * @tc.desc      Verify 15:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000206',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_20700
     * @tc.name      testReminderTimeMatrix3000207
     * @tc.desc      Verify 15:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000207',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_20800
     * @tc.name      testReminderTimeMatrix3000208
     * @tc.desc      Verify 15:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000208',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_20900
     * @tc.name      testReminderTimeMatrix3000209
     * @tc.desc      Verify 16:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000209',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_21000
     * @tc.name      testReminderTimeMatrix3000210
     * @tc.desc      Verify 16:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000210',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_21100
     * @tc.name      testReminderTimeMatrix3000211
     * @tc.desc      Verify 16:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000211',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_21200
     * @tc.name      testReminderTimeMatrix3000212
     * @tc.desc      Verify 16:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000212',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_21300
     * @tc.name      testReminderTimeMatrix3000213
     * @tc.desc      Verify 16:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000213',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_21400
     * @tc.name      testReminderTimeMatrix3000214
     * @tc.desc      Verify 16:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000214',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_21500
     * @tc.name      testReminderTimeMatrix3000215
     * @tc.desc      Verify 16:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000215',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_21600
     * @tc.name      testReminderTimeMatrix3000216
     * @tc.desc      Verify 16:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000216',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_21700
     * @tc.name      testReminderTimeMatrix3000217
     * @tc.desc      Verify 16:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000217',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_21800
     * @tc.name      testReminderTimeMatrix3000218
     * @tc.desc      Verify 16:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000218',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_21900
     * @tc.name      testReminderTimeMatrix3000219
     * @tc.desc      Verify 16:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000219',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_22000
     * @tc.name      testReminderTimeMatrix3000220
     * @tc.desc      Verify 16:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000220',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_22100
     * @tc.name      testReminderTimeMatrix3000221
     * @tc.desc      Verify 16:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000221',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_22200
     * @tc.name      testReminderTimeMatrix3000222
     * @tc.desc      Verify 17:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000222',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_22300
     * @tc.name      testReminderTimeMatrix3000223
     * @tc.desc      Verify 17:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000223',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_22400
     * @tc.name      testReminderTimeMatrix3000224
     * @tc.desc      Verify 17:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000224',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_22500
     * @tc.name      testReminderTimeMatrix3000225
     * @tc.desc      Verify 17:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000225',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_22600
     * @tc.name      testReminderTimeMatrix3000226
     * @tc.desc      Verify 17:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000226',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_22700
     * @tc.name      testReminderTimeMatrix3000227
     * @tc.desc      Verify 17:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000227',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_22800
     * @tc.name      testReminderTimeMatrix3000228
     * @tc.desc      Verify 17:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000228',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_22900
     * @tc.name      testReminderTimeMatrix3000229
     * @tc.desc      Verify 17:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000229',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_23000
     * @tc.name      testReminderTimeMatrix3000230
     * @tc.desc      Verify 17:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000230',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_23100
     * @tc.name      testReminderTimeMatrix3000231
     * @tc.desc      Verify 17:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000231',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_23200
     * @tc.name      testReminderTimeMatrix3000232
     * @tc.desc      Verify 17:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000232',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_23300
     * @tc.name      testReminderTimeMatrix3000233
     * @tc.desc      Verify 17:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000233',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_23400
     * @tc.name      testReminderTimeMatrix3000234
     * @tc.desc      Verify 17:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000234',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_23500
     * @tc.name      testReminderTimeMatrix3000235
     * @tc.desc      Verify 18:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000235',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_23600
     * @tc.name      testReminderTimeMatrix3000236
     * @tc.desc      Verify 18:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000236',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_23700
     * @tc.name      testReminderTimeMatrix3000237
     * @tc.desc      Verify 18:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000237',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_23800
     * @tc.name      testReminderTimeMatrix3000238
     * @tc.desc      Verify 18:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000238',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_23900
     * @tc.name      testReminderTimeMatrix3000239
     * @tc.desc      Verify 18:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000239',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_24000
     * @tc.name      testReminderTimeMatrix3000240
     * @tc.desc      Verify 18:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000240',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_24100
     * @tc.name      testReminderTimeMatrix3000241
     * @tc.desc      Verify 18:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000241',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_24200
     * @tc.name      testReminderTimeMatrix3000242
     * @tc.desc      Verify 18:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000242',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_24300
     * @tc.name      testReminderTimeMatrix3000243
     * @tc.desc      Verify 18:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000243',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_24400
     * @tc.name      testReminderTimeMatrix3000244
     * @tc.desc      Verify 18:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000244',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_24500
     * @tc.name      testReminderTimeMatrix3000245
     * @tc.desc      Verify 18:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000245',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_24600
     * @tc.name      testReminderTimeMatrix3000246
     * @tc.desc      Verify 18:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000246',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_24700
     * @tc.name      testReminderTimeMatrix3000247
     * @tc.desc      Verify 18:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000247',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_24800
     * @tc.name      testReminderTimeMatrix3000248
     * @tc.desc      Verify 19:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000248',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_24900
     * @tc.name      testReminderTimeMatrix3000249
     * @tc.desc      Verify 19:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000249',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_25000
     * @tc.name      testReminderTimeMatrix3000250
     * @tc.desc      Verify 19:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000250',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_25100
     * @tc.name      testReminderTimeMatrix3000251
     * @tc.desc      Verify 19:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000251',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_25200
     * @tc.name      testReminderTimeMatrix3000252
     * @tc.desc      Verify 19:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000252',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_25300
     * @tc.name      testReminderTimeMatrix3000253
     * @tc.desc      Verify 19:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000253',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_25400
     * @tc.name      testReminderTimeMatrix3000254
     * @tc.desc      Verify 19:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000254',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_25500
     * @tc.name      testReminderTimeMatrix3000255
     * @tc.desc      Verify 19:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000255',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_25600
     * @tc.name      testReminderTimeMatrix3000256
     * @tc.desc      Verify 19:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000256',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_25700
     * @tc.name      testReminderTimeMatrix3000257
     * @tc.desc      Verify 19:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000257',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_25800
     * @tc.name      testReminderTimeMatrix3000258
     * @tc.desc      Verify 19:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000258',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_25900
     * @tc.name      testReminderTimeMatrix3000259
     * @tc.desc      Verify 19:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000259',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_26000
     * @tc.name      testReminderTimeMatrix3000260
     * @tc.desc      Verify 19:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000260',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_26100
     * @tc.name      testReminderTimeMatrix3000261
     * @tc.desc      Verify 20:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000261',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_26200
     * @tc.name      testReminderTimeMatrix3000262
     * @tc.desc      Verify 20:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000262',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_26300
     * @tc.name      testReminderTimeMatrix3000263
     * @tc.desc      Verify 20:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000263',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_26400
     * @tc.name      testReminderTimeMatrix3000264
     * @tc.desc      Verify 20:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000264',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_26500
     * @tc.name      testReminderTimeMatrix3000265
     * @tc.desc      Verify 20:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000265',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_26600
     * @tc.name      testReminderTimeMatrix3000266
     * @tc.desc      Verify 20:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000266',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_26700
     * @tc.name      testReminderTimeMatrix3000267
     * @tc.desc      Verify 20:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000267',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_26800
     * @tc.name      testReminderTimeMatrix3000268
     * @tc.desc      Verify 20:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000268',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_26900
     * @tc.name      testReminderTimeMatrix3000269
     * @tc.desc      Verify 20:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000269',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_27000
     * @tc.name      testReminderTimeMatrix3000270
     * @tc.desc      Verify 20:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000270',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_27100
     * @tc.name      testReminderTimeMatrix3000271
     * @tc.desc      Verify 20:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000271',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_27200
     * @tc.name      testReminderTimeMatrix3000272
     * @tc.desc      Verify 20:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000272',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_27300
     * @tc.name      testReminderTimeMatrix3000273
     * @tc.desc      Verify 20:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000273',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_27400
     * @tc.name      testReminderTimeMatrix3000274
     * @tc.desc      Verify 21:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000274',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_27500
     * @tc.name      testReminderTimeMatrix3000275
     * @tc.desc      Verify 21:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000275',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_27600
     * @tc.name      testReminderTimeMatrix3000276
     * @tc.desc      Verify 21:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000276',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_27700
     * @tc.name      testReminderTimeMatrix3000277
     * @tc.desc      Verify 21:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000277',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_27800
     * @tc.name      testReminderTimeMatrix3000278
     * @tc.desc      Verify 21:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000278',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_27900
     * @tc.name      testReminderTimeMatrix3000279
     * @tc.desc      Verify 21:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000279',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_28000
     * @tc.name      testReminderTimeMatrix3000280
     * @tc.desc      Verify 21:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000280',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_28100
     * @tc.name      testReminderTimeMatrix3000281
     * @tc.desc      Verify 21:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000281',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_28200
     * @tc.name      testReminderTimeMatrix3000282
     * @tc.desc      Verify 21:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000282',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_28300
     * @tc.name      testReminderTimeMatrix3000283
     * @tc.desc      Verify 21:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000283',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_28400
     * @tc.name      testReminderTimeMatrix3000284
     * @tc.desc      Verify 21:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000284',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_28500
     * @tc.name      testReminderTimeMatrix3000285
     * @tc.desc      Verify 21:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000285',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_28600
     * @tc.name      testReminderTimeMatrix3000286
     * @tc.desc      Verify 21:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000286',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_28700
     * @tc.name      testReminderTimeMatrix3000287
     * @tc.desc      Verify 22:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000287',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_28800
     * @tc.name      testReminderTimeMatrix3000288
     * @tc.desc      Verify 22:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000288',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_28900
     * @tc.name      testReminderTimeMatrix3000289
     * @tc.desc      Verify 22:03 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000289',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 3);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_29000
     * @tc.name      testReminderTimeMatrix3000290
     * @tc.desc      Verify 22:04 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000290',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 4);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_29100
     * @tc.name      testReminderTimeMatrix3000291
     * @tc.desc      Verify 22:06 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000291',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 6);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_29200
     * @tc.name      testReminderTimeMatrix3000292
     * @tc.desc      Verify 22:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000292',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_29300
     * @tc.name      testReminderTimeMatrix3000293
     * @tc.desc      Verify 22:08 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000293',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 8);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_29400
     * @tc.name      testReminderTimeMatrix3000294
     * @tc.desc      Verify 22:09 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000294',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 9);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_29500
     * @tc.name      testReminderTimeMatrix3000295
     * @tc.desc      Verify 22:11 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000295',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 11);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_29600
     * @tc.name      testReminderTimeMatrix3000296
     * @tc.desc      Verify 22:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000296',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_29700
     * @tc.name      testReminderTimeMatrix3000297
     * @tc.desc      Verify 22:13 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000297',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 13);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_29800
     * @tc.name      testReminderTimeMatrix3000298
     * @tc.desc      Verify 22:14 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000298',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 14);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_29900
     * @tc.name      testReminderTimeMatrix3000299
     * @tc.desc      Verify 22:16 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000299',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 16);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX300_30000
     * @tc.name      testReminderTimeMatrix3000300
     * @tc.desc      Verify 23:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix3000300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(23, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });  });
}
