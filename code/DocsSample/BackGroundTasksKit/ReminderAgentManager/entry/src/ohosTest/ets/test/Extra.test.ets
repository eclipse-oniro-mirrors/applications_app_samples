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
import { abilityDelegatorRegistry as AbilityDelegatorRegistry } from '@kit.TestKit';
import { preferences } from '@kit.ArkData';
import TimeConversion from '../../../main/ets/util/TimeConversion';
import Constant from '../../../main/ets/common/Constant';
import { installCaseIsolation } from './TestRuntime';

const PREF_NAME: string = 'ReminderAgentManager';
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const appContext = delegator.getAppContext();

export default function extraTest() {
  describe('ReminderExtraTest', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_EXTRA_0100
     * @tc.name      testReminderExtraTime0001
     * @tc.desc      Verify 00:05 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraTime0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 5);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_0200
     * @tc.name      testReminderExtraTime0002
     * @tc.desc      Verify 00:10 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraTime0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 10);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_0300
     * @tc.name      testReminderExtraTime0003
     * @tc.desc      Verify 00:20 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraTime0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 20);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_0400
     * @tc.name      testReminderExtraTime0004
     * @tc.desc      Verify 00:40 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraTime0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 40);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_0500
     * @tc.name      testReminderExtraTime0005
     * @tc.desc      Verify 00:50 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraTime0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 50);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_0600
     * @tc.name      testReminderExtraTime0006
     * @tc.desc      Verify 06:05 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraTime0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 5);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_0700
     * @tc.name      testReminderExtraTime0007
     * @tc.desc      Verify 06:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraTime0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 55);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_0800
     * @tc.name      testReminderExtraTime0008
     * @tc.desc      Verify 12:05 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraTime0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 5);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_0900
     * @tc.name      testReminderExtraTime0009
     * @tc.desc      Verify 12:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraTime0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 55);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_1000
     * @tc.name      testReminderExtraTime0010
     * @tc.desc      Verify 18:05 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraTime0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 5);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_1100
     * @tc.name      testReminderExtraTime0011
     * @tc.desc      Verify 18:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraTime0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(18, 55);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_1200
     * @tc.name      testReminderExtraTime0012
     * @tc.desc      Verify 23:05 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraTime0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(23, 5);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_1300
     * @tc.name      testReminderExtraTime0013
     * @tc.desc      Verify 23:10 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraTime0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(23, 10);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_1400
     * @tc.name      testReminderExtraTime0014
     * @tc.desc      Verify 23:20 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraTime0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(23, 20);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_1500
     * @tc.name      testReminderExtraTime0015
     * @tc.desc      Verify 23:55 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraTime0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(23, 55);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_1600
     * @tc.name      testReminderExtraDate0016
     * @tc.desc      Verify next month is positive.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraDate0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const now: Date = new Date();
          const date: Date = new Date(now.getFullYear(), now.getMonth() + 1, now.getDate(),
            now.getHours(), now.getMinutes());
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 2000000).assertTrue();
          expect(value < 3000000).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_1700
     * @tc.name      testReminderExtraDate0017
     * @tc.desc      Verify previous month is negative.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraDate0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const now: Date = new Date();
          const date: Date = new Date(now.getFullYear(), now.getMonth() - 1, now.getDate(),
            now.getHours(), now.getMinutes());
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < -2000000).assertTrue();
          expect(value > -3000000).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_1800
     * @tc.name      testReminderExtraDate0018
     * @tc.desc      Verify next year is positive.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraDate0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const now: Date = new Date();
          const date: Date = new Date(now.getFullYear() + 1, now.getMonth(), now.getDate(),
            now.getHours(), now.getMinutes());
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 31000000).assertTrue();
          expect(value < 32000000).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_1900
     * @tc.name      testReminderExtraDate0019
     * @tc.desc      Verify previous year is negative.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraDate0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const now: Date = new Date();
          const date: Date = new Date(now.getFullYear() - 1, now.getMonth(), now.getDate(),
            now.getHours(), now.getMinutes());
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < -31000000).assertTrue();
          expect(value > -32000000).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_2000
     * @tc.name      testReminderExtraDate0020
     * @tc.desc      Verify leap-day conversion is positive.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraDate0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const now: Date = new Date();
          const date: Date = new Date(now.getFullYear() + 2, 1, 29, 12, 0);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value > 31000000).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_2100
     * @tc.name      testReminderExtraDate0021
     * @tc.desc      Verify year-end conversion is positive.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraDate0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const now: Date = new Date();
          const date: Date = new Date(now.getFullYear() + 5, 11, 31, 23, 59);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value > 155000000).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_2200
     * @tc.name      testReminderExtraConstant0022
     * @tc.desc      Verify all declared constants keep their expected values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraConstant0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.PROMPT_DURATION).assertEqual(300);
          expect(Constant.REMINDER_DURATION).assertEqual(30);
          expect(Constant.FONT_WEIGHT).assertEqual(400);
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_2300
     * @tc.name      testReminderExtraConstant0023
     * @tc.desc      Verify all declared constants keep their expected values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraConstant0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.VIBRATOR_DURATION).assertEqual(3000);
          expect(Constant.SECONDS_MILLISECONDS).assertEqual(1000);
          expect(Constant.ANGLE).assertEqual(360);
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_2400
     * @tc.name      testReminderExtraConstant0024
     * @tc.desc      Verify all declared constants keep their expected values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraConstant0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.HOUR_SECONDS).assertEqual(3600);
          expect(Constant.TIME_COUNTDOWN).assertEqual(59);
          expect(Constant.MINUTES_SECONDS).assertEqual(60);
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_2500
     * @tc.name      testReminderExtraConstant0025
     * @tc.desc      Verify all declared constants keep their expected values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraConstant0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.HORIZONTAL_POINTER_HEIGHT).assertEqual(310);
          expect(Constant.HORIZONTAL_LINE_LENGTH).assertEqual(345);
          expect(Constant.HORIZONTAL_CLOCK_DIAL_HEIGHT).assertEqual(212);
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_2600
     * @tc.name      testReminderExtraConstant0026
     * @tc.desc      Verify all declared constants keep their expected values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraConstant0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.HORIZONTAL_CLOCK_DIAL_WIDTH).assertEqual(212);
          expect(Constant.HORIZONTAL_CLOCK_HEIGHT).assertEqual(188);
          expect(Constant.HORIZONTAL_CLOCK_WIDTH).assertEqual(188);
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_2700
     * @tc.name      testReminderExtraConstant0027
     * @tc.desc      Verify all declared constants keep their expected values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraConstant0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.HORIZONTAL_CENTER_Y).assertEqual(99);
          expect(Constant.VERTICAL_POINTER_HEIGHT).assertEqual(375);
          expect(Constant.VERTICAL_LINE_LENGTH).assertEqual(410);
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_2800
     * @tc.name      testReminderExtraConstant0028
     * @tc.desc      Verify all declared constants keep their expected values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraConstant0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.VERTICAL_CLOCK_DIAL_HEIGHT).assertEqual(280);
          expect(Constant.VERTICAL_CLOCK_DIAL_WIDTH).assertEqual(280);
          expect(Constant.VERTICAL_CLOCK_HEIGHT).assertEqual(250);
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_2900
     * @tc.name      testReminderExtraConstant0029
     * @tc.desc      Verify all declared constants keep their expected values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraConstant0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.VERTICAL_CLOCK_WIDTH).assertEqual(250);
          expect(Constant.VERTICAL_CENTER_Y).assertEqual(125);
          expect(Constant.VERTICAL_PICKER_HEIGHT).assertEqual(128);
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_3000
     * @tc.name      testReminderExtraPref0030
     * @tc.desc      Verify overwriting a preference key keeps the latest value.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraPref0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          pref.putSync('extraOverwriteKey', 'first');
          pref.putSync('extraOverwriteKey', 'second');
          pref.flushSync();
          expect(String(pref.getSync('extraOverwriteKey', ''))).assertEqual('second');
          expect(pref.hasSync('extraOverwriteKey')).assertTrue();
          pref.deleteSync('extraOverwriteKey');
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_3100
     * @tc.name      testReminderExtraPref0031
     * @tc.desc      Verify missing preference keys return the default value.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraPref0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          expect(String(pref.getSync('extraMissingKey', 'fallback'))).assertEqual('fallback');
          expect(pref.hasSync('extraMissingKey')).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_3200
     * @tc.name      testReminderExtraPref0032
     * @tc.desc      Verify deleting a missing preference key is safe.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraPref0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          pref.deleteSync('extraNeverCreatedKey');
          pref.flushSync();
          expect(String(pref.getSync('extraNeverCreatedKey', 'fallback'))).assertEqual('fallback');
          expect(pref.hasSync('extraNeverCreatedKey')).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_EXTRA_3300
     * @tc.name      testReminderExtraDate45Minutes0033
     * @tc.desc      Verify a 45-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraDate45Minutes0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const date: Date = new Date(Date.now() + 45 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 2701).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_EXTRA_3400
     * @tc.name      testReminderExtraDate90Minutes0034
     * @tc.desc      Verify a 90-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraDate90Minutes0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const date: Date = new Date(Date.now() + 90 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 5401).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_EXTRA_3500
     * @tc.name      testReminderExtraDate120Minutes0035
     * @tc.desc      Verify a 120-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraDate120Minutes0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const date: Date = new Date(Date.now() + 120 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 7201).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_EXTRA_3600
     * @tc.name      testReminderExtraPrefSpecial0036
     * @tc.desc      Verify preference values with special characters round-trip.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraPrefSpecial0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'extraSpecialKey';
          const value: string = '提醒 <tag> "quote" \\n 100%';
          pref.putSync(key, value);
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual(value);
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_EXTRA_3700
     * @tc.name      testReminderExtraPrefLong0037
     * @tc.desc      Verify a long preference value round-trips without truncation.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraPrefLong0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'extraLongKey';
          const value: string = 'a'.repeat(512);
          pref.putSync(key, value);
          pref.flushSync();
          const readValue: string = String(pref.getSync(key, ''));
          expect(readValue.length).assertEqual(512);
          expect(readValue).assertEqual(value);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_EXTRA_3800
     * @tc.name      testReminderExtraPrefUnicode0038
     * @tc.desc      Verify a Unicode preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraPrefUnicode0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'extraUnicodeKey';
          const value: string = '提醒⏰日历';
          pref.putSync(key, value);
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual(value);
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });


    /**
     * @tc.number    SUB_REMINDER_EXTRA_3900
     * @tc.name      testReminderExtraPrefNumber0039
     * @tc.desc      Verify a numeric preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraPrefNumber0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'extraNumberKey';
          pref.putSync(key, 2026);
          pref.flushSync();
          expect(Number(pref.getSync(key, 0))).assertEqual(2026);
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_EXTRA_4000
     * @tc.name      testReminderExtraPrefBoolean0040
     * @tc.desc      Verify a boolean preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraPrefBoolean0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'extraBooleanKey';
          pref.putSync(key, true);
          pref.flushSync();
          expect(Boolean(pref.getSync(key, false))).assertTrue();
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_EXTRA_4100
     * @tc.name      testReminderExtraPastDate0041
     * @tc.desc      Verify a fixed historical date converts to a negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraPastDate0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.dateToMillisecond(2000, 1, 1, 0, 0);
          expect(value < 0).assertTrue();
          expect(value > -900000000).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_EXTRA_4200
     * @tc.name      testReminderExtraFutureDate0042
     * @tc.desc      Verify a fixed future date converts to a positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderExtraFutureDate0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.dateToMillisecond(2099, 12, 31, 23, 59);
          expect(value > 0).assertTrue();
          expect(value < 3000000000).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

  });
}
