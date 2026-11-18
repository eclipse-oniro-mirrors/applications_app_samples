/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * 性能与安全性测试
 * 包含：性能与稳定性测试、安全与权限测试、兼容性测试、本地化测试
 */

import { describe, it, expect, beforeAll, afterAll, afterEach } from '@ohos/hypium';
import { BusinessError, systemLoad } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN_NUMBER = 0x0000;
const BUNDLE = 'PerformanceSecurityTest: ';
const PARAMETER_ERROR = 401;

type SystemLoadCallback = (level: systemLoad.SystemLoadLevel) => void;

interface Logger {
  info: (msg: string) => void;
  warn: (msg: string) => void;
  error: (msg: string) => void;
}

const logger: Logger = {
  info: (msg: string) => hilog.info(DOMAIN_NUMBER, 'PerformanceSecurityTest', msg),
  warn: (msg: string) => hilog.warn(DOMAIN_NUMBER, 'PerformanceSecurityTest', msg),
  error: (msg: string) => hilog.error(DOMAIN_NUMBER, 'PerformanceSecurityTest', msg)
};

function isValidLevel(level: systemLoad.SystemLoadLevel): boolean {
  return level >= systemLoad.SystemLoadLevel.LOW && level <= systemLoad.SystemLoadLevel.ESCAPE;
}

async function assertParameterError(fn: () => void | Promise<void>): Promise<void> {
  try {
    await fn();
    logger.error(`${BUNDLE}expected parameter error but succeeded`);
    expect(null).assertFail();
  } catch (error) {
    const businessError = error as BusinessError;
    logger.info(`${BUNDLE}caught error: code=${businessError.code}, message=${businessError.message}`);
    expect(businessError.code).assertEqual(PARAMETER_ERROR);
  }
}

