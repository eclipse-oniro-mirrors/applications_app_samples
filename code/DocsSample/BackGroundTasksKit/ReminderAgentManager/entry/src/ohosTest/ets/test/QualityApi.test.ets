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
import { reminderAgentManager } from '@kit.BackgroundTasksKit';
import { notificationManager } from '@kit.NotificationKit';
import { installCaseIsolation } from './TestRuntime';

const TITLE: string = 'qualityReminder';
const CONTENT: string = 'qualityContent';
const BUNDLE_NAME: string = 'com.example.reminderagentmanager';
const ABILITY_NAME: string = 'EntryAbility';

function wantAgent(): reminderAgentManager.WantAgent {
  return { pkgName: BUNDLE_NAME, abilityName: ABILITY_NAME };
}

function timerRequest(seconds: number, notificationId: number): reminderAgentManager.ReminderRequestTimer {
  return {
    reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
    triggerTimeInSeconds: seconds,
    ringDuration: 1,
    title: TITLE,
    content: CONTENT,
    wantAgent: wantAgent(),
    notificationId: notificationId,
    slotType: notificationManager.SlotType.CONTENT_INFORMATION
  };
}

function alarmRequest(hour: number, minute: number, notificationId: number): reminderAgentManager.ReminderRequestAlarm {
  return {
    reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_ALARM,
    hour: hour,
    minute: minute,
    title: TITLE,
    content: CONTENT,
    ringDuration: 1,
    wantAgent: wantAgent(),
    notificationId: notificationId,
    slotType: notificationManager.SlotType.CONTENT_INFORMATION,
    daysOfWeek: []
  };
}

function calendarRequest(offsetMinutes: number, notificationId: number): reminderAgentManager.ReminderRequestCalendar {
  const date: Date = new Date(Date.now() + offsetMinutes * 60 * 1000);
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
    wantAgent: wantAgent(),
    notificationId: notificationId,
    slotType: notificationManager.SlotType.CONTENT_INFORMATION
  };
}

async function cancelQuietly(id: number): Promise<void> {
  if (id <= 0) {
    return;
  }
  try {
    await reminderAgentManager.cancelReminder(id);
  } catch (err) {
  }
}

export default function qualityApiTest(): void {
  describe('ReminderQualityApiTest', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_QUALITY_API_0000
     * @tc.name      testReminderQualityApiSlot0001
     * @tc.desc      Verify the content notification slot can be added.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityApiSlot0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await reminderAgentManager.addNotificationSlot({
            notificationType: notificationManager.SlotType.CONTENT_INFORMATION
          });
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
     * @tc.number    SUB_REMINDER_QUALITY_API_4700
     * @tc.name      testReminderQualityApiInvalid0047
     * @tc.desc      Verify timer request without trigger time is rejected.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityApiInvalid0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let failed: boolean = false;
        try {
          const request: reminderAgentManager.ReminderRequest = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER
          };
          await reminderAgentManager.publishReminder(request);
        } catch (err) {
          failed = true;
        }
        expect(failed).assertTrue();
        expect(typeof failed).assertEqual('boolean');
        expect(failed === true).assertTrue();
        done();
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_API_4800
     * @tc.name      testReminderQualityApiInvalid0048
     * @tc.desc      Verify timer request with negative trigger is rejected.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityApiInvalid0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let failed: boolean = false;
        try {
          await reminderAgentManager.publishReminder(timerRequest(-1, 9999));
        } catch (err) {
          failed = true;
        }
        expect(failed).assertTrue();
        expect(typeof failed).assertEqual('boolean');
        expect(failed === true).assertTrue();
        done();
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_API_4900
     * @tc.name      testReminderQualityApiInvalid0049
     * @tc.desc      Verify alarm request with hour 24 is rejected.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityApiInvalid0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let failed: boolean = false;
        try {
          await reminderAgentManager.publishReminder(alarmRequest(24, 0, 9999));
        } catch (err) {
          failed = true;
        }
        expect(failed).assertTrue();
        expect(typeof failed).assertEqual('boolean');
        expect(failed === true).assertTrue();
        done();
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_API_5000
     * @tc.name      testReminderQualityApiInvalid0050
     * @tc.desc      Verify alarm request with minute 60 is rejected.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityApiInvalid0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let failed: boolean = false;
        try {
          await reminderAgentManager.publishReminder(alarmRequest(1, 60, 9999));
        } catch (err) {
          failed = true;
        }
        expect(failed).assertTrue();
        expect(typeof failed).assertEqual('boolean');
        expect(failed === true).assertTrue();
        done();
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_API_5100
     * @tc.name      testReminderQualityApiInvalid0051
     * @tc.desc      Verify calendar request with month 13 is rejected.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityApiInvalid0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let failed: boolean = false;
        try {
          const request: reminderAgentManager.ReminderRequestCalendar = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: { year: 2026, month: 13, day: 1, hour: 0, minute: 0 },
            title: TITLE,
            content: CONTENT,
            ringDuration: 1,
            wantAgent: wantAgent(),
            slotType: notificationManager.SlotType.CONTENT_INFORMATION
          };
          await reminderAgentManager.publishReminder(request);
        } catch (err) {
          failed = true;
        }
        expect(failed).assertTrue();
        expect(typeof failed).assertEqual('boolean');
        expect(failed === true).assertTrue();
        done();
      });  });
}
