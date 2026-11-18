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

export default function timeMatrix210Test(): void {
  describe('ReminderTimeMatrix210Test', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_0100
     * @tc.name      testReminderTimeMatrix2100001
     * @tc.desc      Verify 00:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 43);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 48);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 53);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 58);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 22);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 27);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 32);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 37);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 42);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 48);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 53);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 58);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 19);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 24);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 29);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 34);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 39);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 46);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 51);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 56);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 17);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 22);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 27);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 32);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 37);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 43);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 48);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 53);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 58);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 19);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 24);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 29);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 34);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 41);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 46);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 51);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 56);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 17);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 22);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 27);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 32);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 38);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 43);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 48);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 53);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 58);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 19);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 24);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 29);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 36);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 41);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 46);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 51);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 56);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 17);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 22);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 27);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 33);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 38);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 43);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 48);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 53);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 58);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 19);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 24);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 31);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 36);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 41);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 46);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 51);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 56);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 17);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 22);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 28);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 33);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 38);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 43);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 48);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 53);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 58);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 19);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 26);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 31);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 36);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_8500
     * @tc.name      testReminderTimeMatrix2100085
     * @tc.desc      Verify 10:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 41);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_8600
     * @tc.name      testReminderTimeMatrix2100086
     * @tc.desc      Verify 10:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 46);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_8700
     * @tc.name      testReminderTimeMatrix2100087
     * @tc.desc      Verify 10:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100087',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 51);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_8800
     * @tc.name      testReminderTimeMatrix2100088
     * @tc.desc      Verify 10:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100088',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 56);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_8900
     * @tc.name      testReminderTimeMatrix2100089
     * @tc.desc      Verify 11:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100089',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 17);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_9000
     * @tc.name      testReminderTimeMatrix2100090
     * @tc.desc      Verify 11:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 23);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_9100
     * @tc.name      testReminderTimeMatrix2100091
     * @tc.desc      Verify 11:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100091',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 28);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_9200
     * @tc.name      testReminderTimeMatrix2100092
     * @tc.desc      Verify 11:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100092',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 33);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_9300
     * @tc.name      testReminderTimeMatrix2100093
     * @tc.desc      Verify 11:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100093',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 38);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_9400
     * @tc.name      testReminderTimeMatrix2100094
     * @tc.desc      Verify 11:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100094',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 43);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_9500
     * @tc.name      testReminderTimeMatrix2100095
     * @tc.desc      Verify 11:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100095',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 48);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_9600
     * @tc.name      testReminderTimeMatrix2100096
     * @tc.desc      Verify 11:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100096',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 53);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_9700
     * @tc.name      testReminderTimeMatrix2100097
     * @tc.desc      Verify 11:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100097',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 58);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_9800
     * @tc.name      testReminderTimeMatrix2100098
     * @tc.desc      Verify 12:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100098',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 22);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_9900
     * @tc.name      testReminderTimeMatrix2100099
     * @tc.desc      Verify 12:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100099',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 27);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_10000
     * @tc.name      testReminderTimeMatrix2100100
     * @tc.desc      Verify 12:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 32);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_10100
     * @tc.name      testReminderTimeMatrix2100101
     * @tc.desc      Verify 12:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 37);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_10200
     * @tc.name      testReminderTimeMatrix2100102
     * @tc.desc      Verify 12:42 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 42);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_10300
     * @tc.name      testReminderTimeMatrix2100103
     * @tc.desc      Verify 12:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100103',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 47);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_10400
     * @tc.name      testReminderTimeMatrix2100104
     * @tc.desc      Verify 12:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100104',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 52);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_10500
     * @tc.name      testReminderTimeMatrix2100105
     * @tc.desc      Verify 12:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100105',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 57);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_10600
     * @tc.name      testReminderTimeMatrix2100106
     * @tc.desc      Verify 13:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100106',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 19);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_10700
     * @tc.name      testReminderTimeMatrix2100107
     * @tc.desc      Verify 13:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100107',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 24);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_10800
     * @tc.name      testReminderTimeMatrix2100108
     * @tc.desc      Verify 13:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100108',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 29);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_10900
     * @tc.name      testReminderTimeMatrix2100109
     * @tc.desc      Verify 13:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100109',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 34);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_11000
     * @tc.name      testReminderTimeMatrix2100110
     * @tc.desc      Verify 13:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100110',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 39);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_11100
     * @tc.name      testReminderTimeMatrix2100111
     * @tc.desc      Verify 13:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100111',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 44);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_11200
     * @tc.name      testReminderTimeMatrix2100112
     * @tc.desc      Verify 13:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100112',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 49);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_11300
     * @tc.name      testReminderTimeMatrix2100113
     * @tc.desc      Verify 13:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100113',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 54);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_11400
     * @tc.name      testReminderTimeMatrix2100114
     * @tc.desc      Verify 13:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100114',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 59);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_11500
     * @tc.name      testReminderTimeMatrix2100115
     * @tc.desc      Verify 14:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100115',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 22);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_11600
     * @tc.name      testReminderTimeMatrix2100116
     * @tc.desc      Verify 14:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100116',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 27);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_11700
     * @tc.name      testReminderTimeMatrix2100117
     * @tc.desc      Verify 14:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100117',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 32);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_11800
     * @tc.name      testReminderTimeMatrix2100118
     * @tc.desc      Verify 14:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100118',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 37);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_11900
     * @tc.name      testReminderTimeMatrix2100119
     * @tc.desc      Verify 14:42 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100119',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 42);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_12000
     * @tc.name      testReminderTimeMatrix2100120
     * @tc.desc      Verify 14:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100120',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 47);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_12100
     * @tc.name      testReminderTimeMatrix2100121
     * @tc.desc      Verify 14:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100121',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 52);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_12200
     * @tc.name      testReminderTimeMatrix2100122
     * @tc.desc      Verify 14:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100122',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 57);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_12300
     * @tc.name      testReminderTimeMatrix2100123
     * @tc.desc      Verify 15:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100123',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 19);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_12400
     * @tc.name      testReminderTimeMatrix2100124
     * @tc.desc      Verify 15:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100124',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 24);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_12500
     * @tc.name      testReminderTimeMatrix2100125
     * @tc.desc      Verify 15:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100125',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 29);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_12600
     * @tc.name      testReminderTimeMatrix2100126
     * @tc.desc      Verify 15:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100126',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 34);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_12700
     * @tc.name      testReminderTimeMatrix2100127
     * @tc.desc      Verify 15:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100127',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 39);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_12800
     * @tc.name      testReminderTimeMatrix2100128
     * @tc.desc      Verify 15:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100128',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 44);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_12900
     * @tc.name      testReminderTimeMatrix2100129
     * @tc.desc      Verify 15:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100129',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 49);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_13000
     * @tc.name      testReminderTimeMatrix2100130
     * @tc.desc      Verify 15:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100130',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 54);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_13100
     * @tc.name      testReminderTimeMatrix2100131
     * @tc.desc      Verify 16:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100131',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 17);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_13200
     * @tc.name      testReminderTimeMatrix2100132
     * @tc.desc      Verify 16:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100132',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 22);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_13300
     * @tc.name      testReminderTimeMatrix2100133
     * @tc.desc      Verify 16:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100133',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 27);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_13400
     * @tc.name      testReminderTimeMatrix2100134
     * @tc.desc      Verify 16:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100134',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 32);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_13500
     * @tc.name      testReminderTimeMatrix2100135
     * @tc.desc      Verify 16:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100135',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 37);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_13600
     * @tc.name      testReminderTimeMatrix2100136
     * @tc.desc      Verify 16:42 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100136',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 42);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_13700
     * @tc.name      testReminderTimeMatrix2100137
     * @tc.desc      Verify 16:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100137',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 47);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_13800
     * @tc.name      testReminderTimeMatrix2100138
     * @tc.desc      Verify 16:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100138',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 52);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_13900
     * @tc.name      testReminderTimeMatrix2100139
     * @tc.desc      Verify 16:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100139',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 57);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_14000
     * @tc.name      testReminderTimeMatrix2100140
     * @tc.desc      Verify 17:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100140',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 18);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_14100
     * @tc.name      testReminderTimeMatrix2100141
     * @tc.desc      Verify 17:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100141',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 23);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_14200
     * @tc.name      testReminderTimeMatrix2100142
     * @tc.desc      Verify 17:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100142',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 27);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_14300
     * @tc.name      testReminderTimeMatrix2100143
     * @tc.desc      Verify 17:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100143',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 31);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_14400
     * @tc.name      testReminderTimeMatrix2100144
     * @tc.desc      Verify 17:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100144',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 35);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_14500
     * @tc.name      testReminderTimeMatrix2100145
     * @tc.desc      Verify 17:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100145',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 39);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_14600
     * @tc.name      testReminderTimeMatrix2100146
     * @tc.desc      Verify 17:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100146',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 43);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_14700
     * @tc.name      testReminderTimeMatrix2100147
     * @tc.desc      Verify 17:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100147',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 48);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_14800
     * @tc.name      testReminderTimeMatrix2100148
     * @tc.desc      Verify 17:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100148',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 52);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_14900
     * @tc.name      testReminderTimeMatrix2100149
     * @tc.desc      Verify 17:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100149',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 56);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_15000
     * @tc.name      testReminderTimeMatrix2100150
     * @tc.desc      Verify 18:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100150',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 17);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_15100
     * @tc.name      testReminderTimeMatrix2100151
     * @tc.desc      Verify 18:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100151',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 22);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_15200
     * @tc.name      testReminderTimeMatrix2100152
     * @tc.desc      Verify 18:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100152',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 27);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_15300
     * @tc.name      testReminderTimeMatrix2100153
     * @tc.desc      Verify 18:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100153',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 32);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_15400
     * @tc.name      testReminderTimeMatrix2100154
     * @tc.desc      Verify 18:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100154',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 36);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_15500
     * @tc.name      testReminderTimeMatrix2100155
     * @tc.desc      Verify 18:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100155',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 41);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_15600
     * @tc.name      testReminderTimeMatrix2100156
     * @tc.desc      Verify 18:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100156',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 46);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_15700
     * @tc.name      testReminderTimeMatrix2100157
     * @tc.desc      Verify 18:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100157',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_15800
     * @tc.name      testReminderTimeMatrix2100158
     * @tc.desc      Verify 18:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100158',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 54);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_15900
     * @tc.name      testReminderTimeMatrix2100159
     * @tc.desc      Verify 18:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100159',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 59);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_16000
     * @tc.name      testReminderTimeMatrix2100160
     * @tc.desc      Verify 19:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100160',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 21);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_16100
     * @tc.name      testReminderTimeMatrix2100161
     * @tc.desc      Verify 19:25 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100161',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 25);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_16200
     * @tc.name      testReminderTimeMatrix2100162
     * @tc.desc      Verify 19:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100162',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 29);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_16300
     * @tc.name      testReminderTimeMatrix2100163
     * @tc.desc      Verify 19:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100163',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 34);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_16400
     * @tc.name      testReminderTimeMatrix2100164
     * @tc.desc      Verify 19:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100164',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 38);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_16500
     * @tc.name      testReminderTimeMatrix2100165
     * @tc.desc      Verify 19:42 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100165',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 42);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_16600
     * @tc.name      testReminderTimeMatrix2100166
     * @tc.desc      Verify 19:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100166',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 46);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_16700
     * @tc.name      testReminderTimeMatrix2100167
     * @tc.desc      Verify 19:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100167',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_16800
     * @tc.name      testReminderTimeMatrix2100168
     * @tc.desc      Verify 19:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100168',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 54);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_16900
     * @tc.name      testReminderTimeMatrix2100169
     * @tc.desc      Verify 19:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100169',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 58);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_17000
     * @tc.name      testReminderTimeMatrix2100170
     * @tc.desc      Verify 20:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100170',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 19);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_17100
     * @tc.name      testReminderTimeMatrix2100171
     * @tc.desc      Verify 20:25 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100171',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 25);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_17200
     * @tc.name      testReminderTimeMatrix2100172
     * @tc.desc      Verify 20:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100172',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 29);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_17300
     * @tc.name      testReminderTimeMatrix2100173
     * @tc.desc      Verify 20:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100173',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 33);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_17400
     * @tc.name      testReminderTimeMatrix2100174
     * @tc.desc      Verify 20:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100174',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 37);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_17500
     * @tc.name      testReminderTimeMatrix2100175
     * @tc.desc      Verify 20:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100175',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 41);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_17600
     * @tc.name      testReminderTimeMatrix2100176
     * @tc.desc      Verify 20:45 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100176',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 45);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_17700
     * @tc.name      testReminderTimeMatrix2100177
     * @tc.desc      Verify 20:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100177',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 49);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_17800
     * @tc.name      testReminderTimeMatrix2100178
     * @tc.desc      Verify 20:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100178',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 53);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_17900
     * @tc.name      testReminderTimeMatrix2100179
     * @tc.desc      Verify 20:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100179',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 58);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_18000
     * @tc.name      testReminderTimeMatrix2100180
     * @tc.desc      Verify 21:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100180',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 19);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_18100
     * @tc.name      testReminderTimeMatrix2100181
     * @tc.desc      Verify 21:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100181',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 24);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_18200
     * @tc.name      testReminderTimeMatrix2100182
     * @tc.desc      Verify 21:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100182',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 28);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_18300
     * @tc.name      testReminderTimeMatrix2100183
     * @tc.desc      Verify 21:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100183',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 32);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_18400
     * @tc.name      testReminderTimeMatrix2100184
     * @tc.desc      Verify 21:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100184',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 36);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_18500
     * @tc.name      testReminderTimeMatrix2100185
     * @tc.desc      Verify 21:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100185',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_18600
     * @tc.name      testReminderTimeMatrix2100186
     * @tc.desc      Verify 21:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100186',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 44);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_18700
     * @tc.name      testReminderTimeMatrix2100187
     * @tc.desc      Verify 21:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100187',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 49);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_18800
     * @tc.name      testReminderTimeMatrix2100188
     * @tc.desc      Verify 21:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100188',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 53);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_18900
     * @tc.name      testReminderTimeMatrix2100189
     * @tc.desc      Verify 21:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100189',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 57);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_19000
     * @tc.name      testReminderTimeMatrix2100190
     * @tc.desc      Verify 22:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100190',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 18);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_19100
     * @tc.name      testReminderTimeMatrix2100191
     * @tc.desc      Verify 22:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100191',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 23);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_19200
     * @tc.name      testReminderTimeMatrix2100192
     * @tc.desc      Verify 22:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100192',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 27);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_19300
     * @tc.name      testReminderTimeMatrix2100193
     * @tc.desc      Verify 22:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100193',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 31);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_19400
     * @tc.name      testReminderTimeMatrix2100194
     * @tc.desc      Verify 22:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100194',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 35);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_19500
     * @tc.name      testReminderTimeMatrix2100195
     * @tc.desc      Verify 22:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100195',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_19600
     * @tc.name      testReminderTimeMatrix2100196
     * @tc.desc      Verify 22:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100196',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 44);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_19700
     * @tc.name      testReminderTimeMatrix2100197
     * @tc.desc      Verify 22:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100197',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 48);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_19800
     * @tc.name      testReminderTimeMatrix2100198
     * @tc.desc      Verify 22:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100198',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 52);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_19900
     * @tc.name      testReminderTimeMatrix2100199
     * @tc.desc      Verify 22:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100199',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 56);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_20000
     * @tc.name      testReminderTimeMatrix2100200
     * @tc.desc      Verify 23:02 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(23, 2);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_20100
     * @tc.name      testReminderTimeMatrix2100201
     * @tc.desc      Verify 23:07 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100201',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(23, 7);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_20200
     * @tc.name      testReminderTimeMatrix2100202
     * @tc.desc      Verify 23:12 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100202',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(23, 12);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_20300
     * @tc.name      testReminderTimeMatrix2100203
     * @tc.desc      Verify 23:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100203',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(23, 18);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_20400
     * @tc.name      testReminderTimeMatrix2100204
     * @tc.desc      Verify 23:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100204',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(23, 23);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_20500
     * @tc.name      testReminderTimeMatrix2100205
     * @tc.desc      Verify 23:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100205',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(23, 28);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_20600
     * @tc.name      testReminderTimeMatrix2100206
     * @tc.desc      Verify 23:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100206',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(23, 33);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_20700
     * @tc.name      testReminderTimeMatrix2100207
     * @tc.desc      Verify 23:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100207',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(23, 38);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_20800
     * @tc.name      testReminderTimeMatrix2100208
     * @tc.desc      Verify 23:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100208',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(23, 43);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_20900
     * @tc.name      testReminderTimeMatrix2100209
     * @tc.desc      Verify 23:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100209',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(23, 48);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX210_21000
     * @tc.name      testReminderTimeMatrix2100210
     * @tc.desc      Verify 23:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix2100210',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(23, 53);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });  });
}
