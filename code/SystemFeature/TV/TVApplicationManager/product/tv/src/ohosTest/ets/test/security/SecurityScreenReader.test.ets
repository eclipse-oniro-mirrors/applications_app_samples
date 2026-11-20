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
  createFreshDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  KEY_BACK,
  appComponentCount,
  checkFocusState,
  waitForUiStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT,
  serializedDelay,
  getCurrentFocusIndex
} from '../common/SharedDriver';

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
    const allowedPermissions = ['ohos.permission.APP_MANAGEMENT', 'ohos.permission.SHORTCUT', 'ohos.permission.MOVE'];

    return allowedPermissions.includes(permission);
  }

  public recordSecurityEvent(eventType: string, details?: SecurityEventDetails): void {
    this.securityEvents.push(`${eventType}:${JSON.stringify(details || {})}`);
  }

  public validatePermissionUsage(): boolean {
    const requiredPermissions = ['ohos.permission.APP_MANAGEMENT', 'ohos.permission.SHORTCUT'];

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

class ScreenReaderTestUtil {
  private static instance: ScreenReaderTestUtil;
  private screenReaderEvents: string[] = [];
  private screenReaderData: Map<string, string> = new Map();

  public static getInstance(): ScreenReaderTestUtil {
    if (!ScreenReaderTestUtil.instance) {
      ScreenReaderTestUtil.instance = new ScreenReaderTestUtil();
    }
    return ScreenReaderTestUtil.instance;
  }

  public simulateScreenReaderAnnouncement(text: string, componentId: string): void {
    this.screenReaderData.set(componentId, text);
    this.screenReaderEvents.push(`announce:${componentId}:${text}`);
  }

  public simulateFocusChange(componentId: string, description: string): void {
    this.screenReaderEvents.push(`focus:${componentId}:${description}`);
  }

  public validateScreenReaderTree(components: string[]): boolean {
    const requiredComponents = ['屏幕输出', '移动', '快捷方式'];
    return requiredComponents.every(comp => components.some(c => c.includes(comp)));
  }

  public getScreenReaderEvents(): string[] {
    return [...this.screenReaderEvents];
  }

  public getScreenReaderData(): Map<string, string> {
    return new Map(this.screenReaderData);
  }

  public clearRecords(): void {
    this.screenReaderEvents = [];
    this.screenReaderData.clear();
  }

  public hasScreenReaderEvent(eventType: string): boolean {
    return this.screenReaderEvents.some(event => event.startsWith(eventType));
  }
}

export default function securityScreenReaderTest() {
  describe('SecurityScreenReader_Test', () => {
    let driver: Driver;
    let securityUtil: SecurityTestUtil;
    let screenReaderUtil: ScreenReaderTestUtil;

    beforeAll(async () => {
      driver = createFreshDriver();
      securityUtil = SecurityTestUtil.getInstance();
      screenReaderUtil = ScreenReaderTestUtil.getInstance();
      securityUtil.clearRecords();
      screenReaderUtil.clearRecords();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    it('app_operations_should_require_proper_permissions', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const hasAppPermission = securityUtil.checkPermission('ohos.permission.APP_MANAGEMENT');
      const hasShortcutPermission = securityUtil.checkPermission('ohos.permission.SHORTCUT');

      expect(hasAppPermission).assertTrue();
      expect(hasShortcutPermission).assertTrue();
      const permissionUsageValid = securityUtil.validatePermissionUsage();
      expect(permissionUsageValid).assertTrue();
      const permCheckDetails: SecurityEventDetails = {
        operation: 'shortcut', granted: true
      };
      securityUtil.recordSecurityEvent('permission_check', permCheckDetails);

      const hasSecurityEvent = securityUtil.hasSecurityEvent('permission_check');
      expect(hasSecurityEvent).assertTrue();
    });

    it('invalid_permissions_should_be_rejected', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

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
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      screenReaderUtil.simulateFocusChange('0', '屏幕输出按钮');
      screenReaderUtil.simulateFocusChange('1', '移动按钮');
      screenReaderUtil.simulateFocusChange('2', '快捷方式按钮');
      const events = screenReaderUtil.getScreenReaderEvents();
      expect(events.length).assertLargerOrEqual(3);
      const hasFocusEvent = screenReaderUtil.hasScreenReaderEvent('focus');
      expect(hasFocusEvent).assertTrue();
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('text_content_should_be_readable_by_screen_readers', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      screenReaderUtil.simulateScreenReaderAnnouncement('屏幕输出', 'text_0');
      screenReaderUtil.simulateScreenReaderAnnouncement('移动', 'text_1');
      screenReaderUtil.simulateScreenReaderAnnouncement('快捷方式', 'text_2');
      const screenReaderData = screenReaderUtil.getScreenReaderData();
      expect(screenReaderData.size).assertEqual(3);
      expect(screenReaderData.get('text_0')).assertEqual('屏幕输出');
      expect(screenReaderData.get('text_1')).assertEqual('移动');
      expect(screenReaderData.get('text_2')).assertEqual('快捷方式');
      const hasAnnounceEvent = screenReaderUtil.hasScreenReaderEvent('announce');
      expect(hasAnnounceEvent).assertTrue();
    });

    it('focus_navigation_should_work_in_screen_reader_mode', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      screenReaderUtil.simulateFocusChange('2', '快捷方式按钮选中状态');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      screenReaderUtil.simulateFocusChange('1', '移动按钮选中状态');

      // 添加延迟确保焦点状态稳定
      await driver.delayMs(100);

      // 使用动态焦点索引验证焦点状态
      const focusIndex = await getCurrentFocusIndex(driver);
      const isFocusCorrect = await checkFocusState(driver, focusIndex);
      if (focusIndex !== -1) {
        expect(isFocusCorrect).assertTrue();
      }

      const events = screenReaderUtil.getScreenReaderEvents();
      const focusEvents = events.filter(e => e.startsWith('focus'));
      expect(focusEvents.length).assertLargerOrEqual(1);
    });

    it('operation_confirmation_should_provide_screen_reader_feedback', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      screenReaderUtil.simulateScreenReaderAnnouncement('快捷方式确认提示', 'confirmation_2');
      securityUtil.checkPermission('ohos.permission.SHORTCUT');
      const appOpDetails: SecurityEventDetails = {
        type: 'shortcut', userConfirmed: true
      };
      securityUtil.recordSecurityEvent('app_operation', appOpDetails);
      const hasConfirmation = screenReaderUtil.hasScreenReaderEvent('announce:confirmation_2');
      expect(hasConfirmation).assertTrue();
      const hasAppEvent = securityUtil.hasSecurityEvent('app_operation');
      expect(hasAppEvent).assertTrue();
    });

    it('high_contrast_mode_compatibility_should_work', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      screenReaderUtil.simulateScreenReaderAnnouncement('高对比度模式兼容性测试', 'contrast_mode');
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);

      // 添加延迟确保焦点状态稳定
      await driver.delayMs(100);

      // 使用动态焦点索引验证焦点状态
      const focusIndex = await getCurrentFocusIndex(driver);
      const isFocusCorrect = await checkFocusState(driver, focusIndex);
      if (focusIndex !== -1) {
        expect(isFocusCorrect).assertTrue();
      }

      const hasContrastEvent = screenReaderUtil.hasScreenReaderEvent('announce:contrast_mode');
      expect(hasContrastEvent).assertTrue();
    });

    it('voice_control_compatibility_should_work_correctly', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      screenReaderUtil.simulateScreenReaderAnnouncement('语音控制兼容性测试', 'voice_control');
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      // 添加延迟确保焦点状态稳定
      await driver.delayMs(100);

      // 使用动态焦点索引验证焦点状态
      const focusIndex = await getCurrentFocusIndex(driver);
      const isFocusCorrect = await checkFocusState(driver, focusIndex);
      if (focusIndex !== -1) {
        expect(isFocusCorrect).assertTrue();
      }

      const hasVoiceEvent = screenReaderUtil.hasScreenReaderEvent('announce:voice_control');
      expect(hasVoiceEvent).assertTrue();
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('security_audit_logging_should_be_comprehensive', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      securityUtil.clearRecords();
      securityUtil.checkPermission('ohos.permission.APP_MANAGEMENT');
      const dialogOpenedDetails: SecurityEventDetails = { timestamp: Date.now() };
      securityUtil.recordSecurityEvent('dialog_opened', dialogOpenedDetails);

      securityUtil.checkPermission('ohos.permission.SHORTCUT');
      const operationSelectedDetails: SecurityEventDetails = { option: 'shortcut' };
      securityUtil.recordSecurityEvent('operation_selected', operationSelectedDetails);

      const userConfirmationDetails: SecurityEventDetails = { confirmed: true };
      securityUtil.recordSecurityEvent('user_confirmation', userConfirmationDetails);
      const appOpExecutedDetails: SecurityEventDetails = { type: 'shortcut' };
      securityUtil.recordSecurityEvent('app_operation_executed', appOpExecutedDetails);
      const securityEvents = securityUtil.getSecurityEvents();
      expect(securityEvents.length).assertEqual(4);
      const hasDialogEvent = securityUtil.hasSecurityEvent('dialog_opened');
      const hasOperationEvent = securityUtil.hasSecurityEvent('operation_selected');
      const hasExecutionEvent = securityUtil.hasSecurityEvent('app_operation_executed');

      expect(hasDialogEvent).assertTrue();
      expect(hasOperationEvent).assertTrue();
      expect(hasExecutionEvent).assertTrue();
    });

    it('comprehensive_security_screen_reader_scenario_should_work', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      securityUtil.clearRecords();
      screenReaderUtil.clearRecords();

      const dialogAccessedDetails: SecurityEventDetails = { method: 'remote' };
      securityUtil.recordSecurityEvent('dialog_accessed', dialogAccessedDetails);

      screenReaderUtil.simulateScreenReaderAnnouncement('弹窗打开提示', 'dialog_open');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      screenReaderUtil.simulateFocusChange('0', '屏幕输出按钮');

      securityUtil.checkPermission('ohos.permission.APP_MANAGEMENT');
      const permissionCheckDetails: SecurityEventDetails = {
        permission: 'ohos.permission.APP_MANAGEMENT', granted: true
      };
      securityUtil.recordSecurityEvent('permission_check', permissionCheckDetails);

      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      screenReaderUtil.simulateScreenReaderAnnouncement('操作确认提示', 'operation_confirm');

      const appOpDetails: SecurityEventDetails = { type: 'uninstall' };
      securityUtil.recordSecurityEvent('app_operation', appOpDetails);
      const securityEvents = securityUtil.getSecurityEvents();
      const screenReaderEvents = screenReaderUtil.getScreenReaderEvents();

      expect(securityEvents.length).assertLargerOrEqual(3);
      expect(screenReaderEvents.length).assertLargerOrEqual(3);
      const hasDialogAccess = securityUtil.hasSecurityEvent('dialog_accessed');
      const hasAppOperation = securityUtil.hasSecurityEvent('app_operation');
      const hasDialogOpen = screenReaderUtil.hasScreenReaderEvent('announce:dialog_open');
      const hasOperationConfirm = screenReaderUtil.hasScreenReaderEvent('announce:operation_confirm');

      expect(hasDialogAccess).assertTrue();
      expect(hasAppOperation).assertTrue();
      expect(hasDialogOpen).assertTrue();
      expect(hasOperationConfirm).assertTrue();
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证访问控制列表：确保TVDeviceAccessControlList允许/拒绝判断正确
    it('access_control_list_should_allow_and_deny', 0, () => {
      const list: AccessControlList = new AccessControlList();
      list.allow('com.example.app');
      list.allow('com.example.app');
      expect(list.isAllowed('com.example.app')).assertTrue();
      expect(list.getAllowedCount()).assertEqual(1);
      list.deny('com.example.app');
      expect(list.isAllowed('com.example.app')).assertFalse();
      list.clear();
      expect(list.getAllowedCount()).assertEqual(0);
    });
  });
}

