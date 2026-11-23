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
     * @tc.desc Validate read/write order with authResults [-2147483648, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0011', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [-2147483648, 0]
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_1200
     * @tc.name CalendarEventPermissionValidation_0012
     * @tc.desc Validate read/write order with authResults [-1, 2]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0012', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [-1, 2]
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_1300
     * @tc.name CalendarEventPermissionValidation_0013
     * @tc.desc Validate read/write order with authResults []; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0013', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: []
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
      expect(statuses.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_1400
     * @tc.name CalendarEventPermissionValidation_0014
     * @tc.desc Validate read/write order with authResults [0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0014', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0]
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
      expect(statuses.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_1500
     * @tc.name CalendarEventPermissionValidation_0015
     * @tc.desc Validate read/write order with authResults [0, 0, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0015', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0, 0]
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
      expect(statuses.length).assertEqual(3);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_1600
     * @tc.name CalendarEventPermissionValidation_0016
     * @tc.desc Validate write/read order with authResults [0, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0016', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_1700
     * @tc.name CalendarEventPermissionValidation_0017
     * @tc.desc Validate write/read order with authResults [0, -1]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0017', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_1800
     * @tc.name CalendarEventPermissionValidation_0018
     * @tc.desc Validate write/read order with authResults [-1, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0018', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_1900
     * @tc.name CalendarEventPermissionValidation_0019
     * @tc.desc Validate write/read order with authResults [0, 1]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0019', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_2000
     * @tc.name CalendarEventPermissionValidation_0020
     * @tc.desc Validate write/read order with authResults [1, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0020', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_2100
     * @tc.name CalendarEventPermissionValidation_0021
     * @tc.desc Validate write/read order with authResults [0, 2]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0021', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_2200
     * @tc.name CalendarEventPermissionValidation_0022
     * @tc.desc Validate write/read order with authResults [2, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0022', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_2300
     * @tc.name CalendarEventPermissionValidation_0023
     * @tc.desc Validate write/read order with authResults [0, 2147483647]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0023', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_2400
     * @tc.name CalendarEventPermissionValidation_0024
     * @tc.desc Validate write/read order with authResults [2147483647, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0024', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_2500
     * @tc.name CalendarEventPermissionValidation_0025
     * @tc.desc Validate write/read order with authResults [0, -2147483648]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0025', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_2600
     * @tc.name CalendarEventPermissionValidation_0026
     * @tc.desc Validate write/read order with authResults [-2147483648, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0026', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [-2147483648, 0]
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_2700
     * @tc.name CalendarEventPermissionValidation_0027
     * @tc.desc Validate write/read order with authResults [-1, 2]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0027', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [-1, 2]
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_2800
     * @tc.name CalendarEventPermissionValidation_0028
     * @tc.desc Validate write/read order with authResults []; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0028', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: []
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
      expect(statuses.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_2900
     * @tc.name CalendarEventPermissionValidation_0029
     * @tc.desc Validate write/read order with authResults [0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0029', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0]
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
      expect(statuses.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_3000
     * @tc.name CalendarEventPermissionValidation_0030
     * @tc.desc Validate write/read order with authResults [0, 0, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0030', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0, 0]
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
      expect(statuses.length).assertEqual(3);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_3100
     * @tc.name CalendarEventPermissionValidation_0031
     * @tc.desc Validate empty permissions with authResults [0, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0031', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
        ],
        authResults: [0, 0]
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
      expect(permissions.length).assertEqual(0);
      expect(statuses.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_3200
     * @tc.name CalendarEventPermissionValidation_0032
     * @tc.desc Validate read only with authResults [0, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0032', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
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
      expect(permissions.length).assertEqual(1);
      expect(statuses.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_3300
     * @tc.name CalendarEventPermissionValidation_0033
     * @tc.desc Validate write only with authResults [0, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0033', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
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
      expect(permissions.length).assertEqual(1);
      expect(statuses.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_3400
     * @tc.name CalendarEventPermissionValidation_0034
     * @tc.desc Validate duplicate reads with authResults [0, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0034', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_3500
     * @tc.name CalendarEventPermissionValidation_0035
     * @tc.desc Validate duplicate writes with authResults [0, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0035', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_3600
     * @tc.name CalendarEventPermissionValidation_0036
     * @tc.desc Validate read then unknown with authResults [0, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0036', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.UNKNOWN_CALENDAR'
        ],
        authResults: [0, 0]
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_3700
     * @tc.name CalendarEventPermissionValidation_0037
     * @tc.desc Validate unknown then write with authResults [0, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0037', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.UNKNOWN_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_3800
     * @tc.name CalendarEventPermissionValidation_0038
     * @tc.desc Validate write then unknown with authResults [0, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0038', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.UNKNOWN_CALENDAR'
        ],
        authResults: [0, 0]
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_3900
     * @tc.name CalendarEventPermissionValidation_0039
     * @tc.desc Validate extra unknown with authResults [0, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0039', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.UNKNOWN_CALENDAR'
        ],
        authResults: [0, 0]
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
      expect(permissions.length).assertEqual(3);
      expect(statuses.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_4000
     * @tc.name CalendarEventPermissionValidation_0040
     * @tc.desc Validate extra duplicate with authResults [0, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0040', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
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
      expect(permissions.length).assertEqual(3);
      expect(statuses.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_4100
     * @tc.name CalendarEventPermissionValidation_0041
     * @tc.desc Validate case-mismatched read with authResults [0, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0041', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.read_calendar',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_4200
     * @tc.name CalendarEventPermissionValidation_0042
     * @tc.desc Validate whitespace-suffixed write with authResults [0, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0042', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR '
        ],
        authResults: [0, 0]
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
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_4300
     * @tc.name CalendarEventPermissionValidation_0043
     * @tc.desc Validate empty permissions with authResults []; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0043', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
        ],
        authResults: []
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
      expect(permissions.length).assertEqual(0);
      expect(statuses.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_4400
     * @tc.name CalendarEventPermissionValidation_0044
     * @tc.desc Validate read only with authResults [0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0044', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0]
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
      expect(permissions.length).assertEqual(1);
      expect(statuses.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_4500
     * @tc.name CalendarEventPermissionValidation_0045
     * @tc.desc Validate write only with authResults [0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0045', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0]
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
      expect(permissions.length).assertEqual(1);
      expect(statuses.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_4600
     * @tc.name CalendarEventPermissionValidation_0046
     * @tc.desc Validate extra unknown with authResults [0, 0, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0046', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.UNKNOWN_CALENDAR'
        ],
        authResults: [0, 0, 0]
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
      expect(permissions.length).assertEqual(3);
      expect(statuses.length).assertEqual(3);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_VALIDATION_4700
     * @tc.name CalendarEventPermissionValidation_0047
     * @tc.desc Validate extra duplicate with authResults [0, 0, 0]; preserve shared arrays on repeated calls.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionValidation_0047', 0, (): void => {
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0, 0]
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
      expect(permissions.length).assertEqual(3);
      expect(statuses.length).assertEqual(3);
    });
  });
}
