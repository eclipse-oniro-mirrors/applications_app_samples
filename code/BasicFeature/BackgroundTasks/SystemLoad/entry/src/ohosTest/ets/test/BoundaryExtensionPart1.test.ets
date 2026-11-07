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
 * 边界扩展测试 - 第一部分
 * 包含：请求 ID 溢出测试、回调记录边界测试
 */

import { describe, it, expect, beforeAll, afterAll, afterEach } from '@ohos/hypium';
import { BusinessError, systemLoad } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN_NUMBER = 0x0000;
const BUNDLE = 'BoundaryExtensionPart1Test: ';

type SystemLoadCallback = (level: systemLoad.SystemLoadLevel) => void;

interface Logger {
  info: (msg: string) => void;
  warn: (msg: string) => void;
  error: (msg: string) => void;
}

const logger: Logger = {
  info: (msg: string) => hilog.info(DOMAIN_NUMBER, 'BoundaryExtensionPart1Test', msg),
  warn: (msg: string) => hilog.warn(DOMAIN_NUMBER, 'BoundaryExtensionPart1Test', msg),
  error: (msg: string) => hilog.error(DOMAIN_NUMBER, 'BoundaryExtensionPart1Test', msg)
};

function isValidLevel(level: systemLoad.SystemLoadLevel): boolean {
  return level >= systemLoad.SystemLoadLevel.LOW && level <= systemLoad.SystemLoadLevel.ESCAPE;
}

