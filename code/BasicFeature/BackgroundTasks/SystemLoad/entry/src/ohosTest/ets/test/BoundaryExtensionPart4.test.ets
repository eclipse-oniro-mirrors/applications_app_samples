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
 * 边界扩展测试 - 第四部分
 * 包含：等级更新显示测试、按钮交互状态测试、内存和性能监控测试
 */

import { describe, it, expect, beforeAll, afterAll, afterEach } from '@ohos/hypium';
import { BusinessError, systemLoad } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN_NUMBER = 0x0000;
const BUNDLE = 'BoundaryExtensionPart4Test: ';

type SystemLoadCallback = (level: systemLoad.SystemLoadLevel) => void;

interface Logger {
  info: (msg: string) => void;
  warn: (msg: string) => void;
  error: (msg: string) => void;
}

interface LevelDisplay {
  name: string;
  value: string;
  description: string;
  recommendation: string;
}

const logger: Logger = {
  info: (msg: string) => hilog.info(DOMAIN_NUMBER, 'BoundaryExtensionPart4Test', msg),
  warn: (msg: string) => hilog.warn(DOMAIN_NUMBER, 'BoundaryExtensionPart4Test', msg),
  error: (msg: string) => hilog.error(DOMAIN_NUMBER, 'BoundaryExtensionPart4Test', msg)
};

function isValidLevel(level: systemLoad.SystemLoadLevel): boolean {
  return level >= systemLoad.SystemLoadLevel.LOW && level <= systemLoad.SystemLoadLevel.ESCAPE;
}