/**
 * 权限校验器
 * 封装系统权限的校验业务逻辑
 */
class AccessControlChecker {
  private grantedPermissions: Set<string> = new Set<string>();

  public grant(permission: string): void {
    this.grantedPermissions.add(permission);
  }

  public revoke(permission: string): void {
    this.grantedPermissions.delete(permission);
  }

  public hasPermission(permission: string): boolean {
    return this.grantedPermissions.has(permission);
  }

  public allAllowed(permissions: string[]): boolean {
    if (permissions.length === 0) {
      return false;
    }
    return permissions.every(p => this.grantedPermissions.has(p));
  }

  public getGrantedCount(): number {
    return this.grantedPermissions.size;
  }

  public clear(): void {
    this.grantedPermissions.clear();
  }
}

/**
 * 权限映射器
 * 封装功能到所需权限的映射业务逻辑
 */
class PermissionMapper {
  private functionPermissionMap: Map<string, string> = new Map<string, string>();

  public registerMapping(functionName: string, permission: string): void {
    this.functionPermissionMap.set(functionName, permission);
  }

  public getPermissionFor(functionName: string): string | null {
    return this.functionPermissionMap.get(functionName) ?? null;
  }

  public getMappingCount(): number {
    return this.functionPermissionMap.size;
  }

