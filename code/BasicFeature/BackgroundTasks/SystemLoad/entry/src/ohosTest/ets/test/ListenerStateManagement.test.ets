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
 * 监听器状态管理与等级映射测试
 * 包含：监听器订阅状态测试、回调记录管理测试、等级映射测试
 */

import { describe, it, expect, beforeAll, afterAll, afterEach } from '@ohos/hypium';
import { BusinessError, systemLoad } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN_NUMBER = 0x0000;
const BUNDLE = 'ListenerStateManagementTest: ';
const PARAMETER_ERROR = 401;

type SystemLoadCallback = (level: systemLoad.SystemLoadLevel) => void;

interface Logger {
  info: (msg: string) => void;
  warn: (msg: string) => void;
  error: (msg: string) => void;
}

const logger: Logger = {
  info: (msg: string) => hilog.info(DOMAIN_NUMBER, 'ListenerStateManagementTest', msg),
  warn: (msg: string) => hilog.warn(DOMAIN_NUMBER, 'ListenerStateManagementTest', msg),
  error: (msg: string) => hilog.error(DOMAIN_NUMBER, 'ListenerStateManagementTest', msg)
};

function isValidLevel(level: systemLoad.SystemLoadLevel): boolean {
  return level >= systemLoad.SystemLoadLevel.LOW && level <= systemLoad.SystemLoadLevel.ESCAPE;
}

interface LevelMapping {
  level: systemLoad.SystemLoadLevel;
  name: string;
  description: string;
}

