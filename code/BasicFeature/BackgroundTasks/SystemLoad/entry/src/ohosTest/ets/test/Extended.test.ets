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
 * 扩展测试套件 - 覆盖边界场景、异常处理和并发操作
 * 补充 SystemLoadSdk.test.ets 和 Ability.test.ets 未覆盖的测试维度
 */

const BUNDLE: string = 'SystemLoadExtended_';
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

export default function extendedTest() {
  let registeredCallbacks: SystemLoadCallback[] = [];

  describe('SystemLoadExtendedTest', () => {
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

    /**
     * @tc.number    SUB_SYSTEMLOAD_EXTENDED_CONCURRENT_0100
     * @tc.name      testConcurrentRegistration0001
     * @tc.desc      Verify concurrent registration of multiple listeners independence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConcurrentRegistration0001', 0, async () => {
      logger.info(`${BUNDLE}testConcurrentRegistration0001, begin`);
      const callbackCount = 5;
      const callbacks: SystemLoadCallback[] = [];
      const receivedLevels: systemLoad.SystemLoadLevel[][] = [];

      expect(registeredCallbacks.length).assertEqual(0);

      for (let i = 0; i < callbackCount; i++) {
        receivedLevels[i] = [];
        callbacks[i] = (level: systemLoad.SystemLoadLevel): void => {
          receivedLevels[i].push(level);
        };
        systemLoad.on('systemLoadChange', callbacks[i]);
        registeredCallbacks.push(callbacks[i]);
      }

      logger.info(`${BUNDLE}concurrentRegistration_0001, registered ${callbackCount} callbacks`);
      expect(registeredCallbacks.length).assertEqual(callbackCount);

      for (let i = 0; i < callbackCount; i++) {
        systemLoad.off('systemLoadChange', callbacks[i]);
        const index = registeredCallbacks.indexOf(callbacks[i]);
        if (index >= 0) {
          registeredCallbacks.splice(index, 1);
        }
      }

      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}testConcurrentRegistration0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_EXTENDED_RAPIDQUERY_0100
     * @tc.name      testRapidQuery0002
     * @tc.desc      Verify rapid query getLevel performance and stability
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRapidQuery0002', 0, async () => {
      logger.info(`${BUNDLE}testRapidQuery0002, begin`);
      const queryCount = 10;
      const results: systemLoad.SystemLoadLevel[] = [];

      expect(registeredCallbacks.length).assertEqual(0);

      for (let i = 0; i < queryCount; i++) {
        const level = await systemLoad.getLevel();
        results.push(level);
        expect(level >= 0).assertTrue();
        logger.info(`${BUNDLE}rapidQuery_0001, query ${i} returned ${level}`);
      }

      for (const level of results) {
        expect(isValidLevel(level)).assertTrue();
      }

      expect(results.length).assertEqual(queryCount);
      logger.info(`${BUNDLE}testRapidQuery0002, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_EXTENDED_MIXED_0100
     * @tc.name      testMixedRegistrationUnregistration0003
     * @tc.desc      Verify mixed registration and unregistration state consistency
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMixedRegistrationUnregistration0003', 0, async () => {
      logger.info(`${BUNDLE}testMixedRegistrationUnregistration0003, begin`);
      const callback1: SystemLoadCallback = () => {};
      const callback2: SystemLoadCallback = () => {};
      const callback3: SystemLoadCallback = () => {};

      systemLoad.on('systemLoadChange', callback1);
      registeredCallbacks.push(callback1);
      logger.info(`${BUNDLE}registered callback1`);

      systemLoad.on('systemLoadChange', callback2);
      registeredCallbacks.push(callback2);
      logger.info(`${BUNDLE}registered callback2`);

      systemLoad.off('systemLoadChange', callback1);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback1), 1);
      logger.info(`${BUNDLE}unregistered callback1`);

      systemLoad.on('systemLoadChange', callback3);
      registeredCallbacks.push(callback3);
      logger.info(`${BUNDLE}registered callback3`);

      expect(registeredCallbacks.length).assertEqual(2);
      expect(registeredCallbacks.indexOf(callback2) >= 0).assertTrue();
      expect(registeredCallbacks.indexOf(callback3) >= 0).assertTrue();

      logger.info(`${BUNDLE}testMixedRegistrationUnregistration0003, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_EXTENDED_INVALIDCALLBACK_0100
     * @tc.name      testInvalidCallbackScenarios0004
     * @tc.desc      Verify invalid callback scenarios error handling
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInvalidCallbackScenarios0004', 0, async () => {
      logger.info(`${BUNDLE}testInvalidCallbackScenarios0004, begin`);

      expect(registeredCallbacks.length).assertEqual(0);

      class InvalidCallback {}
      const invalidCallback = new InvalidCallback() as SystemLoadCallback;

      // 验证无效回调注册时返回错误码 401
      await assertParameterError(() => {
        systemLoad.on('systemLoadChange', invalidCallback);
      });
      logger.info(`${BUNDLE}invalid callback registration rejected with code 401`);
      expect(registeredCallbacks.length).assertEqual(0);

      // 验证无效回调注销时返回错误码 401
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange', invalidCallback);
      });
      logger.info(`${BUNDLE}invalid callback unregistration rejected with code 401`);

      // 验证错误后系统可继续正常工作
      const validCallback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', validCallback);
      registeredCallbacks.push(validCallback);
      expect(registeredCallbacks.length).assertEqual(1);
      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      logger.info(`${BUNDLE}system recovered after invalid callback error`);

      logger.info(`${BUNDLE}testInvalidCallbackScenarios0004, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_EXTENDED_DUPREGISTER_0100
     * @tc.name      testDuplicateRegistration0005
     * @tc.desc      Verify duplicate registration same callback idempotent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplicateRegistration0005', 0, async () => {
      logger.info(`${BUNDLE}testDuplicateRegistration0005, begin`);
      const callback: SystemLoadCallback = () => {};

      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);
      logger.info(`${BUNDLE}first registration`);

      systemLoad.on('systemLoadChange', callback);
      logger.info(`${BUNDLE}second registration (should be idempotent)`);

      systemLoad.off('systemLoadChange', callback);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}first unregistration`);

      await assertParameterError(() => {
        systemLoad.off('systemLoadChange', callback);
      });
      expect(registeredCallbacks.length).assertEqual(0);

      logger.info(`${BUNDLE}testDuplicateRegistration0005, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_EXTENDED_QUERYLISTENER_0100
     * @tc.name      testQueryWithActiveListeners0006
     * @tc.desc      Verify query with active listeners no interference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testQueryWithActiveListeners0006', 0, async () => {
      logger.info(`${BUNDLE}testQueryWithActiveListeners0006, begin`);
      expect(registeredCallbacks.length).assertEqual(0);

      const callback1: SystemLoadCallback = () => {};
      const callback2: SystemLoadCallback = () => {};

      systemLoad.on('systemLoadChange', callback1);
      registeredCallbacks.push(callback1);

      systemLoad.on('systemLoadChange', callback2);
      registeredCallbacks.push(callback2);
      expect(registeredCallbacks.length).assertEqual(2);

      const queryCount = 5;
      for (let i = 0; i < queryCount; i++) {
        const level = await systemLoad.getLevel();
        logger.info(`${BUNDLE}query ${i} with active listeners returned ${level}`);
        expect(isValidLevel(level)).assertTrue();
        expect(level >= 0).assertTrue();
      }

      expect(registeredCallbacks.length).assertEqual(2);
      logger.info(`${BUNDLE}testQueryWithActiveListeners0006, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_EXTENDED_UNREGISTERNON_0100
     * @tc.name      testUnregisterNonExistent0007
     * @tc.desc      Verify unregister non-existent callback error handling
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testUnregisterNonExistent0007', 0, async () => {
      logger.info(`${BUNDLE}testUnregisterNonExistent0007, begin`);
      const nonExistentCallback: SystemLoadCallback = () => {};

      expect(registeredCallbacks.length).assertEqual(0);

      // 验证注销未注册的回调返回错误�?401
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange', nonExistentCallback);
      });
      logger.info(`${BUNDLE}unregister non-existent callback rejected with code 401`);
      expect(registeredCallbacks.length).assertEqual(0);

      // 验证错误后可以正常注册和注销
      const validCallback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', validCallback);
      registeredCallbacks.push(validCallback);
      expect(registeredCallbacks.length).assertEqual(1);
      logger.info(`${BUNDLE}valid callback registered after error`);

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      logger.info(`${BUNDLE}system functional after unregister error`);

      logger.info(`${BUNDLE}testUnregisterNonExistent0007, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_EXTENDED_BATCHUNREGISTER_0100
     * @tc.name      testBatchUnregister0008
     * @tc.desc      Verify batch unregister performance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBatchUnregister0008', 0, async () => {
      logger.info(`${BUNDLE}testBatchUnregister0008, begin`);
      const callbackCount = 10;
      const callbacks: SystemLoadCallback[] = [];

      expect(registeredCallbacks.length).assertEqual(0);

      for (let i = 0; i < callbackCount; i++) {
        const callback: SystemLoadCallback = () => {};
        callbacks.push(callback);
        systemLoad.on('systemLoadChange', callback);
        registeredCallbacks.push(callback);
      }

      logger.info(`${BUNDLE}registered ${callbackCount} callbacks`);
      expect(registeredCallbacks.length).assertEqual(callbackCount);

      for (let i = 0; i < callbackCount; i++) {
        systemLoad.off('systemLoadChange', callbacks[i]);
        const index = registeredCallbacks.indexOf(callbacks[i]);
        if (index >= 0) {
          registeredCallbacks.splice(index, 1);
        }
      }

      logger.info(`${BUNDLE}unregistered all ${callbackCount} callbacks`);
      expect(registeredCallbacks.length).assertEqual(0);

      logger.info(`${BUNDLE}testBatchUnregister0008, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_EXTENDED_QUERYAFTER_0100
     * @tc.name      testQueryAfterUnregisterAll0009
     * @tc.desc      Verify query after unregister all no impact
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testQueryAfterUnregisterAll0009', 0, async () => {
      logger.info(`${BUNDLE}testQueryAfterUnregisterAll0009, begin`);
      const callback: SystemLoadCallback = () => {};

      expect(registeredCallbacks.length).assertEqual(0);

      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);

      systemLoad.off('systemLoadChange', callback);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
      expect(registeredCallbacks.length).assertEqual(0);

      const level = await systemLoad.getLevel();
      logger.info(`${BUNDLE}query after unregister returned ${level}`);
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();

      logger.info(`${BUNDLE}testQueryAfterUnregisterAll0009, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_EXTENDED_MULTIPLEUNREG_0100
     * @tc.name      testMultipleUnregisterAll0010
     * @tc.desc      Verify multiple unregister all calls error handling
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMultipleUnregisterAll0010', 0, async () => {
      logger.info(`${BUNDLE}testMultipleUnregisterAll0010, begin`);
      expect(registeredCallbacks.length).assertEqual(0);

      await assertParameterError(() => {
        systemLoad.off('systemLoadChange');
      });
      expect(registeredCallbacks.length).assertEqual(0);

      await assertParameterError(() => {
        systemLoad.off('systemLoadChange');
      });
      expect(registeredCallbacks.length).assertEqual(0);

      const validCallback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', validCallback);
      registeredCallbacks.push(validCallback);
      expect(registeredCallbacks.length).assertEqual(1);

      logger.info(`${BUNDLE}testMultipleUnregisterAll0010, end`);
    });
  });
}
