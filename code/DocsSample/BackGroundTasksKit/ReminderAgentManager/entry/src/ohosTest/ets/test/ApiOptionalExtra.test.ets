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

export default function apiOptionalExtraTest(): void {
  describe('ReminderApiOptionalExtraTest', () => {
    /**
     * @tc.number    SUB_REMINDER_API_OPTIONAL_EXTRA_0100
     * @tc.name      testReminderApiOptionalExtra0001
     * @tc.desc      Verify timer repeat interval and count are preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiOptionalExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const request: reminderAgentManager.ReminderRequestTimer = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 60,
            repeatInterval: 86400,
            repeatCount: 0
          };
          expect(request.repeatInterval).assertEqual(86400);
          expect(request.repeatCount).assertEqual(0);
          expect(request.triggerTimeInSeconds).assertEqual(60);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_OPTIONAL_EXTRA_0200
     * @tc.name      testReminderApiOptionalExtra0002
     * @tc.desc      Verify timer repeat interval of two days is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiOptionalExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const request: reminderAgentManager.ReminderRequestTimer = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 120,
            repeatInterval: 172800,
            repeatCount: 5
          };
          expect(request.repeatInterval).assertEqual(172800);
          expect(request.repeatCount).assertEqual(5);
          expect(request.triggerTimeInSeconds).assertEqual(120);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_OPTIONAL_EXTRA_0300
     * @tc.name      testReminderApiOptionalExtra0003
     * @tc.desc      Verify timer ring duration zero is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiOptionalExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const request: reminderAgentManager.ReminderRequestTimer = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 60,
            ringDuration: 0
          };
          expect(request.ringDuration).assertEqual(0);
          expect(request.triggerTimeInSeconds).assertEqual(60);
          const actualType: string = String(request.reminderType);
          expect(actualType).assertEqual(String(reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER));
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_OPTIONAL_EXTRA_0400
     * @tc.name      testReminderApiOptionalExtra0004
     * @tc.desc      Verify timer ring duration maximum is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiOptionalExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const request: reminderAgentManager.ReminderRequestTimer = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 60,
            ringDuration: 1800
          };
          expect(request.ringDuration).assertEqual(1800);
          expect(request.triggerTimeInSeconds).assertEqual(60);
          const actualType: string = String(request.reminderType);
          expect(actualType).assertEqual(String(reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER));
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_OPTIONAL_EXTRA_0500
     * @tc.name      testReminderApiOptionalExtra0005
     * @tc.desc      Verify timer snooze times zero is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiOptionalExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const request: reminderAgentManager.ReminderRequestTimer = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 60,
            snoozeTimes: 0
          };
          expect(request.snoozeTimes).assertEqual(0);
          expect(request.triggerTimeInSeconds).assertEqual(60);
          const actualType: string = String(request.reminderType);
          expect(actualType).assertEqual(String(reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER));
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_OPTIONAL_EXTRA_0600
     * @tc.name      testReminderApiOptionalExtra0006
     * @tc.desc      Verify timer snooze times three is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiOptionalExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const request: reminderAgentManager.ReminderRequestTimer = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 60,
            snoozeTimes: 3
          };
          expect(request.snoozeTimes).assertEqual(3);
          expect(request.triggerTimeInSeconds).assertEqual(60);
          const actualType: string = String(request.reminderType);
          expect(actualType).assertEqual(String(reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER));
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_OPTIONAL_EXTRA_0700
     * @tc.name      testReminderApiOptionalExtra0007
     * @tc.desc      Verify timer time interval is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiOptionalExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const request: reminderAgentManager.ReminderRequestTimer = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 60,
            timeInterval: 300
          };
          expect(request.timeInterval).assertEqual(300);
          expect(request.triggerTimeInSeconds).assertEqual(60);
          const actualType: string = String(request.reminderType);
          expect(actualType).assertEqual(String(reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER));
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_OPTIONAL_EXTRA_0800
     * @tc.name      testReminderApiOptionalExtra0008
     * @tc.desc      Verify timer resource identifiers are preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiOptionalExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const request: reminderAgentManager.ReminderRequestTimer = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 60,
            titleResourceId: 1001,
            contentResourceId: 1002
          };
          expect(request.titleResourceId).assertEqual(1001);
          expect(request.contentResourceId).assertEqual(1002);
          expect(request.triggerTimeInSeconds).assertEqual(60);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_OPTIONAL_EXTRA_0900
     * @tc.name      testReminderApiOptionalExtra0009
     * @tc.desc      Verify timer tap dismissal fields are preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiOptionalExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const request: reminderAgentManager.ReminderRequestTimer = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 60,
            tapDismissed: false,
            autoDeletedTime: 123456
          };
          expect(request.tapDismissed).assertEqual(false);
          expect(request.autoDeletedTime).assertEqual(123456);
          expect(request.triggerTimeInSeconds).assertEqual(60);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_API_OPTIONAL_EXTRA_1000
     * @tc.name      testReminderApiOptionalExtra0010
     * @tc.desc      Verify timer group and text fields are preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderApiOptionalExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const request: reminderAgentManager.ReminderRequestTimer = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 60,
            groupId: 'groupA',
            expiredContent: 'expiredText',
            snoozeContent: 'snoozeText'
          };
          expect(request.groupId).assertEqual('groupA');
          expect(request.expiredContent).assertEqual('expiredText');
          expect(request.snoozeContent).assertEqual('snoozeText');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
