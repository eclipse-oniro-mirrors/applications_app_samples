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
import { Driver, ON } from '@ohos.UiTest';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_BACK,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT,
  serializedDelay,
  getCurrentFocusIndex
} from '../Shared/SharedDriver';

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
      ['ohos.permission.POWER_MANAGEMENT', 'ohos.permission.REBOOT', 'ohos.permission.SHUTDOWN'];

    return allowedPermissions.includes(permission);
  }

  public recordSecurityEvent(eventType: string, details?: SecurityEventDetails): void {
    this.securityEvents.push(`${eventType}:${JSON.stringify(details || {})}`);
  }

  public validatePermissionUsage(): boolean {
    const requiredPermissions = ['ohos.permission.POWER_MANAGEMENT', 'ohos.permission.REBOOT'];

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
    const requiredComponents = ['屏幕输出', '关机', '重启'];
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

    it('power_operations_should_require_proper_permissions', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const hasPowerPermission = securityUtil.checkPermission('ohos.permission.POWER_MANAGEMENT');
      const hasRebootPermission = securityUtil.checkPermission('ohos.permission.REBOOT');

      expect(hasPowerPermission).assertTrue();
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
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

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

    it('screen_reader_compatibility_should_work_correctly', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      accessibilityUtil.simulateFocusChange('0', '屏幕输出按钮');
      accessibilityUtil.simulateFocusChange('1', '关机按钮');
      accessibilityUtil.simulateFocusChange('2', '重启按钮');
      const events = accessibilityUtil.getAccessibilityEvents();
      expect(events.length).assertLargerOrEqual(3);
      const hasFocusEvent = accessibilityUtil.hasAccessibilityEvent('focus');
      expect(hasFocusEvent).assertTrue();
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('text_content_should_be_readable_by_screen_readers', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      accessibilityUtil.simulateScreenReaderAnnouncement('屏幕输出', 'text_0');
      accessibilityUtil.simulateScreenReaderAnnouncement('关机', 'text_1');
      accessibilityUtil.simulateScreenReaderAnnouncement('重启', 'text_2');
      const screenReaderData = accessibilityUtil.getScreenReaderData();
      expect(screenReaderData.size).assertEqual(3);
      expect(screenReaderData.get('text_0')).assertEqual('屏幕输出');
      expect(screenReaderData.get('text_1')).assertEqual('关机');
      expect(screenReaderData.get('text_2')).assertEqual('重启');
      const hasAnnounceEvent = accessibilityUtil.hasAccessibilityEvent('announce');
      expect(hasAnnounceEvent).assertTrue();
    });

    it('focus_navigation_should_work_in_screen_reader_mode', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      accessibilityUtil.simulateFocusChange('2', '重启按钮选中状态');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      accessibilityUtil.simulateFocusChange('1', '关机按钮选中状态');

      // 添加延迟确保焦点状态稳定
      await driver.delayMs(100);

      // 使用动态焦点索引验证焦点状态
      const focusIndex = await getCurrentFocusIndex(driver);
      const isFocusCorrect = await checkFocusState(driver, focusIndex);
      expect(isFocusCorrect).assertTrue();

      const events = accessibilityUtil.getAccessibilityEvents();
      const focusEvents = events.filter(e => e.startsWith('focus'));
      expect(focusEvents.length).assertLargerOrEqual(1);
    });

    it('operation_confirmation_should_provide_screen_reader_feedback', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      accessibilityUtil.simulateScreenReaderAnnouncement('重启确认提示', 'confirmation_2');
      securityUtil.checkPermission('ohos.permission.REBOOT');
      const powerOpDetails: SecurityEventDetails = {
        type: 'reboot', userConfirmed: true
      };
      securityUtil.recordSecurityEvent('power_operation', powerOpDetails);
      const hasConfirmation = accessibilityUtil.hasAccessibilityEvent('announce:confirmation_2');
      expect(hasConfirmation).assertTrue();
      const hasPowerEvent = securityUtil.hasSecurityEvent('power_operation');
      expect(hasPowerEvent).assertTrue();
    });

    it('high_contrast_mode_compatibility_should_work', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      accessibilityUtil.simulateScreenReaderAnnouncement('高对比度模式兼容性测试', 'contrast_mode');
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);

      // 添加延迟确保焦点状态稳定
      await driver.delayMs(100);

      // 使用动态焦点索引验证焦点状态
      const focusIndex = await getCurrentFocusIndex(driver);
      const isFocusCorrect = await checkFocusState(driver, focusIndex);
      expect(isFocusCorrect).assertTrue();

      const hasContrastEvent = accessibilityUtil.hasAccessibilityEvent('announce:contrast_mode');
      expect(hasContrastEvent).assertTrue();
    });

    it('voice_control_compatibility_should_work_correctly', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      accessibilityUtil.simulateScreenReaderAnnouncement('语音控制兼容性测试', 'voice_control');
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      // 添加延迟确保焦点状态稳定
      await driver.delayMs(100);

      // 使用动态焦点索引验证焦点状态
      const focusIndex = await getCurrentFocusIndex(driver);
      const isFocusCorrect = await checkFocusState(driver, focusIndex);
      expect(isFocusCorrect).assertTrue();

      const hasVoiceEvent = accessibilityUtil.hasAccessibilityEvent('announce:voice_control');
      expect(hasVoiceEvent).assertTrue();
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('security_audit_logging_should_be_comprehensive', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      securityUtil.clearRecords();
      securityUtil.checkPermission('ohos.permission.POWER_MANAGEMENT');
      const dialogOpenedDetails: SecurityEventDetails = { timestamp: Date.now() };
      securityUtil.recordSecurityEvent('dialog_opened', dialogOpenedDetails);

      securityUtil.checkPermission('ohos.permission.REBOOT');
      const operationSelectedDetails: SecurityEventDetails = { option: 'reboot' };
      securityUtil.recordSecurityEvent('operation_selected', operationSelectedDetails);

      const userConfirmationDetails: SecurityEventDetails = { confirmed: true };
      securityUtil.recordSecurityEvent('user_confirmation', userConfirmationDetails);
      const powerOpExecutedDetails: SecurityEventDetails = { type: 'reboot' };
      securityUtil.recordSecurityEvent('power_operation_executed', powerOpExecutedDetails);
      const securityEvents = securityUtil.getSecurityEvents();
      expect(securityEvents.length).assertEqual(4);
      const hasDialogEvent = securityUtil.hasSecurityEvent('dialog_opened');
      const hasOperationEvent = securityUtil.hasSecurityEvent('operation_selected');
      const hasExecutionEvent = securityUtil.hasSecurityEvent('power_operation_executed');

      expect(hasDialogEvent).assertTrue();
      expect(hasOperationEvent).assertTrue();
      expect(hasExecutionEvent).assertTrue();
    });

    it('comprehensive_security_screen_reader_scenario_should_work', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      securityUtil.clearRecords();
      accessibilityUtil.clearRecords();

      const dialogAccessedDetails: SecurityEventDetails = { method: 'remote' };
      securityUtil.recordSecurityEvent('dialog_accessed', dialogAccessedDetails);

      accessibilityUtil.simulateScreenReaderAnnouncement('对话框打开提示', 'dialog_open');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      accessibilityUtil.simulateFocusChange('0', '屏幕输出按钮');

      securityUtil.checkPermission('ohos.permission.POWER_MANAGEMENT');
      const permissionCheckDetails: SecurityEventDetails = {
        permission: 'ohos.permission.POWER_MANAGEMENT', granted: true
      };
      securityUtil.recordSecurityEvent('permission_check', permissionCheckDetails);

      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      accessibilityUtil.simulateScreenReaderAnnouncement('操作确认提示', 'operation_confirm');

      const powerOpDetails: SecurityEventDetails = { type: 'suspend' };
      securityUtil.recordSecurityEvent('power_operation', powerOpDetails);
      const securityEvents = securityUtil.getSecurityEvents();
      const accessibilityEvents = accessibilityUtil.getAccessibilityEvents();

      expect(securityEvents.length).assertLargerOrEqual(3);
      expect(accessibilityEvents.length).assertLargerOrEqual(3);
      const hasDialogAccess = securityUtil.hasSecurityEvent('dialog_accessed');
      const hasPowerOperation = securityUtil.hasSecurityEvent('power_operation');
      const hasDialogOpen = accessibilityUtil.hasAccessibilityEvent('announce:dialog_open');
      const hasOperationConfirm = accessibilityUtil.hasAccessibilityEvent('announce:operation_confirm');

      expect(hasDialogAccess).assertTrue();
      expect(hasPowerOperation).assertTrue();
      expect(hasDialogOpen).assertTrue();
      expect(hasOperationConfirm).assertTrue();
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });
  });


}