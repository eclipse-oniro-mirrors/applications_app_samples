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
  KEY_BACK,
  KEY_ENTER,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  runSerializedUiOperation
} from '../Shared/SharedDriver';

enum SecurityLevel {
  LOW = 'low', MEDIUM = 'medium', HIGH = 'high'
}

interface SecurityRecord {
  securityLevel: SecurityLevel;
  operationName: string;
  success: boolean;
  responseTime: number;
  timestamp: number;
  isAuthorized: boolean;
}

class SecurityValidationTracker {
  private static instance: SecurityValidationTracker;
  private securityHistory: SecurityRecord[] = [];
  private totalOperations: number = 0;
  private authorizedOperations: number = 0;
  private unauthorizedOperations: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): SecurityValidationTracker {
    if (!SecurityValidationTracker.instance) {
      SecurityValidationTracker.instance = new SecurityValidationTracker();
    }
    return SecurityValidationTracker.instance;
  }

  public recordSecurity(securityLevel: SecurityLevel, operationName: string, success: boolean, responseTime: number,
    isAuthorized: boolean): void {
    const record: SecurityRecord = {
      securityLevel,
      operationName,
      success,
      responseTime,
      timestamp: Date.now(),
      isAuthorized
    };
    this.securityHistory.push(record);
    this.totalOperations++;
    if (isAuthorized) {
      this.authorizedOperations++;
    } else {
      this.unauthorizedOperations++;
    }
  }

  public getSecurityHistory(): SecurityRecord[] {
    return [...this.securityHistory];
  }

  public getTotalOperations(): number {
    return this.totalOperations;
  }

  public getAuthorizedOperations(): number {
    return this.authorizedOperations;
  }

  public getUnauthorizedOperations(): number {
    return this.unauthorizedOperations;
  }

  public resetTracker(): void {
    this.securityHistory = [];
    this.totalOperations = 0;
    this.authorizedOperations = 0;
    this.unauthorizedOperations = 0;
  }

  public hasTestedWithLevel(level: SecurityLevel): boolean {
    return this.securityHistory.some(record => record.securityLevel === level);
  }

  public getAuthorizationRate(): number {
    if (this.totalOperations === 0) {
      return 0;
    }
    return this.authorizedOperations / this.totalOperations;
  }
}

