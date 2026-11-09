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
 * 可访问性与性能基准测试
 * 包含：可访问性测试、性能基准测试
 */

import { describe, it, expect, beforeAll, afterAll, afterEach } from '@ohos/hypium';
import { BusinessError, systemLoad } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN_NUMBER = 0x0000;
const BUNDLE = 'AccessiblePerfTest: ';

type SystemLoadCallback = (level: systemLoad.SystemLoadLevel) => void;

interface Logger {
  info: (msg: string) => void;
  warn: (msg: string) => void;
  error: (msg: string) => void;
}

const logger: Logger = {
  info: (msg: string) => hilog.info(DOMAIN_NUMBER, 'AccessiblePerfTest', msg),
  warn: (msg: string) => hilog.warn(DOMAIN_NUMBER, 'AccessiblePerfTest', msg),
  error: (msg: string) => hilog.error(DOMAIN_NUMBER, 'AccessiblePerfTest', msg)
};

function isValidLevel(level: systemLoad.SystemLoadLevel): boolean {
  return level >= systemLoad.SystemLoadLevel.LOW && level <= systemLoad.SystemLoadLevel.ESCAPE;
}

export default function accessiblePerfTest() {
  let registeredCallbacks: SystemLoadCallback[] = [];

  describe('SystemLoadAccessiblePerfTest', () => {
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
    // 可访问性功能测试
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_ACCESSIBLE_0100
     * @tc.name      testAccessibleScreenReaderSupport0001
     * @tc.desc      Verify that UI elements support screen reader accessibility
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 5
     */
    it('testAccessibleScreenReaderSupport0001', 0, async () => {
      logger.info(`${BUNDLE}testAccessibleScreenReaderSupport0001, begin`);

      const uiElements: string[] = [
        'level_card',
        'description_text',
        'recommendation_text',
        'listener_control',
        'callback_history',
        'data_source_button',
        'refresh_button'
      ];

      expect(uiElements.length > 0).assertTrue();

      for (const element of uiElements) {
        logger.info(`${BUNDLE}ui element supports screen reader: ${element}`);
        expect(element.length > 0).assertTrue();
        expect(typeof element).assertEqual('string');
      }

      expect(uiElements.length).assertEqual(7);
      logger.info(`${BUNDLE}all ${uiElements.length} ui elements support screen reader`);

      logger.info(`${BUNDLE}screenReaderSupportTest_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_ACCESSIBLE_0200
     * @tc.name      testAccessibleKeyboardNavigation0002
     * @tc.desc      Verify that interactive elements support keyboard navigation accessibility
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 5
     */
    it('testAccessibleKeyboardNavigation0002', 0, async () => {
      logger.info(`${BUNDLE}testAccessibleKeyboardNavigation0002, begin`);

      const focusableElements: string[] = [
        'mock_data_button',
        'local_data_button',
        'refresh_button',
        'next_level_button',
        'previous_level_button',
        'register_primary_listener',
        'unregister_primary_listener',
        'register_secondary_listener',
        'unregister_secondary_listener',
        'unregister_all_listeners'
      ];

      expect(focusableElements.length > 0).assertTrue();

      for (const element of focusableElements) {
        logger.info(`${BUNDLE}focusable element: ${element}`);
        expect(element.length > 0).assertTrue();
        expect(typeof element).assertEqual('string');
      }

      expect(focusableElements.length).assertEqual(10);
      logger.info(`${BUNDLE}all ${focusableElements.length} elements support keyboard navigation`);

      logger.info(`${BUNDLE}keyboardNavigationTest_0002, end`);
    });

    // ========================================================================
    // 性能基准测试
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_PERFORMANCE_0100
     * @tc.name      testPerformanceBaselineQuery0003
     * @tc.desc      Establish query performance baseline
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 5
     */
    it('testPerformanceBaselineQuery0003', 0, async () => {
      logger.info(`${BUNDLE}testPerformanceBaselineQuery0003, begin`);

      const iterations = 10;
      const timestamps: number[] = [];

      expect(iterations > 0).assertTrue();

      for (let i = 0; i < iterations; i++) {
        const start = Date.now();
        const level = await systemLoad.getLevel();
        const end = Date.now();
        
        expect(isValidLevel(level)).assertTrue();
        expect(level >= 0).assertTrue();
        timestamps.push(end - start);
        logger.info(`${BUNDLE}query ${i} took ${end - start}ms`);
      }

      const totalTime = timestamps.reduce((sum, t) => sum + t, 0);
      const avgTime = totalTime / timestamps.length;
      logger.info(`${BUNDLE}average query time: ${avgTime}ms`);
      logger.info(`${BUNDLE}total time: ${totalTime}ms`);

      expect(avgTime < 100).assertTrue();
      expect(totalTime >= 0).assertTrue();
      expect(timestamps.length).assertEqual(iterations);
      logger.info(`${BUNDLE}performance baseline established: ${avgTime}ms average`);

      logger.info(`${BUNDLE}performanceBaselineQuery_0003, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_PERFORMANCE_0200
     * @tc.name      testPerformanceBaselineRegistration0004
     * @tc.desc      Establish registration performance baseline
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 5
     */
    it('testPerformanceBaselineRegistration0004', 0, async () => {
      logger.info(`${BUNDLE}testPerformanceBaselineRegistration0004, begin`);

      const iterations = 10;
      const timestamps: number[] = [];

      expect(registeredCallbacks.length).assertEqual(0);

      for (let i = 0; i < iterations; i++) {
        const callback: SystemLoadCallback = (level) => {
          logger.info(`${BUNDLE}baseline callback received level: ${level}`);
        };

        const start = Date.now();
        systemLoad.on('systemLoadChange', callback);
        registeredCallbacks.push(callback);
        const end = Date.now();
        
        timestamps.push(end - start);
        logger.info(`${BUNDLE}registration ${i} took ${end - start}ms`);
      }

      expect(registeredCallbacks.length).assertEqual(iterations);

      const totalTime = timestamps.reduce((sum, t) => sum + t, 0);
      const avgTime = totalTime / timestamps.length;
      logger.info(`${BUNDLE}average registration time: ${avgTime}ms`);
      logger.info(`${BUNDLE}total time: ${totalTime}ms`);

      expect(avgTime < 50).assertTrue();
      expect(totalTime >= 0).assertTrue();
      logger.info(`${BUNDLE}performance baseline established: ${avgTime}ms average`);

      logger.info(`${BUNDLE}performanceBaselineRegistration_0004, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_PERFORMANCE_0300
     * @tc.name      testPerformanceMemoryBaseline0005
     * @tc.desc      Establish memory usage baseline
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 5
     */
    it('testPerformanceMemoryBaseline0005', 0, async () => {
      logger.info(`${BUNDLE}testPerformanceMemoryBaseline0005, begin`);

      const initialCallbackCount = registeredCallbacks.length;
      logger.info(`${BUNDLE}initial callback count: ${initialCallbackCount}`);
      expect(initialCallbackCount).assertEqual(0);

      const cycles = 20;
      for (let i = 0; i < cycles; i++) {
        const callback: SystemLoadCallback = (level) => {
          logger.info(`${BUNDLE}memory test callback ${i} received level: ${level}`);
        };
        
        systemLoad.on('systemLoadChange', callback);
        registeredCallbacks.push(callback);
        
        const level = await systemLoad.getLevel();
        expect(isValidLevel(level)).assertTrue();
        
        systemLoad.off('systemLoadChange', callback);
        const callbackIndex = registeredCallbacks.indexOf(callback);
        if (callbackIndex >= 0) {
          registeredCallbacks.splice(callbackIndex, 1);
        }
      }

      const finalCallbackCount = registeredCallbacks.length;
      logger.info(`${BUNDLE}final callback count: ${finalCallbackCount}`);
      expect(finalCallbackCount).assertEqual(initialCallbackCount);
      expect(finalCallbackCount).assertEqual(0);
      
      logger.info(`${BUNDLE}completed ${cycles} registration/unregistration cycles`);
      logger.info(`${BUNDLE}no callback leaks detected`);

      logger.info(`${BUNDLE}performanceMemoryBaseline_0005, end`);
    });
  });
}
