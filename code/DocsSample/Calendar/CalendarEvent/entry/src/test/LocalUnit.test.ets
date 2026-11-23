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
import { describe, it, expect } from '@ohos/hypium';
import { hasCalendarPermissions } from '../main/ets/CalendarPermission';

export default function localUnitTest(): void {
  describe('CalendarLocalPermissions', (): void => {
    /**
     * @tc.number SUB_CALENDAR_LOCAL_PERMISSIONS_0100
     * @tc.name CalendarEventLocalPermissions_0001
     * @tc.desc Require both granted calendar permissions regardless of SDK result ordering.
     * @tc.type FUNC
     */
    it('CalendarEventLocalPermissions_0001', 0, (): void => {
      console.info('CalendarEventLocalPermissions_0001, begin');
      try {
        const granted: boolean = hasCalendarPermissions({
          permissions: ['ohos.permission.WRITE_CALENDAR', 'ohos.permission.READ_CALENDAR'],
          authResults: [0, 0]
        });
        console.info(`assert granted=${granted}`);
        expect(granted).assertEqual(true);
        const denied: boolean = hasCalendarPermissions({
          permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
          authResults: [0, -1]
        });
        console.info(`assert denied=${denied}`);
        expect(denied).assertEqual(false);
      } finally {
        console.info('CalendarEventLocalPermissions_0001, end');
      }
    });
  });
}
