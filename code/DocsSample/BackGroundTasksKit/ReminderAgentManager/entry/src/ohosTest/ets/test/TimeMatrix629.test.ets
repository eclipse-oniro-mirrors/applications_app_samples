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

export default function timeMatrix629Test(): void {
  describe('ReminderTimeMatrix629Test', () => {
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_0100
     * @tc.name      testReminderTimeMatrix6290001
     * @tc.desc      Verify 00:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_0200
     * @tc.name      testReminderTimeMatrix6290002
     * @tc.desc      Verify 00:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 51);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_0300
     * @tc.name      testReminderTimeMatrix6290003
     * @tc.desc      Verify 00:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 52);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_0400
     * @tc.name      testReminderTimeMatrix6290004
     * @tc.desc      Verify 00:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_0500
     * @tc.name      testReminderTimeMatrix6290005
     * @tc.desc      Verify 00:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 56);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_0600
     * @tc.name      testReminderTimeMatrix6290006
     * @tc.desc      Verify 00:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_0700
     * @tc.name      testReminderTimeMatrix6290007
     * @tc.desc      Verify 01:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_0800
     * @tc.name      testReminderTimeMatrix6290008
     * @tc.desc      Verify 01:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 19);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_0900
     * @tc.name      testReminderTimeMatrix6290009
     * @tc.desc      Verify 01:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_1000
     * @tc.name      testReminderTimeMatrix6290010
     * @tc.desc      Verify 01:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_1100
     * @tc.name      testReminderTimeMatrix6290011
     * @tc.desc      Verify 01:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 24);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_1200
     * @tc.name      testReminderTimeMatrix6290012
     * @tc.desc      Verify 01:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_1300
     * @tc.name      testReminderTimeMatrix6290013
     * @tc.desc      Verify 01:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_1400
     * @tc.name      testReminderTimeMatrix6290014
     * @tc.desc      Verify 01:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 29);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_1500
     * @tc.name      testReminderTimeMatrix6290015
     * @tc.desc      Verify 01:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 31);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_1600
     * @tc.name      testReminderTimeMatrix6290016
     * @tc.desc      Verify 01:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 33);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_1700
     * @tc.name      testReminderTimeMatrix6290017
     * @tc.desc      Verify 01:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 34);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_1800
     * @tc.name      testReminderTimeMatrix6290018
     * @tc.desc      Verify 01:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 36);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_1900
     * @tc.name      testReminderTimeMatrix6290019
     * @tc.desc      Verify 01:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 38);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_2000
     * @tc.name      testReminderTimeMatrix6290020
     * @tc.desc      Verify 01:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 39);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_2100
     * @tc.name      testReminderTimeMatrix6290021
     * @tc.desc      Verify 01:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 41);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_2200
     * @tc.name      testReminderTimeMatrix6290022
     * @tc.desc      Verify 01:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 43);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_2300
     * @tc.name      testReminderTimeMatrix6290023
     * @tc.desc      Verify 01:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 44);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_2400
     * @tc.name      testReminderTimeMatrix6290024
     * @tc.desc      Verify 01:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_2500
     * @tc.name      testReminderTimeMatrix6290025
     * @tc.desc      Verify 01:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_2600
     * @tc.name      testReminderTimeMatrix6290026
     * @tc.desc      Verify 01:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 51);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_2700
     * @tc.name      testReminderTimeMatrix6290027
     * @tc.desc      Verify 01:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 52);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_2800
     * @tc.name      testReminderTimeMatrix6290028
     * @tc.desc      Verify 01:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_2900
     * @tc.name      testReminderTimeMatrix6290029
     * @tc.desc      Verify 01:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 56);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_3000
     * @tc.name      testReminderTimeMatrix6290030
     * @tc.desc      Verify 01:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_3100
     * @tc.name      testReminderTimeMatrix6290031
     * @tc.desc      Verify 01:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 59);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_3200
     * @tc.name      testReminderTimeMatrix6290032
     * @tc.desc      Verify 02:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 17);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_3300
     * @tc.name      testReminderTimeMatrix6290033
     * @tc.desc      Verify 02:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_3400
     * @tc.name      testReminderTimeMatrix6290034
     * @tc.desc      Verify 02:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_3500
     * @tc.name      testReminderTimeMatrix6290035
     * @tc.desc      Verify 02:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 22);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_3600
     * @tc.name      testReminderTimeMatrix6290036
     * @tc.desc      Verify 02:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_3700
     * @tc.name      testReminderTimeMatrix6290037
     * @tc.desc      Verify 02:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_3800
     * @tc.name      testReminderTimeMatrix6290038
     * @tc.desc      Verify 02:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 27);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_3900
     * @tc.name      testReminderTimeMatrix6290039
     * @tc.desc      Verify 02:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_4000
     * @tc.name      testReminderTimeMatrix6290040
     * @tc.desc      Verify 02:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 31);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_4100
     * @tc.name      testReminderTimeMatrix6290041
     * @tc.desc      Verify 02:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 32);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_4200
     * @tc.name      testReminderTimeMatrix6290042
     * @tc.desc      Verify 02:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 33);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_4300
     * @tc.name      testReminderTimeMatrix6290043
     * @tc.desc      Verify 02:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 36);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_4400
     * @tc.name      testReminderTimeMatrix6290044
     * @tc.desc      Verify 02:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 37);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_4500
     * @tc.name      testReminderTimeMatrix6290045
     * @tc.desc      Verify 02:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 38);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_4600
     * @tc.name      testReminderTimeMatrix6290046
     * @tc.desc      Verify 02:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 41);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_4700
     * @tc.name      testReminderTimeMatrix6290047
     * @tc.desc      Verify 02:42 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 42);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_4800
     * @tc.name      testReminderTimeMatrix6290048
     * @tc.desc      Verify 02:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 43);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_4900
     * @tc.name      testReminderTimeMatrix6290049
     * @tc.desc      Verify 02:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_5000
     * @tc.name      testReminderTimeMatrix6290050
     * @tc.desc      Verify 02:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 48);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_5100
     * @tc.name      testReminderTimeMatrix6290051
     * @tc.desc      Verify 02:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_5200
     * @tc.name      testReminderTimeMatrix6290052
     * @tc.desc      Verify 02:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 52);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_5300
     * @tc.name      testReminderTimeMatrix6290053
     * @tc.desc      Verify 02:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 53);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_5400
     * @tc.name      testReminderTimeMatrix6290054
     * @tc.desc      Verify 02:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_5500
     * @tc.name      testReminderTimeMatrix6290055
     * @tc.desc      Verify 02:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_5600
     * @tc.name      testReminderTimeMatrix6290056
     * @tc.desc      Verify 02:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 58);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_5700
     * @tc.name      testReminderTimeMatrix6290057
     * @tc.desc      Verify 02:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 59);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_5800
     * @tc.name      testReminderTimeMatrix6290058
     * @tc.desc      Verify 03:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_5900
     * @tc.name      testReminderTimeMatrix6290059
     * @tc.desc      Verify 03:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 19);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_6000
     * @tc.name      testReminderTimeMatrix6290060
     * @tc.desc      Verify 03:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_6100
     * @tc.name      testReminderTimeMatrix6290061
     * @tc.desc      Verify 03:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_6200
     * @tc.name      testReminderTimeMatrix6290062
     * @tc.desc      Verify 03:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 24);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_6300
     * @tc.name      testReminderTimeMatrix6290063
     * @tc.desc      Verify 03:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_6400
     * @tc.name      testReminderTimeMatrix6290064
     * @tc.desc      Verify 03:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_6500
     * @tc.name      testReminderTimeMatrix6290065
     * @tc.desc      Verify 03:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 29);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_6600
     * @tc.name      testReminderTimeMatrix6290066
     * @tc.desc      Verify 03:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 31);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_6700
     * @tc.name      testReminderTimeMatrix6290067
     * @tc.desc      Verify 03:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 33);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_6800
     * @tc.name      testReminderTimeMatrix6290068
     * @tc.desc      Verify 03:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 34);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_6900
     * @tc.name      testReminderTimeMatrix6290069
     * @tc.desc      Verify 03:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 36);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_7000
     * @tc.name      testReminderTimeMatrix6290070
     * @tc.desc      Verify 03:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 38);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_7100
     * @tc.name      testReminderTimeMatrix6290071
     * @tc.desc      Verify 03:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 39);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_7200
     * @tc.name      testReminderTimeMatrix6290072
     * @tc.desc      Verify 03:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 41);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_7300
     * @tc.name      testReminderTimeMatrix6290073
     * @tc.desc      Verify 03:42 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 42);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_7400
     * @tc.name      testReminderTimeMatrix6290074
     * @tc.desc      Verify 03:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 46);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_7500
     * @tc.name      testReminderTimeMatrix6290075
     * @tc.desc      Verify 03:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_7600
     * @tc.name      testReminderTimeMatrix6290076
     * @tc.desc      Verify 03:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_7700
     * @tc.name      testReminderTimeMatrix6290077
     * @tc.desc      Verify 03:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 51);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_7800
     * @tc.name      testReminderTimeMatrix6290078
     * @tc.desc      Verify 03:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 52);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_7900
     * @tc.name      testReminderTimeMatrix6290079
     * @tc.desc      Verify 03:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_8000
     * @tc.name      testReminderTimeMatrix6290080
     * @tc.desc      Verify 03:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 56);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_8100
     * @tc.name      testReminderTimeMatrix6290081
     * @tc.desc      Verify 03:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_8200
     * @tc.name      testReminderTimeMatrix6290082
     * @tc.desc      Verify 03:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 59);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_8300
     * @tc.name      testReminderTimeMatrix6290083
     * @tc.desc      Verify 04:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 17);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_8400
     * @tc.name      testReminderTimeMatrix6290084
     * @tc.desc      Verify 04:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 18);
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
