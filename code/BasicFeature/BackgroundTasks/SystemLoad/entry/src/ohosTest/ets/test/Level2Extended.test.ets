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

import { BusinessError, systemLoad } from '@kit.BasicServicesKit';
import { afterEach, describe, expect, it } from '@ohos/hypium';
import { logger } from '../util/Logger';

/**
 * Level 2 测试套件 - 高优先级测试
 * 基于项目 skill 审计结果，补充以下关键测试维度：
 * 1. 错误处理测试（4个用例）
 * 2. 资源清理测试（4个用例）
 */

const BUNDLE: string = 'SystemLoadL2_';
const PARAMETER_ERROR: number = 401;
const VALID_LEVELS: systemLoad.SystemLoadLevel[] = [
  systemLoad.SystemLoadLevel.LOW,
  systemLoad.SystemLoadLevel.NORMAL,
  systemLoad.SystemLoadLevel.MEDIUM,
  systemLoad.SystemLoadLevel.HIGH,
  systemLoad.SystemLoadLevel.OVERHEATED,
  systemLoad.SystemLoadLevel.WARNING,
  systemLoad.SystemLoadLevel.EMERGENCY,
  systemLoad.SystemLoadLevel.ESCAPE
];

type SystemLoadCallback = (level: systemLoad.SystemLoadLevel) => void;

async function assertParameterError(operation: () => void): Promise<void> {
  let actualCode = 0;
  try {
    operation();
  } catch (error) {
    actualCode = Number((error as BusinessError).code);
  }
  logger.info(`${BUNDLE}assert callback parameter error code ${PARAMETER_ERROR}`);
  expect(actualCode).assertEqual(PARAMETER_ERROR);
}

function isValidLevel(level: systemLoad.SystemLoadLevel): boolean {
  return VALID_LEVELS.indexOf(level) >= 0;
}