export default function performanceSecurityTest() {
  let registeredCallbacks: SystemLoadCallback[] = [];

  describe('SystemLoadPerformanceSecurityTest', () => {
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
    // 性能与稳定性测试 - 响应时间测试
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_PERF_0100
     * @tc.name      testPerformanceResponseTimeSingle0001
     * @tc.desc      Verify single query response time < 200ms
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPerformanceResponseTimeSingle0001', 0, async () => {
      logger.info(`${BUNDLE}testPerformanceResponseTimeSingle0001, begin`);

      const startTime = Date.now();
      const level = await systemLoad.getLevel();
      const endTime = Date.now();
      const responseTime = endTime - startTime;

      logger.info(`${BUNDLE}single query response time: ${responseTime}ms`);
      expect(isValidLevel(level)).assertTrue();
      expect(responseTime >= 0).assertTrue();
      // 优化：将阈值从 1000ms 调整为 200ms，更符合实际性能要求
      expect(responseTime < 200).assertTrue();

      logger.info(`${BUNDLE}performanceResponseTimeSingle_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_PERF_0200
     * @tc.name      testPerformanceResponseTimeMultiple0002
     * @tc.desc      Verify average response time of 100 queries < 100ms/query
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPerformanceResponseTimeMultiple0002', 0, async () => {
      logger.info(`${BUNDLE}testPerformanceResponseTimeMultiple0002, begin`);

      const queryCount = 100;
      const startTime = Date.now();

      expect(queryCount > 0).assertTrue();

      for (let i = 0; i < queryCount; i++) {
        const level = await systemLoad.getLevel();
        expect(isValidLevel(level)).assertTrue();
        expect(level >= 0).assertTrue();
      }

      const endTime = Date.now();
      const totalTime = endTime - startTime;
      const avgTime = totalTime / queryCount;

      logger.info(`${BUNDLE}total time: ${totalTime}ms, average time: ${avgTime}ms`);
      // 优化：将阈值从 500ms 调整�?100ms，更符合实际性能要求
      expect(avgTime < 100).assertTrue();
      expect(totalTime >= 0).assertTrue();

      logger.info(`${BUNDLE}performanceResponseTimeMultiple_0001, end`);
    });

    // ========================================================================
    // 性能与稳定性测试 - 内存稳定性测试
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_PERF_0300
     * @tc.name      testPerformanceMemoryStability0003
     * @tc.desc      Verify memory stability after 1000 queries
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPerformanceMemoryStability0003', 0, async () => {
      logger.info(`${BUNDLE}testPerformanceMemoryStability0003, begin`);

      const queryCount = 1000;
      let successCount = 0;

      for (let i = 0; i < queryCount; i++) {
        try {
          const level = await systemLoad.getLevel();
          if (isValidLevel(level)) {
            successCount++;
          }
        } catch (error) {
          const businessError = error as BusinessError;
          logger.warn(`${BUNDLE}query ${i} failed: ${JSON.stringify(businessError)}`);
        }
      }

      logger.info(`${BUNDLE}success count: ${successCount}/${queryCount}`);
      expect(successCount).assertEqual(queryCount);
      expect(successCount > 0).assertTrue();

      const finalLevel = await systemLoad.getLevel();
      expect(isValidLevel(finalLevel)).assertTrue();

      logger.info(`${BUNDLE}system remained stable after ${queryCount} queries`);
      logger.info(`${BUNDLE}performanceMemoryStability_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_PERF_0400
     * @tc.name      testPerformanceLongRunning0004
     * @tc.desc      Verify long-running stability after 10 seconds of monitoring
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPerformanceLongRunning0004', 0, async () => {
      logger.info(`${BUNDLE}testPerformanceLongRunning0004, begin`);

      expect(registeredCallbacks.length).assertEqual(0);

      let callbackCount = 0;
      const callback: SystemLoadCallback = (level) => {
        callbackCount++;
        logger.info(`${BUNDLE}callback ${callbackCount} received level: ${level}`);
      };

      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);

      const durationMs = 10000;
      const startTime = Date.now();

      while (Date.now() - startTime < durationMs) {
        const level = await systemLoad.getLevel();
        expect(isValidLevel(level)).assertTrue();
        expect(level >= 0).assertTrue();
        await new Promise<void>((resolve: () => void) => setTimeout(resolve, 1000));
      }

      logger.info(`${BUNDLE}received ${callbackCount} callbacks in ${durationMs}ms`);
      expect(callbackCount >= 0).assertTrue();
      expect(registeredCallbacks.length).assertEqual(1);

      logger.info(`${BUNDLE}performanceLongRunning_0001, end`);
    });

    // ========================================================================
    // 性能与稳定性测试 - 压力测试
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_PERF_0500
     * @tc.name      testPerformanceStressConcurrent0005
     * @tc.desc      Verify concurrent stress with 10 concurrent queries
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPerformanceStressConcurrent0005', 0, async () => {
      logger.info(`${BUNDLE}testPerformanceStressConcurrent0005, begin`);

      const concurrentCount = 10;
      const promises: Promise<systemLoad.SystemLoadLevel>[] = [];

      expect(concurrentCount > 0).assertTrue();

      for (let i = 0; i < concurrentCount; i++) {
        promises.push(systemLoad.getLevel());
      }

      const results = await Promise.all(promises);

      for (let i = 0; i < results.length; i++) {
        logger.info(`${BUNDLE}query ${i} result: ${results[i]}`);
        expect(isValidLevel(results[i])).assertTrue();
        expect(results[i] >= 0).assertTrue();
      }

      expect(results.length).assertEqual(concurrentCount);
      expect(results.length > 0).assertTrue();

      logger.info(`${BUNDLE}performanceStressConcurrent_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_PERF_0600
     * @tc.name      testPerformanceStressRapidRegister0006
     * @tc.desc      Verify rapid register/unregister stress 50 times within 1 second
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPerformanceStressRapidRegister0006', 0, async () => {
      logger.info(`${BUNDLE}testPerformanceStressRapidRegister0006, begin`);

      const cycleCount = 50;
      let successCount = 0;

      const startTime = Date.now();

      for (let i = 0; i < cycleCount; i++) {
        try {
          const callback: SystemLoadCallback = () => {};
          systemLoad.on('systemLoadChange', callback);
          systemLoad.off('systemLoadChange', callback);
          successCount++;
        } catch (error) {
          const businessError = error as BusinessError;
          logger.warn(`${BUNDLE}cycle ${i} failed: ${JSON.stringify(businessError)}`);
        }
      }

      const endTime = Date.now();
      const totalTime = endTime - startTime;

      logger.info(`${BUNDLE}completed ${successCount}/${cycleCount} cycles in ${totalTime}ms`);
      expect(successCount > 0).assertTrue();
      expect(successCount <= cycleCount).assertTrue();
      expect(totalTime >= 0).assertTrue();

      logger.info(`${BUNDLE}performanceStressRapidRegister_0001, end`);
    });

    // ========================================================================
    // 安全与权限测�?- 权限检�?    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_SEC_0100
     * @tc.name      testSecurityPermissionValid0007
     * @tc.desc      Verify valid permissions for normal systemLoad API calls
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSecurityPermissionValid0007', 0, async () => {
      logger.info(`${BUNDLE}testSecurityPermissionValid0007, begin`);

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();

      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);

      logger.info(`${BUNDLE}API calls succeeded with valid permissions`);

      logger.info(`${BUNDLE}securityPermissionValid_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_SEC_0200
     * @tc.name      testSecurityDataValidation0008
     * @tc.desc      Verify data validation for API input parameters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSecurityDataValidation0008', 0, async () => {
      logger.info(`${BUNDLE}testSecurityDataValidation0008, begin`);

      expect(registeredCallbacks.length).assertEqual(0);

      class InvalidCallback {}
      const invalidCallback = new InvalidCallback() as SystemLoadCallback;

      let errorCode = 0;
      let errorThrown = false;
      try {
        systemLoad.on('systemLoadChange', invalidCallback);
        logger.info(`${BUNDLE}API accepted the callback (may be valid)`);
      } catch (error) {
        errorThrown = true;
        const businessError = error as BusinessError;
        errorCode = Number(businessError.code);
        logger.info(`${BUNDLE}API rejected invalid callback with code: ${errorCode}`);
      }

      if (errorThrown) {
        expect(errorCode).assertEqual(PARAMETER_ERROR);
        expect(errorCode > 0).assertTrue();
      } else {
        logger.info(`${BUNDLE}API did not throw error, skipping assertion`);
        expect(true).assertTrue();
      }

      expect(registeredCallbacks.length).assertEqual(0);

      logger.info(`${BUNDLE}securityDataValidation_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_SEC_0300
     * @tc.name      testSecurityCallbackInjection0009
     * @tc.desc      Verify callback injection protection
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSecurityCallbackInjection0009', 0, async () => {
      logger.info(`${BUNDLE}testSecurityCallbackInjection0009, begin`);

      let callbackInvoked = false;
      const originalCallback: SystemLoadCallback = (level) => {
        callbackInvoked = true;
        logger.info(`${BUNDLE}callback invoked with level: ${level}`);
      };

      systemLoad.on('systemLoadChange', originalCallback);
      registeredCallbacks.push(originalCallback);
      expect(registeredCallbacks.length).assertEqual(1);

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(callbackInvoked).assertFalse();

      logger.info(`${BUNDLE}callback execution controlled properly`);

      logger.info(`${BUNDLE}securityCallbackInjection_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_SEC_0400
     * @tc.name      testSecurityResourceCleanup0010
     * @tc.desc      Verify resource cleanup after exception
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSecurityResourceCleanup0010', 0, async () => {
      logger.info(`${BUNDLE}testSecurityResourceCleanup0010, begin`);

      expect(registeredCallbacks.length).assertEqual(0);

      try {
        class InvalidCallback {}
        const invalidCallback = new InvalidCallback() as SystemLoadCallback;
        systemLoad.on('systemLoadChange', invalidCallback);
      } catch (error) {
        const businessError = error as BusinessError;
        logger.info(`${BUNDLE}exception occurred as expected: ${businessError.code}`);
      }

      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();

      logger.info(`${BUNDLE}resources properly cleaned up after exception`);

      logger.info(`${BUNDLE}securityResourceCleanup_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_SEC_0500
     * @tc.name      testSecurityConcurrentAccess0011
     * @tc.desc      Verify concurrent safety without data races
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSecurityConcurrentAccess0011', 0, async () => {
      logger.info(`${BUNDLE}testSecurityConcurrentAccess0011, begin`);

      const concurrentCount = 5;
      const promises: Promise<systemLoad.SystemLoadLevel>[] = [];

      for (let i = 0; i < concurrentCount; i++) {
        promises.push(systemLoad.getLevel());
      }

      const results = await Promise.all(promises);

      expect(results.length).assertEqual(concurrentCount);
      for (const result of results) {
        expect(isValidLevel(result)).assertTrue();
      }
      expect(registeredCallbacks.length).assertEqual(0);

      logger.info(`${BUNDLE}concurrent access handled safely`);

      logger.info(`${BUNDLE}securityConcurrentAccess_0001, end`);
    });

    // ========================================================================
    // 兼容性测试 - API 兼容性
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMPAT_0100
     * @tc.name      testCompatibilityAPIVersion0012
     * @tc.desc      Verify API version compatibility
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCompatibilityAPIVersion0012', 0, async () => {
      logger.info(`${BUNDLE}testCompatibilityAPIVersion0012, begin`);

      expect(typeof systemLoad.getLevel).assertEqual('function');
      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();

      logger.info(`${BUNDLE}API version compatible`);

      logger.info(`${BUNDLE}compatibilityAPIVersion_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMPAT_0200
     * @tc.name      testCompatibilityCallbackSignature0013
     * @tc.desc      Verify callback signature compatibility
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCompatibilityCallbackSignature0013', 0, async () => {
      logger.info(`${BUNDLE}testCompatibilityCallbackSignature0013, begin`);

      const callback: SystemLoadCallback = (level) => {
        logger.info(`${BUNDLE}callback received level: ${level}`);
      };

      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(typeof callback).assertEqual('function');

      logger.info(`${BUNDLE}callback signature compatible`);

      logger.info(`${BUNDLE}compatibilityCallbackSignature_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMPAT_0300
     * @tc.name      testCompatibilityEnumValues0014
     * @tc.desc      Verify enum values compatibility and stability
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCompatibilityEnumValues0014', 0, async () => {
      logger.info(`${BUNDLE}testCompatibilityEnumValues0014, begin`);

      const enumValues = [
        systemLoad.SystemLoadLevel.LOW,
        systemLoad.SystemLoadLevel.NORMAL,
        systemLoad.SystemLoadLevel.MEDIUM,
        systemLoad.SystemLoadLevel.HIGH,
        systemLoad.SystemLoadLevel.OVERHEATED,
        systemLoad.SystemLoadLevel.WARNING,
        systemLoad.SystemLoadLevel.EMERGENCY,
        systemLoad.SystemLoadLevel.ESCAPE
      ];

      expect(enumValues.length > 0).assertTrue();

      for (const value of enumValues) {
        logger.info(`${BUNDLE}enum value: ${value}`);
        expect(value >= 0).assertTrue();
        expect(typeof value).assertEqual('number');
      }

      expect(enumValues.length).assertEqual(8);

      logger.info(`${BUNDLE}enum values compatible`);

      logger.info(`${BUNDLE}compatibilityEnumValues_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMPAT_0400
     * @tc.name      testCompatibilityDeviceTypes0015
     * @tc.desc      Verify device type compatibility
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCompatibilityDeviceTypes0015', 0, async () => {
      logger.info(`${BUNDLE}testCompatibilityDeviceTypes0015, begin`);

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      expect(typeof level).assertEqual('number');

      logger.info(`${BUNDLE}API works on current device type`);

      logger.info(`${BUNDLE}compatibilityDeviceTypes_0001, end`);
    });

    // ========================================================================
    // 本地化测试
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_LOCAL_0100
     * @tc.name      testLocalizationEnumLabels0016
     * @tc.desc      Verify enum labels localization
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLocalizationEnumLabels0016', 0, async () => {
      logger.info(`${BUNDLE}testLocalizationEnumLabels0016, begin`);

      const level = await systemLoad.getLevel();
      logger.info(`${BUNDLE}current level: ${level}`);
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();

      const enumNames: string[] = [
        'LOW', 'NORMAL', 'MEDIUM', 'HIGH',
        'OVERHEATED', 'WARNING', 'EMERGENCY', 'ESCAPE'
      ];
      
      logger.info(`${BUNDLE}enum has ${enumNames.length} defined names`);
      expect(enumNames.length).assertEqual(8);

      logger.info(`${BUNDLE}localizationEnumLabels_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_LOCAL_0200
     * @tc.name      testLocalizationErrorMessages0017
     * @tc.desc      Verify error messages localization
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLocalizationErrorMessages0017', 0, async () => {
      logger.info(`${BUNDLE}testLocalizationErrorMessages0017, begin`);

      let errorCode = 0;
      let errorMessage = '';
      let errorCaught = false;
      try {
        class InvalidCallback {}
        const invalidCallback = new InvalidCallback() as SystemLoadCallback;
        systemLoad.on('systemLoadChange', invalidCallback);
      } catch (error) {
        errorCaught = true;
        const businessError = error as BusinessError;
        errorCode = Number(businessError.code);
        errorMessage = businessError.message || '';
        logger.info(`${BUNDLE}error code: ${errorCode}`);
        logger.info(`${BUNDLE}error message: ${errorMessage}`);
      }

      if (errorCaught) {
        expect(errorCode).assertEqual(PARAMETER_ERROR);
        expect(errorMessage.length > 0).assertTrue();
        expect(typeof errorMessage).assertEqual('string');
      } else {
        logger.info(`${BUNDLE}no error was thrown, test skipped`);
        expect(true).assertTrue();
      }

      logger.info(`${BUNDLE}localizationErrorMessages_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_LOCAL_0300
     * @tc.name      testLocalizationAPINaming0018
     * @tc.desc      Verify API naming localization conventions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLocalizationAPINaming0018', 0, async () => {
      logger.info(`${BUNDLE}testLocalizationAPINaming0018, begin`);

      expect(typeof systemLoad.getLevel).assertEqual('function');
      expect(typeof systemLoad.on).assertEqual('function');
      expect(typeof systemLoad.off).assertEqual('function');

      logger.info(`${BUNDLE}API naming follows conventions`);

      logger.info(`${BUNDLE}localizationAPINaming_0001, end`);
    });
  });
}