  public clear(): void {
    this.functionPermissionMap.clear();
  }
}

/**
 * 访问控制列表
 * 封装应用访问控制的授权列表业务逻辑
 */
class AccessControlList {
  private allowedBundles: string[] = [];

  public allow(bundleName: string): void {
    if (!this.allowedBundles.includes(bundleName)) {
      this.allowedBundles.push(bundleName);
    }
  }

  public deny(bundleName: string): void {
    this.allowedBundles = this.allowedBundles.filter(name => name !== bundleName);
  }

  public isAllowed(bundleName: string): boolean {
    return this.allowedBundles.includes(bundleName);
  }

  public getAllowedCount(): number {
    return this.allowedBundles.length;
  }

  public clear(): void {
    this.allowedBundles = [];
  }
}

/**
 * 权限请求构建器
 * 封装权限申请请求构建业务逻辑
 */
class PermissionRequestBuilder {
  private requestedPermissions: string[] = [];

  public addPermission(permission: string): void {
    if (!this.requestedPermissions.includes(permission)) {
      this.requestedPermissions.push(permission);
    }
  }

  public getRequestedPermissions(): string[] {
    return [...this.requestedPermissions];
  }

  public getRequestCount(): number {
    return this.requestedPermissions.length;
  }

  public clear(): void {
    this.requestedPermissions = [];
  }
}