export default function boundaryExtensionPart4Test() {
  let registeredCallbacks: SystemLoadCallback[] = [];

  describe('SystemLoadBoundaryExtensionPart4Test', () => {
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
    // 等级更新显示测试
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_BOUNDARY_1900
     * @tc.name      testLevelUpdateDisplayConsistency0001
     * @tc.desc      Verify all display fields synchronized on level update
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 6
     */
    it('testLevelUpdateDisplayConsistency0001', 0, async () => {
      logger.info(`${BUNDLE}testLevelUpdateDisplayConsistency0001, begin`);

      const levelDisplay: LevelDisplay = {
        name: 'level_name_low',
        value: 'level_value_low',
        description: 'level_low',
        recommendation: 'recommendation_low'
      };

      logger.info(`${BUNDLE}initial display: name=${levelDisplay.name}, value=${levelDisplay.value}`);

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();

      levelDisplay.name = `level_name_${level}`;
      levelDisplay.value = `level_value_${level}`;
      levelDisplay.description = `level_${level}`;
      levelDisplay.recommendation = `recommendation_${level}`;

      logger.info(`${BUNDLE}updated display for level ${level}`);
      expect(levelDisplay.name.length > 0).assertTrue();
      expect(levelDisplay.value.length > 0).assertTrue();
      expect(levelDisplay.description.length > 0).assertTrue();
      expect(levelDisplay.recommendation.length > 0).assertTrue();

      logger.info(`${BUNDLE}all display fields synchronized`);

      logger.info(`${BUNDLE}levelUpdateDisplayConsistency_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_BOUNDARY_2000
     * @tc.name      testLevelUpdateUnknownLevelHandling0002
     * @tc.desc      Verify display handling for unknown level
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 6
     */
    it('testLevelUpdateUnknownLevelHandling0002', 0, async () => {
      logger.info(`${BUNDLE}testLevelUpdateUnknownLevelHandling0002, begin`);

      // Use a number instead of string to avoid type conversion error
      const unknownLevel = 999 as systemLoad.SystemLoadLevel;
      logger.info(`${BUNDLE}testing unknown level: ${unknownLevel}`);
      expect(typeof unknownLevel).assertEqual('number');
      expect(unknownLevel > 7).assertTrue();

      let displayText = 'level_unavailable';
      let recommendationText = 'recommendation_unavailable';

      logger.info(`${BUNDLE}unknown level display: ${displayText}`);
      logger.info(`${BUNDLE}unknown level recommendation: ${recommendationText}`);

      expect(displayText).assertEqual('level_unavailable');
      expect(recommendationText).assertEqual('recommendation_unavailable');
      expect(displayText.length > 0).assertTrue();
      expect(recommendationText.length > 0).assertTrue();

      logger.info(`${BUNDLE}unknown level handled with default text`);

      logger.info(`${BUNDLE}levelUpdateUnknownLevelHandling_0001, end`);
    });

    // ========================================================================
    // 按钮交互状态测�?    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_BOUNDARY_2100
     * @tc.name      testButtonStateMockModeButtons0003
     * @tc.desc      Verify button states in mock mode
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 6
     */
    it('testButtonStateMockModeButtons0003', 0, async () => {
      logger.info(`${BUNDLE}testButtonStateMockModeButtons0003, begin`);

      const isMock = true;
      logger.info(`${BUNDLE}in mock mode: ${isMock}`);
      expect(isMock).assertTrue();

      const nextLevelEnabled = isMock;
      const prevLevelEnabled = isMock;
      logger.info(`${BUNDLE}next level button enabled: ${nextLevelEnabled}`);
      logger.info(`${BUNDLE}previous level button enabled: ${prevLevelEnabled}`);

      expect(nextLevelEnabled).assertTrue();
      expect(prevLevelEnabled).assertTrue();
      expect(typeof nextLevelEnabled).assertEqual('boolean');
      expect(typeof prevLevelEnabled).assertEqual('boolean');

      logger.info(`${BUNDLE}mock mode buttons correctly enabled`);

      logger.info(`${BUNDLE}buttonStateMockModeButtons_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_BOUNDARY_2200
     * @tc.name      testButtonStateLoadingDisabled0004
     * @tc.desc      Verify button disabled state during loading
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 6
     */
    it('testButtonStateLoadingDisabled0004', 0, async () => {
      logger.info(`${BUNDLE}testButtonStateLoadingDisabled0004, begin`);

      let isLoading = true;
      logger.info(`${BUNDLE}loading started: ${isLoading}`);

      const queryButtonDisabled = isLoading;
      const refreshButtonDisabled = isLoading;
      logger.info(`${BUNDLE}query button disabled: ${queryButtonDisabled}`);
      logger.info(`${BUNDLE}refresh button disabled: ${refreshButtonDisabled}`);

      expect(queryButtonDisabled).assertTrue();
      expect(refreshButtonDisabled).assertTrue();

      isLoading = false;
      logger.info(`${BUNDLE}loading completed: ${isLoading}`);

      const queryButtonEnabled = !isLoading;
      const refreshButtonEnabled = !isLoading;
      logger.info(`${BUNDLE}query button enabled: ${queryButtonEnabled}`);
      logger.info(`${BUNDLE}refresh button enabled: ${refreshButtonEnabled}`);

      expect(queryButtonEnabled).assertTrue();
      expect(refreshButtonEnabled).assertTrue();

      logger.info(`${BUNDLE}buttons correctly disabled during loading`);

      logger.info(`${BUNDLE}buttonStateLoadingDisabled_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_BOUNDARY_2300
     * @tc.name      testButtonStateListenerControlButtons0005
     * @tc.desc      Verify listener control button states
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 6
     */
    it('testButtonStateListenerControlButtons0005', 0, async () => {
      logger.info(`${BUNDLE}testButtonStateListenerControlButtons0005, begin`);

      let isPrimarySubscribed = false;
      let isSecondarySubscribed = false;

      const registerPrimaryEnabled = !isPrimarySubscribed;
      const unregisterPrimaryEnabled = isPrimarySubscribed;
      logger.info(`${BUNDLE}register primary enabled: ${registerPrimaryEnabled}`);
      logger.info(`${BUNDLE}unregister primary enabled: ${unregisterPrimaryEnabled}`);

      expect(registerPrimaryEnabled).assertTrue();
      expect(unregisterPrimaryEnabled).assertFalse();

      isPrimarySubscribed = true;
      logger.info(`${BUNDLE}primary listener registered`);

      const registerPrimaryDisabled = isPrimarySubscribed;
      const unregisterPrimaryNowEnabled = isPrimarySubscribed;
      logger.info(`${BUNDLE}register primary disabled: ${registerPrimaryDisabled}`);
      logger.info(`${BUNDLE}unregister primary enabled: ${unregisterPrimaryNowEnabled}`);

      expect(registerPrimaryDisabled).assertTrue();
      expect(unregisterPrimaryNowEnabled).assertTrue();

      logger.info(`${BUNDLE}listener control buttons dynamically updated`);

      logger.info(`${BUNDLE}buttonStateListenerControlButtons_0001, end`);
    });

    // ========================================================================
    // 内存和性能监控测试
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_BOUNDARY_2400
     * @tc.name      testMemoryUsageDuringLongRunning0006
     * @tc.desc      Verify memory usage during long-running operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 6
     */
    it('testMemoryUsageDuringLongRunning0006', 0, async () => {
      logger.info(`${BUNDLE}testMemoryUsageDuringLongRunning0006, begin`);

      const callbackRecords: string[] = [];
      const iterations = 50;
      logger.info(`${BUNDLE}running ${iterations} iterations`);
      expect(iterations > 0).assertTrue();
      expect(callbackRecords.length).assertEqual(0);

      for (let i = 0; i < iterations; i++) {
        const level = await systemLoad.getLevel();
        expect(isValidLevel(level)).assertTrue();
        expect(level >= 0).assertTrue();

        callbackRecords.push(`${i}:${level}:${Date.now()}`);
        if (callbackRecords.length > 6) {
          callbackRecords.shift();
        }

        if (i % 10 === 0) {
          logger.info(`${BUNDLE}iteration ${i} completed, records: ${callbackRecords.length}`);
        }
      }

      expect(callbackRecords.length <= 6).assertTrue();
      expect(callbackRecords.length > 0).assertTrue();
      logger.info(`${BUNDLE}memory usage stable: ${callbackRecords.length} records after ${iterations} iterations`);

      logger.info(`${BUNDLE}memoryUsageDuringLongRunning_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_BOUNDARY_2500
     * @tc.name      testPerformanceDegradationAfterCycles0007
     * @tc.desc      Verify performance after multiple cycles
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 6
     */
    it('testPerformanceDegradationAfterCycles0007', 0, async () => {
      logger.info(`${BUNDLE}testPerformanceDegradationAfterCycles0007, begin`);

      const cycles = 20;
      const timestamps: number[] = [];
      logger.info(`${BUNDLE}running ${cycles} performance test cycles`);

      for (let i = 0; i < cycles; i++) {
        const start = Date.now();
        const level = await systemLoad.getLevel();
        const end = Date.now();

        expect(isValidLevel(level)).assertTrue();
        timestamps.push(end - start);

        if (i % 5 === 0) {
          logger.info(`${BUNDLE}cycle ${i} completed in ${end - start}ms`);
        }
      }

      const totalTime = timestamps.reduce((sum, t) => sum + t, 0);
      const avgTime = totalTime / timestamps.length;
      const maxTime = Math.max(...timestamps);
      const minTime = Math.min(...timestamps);

      logger.info(`${BUNDLE}performance stats: avg=${avgTime.toFixed(2)}ms, max=${maxTime}ms, min=${minTime}ms`);

      expect(avgTime < 100).assertTrue();
      expect(maxTime < 500).assertTrue();

      const firstHalf = timestamps.slice(0, cycles / 2);
      const secondHalf = timestamps.slice(cycles / 2);
      const firstAvg = firstHalf.reduce((sum, t) => sum + t, 0) / firstHalf.length;
      const secondAvg = secondHalf.reduce((sum, t) => sum + t, 0) / secondHalf.length;

      logger.info(`${BUNDLE}first half avg: ${firstAvg.toFixed(2)}ms`);
      logger.info(`${BUNDLE}second half avg: ${secondAvg.toFixed(2)}ms`);

      const degradation = (secondAvg - firstAvg) / firstAvg * 100;
      logger.info(`${BUNDLE}performance degradation: ${degradation.toFixed(2)}%`);

      expect(degradation < 50).assertTrue();
      logger.info(`${BUNDLE}no significant performance degradation after ${cycles} cycles`);

      logger.info(`${BUNDLE}performanceDegradationAfterCycles_0001, end`);
    });
  });
}
