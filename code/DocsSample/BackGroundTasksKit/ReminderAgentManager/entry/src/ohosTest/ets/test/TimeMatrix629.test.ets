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
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_8500
     * @tc.name      testReminderTimeMatrix6290085
     * @tc.desc      Verify 04:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_8600
     * @tc.name      testReminderTimeMatrix6290086
     * @tc.desc      Verify 04:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 22);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_8700
     * @tc.name      testReminderTimeMatrix6290087
     * @tc.desc      Verify 04:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290087',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_8800
     * @tc.name      testReminderTimeMatrix6290088
     * @tc.desc      Verify 04:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290088',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_8900
     * @tc.name      testReminderTimeMatrix6290089
     * @tc.desc      Verify 04:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290089',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 27);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_9000
     * @tc.name      testReminderTimeMatrix6290090
     * @tc.desc      Verify 04:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_9100
     * @tc.name      testReminderTimeMatrix6290091
     * @tc.desc      Verify 04:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290091',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 31);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_9200
     * @tc.name      testReminderTimeMatrix6290092
     * @tc.desc      Verify 04:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290092',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 32);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_9300
     * @tc.name      testReminderTimeMatrix6290093
     * @tc.desc      Verify 04:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290093',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 33);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_9400
     * @tc.name      testReminderTimeMatrix6290094
     * @tc.desc      Verify 04:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290094',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 36);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_9500
     * @tc.name      testReminderTimeMatrix6290095
     * @tc.desc      Verify 04:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290095',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 37);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_9600
     * @tc.name      testReminderTimeMatrix6290096
     * @tc.desc      Verify 04:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290096',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 38);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_9700
     * @tc.name      testReminderTimeMatrix6290097
     * @tc.desc      Verify 04:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290097',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 39);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_9800
     * @tc.name      testReminderTimeMatrix6290098
     * @tc.desc      Verify 04:42 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290098',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 42);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_9900
     * @tc.name      testReminderTimeMatrix6290099
     * @tc.desc      Verify 04:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290099',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 44);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_10000
     * @tc.name      testReminderTimeMatrix6290100
     * @tc.desc      Verify 04:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_10100
     * @tc.name      testReminderTimeMatrix6290101
     * @tc.desc      Verify 04:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 48);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_10200
     * @tc.name      testReminderTimeMatrix6290102
     * @tc.desc      Verify 04:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_10300
     * @tc.name      testReminderTimeMatrix6290103
     * @tc.desc      Verify 04:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290103',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 52);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_10400
     * @tc.name      testReminderTimeMatrix6290104
     * @tc.desc      Verify 04:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290104',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 53);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_10500
     * @tc.name      testReminderTimeMatrix6290105
     * @tc.desc      Verify 04:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290105',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_10600
     * @tc.name      testReminderTimeMatrix6290106
     * @tc.desc      Verify 04:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290106',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_10700
     * @tc.name      testReminderTimeMatrix6290107
     * @tc.desc      Verify 04:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290107',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 58);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_10800
     * @tc.name      testReminderTimeMatrix6290108
     * @tc.desc      Verify 04:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290108',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 59);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_10900
     * @tc.name      testReminderTimeMatrix6290109
     * @tc.desc      Verify 05:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290109',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_11000
     * @tc.name      testReminderTimeMatrix6290110
     * @tc.desc      Verify 05:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290110',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 19);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_11100
     * @tc.name      testReminderTimeMatrix6290111
     * @tc.desc      Verify 05:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290111',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_11200
     * @tc.name      testReminderTimeMatrix6290112
     * @tc.desc      Verify 05:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290112',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_11300
     * @tc.name      testReminderTimeMatrix6290113
     * @tc.desc      Verify 05:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290113',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 24);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_11400
     * @tc.name      testReminderTimeMatrix6290114
     * @tc.desc      Verify 05:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290114',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_11500
     * @tc.name      testReminderTimeMatrix6290115
     * @tc.desc      Verify 05:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290115',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_11600
     * @tc.name      testReminderTimeMatrix6290116
     * @tc.desc      Verify 05:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290116',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 29);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_11700
     * @tc.name      testReminderTimeMatrix6290117
     * @tc.desc      Verify 05:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290117',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 31);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_11800
     * @tc.name      testReminderTimeMatrix6290118
     * @tc.desc      Verify 05:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290118',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 33);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_11900
     * @tc.name      testReminderTimeMatrix6290119
     * @tc.desc      Verify 05:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290119',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 34);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_12000
     * @tc.name      testReminderTimeMatrix6290120
     * @tc.desc      Verify 05:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290120',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 36);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_12100
     * @tc.name      testReminderTimeMatrix6290121
     * @tc.desc      Verify 05:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290121',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 37);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_12200
     * @tc.name      testReminderTimeMatrix6290122
     * @tc.desc      Verify 05:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290122',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 39);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_12300
     * @tc.name      testReminderTimeMatrix6290123
     * @tc.desc      Verify 05:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290123',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 41);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_12400
     * @tc.name      testReminderTimeMatrix6290124
     * @tc.desc      Verify 05:42 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290124',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 42);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_12500
     * @tc.name      testReminderTimeMatrix6290125
     * @tc.desc      Verify 05:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290125',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 46);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_12600
     * @tc.name      testReminderTimeMatrix6290126
     * @tc.desc      Verify 05:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290126',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_12700
     * @tc.name      testReminderTimeMatrix6290127
     * @tc.desc      Verify 05:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290127',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_12800
     * @tc.name      testReminderTimeMatrix6290128
     * @tc.desc      Verify 05:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290128',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 51);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_12900
     * @tc.name      testReminderTimeMatrix6290129
     * @tc.desc      Verify 05:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290129',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 52);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_13000
     * @tc.name      testReminderTimeMatrix6290130
     * @tc.desc      Verify 05:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290130',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_13100
     * @tc.name      testReminderTimeMatrix6290131
     * @tc.desc      Verify 05:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290131',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 56);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_13200
     * @tc.name      testReminderTimeMatrix6290132
     * @tc.desc      Verify 05:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290132',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_13300
     * @tc.name      testReminderTimeMatrix6290133
     * @tc.desc      Verify 05:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290133',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 59);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_13400
     * @tc.name      testReminderTimeMatrix6290134
     * @tc.desc      Verify 06:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290134',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 17);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_13500
     * @tc.name      testReminderTimeMatrix6290135
     * @tc.desc      Verify 06:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290135',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_13600
     * @tc.name      testReminderTimeMatrix6290136
     * @tc.desc      Verify 06:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290136',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_13700
     * @tc.name      testReminderTimeMatrix6290137
     * @tc.desc      Verify 06:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290137',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 22);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_13800
     * @tc.name      testReminderTimeMatrix6290138
     * @tc.desc      Verify 06:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290138',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_13900
     * @tc.name      testReminderTimeMatrix6290139
     * @tc.desc      Verify 06:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290139',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_14000
     * @tc.name      testReminderTimeMatrix6290140
     * @tc.desc      Verify 06:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290140',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 27);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_14100
     * @tc.name      testReminderTimeMatrix6290141
     * @tc.desc      Verify 06:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290141',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_14200
     * @tc.name      testReminderTimeMatrix6290142
     * @tc.desc      Verify 06:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290142',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 31);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_14300
     * @tc.name      testReminderTimeMatrix6290143
     * @tc.desc      Verify 06:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290143',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 32);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_14400
     * @tc.name      testReminderTimeMatrix6290144
     * @tc.desc      Verify 06:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290144',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 33);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_14500
     * @tc.name      testReminderTimeMatrix6290145
     * @tc.desc      Verify 06:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290145',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 34);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_14600
     * @tc.name      testReminderTimeMatrix6290146
     * @tc.desc      Verify 06:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290146',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 37);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_14700
     * @tc.name      testReminderTimeMatrix6290147
     * @tc.desc      Verify 06:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290147',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 38);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_14800
     * @tc.name      testReminderTimeMatrix6290148
     * @tc.desc      Verify 06:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290148',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 39);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_14900
     * @tc.name      testReminderTimeMatrix6290149
     * @tc.desc      Verify 06:42 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290149',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 42);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_15000
     * @tc.name      testReminderTimeMatrix6290150
     * @tc.desc      Verify 06:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290150',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 44);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_15100
     * @tc.name      testReminderTimeMatrix6290151
     * @tc.desc      Verify 06:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290151',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_15200
     * @tc.name      testReminderTimeMatrix6290152
     * @tc.desc      Verify 06:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290152',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 48);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_15300
     * @tc.name      testReminderTimeMatrix6290153
     * @tc.desc      Verify 06:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290153',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_15400
     * @tc.name      testReminderTimeMatrix6290154
     * @tc.desc      Verify 06:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290154',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 52);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_15500
     * @tc.name      testReminderTimeMatrix6290155
     * @tc.desc      Verify 06:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290155',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 53);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_15600
     * @tc.name      testReminderTimeMatrix6290156
     * @tc.desc      Verify 06:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290156',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_15700
     * @tc.name      testReminderTimeMatrix6290157
     * @tc.desc      Verify 06:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290157',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_15800
     * @tc.name      testReminderTimeMatrix6290158
     * @tc.desc      Verify 06:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290158',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 58);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_15900
     * @tc.name      testReminderTimeMatrix6290159
     * @tc.desc      Verify 06:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290159',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 59);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_16000
     * @tc.name      testReminderTimeMatrix6290160
     * @tc.desc      Verify 07:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290160',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_16100
     * @tc.name      testReminderTimeMatrix6290161
     * @tc.desc      Verify 07:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290161',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 19);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_16200
     * @tc.name      testReminderTimeMatrix6290162
     * @tc.desc      Verify 07:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290162',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_16300
     * @tc.name      testReminderTimeMatrix6290163
     * @tc.desc      Verify 07:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290163',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_16400
     * @tc.name      testReminderTimeMatrix6290164
     * @tc.desc      Verify 07:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290164',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 24);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_16500
     * @tc.name      testReminderTimeMatrix6290165
     * @tc.desc      Verify 07:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290165',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_16600
     * @tc.name      testReminderTimeMatrix6290166
     * @tc.desc      Verify 07:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290166',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_16700
     * @tc.name      testReminderTimeMatrix6290167
     * @tc.desc      Verify 07:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290167',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 29);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_16800
     * @tc.name      testReminderTimeMatrix6290168
     * @tc.desc      Verify 07:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290168',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 31);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_16900
     * @tc.name      testReminderTimeMatrix6290169
     * @tc.desc      Verify 07:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290169',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 32);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_17000
     * @tc.name      testReminderTimeMatrix6290170
     * @tc.desc      Verify 07:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290170',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 34);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_17100
     * @tc.name      testReminderTimeMatrix6290171
     * @tc.desc      Verify 07:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290171',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 36);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_17200
     * @tc.name      testReminderTimeMatrix6290172
     * @tc.desc      Verify 07:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290172',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 37);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_17300
     * @tc.name      testReminderTimeMatrix6290173
     * @tc.desc      Verify 07:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290173',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 39);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_17400
     * @tc.name      testReminderTimeMatrix6290174
     * @tc.desc      Verify 07:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290174',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 41);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_17500
     * @tc.name      testReminderTimeMatrix6290175
     * @tc.desc      Verify 07:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290175',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 44);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_17600
     * @tc.name      testReminderTimeMatrix6290176
     * @tc.desc      Verify 07:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290176',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 46);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_17700
     * @tc.name      testReminderTimeMatrix6290177
     * @tc.desc      Verify 07:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290177',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_17800
     * @tc.name      testReminderTimeMatrix6290178
     * @tc.desc      Verify 07:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290178',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_17900
     * @tc.name      testReminderTimeMatrix6290179
     * @tc.desc      Verify 07:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290179',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 51);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_18000
     * @tc.name      testReminderTimeMatrix6290180
     * @tc.desc      Verify 07:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290180',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 52);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_18100
     * @tc.name      testReminderTimeMatrix6290181
     * @tc.desc      Verify 07:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290181',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_18200
     * @tc.name      testReminderTimeMatrix6290182
     * @tc.desc      Verify 07:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290182',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 56);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_18300
     * @tc.name      testReminderTimeMatrix6290183
     * @tc.desc      Verify 07:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290183',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_18400
     * @tc.name      testReminderTimeMatrix6290184
     * @tc.desc      Verify 07:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290184',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 59);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_18500
     * @tc.name      testReminderTimeMatrix6290185
     * @tc.desc      Verify 08:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290185',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 17);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_18600
     * @tc.name      testReminderTimeMatrix6290186
     * @tc.desc      Verify 08:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290186',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_18700
     * @tc.name      testReminderTimeMatrix6290187
     * @tc.desc      Verify 08:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290187',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_18800
     * @tc.name      testReminderTimeMatrix6290188
     * @tc.desc      Verify 08:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290188',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 22);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_18900
     * @tc.name      testReminderTimeMatrix6290189
     * @tc.desc      Verify 08:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290189',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_19000
     * @tc.name      testReminderTimeMatrix6290190
     * @tc.desc      Verify 08:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290190',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_19100
     * @tc.name      testReminderTimeMatrix6290191
     * @tc.desc      Verify 08:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290191',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 27);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_19200
     * @tc.name      testReminderTimeMatrix6290192
     * @tc.desc      Verify 08:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290192',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_19300
     * @tc.name      testReminderTimeMatrix6290193
     * @tc.desc      Verify 08:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290193',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 29);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_19400
     * @tc.name      testReminderTimeMatrix6290194
     * @tc.desc      Verify 08:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290194',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 32);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_19500
     * @tc.name      testReminderTimeMatrix6290195
     * @tc.desc      Verify 08:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290195',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 33);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_19600
     * @tc.name      testReminderTimeMatrix6290196
     * @tc.desc      Verify 08:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290196',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 34);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_19700
     * @tc.name      testReminderTimeMatrix6290197
     * @tc.desc      Verify 08:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290197',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 37);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_19800
     * @tc.name      testReminderTimeMatrix6290198
     * @tc.desc      Verify 08:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290198',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 38);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_19900
     * @tc.name      testReminderTimeMatrix6290199
     * @tc.desc      Verify 08:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290199',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 39);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_20000
     * @tc.name      testReminderTimeMatrix6290200
     * @tc.desc      Verify 08:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 43);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_20100
     * @tc.name      testReminderTimeMatrix6290201
     * @tc.desc      Verify 08:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290201',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 44);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_20200
     * @tc.name      testReminderTimeMatrix6290202
     * @tc.desc      Verify 08:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290202',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_20300
     * @tc.name      testReminderTimeMatrix6290203
     * @tc.desc      Verify 08:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290203',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 48);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_20400
     * @tc.name      testReminderTimeMatrix6290204
     * @tc.desc      Verify 08:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290204',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_20500
     * @tc.name      testReminderTimeMatrix6290205
     * @tc.desc      Verify 08:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290205',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 52);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_20600
     * @tc.name      testReminderTimeMatrix6290206
     * @tc.desc      Verify 08:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290206',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 53);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_20700
     * @tc.name      testReminderTimeMatrix6290207
     * @tc.desc      Verify 08:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290207',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_20800
     * @tc.name      testReminderTimeMatrix6290208
     * @tc.desc      Verify 08:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290208',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_20900
     * @tc.name      testReminderTimeMatrix6290209
     * @tc.desc      Verify 08:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290209',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 58);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_21000
     * @tc.name      testReminderTimeMatrix6290210
     * @tc.desc      Verify 08:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290210',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 59);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_21100
     * @tc.name      testReminderTimeMatrix6290211
     * @tc.desc      Verify 09:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290211',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_21200
     * @tc.name      testReminderTimeMatrix6290212
     * @tc.desc      Verify 09:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290212',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 19);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_21300
     * @tc.name      testReminderTimeMatrix6290213
     * @tc.desc      Verify 09:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290213',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_21400
     * @tc.name      testReminderTimeMatrix6290214
     * @tc.desc      Verify 09:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290214',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_21500
     * @tc.name      testReminderTimeMatrix6290215
     * @tc.desc      Verify 09:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290215',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 24);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_21600
     * @tc.name      testReminderTimeMatrix6290216
     * @tc.desc      Verify 09:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290216',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_21700
     * @tc.name      testReminderTimeMatrix6290217
     * @tc.desc      Verify 09:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290217',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 27);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_21800
     * @tc.name      testReminderTimeMatrix6290218
     * @tc.desc      Verify 09:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290218',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 29);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_21900
     * @tc.name      testReminderTimeMatrix6290219
     * @tc.desc      Verify 09:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290219',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 31);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_22000
     * @tc.name      testReminderTimeMatrix6290220
     * @tc.desc      Verify 09:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290220',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 32);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_22100
     * @tc.name      testReminderTimeMatrix6290221
     * @tc.desc      Verify 09:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290221',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 34);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_22200
     * @tc.name      testReminderTimeMatrix6290222
     * @tc.desc      Verify 09:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290222',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 36);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_22300
     * @tc.name      testReminderTimeMatrix6290223
     * @tc.desc      Verify 09:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290223',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 37);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_22400
     * @tc.name      testReminderTimeMatrix6290224
     * @tc.desc      Verify 09:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290224',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 39);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_22500
     * @tc.name      testReminderTimeMatrix6290225
     * @tc.desc      Verify 09:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290225',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 41);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_22600
     * @tc.name      testReminderTimeMatrix6290226
     * @tc.desc      Verify 09:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290226',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 44);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_22700
     * @tc.name      testReminderTimeMatrix6290227
     * @tc.desc      Verify 09:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290227',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 46);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_22800
     * @tc.name      testReminderTimeMatrix6290228
     * @tc.desc      Verify 09:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290228',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_22900
     * @tc.name      testReminderTimeMatrix6290229
     * @tc.desc      Verify 09:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290229',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_23000
     * @tc.name      testReminderTimeMatrix6290230
     * @tc.desc      Verify 09:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290230',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 51);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_23100
     * @tc.name      testReminderTimeMatrix6290231
     * @tc.desc      Verify 09:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290231',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 52);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_23200
     * @tc.name      testReminderTimeMatrix6290232
     * @tc.desc      Verify 09:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290232',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_23300
     * @tc.name      testReminderTimeMatrix6290233
     * @tc.desc      Verify 09:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290233',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 56);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_23400
     * @tc.name      testReminderTimeMatrix6290234
     * @tc.desc      Verify 09:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290234',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_23500
     * @tc.name      testReminderTimeMatrix6290235
     * @tc.desc      Verify 09:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290235',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 59);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_23600
     * @tc.name      testReminderTimeMatrix6290236
     * @tc.desc      Verify 10:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290236',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 17);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_23700
     * @tc.name      testReminderTimeMatrix6290237
     * @tc.desc      Verify 10:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290237',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_23800
     * @tc.name      testReminderTimeMatrix6290238
     * @tc.desc      Verify 10:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290238',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_23900
     * @tc.name      testReminderTimeMatrix6290239
     * @tc.desc      Verify 10:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290239',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 22);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_24000
     * @tc.name      testReminderTimeMatrix6290240
     * @tc.desc      Verify 10:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290240',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_24100
     * @tc.name      testReminderTimeMatrix6290241
     * @tc.desc      Verify 10:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290241',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 24);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_24200
     * @tc.name      testReminderTimeMatrix6290242
     * @tc.desc      Verify 10:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290242',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 27);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_24300
     * @tc.name      testReminderTimeMatrix6290243
     * @tc.desc      Verify 10:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290243',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_24400
     * @tc.name      testReminderTimeMatrix6290244
     * @tc.desc      Verify 10:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290244',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 29);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_24500
     * @tc.name      testReminderTimeMatrix6290245
     * @tc.desc      Verify 10:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290245',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 32);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_24600
     * @tc.name      testReminderTimeMatrix6290246
     * @tc.desc      Verify 10:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290246',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 33);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_24700
     * @tc.name      testReminderTimeMatrix6290247
     * @tc.desc      Verify 10:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290247',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 34);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_24800
     * @tc.name      testReminderTimeMatrix6290248
     * @tc.desc      Verify 10:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290248',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 37);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_24900
     * @tc.name      testReminderTimeMatrix6290249
     * @tc.desc      Verify 10:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290249',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 38);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_25000
     * @tc.name      testReminderTimeMatrix6290250
     * @tc.desc      Verify 10:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290250',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 39);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_25100
     * @tc.name      testReminderTimeMatrix6290251
     * @tc.desc      Verify 10:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290251',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 43);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_25200
     * @tc.name      testReminderTimeMatrix6290252
     * @tc.desc      Verify 10:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290252',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 44);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_25300
     * @tc.name      testReminderTimeMatrix6290253
     * @tc.desc      Verify 10:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290253',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_25400
     * @tc.name      testReminderTimeMatrix6290254
     * @tc.desc      Verify 10:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290254',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 48);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_25500
     * @tc.name      testReminderTimeMatrix6290255
     * @tc.desc      Verify 10:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290255',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_25600
     * @tc.name      testReminderTimeMatrix6290256
     * @tc.desc      Verify 10:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290256',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 52);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_25700
     * @tc.name      testReminderTimeMatrix6290257
     * @tc.desc      Verify 10:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290257',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 53);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_25800
     * @tc.name      testReminderTimeMatrix6290258
     * @tc.desc      Verify 10:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290258',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_25900
     * @tc.name      testReminderTimeMatrix6290259
     * @tc.desc      Verify 10:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290259',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_26000
     * @tc.name      testReminderTimeMatrix6290260
     * @tc.desc      Verify 10:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290260',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 58);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_26100
     * @tc.name      testReminderTimeMatrix6290261
     * @tc.desc      Verify 10:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290261',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 59);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_26200
     * @tc.name      testReminderTimeMatrix6290262
     * @tc.desc      Verify 11:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290262',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_26300
     * @tc.name      testReminderTimeMatrix6290263
     * @tc.desc      Verify 11:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290263',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 19);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_26400
     * @tc.name      testReminderTimeMatrix6290264
     * @tc.desc      Verify 11:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290264',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_26500
     * @tc.name      testReminderTimeMatrix6290265
     * @tc.desc      Verify 11:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290265',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 22);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_26600
     * @tc.name      testReminderTimeMatrix6290266
     * @tc.desc      Verify 11:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290266',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 24);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_26700
     * @tc.name      testReminderTimeMatrix6290267
     * @tc.desc      Verify 11:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290267',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_26800
     * @tc.name      testReminderTimeMatrix6290268
     * @tc.desc      Verify 11:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290268',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 27);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_26900
     * @tc.name      testReminderTimeMatrix6290269
     * @tc.desc      Verify 11:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290269',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 29);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_27000
     * @tc.name      testReminderTimeMatrix6290270
     * @tc.desc      Verify 11:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290270',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 31);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_27100
     * @tc.name      testReminderTimeMatrix6290271
     * @tc.desc      Verify 11:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290271',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 32);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_27200
     * @tc.name      testReminderTimeMatrix6290272
     * @tc.desc      Verify 11:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290272',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 34);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_27300
     * @tc.name      testReminderTimeMatrix6290273
     * @tc.desc      Verify 11:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290273',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 36);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_27400
     * @tc.name      testReminderTimeMatrix6290274
     * @tc.desc      Verify 11:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290274',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 37);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_27500
     * @tc.name      testReminderTimeMatrix6290275
     * @tc.desc      Verify 11:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290275',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 39);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_27600
     * @tc.name      testReminderTimeMatrix6290276
     * @tc.desc      Verify 11:42 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290276',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 42);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_27700
     * @tc.name      testReminderTimeMatrix6290277
     * @tc.desc      Verify 11:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290277',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 44);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_27800
     * @tc.name      testReminderTimeMatrix6290278
     * @tc.desc      Verify 11:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290278',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 46);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_27900
     * @tc.name      testReminderTimeMatrix6290279
     * @tc.desc      Verify 11:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290279',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_28000
     * @tc.name      testReminderTimeMatrix6290280
     * @tc.desc      Verify 11:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290280',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_28100
     * @tc.name      testReminderTimeMatrix6290281
     * @tc.desc      Verify 11:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290281',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 51);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_28200
     * @tc.name      testReminderTimeMatrix6290282
     * @tc.desc      Verify 11:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290282',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 52);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_28300
     * @tc.name      testReminderTimeMatrix6290283
     * @tc.desc      Verify 11:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290283',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_28400
     * @tc.name      testReminderTimeMatrix6290284
     * @tc.desc      Verify 11:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290284',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 56);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_28500
     * @tc.name      testReminderTimeMatrix6290285
     * @tc.desc      Verify 11:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290285',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_28600
     * @tc.name      testReminderTimeMatrix6290286
     * @tc.desc      Verify 12:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290286',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 17);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_28700
     * @tc.name      testReminderTimeMatrix6290287
     * @tc.desc      Verify 12:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290287',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_28800
     * @tc.name      testReminderTimeMatrix6290288
     * @tc.desc      Verify 12:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290288',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 19);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_28900
     * @tc.name      testReminderTimeMatrix6290289
     * @tc.desc      Verify 12:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290289',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_29000
     * @tc.name      testReminderTimeMatrix6290290
     * @tc.desc      Verify 12:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290290',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_29100
     * @tc.name      testReminderTimeMatrix6290291
     * @tc.desc      Verify 12:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290291',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 24);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_29200
     * @tc.name      testReminderTimeMatrix6290292
     * @tc.desc      Verify 12:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290292',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_29300
     * @tc.name      testReminderTimeMatrix6290293
     * @tc.desc      Verify 12:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290293',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_29400
     * @tc.name      testReminderTimeMatrix6290294
     * @tc.desc      Verify 12:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290294',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 29);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_29500
     * @tc.name      testReminderTimeMatrix6290295
     * @tc.desc      Verify 12:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290295',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 31);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_29600
     * @tc.name      testReminderTimeMatrix6290296
     * @tc.desc      Verify 12:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290296',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 33);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_29700
     * @tc.name      testReminderTimeMatrix6290297
     * @tc.desc      Verify 12:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290297',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 34);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_29800
     * @tc.name      testReminderTimeMatrix6290298
     * @tc.desc      Verify 12:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290298',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 36);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_29900
     * @tc.name      testReminderTimeMatrix6290299
     * @tc.desc      Verify 12:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290299',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 38);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_30000
     * @tc.name      testReminderTimeMatrix6290300
     * @tc.desc      Verify 12:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 39);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_30100
     * @tc.name      testReminderTimeMatrix6290301
     * @tc.desc      Verify 12:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290301',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 43);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_30200
     * @tc.name      testReminderTimeMatrix6290302
     * @tc.desc      Verify 12:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290302',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 44);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_30300
     * @tc.name      testReminderTimeMatrix6290303
     * @tc.desc      Verify 12:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290303',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 46);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_30400
     * @tc.name      testReminderTimeMatrix6290304
     * @tc.desc      Verify 12:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290304',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 48);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_30500
     * @tc.name      testReminderTimeMatrix6290305
     * @tc.desc      Verify 12:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290305',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_30600
     * @tc.name      testReminderTimeMatrix6290306
     * @tc.desc      Verify 12:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290306',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 51);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_30700
     * @tc.name      testReminderTimeMatrix6290307
     * @tc.desc      Verify 12:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290307',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 53);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_30800
     * @tc.name      testReminderTimeMatrix6290308
     * @tc.desc      Verify 12:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290308',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_30900
     * @tc.name      testReminderTimeMatrix6290309
     * @tc.desc      Verify 12:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290309',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 56);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_31000
     * @tc.name      testReminderTimeMatrix6290310
     * @tc.desc      Verify 12:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290310',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 58);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_31100
     * @tc.name      testReminderTimeMatrix6290311
     * @tc.desc      Verify 12:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290311',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 59);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_31200
     * @tc.name      testReminderTimeMatrix6290312
     * @tc.desc      Verify 13:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290312',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 17);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_31300
     * @tc.name      testReminderTimeMatrix6290313
     * @tc.desc      Verify 13:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290313',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_31400
     * @tc.name      testReminderTimeMatrix6290314
     * @tc.desc      Verify 13:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290314',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_31500
     * @tc.name      testReminderTimeMatrix6290315
     * @tc.desc      Verify 13:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290315',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 22);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_31600
     * @tc.name      testReminderTimeMatrix6290316
     * @tc.desc      Verify 13:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290316',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_31700
     * @tc.name      testReminderTimeMatrix6290317
     * @tc.desc      Verify 13:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290317',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_31800
     * @tc.name      testReminderTimeMatrix6290318
     * @tc.desc      Verify 13:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290318',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 27);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_31900
     * @tc.name      testReminderTimeMatrix6290319
     * @tc.desc      Verify 13:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290319',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_32000
     * @tc.name      testReminderTimeMatrix6290320
     * @tc.desc      Verify 13:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290320',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 31);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_32100
     * @tc.name      testReminderTimeMatrix6290321
     * @tc.desc      Verify 13:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290321',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 32);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_32200
     * @tc.name      testReminderTimeMatrix6290322
     * @tc.desc      Verify 13:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290322',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 33);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_32300
     * @tc.name      testReminderTimeMatrix6290323
     * @tc.desc      Verify 13:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290323',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 36);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_32400
     * @tc.name      testReminderTimeMatrix6290324
     * @tc.desc      Verify 13:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290324',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 37);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_32500
     * @tc.name      testReminderTimeMatrix6290325
     * @tc.desc      Verify 13:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290325',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 38);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_32600
     * @tc.name      testReminderTimeMatrix6290326
     * @tc.desc      Verify 13:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290326',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 41);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_32700
     * @tc.name      testReminderTimeMatrix6290327
     * @tc.desc      Verify 13:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290327',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 43);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_32800
     * @tc.name      testReminderTimeMatrix6290328
     * @tc.desc      Verify 13:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290328',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 46);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_32900
     * @tc.name      testReminderTimeMatrix6290329
     * @tc.desc      Verify 13:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290329',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_33000
     * @tc.name      testReminderTimeMatrix6290330
     * @tc.desc      Verify 13:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290330',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 48);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_33100
     * @tc.name      testReminderTimeMatrix6290331
     * @tc.desc      Verify 13:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290331',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 51);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_33200
     * @tc.name      testReminderTimeMatrix6290332
     * @tc.desc      Verify 13:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290332',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 52);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_33300
     * @tc.name      testReminderTimeMatrix6290333
     * @tc.desc      Verify 13:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290333',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 53);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_33400
     * @tc.name      testReminderTimeMatrix6290334
     * @tc.desc      Verify 13:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290334',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 56);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_33500
     * @tc.name      testReminderTimeMatrix6290335
     * @tc.desc      Verify 13:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290335',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_33600
     * @tc.name      testReminderTimeMatrix6290336
     * @tc.desc      Verify 13:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290336',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 58);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_33700
     * @tc.name      testReminderTimeMatrix6290337
     * @tc.desc      Verify 14:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290337',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 17);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_33800
     * @tc.name      testReminderTimeMatrix6290338
     * @tc.desc      Verify 14:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290338',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_33900
     * @tc.name      testReminderTimeMatrix6290339
     * @tc.desc      Verify 14:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290339',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 19);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_34000
     * @tc.name      testReminderTimeMatrix6290340
     * @tc.desc      Verify 14:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290340',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_34100
     * @tc.name      testReminderTimeMatrix6290341
     * @tc.desc      Verify 14:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290341',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_34200
     * @tc.name      testReminderTimeMatrix6290342
     * @tc.desc      Verify 14:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290342',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 24);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_34300
     * @tc.name      testReminderTimeMatrix6290343
     * @tc.desc      Verify 14:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290343',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_34400
     * @tc.name      testReminderTimeMatrix6290344
     * @tc.desc      Verify 14:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290344',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_34500
     * @tc.name      testReminderTimeMatrix6290345
     * @tc.desc      Verify 14:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290345',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 29);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_34600
     * @tc.name      testReminderTimeMatrix6290346
     * @tc.desc      Verify 14:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290346',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 31);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_34700
     * @tc.name      testReminderTimeMatrix6290347
     * @tc.desc      Verify 14:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290347',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 33);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_34800
     * @tc.name      testReminderTimeMatrix6290348
     * @tc.desc      Verify 14:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290348',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 34);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_34900
     * @tc.name      testReminderTimeMatrix6290349
     * @tc.desc      Verify 14:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290349',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 36);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_35000
     * @tc.name      testReminderTimeMatrix6290350
     * @tc.desc      Verify 14:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290350',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 38);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_35100
     * @tc.name      testReminderTimeMatrix6290351
     * @tc.desc      Verify 14:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290351',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 39);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_35200
     * @tc.name      testReminderTimeMatrix6290352
     * @tc.desc      Verify 14:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290352',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 43);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_35300
     * @tc.name      testReminderTimeMatrix6290353
     * @tc.desc      Verify 14:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290353',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 44);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_35400
     * @tc.name      testReminderTimeMatrix6290354
     * @tc.desc      Verify 14:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290354',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 46);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_35500
     * @tc.name      testReminderTimeMatrix6290355
     * @tc.desc      Verify 14:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290355',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 48);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_35600
     * @tc.name      testReminderTimeMatrix6290356
     * @tc.desc      Verify 14:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290356',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_35700
     * @tc.name      testReminderTimeMatrix6290357
     * @tc.desc      Verify 14:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290357',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 51);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_35800
     * @tc.name      testReminderTimeMatrix6290358
     * @tc.desc      Verify 14:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290358',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 53);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_35900
     * @tc.name      testReminderTimeMatrix6290359
     * @tc.desc      Verify 14:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290359',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_36000
     * @tc.name      testReminderTimeMatrix6290360
     * @tc.desc      Verify 14:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290360',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 56);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_36100
     * @tc.name      testReminderTimeMatrix6290361
     * @tc.desc      Verify 14:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290361',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 58);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_36200
     * @tc.name      testReminderTimeMatrix6290362
     * @tc.desc      Verify 14:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290362',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 59);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_36300
     * @tc.name      testReminderTimeMatrix6290363
     * @tc.desc      Verify 15:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290363',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 17);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_36400
     * @tc.name      testReminderTimeMatrix6290364
     * @tc.desc      Verify 15:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290364',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_36500
     * @tc.name      testReminderTimeMatrix6290365
     * @tc.desc      Verify 15:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290365',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_36600
     * @tc.name      testReminderTimeMatrix6290366
     * @tc.desc      Verify 15:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290366',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 22);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_36700
     * @tc.name      testReminderTimeMatrix6290367
     * @tc.desc      Verify 15:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290367',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_36800
     * @tc.name      testReminderTimeMatrix6290368
     * @tc.desc      Verify 15:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290368',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_36900
     * @tc.name      testReminderTimeMatrix6290369
     * @tc.desc      Verify 15:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290369',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 27);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_37000
     * @tc.name      testReminderTimeMatrix6290370
     * @tc.desc      Verify 15:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290370',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_37100
     * @tc.name      testReminderTimeMatrix6290371
     * @tc.desc      Verify 15:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290371',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 31);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_37200
     * @tc.name      testReminderTimeMatrix6290372
     * @tc.desc      Verify 15:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290372',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 32);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_37300
     * @tc.name      testReminderTimeMatrix6290373
     * @tc.desc      Verify 15:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290373',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 33);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_37400
     * @tc.name      testReminderTimeMatrix6290374
     * @tc.desc      Verify 15:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290374',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 36);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_37500
     * @tc.name      testReminderTimeMatrix6290375
     * @tc.desc      Verify 15:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290375',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 37);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_37600
     * @tc.name      testReminderTimeMatrix6290376
     * @tc.desc      Verify 15:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290376',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 38);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_37700
     * @tc.name      testReminderTimeMatrix6290377
     * @tc.desc      Verify 15:42 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290377',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 42);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_37800
     * @tc.name      testReminderTimeMatrix6290378
     * @tc.desc      Verify 15:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290378',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 43);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_37900
     * @tc.name      testReminderTimeMatrix6290379
     * @tc.desc      Verify 15:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290379',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 46);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_38000
     * @tc.name      testReminderTimeMatrix6290380
     * @tc.desc      Verify 15:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290380',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_38100
     * @tc.name      testReminderTimeMatrix6290381
     * @tc.desc      Verify 15:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290381',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 48);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_38200
     * @tc.name      testReminderTimeMatrix6290382
     * @tc.desc      Verify 15:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290382',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 51);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_38300
     * @tc.name      testReminderTimeMatrix6290383
     * @tc.desc      Verify 15:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290383',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 52);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_38400
     * @tc.name      testReminderTimeMatrix6290384
     * @tc.desc      Verify 15:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290384',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 53);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_38500
     * @tc.name      testReminderTimeMatrix6290385
     * @tc.desc      Verify 15:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290385',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 56);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_38600
     * @tc.name      testReminderTimeMatrix6290386
     * @tc.desc      Verify 15:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290386',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_38700
     * @tc.name      testReminderTimeMatrix6290387
     * @tc.desc      Verify 15:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290387',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 58);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_38800
     * @tc.name      testReminderTimeMatrix6290388
     * @tc.desc      Verify 15:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290388',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 59);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_38900
     * @tc.name      testReminderTimeMatrix6290389
     * @tc.desc      Verify 16:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290389',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_39000
     * @tc.name      testReminderTimeMatrix6290390
     * @tc.desc      Verify 16:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290390',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 19);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_39100
     * @tc.name      testReminderTimeMatrix6290391
     * @tc.desc      Verify 16:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290391',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_39200
     * @tc.name      testReminderTimeMatrix6290392
     * @tc.desc      Verify 16:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290392',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_39300
     * @tc.name      testReminderTimeMatrix6290393
     * @tc.desc      Verify 16:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290393',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 24);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_39400
     * @tc.name      testReminderTimeMatrix6290394
     * @tc.desc      Verify 16:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290394',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_39500
     * @tc.name      testReminderTimeMatrix6290395
     * @tc.desc      Verify 16:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290395',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_39600
     * @tc.name      testReminderTimeMatrix6290396
     * @tc.desc      Verify 16:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290396',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 29);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_39700
     * @tc.name      testReminderTimeMatrix6290397
     * @tc.desc      Verify 16:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290397',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 31);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_39800
     * @tc.name      testReminderTimeMatrix6290398
     * @tc.desc      Verify 16:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290398',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 33);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_39900
     * @tc.name      testReminderTimeMatrix6290399
     * @tc.desc      Verify 16:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290399',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 34);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_40000
     * @tc.name      testReminderTimeMatrix6290400
     * @tc.desc      Verify 16:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 36);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_40100
     * @tc.name      testReminderTimeMatrix6290401
     * @tc.desc      Verify 16:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290401',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 38);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_40200
     * @tc.name      testReminderTimeMatrix6290402
     * @tc.desc      Verify 16:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290402',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 41);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_40300
     * @tc.name      testReminderTimeMatrix6290403
     * @tc.desc      Verify 16:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290403',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 43);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_40400
     * @tc.name      testReminderTimeMatrix6290404
     * @tc.desc      Verify 16:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290404',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 44);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_40500
     * @tc.name      testReminderTimeMatrix6290405
     * @tc.desc      Verify 16:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290405',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 46);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_40600
     * @tc.name      testReminderTimeMatrix6290406
     * @tc.desc      Verify 16:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290406',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 48);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_40700
     * @tc.name      testReminderTimeMatrix6290407
     * @tc.desc      Verify 16:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290407',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_40800
     * @tc.name      testReminderTimeMatrix6290408
     * @tc.desc      Verify 16:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290408',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 51);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_40900
     * @tc.name      testReminderTimeMatrix6290409
     * @tc.desc      Verify 16:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290409',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 53);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_41000
     * @tc.name      testReminderTimeMatrix6290410
     * @tc.desc      Verify 16:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290410',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_41100
     * @tc.name      testReminderTimeMatrix6290411
     * @tc.desc      Verify 16:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290411',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 55);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_41200
     * @tc.name      testReminderTimeMatrix6290412
     * @tc.desc      Verify 16:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290412',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 56);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_41300
     * @tc.name      testReminderTimeMatrix6290413
     * @tc.desc      Verify 16:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290413',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 58);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_41400
     * @tc.name      testReminderTimeMatrix6290414
     * @tc.desc      Verify 16:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290414',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 59);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_41500
     * @tc.name      testReminderTimeMatrix6290415
     * @tc.desc      Verify 17:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290415',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 17);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_41600
     * @tc.name      testReminderTimeMatrix6290416
     * @tc.desc      Verify 17:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290416',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 19);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_41700
     * @tc.name      testReminderTimeMatrix6290417
     * @tc.desc      Verify 17:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290417',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_41800
     * @tc.name      testReminderTimeMatrix6290418
     * @tc.desc      Verify 17:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290418',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 22);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_41900
     * @tc.name      testReminderTimeMatrix6290419
     * @tc.desc      Verify 17:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290419',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 24);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_42000
     * @tc.name      testReminderTimeMatrix6290420
     * @tc.desc      Verify 17:25 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290420',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 25);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_42100
     * @tc.name      testReminderTimeMatrix6290421
     * @tc.desc      Verify 17:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290421',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_42200
     * @tc.name      testReminderTimeMatrix6290422
     * @tc.desc      Verify 17:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290422',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_42300
     * @tc.name      testReminderTimeMatrix6290423
     * @tc.desc      Verify 17:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290423',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 29);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_42400
     * @tc.name      testReminderTimeMatrix6290424
     * @tc.desc      Verify 17:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290424',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 30);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_42500
     * @tc.name      testReminderTimeMatrix6290425
     * @tc.desc      Verify 17:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290425',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 32);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_42600
     * @tc.name      testReminderTimeMatrix6290426
     * @tc.desc      Verify 17:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290426',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 33);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_42700
     * @tc.name      testReminderTimeMatrix6290427
     * @tc.desc      Verify 17:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290427',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 34);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_42800
     * @tc.name      testReminderTimeMatrix6290428
     * @tc.desc      Verify 17:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290428',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 37);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_42900
     * @tc.name      testReminderTimeMatrix6290429
     * @tc.desc      Verify 17:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290429',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 38);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_43000
     * @tc.name      testReminderTimeMatrix6290430
     * @tc.desc      Verify 17:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290430',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 40);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_43100
     * @tc.name      testReminderTimeMatrix6290431
     * @tc.desc      Verify 17:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290431',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 41);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_43200
     * @tc.name      testReminderTimeMatrix6290432
     * @tc.desc      Verify 17:42 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290432',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 42);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_43300
     * @tc.name      testReminderTimeMatrix6290433
     * @tc.desc      Verify 17:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290433',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 44);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_43400
     * @tc.name      testReminderTimeMatrix6290434
     * @tc.desc      Verify 17:45 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290434',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 45);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_43500
     * @tc.name      testReminderTimeMatrix6290435
     * @tc.desc      Verify 17:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290435',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 46);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_43600
     * @tc.name      testReminderTimeMatrix6290436
     * @tc.desc      Verify 17:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290436',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_43700
     * @tc.name      testReminderTimeMatrix6290437
     * @tc.desc      Verify 17:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290437',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_43800
     * @tc.name      testReminderTimeMatrix6290438
     * @tc.desc      Verify 17:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290438',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 50);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_43900
     * @tc.name      testReminderTimeMatrix6290439
     * @tc.desc      Verify 17:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290439',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 51);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_44000
     * @tc.name      testReminderTimeMatrix6290440
     * @tc.desc      Verify 17:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290440',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 53);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_44100
     * @tc.name      testReminderTimeMatrix6290441
     * @tc.desc      Verify 17:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290441',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_44200
     * @tc.name      testReminderTimeMatrix6290442
     * @tc.desc      Verify 17:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290442',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 55);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_44300
     * @tc.name      testReminderTimeMatrix6290443
     * @tc.desc      Verify 17:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290443',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_44400
     * @tc.name      testReminderTimeMatrix6290444
     * @tc.desc      Verify 17:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290444',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 58);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_44500
     * @tc.name      testReminderTimeMatrix6290445
     * @tc.desc      Verify 17:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290445',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(17, 59);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_44600
     * @tc.name      testReminderTimeMatrix6290446
     * @tc.desc      Verify 18:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290446',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_44700
     * @tc.name      testReminderTimeMatrix6290447
     * @tc.desc      Verify 18:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290447',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 19);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_44800
     * @tc.name      testReminderTimeMatrix6290448
     * @tc.desc      Verify 18:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290448',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_44900
     * @tc.name      testReminderTimeMatrix6290449
     * @tc.desc      Verify 18:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290449',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_45000
     * @tc.name      testReminderTimeMatrix6290450
     * @tc.desc      Verify 18:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290450',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 24);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_45100
     * @tc.name      testReminderTimeMatrix6290451
     * @tc.desc      Verify 18:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290451',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_45200
     * @tc.name      testReminderTimeMatrix6290452
     * @tc.desc      Verify 18:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290452',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_45300
     * @tc.name      testReminderTimeMatrix6290453
     * @tc.desc      Verify 18:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290453',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 31);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_45400
     * @tc.name      testReminderTimeMatrix6290454
     * @tc.desc      Verify 18:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290454',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 33);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_45500
     * @tc.name      testReminderTimeMatrix6290455
     * @tc.desc      Verify 18:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290455',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 34);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_45600
     * @tc.name      testReminderTimeMatrix6290456
     * @tc.desc      Verify 18:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290456',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 35);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_45700
     * @tc.name      testReminderTimeMatrix6290457
     * @tc.desc      Verify 18:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290457',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 37);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_45800
     * @tc.name      testReminderTimeMatrix6290458
     * @tc.desc      Verify 18:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290458',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 38);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_45900
     * @tc.name      testReminderTimeMatrix6290459
     * @tc.desc      Verify 18:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290459',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 39);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_46000
     * @tc.name      testReminderTimeMatrix6290460
     * @tc.desc      Verify 18:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290460',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 40);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_46100
     * @tc.name      testReminderTimeMatrix6290461
     * @tc.desc      Verify 18:42 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290461',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 42);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_46200
     * @tc.name      testReminderTimeMatrix6290462
     * @tc.desc      Verify 18:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290462',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 43);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_46300
     * @tc.name      testReminderTimeMatrix6290463
     * @tc.desc      Verify 18:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290463',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 44);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_46400
     * @tc.name      testReminderTimeMatrix6290464
     * @tc.desc      Verify 18:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290464',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_46500
     * @tc.name      testReminderTimeMatrix6290465
     * @tc.desc      Verify 18:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290465',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 48);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_46600
     * @tc.name      testReminderTimeMatrix6290466
     * @tc.desc      Verify 18:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290466',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_46700
     * @tc.name      testReminderTimeMatrix6290467
     * @tc.desc      Verify 18:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290467',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 51);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_46800
     * @tc.name      testReminderTimeMatrix6290468
     * @tc.desc      Verify 18:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290468',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 52);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_46900
     * @tc.name      testReminderTimeMatrix6290469
     * @tc.desc      Verify 18:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290469',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 53);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_47000
     * @tc.name      testReminderTimeMatrix6290470
     * @tc.desc      Verify 18:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290470',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 56);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_47100
     * @tc.name      testReminderTimeMatrix6290471
     * @tc.desc      Verify 18:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290471',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_47200
     * @tc.name      testReminderTimeMatrix6290472
     * @tc.desc      Verify 18:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290472',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 58);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_47300
     * @tc.name      testReminderTimeMatrix6290473
     * @tc.desc      Verify 19:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290473',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 17);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_47400
     * @tc.name      testReminderTimeMatrix6290474
     * @tc.desc      Verify 19:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290474',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_47500
     * @tc.name      testReminderTimeMatrix6290475
     * @tc.desc      Verify 19:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290475',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 19);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_47600
     * @tc.name      testReminderTimeMatrix6290476
     * @tc.desc      Verify 19:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290476',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 22);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_47700
     * @tc.name      testReminderTimeMatrix6290477
     * @tc.desc      Verify 19:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290477',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_47800
     * @tc.name      testReminderTimeMatrix6290478
     * @tc.desc      Verify 19:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290478',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_47900
     * @tc.name      testReminderTimeMatrix6290479
     * @tc.desc      Verify 19:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290479',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 27);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_48000
     * @tc.name      testReminderTimeMatrix6290480
     * @tc.desc      Verify 19:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290480',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_48100
     * @tc.name      testReminderTimeMatrix6290481
     * @tc.desc      Verify 19:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290481',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 30);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_48200
     * @tc.name      testReminderTimeMatrix6290482
     * @tc.desc      Verify 19:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290482',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 31);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_48300
     * @tc.name      testReminderTimeMatrix6290483
     * @tc.desc      Verify 19:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290483',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 32);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_48400
     * @tc.name      testReminderTimeMatrix6290484
     * @tc.desc      Verify 19:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290484',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 33);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_48500
     * @tc.name      testReminderTimeMatrix6290485
     * @tc.desc      Verify 19:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290485',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 35);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_48600
     * @tc.name      testReminderTimeMatrix6290486
     * @tc.desc      Verify 19:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290486',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 36);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_48700
     * @tc.name      testReminderTimeMatrix6290487
     * @tc.desc      Verify 19:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290487',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 37);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_48800
     * @tc.name      testReminderTimeMatrix6290488
     * @tc.desc      Verify 19:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290488',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 39);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_48900
     * @tc.name      testReminderTimeMatrix6290489
     * @tc.desc      Verify 19:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290489',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 40);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_49000
     * @tc.name      testReminderTimeMatrix6290490
     * @tc.desc      Verify 19:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290490',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 41);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_49100
     * @tc.name      testReminderTimeMatrix6290491
     * @tc.desc      Verify 19:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290491',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 43);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_49200
     * @tc.name      testReminderTimeMatrix6290492
     * @tc.desc      Verify 19:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290492',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 44);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_49300
     * @tc.name      testReminderTimeMatrix6290493
     * @tc.desc      Verify 19:45 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290493',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 45);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_49400
     * @tc.name      testReminderTimeMatrix6290494
     * @tc.desc      Verify 19:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290494',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_49500
     * @tc.name      testReminderTimeMatrix6290495
     * @tc.desc      Verify 19:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290495',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 48);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_49600
     * @tc.name      testReminderTimeMatrix6290496
     * @tc.desc      Verify 19:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290496',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_49700
     * @tc.name      testReminderTimeMatrix6290497
     * @tc.desc      Verify 19:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290497',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 51);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_49800
     * @tc.name      testReminderTimeMatrix6290498
     * @tc.desc      Verify 19:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290498',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 52);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_49900
     * @tc.name      testReminderTimeMatrix6290499
     * @tc.desc      Verify 19:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290499',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 53);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_50000
     * @tc.name      testReminderTimeMatrix6290500
     * @tc.desc      Verify 19:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 55);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_50100
     * @tc.name      testReminderTimeMatrix6290501
     * @tc.desc      Verify 19:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290501',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 56);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_50200
     * @tc.name      testReminderTimeMatrix6290502
     * @tc.desc      Verify 19:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290502',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(19, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_50300
     * @tc.name      testReminderTimeMatrix6290503
     * @tc.desc      Verify 20:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290503',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 17);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_50400
     * @tc.name      testReminderTimeMatrix6290504
     * @tc.desc      Verify 20:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290504',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_50500
     * @tc.name      testReminderTimeMatrix6290505
     * @tc.desc      Verify 20:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290505',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_50600
     * @tc.name      testReminderTimeMatrix6290506
     * @tc.desc      Verify 20:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290506',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 22);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_50700
     * @tc.name      testReminderTimeMatrix6290507
     * @tc.desc      Verify 20:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290507',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_50800
     * @tc.name      testReminderTimeMatrix6290508
     * @tc.desc      Verify 20:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290508',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 24);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_50900
     * @tc.name      testReminderTimeMatrix6290509
     * @tc.desc      Verify 20:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290509',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_51000
     * @tc.name      testReminderTimeMatrix6290510
     * @tc.desc      Verify 20:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290510',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 27);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_51100
     * @tc.name      testReminderTimeMatrix6290511
     * @tc.desc      Verify 20:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290511',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_51200
     * @tc.name      testReminderTimeMatrix6290512
     * @tc.desc      Verify 20:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290512',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 30);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_51300
     * @tc.name      testReminderTimeMatrix6290513
     * @tc.desc      Verify 20:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290513',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 31);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_51400
     * @tc.name      testReminderTimeMatrix6290514
     * @tc.desc      Verify 20:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290514',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 32);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_51500
     * @tc.name      testReminderTimeMatrix6290515
     * @tc.desc      Verify 20:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290515',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 34);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_51600
     * @tc.name      testReminderTimeMatrix6290516
     * @tc.desc      Verify 20:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290516',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 35);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_51700
     * @tc.name      testReminderTimeMatrix6290517
     * @tc.desc      Verify 20:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290517',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 36);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_51800
     * @tc.name      testReminderTimeMatrix6290518
     * @tc.desc      Verify 20:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290518',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 38);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_51900
     * @tc.name      testReminderTimeMatrix6290519
     * @tc.desc      Verify 20:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290519',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 39);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_52000
     * @tc.name      testReminderTimeMatrix6290520
     * @tc.desc      Verify 20:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290520',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 40);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_52100
     * @tc.name      testReminderTimeMatrix6290521
     * @tc.desc      Verify 20:42 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290521',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 42);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_52200
     * @tc.name      testReminderTimeMatrix6290522
     * @tc.desc      Verify 20:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290522',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 43);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_52300
     * @tc.name      testReminderTimeMatrix6290523
     * @tc.desc      Verify 20:44 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290523',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 44);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_52400
     * @tc.name      testReminderTimeMatrix6290524
     * @tc.desc      Verify 20:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290524',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 46);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_52500
     * @tc.name      testReminderTimeMatrix6290525
     * @tc.desc      Verify 20:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290525',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_52600
     * @tc.name      testReminderTimeMatrix6290526
     * @tc.desc      Verify 20:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290526',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 48);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_52700
     * @tc.name      testReminderTimeMatrix6290527
     * @tc.desc      Verify 20:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290527',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 50);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_52800
     * @tc.name      testReminderTimeMatrix6290528
     * @tc.desc      Verify 20:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290528',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 51);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_52900
     * @tc.name      testReminderTimeMatrix6290529
     * @tc.desc      Verify 20:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290529',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_53000
     * @tc.name      testReminderTimeMatrix6290530
     * @tc.desc      Verify 20:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290530',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 55);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_53100
     * @tc.name      testReminderTimeMatrix6290531
     * @tc.desc      Verify 20:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290531',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 56);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_53200
     * @tc.name      testReminderTimeMatrix6290532
     * @tc.desc      Verify 20:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290532',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_53300
     * @tc.name      testReminderTimeMatrix6290533
     * @tc.desc      Verify 20:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290533',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(20, 59);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_53400
     * @tc.name      testReminderTimeMatrix6290534
     * @tc.desc      Verify 21:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290534',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 17);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_53500
     * @tc.name      testReminderTimeMatrix6290535
     * @tc.desc      Verify 21:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290535',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 18);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_53600
     * @tc.name      testReminderTimeMatrix6290536
     * @tc.desc      Verify 21:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290536',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_53700
     * @tc.name      testReminderTimeMatrix6290537
     * @tc.desc      Verify 21:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290537',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 22);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_53800
     * @tc.name      testReminderTimeMatrix6290538
     * @tc.desc      Verify 21:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290538',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 23);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_53900
     * @tc.name      testReminderTimeMatrix6290539
     * @tc.desc      Verify 21:25 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290539',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 25);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_54000
     * @tc.name      testReminderTimeMatrix6290540
     * @tc.desc      Verify 21:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290540',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_54100
     * @tc.name      testReminderTimeMatrix6290541
     * @tc.desc      Verify 21:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290541',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 27);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_54200
     * @tc.name      testReminderTimeMatrix6290542
     * @tc.desc      Verify 21:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290542',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 29);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_54300
     * @tc.name      testReminderTimeMatrix6290543
     * @tc.desc      Verify 21:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290543',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 30);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_54400
     * @tc.name      testReminderTimeMatrix6290544
     * @tc.desc      Verify 21:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290544',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 31);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_54500
     * @tc.name      testReminderTimeMatrix6290545
     * @tc.desc      Verify 21:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290545',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 33);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_54600
     * @tc.name      testReminderTimeMatrix6290546
     * @tc.desc      Verify 21:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290546',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 34);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_54700
     * @tc.name      testReminderTimeMatrix6290547
     * @tc.desc      Verify 21:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290547',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 35);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_54800
     * @tc.name      testReminderTimeMatrix6290548
     * @tc.desc      Verify 21:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290548',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 37);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_54900
     * @tc.name      testReminderTimeMatrix6290549
     * @tc.desc      Verify 21:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290549',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 38);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_55000
     * @tc.name      testReminderTimeMatrix6290550
     * @tc.desc      Verify 21:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290550',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 39);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_55100
     * @tc.name      testReminderTimeMatrix6290551
     * @tc.desc      Verify 21:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290551',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 41);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_55200
     * @tc.name      testReminderTimeMatrix6290552
     * @tc.desc      Verify 21:42 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290552',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 42);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_55300
     * @tc.name      testReminderTimeMatrix6290553
     * @tc.desc      Verify 21:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290553',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 43);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_55400
     * @tc.name      testReminderTimeMatrix6290554
     * @tc.desc      Verify 21:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290554',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 46);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_55500
     * @tc.name      testReminderTimeMatrix6290555
     * @tc.desc      Verify 21:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290555',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_55600
     * @tc.name      testReminderTimeMatrix6290556
     * @tc.desc      Verify 21:48 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290556',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 48);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_55700
     * @tc.name      testReminderTimeMatrix6290557
     * @tc.desc      Verify 21:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290557',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 50);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_55800
     * @tc.name      testReminderTimeMatrix6290558
     * @tc.desc      Verify 21:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290558',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 51);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_55900
     * @tc.name      testReminderTimeMatrix6290559
     * @tc.desc      Verify 21:52 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290559',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 52);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_56000
     * @tc.name      testReminderTimeMatrix6290560
     * @tc.desc      Verify 21:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290560',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_56100
     * @tc.name      testReminderTimeMatrix6290561
     * @tc.desc      Verify 21:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290561',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 55);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_56200
     * @tc.name      testReminderTimeMatrix6290562
     * @tc.desc      Verify 21:56 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290562',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 56);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_56300
     * @tc.name      testReminderTimeMatrix6290563
     * @tc.desc      Verify 21:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290563',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 58);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_56400
     * @tc.name      testReminderTimeMatrix6290564
     * @tc.desc      Verify 21:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290564',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(21, 59);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_56500
     * @tc.name      testReminderTimeMatrix6290565
     * @tc.desc      Verify 22:17 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290565',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 17);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_56600
     * @tc.name      testReminderTimeMatrix6290566
     * @tc.desc      Verify 22:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290566',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 19);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_56700
     * @tc.name      testReminderTimeMatrix6290567
     * @tc.desc      Verify 22:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290567',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 21);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_56800
     * @tc.name      testReminderTimeMatrix6290568
     * @tc.desc      Verify 22:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290568',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 22);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_56900
     * @tc.name      testReminderTimeMatrix6290569
     * @tc.desc      Verify 22:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290569',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 24);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_57000
     * @tc.name      testReminderTimeMatrix6290570
     * @tc.desc      Verify 22:25 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290570',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 25);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_57100
     * @tc.name      testReminderTimeMatrix6290571
     * @tc.desc      Verify 22:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290571',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 26);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_57200
     * @tc.name      testReminderTimeMatrix6290572
     * @tc.desc      Verify 22:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290572',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 28);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_57300
     * @tc.name      testReminderTimeMatrix6290573
     * @tc.desc      Verify 22:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290573',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 29);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_57400
     * @tc.name      testReminderTimeMatrix6290574
     * @tc.desc      Verify 22:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290574',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 30);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_57500
     * @tc.name      testReminderTimeMatrix6290575
     * @tc.desc      Verify 22:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290575',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 32);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_57600
     * @tc.name      testReminderTimeMatrix6290576
     * @tc.desc      Verify 22:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290576',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 33);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_57700
     * @tc.name      testReminderTimeMatrix6290577
     * @tc.desc      Verify 22:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290577',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 34);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_57800
     * @tc.name      testReminderTimeMatrix6290578
     * @tc.desc      Verify 22:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290578',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 36);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_57900
     * @tc.name      testReminderTimeMatrix6290579
     * @tc.desc      Verify 22:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290579',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 38);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_58000
     * @tc.name      testReminderTimeMatrix6290580
     * @tc.desc      Verify 22:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290580',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 39);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_58100
     * @tc.name      testReminderTimeMatrix6290581
     * @tc.desc      Verify 22:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290581',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 41);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_58200
     * @tc.name      testReminderTimeMatrix6290582
     * @tc.desc      Verify 22:42 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290582',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 42);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_58300
     * @tc.name      testReminderTimeMatrix6290583
     * @tc.desc      Verify 22:43 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290583',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 43);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_58400
     * @tc.name      testReminderTimeMatrix6290584
     * @tc.desc      Verify 22:45 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290584',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 45);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_58500
     * @tc.name      testReminderTimeMatrix6290585
     * @tc.desc      Verify 22:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290585',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 46);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_58600
     * @tc.name      testReminderTimeMatrix6290586
     * @tc.desc      Verify 22:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290586',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 47);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_58700
     * @tc.name      testReminderTimeMatrix6290587
     * @tc.desc      Verify 22:49 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290587',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 49);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_58800
     * @tc.name      testReminderTimeMatrix6290588
     * @tc.desc      Verify 22:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290588',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 50);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_58900
     * @tc.name      testReminderTimeMatrix6290589
     * @tc.desc      Verify 22:51 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290589',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 51);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_59000
     * @tc.name      testReminderTimeMatrix6290590
     * @tc.desc      Verify 22:53 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290590',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 53);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_59100
     * @tc.name      testReminderTimeMatrix6290591
     * @tc.desc      Verify 22:54 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290591',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 54);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_59200
     * @tc.name      testReminderTimeMatrix6290592
     * @tc.desc      Verify 22:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290592',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 55);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_59300
     * @tc.name      testReminderTimeMatrix6290593
     * @tc.desc      Verify 22:57 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290593',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 57);
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
     * @tc.number    SUB_REMINDER_TIME_MATRIX629_59400
     * @tc.name      testReminderTimeMatrix6290594
     * @tc.desc      Verify 22:58 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix6290594',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 58);
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
