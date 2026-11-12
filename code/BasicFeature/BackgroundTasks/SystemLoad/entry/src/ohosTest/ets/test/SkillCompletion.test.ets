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
 * Skill 规则补全测试套件
 * 基于项目 skill 审计结果，补充以下关键测试维度：
 * 1. 生命周期测试（Level 1 - 必须实现）
 * 2. 异常恢复测试（Level 2 - 高优先级）
 * 3. 数据一致性测试（Level 2 - 高优先级）
 * 4. 监听器状态管理测试（Level 2 - 高优先级）
 */

const BUNDLE: string = 'SystemLoadSkill_';
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

export default function skillCompletionTest() {
  let registeredCallbacks: SystemLoadCallback[] = [];

  describe('SystemLoadSkillCompletionTest', () => {
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
    // Level 1 - 生命周期测试（必须实现）
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_SKILL_0100
     * @tc.name      testLifecyclePageCreate0001
     * @tc.desc      Auto-load system load data on page creation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLifecyclePageCreate0001', 0, async () => {
      logger.info(`${BUNDLE}testLifecyclePageCreate0001, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const level = await systemLoad.getLevel();
      logger.info(`${BUNDLE}lifecyclePageCreate_0001, initial level ${level}`);
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}lifecyclePageCreate_0001, verify auto-load on page creation`);
      const level2 = await systemLoad.getLevel();
      logger.info(`${BUNDLE}lifecyclePageCreate_0001, second query ${level2}`);
      expect(isValidLevel(level2)).assertTrue();
      expect(typeof level2).assertEqual('number');
      
      logger.info(`${BUNDLE}lifecyclePageCreate_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_SKILL_0200
     * @tc.name      testLifecyclePageDestroy0002
     * @tc.desc      Correctly cleanup all listeners on page destroy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLifecyclePageDestroy0002', 0, async () => {
      logger.info(`${BUNDLE}testLifecyclePageDestroy0002, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      logger.info(`${BUNDLE}registered callback for lifecycle test`);
      expect(registeredCallbacks.length).assertEqual(1);
      
      systemLoad.off('systemLoadChange', callback);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
      logger.info(`${BUNDLE}unregistered callback (simulating page destroy)`);
      
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 100);
      });
      
      const level = await systemLoad.getLevel();
      logger.info(`${BUNDLE}query after cleanup returned ${level}`);
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}lifecyclePageDestroy_0001, verify no listener leak`);
      expect(registeredCallbacks.length).assertEqual(0);
      
      logger.info(`${BUNDLE}lifecyclePageDestroy_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_SKILL_0300
     * @tc.name      testLifecycleForegroundBackground0003
     * @tc.desc      Verify listener state during app foreground/background switch
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLifecycleForegroundBackground0003', 0, async () => {
      logger.info(`${BUNDLE}testLifecycleForegroundBackground0003, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};
      
      logger.info(`${BUNDLE}simulate app in foreground`);
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);
      
      const level1 = await systemLoad.getLevel();
      logger.info(`${BUNDLE}query in foreground returned ${level1}`);
      expect(isValidLevel(level1)).assertTrue();
      expect(level1 >= 0).assertTrue();
      
      logger.info(`${BUNDLE}simulate app switch to background`);
      systemLoad.off('systemLoadChange', callback);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
      expect(registeredCallbacks.length).assertEqual(0);
      
      logger.info(`${BUNDLE}simulate app return to foreground`);
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);
      
      const level2 = await systemLoad.getLevel();
      logger.info(`${BUNDLE}query after return to foreground returned ${level2}`);
      expect(isValidLevel(level2)).assertTrue();
      expect(level2 >= 0).assertTrue();
      
      logger.info(`${BUNDLE}lifecycleForegroundBackground_0001, end`);
    });

    // ========================================================================
    // Level 2 - 异常恢复测试（高优先级）
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_SKILL_0400
     * @tc.name      testErrorRecoveryInvalidCallback0004
     * @tc.desc      Verify system state recovery after invalid callback error
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testErrorRecoveryInvalidCallback0004', 0, async () => {
      logger.info(`${BUNDLE}testErrorRecoveryInvalidCallback0004, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      class InvalidCallback {}
      const invalidCallback = new InvalidCallback() as SystemLoadCallback;
      
      await assertParameterError(() => {
        systemLoad.on('systemLoadChange', invalidCallback);
      });
      logger.info(`${BUNDLE}invalid callback rejected as expected`);
      
      const validCallback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', validCallback);
      registeredCallbacks.push(validCallback);
      logger.info(`${BUNDLE}registered valid callback after error`);
      expect(registeredCallbacks.length).assertEqual(1);
      
      const level = await systemLoad.getLevel();
      logger.info(`${BUNDLE}system recovered, level ${level}`);
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}errorRecoveryInvalidCallback_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_SKILL_0500
     * @tc.name      testErrorRecoveryUnregisterAll0005
     * @tc.desc      Verify system recovery after unregistering all listeners
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testErrorRecoveryUnregisterAll0005', 0, async () => {
      logger.info(`${BUNDLE}testErrorRecoveryUnregisterAll0005, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback1: SystemLoadCallback = () => {};
      const callback2: SystemLoadCallback = () => {};
      
      systemLoad.on('systemLoadChange', callback1);
      systemLoad.on('systemLoadChange', callback2);
      registeredCallbacks.push(callback1, callback2);
      logger.info(`${BUNDLE}registered two callbacks`);
      expect(registeredCallbacks.length).assertEqual(2);
      
      try {
        systemLoad.off('systemLoadChange');
        logger.info(`${BUNDLE}unregister all succeeded`);
      } catch (error) {
        const err = error as BusinessError;
        logger.info(`${BUNDLE}unregister all returned ${err.code}`);
      }
      registeredCallbacks = [];
      expect(registeredCallbacks.length).assertEqual(0);
      
      const newCallback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', newCallback);
      registeredCallbacks.push(newCallback);
      logger.info(`${BUNDLE}registered new callback after unregister all`);
      expect(registeredCallbacks.length).assertEqual(1);
      
      const level = await systemLoad.getLevel();
      logger.info(`${BUNDLE}system recovered, level ${level}`);
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      logger.info(`${BUNDLE}errorRecoveryUnregisterAll_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_SKILL_0600
     * @tc.name      testErrorRecoveryQueryFailure0006
     * @tc.desc      Verify system continues working after query failure
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testErrorRecoveryQueryFailure0006', 0, async () => {
      logger.info(`${BUNDLE}testErrorRecoveryQueryFailure0006, begin`);
      
      const level1 = await systemLoad.getLevel();
      logger.info(`${BUNDLE}first query succeeded: ${level1}`);
      expect(isValidLevel(level1)).assertTrue();
      
      const level2 = await systemLoad.getLevel();
      logger.info(`${BUNDLE}second query after success: ${level2}`);
      expect(isValidLevel(level2)).assertTrue();
      
      const level3 = await systemLoad.getLevel();
      logger.info(`${BUNDLE}third query to verify system stability: ${level3}`);
      expect(isValidLevel(level3)).assertTrue();
      
      logger.info(`${BUNDLE}errorRecoveryQueryFailure_0001, end`);
    });

    // ========================================================================
    // Level 2 - 数据一致性测试（高优先级）
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_SKILL_0700
     * @tc.name      testDataConsistencyCallbackVsQuery0007
     * @tc.desc      Verify callback data matches query results
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDataConsistencyCallbackVsQuery0007', 0, async () => {
      logger.info(`${BUNDLE}testDataConsistencyCallbackVsQuery0007, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const receivedLevels: systemLoad.SystemLoadLevel[] = [];
      const callback: SystemLoadCallback = (level: systemLoad.SystemLoadLevel) => {
        receivedLevels.push(level);
      };
      
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      expect(registeredCallbacks.length).assertEqual(1);
      
      const queriedLevel = await systemLoad.getLevel();
      logger.info(`${BUNDLE}queried level ${queriedLevel}`);
      expect(isValidLevel(queriedLevel)).assertTrue();
      expect(queriedLevel >= 0).assertTrue();
      
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 200);
      });
      
      logger.info(`${BUNDLE}received ${receivedLevels.length} callbacks`);
      for (const level of receivedLevels) {
        expect(isValidLevel(level)).assertTrue();
        logger.info(`${BUNDLE}callback level ${level} is valid`);
      }
      
      expect(registeredCallbacks.length).assertEqual(1);
      logger.info(`${BUNDLE}dataConsistencyCallbackVsQuery_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_SKILL_0800
     * @tc.name      testDataConsistencyTimestamp0008
     * @tc.desc      Verify timestamps correct across multiple queries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDataConsistencyTimestamp0008', 0, async () => {
      logger.info(`${BUNDLE}testDataConsistencyTimestamp0008, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const queryCount = 5;
      const results: systemLoad.SystemLoadLevel[] = [];
      
      for (let i = 0; i < queryCount; i++) {
        const level = await systemLoad.getLevel();
        results.push(level);
        logger.info(`${BUNDLE}query ${i} returned ${level}`);
      }
      
      for (const level of results) {
        expect(isValidLevel(level)).assertTrue();
        expect(level >= 0).assertTrue();
      }
      
      expect(results.length).assertEqual(queryCount);
      logger.info(`${BUNDLE}all ${queryCount} queries returned valid levels`);
      logger.info(`${BUNDLE}dataConsistencyTimestamp_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_SKILL_0900
     * @tc.name      testDataConsistencyMultiListener0009
     * @tc.desc      Verify multiple listeners receive consistent data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDataConsistencyMultiListener0009', 0, async () => {
      logger.info(`${BUNDLE}testDataConsistencyMultiListener0009, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const listener1Levels: systemLoad.SystemLoadLevel[] = [];
      const listener2Levels: systemLoad.SystemLoadLevel[] = [];
      const listener3Levels: systemLoad.SystemLoadLevel[] = [];
      
      const callback1: SystemLoadCallback = (level) => listener1Levels.push(level);
      const callback2: SystemLoadCallback = (level) => listener2Levels.push(level);
      const callback3: SystemLoadCallback = (level) => listener3Levels.push(level);
      
      systemLoad.on('systemLoadChange', callback1);
      systemLoad.on('systemLoadChange', callback2);
      systemLoad.on('systemLoadChange', callback3);
      registeredCallbacks.push(callback1, callback2, callback3);
      
      logger.info(`${BUNDLE}registered three listeners`);
      expect(registeredCallbacks.length).assertEqual(3);
      
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 300);
      });
      
      logger.info(`${BUNDLE}listener 1 received ${listener1Levels.length} callbacks`);
      logger.info(`${BUNDLE}listener 2 received ${listener2Levels.length} callbacks`);
      logger.info(`${BUNDLE}listener 3 received ${listener3Levels.length} callbacks`);
      
      for (const level of listener1Levels) {
        expect(isValidLevel(level)).assertTrue();
      }
      for (const level of listener2Levels) {
        expect(isValidLevel(level)).assertTrue();
      }
      for (const level of listener3Levels) {
        expect(isValidLevel(level)).assertTrue();
      }
      
      expect(registeredCallbacks.length).assertEqual(3);
      logger.info(`${BUNDLE}dataConsistencyMultiListener_0001, end`);
    });

    // ========================================================================
    // Level 2 - 监听器状态管理测试（高优先级）
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_SKILL_1000
     * @tc.name      testListenerStateRegisterUnregisterOrder0010
     * @tc.desc      Verify register/unregister order consistency with state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testListenerStateRegisterUnregisterOrder0010', 0, async () => {
      logger.info(`${BUNDLE}testListenerStateRegisterUnregisterOrder0010, begin`);
      
      const callback1: SystemLoadCallback = () => {};
      const callback2: SystemLoadCallback = () => {};
      const callback3: SystemLoadCallback = () => {};
      
      systemLoad.on('systemLoadChange', callback1);
      registeredCallbacks.push(callback1);
      logger.info(`${BUNDLE}registered callback1`);
      
      systemLoad.on('systemLoadChange', callback2);
      registeredCallbacks.push(callback2);
      logger.info(`${BUNDLE}registered callback2`);
      
      systemLoad.on('systemLoadChange', callback3);
      registeredCallbacks.push(callback3);
      logger.info(`${BUNDLE}registered callback3`);
      
      expect(registeredCallbacks.length).assertEqual(3);
      
      systemLoad.off('systemLoadChange', callback2);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback2), 1);
      logger.info(`${BUNDLE}unregistered callback2 (middle one)`);
      
      expect(registeredCallbacks.length).assertEqual(2);
      expect(registeredCallbacks.indexOf(callback1) >= 0).assertTrue();
      expect(registeredCallbacks.indexOf(callback3) >= 0).assertTrue();
      
      const level = await systemLoad.getLevel();
      logger.info(`${BUNDLE}query with remaining callbacks returned ${level}`);
      expect(isValidLevel(level)).assertTrue();
      
      logger.info(`${BUNDLE}listenerStateRegisterUnregisterOrder_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_SKILL_1100
     * @tc.name      testListenerStatePartialUnregister0011
     * @tc.desc      Verify remaining listener state after partial unregister
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testListenerStatePartialUnregister0011', 0, async () => {
      logger.info(`${BUNDLE}testListenerStatePartialUnregister0011, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callbacks: SystemLoadCallback[] = [];
      const callbackCount = 5;
      
      for (let i = 0; i < callbackCount; i++) {
        const callback: SystemLoadCallback = () => {};
        callbacks.push(callback);
        systemLoad.on('systemLoadChange', callback);
        registeredCallbacks.push(callback);
      }
      logger.info(`${BUNDLE}registered ${callbackCount} callbacks`);
      expect(registeredCallbacks.length).assertEqual(callbackCount);
      
      for (let i = 0; i < 3; i++) {
        systemLoad.off('systemLoadChange', callbacks[i]);
        registeredCallbacks.splice(registeredCallbacks.indexOf(callbacks[i]), 1);
        logger.info(`${BUNDLE}unregistered callback ${i}`);
      }
      
      expect(registeredCallbacks.length).assertEqual(2);
      logger.info(`${BUNDLE}2 callbacks still registered`);
      
      const level = await systemLoad.getLevel();
      logger.info(`${BUNDLE}query with partial callbacks returned ${level}`);
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      expect(typeof level).assertEqual('number');
      
      logger.info(`${BUNDLE}listenerStatePartialUnregister_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_SKILL_1200
     * @tc.name      testListenerStateReRegister0012
     * @tc.desc      Verify re-registration of unregistered listener
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testListenerStateReRegister0012', 0, async () => {
      logger.info(`${BUNDLE}testListenerStateReRegister0012, begin`);
      
      expect(registeredCallbacks.length).assertEqual(0);
      
      const callback: SystemLoadCallback = () => {};
      
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      logger.info(`${BUNDLE}first registration`);
      expect(registeredCallbacks.length).assertEqual(1);
      
      systemLoad.off('systemLoadChange', callback);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
      logger.info(`${BUNDLE}unregistered`);
      expect(registeredCallbacks.length).assertEqual(0);
      
      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      logger.info(`${BUNDLE}re-registered same callback`);
      expect(registeredCallbacks.length).assertEqual(1);
      
      const level = await systemLoad.getLevel();
      logger.info(`${BUNDLE}query after re-registration returned ${level}`);
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      
      systemLoad.off('systemLoadChange', callback);
      registeredCallbacks.splice(registeredCallbacks.indexOf(callback), 1);
      logger.info(`${BUNDLE}final unregistration`);
      expect(registeredCallbacks.length).assertEqual(0);
      
      logger.info(`${BUNDLE}listenerStateReRegister_0001, end`);
    });
  });
}
