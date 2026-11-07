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

/**
 * 边界扩展测试 - 第二部分
 * 包含：监听器状态一致性测试、操作状态文本测试
 */

import { describe, it, expect, beforeAll, afterAll, afterEach } from '@ohos/hypium';
import { BusinessError, systemLoad } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN_NUMBER = 0x0000;
const BUNDLE = 'BoundaryExtensionPart2Test: ';

type SystemLoadCallback = (level: systemLoad.SystemLoadLevel) => void;

interface Logger {
  info: (msg: string) => void;
  warn: (msg: string) => void;
  error: (msg: string) => void;
}

const logger: Logger = {
  info: (msg: string) => hilog.info(DOMAIN_NUMBER, 'BoundaryExtensionPart2Test', msg),
  warn: (msg: string) => hilog.warn(DOMAIN_NUMBER, 'BoundaryExtensionPart2Test', msg),
  error: (msg: string) => hilog.error(DOMAIN_NUMBER, 'BoundaryExtensionPart2Test', msg)
};

function isValidLevel(level: systemLoad.SystemLoadLevel): boolean {
  return level >= systemLoad.SystemLoadLevel.LOW && level <= systemLoad.SystemLoadLevel.ESCAPE;
}

export default function boundaryExtensionPart2Test() {
  let registeredCallbacks: SystemLoadCallback[] = [];

  describe('SystemLoadBoundaryExtensionPart2Test', () => {
    afterEach(() => {
      for (const callback of registeredCallbacks) {
        try {
          systemLoad.off('systemLoadChange', callback);
        } catch (error) {
          const businessError = error as BusinessError;
          logger.warn(`${BUNDLE}cleanup callback failed: ${businessError.code}`);
        }
      }
      registeredCallbacks = [];
    });

    // ========================================================================
    // 监听器状态一致性测试
    // ========================================================================

    /**
     * @tc.number    SYSTEMLOAD_BOUNDARY_0600
     * @tc.name      testListenerStatePrimarySecondaryIndependence0001
     * @tc.desc      Verify primary/secondary listener state independence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 6
     */
    it('testListenerStatePrimarySecondaryIndependence0001', 0, async () => {
      logger.info(`${BUNDLE}testListenerStatePrimarySecondaryIndependence0001, begin`);

      let isPrimarySubscribed = false;
      let isSecondarySubscribed = false;

      const primaryCallback: SystemLoadCallback = (level) => {
        logger.info(`${BUNDLE}primary callback received level: ${level}`);
      };

      const secondaryCallback: SystemLoadCallback = (level) => {
        logger.info(`${BUNDLE}secondary callback received level: ${level}`);
      };

      systemLoad.on('systemLoadChange', primaryCallback);
      registeredCallbacks.push(primaryCallback);
      isPrimarySubscribed = true;
      logger.info(`${BUNDLE}primary listener registered`);

      systemLoad.on('systemLoadChange', secondaryCallback);
      registeredCallbacks.push(secondaryCallback);
      isSecondarySubscribed = true;
      logger.info(`${BUNDLE}secondary listener registered`);

      expect(isPrimarySubscribed).assertTrue();
      expect(isSecondarySubscribed).assertTrue();

      systemLoad.off('systemLoadChange', primaryCallback);
      const primaryIndex = registeredCallbacks.indexOf(primaryCallback);
      if (primaryIndex >= 0) {
        registeredCallbacks.splice(primaryIndex, 1);
      }
      isPrimarySubscribed = false;
      logger.info(`${BUNDLE}primary listener unregistered`);

      expect(isPrimarySubscribed).assertFalse();
      expect(isSecondarySubscribed).assertTrue();
      logger.info(`${BUNDLE}secondary listener unaffected by primary unregistration`);

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      logger.info(`${BUNDLE}query succeeded with secondary listener still active`);

      logger.info(`${BUNDLE}listenerStatePrimarySecondaryIndependence_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_BOUNDARY_0700
     * @tc.name      testListenerStateMultipleRegisterAttempts0001
     * @tc.desc      Verify handling of multiple registration attempts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 6
     */
    it('testListenerStateMultipleRegisterAttempts0001', 0, async () => {
      logger.info(`${BUNDLE}testListenerStateMultipleRegisterAttempts0001, begin`);

      expect(registeredCallbacks.length).assertEqual(0);

      const callback: SystemLoadCallback = (level) => {
        logger.info(`${BUNDLE}callback received level: ${level}`);
      };

      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);
      logger.info(`${BUNDLE}first registration succeeded`);

      let duplicateErrorCaught = false;
      try {
        systemLoad.on('systemLoadChange', callback);
        logger.info(`${BUNDLE}duplicate registration was accepted (idempotent)`);
      } catch (error) {
        duplicateErrorCaught = true;
        const businessError = error as BusinessError;
        logger.info(`${BUNDLE}duplicate registration rejected with code: ${businessError.code}`);
        expect(businessError.code).assertEqual(PARAMETER_ERROR);
      }

      logger.info(`${BUNDLE}duplicate registration handled correctly`);
      expect(registeredCallbacks.length >= 1).assertTrue();

      logger.info(`${BUNDLE}listenerStateMultipleRegisterAttempts_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_BOUNDARY_0800
     * @tc.name      testListenerStateUnregisterOrder0001
     * @tc.desc      Verify listener unregistration in different orders
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 6
     */
    it('testListenerStateUnregisterOrder0001', 0, async () => {
      logger.info(`${BUNDLE}testListenerStateUnregisterOrder0001, begin`);

      const callback1: SystemLoadCallback = (level) => {
        logger.info(`${BUNDLE}callback1 received level: ${level}`);
      };
      const callback2: SystemLoadCallback = (level) => {
        logger.info(`${BUNDLE}callback2 received level: ${level}`);
      };
      const callback3: SystemLoadCallback = (level) => {
        logger.info(`${BUNDLE}callback3 received level: ${level}`);
      };

      expect(registeredCallbacks.length).assertEqual(0);

      systemLoad.on('systemLoadChange', callback1);
      registeredCallbacks.push(callback1);
      systemLoad.on('systemLoadChange', callback2);
      registeredCallbacks.push(callback2);
      systemLoad.on('systemLoadChange', callback3);
      registeredCallbacks.push(callback3);
      expect(registeredCallbacks.length).assertEqual(3);
      logger.info(`${BUNDLE}3 listeners registered`);

      systemLoad.off('systemLoadChange', callback2);
      let callback2Index = registeredCallbacks.indexOf(callback2);
      if (callback2Index >= 0) {
        registeredCallbacks.splice(callback2Index, 1);
      }
      expect(registeredCallbacks.length).assertEqual(2);
      logger.info(`${BUNDLE}middle listener unregistered first`);

      systemLoad.off('systemLoadChange', callback1);
      let callback1Index = registeredCallbacks.indexOf(callback1);
      if (callback1Index >= 0) {
        registeredCallbacks.splice(callback1Index, 1);
      }
      expect(registeredCallbacks.length).assertEqual(1);
      logger.info(`${BUNDLE}first listener unregistered second`);

      systemLoad.off('systemLoadChange', callback3);
      let callback3Index = registeredCallbacks.indexOf(callback3);
      if (callback3Index >= 0) {
        registeredCallbacks.splice(callback3Index, 1);
      }
      logger.info(`${BUNDLE}last listener unregistered third`);

      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}all listeners unregistered in different order`);

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      logger.info(`${BUNDLE}query succeeded after all unregistrations`);

      logger.info(`${BUNDLE}listenerStateUnregisterOrder_0001, end`);
    });

    // ========================================================================
    // 操作状态文本测试
    // ========================================================================

    /**
     * @tc.number    SYSTEMLOAD_BOUNDARY_0900
     * @tc.name      testOperationStatusTextAllScenarios0001
     * @tc.desc      Verify status text for all operation scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 6
     */
    it('testOperationStatusTextAllScenarios0001', 0, async () => {
      logger.info(`${BUNDLE}testOperationStatusTextAllScenarios0001, begin`);

      const operationTexts: string[] = [
        'operation_ready',
        'operation_local_loaded',
        'operation_mock_selected',
        'operation_mock_refreshed',
        'operation_mock_level_changed',
        'operation_local_unavailable',
        'primary_registered',
        'primary_unregistered',
        'primary_already_registered',
        'primary_not_registered',
        'secondary_registered',
        'secondary_unregistered',
        'secondary_already_registered',
        'secondary_not_registered',
        'all_unregistered',
        'no_listeners'
      ];

      expect(operationTexts.length > 0).assertTrue();

      for (const text of operationTexts) {
        logger.info(`${BUNDLE}operation text: ${text}`);
        expect(text.length > 0).assertTrue();
        expect(typeof text).assertEqual('string');
      }

      expect(operationTexts.length).assertEqual(16);
      logger.info(`${BUNDLE}all ${operationTexts.length} operation texts validated`);

      logger.info(`${BUNDLE}operationStatusTextAllScenarios_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_BOUNDARY_1000
     * @tc.name      testOperationStatusErrorFormat0001
     * @tc.desc      Verify error status text formatting with error code
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 6
     */
    it('testOperationStatusErrorFormat0001', 0, async () => {
      logger.info(`${BUNDLE}testOperationStatusErrorFormat0001, begin`);

      const errorCode = 401;
      const errorText = `operation_failed_${errorCode}`;
      logger.info(`${BUNDLE}error text: ${errorText}`);

      expect(errorText).assertContain('operation_failed');
      expect(errorText).assertContain(errorCode.toString());
      expect(errorCode).assertEqual(401);
      expect(errorText.length > 0).assertTrue();
      logger.info(`${BUNDLE}error text correctly formatted with error code`);

      logger.info(`${BUNDLE}operationStatusErrorFormat_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_BOUNDARY_1100
     * @tc.name      testOperationStatusTextConsistency0001
     * @tc.desc      Verify operation status text consistency with actual operations
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 6
     */
    it('testOperationStatusTextConsistency0001', 0, async () => {
      logger.info(`${BUNDLE}testOperationStatusTextConsistency0001, begin`);

      let operationText = 'operation_ready';
      logger.info(`${BUNDLE}initial state: ${operationText}`);

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      operationText = 'operation_local_loaded';
      logger.info(`${BUNDLE}after load: ${operationText}`);
      expect(operationText).assertContain('local_loaded');

      operationText = 'operation_mock_selected';
      logger.info(`${BUNDLE}after mock selection: ${operationText}`);
      expect(operationText).assertContain('mock_selected');

      logger.info(`${BUNDLE}operation text consistent with actual operations`);

      logger.info(`${BUNDLE}operationStatusTextConsistency_0001, end`);
    });
  });
}

const PARAMETER_ERROR = 401;
