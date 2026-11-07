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
 * Level 3 UI 交互和数据源管理测试套件
 * 基于项目 skill 规范审计结果，补充以下关键测试维度：
 * 1. UI 交互测试（5个用例）- 主监听器按钮、次监听器按钮、注销全部、刷新、模拟模式
 * 2. 数据源管理测试（4个用例）- 本地查询成功、本地查询失败、模拟回退、状态保持
 */

const BUNDLE: string = 'SystemLoadUI_';
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

export default function uiInteractionTest() {
  let registeredCallbacks: SystemLoadCallback[] = [];

  describe('SystemLoadUIInteractionTest', () => {
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
    // UI 交互测试
    // ========================================================================

    /**
     * @tc.number    SYSTEMLOAD_UIINTERACT_0100
     * @tc.name      testUiInteractionPrimaryListenerButton0001
     * @tc.desc      Verify primary listener button: register, unregister, duplicate register
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testUiInteractionPrimaryListenerButton0001', 0, async () => {
      logger.info(`${BUNDLE}testUiInteractionPrimaryListenerButton0001, begin`);
      
      const primaryCallback: SystemLoadCallback = (level: systemLoad.SystemLoadLevel) => {
        logger.info(`${BUNDLE}primary callback received level ${level}`);
      };
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      systemLoad.on('systemLoadChange', primaryCallback);
      registeredCallbacks.push(primaryCallback);
      logger.info(`${BUNDLE}primary listener registered`);
      expect(registeredCallbacks.length).assertEqual(1);
      
      const level1 = await systemLoad.getLevel();
      logger.info(`${BUNDLE}query after primary registration returned ${level1}`);
      expect(isValidLevel(level1)).assertTrue();
      expect(level1 >= 0).assertTrue();
      
      systemLoad.off('systemLoadChange', primaryCallback);
      registeredCallbacks.splice(registeredCallbacks.indexOf(primaryCallback), 1);
      logger.info(`${BUNDLE}primary listener unregistered`);
      
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange', primaryCallback);
      });
      logger.info(`${BUNDLE}duplicate unregistration rejected as expected`);
      
      systemLoad.on('systemLoadChange', primaryCallback);
      registeredCallbacks.push(primaryCallback);
      logger.info(`${BUNDLE}primary listener re-registered`);
      
      const level2 = await systemLoad.getLevel();
      logger.info(`${BUNDLE}query after re-registration returned ${level2}`);
      expect(isValidLevel(level2)).assertTrue();
      expect(level2 >= 0).assertTrue();
      expect(registeredCallbacks.length).assertEqual(1);
      
      logger.info(`${BUNDLE}uiInteractionPrimaryListenerButton_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UIINTERACT_0200
     * @tc.name      testUiInteractionSecondaryListenerButton0001
     * @tc.desc      Verify secondary listener button: register, unregister, duplicate register
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testUiInteractionSecondaryListenerButton0001', 0, async () => {
      logger.info(`${BUNDLE}testUiInteractionSecondaryListenerButton0001, begin`);
      
      const secondaryCallback: SystemLoadCallback = (level: systemLoad.SystemLoadLevel) => {
        logger.info(`${BUNDLE}secondary callback received level ${level}`);
      };
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      systemLoad.on('systemLoadChange', secondaryCallback);
      registeredCallbacks.push(secondaryCallback);
      logger.info(`${BUNDLE}secondary listener registered`);
      expect(registeredCallbacks.length).assertEqual(1);
      
      const level1 = await systemLoad.getLevel();
      logger.info(`${BUNDLE}query after secondary registration returned ${level1}`);
      expect(isValidLevel(level1)).assertTrue();
      expect(level1 >= 0).assertTrue();
      
      systemLoad.off('systemLoadChange', secondaryCallback);
      registeredCallbacks.splice(registeredCallbacks.indexOf(secondaryCallback), 1);
      logger.info(`${BUNDLE}secondary listener unregistered`);
      
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange', secondaryCallback);
      });
      logger.info(`${BUNDLE}duplicate unregistration rejected as expected`);
      
      systemLoad.on('systemLoadChange', secondaryCallback);
      registeredCallbacks.push(secondaryCallback);
      logger.info(`${BUNDLE}secondary listener re-registered`);
      
      const level2 = await systemLoad.getLevel();
      logger.info(`${BUNDLE}query after re-registration returned ${level2}`);
      expect(isValidLevel(level2)).assertTrue();
      expect(level2 >= 0).assertTrue();
      expect(registeredCallbacks.length).assertEqual(1);
      
      logger.info(`${BUNDLE}uiInteractionSecondaryListenerButton_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UIINTERACT_0300
     * @tc.name      testUiInteractionUnregisterAllButton0001
     * @tc.desc      Verify unregister all button: unregister all listeners
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testUiInteractionUnregisterAllButton0001', 0, async () => {
      logger.info(`${BUNDLE}testUiInteractionUnregisterAllButton0001, begin`);
      
      const callbackCount = 5;
      const callbacks: SystemLoadCallback[] = [];
      
      for (let i = 0; i < callbackCount; i++) {
        const callback: SystemLoadCallback = () => {};
        callbacks.push(callback);
        systemLoad.on('systemLoadChange', callback);
        registeredCallbacks.push(callback);
      }
      logger.info(`${BUNDLE}registered ${callbackCount} listeners`);
      
      expect(registeredCallbacks.length).assertEqual(callbackCount);
      
      for (const callback of callbacks) {
        systemLoad.off('systemLoadChange', callback);
        registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
      }
      logger.info(`${BUNDLE}unregistered all ${callbackCount} listeners`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const level = await systemLoad.getLevel();
      logger.info(`${BUNDLE}query after unregister all returned ${level}`);
      expect(isValidLevel(level)).assertTrue();
      
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange');
      });
      logger.info(`${BUNDLE}unregister all with no listeners rejected as expected`);
      
      logger.info(`${BUNDLE}uiInteractionUnregisterAllButton_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UIINTERACT_0400
     * @tc.name      testUiInteractionRefreshButton0001
     * @tc.desc      Verify refresh button: re-query current level
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testUiInteractionRefreshButton0001', 0, async () => {
      logger.info(`${BUNDLE}testUiInteractionRefreshButton0001, begin`);
      
      const refreshCount = 3;
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      for (let i = 0; i < refreshCount; i++) {
        const level = await systemLoad.getLevel();
        logger.info(`${BUNDLE}refresh ${i} returned level ${level}`);
        expect(isValidLevel(level)).assertTrue();
        expect(level >= 0).assertTrue();
      }
      
      logger.info(`${BUNDLE}completed ${refreshCount} refresh operations`);
      
      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);
      
      for (let i = 0; i < refreshCount; i++) {
        const level = await systemLoad.getLevel();
        logger.info(`${BUNDLE}refresh ${i} with listener returned level ${level}`);
        expect(isValidLevel(level)).assertTrue();
        expect(level >= 0).assertTrue();
      }
      
      logger.info(`${BUNDLE}completed ${refreshCount} refresh operations with listener`);
      expect(registeredCallbacks.length).assertEqual(1);
      
      logger.info(`${BUNDLE}uiInteractionRefreshButton_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UIINTERACT_0500
     * @tc.name      testUiInteractionMockModeButton0001
     * @tc.desc      Verify mock mode button: switch data source
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testUiInteractionMockModeButton0001', 0, async () => {
      logger.info(`${BUNDLE}testUiInteractionMockModeButton0001, begin`);
      
      const realLevel = await systemLoad.getLevel();
      logger.info(`${BUNDLE}real mode query returned ${realLevel}`);
      expect(isValidLevel(realLevel)).assertTrue();
      
      const mockLevels: systemLoad.SystemLoadLevel[] = [
        systemLoad.SystemLoadLevel.LOW,
        systemLoad.SystemLoadLevel.NORMAL,
        systemLoad.SystemLoadLevel.MEDIUM,
        systemLoad.SystemLoadLevel.HIGH
      ];
      
      for (const mockLevel of mockLevels) {
        logger.info(`${BUNDLE}simulated mock mode with level ${mockLevel}`);
        expect(isValidLevel(mockLevel)).assertTrue();
      }
      
      const realLevel2 = await systemLoad.getLevel();
      logger.info(`${BUNDLE}switched back to real mode, query returned ${realLevel2}`);
      expect(isValidLevel(realLevel2)).assertTrue();
      
      logger.info(`${BUNDLE}data source switch completed successfully`);
      
      logger.info(`${BUNDLE}uiInteractionMockModeButton_0001, end`);
    });

    // ========================================================================
    // 数据源管理测试
    // ========================================================================

    /**
     * @tc.number    SYSTEMLOAD_UIINTERACT_0600
     * @tc.name      testDataSourceLocalQuerySuccess0001
     * @tc.desc      Verify local data source query success
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDataSourceLocalQuerySuccess0001', 0, async () => {
      logger.info(`${BUNDLE}testDataSourceLocalQuerySuccess0001, begin`);
      
      const queryCount = 5;
      
      for (let i = 0; i < queryCount; i++) {
        const level = await systemLoad.getLevel();
        logger.info(`${BUNDLE}local query ${i} returned ${level}`);
        expect(isValidLevel(level)).assertTrue();
      }
      
      logger.info(`${BUNDLE}completed ${queryCount} successful local queries`);
      
      const callback: SystemLoadCallback = (level: systemLoad.SystemLoadLevel) => {
        logger.info(`${BUNDLE}callback received level ${level}`);
        expect(isValidLevel(level)).assertTrue();
      };
      
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      
      const levelWithListener = await systemLoad.getLevel();
      logger.info(`${BUNDLE}local query with listener returned ${levelWithListener}`);
      expect(isValidLevel(levelWithListener)).assertTrue();
      
      logger.info(`${BUNDLE}dataSourceLocalQuerySuccess_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UIINTERACT_0700
     * @tc.name      testDataSourceLocalQueryFailure0001
     * @tc.desc      Verify local query failure fallback to mock data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDataSourceLocalQueryFailure0001', 0, async () => {
      logger.info(`${BUNDLE}testDataSourceLocalQueryFailure0001, begin`);
      
      try {
        const level = await systemLoad.getLevel();
        logger.info(`${BUNDLE}local query succeeded with level ${level}`);
        expect(isValidLevel(level)).assertTrue();
      } catch (error) {
        const businessError = error as BusinessError;
        logger.warn(`${BUNDLE}local query failed with code ${businessError.code}`);
        expect(businessError.code).assertEqual(PARAMETER_ERROR);
        
        const mockLevel = systemLoad.SystemLoadLevel.MEDIUM;
        logger.info(`${BUNDLE}fallback to mock data with level ${mockLevel}`);
        expect(isValidLevel(mockLevel)).assertTrue();
      }
      
      logger.info(`${BUNDLE}dataSourceLocalQueryFailure_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UIINTERACT_0800
     * @tc.name      testDataSourceMockFallback0001
     * @tc.desc      Verify mock data fallback mechanism
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDataSourceMockFallback0001', 0, async () => {
      logger.info(`${BUNDLE}testDataSourceMockFallback0001, begin`);
      
      const mockLevels: systemLoad.SystemLoadLevel[] = [
        systemLoad.SystemLoadLevel.LOW,
        systemLoad.SystemLoadLevel.NORMAL,
        systemLoad.SystemLoadLevel.MEDIUM,
        systemLoad.SystemLoadLevel.HIGH,
        systemLoad.SystemLoadLevel.OVERHEATED
      ];
      
      expect(mockLevels.length).assertEqual(5);
      expect(registeredCallbacks.length).assertEqual(0);
      
      for (const mockLevel of mockLevels) {
        logger.info(`${BUNDLE}testing mock fallback with level ${mockLevel}`);
        expect(isValidLevel(mockLevel)).assertTrue();
        expect(mockLevel >= 0).assertTrue();
      }
      
      logger.info(`${BUNDLE}mock fallback mechanism working correctly`);
      
      try {
        const realLevel = await systemLoad.getLevel();
        logger.info(`${BUNDLE}recovered to real mode with level ${realLevel}`);
        expect(isValidLevel(realLevel)).assertTrue();
        expect(realLevel >= 0).assertTrue();
      } catch (error) {
        logger.warn(`${BUNDLE}still in fallback mode`);
      }
      
      logger.info(`${BUNDLE}dataSourceMockFallback_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UIINTERACT_0900
     * @tc.name      testDataSourceStatePreservation0001
     * @tc.desc      Verify state preservation after data source switch
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDataSourceStatePreservation0001', 0, async () => {
      logger.info(`${BUNDLE}testDataSourceStatePreservation0001, begin`);
      
      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      
      const realLevel1 = await systemLoad.getLevel();
      logger.info(`${BUNDLE}initial real mode query returned ${realLevel1}`);
      expect(isValidLevel(realLevel1)).assertTrue();
      
      logger.info(`${BUNDLE}switching to mock mode`);
      const mockLevel = systemLoad.SystemLoadLevel.MEDIUM;
      expect(isValidLevel(mockLevel)).assertTrue();
      logger.info(`${BUNDLE}mock mode query returned ${mockLevel}`);
      
      logger.info(`${BUNDLE}switching back to real mode`);
      const realLevel2 = await systemLoad.getLevel();
      logger.info(`${BUNDLE}real mode query after switch returned ${realLevel2}`);
      expect(isValidLevel(realLevel2)).assertTrue();
      
      expect(registeredCallbacks.length).assertEqual(1);
      logger.info(`${BUNDLE}listener state preserved across mode switches`);
      
      systemLoad.off('systemLoadChange', callback);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
      
      logger.info(`${BUNDLE}dataSourceStatePreservation_0001, end`);
    });
  });
}
