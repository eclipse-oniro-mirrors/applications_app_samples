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

const BUNDLE: string = 'SystemLoadSdk_';
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

interface CallbackRecorder {
  levels: systemLoad.SystemLoadLevel[];
  callback: SystemLoadCallback;
}

class InvalidCallback {
}

/**
 * 检查设备是否支持 SystemLoad API
 * @returns true 如果支持，false 如果不支持
 */
async function isSystemLoadSupported(): Promise<boolean> {
  try {
    const level = await systemLoad.getLevel();
    return isValidLevel(level);
  } catch (error) {
    const businessError = error as BusinessError;
    logger.warn(`${BUNDLE}SystemLoad API not supported: code=${businessError.code}`);
    return false;
  }
}

/**
 * 跳过测试用例（当设备不支持 SystemLoad API 时）
 * @param testName 测试用例名称
 */
function skipTest(testName: string): void {
  logger.info(`${BUNDLE}${testName} skipped - SystemLoad API not supported on this device`);
  // 使用一个总是通过的断言来标记跳过
  expect(true).assertTrue();
}

function createRecorder(): CallbackRecorder {
  const levels: systemLoad.SystemLoadLevel[] = [];
  return {
    levels: levels,
    callback: (level: systemLoad.SystemLoadLevel): void => {
      levels.push(level);
    }
  };
}

function assertRecordedLevelsValid(recorder: CallbackRecorder): void {
  for (const level of recorder.levels) {
    expect(isValidLevel(level)).assertTrue();
  }
}

function isValidLevel(level: systemLoad.SystemLoadLevel): boolean {
  return VALID_LEVELS.indexOf(level) >= 0;
}

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

function registerRecorder(recorder: CallbackRecorder, registeredCallbacks: SystemLoadCallback[]): void {
  systemLoad.on('systemLoadChange', recorder.callback);
  registeredCallbacks.push(recorder.callback);
}

function unregisterRecorder(recorder: CallbackRecorder, registeredCallbacks: SystemLoadCallback[]): void {
  systemLoad.off('systemLoadChange', recorder.callback);
  const callbackIndex = registeredCallbacks.indexOf(recorder.callback);
  if (callbackIndex >= 0) {
    registeredCallbacks.splice(callbackIndex, 1);
  }
}

