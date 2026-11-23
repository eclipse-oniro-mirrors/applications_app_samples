/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { calendarManager } from '@kit.CalendarKit';
import { CalendarAccountSession } from '../main/ets/CalendarAccountSession';

export default function localUnitTest(): void {
  describe('CalendarManagerLocalLogic', (): void => {
    /**
     * @tc.number SUB_CALENDAR_MANAGER_LOCAL_ACCOUNT_0100
     * @tc.name testCalendarManagerLocalAccount0001
     * @tc.desc Verify fixed account fields and independence after mutating a previously returned account.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerLocalAccount0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const TAG: string = 'testCalendarManagerLocalAccount0001';
        console.info(`${TAG} start`);
        try {
          const first: calendarManager.CalendarAccount = CalendarAccountSession.account();
          first.displayName = 'modified';
          const second: calendarManager.CalendarAccount = CalendarAccountSession.account();
          console.info(`${TAG} account.name=${second.name}`);
          expect(second.name).assertEqual('MyCalendar');
          console.info(`${TAG} account.displayName=${second.displayName}`);
          expect(second.displayName).assertEqual('MyCalendar');
          console.info(`${TAG} account.type=${second.type}`);
          expect(second.type).assertEqual(calendarManager.CalendarType.LOCAL);
          console.info(`${TAG} sameAccount=${first === second}`);
          expect(first === second).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });
  });
}