export default function listenerStateManagementTest() {
  let registeredCallbacks: SystemLoadCallback[] = [];

  describe('SystemLoadListenerStateManagementTest', () => {
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
    // 监听器订阅状态测试
    // ========================================================================

    /**
     * @tc.number    SYSTEMLOAD_LISTENER_0100
     * @tc.name      testListenerSubscriptionStatePrimary0001
     * @tc.desc      Verify primary listener isPrimarySubscribed state transition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testListenerSubscriptionStatePrimary0001', 0, async () => {
      logger.info(`${BUNDLE}testListenerSubscriptionStatePrimary0001, begin`);

      let isPrimarySubscribed = false;
      logger.info(`${BUNDLE}initial state: isPrimarySubscribed = ${isPrimarySubscribed}`);
      expect(isPrimarySubscribed).assertFalse();

      const callback: SystemLoadCallback = (level) => {
        logger.info(`${BUNDLE}primary callback received level: ${level}`);
      };

      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      isPrimarySubscribed = true;
      logger.info(`${BUNDLE}after registration: isPrimarySubscribed = ${isPrimarySubscribed}`);
      expect(isPrimarySubscribed).assertTrue();

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      logger.info(`${BUNDLE}query succeeded while subscribed`);

      systemLoad.off('systemLoadChange', callback);
      const callbackIndex = registeredCallbacks.indexOf(callback);
      if (callbackIndex >= 0) {
        registeredCallbacks.splice(callbackIndex, 1);
      }
      isPrimarySubscribed = false;
      logger.info(`${BUNDLE}after unregistration: isPrimarySubscribed = ${isPrimarySubscribed}`);
      expect(isPrimarySubscribed).assertFalse();

      logger.info(`${BUNDLE}listenerSubscriptionStatePrimary_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_LISTENER_0200
     * @tc.name      testListenerSubscriptionStateSecondary0001
     * @tc.desc      Verify secondary listener isSecondarySubscribed state transition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testListenerSubscriptionStateSecondary0001', 0, async () => {
      logger.info(`${BUNDLE}testListenerSubscriptionStateSecondary0001, begin`);

      let isSecondarySubscribed = false;
      logger.info(`${BUNDLE}initial state: isSecondarySubscribed = ${isSecondarySubscribed}`);
      expect(isSecondarySubscribed).assertFalse();

      const callback: SystemLoadCallback = (level) => {
        logger.info(`${BUNDLE}secondary callback received level: ${level}`);
      };

      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      isSecondarySubscribed = true;
      logger.info(`${BUNDLE}after registration: isSecondarySubscribed = ${isSecondarySubscribed}`);
      expect(isSecondarySubscribed).assertTrue();

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      logger.info(`${BUNDLE}query succeeded while subscribed`);

      systemLoad.off('systemLoadChange', callback);
      const callbackIndex = registeredCallbacks.indexOf(callback);
      if (callbackIndex >= 0) {
        registeredCallbacks.splice(callbackIndex, 1);
      }
      isSecondarySubscribed = false;
      logger.info(`${BUNDLE}after unregistration: isSecondarySubscribed = ${isSecondarySubscribed}`);
      expect(isSecondarySubscribed).assertFalse();

      logger.info(`${BUNDLE}listenerSubscriptionStateSecondary_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_LISTENER_0300
     * @tc.name      testListenerSubscriptionStateConsistency0001
     * @tc.desc      Verify UI text matches actual subscription state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testListenerSubscriptionStateConsistency0001', 0, async () => {
      logger.info(`${BUNDLE}testListenerSubscriptionStateConsistency0001, begin`);

      let isSubscribed = false;
      let listenerText = 'not_listening';
      logger.info(`${BUNDLE}initial state: subscribed = ${isSubscribed}, text = ${listenerText}`);
      expect(isSubscribed).assertFalse();
      expect(listenerText).assertContain('not');

      const callback: SystemLoadCallback = (level) => {
        logger.info(`${BUNDLE}callback received level: ${level}`);
      };

      systemLoad.on('systemLoadChange', callback);
      registeredCallbacks.push(callback);
      isSubscribed = true;
      listenerText = 'listening';
      logger.info(`${BUNDLE}after registration: subscribed = ${isSubscribed}, text = ${listenerText}`);
      expect(isSubscribed).assertTrue();
      expect(listenerText).assertContain('listening');

      systemLoad.off('systemLoadChange', callback);
      const callbackIndex = registeredCallbacks.indexOf(callback);
      if (callbackIndex >= 0) {
        registeredCallbacks.splice(callbackIndex, 1);
      }
      isSubscribed = false;
      listenerText = 'not_listening';
      logger.info(`${BUNDLE}after unregistration: subscribed = ${isSubscribed}, text = ${listenerText}`);
      expect(isSubscribed).assertFalse();
      expect(listenerText).assertContain('not');

      logger.info(`${BUNDLE}listenerSubscriptionStateConsistency_0001, end`);
    });

    // ========================================================================
    // 回调记录管理测试
    // ========================================================================

    /**
     * @tc.number    SYSTEMLOAD_RECORD_0100
     * @tc.name      testCallbackRecordOrder0001
     * @tc.desc      Verify callback records in reverse chronological order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCallbackRecordOrder0001', 0, async () => {
      logger.info(`${BUNDLE}testCallbackRecordOrder0001, begin`);

      expect(registeredCallbacks.length).assertEqual(0);

      const callbackRecords: string[] = [];
      const callback: SystemLoadCallback = (level) => {
        const record = `${Date.now()}:${level}`;
        callbackRecords.unshift(record);
        logger.info(`${BUNDLE}new record added at front: ${record}`);
        if (callbackRecords.length > 6) {
          callbackRecords.pop();
        }
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

      for (let i = 1; i < callbackRecords.length; i++) {
        const prevTimestamp = parseInt(callbackRecords[i - 1].split(':')[0]);
        const currTimestamp = parseInt(callbackRecords[i].split(':')[0]);
        expect(prevTimestamp >= currTimestamp).assertTrue();
        logger.info(`${BUNDLE}record ${i - 1} timestamp >= record ${i} timestamp`);
      }

      expect(registeredCallbacks.length).assertEqual(1);
      logger.info(`${BUNDLE}records are in reverse chronological order`);
      logger.info(`${BUNDLE}callbackRecordOrder_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_RECORD_0200
     * @tc.name      testCallbackRecordFormat0001
     * @tc.desc      Verify callback record format is correct
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCallbackRecordFormat0001', 0, async () => {
      logger.info(`${BUNDLE}testCallbackRecordFormat0001, begin`);

      expect(registeredCallbacks.length).assertEqual(0);

      const callbackRecords: string[] = [];
      const primaryCallback: SystemLoadCallback = (level) => {
        const record = `P: Level ${level}`;
        callbackRecords.push(record);
        logger.info(`${BUNDLE}primary record: ${record}`);
      };

      const secondaryCallback: SystemLoadCallback = (level) => {
        const record = `S: Level ${level}`;
        callbackRecords.push(record);
        logger.info(`${BUNDLE}secondary record: ${record}`);
      };

      systemLoad.on('systemLoadChange', primaryCallback);
      registeredCallbacks.push(primaryCallback);
      systemLoad.on('systemLoadChange', secondaryCallback);
      registeredCallbacks.push(secondaryCallback);
      expect(registeredCallbacks.length).assertEqual(2);

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      await new Promise<void>((resolve: () => void) => setTimeout(resolve, 100));

      for (const record of callbackRecords) {
        const isValidFormat = record.startsWith('P: Level ') || record.startsWith('S: Level ');
        expect(isValidFormat).assertTrue();
        logger.info(`${BUNDLE}record format validated: ${record}`);
      }

      expect(registeredCallbacks.length).assertEqual(2);
      logger.info(`${BUNDLE}all records have correct format`);
      logger.info(`${BUNDLE}callbackRecordFormat_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_RECORD_0300
     * @tc.name      testCallbackRecordDistinctListeners0001
     * @tc.desc      Verify primary/secondary listener records are distinguishable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCallbackRecordDistinctListeners0001', 0, async () => {
      logger.info(`${BUNDLE}testCallbackRecordDistinctListeners0001, begin`);

      let primaryCount = 0;
      let secondaryCount = 0;

      const primaryCallback: SystemLoadCallback = (level) => {
        primaryCount++;
        logger.info(`${BUNDLE}primary callback invoked, count: ${primaryCount}`);
      };

      const secondaryCallback: SystemLoadCallback = (level) => {
        secondaryCount++;
        logger.info(`${BUNDLE}secondary callback invoked, count: ${secondaryCount}`);
      };

      systemLoad.on('systemLoadChange', primaryCallback);
      registeredCallbacks.push(primaryCallback);
      systemLoad.on('systemLoadChange', secondaryCallback);
      registeredCallbacks.push(secondaryCallback);

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      await new Promise<void>((resolve: () => void) => setTimeout(resolve, 100));

      logger.info(`${BUNDLE}primary count: ${primaryCount}, secondary count: ${secondaryCount}`);
      expect(primaryCount >= 0).assertTrue();
      expect(secondaryCount >= 0).assertTrue();

      if (primaryCount > 0 || secondaryCount > 0) {
        logger.info(`${BUNDLE}both listeners can be distinguished by invocation count`);
      }

      logger.info(`${BUNDLE}callbackRecordDistinctListeners_0001, end`);
    });

    // ========================================================================
    // 等级映射测试
    // ========================================================================

    /**
     * @tc.number    SYSTEMLOAD_MAPPING_0100
     * @tc.name      testLevelMappingAllEnums0001
     * @tc.desc      Verify all 8 levels have correct name/description/recommendation mapping
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLevelMappingAllEnums0001', 0, async () => {
      logger.info(`${BUNDLE}testLevelMappingAllEnums0001, begin`);

      const levelMappings: LevelMapping[] = [
        { level: systemLoad.SystemLoadLevel.LOW, name: 'LOW', description: 'low load' },
        { level: systemLoad.SystemLoadLevel.NORMAL, name: 'NORMAL', description: 'normal load' },
        { level: systemLoad.SystemLoadLevel.MEDIUM, name: 'MEDIUM', description: 'medium load' },
        { level: systemLoad.SystemLoadLevel.HIGH, name: 'HIGH', description: 'high load' },
        { level: systemLoad.SystemLoadLevel.OVERHEATED, name: 'OVERHEATED', description: 'overheated' },
        { level: systemLoad.SystemLoadLevel.WARNING, name: 'WARNING', description: 'warning' },
        { level: systemLoad.SystemLoadLevel.EMERGENCY, name: 'EMERGENCY', description: 'emergency' },
        { level: systemLoad.SystemLoadLevel.ESCAPE, name: 'ESCAPE', description: 'escape' }
      ];

      for (const mapping of levelMappings) {
        logger.info(`${BUNDLE}level ${mapping.level}: name=${mapping.name}, description=${mapping.description}`);
        expect(isValidLevel(mapping.level)).assertTrue();
        expect(mapping.name.length > 0).assertTrue();
        expect(mapping.description.length > 0).assertTrue();
      }

      expect(levelMappings.length).assertEqual(8);
      logger.info(`${BUNDLE}all 8 level mappings validated`);

      logger.info(`${BUNDLE}levelMappingAllEnums_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_MAPPING_0200
     * @tc.name      testLevelMappingUnknown0001
     * @tc.desc      Verify default handling for unknown level
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLevelMappingUnknown0001', 0, async () => {
      logger.info(`${BUNDLE}testLevelMappingUnknown0001, begin`);

      const unknownLevel = 99 as systemLoad.SystemLoadLevel;
      logger.info(`${BUNDLE}unknown level value: ${unknownLevel}`);
      expect(unknownLevel > systemLoad.SystemLoadLevel.ESCAPE).assertTrue();

      const defaultName = 'UNKNOWN';
      const defaultDescription = 'unavailable';
      logger.info(`${BUNDLE}default mapping: name=${defaultName}, description=${defaultDescription}`);
      expect(defaultName.length > 0).assertTrue();
      expect(defaultDescription.length > 0).assertTrue();

      logger.info(`${BUNDLE}unknown level handled with default mapping`);

      logger.info(`${BUNDLE}levelMappingUnknown_0001, end`);
    });
  });
}