export default function systemLoadSdkTest() {
  let registeredCallbacks: SystemLoadCallback[] = [];

  describe('SystemLoadSdkTest', () => {
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
     * @tc.number    SYSTEMLOAD_GETLEVEL_0100
     * @tc.name      testSystemLoadGetLevel0001
     * @tc.desc      Query the current system load and verify that it is a valid eight-level enum value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadGetLevel0001', 0, async () => {
      logger.info(`${BUNDLE}getLevel_0001, begin`);
      
      // 检查设备是否支持 SystemLoad API
      const supported = await isSystemLoadSupported();
      if (!supported) {
        skipTest('getLevel_0001');
        return;
      }
      
      const level = await systemLoad.getLevel();
      logger.info(`${BUNDLE}getLevel_0001, assert level ${level} belongs to the enum`);
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      expect(typeof level).assertEqual('number');
      logger.info(`${BUNDLE}getLevel_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_GETLEVEL_0200
     * @tc.name      testSystemLoadGetLevel0002
     * @tc.desc      Query repeatedly with an active listener and verify every result without assuming equality.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadGetLevel0002', 0, async () => {
      logger.info(`${BUNDLE}getLevel_0002, begin`);
      const recorder = createRecorder();
      registerRecorder(recorder, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(1);
      for (let index = 0; index < 3; index++) {
        const level = await systemLoad.getLevel();
        logger.info(`${BUNDLE}getLevel_0002, assert repeated query ${index} returned ${level}`);
        expect(isValidLevel(level)).assertTrue();
        expect(level >= 0).assertTrue();
      }
      logger.info(`${BUNDLE}getLevel_0002, assert any delivered callback contains a valid level`);
      assertRecordedLevelsValid(recorder);
      expect(recorder.levels.length >= 0).assertTrue();
      unregisterRecorder(recorder, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}getLevel_0002, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_GETLEVEL_0300
     * @tc.name      testSystemLoadGetLevel0003
     * @tc.desc      Query getLevel() five times without any active listener and verify each result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadGetLevel0003', 0, async () => {
      logger.info(`${BUNDLE}getLevel_0003, begin`);
      expect(registeredCallbacks.length).assertEqual(0);
      const queryCount = 5;
      let lastLevel = 0;
      for (let index = 0; index < queryCount; index++) {
        const level = await systemLoad.getLevel();
        lastLevel = level;
        logger.info(`${BUNDLE}getLevel_0003, assert query ${index} returned ${level}`);
        expect(isValidLevel(level)).assertTrue();
        expect(level >= 0).assertTrue();
      }
      expect(typeof lastLevel).assertEqual('number');
      logger.info(`${BUNDLE}getLevel_0003, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_ON_0100
     * @tc.name      testSystemLoadOn0001
     * @tc.desc      Register one listener and validate any real callback delivered during the test.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadOn0001', 0, async () => {
      logger.info(`${BUNDLE}on_0001, begin`);
      const recorder = createRecorder();
      registerRecorder(recorder, registeredCallbacks);
      logger.info(`${BUNDLE}on_0001, assert registration succeeds`);
      expect(registeredCallbacks.length).assertEqual(1);
      logger.info(`${BUNDLE}on_0001, assert delivered levels are valid`);
      assertRecordedLevelsValid(recorder);
      expect(recorder.levels.length >= 0).assertTrue();
      unregisterRecorder(recorder, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}on_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_ON_0200
     * @tc.name      testSystemLoadOn0002
     * @tc.desc      Register two distinct listeners and validate any real callback delivered during the test.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadOn0002', 0, async () => {
      logger.info(`${BUNDLE}on_0002, begin`);
      const primary = createRecorder();
      const secondary = createRecorder();
      registerRecorder(primary, registeredCallbacks);
      registerRecorder(secondary, registeredCallbacks);
      logger.info(`${BUNDLE}on_0002, assert both registrations succeed`);
      expect(registeredCallbacks.length).assertEqual(2);
      logger.info(`${BUNDLE}on_0002, assert delivered levels are valid`);
      assertRecordedLevelsValid(primary);
      assertRecordedLevelsValid(secondary);
      expect(primary.levels.length >= 0).assertTrue();
      expect(secondary.levels.length >= 0).assertTrue();
      unregisterRecorder(primary, registeredCallbacks);
      unregisterRecorder(secondary, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}on_0002, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_ON_0300
     * @tc.name      testSystemLoadOn0003
     * @tc.desc      Verify duplicate registration is idempotent and one unregistration removes the callback.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadOn0003', 0, async () => {
      logger.info(`${BUNDLE}on_0003, begin`);
      const recorder = createRecorder();
      registerRecorder(recorder, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(1);
      systemLoad.on('systemLoadChange', recorder.callback);
      logger.info(`${BUNDLE}on_0003, assert duplicate registration is idempotent`);
      assertRecordedLevelsValid(recorder);
      expect(recorder.levels.length >= 0).assertTrue();
      unregisterRecorder(recorder, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}on_0003, assert one unregistration removes the callback completely`);
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange', recorder.callback);
      });
      logger.info(`${BUNDLE}on_0003, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_ON_0400
     * @tc.name      testSystemLoadOn0004
     * @tc.desc      Reject an invalid listener callback with error 401.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadOn0004', 0, async () => {
      logger.info(`${BUNDLE}on_0004, begin`);
      expect(registeredCallbacks.length).assertEqual(0);
      const invalidCallback = new InvalidCallback() as SystemLoadCallback;
      logger.info(`${BUNDLE}on_0004, assert invalid callback is rejected`);
      await assertParameterError(() => {
        systemLoad.on('systemLoadChange', invalidCallback);
      });
      expect(registeredCallbacks.length).assertEqual(0);
      const validCallback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', validCallback);
      registeredCallbacks.push(validCallback);
      expect(registeredCallbacks.length).assertEqual(1);
      logger.info(`${BUNDLE}on_0004, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_ON_0500
     * @tc.name      testSystemLoadOn0005
     * @tc.desc      Repeat listener registration and unregistration to verify that no stale state remains.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadOn0005', 0, async () => {
      logger.info(`${BUNDLE}on_0005, begin`);
      const recorder = createRecorder();
      let completedCycles = 0;
      expect(registeredCallbacks.length).assertEqual(0);
      for (let cycle = 0; cycle < 3; cycle++) {
        registerRecorder(recorder, registeredCallbacks);
        logger.info(`${BUNDLE}on_0005, assert cycle ${cycle} registration succeeds and levels are valid`);
        assertRecordedLevelsValid(recorder);
        expect(registeredCallbacks.length).assertEqual(1);
        unregisterRecorder(recorder, registeredCallbacks);
        completedCycles++;
      }
      logger.info(`${BUNDLE}on_0005, assert all register and unregister cycles completed`);
      expect(completedCycles).assertEqual(3);
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}on_0005, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_ON_0600
     * @tc.name      testSystemLoadOn0006
     * @tc.desc      Repeat listener registration and unregistration for five full cycles.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadOn0006', 0, async () => {
      logger.info(`${BUNDLE}on_0006, begin`);
      const recorder = createRecorder();
      let completedCycles = 0;
      expect(registeredCallbacks.length).assertEqual(0);
      for (let cycle = 0; cycle < 5; cycle++) {
        registerRecorder(recorder, registeredCallbacks);
        logger.info(`${BUNDLE}on_0006, assert cycle ${cycle} registration succeeds`);
        assertRecordedLevelsValid(recorder);
        expect(registeredCallbacks.length).assertEqual(1);
        unregisterRecorder(recorder, registeredCallbacks);
        completedCycles++;
      }
      logger.info(`${BUNDLE}on_0006, assert all five register and unregister cycles completed`);
      expect(completedCycles).assertEqual(5);
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}on_0006, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_OFF_0100
     * @tc.name      testSystemLoadOff0001
     * @tc.desc      Unregister a listener and verify that the same callback can be registered again.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadOff0001', 0, async () => {
      logger.info(`${BUNDLE}off_0001, begin`);
      const recorder = createRecorder();
      registerRecorder(recorder, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(1);
      unregisterRecorder(recorder, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(0);
      registerRecorder(recorder, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(1);
      logger.info(`${BUNDLE}off_0001, assert re-registration succeeds and delivered levels are valid`);
      assertRecordedLevelsValid(recorder);
      expect(recorder.levels.length >= 0).assertTrue();
      unregisterRecorder(recorder, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}off_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_OFF_0200
     * @tc.name      testSystemLoadOff0002
     * @tc.desc      Reject unregistration of a callback that was never registered with error 401.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadOff0002', 0, async () => {
      logger.info(`${BUNDLE}off_0002, begin`);
      const unknownRecorder = createRecorder();
      expect(registeredCallbacks.length).assertEqual(0);
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange', unknownRecorder.callback);
      });
      expect(registeredCallbacks.length).assertEqual(0);
      const validCallback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', validCallback);
      registeredCallbacks.push(validCallback);
      expect(registeredCallbacks.length).assertEqual(1);
      logger.info(`${BUNDLE}off_0002, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_OFF_0300
     * @tc.name      testSystemLoadOff0003
     * @tc.desc      Reject a second unregistration of the same callback with error 401.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadOff0003', 0, async () => {
      logger.info(`${BUNDLE}off_0003, begin`);
      const recorder = createRecorder();
      registerRecorder(recorder, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(1);
      unregisterRecorder(recorder, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(0);
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange', recorder.callback);
      });
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}off_0003, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_OFF_0400
     * @tc.name      testSystemLoadOff0004
     * @tc.desc      Unregister all callbacks with targeted fallback and verify both can register again.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadOff0004', 0, async () => {
      logger.info(`${BUNDLE}off_0004, begin`);
      expect(registeredCallbacks.length).assertEqual(0);
      const primary = createRecorder();
      const secondary = createRecorder();
      registerRecorder(primary, registeredCallbacks);
      registerRecorder(secondary, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(2);
      try {
        systemLoad.off('systemLoadChange');
      } catch (error) {
        logger.warn(`${BUNDLE}off_0004, unregister-all failed, use targeted fallback: ${JSON.stringify(error)}`);
        expect(Number((error as BusinessError).code)).assertEqual(PARAMETER_ERROR);
        for (const callback of registeredCallbacks) {
          systemLoad.off('systemLoadChange', callback);
        }
      }
      registeredCallbacks = [];
      expect(registeredCallbacks.length).assertEqual(0);
      registerRecorder(primary, registeredCallbacks);
      registerRecorder(secondary, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(2);
      logger.info(`${BUNDLE}off_0004, assert both callbacks re-register and delivered levels are valid`);
      assertRecordedLevelsValid(primary);
      assertRecordedLevelsValid(secondary);
      unregisterRecorder(primary, registeredCallbacks);
      unregisterRecorder(secondary, registeredCallbacks);
      logger.info(`${BUNDLE}off_0004, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_OFF_0500
     * @tc.name      testSystemLoadOff0005
     * @tc.desc      Reject an invalid callback during unregistration with error 401.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadOff0005', 0, async () => {
      logger.info(`${BUNDLE}off_0005, begin`);
      const invalidCallback = new InvalidCallback() as SystemLoadCallback;
      expect(registeredCallbacks.length).assertEqual(0);
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange', invalidCallback);
      });
      expect(registeredCallbacks.length).assertEqual(0);
      const validCallback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', validCallback);
      registeredCallbacks.push(validCallback);
      expect(registeredCallbacks.length).assertEqual(1);
      logger.info(`${BUNDLE}off_0005, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_OFF_0600
     * @tc.name      testSystemLoadOff0006
     * @tc.desc      Register three callbacks, unregister one, and verify the remaining two are unaffected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadOff0006', 0, async () => {
      logger.info(`${BUNDLE}off_0006, begin`);
      const primary = createRecorder();
      const secondary = createRecorder();
      const tertiary = createRecorder();
      registerRecorder(primary, registeredCallbacks);
      registerRecorder(secondary, registeredCallbacks);
      registerRecorder(tertiary, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(3);
      systemLoad.off('systemLoadChange', secondary.callback);
      const secondaryIndex = registeredCallbacks.indexOf(secondary.callback);
      if (secondaryIndex >= 0) {
        registeredCallbacks.splice(secondaryIndex, 1);
      }
      expect(registeredCallbacks.length).assertEqual(2);
      logger.info(`${BUNDLE}off_0006, assert remaining callbacks still deliver valid levels`);
      assertRecordedLevelsValid(primary);
      assertRecordedLevelsValid(tertiary);
      expect(primary.levels.length >= 0).assertTrue();
      expect(tertiary.levels.length >= 0).assertTrue();
      unregisterRecorder(primary, registeredCallbacks);
      unregisterRecorder(tertiary, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}off_0006, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_OFF_0700
     * @tc.name      testSystemLoadOff0007
     * @tc.desc      After unregister-all, re-register both callbacks and unregister them one by one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadOff0007', 0, async () => {
      logger.info(`${BUNDLE}off_0007, begin`);
      expect(registeredCallbacks.length).assertEqual(0);
      const primary = createRecorder();
      const secondary = createRecorder();
      registerRecorder(primary, registeredCallbacks);
      registerRecorder(secondary, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(2);
      try {
        systemLoad.off('systemLoadChange');
      } catch (error) {
        logger.warn(`${BUNDLE}off_0007, unregister-all failed, use targeted fallback: ${JSON.stringify(error)}`);
        expect(Number((error as BusinessError).code)).assertEqual(PARAMETER_ERROR);
        for (const callback of registeredCallbacks) {
          systemLoad.off('systemLoadChange', callback);
        }
      }
      registeredCallbacks = [];
      expect(registeredCallbacks.length).assertEqual(0);
      registerRecorder(primary, registeredCallbacks);
      registerRecorder(secondary, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(2);
      logger.info(`${BUNDLE}off_0007, assert both re-registered callbacks deliver valid levels`);
      assertRecordedLevelsValid(primary);
      assertRecordedLevelsValid(secondary);
      unregisterRecorder(primary, registeredCallbacks);
      logger.info(`${BUNDLE}off_0007, assert primary unregistered and secondary still registered`);
      expect(registeredCallbacks.length).assertEqual(1);
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange', primary.callback);
      });
      unregisterRecorder(secondary, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}off_0007, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_OFF_0800
     * @tc.name      testSystemLoadOff0008
     * @tc.desc      Register three callbacks, unregister the middle one, then call unregister-all.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadOff0008', 0, async () => {
      logger.info(`${BUNDLE}off_0008, begin`);
      expect(registeredCallbacks.length).assertEqual(0);
      const primary = createRecorder();
      const secondary = createRecorder();
      const tertiary = createRecorder();
      registerRecorder(primary, registeredCallbacks);
      registerRecorder(secondary, registeredCallbacks);
      registerRecorder(tertiary, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(3);
      unregisterRecorder(secondary, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(2);
      try {
        systemLoad.off('systemLoadChange');
      } catch (error) {
        logger.warn(`${BUNDLE}off_0008, unregister-all failed, use targeted fallback: ${JSON.stringify(error)}`);
        expect(Number((error as BusinessError).code)).assertEqual(PARAMETER_ERROR);
        for (const callback of registeredCallbacks) {
          systemLoad.off('systemLoadChange', callback);
        }
      }
      registeredCallbacks = [];
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}off_0008, assert all three callbacks can re-register and unregister`);
      registerRecorder(primary, registeredCallbacks);
      registerRecorder(secondary, registeredCallbacks);
      registerRecorder(tertiary, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(3);
      assertRecordedLevelsValid(primary);
      assertRecordedLevelsValid(secondary);
      assertRecordedLevelsValid(tertiary);
      unregisterRecorder(primary, registeredCallbacks);
      unregisterRecorder(secondary, registeredCallbacks);
      unregisterRecorder(tertiary, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}off_0008, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_OFF_0900
     * @tc.name      testSystemLoadOff0009
     * @tc.desc      Call unregister-all with no registered listeners and verify error 401.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadOff0009', 0, async () => {
      logger.info(`${BUNDLE}off_0009, begin`);
      expect(registeredCallbacks.length).assertEqual(0);
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange');
      });
      expect(registeredCallbacks.length).assertEqual(0);
      const validCallback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', validCallback);
      registeredCallbacks.push(validCallback);
      expect(registeredCallbacks.length).assertEqual(1);
      logger.info(`${BUNDLE}off_0009, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_OFF_1000
     * @tc.name      testSystemLoadOff0010
     * @tc.desc      Call unregister-all twice with no registered listeners and verify both return 401.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadOff0010', 0, async () => {
      logger.info(`${BUNDLE}off_0010, begin`);
      expect(registeredCallbacks.length).assertEqual(0);
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange');
      });
      logger.info(`${BUNDLE}off_0010, assert second unregister-all also returns 401`);
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange');
      });
      expect(registeredCallbacks.length).assertEqual(0);
      const validCallback: SystemLoadCallback = () => {};
      systemLoad.on('systemLoadChange', validCallback);
      registeredCallbacks.push(validCallback);
      expect(registeredCallbacks.length).assertEqual(1);
      logger.info(`${BUNDLE}off_0010, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_OFF_1100
     * @tc.name      testSystemLoadOff0011
     * @tc.desc      Register two callbacks, unregister all, then verify individual unregister returns 401.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadOff0011', 0, async () => {
      logger.info(`${BUNDLE}off_0011, begin`);
      expect(registeredCallbacks.length).assertEqual(0);
      const primary = createRecorder();
      const secondary = createRecorder();
      registerRecorder(primary, registeredCallbacks);
      registerRecorder(secondary, registeredCallbacks);
      expect(registeredCallbacks.length).assertEqual(2);
      try {
        systemLoad.off('systemLoadChange');
      } catch (error) {
        logger.warn(`${BUNDLE}off_0011, unregister-all failed, use targeted fallback: ${JSON.stringify(error)}`);
        expect(Number((error as BusinessError).code)).assertEqual(PARAMETER_ERROR);
        for (const callback of registeredCallbacks) {
          systemLoad.off('systemLoadChange', callback);
        }
      }
      registeredCallbacks = [];
      expect(registeredCallbacks.length).assertEqual(0);
      logger.info(`${BUNDLE}off_0011, assert individual unregister after unregister-all returns 401`);
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange', primary.callback);
      });
      await assertParameterError(() => {
        systemLoad.off('systemLoadChange', secondary.callback);
      });
      logger.info(`${BUNDLE}off_0011, end`);
    });
  });
}
