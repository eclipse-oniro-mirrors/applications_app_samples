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

const TITLE: string = 'modelTitle';
const CONTENT: string = 'modelContent';
const BUNDLE_NAME: string = 'com.example.reminderagentmanager';
const ABILITY_NAME: string = 'EntryAbility';

function wantAgent(): reminderAgentManager.WantAgent {
  return { pkgName: BUNDLE_NAME, abilityName: ABILITY_NAME };
}

function timerRequest(trigger: number, ring: number, title: string, content: string,
  notificationId: number): reminderAgentManager.ReminderRequestTimer {
  return {
    reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
    triggerTimeInSeconds: trigger,
    ringDuration: ring,
    title: title,
    content: content,
    wantAgent: wantAgent(),
    notificationId: notificationId,
    slotType: notificationManager.SlotType.CONTENT_INFORMATION
  };
}

function alarmRequest(hour: number, minute: number,
  daysOfWeek: Array<number>): reminderAgentManager.ReminderRequestAlarm {
  return {
    reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_ALARM,
    hour: hour,
    minute: minute,
    daysOfWeek: daysOfWeek,
    ringDuration: 1,
    title: TITLE,
    content: CONTENT,
    wantAgent: wantAgent(),
    notificationId: 1,
    slotType: notificationManager.SlotType.CONTENT_INFORMATION
  };
}

function calendarRequest(year: number, month: number, day: number, hour: number,
  minute: number): reminderAgentManager.ReminderRequestCalendar {
  return {
    reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_CALENDAR,
    dateTime: { year: year, month: month, day: day, hour: hour, minute: minute },
    ringDuration: 1,
    title: TITLE,
    content: CONTENT,
    wantAgent: wantAgent(),
    notificationId: 1,
    slotType: notificationManager.SlotType.CONTENT_INFORMATION
  };
}