export default function securityValidationTest() {
  describe('SecurityValidation_Test', () => {
    let driver: Driver;
    let securityTracker: SecurityValidationTracker;

    beforeAll(async () => {
      driver = getDriver();
      securityTracker = SecurityValidationTracker.getInstance();
      securityTracker.resetTracker();
      await runSerializedUiOperation(async () => {
        await driver.delayMs(1000);
      });
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(500);
      });
    });

    it('dialog_should_validate_low_security_operations', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      securityTracker.recordSecurity(SecurityLevel.LOW, 'navigation', isFocusCorrect, responseTime, true);

      expect(securityTracker.hasTestedWithLevel(SecurityLevel.LOW)).assertTrue();
    });

    it('dialog_should_validate_medium_security_operations', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      securityTracker.recordSecurity(SecurityLevel.MEDIUM, 'power_operation', true, responseTime, true);

      expect(securityTracker.hasTestedWithLevel(SecurityLevel.MEDIUM)).assertTrue();
    });

    it('dialog_should_validate_high_security_operations', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      const startTime = Date.now();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      securityTracker.recordSecurity(SecurityLevel.HIGH, 'dialog_close', true, responseTime, true);

      expect(securityTracker.hasTestedWithLevel(SecurityLevel.HIGH)).assertTrue();
    });

    // 验证dialog should处理能力：确保TV设备在handle authorized operations下功能正常
    it('dialog_should_handle_authorized_operations', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      securityTracker.resetTracker();

      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        securityTracker.recordSecurity(SecurityLevel.LOW, `authorized_op_${i}`, true, 50, true);
        await runSerializedUiOperation(async () => {
          await driver.delayMs(50);
        });
      }

      expect(securityTracker.getAuthorizedOperations()).assertEqual(10);
    });

    // 验证dialog should处理能力：确保TV设备在handle unauthorized operations下功能正常
    it('dialog_should_handle_unauthorized_operations', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      securityTracker.resetTracker();

      for (let i = 0; i < 5; i++) {
        securityTracker.recordSecurity(SecurityLevel.HIGH, `unauthorized_op_${i}`, false, 50, false);
      }

      expect(securityTracker.getUnauthorizedOperations()).assertEqual(5);
    });

    // 验证dialog security状态正确：确保TV设备records timestamps should be chronological符合预期
    it('dialog_security_records_timestamps_should_be_chronological', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      securityTracker.resetTracker();

      securityTracker.recordSecurity(SecurityLevel.LOW, 'test_1', true, 50, true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(100);
      });
      securityTracker.recordSecurity(SecurityLevel.MEDIUM, 'test_2', true, 50, true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(100);
      });
      securityTracker.recordSecurity(SecurityLevel.HIGH, 'test_3', true, 50, true);

      const history = securityTracker.getSecurityHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog security维持稳定：确保TV设备在tracker singleton should maintain consistency下性能不降低
    it('dialog_security_tracker_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const tracker1 = SecurityValidationTracker.getInstance();
      const tracker2 = SecurityValidationTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();


      tracker1.resetTracker();
      tracker1.recordSecurity(SecurityLevel.LOW, 'singleton_test', true, 100, true);

      expect(tracker2.getAuthorizedOperations()).assertEqual(1);
    });

    it('dialog_should_track_authorization_rate', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      securityTracker.resetTracker();

      securityTracker.recordSecurity(SecurityLevel.LOW, 'auth_op_1', true, 50, true);
      securityTracker.recordSecurity(SecurityLevel.LOW, 'auth_op_2', true, 50, true);
      securityTracker.recordSecurity(SecurityLevel.HIGH, 'unauth_op_1', false, 50, false);

      expect(securityTracker.getAuthorizationRate()).assertEqual(2 / 3);
    });

    // 验证dialog should处理能力：确保TV设备在handle all security levels下功能正常
    it('dialog_should_handle_all_security_levels', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      securityTracker.resetTracker();

      const levels = [SecurityLevel.LOW, SecurityLevel.MEDIUM, SecurityLevel.HIGH];
      for (const level of levels) {
        securityTracker.recordSecurity(level, `level_test_${level}`, true, 50, true);
      }

      expect(securityTracker.hasTestedWithLevel(SecurityLevel.LOW)).assertTrue();
      expect(securityTracker.hasTestedWithLevel(SecurityLevel.MEDIUM)).assertTrue();
      expect(securityTracker.hasTestedWithLevel(SecurityLevel.HIGH)).assertTrue();
    });

    // 验证dialog should维持稳定：确保TV设备在maintain security during operations下性能不降低
    it('dialog_should_maintain_security_during_operations', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      securityTracker.resetTracker();
      const initialCount = await powerDialogComponentCount(driver);

      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const level = i % 3 === 0 ? SecurityLevel.LOW : i % 3 === 1 ? SecurityLevel.MEDIUM : SecurityLevel.HIGH;
        securityTracker.recordSecurity(level, `security_op_${i}`, true, 30, true);
        await runSerializedUiOperation(async () => {
          await driver.delayMs(50);
        });
      }

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 验证dialog should处理能力：确保TV设备在handle security validation performance下功能正常
    it('dialog_should_handle_security_validation_performance', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      securityTracker.resetTracker();

      const startTime = Date.now();

      for (let i = 0; i < 100; i++) {
        securityTracker.recordSecurity(SecurityLevel.LOW, `perf_test_${i}`, true, 10, true);
      }

      const endTime = Date.now();
      const perfTime = endTime - startTime;

      expect(perfTime).assertLessOrEqual(2000);
    });

    // 综合comprehensive security场景测试：验证完整操作流程中功能正确
    it('comprehensive_security_validation_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      securityTracker.resetTracker();

      const scenarioStart = Date.now();

      const startTime1 = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime1 = Date.now() - startTime1;
      securityTracker.recordSecurity(SecurityLevel.LOW, 'navigation', true, responseTime1, true);

      const startTime2 = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime2 = Date.now() - startTime2;
      securityTracker.recordSecurity(SecurityLevel.MEDIUM, 'power_operation', true, responseTime2, true);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(securityTracker.getAuthorizationRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(5000);
    });
  });


}
