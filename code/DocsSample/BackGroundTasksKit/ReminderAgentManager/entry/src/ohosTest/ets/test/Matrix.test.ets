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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { reminderAgentManager } from '@kit.BackgroundTasksKit';
import { notificationManager } from '@kit.NotificationKit';
import { preferences } from '@kit.ArkData';
import TimeConversion from '../../../main/ets/util/TimeConversion';
import Constant from '../../../main/ets/common/Constant';
import { installCaseIsolation } from './TestRuntime';

const BUNDLE_NAME: string = 'com.example.reminderagentmanager';
const ABILITY_NAME: string = 'EntryAbility';
const TAG: string = 'ReminderMatrixTest';
const PREF_NAME: string = 'ReminderAgentManager';
const TITLE: string = 'matrixReminder';
const CONTENT: string = 'matrixContent';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const appContext = delegator.getAppContext();

function createWantAgent(): reminderAgentManager.WantAgent {
  return {
    pkgName: BUNDLE_NAME,
    abilityName: ABILITY_NAME
  };
}

function createTimerRequest(seconds: number, notificationId: number): reminderAgentManager.ReminderRequestTimer {
  return {
    reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
    triggerTimeInSeconds: seconds,
    ringDuration: 1,
    title: TITLE,
    content: CONTENT,
    wantAgent: createWantAgent(),
    notificationId: notificationId,
    slotType: notificationManager.SlotType.CONTENT_INFORMATION
  };
}

function createAlarmRequest(hour: number, minute: number): reminderAgentManager.ReminderRequestAlarm {
  return {
    reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_ALARM,
    hour: hour,
    minute: minute,
    title: TITLE,
    content: CONTENT,
    ringDuration: 1,
    wantAgent: createWantAgent(),
    slotType: notificationManager.SlotType.CONTENT_INFORMATION,
    daysOfWeek: []
  };
}

function createCalendarRequest(date: Date): reminderAgentManager.ReminderRequestCalendar {
  return {
    reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_CALENDAR,
    dateTime: {
      year: date.getFullYear(),
      month: date.getMonth() + 1,
      day: date.getDate(),
      hour: date.getHours(),
      minute: date.getMinutes()
    },
    title: TITLE,
    content: CONTENT,
    ringDuration: 1,
    wantAgent: createWantAgent(),
    slotType: notificationManager.SlotType.CONTENT_INFORMATION
  };
}

async function cancelQuietly(reminderId: number): Promise<void> {
  if (reminderId <= 0) {
    return;
  }
  try {
    await reminderAgentManager.cancelReminder(reminderId);
  } catch (err) {
    console.info(`${TAG} cleanup skipped`);
  }
}

export default function matrixTest() {
  describe('ReminderMatrixTest', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_AGENT_MATRIX_0100
     * @tc.name      testReminderAgentMatrixHourOne0061
     * @tc.desc      Verify 01:00 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixHourOne0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 0);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MATRIX_0200
     * @tc.name      testReminderAgentMatrixHourOneOne0062
     * @tc.desc      Verify 01:01 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixHourOneOne0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(1, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MATRIX_0300
     * @tc.name      testReminderAgentMatrixHourEleven0063
     * @tc.desc      Verify 11:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixHourEleven0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(11, 59);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MATRIX_0400
     * @tc.name      testReminderAgentMatrixHourTwentyTwo0064
     * @tc.desc      Verify 22:00 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixHourTwentyTwo0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(22, 0);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MATRIX_0500
     * @tc.name      testReminderAgentMatrixHourTwentyThree0065
     * @tc.desc      Verify 23:00 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixHourTwentyThree0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(23, 0);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MATRIX_0600
     * @tc.name      testReminderAgentMatrixDateTenMinutes0066
     * @tc.desc      Verify a ten-minute future date converts to a positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixDateTenMinutes0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const future: Date = new Date(Date.now() + 10 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(future.getFullYear(),
            future.getMonth() + 1, future.getDate(), future.getHours(), future.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 601).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MATRIX_0700
     * @tc.name      testReminderAgentMatrixDateTenMinutesPast0067
     * @tc.desc      Verify a ten-minute past date converts to a negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixDateTenMinutesPast0067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const past: Date = new Date(Date.now() - 10 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(past.getFullYear(),
            past.getMonth() + 1, past.getDate(), past.getHours(), past.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -661).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MATRIX_0800
     * @tc.name      testReminderAgentMatrixDateCurrent0068
     * @tc.desc      Verify the current minute converts between minus one minute and zero.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixDateCurrent0068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const now: Date = new Date();
          const value: number = TimeConversion.dateToMillisecond(now.getFullYear(),
            now.getMonth() + 1, now.getDate(), now.getHours(), now.getMinutes());
          expect(value <= 0).assertTrue();
          expect(value >= -90000).assertTrue();
          expect(value >= -60).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MATRIX_0900
     * @tc.name      testReminderAgentMatrixDateTomorrow0069
     * @tc.desc      Verify tomorrow at the current time converts to about one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixDateTomorrow0069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const now: Date = new Date();
          const tomorrow: Date = new Date(now.getTime() + 24 * 60 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(tomorrow.getFullYear(),
            tomorrow.getMonth() + 1, tomorrow.getDate(), now.getHours(), now.getMinutes());
          expect(value >= 86000).assertTrue();
          expect(value <= 86400).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MATRIX_1000
     * @tc.name      testReminderAgentMatrixDateYesterday0070
     * @tc.desc      Verify yesterday at the current time converts to about minus one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixDateYesterday0070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const now: Date = new Date();
          const yesterday: Date = new Date(now.getTime() - 24 * 60 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(yesterday.getFullYear(),
            yesterday.getMonth() + 1, yesterday.getDate(), now.getHours(), now.getMinutes());
          expect(value <= 0).assertTrue();
          expect(value >= -90000).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MATRIX_1100
     * @tc.name      testReminderAgentMatrixConstants0071
     * @tc.desc      Verify time-related constants keep their declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixConstants0071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.HOUR_SECONDS).assertEqual(3600);
          expect(Constant.MINUTES_SECONDS).assertEqual(60);
          expect(Constant.ANGLE).assertEqual(360);
          expect(Constant.TIME_COUNTDOWN).assertEqual(59);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MATRIX_1200
     * @tc.name      testReminderAgentMatrixConstants0072
     * @tc.desc      Verify clock layout constants keep their declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixConstants0072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.VERTICAL_CLOCK_DIAL_HEIGHT).assertEqual(280);
          expect(Constant.VERTICAL_CLOCK_DIAL_WIDTH).assertEqual(280);
          expect(Constant.HORIZONTAL_CLOCK_DIAL_HEIGHT).assertEqual(212);
          expect(Constant.HORIZONTAL_CLOCK_DIAL_WIDTH).assertEqual(212);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MATRIX_1900
     * @tc.name      testReminderAgentMatrixValidList0079
     * @tc.desc      Verify the valid reminder list can be queried.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixValidList0079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const valid: Array<reminderAgentManager.ReminderInfo> =
            await reminderAgentManager.getAllValidReminders();
          expect(Array.isArray(valid)).assertTrue();
          expect(valid.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MATRIX_2000
     * @tc.name      testReminderAgentMatrixPreferences0080
     * @tc.desc      Verify an isolated preference key can be written, read, and removed.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixPreferences0080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'matrixKey';
          pref.putSync(key, 'matrixValue');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('matrixValue');
          pref.deleteSync(key);
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('');
        } catch (err) {
          expect().assertFail();
        }
      });
  });
}
