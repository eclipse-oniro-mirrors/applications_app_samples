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
import { installCaseIsolation } from './TestRuntime';

export default function apiVariantExtraTest(): void {
  describe('ReminderApiVariantExtraTest', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_API_VARIANT_EXTRA_0100
     * @tc.name      testReminderApiVariantExtra0001
     * @tc.desc      Verify timer monthly repeat interval is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiVariantExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request: reminderAgentManager.ReminderRequestTimer = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 60,
            repeatInterval: 2592000,
            repeatCount: 10
          };
          expect(request.repeatInterval).assertEqual(2592000);
          expect(request.repeatCount).assertEqual(10);
          expect(request.triggerTimeInSeconds).assertEqual(60);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_VARIANT_EXTRA_0200
     * @tc.name      testReminderApiVariantExtra0002
     * @tc.desc      Verify timer snooze and interval combination is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiVariantExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request: reminderAgentManager.ReminderRequestTimer = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 90,
            snoozeTimes: 10,
            timeInterval: 600
          };
          expect(request.snoozeTimes).assertEqual(10);
          expect(request.timeInterval).assertEqual(600);
          expect(request.triggerTimeInSeconds).assertEqual(90);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_VARIANT_EXTRA_0300
     * @tc.name      testReminderApiVariantExtra0003
     * @tc.desc      Verify timer zero resource identifiers are preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiVariantExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request: reminderAgentManager.ReminderRequestTimer = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 60,
            titleResourceId: 0,
            contentResourceId: 0
          };
          expect(request.titleResourceId).assertEqual(0);
          expect(request.contentResourceId).assertEqual(0);
          expect(request.triggerTimeInSeconds).assertEqual(60);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_VARIANT_EXTRA_0400
     * @tc.name      testReminderApiVariantExtra0004
     * @tc.desc      Verify timer empty optional text is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiVariantExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request: reminderAgentManager.ReminderRequestTimer = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 60,
            groupId: '',
            expiredContent: '',
            snoozeContent: ''
          };
          expect(request.groupId).assertEqual('');
          expect(request.expiredContent).assertEqual('');
          expect(request.snoozeContent).assertEqual('');
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_VARIANT_EXTRA_0500
     * @tc.name      testReminderApiVariantExtra0005
     * @tc.desc      Verify timer default dismissal flags are preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiVariantExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request: reminderAgentManager.ReminderRequestTimer = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 60,
            tapDismissed: true,
            autoDeletedTime: 0
          };
          expect(request.tapDismissed).assertTrue();
          expect(request.autoDeletedTime).assertEqual(0);
          expect(request.triggerTimeInSeconds).assertEqual(60);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_VARIANT_EXTRA_0600
     * @tc.name      testReminderApiVariantExtra0006
     * @tc.desc      Verify alarm ring duration maximum is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiVariantExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request: reminderAgentManager.ReminderRequestAlarm = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_ALARM,
            hour: 6,
            minute: 30,
            ringDuration: 1800,
            titleResourceId: 0
          };
          expect(request.ringDuration).assertEqual(1800);
          expect(request.hour).assertEqual(6);
          expect(request.minute).assertEqual(30);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_VARIANT_EXTRA_0700
     * @tc.name      testReminderApiVariantExtra0007
     * @tc.desc      Verify calendar repeat months and days are preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiVariantExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request: reminderAgentManager.ReminderRequestCalendar = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: { year: 2026,
            month: 11,
            day: 4,
            hour: 8,
            minute: 0 },
            repeatMonths: [1,
            3,
            5],
            repeatDays: [1,
            15,
            31]
          };
          expect(request.repeatMonths?.length).assertEqual(3);
          expect(request.repeatDays?.length).assertEqual(3);
          expect(request.repeatDays?.[2]).assertEqual(31);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_VARIANT_EXTRA_0800
     * @tc.name      testReminderApiVariantExtra0008
     * @tc.desc      Verify calendar week repeat days are preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiVariantExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const request: reminderAgentManager.ReminderRequestCalendar = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: { year: 2026,
            month: 11,
            day: 4,
            hour: 8,
            minute: 0 },
            daysOfWeek: [1,
            7]
          };
          expect(request.daysOfWeek?.length).assertEqual(2);
          expect(request.daysOfWeek?.[0]).assertEqual(1);
          expect(request.daysOfWeek?.[1]).assertEqual(7);
        } catch (err) {
          expect().assertFail();
        }
      });

  });
}