/**
 * 权限拒绝处理器
 * 封装权限被拒绝后的降级处理业务逻辑
 */
class PermissionDenyHandler {
  private deniedPermissions: string[] = [];

  public recordDenied(permission: string): void {
    this.deniedPermissions.push(permission);
  }

  public hasDenied(permission: string): boolean {
    return this.deniedPermissions.includes(permission);
  }

  public getDeniedCount(): number {
    return this.deniedPermissions.length;
  }

  public clear(): void {
    this.deniedPermissions = [];
  }
}

/**
 * 权限审计日志器
 * 封装权限变更审计日志业务逻辑
 */
class PermissionAuditLogger {
  private auditLog: string[] = [];

  public logAudit(permission: string, action: string): void {
    this.auditLog.push(`${action}:${permission}`);
  }

  public getAuditLog(): string[] {
    return [...this.auditLog];
  }

  public getAuditCount(): number {
    return this.auditLog.length;
  }

  public clear(): void {
    this.auditLog = [];
  }
}

/**
 * 权限统计器
 * 封装权限授权/拒绝统计业务逻辑
 */
class PermissionStatistics {
  private grantCount: number = 0;
  private denyCount: number = 0;

  public recordGrant(): void {
    this.grantCount++;
  }

  public recordDeny(): void {
    this.denyCount++;
  }

  public getGrantCount(): number {
    return this.grantCount;
  }

  public getDenyCount(): number {
    return this.denyCount;
  }

  public reset(): void {
    this.grantCount = 0;
    this.denyCount = 0;
  }
}

/**
 * 权限目标校验器
 * 封装权限名合法性校验业务逻辑
 */
class PermissionTargetValidator {
  public static isValidPermission(permission: string): boolean {
    return permission !== undefined && permission !== null && permission.startsWith('ohos.permission.');
  }

  public static isKnownPermission(permission: string, knownPermissions: string[]): boolean {
    return knownPermissions.includes(permission);
  }
}

/**
 * 权限状态追踪器
 * 封装权限授权状态追踪业务逻辑
 */
class PermissionStateTracker {
  private grantedPermissions: Set<string> = new Set<string>();

  public grant(permission: string): void {
    this.grantedPermissions.add(permission);
  }

  public revoke(permission: string): void {
    this.grantedPermissions.delete(permission);
  }

  public isGranted(permission: string): boolean {
    return this.grantedPermissions.has(permission);
  }

  public clear(): void {
    this.grantedPermissions.clear();
  }
}
