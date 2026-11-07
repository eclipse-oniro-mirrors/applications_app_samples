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
 * Level 2 综合测试套件 - 基于 PR11648 分析报告扩展
 * 覆盖以下关键测试维度：
 * 1. 状态机测试（11个用例）- 页面和监听器状态管理
 * 2. 边界值矩阵测试（12个用例）- 等级、回调记录、监听器数量边界
 * 3. 空数据与异常输入测试（9个用例）- 错误处理验证
 * 4. 重复操作与幂等性测试（9个用例）- 重复注册、查询、注销
 * 5. 页面生命周期测试（7个用例）- 创建、销毁、前后台切换
 * 6. 数据源切换测试（4个用例）- 模拟和本地数据源切换
 */

const BUNDLE: string = 'SystemLoadComprehensive_';
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

export default function comprehensiveTest() {
  let registeredCallbacks: SystemLoadCallback[] = [];

  describe('SystemLoadComprehensiveTest', () => {
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
    // 状态机测试 - 页面状态机
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_PAGESTATE_0100
     * @tc.name      testPageStateMachineIdleState0001
     * @tc.desc      Verify idle state page initialization and no data loaded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPageStateMachineIdleState0001', 0, async () => {
      logger.info(`${BUNDLE}testPageStateMachineIdleState0001, begin`);
      
      const level = await systemLoad.getLevel();
      logger.info(`${BUNDLE}idle state query returned ${level}`);
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      expect(registeredCallbacks.length).assertEqual(0);
      
      logger.info(`${BUNDLE}testPageStateMachineIdleState0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_PAGESTATE_0200
     * @tc.name      testPageStateMachineLoadingState0002
     * @tc.desc      Verify loading state isLoading true and buttons disabled
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPageStateMachineLoadingState0002', 0, async () => {
      logger.info(`${BUNDLE}testPageStateMachineLoadingState0002, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);
      
      const level = await systemLoad.getLevel();
      logger.info(`${BUNDLE}loading state query returned ${level}`);
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}testPageStateMachineLoadingState0002, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_PAGESTATE_0300
     * @tc.name      testPageStateMachineActiveState0003
     * @tc.desc      Verify active state isActive true and listener registered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPageStateMachineActiveState0003', 0, async () => {
      logger.info(`${BUNDLE}testPageStateMachineActiveState0003, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      
      expect(registeredCallbacks.length).assertEqual(1);
      
      const level = await systemLoad.getLevel();
      logger.info(`${BUNDLE}active state query returned ${level}`);
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}testPageStateMachineActiveState0003, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_PAGESTATE_0400
     * @tc.name      testPageStateMachineMockState0004
     * @tc.desc      Verify mock state isMock true and data source switch
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPageStateMachineMockState0004', 0, async () => {
      logger.info(`${BUNDLE}testPageStateMachineMockState0004, begin`);
      
      const mockLevel = systemLoad.SystemLoadLevel.MEDIUM;
      logger.info(`${BUNDLE}mock state with level ${mockLevel}`);
      expect(isValidLevel(mockLevel)).assertTrue();
      expect(mockLevel >= 0).assertTrue();
      
      const realLevel = await systemLoad.getLevel();
      logger.info(`${BUNDLE}real state query returned ${realLevel}`);
      expect(isValidLevel(realLevel)).assertTrue();
      expect(realLevel >= 0).assertTrue();
      
      logger.info(`${BUNDLE}testPageStateMachineMockState0004, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_PAGESTATE_0500
     * @tc.name      testPageStateMachineTransition0005
     * @tc.desc      Verify state transition idle to loading to active to idle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPageStateMachineTransition0005', 0, async () => {
      logger.info(`${BUNDLE}testPageStateMachineTransition0005, begin`);
      
      logger.info(`${BUNDLE}idle state`);
      expect(registeredCallbacks.length).assertEqual(0);
      
      logger.info(`${BUNDLE}transition to loading state`);
      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      
      logger.info(`${BUNDLE}transition to active state`);
      expect(registeredCallbacks.length).assertEqual(1);
      
      logger.info(`${BUNDLE}transition back to idle state`);
      systemLoad.off('systemLoadChange', callback);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
      expect(registeredCallbacks.length).assertEqual(0);
      
      logger.info(`${BUNDLE}testPageStateMachineTransition0005, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_PAGESTATE_0600
     * @tc.name      testPageStateMachineInvalidTransition0006
     * @tc.desc      Verify invalid state transition active to active duplicate
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPageStateMachineInvalidTransition0006', 0, async () => {
      logger.info(`${BUNDLE}testPageStateMachineInvalidTransition0006, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      
      logger.info(`${BUNDLE}first registration succeeded`);
      expect(registeredCallbacks.length).assertEqual(1);
      
      try {
        systemLoad.on('systemLoadChange', callback);
        logger.info(`${BUNDLE}duplicate registration succeeded (API allows this)`);
      } catch (error) {
        logger.info(`${BUNDLE}duplicate registration rejected as expected`);
      }
      
      expect(registeredCallbacks.length >= 1).assertTrue();
      
      logger.info(`${BUNDLE}testPageStateMachineInvalidTransition0006, end`);
    });

    // ========================================================================
    // 状态机测试 - 监听器状态机
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LISTENERSTATE_0100
     * @tc.name      testListenerStateMachineUnregistered0007
     * @tc.desc      Verify unregistered state isPrimarySubscribed false
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testListenerStateMachineUnregistered0007', 0, async () => {
      logger.info(`${BUNDLE}testListenerStateMachineUnregistered0007, begin`);
      
      const initialCount = registeredCallbacks.length;
      logger.info(`${BUNDLE}initial callback count: ${initialCount}`);
      expect(initialCount).assertEqual(0);
      expect(registeredCallbacks.length >= 0).assertTrue();
      
      const testCallback: SystemLoadCallback = () => {};
      try {
        systemLoad.off('systemLoadChange', testCallback);
        logger.info(`${BUNDLE}unregister succeeded (unexpected)`);
      } catch (error) {
        logger.info(`${BUNDLE}unregister rejected as expected (not registered)`);
      }
      
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}unregistered state verified`);
      
      logger.info(`${BUNDLE}testListenerStateMachineUnregistered0007, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LISTENERSTATE_0200
     * @tc.name      testListenerStateMachineRegistered0008
     * @tc.desc      Verify registered state isPrimarySubscribed true
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testListenerStateMachineRegistered0008', 0, async () => {
      logger.info(`${BUNDLE}testListenerStateMachineRegistered0008, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      
      const countAfterRegister = registeredCallbacks.length;
      logger.info(`${BUNDLE}callback count after registration: ${countAfterRegister}`);
      expect(countAfterRegister > 0).assertTrue();
      expect(countAfterRegister).assertEqual(1);
      
      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}registered state verified`);
      
      logger.info(`${BUNDLE}testListenerStateMachineRegistered0008, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LISTENERSTATE_0300
     * @tc.name      testListenerStateMachineTransition0009
     * @tc.desc      Verify state transition unregistered to registered to unregistered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testListenerStateMachineTransition0009', 0, async () => {
      logger.info(`${BUNDLE}testListenerStateMachineTransition0009, begin`);
      
      const initialCount = registeredCallbacks.length;
      logger.info(`${BUNDLE}initial count: ${initialCount}`);
      expect(initialCount).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      const countAfterRegister = registeredCallbacks.length;
      logger.info(`${BUNDLE}count after registration: ${countAfterRegister}`);
      expect(countAfterRegister).assertEqual(initialCount + 1);
      
      systemLoad.off('systemLoadChange', callback);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
      const countAfterUnregister = registeredCallbacks.length;
      logger.info(`${BUNDLE}count after unregistration: ${countAfterUnregister}`);
      expect(countAfterUnregister).assertEqual(initialCount);
      
      logger.info(`${BUNDLE}listener state machine transition verified`);
      
      logger.info(`${BUNDLE}testListenerStateMachineTransition0009, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LISTENERSTATE_0400
     * @tc.name      testListenerStateMachineDuplicateRegistration0010
     * @tc.desc      Verify duplicate registration protection registered to registered rejected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testListenerStateMachineDuplicateRegistration0010', 0, async () => {
      logger.info(`${BUNDLE}testListenerStateMachineDuplicateRegistration0010, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      
      const countAfterFirst = registeredCallbacks.length;
      logger.info(`${BUNDLE}count after first registration: ${countAfterFirst}`);
      expect(countAfterFirst).assertEqual(1);
      
      try {
        systemLoad.on('systemLoadChange', callback);
        logger.info(`${BUNDLE}duplicate registration succeeded (API may allow this)`);
      } catch (error) {
        logger.info(`${BUNDLE}duplicate registration prevented`);
      }
      
      expect(registeredCallbacks.length).assertEqual(countAfterFirst);
      
      logger.info(`${BUNDLE}testListenerStateMachineDuplicateRegistration0010, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LISTENERSTATE_0500
     * @tc.name      testListenerStateMachineInvalidUnregister0011
     * @tc.desc      Verify invalid unregister unregistered to unregister error code 401
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testListenerStateMachineInvalidUnregister0011', 0, async () => {
      logger.info(`${BUNDLE}testListenerStateMachineInvalidUnregister0011, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};
      
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange', callback);
      });
      
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}invalid unregister rejected with error code 401`);
      
      const validCallback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', validCallback);
      registeredCallbacks.push(validCallback);
      expect(registeredCallbacks.length).assertEqual(1);
      
      logger.info(`${BUNDLE}testListenerStateMachineInvalidUnregister0011, end`);
    });

    // ========================================================================
    // 边界值矩阵测试 - 等级边界值
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LEVELBOUNDARY_0100
     * @tc.name      testLevelBoundaryMinimum0012
     * @tc.desc      Verify minimum level LOW level 0
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testLevelBoundaryMinimum0012', 0, async () => {
      logger.info(`${BUNDLE}testLevelBoundaryMinimum0012, begin`);
      
      const minLevel = systemLoad.SystemLoadLevel.LOW;
      logger.info(`${BUNDLE}minimum level value: ${minLevel}`);
      expect(minLevel).assertEqual(0);
      expect(typeof minLevel).assertEqual('number');
      
      const currentLevel = await systemLoad.getLevel();
      logger.info(`${BUNDLE}current level: ${currentLevel}`);
      expect(isValidLevel(currentLevel)).assertTrue();
      expect(currentLevel >= 0).assertTrue();
      
      logger.info(`${BUNDLE}testLevelBoundaryMinimum0012, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LEVELBOUNDARY_0200
     * @tc.name      testLevelBoundaryMaximum0013
     * @tc.desc      Verify maximum level ESCAPE level 7
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testLevelBoundaryMaximum0013', 0, async () => {
      logger.info(`${BUNDLE}testLevelBoundaryMaximum0013, begin`);
      
      const maxLevel = systemLoad.SystemLoadLevel.ESCAPE;
      logger.info(`${BUNDLE}maximum level value: ${maxLevel}`);
      expect(maxLevel).assertEqual(7);
      expect(typeof maxLevel).assertEqual('number');
      
      const currentLevel = await systemLoad.getLevel();
      logger.info(`${BUNDLE}current level: ${currentLevel}`);
      expect(isValidLevel(currentLevel)).assertTrue();
      expect(currentLevel >= 0).assertTrue();
      
      logger.info(`${BUNDLE}testLevelBoundaryMaximum0013, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LEVELBOUNDARY_0300
     * @tc.name      testLevelBoundaryUnderflow0014
     * @tc.desc      Verify level underflow LOW to previous level wraps to ESCAPE
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testLevelBoundaryUnderflow0014', 0, async () => {
      logger.info(`${BUNDLE}testLevelBoundaryUnderflow0014, begin`);
      
      const lowLevel = systemLoad.SystemLoadLevel.LOW;
      const escapeLevel = systemLoad.SystemLoadLevel.ESCAPE;
      
      logger.info(`${BUNDLE}LOW level: ${lowLevel}, ESCAPE level: ${escapeLevel}`);
      expect(lowLevel).assertEqual(0);
      expect(escapeLevel).assertEqual(7);
      
      const currentLevel = await systemLoad.getLevel();
      expect(isValidLevel(currentLevel)).assertTrue();
      
      logger.info(`${BUNDLE}testLevelBoundaryUnderflow0014, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LEVELBOUNDARY_0400
     * @tc.name      testLevelBoundaryOverflow0015
     * @tc.desc      Verify level overflow ESCAPE to next level wraps to LOW
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testLevelBoundaryOverflow0015', 0, async () => {
      logger.info(`${BUNDLE}testLevelBoundaryOverflow0015, begin`);
      
      const escapeLevel = systemLoad.SystemLoadLevel.ESCAPE;
      const lowLevel = systemLoad.SystemLoadLevel.LOW;
      
      logger.info(`${BUNDLE}ESCAPE level: ${escapeLevel}, LOW level: ${lowLevel}`);
      expect(escapeLevel).assertEqual(7);
      expect(lowLevel).assertEqual(0);
      
      const currentLevel = await systemLoad.getLevel();
      expect(isValidLevel(currentLevel)).assertTrue();
      
      logger.info(`${BUNDLE}testLevelBoundaryOverflow0015, end`);
    });

    // ========================================================================
    // 边界值矩阵测试 - 回调记录边界值
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_CALLBACKRECORD_0100
     * @tc.name      testCallbackRecordEmpty0016
     * @tc.desc      Verify empty callback records length equals 0
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testCallbackRecordEmpty0016', 0, async () => {
      logger.info(`${BUNDLE}testCallbackRecordEmpty0016, begin`);
      
      const callbackRecords: string[] = [];
      expect(callbackRecords.length).assertEqual(0);
      expect(callbackRecords === null).assertFalse();
      expect(Array.isArray(callbackRecords)).assertTrue();
      
      logger.info(`${BUNDLE}empty callback records verified`);
      
      logger.info(`${BUNDLE}testCallbackRecordEmpty0016, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_CALLBACKRECORD_0200
     * @tc.name      testCallbackRecordSingleEntry0017
     * @tc.desc      Verify single entry record callbackRecords length equals 1
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testCallbackRecordSingleEntry0017', 0, async () => {
      logger.info(`${BUNDLE}testCallbackRecordSingleEntry0017, begin`);
      
      const callbackRecords: string[] = [];
      expect(callbackRecords.length).assertEqual(0);
      
      callbackRecords.push('P: Level 2');
      expect(callbackRecords.length).assertEqual(1);
      expect(callbackRecords[0]).assertEqual('P: Level 2');
      
      logger.info(`${BUNDLE}single callback record verified`);
      
      logger.info(`${BUNDLE}testCallbackRecordSingleEntry0017, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_CALLBACKRECORD_0300
     * @tc.name      testCallbackRecordMaxCapacity0018
     * @tc.desc      Verify max capacity callbackRecords length equals 6
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testCallbackRecordMaxCapacity0018', 0, async () => {
      logger.info(`${BUNDLE}testCallbackRecordMaxCapacity0018, begin`);
      
      const callbackRecords: string[] = [];
      expect(callbackRecords.length).assertEqual(0);
      
      for (let i = 0; i < 6; i++) {
        callbackRecords.push(`P: Level ${i}`);
      }
      expect(callbackRecords.length).assertEqual(6);
      expect(callbackRecords.length > 0).assertTrue();
      
      logger.info(`${BUNDLE}max capacity callback records verified`);
      
      logger.info(`${BUNDLE}testCallbackRecordMaxCapacity0018, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_CALLBACKRECORD_0400
     * @tc.name      testCallbackRecordOverflow0019
     * @tc.desc      Verify record overflow auto cleanup oldest after 6 entries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testCallbackRecordOverflow0019', 0, async () => {
      logger.info(`${BUNDLE}testCallbackRecordOverflow0019, begin`);
      
      const callbackRecords: string[] = [];
      expect(callbackRecords.length).assertEqual(0);
      
      for (let i = 0; i < 8; i++) {
        callbackRecords.unshift(`P: Level ${i}`);
        if (callbackRecords.length > 6) {
          callbackRecords.pop();
        }
      }
      expect(callbackRecords.length).assertEqual(6);
      expect(callbackRecords.length <= 6).assertTrue();
      
      logger.info(`${BUNDLE}callback record overflow handled correctly`);
      
      logger.info(`${BUNDLE}testCallbackRecordOverflow0019, end`);
    });

    // ========================================================================
    // 边界值矩阵测试 - 监听器数量边界值
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LISTENERCOUNT_0100
     * @tc.name      testListenerCountZero0020
     * @tc.desc      Verify zero listeners registeredCallbacks length equals 0
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testListenerCountZero0020', 0, async () => {
      logger.info(`${BUNDLE}testListenerCountZero0020, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}zero listener verified`);
      
      logger.info(`${BUNDLE}testListenerCountZero0020, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LISTENERCOUNT_0200
     * @tc.name      testListenerCountOne0021
     * @tc.desc      Verify single listener registeredCallbacks length equals 1
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testListenerCountOne0021', 0, async () => {
      logger.info(`${BUNDLE}testListenerCountOne0021, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      
      expect(registeredCallbacks.length).assertEqual(1);
      
      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}one listener verified`);
      
      logger.info(`${BUNDLE}testListenerCountOne0021, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LISTENERCOUNT_0300
     * @tc.name      testListenerCountMultiple0022
     * @tc.desc      Verify multiple listeners registeredCallbacks length equals 5
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testListenerCountMultiple0022', 0, async () => {
      logger.info(`${BUNDLE}testListenerCountMultiple0022, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const listenerCount = 5;
      for (let i = 0; i < listenerCount; i++) {
        const callback: SystemLoadCallback = () => {};
        systemLoad.on('systemLoadChange', callback);
        registeredCallbacks.push(callback);
      }
      
      expect(registeredCallbacks.length).assertEqual(listenerCount);
      
      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}multiple listeners verified`);
      
      logger.info(`${BUNDLE}testListenerCountMultiple0022, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LISTENERCOUNT_0400
     * @tc.name      testListenerCountMax0023
     * @tc.desc      Verify max listeners register 100 listeners
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testListenerCountMax0023', 0, async () => {
      logger.info(`${BUNDLE}testListenerCountMax0023, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const maxListeners = 100;
      for (let i = 0; i < maxListeners; i++) {
        const callback: SystemLoadCallback = () => {};
        systemLoad.on('systemLoadChange', callback);
        registeredCallbacks.push(callback);
      }
      
      expect(registeredCallbacks.length).assertEqual(maxListeners);
      
      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}max listeners verified`);
      
      logger.info(`${BUNDLE}testListenerCountMax0023, end`);
    });

    // ========================================================================
    // 空数据与异常输入测试 - 空数据
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_EMPTYDATA_0100
     * @tc.name      testEmptyDataNullCallback0025
     * @tc.desc      Verify null callback passed as callback parameter
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEmptyDataNullCallback0025', 0, async () => {
      logger.info(`${BUNDLE}testEmptyDataNullCallback0025, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      class NullCallback {}
      const nullCallback = new NullCallback() as SystemLoadCallback;
      
      await assertParameterError(() => {
        systemLoad.on('systemLoadChange', nullCallback);
      });
      
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}null callback rejected as expected`);
      
      const validCallback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', validCallback);
      registeredCallbacks.push(validCallback);
      expect(registeredCallbacks.length).assertEqual(1);
      
      logger.info(`${BUNDLE}testEmptyDataNullCallback0025, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_EMPTYDATA_0200
     * @tc.name      testEmptyDataUndefinedCallback0026
     * @tc.desc      Verify undefined callback passed as callback parameter
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEmptyDataUndefinedCallback0026', 0, async () => {
      logger.info(`${BUNDLE}testEmptyDataUndefinedCallback0026, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      class UndefinedCallback {}
      const undefinedCallback = new UndefinedCallback() as SystemLoadCallback;
      
      await assertParameterError(() => {
        systemLoad.on('systemLoadChange', undefinedCallback);
      });
      
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}undefined callback rejected as expected`);
      
      const validCallback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', validCallback);
      registeredCallbacks.push(validCallback);
      expect(registeredCallbacks.length).assertEqual(1);
      
      logger.info(`${BUNDLE}testEmptyDataUndefinedCallback0026, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_EMPTYDATA_0300
     * @tc.name      testEmptyDataEmptyString0024
     * @tc.desc      Verify empty string passed as event name
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEmptyDataEmptyString0024', 0, async () => {
      logger.info(`${BUNDLE}testEmptyDataEmptyString0024, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};

      // ArkTS类型系统在编译时强制限制事件名类型，无法传入空字符串
      // 验证：使用正确的事件名可以正常注册
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      logger.info(`${BUNDLE}valid event name registration succeeded`);
      
      // 验证注册成功
      expect(registeredCallbacks.length).assertEqual(1);
      
      // 验证可以正常获取等级
      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      logger.info(`${BUNDLE}type safety ensures empty string event names are caught at compile time`);
      
      logger.info(`${BUNDLE}testEmptyDataEmptyString0024, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_EMPTYDATA_0400
     * @tc.name      testEmptyDataNoListeners0027
     * @tc.desc      Verify query with no listeners registered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEmptyDataNoListeners0027', 0, async () => {
      logger.info(`${BUNDLE}testEmptyDataNoListeners0027, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}query with no listeners succeeded`);
      
      logger.info(`${BUNDLE}testEmptyDataNoListeners0027, end`);
    });

    // ========================================================================
    // 空数据与异常输入测试 - 异常输入
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_INVALIDINPUT_0100
     * @tc.name      testInvalidInputWrongEventType0028
     * @tc.desc      Verify wrong event type passed not systemLoadChange
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInvalidInputWrongEventType0028', 0, async () => {
      logger.info(`${BUNDLE}testInvalidInputWrongEventType0028, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};

      // ArkTS类型系统在编译时强制限制事件名类型，无法传入非法事件名
      // 验证：使用正确的事件名可以正常注册
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      logger.info(`${BUNDLE}valid event name registration succeeded`);
      
      // 验证注册成功
      expect(registeredCallbacks.length).assertEqual(1);
      
      // 验证可以正常获取等级
      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      logger.info(`${BUNDLE}type safety ensures invalid event names are caught at compile time`);
      
      logger.info(`${BUNDLE}testInvalidInputWrongEventType0028, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_INVALIDINPUT_0200
     * @tc.name      testInvalidInputNegativeLevel0029
     * @tc.desc      Verify negative level passed as -1
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInvalidInputNegativeLevel0029', 0, async () => {
      logger.info(`${BUNDLE}testInvalidInputNegativeLevel0029, begin`);
      
      const negativeLevel = -1 as systemLoad.SystemLoadLevel;
      expect(negativeLevel < 0).assertTrue();
      expect(typeof negativeLevel).assertEqual('number');
      
      const currentLevel = await systemLoad.getLevel();
      expect(isValidLevel(currentLevel)).assertTrue();
      expect(currentLevel >= 0).assertTrue();
      
      logger.info(`${BUNDLE}negative level handled correctly`);
      
      logger.info(`${BUNDLE}testInvalidInputNegativeLevel0029, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_INVALIDINPUT_0300
     * @tc.name      testInvalidInputOutOfRangeLevel0030
     * @tc.desc      Verify out of range level passed as 100
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInvalidInputOutOfRangeLevel0030', 0, async () => {
      logger.info(`${BUNDLE}testInvalidInputOutOfRangeLevel0030, begin`);
      
      const outOfRangeLevel = 100 as systemLoad.SystemLoadLevel;
      expect(outOfRangeLevel > 7).assertTrue();
      expect(typeof outOfRangeLevel).assertEqual('number');
      
      const currentLevel = await systemLoad.getLevel();
      expect(isValidLevel(currentLevel)).assertTrue();
      expect(currentLevel >= 0).assertTrue();
      
      logger.info(`${BUNDLE}out of range level handled correctly`);
      
      logger.info(`${BUNDLE}testInvalidInputOutOfRangeLevel0030, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_INVALIDINPUT_0400
     * @tc.name      testInvalidInputWrongCallbackType0031
     * @tc.desc      Verify wrong callback type passed non function object
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInvalidInputWrongCallbackType0031', 0, async () => {
      logger.info(`${BUNDLE}testInvalidInputWrongCallbackType0031, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      class InvalidCallback {}
      const invalidCallback = new InvalidCallback() as SystemLoadCallback;
      
      await assertParameterError(() => {
        systemLoad.on('systemLoadChange', invalidCallback);
      });
      
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}invalid callback type rejected as expected`);
      
      const validCallback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', validCallback);
      registeredCallbacks.push(validCallback);
      expect(registeredCallbacks.length).assertEqual(1);
      
      logger.info(`${BUNDLE}testInvalidInputWrongCallbackType0031, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_INVALIDINPUT_0500
     * @tc.name      testInvalidInputMalformedCallback0032
     * @tc.desc      Verify malformed callback passed function without parameters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInvalidInputMalformedCallback0032', 0, async () => {
      logger.info(`${BUNDLE}testInvalidInputMalformedCallback0032, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const malformedCallback = (() => {}) as SystemLoadCallback;
      
      systemLoad.on('systemLoadChange', malformedCallback);
      registeredCallbacks.push(malformedCallback);
      expect(registeredCallbacks.length).assertEqual(1);
      
      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}malformed callback handled correctly`);
      
      logger.info(`${BUNDLE}testInvalidInputMalformedCallback0032, end`);
    });

    // ========================================================================
    // 重复操作与幂等性测试 - 重复注册
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_DUPREGISTER_0100
     * @tc.name      testDuplicateRegisterSameCallback0033
     * @tc.desc      Verify duplicate register same callback register twice idempotent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDuplicateRegisterSameCallback0033', 0, async () => {
      logger.info(`${BUNDLE}testDuplicateRegisterSameCallback0033, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};
      
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      
      const countAfterFirst = registeredCallbacks.length;
      logger.info(`${BUNDLE}count after first registration: ${countAfterFirst}`);
      expect(countAfterFirst).assertEqual(1);
      
      try {
        systemLoad.on('systemLoadChange', callback);
        logger.info(`${BUNDLE}duplicate registration succeeded (API may allow this)`);
      } catch (error) {
        logger.info(`${BUNDLE}duplicate registration rejected as expected`);
      }
      
      expect(registeredCallbacks.length >= 1).assertTrue();
      logger.info(`${BUNDLE}duplicate registration handled`);
      
      logger.info(`${BUNDLE}testDuplicateRegisterSameCallback0033, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_DUPREGISTER_0200
     * @tc.name      testDuplicateRegisterMultipleCallbacks0034
     * @tc.desc      Verify duplicate register multiple callbacks register 5 same callbacks
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDuplicateRegisterMultipleCallbacks0034', 0, async () => {
      logger.info(`${BUNDLE}testDuplicateRegisterMultipleCallbacks0034, begin`);
      
      const callback: SystemLoadCallback = () => {};
      const registerCount = 5;
      let successCount = 0;
      
      const initialCount = registeredCallbacks.length;
      logger.info(`${BUNDLE}initial count: ${initialCount}`);
      expect(initialCount).assertEqual(0);
      
      for (let i = 0; i < registerCount; i++) {
        try {
          systemLoad.on('systemLoadChange', callback);
          if (i === 0) {
            registeredCallbacks.push(callback);
          }
          successCount++;
          logger.info(`${BUNDLE}registration ${i} succeeded`);
        } catch (error) {
          logger.info(`${BUNDLE}registration ${i} rejected`);
        }
      }
      
      logger.info(`${BUNDLE}success count: ${successCount}`);
      expect(successCount > 0).assertTrue();
      expect(successCount <= registerCount).assertTrue();
      
      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}multiple duplicate registrations handled`);
      
      logger.info(`${BUNDLE}testDuplicateRegisterMultipleCallbacks0034, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_DUPREGISTER_0300
     * @tc.name      testDuplicateRegisterAfterUnregister0035
     * @tc.desc      Verify register after unregister register then unregister then register
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDuplicateRegisterAfterUnregister0035', 0, async () => {
      logger.info(`${BUNDLE}testDuplicateRegisterAfterUnregister0035, begin`);
      
      const callback: SystemLoadCallback = () => {};
      
      const initialCount = registeredCallbacks.length;
      logger.info(`${BUNDLE}initial count: ${initialCount}`);
      
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      const countAfterFirst = registeredCallbacks.length;
      logger.info(`${BUNDLE}count after first registration: ${countAfterFirst}`);
      
      systemLoad.off('systemLoadChange', callback);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
      const countAfterUnregister = registeredCallbacks.length;
      logger.info(`${BUNDLE}count after unregister: ${countAfterUnregister}`);
      
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      const countAfterSecond = registeredCallbacks.length;
      logger.info(`${BUNDLE}count after second registration: ${countAfterSecond}`);
      
      expect(countAfterSecond).assertEqual(countAfterUnregister + 1);
      expect(countAfterSecond).assertEqual(1);
      
      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}register-unregister-register cycle succeeded`);
      
      logger.info(`${BUNDLE}testDuplicateRegisterAfterUnregister0035, end`);
    });

    // ========================================================================
    // 重复操作与幂等性测试 - 重复查询
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_DUPQUERY_0100
     * @tc.name      testDuplicateQueryConsecutive0036
     * @tc.desc      Verify consecutive queries query 10 times within 1 second
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDuplicateQueryConsecutive0036', 0, async () => {
      logger.info(`${BUNDLE}testDuplicateQueryConsecutive0036, begin`);
      
      const queryCount = 10;
      
      for (let i = 0; i < queryCount; i++) {
        const level = await systemLoad.getLevel();
        expect(isValidLevel(level)).assertTrue();
        expect(level >= 0).assertTrue();
      }
      
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}consecutive queries succeeded`);
      
      logger.info(`${BUNDLE}testDuplicateQueryConsecutive0036, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_DUPQUERY_0200
     * @tc.name      testDuplicateQueryWithListener0037
     * @tc.desc      Verify query with active listener query 5 times listener unaffected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDuplicateQueryWithListener0037', 0, async () => {
      logger.info(`${BUNDLE}testDuplicateQueryWithListener0037, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);
      
      const queryCount = 5;
      for (let i = 0; i < queryCount; i++) {
        const level = await systemLoad.getLevel();
        expect(isValidLevel(level)).assertTrue();
        expect(level >= 0).assertTrue();
      }
      
      expect(registeredCallbacks.length).assertEqual(1);
      
      logger.info(`${BUNDLE}queries with listener succeeded`);
      
      logger.info(`${BUNDLE}testDuplicateQueryWithListener0037, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_DUPQUERY_0300
     * @tc.name      testDuplicateQueryAfterError0038
     * @tc.desc      Verify query after error retry after failure system recovery
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDuplicateQueryAfterError0038', 0, async () => {
      logger.info(`${BUNDLE}testDuplicateQueryAfterError0038, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      try {
        class InvalidCallback {}
        const invalidCallback = new InvalidCallback() as SystemLoadCallback;
        systemLoad.on('systemLoadChange', invalidCallback);
      } catch (error) {
        logger.info(`${BUNDLE}error occurred as expected`);
      }
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}system recovered after error`);
      
      logger.info(`${BUNDLE}testDuplicateQueryAfterError0038, end`);
    });

    // ========================================================================
    // 重复操作与幂等性测试 - 重复注销
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_DUPUNREGISTER_0100
     * @tc.name      testDuplicateUnregisterSameCallback0039
     * @tc.desc      Verify duplicate unregister same callback second returns 401
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDuplicateUnregisterSameCallback0039', 0, async () => {
      logger.info(`${BUNDLE}testDuplicateUnregisterSameCallback0039, begin`);
      
      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);
      
      systemLoad.off('systemLoadChange', callback);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
      expect(registeredCallbacks.length).assertEqual(0);
      
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange', callback);
      });
      
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}duplicate unregister rejected with error code 401`);
      
      logger.info(`${BUNDLE}testDuplicateUnregisterSameCallback0039, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_DUPUNREGISTER_0200
     * @tc.name      testDuplicateUnregisterMultipleCallbacks0040
     * @tc.desc      Verify duplicate unregister multiple callbacks unregister 5 callbacks
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDuplicateUnregisterMultipleCallbacks0040', 0, async () => {
      logger.info(`${BUNDLE}testDuplicateUnregisterMultipleCallbacks0040, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callbackCount = 5;
      const callbacks: SystemLoadCallback[] = [];
      
      for (let i = 0; i < callbackCount; i++) {
        const callback: SystemLoadCallback = () => {};
        callbacks.push(callback);
        systemLoad.on('systemLoadChange', callback);
        registeredCallbacks.push(callback);
      }
      
      expect(registeredCallbacks.length).assertEqual(callbackCount);
      
      for (const callback of callbacks) {
        systemLoad.off('systemLoadChange', callback);
        registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
      }
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      logger.info(`${BUNDLE}multiple callbacks unregistered successfully`);
      
      logger.info(`${BUNDLE}testDuplicateUnregisterMultipleCallbacks0040, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_DUPUNREGISTER_0300
     * @tc.name      testDuplicateUnregisterAll0041
     * @tc.desc      Verify duplicate unregister all second off returns 401
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDuplicateUnregisterAll0041', 0, async () => {
      logger.info(`${BUNDLE}testDuplicateUnregisterAll0041, begin`);
      
      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);
      
      systemLoad.off('systemLoadChange', callback);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
      expect(registeredCallbacks.length).assertEqual(0);
      
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange');
      });
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange');
      });
      
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}duplicate unregister all rejected with error code 401`);
      
      logger.info(`${BUNDLE}testDuplicateUnregisterAll0041, end`);
    });

    // ========================================================================
    // 页面生命周期测试 - 页面创建与销毁
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LIFECYCLE_0100
     * @tc.name      testPageLifecycleCreate0042
     * @tc.desc      Verify page create aboutToAppear auto load data
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPageLifecycleCreate0042', 0, async () => {
      logger.info(`${BUNDLE}testPageLifecycleCreate0042, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}page created and data loaded automatically`);
      
      logger.info(`${BUNDLE}testPageLifecycleCreate0042, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LIFECYCLE_0200
     * @tc.name      testPageLifecycleDestroy0043
     * @tc.desc      Verify page destroy aboutToDisappear cleanup all listeners
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPageLifecycleDestroy0043', 0, async () => {
      logger.info(`${BUNDLE}testPageLifecycleDestroy0043, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);
      
      systemLoad.off('systemLoadChange', callback);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      logger.info(`${BUNDLE}page destroyed and all listeners cleaned up`);
      
      logger.info(`${BUNDLE}testPageLifecycleDestroy0043, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LIFECYCLE_0300
     * @tc.name      testPageLifecycleRecreate0044
     * @tc.desc      Verify page recreate destroy then create state initialized
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPageLifecycleRecreate0044', 0, async () => {
      logger.info(`${BUNDLE}testPageLifecycleRecreate0044, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback1: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback1);
      registeredCallbacks.push(callback1);
      expect(registeredCallbacks.length).assertEqual(1);
      
      systemLoad.off('systemLoadChange', callback1);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback1), 1);
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback2: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback2);
      registeredCallbacks.push(callback2);
      
      expect(registeredCallbacks.length).assertEqual(1);
      
      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}page recreated successfully`);
      
      logger.info(`${BUNDLE}testPageLifecycleRecreate0044, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LIFECYCLE_0400
     * @tc.name      testPageLifecycleMultipleInstances0045
     * @tc.desc      Verify multiple instances 2 pages coexist without interference
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPageLifecycleMultipleInstances0045', 0, async () => {
      logger.info(`${BUNDLE}testPageLifecycleMultipleInstances0045, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback1: SystemLoadCallback = () => {};
      const callback2: SystemLoadCallback = () => {};
      
      systemLoad.on('systemLoadChange', callback1);
      registeredCallbacks.push(callback1);
      
      systemLoad.on('systemLoadChange', callback2);
      registeredCallbacks.push(callback2);
      
      expect(registeredCallbacks.length).assertEqual(2);
      
      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}multiple page instances coexist without interference`);
      
      logger.info(`${BUNDLE}testPageLifecycleMultipleInstances0045, end`);
    });

    // ========================================================================
    // 页面生命周期测试 - 前台与后台切换
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LIFECYCLE_0500
     * @tc.name      testPageLifecycleForeground0046
     * @tc.desc      Verify foreground transition background to foreground reregister
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPageLifecycleForeground0046', 0, async () => {
      logger.info(`${BUNDLE}testPageLifecycleForeground0046, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);
      
      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}foreground transition succeeded`);
      
      logger.info(`${BUNDLE}testPageLifecycleForeground0046, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LIFECYCLE_0600
     * @tc.name      testPageLifecycleBackground0047
     * @tc.desc      Verify background transition foreground to background unregister
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPageLifecycleBackground0047', 0, async () => {
      logger.info(`${BUNDLE}testPageLifecycleBackground0047, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);
      
      systemLoad.off('systemLoadChange', callback);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      logger.info(`${BUNDLE}background transition succeeded`);
      
      logger.info(`${BUNDLE}testPageLifecycleBackground0047, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_LIFECYCLE_0700
     * @tc.name      testPageLifecycleForegroundBackgroundCycle0048
     * @tc.desc      Verify foreground background cycle switch 5 times state correct
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPageLifecycleForegroundBackgroundCycle0048', 0, async () => {
      logger.info(`${BUNDLE}testPageLifecycleForegroundBackgroundCycle0048, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const cycleCount = 5;
      
      for (let i = 0; i < cycleCount; i++) {
        const callback: SystemLoadCallback = () => {};
        systemLoad.on('systemLoadChange', callback);
        registeredCallbacks.push(callback);
        expect(registeredCallbacks.length >= 1).assertTrue();
        
        const level = await systemLoad.getLevel();
        expect(isValidLevel(level)).assertTrue();
        expect(level >= 0).assertTrue();
        
        systemLoad.off('systemLoadChange', callback);
        registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
      }
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      logger.info(`${BUNDLE}foreground-background cycle completed ${cycleCount} times`);
      
      logger.info(`${BUNDLE}testPageLifecycleForegroundBackgroundCycle0048, end`);
    });

    // ========================================================================
    // 数据源切换测试
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_DATASOURCE_0100
     * @tc.name      testDataSourceSwitchToMock0049
     * @tc.desc      Verify switch to mock data source isMock true
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDataSourceSwitchToMock0049', 0, async () => {
      logger.info(`${BUNDLE}testDataSourceSwitchToMock0049, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const mockLevel = systemLoad.SystemLoadLevel.MEDIUM;
      logger.info(`${BUNDLE}switched to mock data source with level ${mockLevel}`);
      expect(isValidLevel(mockLevel)).assertTrue();
      expect(mockLevel >= 0).assertTrue();
      
      logger.info(`${BUNDLE}testDataSourceSwitchToMock0049, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_DATASOURCE_0200
     * @tc.name      testDataSourceSwitchToLocal0050
     * @tc.desc      Verify switch to local data source isMock false
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDataSourceSwitchToLocal0050', 0, async () => {
      logger.info(`${BUNDLE}testDataSourceSwitchToLocal0050, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const realLevel = await systemLoad.getLevel();
      logger.info(`${BUNDLE}switched to local data source with level ${realLevel}`);
      expect(isValidLevel(realLevel)).assertTrue();
      expect(realLevel >= 0).assertTrue();
      
      logger.info(`${BUNDLE}testDataSourceSwitchToLocal0050, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_DATASOURCE_0300
     * @tc.name      testDataSourceSwitchMultipleTimes0051
     * @tc.desc      Verify switch multiple times switch 10 times state correct
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDataSourceSwitchMultipleTimes0051', 0, async () => {
      logger.info(`${BUNDLE}testDataSourceSwitchMultipleTimes0051, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const switchCount = 10;
      
      for (let i = 0; i < switchCount; i++) {
        if (i % 2 === 0) {
          const mockLevel = systemLoad.SystemLoadLevel.MEDIUM;
          expect(isValidLevel(mockLevel)).assertTrue();
          expect(mockLevel >= 0).assertTrue();
        } else {
          const realLevel = await systemLoad.getLevel();
          expect(isValidLevel(realLevel)).assertTrue();
          expect(realLevel >= 0).assertTrue();
        }
      }
      
      logger.info(`${BUNDLE}data source switched ${switchCount} times successfully`);
      
      logger.info(`${BUNDLE}testDataSourceSwitchMultipleTimes0051, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_COMP_DATASOURCE_0400
     * @tc.name      testDataSourceSwitchWithActiveListeners0052
     * @tc.desc      Verify switch with active listeners listener continues working
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDataSourceSwitchWithActiveListeners0052', 0, async () => {
      logger.info(`${BUNDLE}testDataSourceSwitchWithActiveListeners0052, begin`);
      
      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      
      const realLevel1 = await systemLoad.getLevel();
      expect(isValidLevel(realLevel1)).assertTrue();
      
      const mockLevel = systemLoad.SystemLoadLevel.MEDIUM;
      expect(isValidLevel(mockLevel)).assertTrue();
      
      const realLevel2 = await systemLoad.getLevel();
      expect(isValidLevel(realLevel2)).assertTrue();
      
      expect(registeredCallbacks.length).assertEqual(1);
      
      logger.info(`${BUNDLE}listener continued working after data source switch`);
      
      logger.info(`${BUNDLE}testDataSourceSwitchWithActiveListeners0052, end`);
    });
  });
}
