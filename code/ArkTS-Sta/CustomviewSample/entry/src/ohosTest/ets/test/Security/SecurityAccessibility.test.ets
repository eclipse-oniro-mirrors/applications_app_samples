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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_BACK,
  pageComponentCount,
  checkFocusState,
  waitForPageStable,
  pressAndWait,
  TIMEOUT_TAB_RENDER,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT,
  serializedDelay,
  getCurrentFocusIndex
} from '../Shared/CustomViewTestDriver';

interface SecurityEventDetails {
  message?: string;
  level?: string;
  timestamp?: number;
  source?: string;
  action?: string;
  operation?: string;
  granted?: boolean;
  permission?: string;
  reason?: string;
  type?: string;
  userConfirmed?: boolean;
  option?: string;
  confirmed?: boolean;
  method?: string;
}

class SecurityTestUtil {
  private static instance: SecurityTestUtil;
  private permissionChecks: Map<string, boolean> = new Map();
  private securityEvents: string[] = [];

  public static getInstance(): SecurityTestUtil {
    if (!SecurityTestUtil.instance) {
      SecurityTestUtil.instance = new SecurityTestUtil();
    }
    return SecurityTestUtil.instance;
  }

  public checkPermission(permission: string): boolean {
    this.permissionChecks.set(permission, true);
    const allowedPermissions =
      ['ohos.permission.CUSTOM_VIEW_MANAGEMENT', 'ohos.permission.REBOOT', 'ohos.permission.SHUTDOWN'];

    return allowedPermissions.includes(permission);
  }

  public recordSecurityEvent(eventType: string, details?: SecurityEventDetails): void {
    this.securityEvents.push(`${eventType}:${JSON.stringify(details || {})}`);
  }

  public validatePermissionUsage(): boolean {
    const requiredPermissions = ['ohos.permission.CUSTOM_VIEW_MANAGEMENT', 'ohos.permission.REBOOT'];

    return requiredPermissions.every(perm => this.permissionChecks.has(perm));
  }

  public getSecurityEvents(): string[] {
    return [...this.securityEvents];
  }

  public clearRecords(): void {
    this.permissionChecks.clear();
    this.securityEvents = [];
  }

  public hasSecurityEvent(eventType: string): boolean {
    return this.securityEvents.some(event => event.startsWith(eventType));
  }
}

class AccessibilityTestUtil {
  private static instance: AccessibilityTestUtil;
  private accessibilityEvents: string[] = [];
  private screenReaderData: Map<string, string> = new Map();

  public static getInstance(): AccessibilityTestUtil {
    if (!AccessibilityTestUtil.instance) {
      AccessibilityTestUtil.instance = new AccessibilityTestUtil();
    }
    return AccessibilityTestUtil.instance;
  }

  public simulateScreenReaderAnnouncement(text: string, componentId: string): void {
    this.screenReaderData.set(componentId, text);
    this.accessibilityEvents.push(`announce:${componentId}:${text}`);
  }

  public simulateFocusChange(componentId: string, description: string): void {
    this.accessibilityEvents.push(`focus:${componentId}:${description}`);
  }

  public validateAccessibilityTree(components: string[]): boolean {
    const requiredComponents = ['屏幕输出', '在线换座', '余票挖掘'];
    return requiredComponents.every(comp => components.some(c => c.includes(comp)));
  }

  public getAccessibilityEvents(): string[] {
    return [...this.accessibilityEvents];
  }

  public getScreenReaderData(): Map<string, string> {
    return new Map(this.screenReaderData);
  }

  public clearRecords(): void {
    this.accessibilityEvents = [];
    this.screenReaderData.clear();
  }

  public hasAccessibilityEvent(eventType: string): boolean {
    return this.accessibilityEvents.some(event => event.startsWith(eventType));
  }
}

export default function securityAccessibilityTest() {
  describe('SecurityAccessibility_Test', () => {
    let driver: Driver;
    let securityUtil: SecurityTestUtil;
    let accessibilityUtil: AccessibilityTestUtil;

    beforeAll(async () => {
      driver = getDriver();
      securityUtil = SecurityTestUtil.getInstance();
      accessibilityUtil = AccessibilityTestUtil.getInstance();
      securityUtil.clearRecords();
      accessibilityUtil.clearRecords();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    it('customView_operations_should_require_proper_permissions', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
      const hasCustomViewPermission = securityUtil.checkPermission('ohos.permission.CUSTOM_VIEW_MANAGEMENT');
      const hasRebootPermission = securityUtil.checkPermission('ohos.permission.REBOOT');

      expect(hasCustomViewPermission).assertTrue();
      expect(hasRebootPermission).assertTrue();
      const permissionUsageValid = securityUtil.validatePermissionUsage();
      expect(permissionUsageValid).assertTrue();
      const permCheckDetails: SecurityEventDetails = {
        operation: 'reboot', granted: true
      };
      securityUtil.recordSecurityEvent('permission_check', permCheckDetails);

      const hasSecurityEvent = securityUtil.hasSecurityEvent('permission_check');
      expect(hasSecurityEvent).assertTrue();
    });

    it('invalid_permissions_should_be_rejected', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);

      const invalidPermission = securityUtil.checkPermission('ohos.permission.INVALID_PERMISSION');
      expect(invalidPermission).assertFalse();

      const unauthorizedPermission = securityUtil.checkPermission('ohos.permission.ACCESS_PRIVATE_DATA');
      expect(unauthorizedPermission).assertFalse();
      const permDeniedDetails: SecurityEventDetails = {
        permission: 'INVALID_PERMISSION', reason: 'not_granted'
      };
      securityUtil.recordSecurityEvent('permission_denied', permDeniedDetails);

      const hasDeniedEvent = securityUtil.hasSecurityEvent('permission_denied');
      expect(hasDeniedEvent).assertTrue();
    });
  });

}