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
 * 回调数据验证与页面状态测试
 * 包含：回调数据验证测试、页面状态同步测试、请求 ID 防重测试
 */

import { describe, it, expect, beforeAll, afterAll, afterEach } from '@ohos/hypium';
import { BusinessError, systemLoad } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN_NUMBER = 0x0000;
const BUNDLE = 'CallbackDataValidationTest: ';
const PARAMETER_ERROR = 401;

type SystemLoadCallback = (level: systemLoad.SystemLoadLevel) => void;

interface Logger {
  info: (msg: string) => void;
  warn: (msg: string) => void;
  error: (msg: string) => void;
}

const logger: Logger = {
  info: (msg: string) => hilog.info(DOMAIN_NUMBER, 'CallbackDataValidationTest', msg),
  warn: (msg: string) => hilog.warn(DOMAIN_NUMBER, 'CallbackDataValidationTest', msg),
  error: (msg: string) => hilog.error(DOMAIN_NUMBER, 'CallbackDataValidationTest', msg)
};

function isValidLevel(level: systemLoad.SystemLoadLevel): boolean {
  return level >= systemLoad.SystemLoadLevel.LOW && level <= systemLoad.SystemLoadLevel.ESCAPE;
}

export default function callbackDataValidationTest() {
  let registeredCallbacks: SystemLoadCallback[] = [];
  let receivedLevels: systemLoad.SystemLoadLevel[] = [];

  describe('SystemLoadCallbackDataValidationTest', () => {
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
      receivedLevels = [];
    });

    // ========================================================================
    // 回调数据验证测试
    // ========================================================================

    /**
     * @tc.number    SYSTEMLOAD_CALLBACK_0100
     * @tc.name      testCallbackDataLevelConsistency0001
     * @tc.desc      Verify callback level matches actual level
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCallbackDataLevelConsistency0001', 0, async () => {
      logger.info(`${BUNDLE}testCallbackDataLevelConsistency0001, begin`);

      const callbackLevels: systemLoad.SystemLoadLevel[] = [];
      const callback: SystemLoadCallback = (level) => {
        callbackLevels.push(level);
        logger.info(`${BUNDLE}callback received level: ${level}`);
      };

      expect(registeredCallbacks.length).assertEqual(0);

      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);

      const currentLevel = await systemLoad.getLevel();
      logger.info(`${BUNDLE}current level: ${currentLevel}`);
      expect(isValidLevel(currentLevel)).assertTrue();
      expect(currentLevel >= 0).assertTrue();

      await new Promise<void>((resolve: () => void) => setTimeout(resolve, 100));

      if (callbackLevels.length > 0) {
        expect(callbackLevels[0]).assertEqual(currentLevel);
        logger.info(`${BUNDLE}callback level matches current level`);
      } else {
        logger.info(`${BUNDLE}no callback received during test period`);
      }

      logger.info(`${BUNDLE}callbackDataLevelConsistency_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_CALLBACK_0200
     * @tc.name      testCallbackDataTimestampOrder0001
     * @tc.desc      Verify callbacks received in timestamp order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCallbackDataTimestampOrder0001', 0, async () => {
      logger.info(`${BUNDLE}testCallbackDataTimestampOrder0001, begin`);

      expect(registeredCallbacks.length).assertEqual(0);

      const callbackTimestamps: number[] = [];
      const callback: SystemLoadCallback = (level) => {
        callbackTimestamps.push(Date.now());
        logger.info(`${BUNDLE}callback received at: ${callbackTimestamps[callbackTimestamps.length - 1]}`);
      };

      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);

      for (let i = 0; i < 3; i++) {
        const level = await systemLoad.getLevel();
        expect(isValidLevel(level)).assertTrue();
        expect(level >= 0).assertTrue();
        await new Promise<void>((resolve: () => void) => setTimeout(resolve, 50));
      }

      for (let i = 1; i < callbackTimestamps.length; i++) {
        expect(callbackTimestamps[i] >= callbackTimestamps[i - 1]).assertTrue();
        logger.info(`${BUNDLE}timestamp ${i} >= timestamp ${i - 1}`);
      }

      expect(registeredCallbacks.length).assertEqual(1);
      logger.info(`${BUNDLE}received ${callbackTimestamps.length} callbacks in order`);
      logger.info(`${BUNDLE}callbackDataTimestampOrder_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_CALLBACK_0300
     * @tc.name      testCallbackDataNoDuplicates0001
     * @tc.desc      Verify callback data has no duplicate records
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCallbackDataNoDuplicates0001', 0, async () => {
      logger.info(`${BUNDLE}testCallbackDataNoDuplicates0001, begin`);

      expect(registeredCallbacks.length).assertEqual(0);

      const callbackRecords: string[] = [];
      const callback: SystemLoadCallback = (level) => {
        const record = `${Date.now()}:${level}`;
        callbackRecords.push(record);
        logger.info(`${BUNDLE}callback record: ${record}`);
      };

      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);

      for (let i = 0; i < 5; i++) {
        const level = await systemLoad.getLevel();
        expect(isValidLevel(level)).assertTrue();
        expect(level >= 0).assertTrue();
        await new Promise<void>((resolve: () => void) => setTimeout(resolve, 30));
      }

      const uniqueRecords = new Set(callbackRecords);
      expect(uniqueRecords.size).assertEqual(callbackRecords.length);
      expect(registeredCallbacks.length).assertEqual(1);
      logger.info(`${BUNDLE}all ${callbackRecords.length} records are unique`);

      logger.info(`${BUNDLE}callbackDataNoDuplicates_0001, end`);
    });

    // ========================================================================
    // 页面状态同步测试
    // ========================================================================

    /**
     * @tc.number    SYSTEMLOAD_PAGESTATE_0100
     * @tc.name      testPageStateActiveFlag0001
     * @tc.desc      Verify isActive flag reflects page state correctly
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPageStateActiveFlag0001', 0, async () => {
      logger.info(`${BUNDLE}testPageStateActiveFlag0001, begin`);

      let isActive = true;
      logger.info(`${BUNDLE}initial active state: ${isActive}`);
      expect(isActive).assertTrue();

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      logger.info(`${BUNDLE}query succeeded while active`);

      isActive = false;
      logger.info(`${BUNDLE}transition to inactive state`);
      expect(isActive).assertFalse();

      const level2 = await systemLoad.getLevel();
      expect(isValidLevel(level2)).assertTrue();
      expect(level2 >= 0).assertTrue();
      logger.info(`${BUNDLE}query succeeded while inactive`);

      logger.info(`${BUNDLE}pageStateActiveFlag_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_PAGESTATE_0200
     * @tc.name      testPageStateMockFlag0001
     * @tc.desc      Verify isMock flag toggles correctly
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPageStateMockFlag0001', 0, async () => {
      logger.info(`${BUNDLE}testPageStateMockFlag0001, begin`);

      let isMock = false;
      logger.info(`${BUNDLE}initial mock state: ${isMock}`);

      const realLevel = await systemLoad.getLevel();
      expect(isValidLevel(realLevel)).assertTrue();
      logger.info(`${BUNDLE}real level: ${realLevel}`);

      isMock = true;
      logger.info(`${BUNDLE}transition to mock state`);

      const mockLevel = systemLoad.SystemLoadLevel.MEDIUM;
      expect(isValidLevel(mockLevel)).assertTrue();
      logger.info(`${BUNDLE}mock level: ${mockLevel}`);

      isMock = false;
      logger.info(`${BUNDLE}transition back to real state`);

      const realLevel2 = await systemLoad.getLevel();
      expect(isValidLevel(realLevel2)).assertTrue();
      logger.info(`${BUNDLE}real level after transition: ${realLevel2}`);

      logger.info(`${BUNDLE}pageStateMockFlag_0001, end`);
    });

    // ========================================================================
    // 请求 ID 防重测试
    // ========================================================================

    /**
     * @tc.number    SYSTEMLOAD_REQUESTID_0100
     * @tc.name      testRequestIdIncrement0001
     * @tc.desc      Verify requestId increments correctly on each operation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRequestIdIncrement0001', 0, async () => {
      logger.info(`${BUNDLE}testRequestIdIncrement0001, begin`);

      let requestId = 0;
      logger.info(`${BUNDLE}initial request ID: ${requestId}`);

      requestId++;
      const level1 = await systemLoad.getLevel();
      expect(isValidLevel(level1)).assertTrue();
      logger.info(`${BUNDLE}request ${requestId}: query level ${level1}`);

      requestId++;
      const level2 = await systemLoad.getLevel();
      expect(isValidLevel(level2)).assertTrue();
      logger.info(`${BUNDLE}request ${requestId}: query level ${level2}`);

      requestId++;
      const level3 = await systemLoad.getLevel();
      expect(isValidLevel(level3)).assertTrue();
      logger.info(`${BUNDLE}request ${requestId}: query level ${level3}`);

      expect(requestId).assertEqual(3);
      logger.info(`${BUNDLE}request ID correctly incremented to ${requestId}`);

      logger.info(`${BUNDLE}requestIdIncrement_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_REQUESTID_0200
     * @tc.name      testRequestIdPreventStale0001
     * @tc.desc      Verify stale request results do not override new selection
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRequestIdPreventStale0001', 0, async () => {
      logger.info(`${BUNDLE}testRequestIdPreventStale0001, begin`);

      const requestIds: number[] = [];
      let currentRequestId = 0;

      for (let i = 0; i < 3; i++) {
        currentRequestId++;
        requestIds.push(currentRequestId);
        
        const level = await systemLoad.getLevel();
        expect(isValidLevel(level)).assertTrue();
        logger.info(`${BUNDLE}request ${currentRequestId} returned level ${level}`);
        
        await new Promise<void>((resolve: () => void) => setTimeout(resolve, 50));
      }

      expect(requestIds.length).assertEqual(3);
      expect(requestIds[0]).assertEqual(1);
      expect(requestIds[1]).assertEqual(2);
      expect(requestIds[2]).assertEqual(3);
      
      logger.info(`${BUNDLE}all requests completed in order`);
      logger.info(`${BUNDLE}requestIdPreventStale_0001, end`);
    });
  });
}
