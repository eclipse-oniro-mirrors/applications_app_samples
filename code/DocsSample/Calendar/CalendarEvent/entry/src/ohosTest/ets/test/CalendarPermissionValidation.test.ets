/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe } from '@ohos/hypium';
import type { PermissionRequestResult } from '@kit.AbilityKit';
import { it, expect } from './TestSupport';
import { hasCalendarPermissions } from '../../../main/ets/CalendarPermission';

export default function calendarPermissionValidationTest(): void {
  describe('CalendarPermissionValidation', (): void => {
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_0100
     * @tc.name CalendarEventPermissionValidation_0001
     * @tc.desc Validate read/write order with authResults [0, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0001', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      const first: boolean = hasCalendarPermissions(result);
      expect(first).assertEqual(true);
      const repeated: boolean = hasCalendarPermissions(result);
      expect(repeated).assertEqual(true);
      expect(result.permissions === permissions).assertEqual(true);
      expect(result.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
      expect(permissions.length).assertEqual(2);
      expect(statuses.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_0200
     * @tc.name CalendarEventPermissionValidation_0002
     * @tc.desc Validate read/write order with authResults [0, -1]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0002', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      const first: boolean = hasCalendarPermissions(result);
      expect(first).assertEqual(false);
      const repeated: boolean = hasCalendarPermissions(result);
      expect(repeated).assertEqual(false);
      expect(result.permissions === permissions).assertEqual(true);
      expect(result.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
      expect(permissions.length).assertEqual(2);
      expect(statuses.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_0300
     * @tc.name CalendarEventPermissionValidation_0003
     * @tc.desc Validate read/write order with authResults [-1, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0003', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [-1, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      const first: boolean = hasCalendarPermissions(result);
      expect(first).assertEqual(false);
      const repeated: boolean = hasCalendarPermissions(result);
      expect(repeated).assertEqual(false);
      expect(result.permissions === permissions).assertEqual(true);
      expect(result.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
      expect(permissions.length).assertEqual(2);
      expect(statuses.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_0400
     * @tc.name CalendarEventPermissionValidation_0004
     * @tc.desc Validate read/write order with authResults [0, 1]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0004', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 1]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      const first: boolean = hasCalendarPermissions(result);
      expect(first).assertEqual(false);
      const repeated: boolean = hasCalendarPermissions(result);
      expect(repeated).assertEqual(false);
      expect(result.permissions === permissions).assertEqual(true);
      expect(result.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
      expect(permissions.length).assertEqual(2);
      expect(statuses.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_0500
     * @tc.name CalendarEventPermissionValidation_0005
     * @tc.desc Validate read/write order with authResults [1, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0005', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [1, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      const first: boolean = hasCalendarPermissions(result);
      expect(first).assertEqual(false);
      const repeated: boolean = hasCalendarPermissions(result);
      expect(repeated).assertEqual(false);
      expect(result.permissions === permissions).assertEqual(true);
      expect(result.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
      expect(permissions.length).assertEqual(2);
      expect(statuses.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_0600
     * @tc.name CalendarEventPermissionValidation_0006
     * @tc.desc Validate read/write order with authResults [0, 2]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0006', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 2]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      const first: boolean = hasCalendarPermissions(result);
      expect(first).assertEqual(false);
      const repeated: boolean = hasCalendarPermissions(result);
      expect(repeated).assertEqual(false);
      expect(result.permissions === permissions).assertEqual(true);
      expect(result.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
      expect(permissions.length).assertEqual(2);
      expect(statuses.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_0700
     * @tc.name CalendarEventPermissionValidation_0007
     * @tc.desc Validate read/write order with authResults [2, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0007', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [2, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      const first: boolean = hasCalendarPermissions(result);
      expect(first).assertEqual(false);
      const repeated: boolean = hasCalendarPermissions(result);
      expect(repeated).assertEqual(false);
      expect(result.permissions === permissions).assertEqual(true);
      expect(result.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
      expect(permissions.length).assertEqual(2);
      expect(statuses.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_0800
     * @tc.name CalendarEventPermissionValidation_0008
     * @tc.desc Validate read/write order with authResults [0, 2147483647]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0008', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 2147483647]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      const first: boolean = hasCalendarPermissions(result);
      expect(first).assertEqual(false);
      const repeated: boolean = hasCalendarPermissions(result);
      expect(repeated).assertEqual(false);
      expect(result.permissions === permissions).assertEqual(true);
      expect(result.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
      expect(permissions.length).assertEqual(2);
      expect(statuses.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_0900
     * @tc.name CalendarEventPermissionValidation_0009
     * @tc.desc Validate read/write order with authResults [2147483647, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0009', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [2147483647, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      const first: boolean = hasCalendarPermissions(result);
      expect(first).assertEqual(false);
      const repeated: boolean = hasCalendarPermissions(result);
      expect(repeated).assertEqual(false);
      expect(result.permissions === permissions).assertEqual(true);
      expect(result.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
      expect(permissions.length).assertEqual(2);
      expect(statuses.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_1000
     * @tc.name CalendarEventPermissionValidation_0010
     * @tc.desc Validate read/write order with authResults [0, -2147483648]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0010', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -2147483648]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      const first: boolean = hasCalendarPermissions(result);
      expect(first).assertEqual(false);
      const repeated: boolean = hasCalendarPermissions(result);
      expect(repeated).assertEqual(false);
      expect(result.permissions === permissions).assertEqual(true);
      expect(result.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
      expect(permissions.length).assertEqual(2);
      expect(statuses.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_1100
     * @tc.name CalendarEventPermissionValidation_0011