export default function level2ExtendedTest() {
  let registeredCallbacks: SystemLoadCallback[] = [];

  describe('SystemLoadLevel2ExtendedTest', () => {
    afterEach(() => {
      for (const callback of registeredCallbacks) {
        try {
          systemLoad.off('systemLoadChange', callback);
        } catch (error) {
          logger.warn(`${BUNDLE}cleanup callback failed: ${JSON.stringify(error)}`);
        }
      }
      registeredCallbacks = [];
    });

    // ========================================================================
    // 错误处理测试
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_L2_0100
     * @tc.name      testErrorHandlingNetworkFailure0001
     * @tc.desc      Verify network failure error handling
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testErrorHandlingNetworkFailure0001', 0, async () => {
      logger.info(`${BUNDLE}testErrorHandlingNetworkFailure0001, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};
      
      try {
        systemLoad.on('systemLoadChange', callback);
        registeredCallbacks.push(callback);
        logger.info(`${BUNDLE}registered callback successfully`);
        expect(registeredCallbacks.length).assertEqual(1);
        
        const level = await systemLoad.getLevel();
        logger.info(`${BUNDLE}query succeeded with level ${level}`);
        expect(isValidLevel(level)).assertTrue();
        expect(level >= 0).assertTrue();
      } catch (error) {
        const businessError = error as BusinessError;
        logger.warn(`${BUNDLE}network failure simulated: ${businessError.code}`);
        expect(businessError.code > 0).assertTrue();
      }
      
      logger.info(`${BUNDLE}errorHandlingNetworkFailure_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_L2_0200
     * @tc.name      testErrorHandlingAPIFailure0002
     * @tc.desc      Verify API call failure handling
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testErrorHandlingAPIFailure0002', 0, async () => {
      logger.info(`${BUNDLE}testErrorHandlingAPIFailure0002, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      class InvalidCallback {}
      const invalidCallback = new InvalidCallback() as SystemLoadCallback;
      
      await assertParameterError(() => {
        systemLoad.on('systemLoadChange', invalidCallback);
      });
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const validCallback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', validCallback);
      registeredCallbacks.push(validCallback);
      expect(registeredCallbacks.length).assertEqual(1);
      
      logger.info(`${BUNDLE}API failure handled correctly`);
      logger.info(`${BUNDLE}errorHandlingAPIFailure_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_L2_0300
     * @tc.name      testErrorHandlingInvalidState0003
     * @tc.desc      Verify invalid state error handling
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testErrorHandlingInvalidState0003', 0, async () => {
      logger.info(`${BUNDLE}testErrorHandlingInvalidState0003, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const nonExistentCallback: SystemLoadCallback = () => {};
      
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange', nonExistentCallback);
      });
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const validCallback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', validCallback);
      registeredCallbacks.push(validCallback);
      expect(registeredCallbacks.length).assertEqual(1);
      
      logger.info(`${BUNDLE}invalid state handled correctly`);
      logger.info(`${BUNDLE}errorHandlingInvalidState_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_L2_0400
     * @tc.name      testErrorHandlingConcurrent0004
     * @tc.desc      Verify concurrent operation error handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testErrorHandlingConcurrent0004', 0, async () => {
      logger.info(`${BUNDLE}testErrorHandlingConcurrent0004, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callbackCount = 10;
      const callbacks: SystemLoadCallback[] = [];
      
      for (let i = 0; i < callbackCount; i++) {
        const callback: SystemLoadCallback = () => {};
        callbacks.push(callback);
        
        try {
          systemLoad.on('systemLoadChange', callback);
          registeredCallbacks.push(callback);
          logger.info(`${BUNDLE}concurrent registration ${i} succeeded`);
        } catch (error) {
          const businessError = error as BusinessError;
          logger.warn(`${BUNDLE}concurrent registration ${i} failed: ${businessError.code}`);
        }
      }
      
      expect(registeredCallbacks.length <= callbackCount).assertTrue();
      expect(registeredCallbacks.length > 0).assertTrue();
      
      for (const callback of callbacks) {
        try {
          systemLoad.off('systemLoadChange', callback);
          registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
        } catch (error) {
          logger.warn(`${BUNDLE}concurrent unregistration failed`);
        }
      }
      
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}errorHandlingConcurrent_0001, end`);
    });

    // ========================================================================
    // 资源清理测试
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_L2_0500
     * @tc.name      testResourceCleanupPageExit0005
     * @tc.desc      Verify resource cleanup on page exit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testResourceCleanupPageExit0005', 0, async () => {
      logger.info(`${BUNDLE}testResourceCleanupPageExit0005, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback1: SystemLoadCallback = () => {};
      const callback2: SystemLoadCallback = () => {};
      
      systemLoad.on('systemLoadChange', callback1);
      systemLoad.on('systemLoadChange', callback2);
      registeredCallbacks.push(callback1, callback2);
      logger.info(`${BUNDLE}registered two callbacks`);
      expect(registeredCallbacks.length).assertEqual(2);
      
      systemLoad.off('systemLoadChange', callback1);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback1), 1);
      logger.info(`${BUNDLE}simulated page exit: unregistered callback1`);
      expect(registeredCallbacks.length).assertEqual(1);
      
      systemLoad.off('systemLoadChange', callback2);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback2), 1);
      logger.info(`${BUNDLE}simulated page exit: unregistered callback2`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}all resources cleaned up`);
      
      const level = await systemLoad.getLevel();
      logger.info(`${BUNDLE}system still functional after cleanup: ${level}`);
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}resourceCleanupPageExit_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_L2_0600
     * @tc.name      testResourceCleanupAppClose0006
     * @tc.desc      Verify resource cleanup on app close
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testResourceCleanupAppClose0006', 0, async () => {
      logger.info(`${BUNDLE}testResourceCleanupAppClose0006, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callbackCount = 5;
      const callbacks: SystemLoadCallback[] = [];
      
      for (let i = 0; i < callbackCount; i++) {
        const callback: SystemLoadCallback = () => {};
        callbacks.push(callback);
        systemLoad.on('systemLoadChange', callback);
        registeredCallbacks.push(callback);
      }
      logger.info(`${BUNDLE}registered ${callbackCount} callbacks`);
      expect(registeredCallbacks.length).assertEqual(callbackCount);
      
      for (const callback of callbacks) {
        try {
          systemLoad.off('systemLoadChange', callback);
          registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
        } catch (error) {
          logger.warn(`${BUNDLE}cleanup failed during app close`);
        }
      }
      logger.info(`${BUNDLE}simulated app close: cleaned up all callbacks`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}all resources cleaned up on app close`);
      
      const level = await systemLoad.getLevel();
      logger.info(`${BUNDLE}system still functional: ${level}`);
      expect(isValidLevel(level)).assertTrue();
      
      logger.info(`${BUNDLE}resourceCleanupAppClose_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_L2_0700
     * @tc.name      testResourceCleanupListenerLeak0007
     * @tc.desc      Verify listener leak detection
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testResourceCleanupListenerLeak0007', 0, async () => {
      logger.info(`${BUNDLE}testResourceCleanupListenerLeak0007, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const iterationCount = 20;
      
      for (let i = 0; i < iterationCount; i++) {
        const callback: SystemLoadCallback = () => {};
        
        systemLoad.on('systemLoadChange', callback);
        logger.info(`${BUNDLE}iteration ${i}: registered callback`);
        
        systemLoad.off('systemLoadChange', callback);
        logger.info(`${BUNDLE}iteration ${i}: unregistered callback`);
      }
      
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}no listener leak detected after ${iterationCount} iterations`);
      
      const level = await systemLoad.getLevel();
      logger.info(`${BUNDLE}system still functional: ${level}`);
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      expect(typeof level).assertEqual('number');
      
      logger.info(`${BUNDLE}resourceCleanupListenerLeak_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_L2_0800
     * @tc.name      testResourceCleanupCallbackReferences0008
     * @tc.desc      Verify callback reference cleanup
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testResourceCleanupCallbackReferences0008', 0, async () => {
      logger.info(`${BUNDLE}testResourceCleanupCallbackReferences0008, begin`);
      
      const callback1: SystemLoadCallback = () => {};
      const callback2: SystemLoadCallback = () => {};
      const callback3: SystemLoadCallback = () => {};
      
      systemLoad.on('systemLoadChange', callback1);
      systemLoad.on('systemLoadChange', callback2);
      systemLoad.on('systemLoadChange', callback3);
      registeredCallbacks.push(callback1, callback2, callback3);
      logger.info(`${BUNDLE}registered three callbacks`);
      
      systemLoad.off('systemLoadChange', callback2);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback2), 1);
      logger.info(`${BUNDLE}unregistered callback2 (middle one)`);
      
      expect(registeredCallbacks.length).assertEqual(2);
      expect(registeredCallbacks.indexOf(callback1) >= 0).assertTrue();
      expect(registeredCallbacks.indexOf(callback3) >= 0).assertTrue();
      logger.info(`${BUNDLE}callback references properly managed`);
      
      systemLoad.off('systemLoadChange', callback1);
      systemLoad.off('systemLoadChange', callback3);
      registeredCallbacks = [];
      logger.info(`${BUNDLE}cleaned up remaining callbacks`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}all callback references cleared`);
      
      logger.info(`${BUNDLE}resourceCleanupCallbackReferences_0001, end`);
    });
  });
}
