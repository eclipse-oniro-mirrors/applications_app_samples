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
import type { PermissionRequestResult } from '@kit.AbilityKit';

const CALENDAR_PERMISSIONS: string[] = [
  'ohos.permission.READ_CALENDAR',
  'ohos.permission.WRITE_CALENDAR'
];

/** Validate both requested permissions, independent of the returned ordering. */
export function hasCalendarPermissions(result: PermissionRequestResult): boolean {
  if (result.permissions.length !== CALENDAR_PERMISSIONS.length ||
    result.authResults.length !== CALENDAR_PERMISSIONS.length) {
    return false;
  }
  return CALENDAR_PERMISSIONS.every((permission: string): boolean => {
    const index: number = result.permissions.indexOf(permission);
    return index >= 0 && result.authResults[index] === 0;
  });
}

export interface CalendarPermissionHandlers {
  onGranted: (result: PermissionRequestResult) => void;
  onDenied: (result: PermissionRequestResult) => void;
  onFailed: () => void;
}

/** Apply only the latest permission result while returning the SDK result or rejection unchanged. */
export class CalendarPermissionGate {
  private generation: number = 0;

  async request(requester: () => Promise<PermissionRequestResult>,
    handlers: CalendarPermissionHandlers): Promise<PermissionRequestResult> {
    const generation: number = ++this.generation;
    try {
      const result: PermissionRequestResult = await requester();
      if (generation === this.generation) {
        if (hasCalendarPermissions(result)) {
          handlers.onGranted(result);
        } else {
          handlers.onDenied(result);
        }
      }
      return result;
    } catch (error) {
      if (generation === this.generation) {
        handlers.onFailed();
      }
      throw error as Error;
    }
  }

  invalidate(): void {
    this.generation++;
  }
}