export default function apiModelExtraTest(): void {
  describe('ReminderApiModelExtraTest', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_0100
     * @tc.name      testReminderApiModelExtra0001
     * @tc.desc      Verify timer model keeps reminder type and trigger.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(60, 1, 'modelTitle', 'modelContent', 1);
          const actualType: string = String(request.reminderType);
          expect(actualType).assertEqual(String(reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER));
          expect(request.triggerTimeInSeconds).assertEqual(60);
          expect(request.title).assertEqual('modelTitle');
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_0200
     * @tc.name      testReminderApiModelExtra0002
     * @tc.desc      Verify timer trigger zero is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(0, 1, 'modelTitle', 'modelContent', 1);
          expect(request.triggerTimeInSeconds).assertEqual(0);
          expect(request.ringDuration).assertEqual(1);
          expect(request.notificationId).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_0300
     * @tc.name      testReminderApiModelExtra0003
     * @tc.desc      Verify timer trigger one is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(1, 1, 'modelTitle', 'modelContent', 1);
          expect(request.triggerTimeInSeconds).assertEqual(1);
          expect(request.title).assertEqual('modelTitle');
          expect(request.content).assertEqual('modelContent');
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_0400
     * @tc.name      testReminderApiModelExtra0004
     * @tc.desc      Verify timer trigger 59 is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(59, 1, 'modelTitle', 'modelContent', 1);
          expect(request.triggerTimeInSeconds).assertEqual(59);
          expect(request.ringDuration).assertEqual(1);
          expect(request.notificationId).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_0500
     * @tc.name      testReminderApiModelExtra0005
     * @tc.desc      Verify timer trigger 60 is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(60, 1, 'modelTitle', 'modelContent', 1);
          expect(request.triggerTimeInSeconds).assertEqual(60);
          expect(request.title).assertEqual('modelTitle');
          expect(request.content).assertEqual('modelContent');
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_0600
     * @tc.name      testReminderApiModelExtra0006
     * @tc.desc      Verify timer trigger 3600 is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(3600, 1, 'modelTitle', 'modelContent', 1);
          expect(request.triggerTimeInSeconds).assertEqual(3600);
          expect(request.ringDuration).assertEqual(1);
          expect(request.notificationId).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_0700
     * @tc.name      testReminderApiModelExtra0007
     * @tc.desc      Verify timer trigger 86400 is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(86400, 1, 'modelTitle', 'modelContent', 1);
          expect(request.triggerTimeInSeconds).assertEqual(86400);
          expect(request.title).assertEqual('modelTitle');
          expect(request.content).assertEqual('modelContent');
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_0800
     * @tc.name      testReminderApiModelExtra0008
     * @tc.desc      Verify timer trigger int max is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(2147483647, 1, 'modelTitle', 'modelContent', 1);
          expect(request.triggerTimeInSeconds).assertEqual(2147483647);
          expect(request.ringDuration).assertEqual(1);
          expect(request.notificationId).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_0900
     * @tc.name      testReminderApiModelExtra0009
     * @tc.desc      Verify timer ring zero is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(60, 0, 'modelTitle', 'modelContent', 1);
          expect(request.ringDuration).assertEqual(0);
          expect(request.triggerTimeInSeconds).assertEqual(60);
          expect(request.notificationId).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_1000
     * @tc.name      testReminderApiModelExtra0010
     * @tc.desc      Verify timer ring one is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(60, 1, 'modelTitle', 'modelContent', 1);
          expect(request.ringDuration).assertEqual(1);
          expect(request.title).assertEqual('modelTitle');
          expect(request.content).assertEqual('modelContent');
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_1100
     * @tc.name      testReminderApiModelExtra0011
     * @tc.desc      Verify timer ring thirty is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(60, 30, 'modelTitle', 'modelContent', 1);
          expect(request.ringDuration).assertEqual(30);
          expect(request.triggerTimeInSeconds).assertEqual(60);
          expect(request.notificationId).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_1200
     * @tc.name      testReminderApiModelExtra0012
     * @tc.desc      Verify timer empty title is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(60, 1, '', 'modelContent', 1);
          expect(request.title).assertEqual('');
          expect(request.triggerTimeInSeconds).assertEqual(60);
          expect(request.ringDuration).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_1300
     * @tc.name      testReminderApiModelExtra0013
     * @tc.desc      Verify timer long title is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(60, 1, 'titleTitleTitleTitleTitleTitleTitleTitle', 'modelContent', 1);
          expect(request.title).assertEqual('titleTitleTitleTitleTitleTitleTitleTitle');
          expect(request.triggerTimeInSeconds).assertEqual(60);
          expect(request.ringDuration).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_1400
     * @tc.name      testReminderApiModelExtra0014
     * @tc.desc      Verify timer empty content is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(60, 1, 'modelTitle', '', 1);
          expect(request.content).assertEqual('');
          expect(request.triggerTimeInSeconds).assertEqual(60);
          expect(request.ringDuration).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_1500
     * @tc.name      testReminderApiModelExtra0015
     * @tc.desc      Verify timer long content is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(60, 1, 'modelTitle', 'contentContentContentContentContentContent', 1);
          expect(request.content).assertEqual('contentContentContentContentContentContent');
          expect(request.triggerTimeInSeconds).assertEqual(60);
          expect(request.ringDuration).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_1600
     * @tc.name      testReminderApiModelExtra0016
     * @tc.desc      Verify timer notification id zero is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(60, 1, 'modelTitle', 'modelContent', 0);
          expect(request.notificationId).assertEqual(0);
          expect(request.triggerTimeInSeconds).assertEqual(60);
          expect(request.ringDuration).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_1700
     * @tc.name      testReminderApiModelExtra0017
     * @tc.desc      Verify timer notification id one is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(60, 1, 'modelTitle', 'modelContent', 1);
          expect(request.notificationId).assertEqual(1);
          expect(request.title).assertEqual('modelTitle');
          expect(request.content).assertEqual('modelContent');
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_1800
     * @tc.name      testReminderApiModelExtra0018
     * @tc.desc      Verify timer notification id int max is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(60, 1, 'modelTitle', 'modelContent', 2147483647);
          expect(request.notificationId).assertEqual(2147483647);
          expect(request.triggerTimeInSeconds).assertEqual(60);
          expect(request.ringDuration).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_1900
     * @tc.name      testReminderApiModelExtra0019
     * @tc.desc      Verify timer slot type is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(60, 1, 'modelTitle', 'modelContent', 1);
          expect(String(request.slotType)).assertEqual(String(notificationManager.SlotType.CONTENT_INFORMATION));
          expect(request.triggerTimeInSeconds).assertEqual(60);
          expect(request.ringDuration).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_2000
     * @tc.name      testReminderApiModelExtra0020
     * @tc.desc      Verify timer want agent package is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(60, 1, 'modelTitle', 'modelContent', 1);
          expect(request.wantAgent?.pkgName).assertEqual('com.example.reminderagentmanager');
          expect(request.triggerTimeInSeconds).assertEqual(60);
          expect(request.ringDuration).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_2100
     * @tc.name      testReminderApiModelExtra0021
     * @tc.desc      Verify timer want agent ability is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = timerRequest(60, 1, 'modelTitle', 'modelContent', 1);
          expect(request.wantAgent?.abilityName).assertEqual('EntryAbility');
          expect(request.triggerTimeInSeconds).assertEqual(60);
          expect(request.ringDuration).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_2200
     * @tc.name      testReminderApiModelExtra0022
     * @tc.desc      Verify alarm hour zero is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = alarmRequest(0, 0, []);
          expect(request.hour).assertEqual(0);
          expect(request.minute).assertEqual(0);
          expect(request.daysOfWeek?.length).assertEqual(0);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_2300
     * @tc.name      testReminderApiModelExtra0023
     * @tc.desc      Verify alarm hour twenty three is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = alarmRequest(23, 0, []);
          expect(request.hour).assertEqual(23);
          expect(request.minute).assertEqual(0);
          expect(request.daysOfWeek?.length).assertEqual(0);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_2400
     * @tc.name      testReminderApiModelExtra0024
     * @tc.desc      Verify alarm minute zero is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = alarmRequest(1, 0, []);
          expect(request.hour).assertEqual(1);
          expect(request.minute).assertEqual(0);
          expect(request.daysOfWeek?.length).assertEqual(0);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_2500
     * @tc.name      testReminderApiModelExtra0025
     * @tc.desc      Verify alarm minute fifty nine is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = alarmRequest(1, 59, []);
          expect(request.hour).assertEqual(1);
          expect(request.minute).assertEqual(59);
          expect(request.daysOfWeek?.length).assertEqual(0);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_2600
     * @tc.name      testReminderApiModelExtra0026
     * @tc.desc      Verify alarm empty days is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = alarmRequest(1, 1, []);
          expect(request.daysOfWeek?.length).assertEqual(0);
          expect(request.hour).assertEqual(1);
          expect(request.minute).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_2700
     * @tc.name      testReminderApiModelExtra0027
     * @tc.desc      Verify alarm single day is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = alarmRequest(1, 1, [1]);
          expect(request.daysOfWeek?.length).assertEqual(1);
          expect(request.daysOfWeek?.[0]).assertEqual(1);
          expect(request.minute).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_2800
     * @tc.name      testReminderApiModelExtra0028
     * @tc.desc      Verify alarm multiple days are preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = alarmRequest(1, 1, [1,3,5]);
          expect(request.daysOfWeek?.length).assertEqual(3);
          expect(request.daysOfWeek?.[0]).assertEqual(1);
          expect(request.daysOfWeek?.[2]).assertEqual(5);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_2900
     * @tc.name      testReminderApiModelExtra0029
     * @tc.desc      Verify calendar leap day fields are preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = calendarRequest(2024, 2, 29, 0, 0);
          expect(request.dateTime.year).assertEqual(2024);
          expect(request.dateTime.month).assertEqual(2);
          expect(request.dateTime.day).assertEqual(29);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_MODEL_EXTRA_3000
     * @tc.name      testReminderApiModelExtra0030
     * @tc.desc      Verify calendar time fields are preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiModelExtra0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request = calendarRequest(2026, 11, 4, 23, 59);
          expect(request.dateTime.hour).assertEqual(23);
          expect(request.dateTime.minute).assertEqual(59);
          expect(request.dateTime.year).assertEqual(2026);
        } catch (err) {
          expect().assertFail();
        }
      });

  });
}
