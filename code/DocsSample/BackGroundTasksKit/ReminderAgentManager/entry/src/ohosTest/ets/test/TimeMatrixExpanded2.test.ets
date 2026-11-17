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

export default function expandedTime2Test() {
  describe('ReminderTimeExpanded2Test', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_0100
     * @tc.name      testReminderTimeExpanded20001
     * @tc.desc      Verify 01:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 30);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_0200
     * @tc.name      testReminderTimeExpanded20002
     * @tc.desc      Verify 01:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 35);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_0300
     * @tc.name      testReminderTimeExpanded20003
     * @tc.desc      Verify 01:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_0400
     * @tc.name      testReminderTimeExpanded20004
     * @tc.desc      Verify 01:45 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 45);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_0500
     * @tc.name      testReminderTimeExpanded20005
     * @tc.desc      Verify 01:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_0600
     * @tc.name      testReminderTimeExpanded20006
     * @tc.desc      Verify 01:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 55);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_0700
     * @tc.name      testReminderTimeExpanded20007
     * @tc.desc      Verify 02:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 30);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_0800
     * @tc.name      testReminderTimeExpanded20008
     * @tc.desc      Verify 02:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 35);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_0900
     * @tc.name      testReminderTimeExpanded20009
     * @tc.desc      Verify 02:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_1000
     * @tc.name      testReminderTimeExpanded20010
     * @tc.desc      Verify 02:45 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 45);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_1100
     * @tc.name      testReminderTimeExpanded20011
     * @tc.desc      Verify 02:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_1200
     * @tc.name      testReminderTimeExpanded20012
     * @tc.desc      Verify 02:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(2, 55);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_1300
     * @tc.name      testReminderTimeExpanded20013
     * @tc.desc      Verify 03:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 30);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_1400
     * @tc.name      testReminderTimeExpanded20014
     * @tc.desc      Verify 03:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 35);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_1500
     * @tc.name      testReminderTimeExpanded20015
     * @tc.desc      Verify 03:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_1600
     * @tc.name      testReminderTimeExpanded20016
     * @tc.desc      Verify 03:45 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 45);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_1700
     * @tc.name      testReminderTimeExpanded20017
     * @tc.desc      Verify 03:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_1800
     * @tc.name      testReminderTimeExpanded20018
     * @tc.desc      Verify 03:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(3, 55);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_1900
     * @tc.name      testReminderTimeExpanded20019
     * @tc.desc      Verify 04:25 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 25);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_2000
     * @tc.name      testReminderTimeExpanded20020
     * @tc.desc      Verify 04:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 30);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_2100
     * @tc.name      testReminderTimeExpanded20021
     * @tc.desc      Verify 04:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 35);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_2200
     * @tc.name      testReminderTimeExpanded20022
     * @tc.desc      Verify 04:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_2300
     * @tc.name      testReminderTimeExpanded20023
     * @tc.desc      Verify 04:45 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 45);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_2400
     * @tc.name      testReminderTimeExpanded20024
     * @tc.desc      Verify 04:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_2500
     * @tc.name      testReminderTimeExpanded20025
     * @tc.desc      Verify 04:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(4, 55);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_2600
     * @tc.name      testReminderTimeExpanded20026
     * @tc.desc      Verify 05:25 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 25);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_2700
     * @tc.name      testReminderTimeExpanded20027
     * @tc.desc      Verify 05:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 30);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_2800
     * @tc.name      testReminderTimeExpanded20028
     * @tc.desc      Verify 05:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 35);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_2900
     * @tc.name      testReminderTimeExpanded20029
     * @tc.desc      Verify 05:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_3000
     * @tc.name      testReminderTimeExpanded20030
     * @tc.desc      Verify 05:45 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 45);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_3100
     * @tc.name      testReminderTimeExpanded20031
     * @tc.desc      Verify 05:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_3200
     * @tc.name      testReminderTimeExpanded20032
     * @tc.desc      Verify 05:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(5, 55);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_3300
     * @tc.name      testReminderTimeExpanded20033
     * @tc.desc      Verify 06:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 35);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_3400
     * @tc.name      testReminderTimeExpanded20034
     * @tc.desc      Verify 06:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_3500
     * @tc.name      testReminderTimeExpanded20035
     * @tc.desc      Verify 06:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_3600
     * @tc.name      testReminderTimeExpanded20036
     * @tc.desc      Verify 07:25 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 25);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_3700
     * @tc.name      testReminderTimeExpanded20037
     * @tc.desc      Verify 07:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 30);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_3800
     * @tc.name      testReminderTimeExpanded20038
     * @tc.desc      Verify 07:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 35);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_3900
     * @tc.name      testReminderTimeExpanded20039
     * @tc.desc      Verify 07:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_4000
     * @tc.name      testReminderTimeExpanded20040
     * @tc.desc      Verify 07:45 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 45);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_4100
     * @tc.name      testReminderTimeExpanded20041
     * @tc.desc      Verify 07:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_4200
     * @tc.name      testReminderTimeExpanded20042
     * @tc.desc      Verify 07:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(7, 55);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_4300
     * @tc.name      testReminderTimeExpanded20043
     * @tc.desc      Verify 08:25 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 25);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_4400
     * @tc.name      testReminderTimeExpanded20044
     * @tc.desc      Verify 08:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 30);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_4500
     * @tc.name      testReminderTimeExpanded20045
     * @tc.desc      Verify 08:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 35);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_4600
     * @tc.name      testReminderTimeExpanded20046
     * @tc.desc      Verify 08:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_4700
     * @tc.name      testReminderTimeExpanded20047
     * @tc.desc      Verify 08:45 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 45);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_4800
     * @tc.name      testReminderTimeExpanded20048
     * @tc.desc      Verify 08:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_4900
     * @tc.name      testReminderTimeExpanded20049
     * @tc.desc      Verify 08:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(8, 55);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_5000
     * @tc.name      testReminderTimeExpanded20050
     * @tc.desc      Verify 09:25 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 25);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_5100
     * @tc.name      testReminderTimeExpanded20051
     * @tc.desc      Verify 09:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 30);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_5200
     * @tc.name      testReminderTimeExpanded20052
     * @tc.desc      Verify 09:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 35);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_5300
     * @tc.name      testReminderTimeExpanded20053
     * @tc.desc      Verify 09:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_5400
     * @tc.name      testReminderTimeExpanded20054
     * @tc.desc      Verify 09:45 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 45);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_5500
     * @tc.name      testReminderTimeExpanded20055
     * @tc.desc      Verify 09:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_5600
     * @tc.name      testReminderTimeExpanded20056
     * @tc.desc      Verify 09:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(9, 55);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_5700
     * @tc.name      testReminderTimeExpanded20057
     * @tc.desc      Verify 10:25 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 25);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_5800
     * @tc.name      testReminderTimeExpanded20058
     * @tc.desc      Verify 10:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 30);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_5900
     * @tc.name      testReminderTimeExpanded20059
     * @tc.desc      Verify 10:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 35);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_6000
     * @tc.name      testReminderTimeExpanded20060
     * @tc.desc      Verify 10:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_6100
     * @tc.name      testReminderTimeExpanded20061
     * @tc.desc      Verify 10:45 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 45);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_6200
     * @tc.name      testReminderTimeExpanded20062
     * @tc.desc      Verify 10:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_6300
     * @tc.name      testReminderTimeExpanded20063
     * @tc.desc      Verify 10:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(10, 55);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_6400
     * @tc.name      testReminderTimeExpanded20064
     * @tc.desc      Verify 11:25 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 25);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_6500
     * @tc.name      testReminderTimeExpanded20065
     * @tc.desc      Verify 11:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 30);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_6600
     * @tc.name      testReminderTimeExpanded20066
     * @tc.desc      Verify 11:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 35);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_6700
     * @tc.name      testReminderTimeExpanded20067
     * @tc.desc      Verify 11:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_6800
     * @tc.name      testReminderTimeExpanded20068
     * @tc.desc      Verify 11:45 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 45);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_6900
     * @tc.name      testReminderTimeExpanded20069
     * @tc.desc      Verify 11:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_7000
     * @tc.name      testReminderTimeExpanded20070
     * @tc.desc      Verify 11:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 55);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_7100
     * @tc.name      testReminderTimeExpanded20071
     * @tc.desc      Verify 12:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 35);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_7200
     * @tc.name      testReminderTimeExpanded20072
     * @tc.desc      Verify 12:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_7300
     * @tc.name      testReminderTimeExpanded20073
     * @tc.desc      Verify 12:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_7400
     * @tc.name      testReminderTimeExpanded20074
     * @tc.desc      Verify 13:25 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 25);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_7500
     * @tc.name      testReminderTimeExpanded20075
     * @tc.desc      Verify 13:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 30);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_7600
     * @tc.name      testReminderTimeExpanded20076
     * @tc.desc      Verify 13:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 35);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_7700
     * @tc.name      testReminderTimeExpanded20077
     * @tc.desc      Verify 13:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_7800
     * @tc.name      testReminderTimeExpanded20078
     * @tc.desc      Verify 13:45 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 45);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_7900
     * @tc.name      testReminderTimeExpanded20079
     * @tc.desc      Verify 13:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_8000
     * @tc.name      testReminderTimeExpanded20080
     * @tc.desc      Verify 13:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(13, 55);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_8100
     * @tc.name      testReminderTimeExpanded20081
     * @tc.desc      Verify 14:25 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 25);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_8200
     * @tc.name      testReminderTimeExpanded20082
     * @tc.desc      Verify 14:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 30);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_8300
     * @tc.name      testReminderTimeExpanded20083
     * @tc.desc      Verify 14:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 35);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_8400
     * @tc.name      testReminderTimeExpanded20084
     * @tc.desc      Verify 14:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_8500
     * @tc.name      testReminderTimeExpanded20085
     * @tc.desc      Verify 14:45 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 45);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_8600
     * @tc.name      testReminderTimeExpanded20086
     * @tc.desc      Verify 14:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_8700
     * @tc.name      testReminderTimeExpanded20087
     * @tc.desc      Verify 14:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20087',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(14, 55);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_8800
     * @tc.name      testReminderTimeExpanded20088
     * @tc.desc      Verify 15:25 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20088',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 25);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_8900
     * @tc.name      testReminderTimeExpanded20089
     * @tc.desc      Verify 15:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20089',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 30);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_9000
     * @tc.name      testReminderTimeExpanded20090
     * @tc.desc      Verify 15:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 35);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_9100
     * @tc.name      testReminderTimeExpanded20091
     * @tc.desc      Verify 15:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20091',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_9200
     * @tc.name      testReminderTimeExpanded20092
     * @tc.desc      Verify 15:45 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20092',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 45);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_9300
     * @tc.name      testReminderTimeExpanded20093
     * @tc.desc      Verify 15:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20093',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_9400
     * @tc.name      testReminderTimeExpanded20094
     * @tc.desc      Verify 15:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20094',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(15, 55);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_9500
     * @tc.name      testReminderTimeExpanded20095
     * @tc.desc      Verify 16:25 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20095',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 25);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_9600
     * @tc.name      testReminderTimeExpanded20096
     * @tc.desc      Verify 16:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20096',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 30);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_9700
     * @tc.name      testReminderTimeExpanded20097
     * @tc.desc      Verify 16:35 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20097',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 35);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_9800
     * @tc.name      testReminderTimeExpanded20098
     * @tc.desc      Verify 16:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20098',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_9900
     * @tc.name      testReminderTimeExpanded20099
     * @tc.desc      Verify 16:45 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20099',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 45);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXPANDED2_10000
     * @tc.name      testReminderTimeExpanded20100
     * @tc.desc      Verify 16:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExpanded20100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(16, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });  });
}