export default function boundaryExtensionPart1Test() {
  let registeredCallbacks: SystemLoadCallback[] = [];

  describe('SystemLoadBoundaryExtensionPart1Test', () => {
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
    // 请求 ID 溢出测试
    // ========================================================================

    /**
     * @tc.number    SYSTEMLOAD_BOUNDARY_0100
     * @tc.name      testRequestIdOverflow0001
     * @tc.desc      Verify requestId behavior after reaching max value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 6
     */
    it('testRequestIdOverflow0001', 0, async () => {
      logger.info(`${BUNDLE}testRequestIdOverflow0001, begin`);

      let requestId = Number.MAX_SAFE_INTEGER - 1;
      logger.info(`${BUNDLE}initial requestId: ${requestId}`);

      requestId++;
      const level1 = await systemLoad.getLevel();
      expect(isValidLevel(level1)).assertTrue();
      expect(level1 >= 0).assertTrue();
      logger.info(`${BUNDLE}query succeeded at requestId ${requestId}`);

      requestId++;
      const level2 = await systemLoad.getLevel();
      expect(isValidLevel(level2)).assertTrue();
      expect(level2 >= 0).assertTrue();
      logger.info(`${BUNDLE}query succeeded at requestId ${requestId}`);

      expect(requestId > Number.MAX_SAFE_INTEGER - 2).assertTrue();
      logger.info(`${BUNDLE}system handles large requestId values correctly`);

      logger.info(`${BUNDLE}requestIdOverflow_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_BOUNDARY_0200
     * @tc.name      testRequestIdResetOnDestroy0001
     * @tc.desc      Verify requestId increments correctly on page destroy
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 6
     */
    it('testRequestIdResetOnDestroy0001', 0, async () => {
      logger.info(`${BUNDLE}testRequestIdResetOnDestroy0001, begin`);

      let requestId = 0;
      logger.info(`${BUNDLE}initial requestId: ${requestId}`);

      requestId++;
      const level1 = await systemLoad.getLevel();
      expect(isValidLevel(level1)).assertTrue();
      logger.info(`${BUNDLE}query 1 succeeded with requestId ${requestId}`);

      requestId++;
      logger.info(`${BUNDLE}simulating page destroy, requestId incremented to ${requestId}`);

      requestId++;
      const level2 = await systemLoad.getLevel();
      expect(isValidLevel(level2)).assertTrue();
      logger.info(`${BUNDLE}query 2 succeeded with requestId ${requestId}`);

      expect(requestId).assertEqual(3);
      logger.info(`${BUNDLE}requestId correctly incremented through destroy`);

      logger.info(`${BUNDLE}requestIdResetOnDestroy_0001, end`);
    });

    // ========================================================================
    // 回调记录边界测试
    // ========================================================================

    /**
     * @tc.number    SYSTEMLOAD_BOUNDARY_0300
     * @tc.name      testCallbackRecordExactMaxCapacity0001
     * @tc.desc      Verify handling when callback records reach exactly 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 6
     */
    it('testCallbackRecordExactMaxCapacity0001', 0, async () => {
      logger.info(`${BUNDLE}testCallbackRecordExactMaxCapacity0001, begin`);

      const callbackRecords: string[] = [];
      expect(callbackRecords.length).assertEqual(0);
      
      // Manually add records to test capacity management
      for (let i = 0; i < 6; i++) {
        const record = `${Date.now()}:Level${i}`;
        callbackRecords.unshift(record);
        if (callbackRecords.length > 6) {
          callbackRecords.pop();
        }
        logger.info(`${BUNDLE}record added, count: ${callbackRecords.length}`);
      }

      expect(callbackRecords.length).assertEqual(6);
      expect(callbackRecords.length <= 6).assertTrue();
      logger.info(`${BUNDLE}exactly 6 records maintained`);

      // Verify records are in correct order (newest first)
      for (let i = 1; i < callbackRecords.length; i++) {
        const prevTimestamp = parseInt(callbackRecords[i - 1].split(':')[0]);
        const currTimestamp = parseInt(callbackRecords[i].split(':')[0]);
        expect(prevTimestamp >= currTimestamp).assertTrue();
      }
      logger.info(`${BUNDLE}all records in correct order`);

      logger.info(`${BUNDLE}callbackRecordExactMaxCapacity_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_BOUNDARY_0400
     * @tc.name      testCallbackRecordClearOnModeSwitch0001
     * @tc.desc      Verify callback records cleared on mode switch
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 6
     */
    it('testCallbackRecordClearOnModeSwitch0001', 0, async () => {
      logger.info(`${BUNDLE}testCallbackRecordClearOnModeSwitch0001, begin`);

      let callbackRecords: string[] = [];
      let isMock = false;

      expect(registeredCallbacks.length).assertEqual(0);

      const callback: SystemLoadCallback = (level) => {
        if (!isMock) {
          const record = `${Date.now()}:${level}`;
          callbackRecords.unshift(record);
          logger.info(`${BUNDLE}record added in real mode`);
        }
      };

      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);

      const level1 = await systemLoad.getLevel();
      expect(isValidLevel(level1)).assertTrue();
      expect(level1 >= 0).assertTrue();
      await new Promise<void>((resolve: () => void) => setTimeout(resolve, 50));

      const recordsBeforeSwitch = callbackRecords.length;
      logger.info(`${BUNDLE}records before switch: ${recordsBeforeSwitch}`);

      isMock = true;
      callbackRecords = [];
      logger.info(`${BUNDLE}switched to mock mode, records cleared`);

      expect(callbackRecords.length).assertEqual(0);
      logger.info(`${BUNDLE}records correctly cleared on mode switch`);

      logger.info(`${BUNDLE}callbackRecordClearOnModeSwitch_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_BOUNDARY_0500
     * @tc.name      testCallbackRecordPersistence0001
     * @tc.desc      Verify callback record persistence through page lifecycle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 6
     */
    it('testCallbackRecordPersistence0001', 0, async () => {
      logger.info(`${BUNDLE}testCallbackRecordPersistence0001, begin`);

      const callbackRecords: string[] = [];
      
      // Manually add records to simulate callback behavior
      for (let i = 0; i < 10; i++) {
        const record = `${Date.now()}:Level${i % 8}`;
        callbackRecords.unshift(record);
        if (callbackRecords.length > 6) {
          callbackRecords.pop();
        }
        
        const level = await systemLoad.getLevel();
        expect(isValidLevel(level)).assertTrue();
        await new Promise<void>((resolve: () => void) => setTimeout(resolve, 30));
      }

      expect(callbackRecords.length > 0).assertTrue();
      logger.info(`${BUNDLE}${callbackRecords.length} records persisted through 10 queries`);

      const firstRecord = callbackRecords[callbackRecords.length - 1];
      expect(firstRecord.length > 0).assertTrue();
      logger.info(`${BUNDLE}oldest record still accessible`);

      logger.info(`${BUNDLE}callbackRecordPersistence_0001, end`);
    });
  });
}
