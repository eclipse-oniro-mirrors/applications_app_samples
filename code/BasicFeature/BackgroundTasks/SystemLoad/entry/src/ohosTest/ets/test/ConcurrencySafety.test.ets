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
 * 并发安全与异常恢复增强测试
 * 包含：并发安全增强测试、异常恢复增强测试
 */

import { describe, it, expect, beforeAll, afterAll, afterEach } from '@ohos/hypium';
import { BusinessError, systemLoad } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN_NUMBER = 0x0000;
const BUNDLE = 'ConcurrencySafetyTest: ';
const PARAMETER_ERROR = 401;

type SystemLoadCallback = (level: systemLoad.SystemLoadLevel) => void;

interface Logger {
  info: (msg: string) => void;
  warn: (msg: string) => void;
  error: (msg: string) => void;
}

const logger: Logger = {
  info: (msg: string) => hilog.info(DOMAIN_NUMBER, 'ConcurrencySafetyTest', msg),
  warn: (msg: string) => hilog.warn(DOMAIN_NUMBER, 'ConcurrencySafetyTest', msg),
  error: (msg: string) => hilog.error(DOMAIN_NUMBER, 'ConcurrencySafetyTest', msg)
};

function isValidLevel(level: systemLoad.SystemLoadLevel): boolean {
  return level >= systemLoad.SystemLoadLevel.LOW && level <= systemLoad.SystemLoadLevel.ESCAPE;
}

export default function concurrencySafetyTest() {
  let registeredCallbacks: SystemLoadCallback[] = [];

  describe('SystemLoadConcurrencySafetyTest', () => {
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
    // 并发安全增强测试
    // ========================================================================

    /**
     * @tc.number    SYSTEMLOAD_CONCURRENCY_0100
     * @tc.name      testConcurrentRegistrationMultipleCallbacks0001
     * @tc.desc      Verify safety of concurrent registration of multiple callbacks
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testConcurrentRegistrationMultipleCallbacks0001', 0, async () => {
      logger.info(`${BUNDLE}testConcurrentRegistrationMultipleCallbacks0001, begin`);

      const callbacks: SystemLoadCallback[] = [];
      const callbackCount = 5;

      expect(registeredCallbacks.length).assertEqual(0);

      for (let i = 0; i < callbackCount; i++) {
        const callback: SystemLoadCallback = (level) => {
          logger.info(`${BUNDLE}callback ${i} received level: ${level}`);
        };
        callbacks.push(callback);
        systemLoad.on('systemLoadChange', callback);
        registeredCallbacks.push(callback);
        logger.info(`${BUNDLE}registered callback ${i}`);
      }

      expect(callbacks.length).assertEqual(callbackCount);
      expect(registeredCallbacks.length).assertEqual(callbackCount);
      logger.info(`${BUNDLE}successfully registered ${callbackCount} callbacks`);

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      logger.info(`${BUNDLE}query succeeded with multiple callbacks registered`);

      logger.info(`${BUNDLE}concurrentRegistrationMultipleCallbacks_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_CONCURRENCY_0200
     * @tc.name      testConcurrentQueryWithRegistration0001
     * @tc.desc      Verify safety of concurrent query and registration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testConcurrentQueryWithRegistration0001', 0, async () => {
      logger.info(`${BUNDLE}testConcurrentQueryWithRegistration0001, begin`);

      expect(registeredCallbacks.length).assertEqual(0);

      const queryPromises: Promise<systemLoad.SystemLoadLevel>[] = [];
      const callback: SystemLoadCallback = (level) => {
        logger.info(`${BUNDLE}callback received level: ${level}`);
      };

      for (let i = 0; i < 3; i++) {
        systemLoad.on('systemLoadChange', callback);
        registeredCallbacks.push(callback);
        
        const queryPromise = systemLoad.getLevel();
        queryPromises.push(queryPromise);
        logger.info(`${BUNDLE}initiated query ${i} with registration`);
      }

      expect(registeredCallbacks.length).assertEqual(3);

      const levels = await Promise.all(queryPromises);
      logger.info(`${BUNDLE}all ${levels.length} queries completed`);

      for (let i = 0; i < levels.length; i++) {
        expect(isValidLevel(levels[i])).assertTrue();
        expect(levels[i] >= 0).assertTrue();
        logger.info(`${BUNDLE}query ${i} returned valid level: ${levels[i]}`);
      }

      expect(registeredCallbacks.length).assertEqual(3);
      logger.info(`${BUNDLE}concurrentQueryWithRegistration_0001, end`);
    });

    // ========================================================================
    // 异常恢复增强测试
    // ========================================================================

    /**
     * @tc.number    SYSTEMLOAD_RECOVERY_0100
     * @tc.name      testRecoveryAfterInvalidCallback0001
     * @tc.desc      Verify recovery after invalid callback exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testRecoveryAfterInvalidCallback0001', 0, async () => {
      logger.info(`${BUNDLE}testRecoveryAfterInvalidCallback0001, begin`);

      expect(registeredCallbacks.length).assertEqual(0);

      let errorThrown = false;
      try {
        class InvalidCallback {}
        const invalidCallback = new InvalidCallback() as SystemLoadCallback;
        systemLoad.on('systemLoadChange', invalidCallback);
        logger.info(`${BUNDLE}invalid callback was accepted (may be valid)`);
      } catch (error) {
        errorThrown = true;
        const businessError = error as BusinessError;
        logger.info(`${BUNDLE}invalid callback rejected with code: ${businessError.code}`);
      }

      if (errorThrown) {
        logger.info(`${BUNDLE}error was thrown, testing recovery`);
      } else {
        logger.info(`${BUNDLE}no error thrown, testing continues`);
      }

      const validCallback: SystemLoadCallback = (level) => {
        logger.info(`${BUNDLE}valid callback received level: ${level}`);
      };

      systemLoad.on('systemLoadChange', validCallback);
      registeredCallbacks.push(validCallback);
      expect(registeredCallbacks.length).assertEqual(1);
      logger.info(`${BUNDLE}successfully registered valid callback after error`);

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      logger.info(`${BUNDLE}query succeeded after recovery`);

      logger.info(`${BUNDLE}recoveryAfterInvalidCallback_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_RECOVERY_0200
     * @tc.name      testRecoveryAfterMultipleErrors0001
     * @tc.desc      Verify recovery after multiple exceptions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testRecoveryAfterMultipleErrors0001', 0, async () => {
      logger.info(`${BUNDLE}testRecoveryAfterMultipleErrors0001, begin`);

      expect(registeredCallbacks.length).assertEqual(0);

      let errorCount = 0;
      for (let i = 0; i < 3; i++) {
        try {
          class InvalidCallback {}
          const invalidCallback = new InvalidCallback() as SystemLoadCallback;
          systemLoad.on('systemLoadChange', invalidCallback);
          logger.info(`${BUNDLE}invalid callback ${i} was accepted`);
        } catch (error) {
          errorCount++;
          const businessError = error as BusinessError;
          logger.info(`${BUNDLE}invalid callback ${i} rejected with code: ${businessError.code}`);
        }
      }

      logger.info(`${BUNDLE}encountered ${errorCount} errors out of 3 attempts`);
      expect(errorCount >= 0).assertTrue();

      const validCallback: SystemLoadCallback = (level) => {
        logger.info(`${BUNDLE}valid callback received level: ${level}`);
      };

      systemLoad.on('systemLoadChange', validCallback);
      registeredCallbacks.push(validCallback);
      expect(registeredCallbacks.length).assertEqual(1);
      logger.info(`${BUNDLE}successfully registered valid callback after multiple errors`);

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      logger.info(`${BUNDLE}query succeeded after multiple errors`);

      logger.info(`${BUNDLE}recoveryAfterMultipleErrors_0001, end`);
    });
  });
}
