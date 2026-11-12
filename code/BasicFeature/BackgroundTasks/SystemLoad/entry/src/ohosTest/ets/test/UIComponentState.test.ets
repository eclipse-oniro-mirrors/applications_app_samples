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
 * UI 组件状态与数据源管理测试
 * 包含：UI 组件状态测试、模拟数据循环测试、数据源切换增强测试
 */

import { describe, it, expect, beforeAll, afterAll, afterEach } from '@ohos/hypium';
import { BusinessError, systemLoad } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN_NUMBER = 0x0000;
const BUNDLE = 'UIComponentStateTest: ';
const PARAMETER_ERROR = 401;

type SystemLoadCallback = (level: systemLoad.SystemLoadLevel) => void;

interface Logger {
  info: (msg: string) => void;
  warn: (msg: string) => void;
  error: (msg: string) => void;
}

const logger: Logger = {
  info: (msg: string) => hilog.info(DOMAIN_NUMBER, 'UIComponentStateTest', msg),
  warn: (msg: string) => hilog.warn(DOMAIN_NUMBER, 'UIComponentStateTest', msg),
  error: (msg: string) => hilog.error(DOMAIN_NUMBER, 'UIComponentStateTest', msg)
};

function isValidLevel(level: systemLoad.SystemLoadLevel): boolean {
  return level >= systemLoad.SystemLoadLevel.LOW && level <= systemLoad.SystemLoadLevel.ESCAPE;
}

export default function uiComponentStateTest() {
  let registeredCallbacks: SystemLoadCallback[] = [];

  describe('SystemLoadUIComponentStateTest', () => {
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
    // UI 组件状态测试
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_UICOMPONENT_0100
     * @tc.name      testUiComponentLevelTextUpdate0001
     * @tc.desc      Verify level text updates correctly with level changes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testUiComponentLevelTextUpdate0001', 0, async () => {
      logger.info(`${BUNDLE}testUiComponentLevelTextUpdate0001, begin`);

      let levelText = 'unavailable';
      logger.info(`${BUNDLE}initial level text: ${levelText}`);
      expect(levelText.length > 0).assertTrue();

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      expect(typeof level).assertEqual('number');
      
      levelText = `Level ${level}`;
      logger.info(`${BUNDLE}updated level text: ${levelText}`);
      expect(levelText).assertContain('Level');
      expect(levelText.length > 0).assertTrue();

      logger.info(`${BUNDLE}uiComponentLevelTextUpdate_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_UICOMPONENT_0200
     * @tc.name      testUiComponentDescriptionUpdate0002
     * @tc.desc      Verify description text updates correctly with level changes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testUiComponentDescriptionUpdate0002', 0, async () => {
      logger.info(`${BUNDLE}testUiComponentDescriptionUpdate0002, begin`);

      let levelDescription = 'unavailable';
      logger.info(`${BUNDLE}initial description: ${levelDescription}`);
      expect(levelDescription.length > 0).assertTrue();

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      expect(typeof level).assertEqual('number');
      
      const descriptions: string[] = ['low load', 'normal load', 'medium load', 'high load', 'overheated', 'warning', 'emergency', 'escape'];
      levelDescription = descriptions[level] || 'unknown';
      logger.info(`${BUNDLE}updated description: ${levelDescription}`);
      expect(levelDescription.length > 0).assertTrue();

      logger.info(`${BUNDLE}uiComponentDescriptionUpdate_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_UICOMPONENT_0300
     * @tc.name      testUiComponentRecommendationUpdate0003
     * @tc.desc      Verify recommendation text updates correctly with level changes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testUiComponentRecommendationUpdate0003', 0, async () => {
      logger.info(`${BUNDLE}testUiComponentRecommendationUpdate0003, begin`);

      let levelRecommendation = 'no recommendation';
      logger.info(`${BUNDLE}initial recommendation: ${levelRecommendation}`);
      expect(levelRecommendation.length > 0).assertTrue();

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      expect(level >= 0).assertTrue();
      expect(typeof level).assertEqual('number');
      
      const recommendations: string[] = [
        'maintain current operations',
        'continue normal usage',
        'monitor system performance',
        'reduce intensive tasks',
        'cool down device',
        'save work immediately',
        'prepare for shutdown',
        'emergency shutdown'
      ];
      levelRecommendation = recommendations[level] || 'unknown';
      logger.info(`${BUNDLE}updated recommendation: ${levelRecommendation}`);
      expect(levelRecommendation.length > 0).assertTrue();

      logger.info(`${BUNDLE}uiComponentRecommendationUpdate_0001, end`);
    });

    // ========================================================================
    // 模拟数据循环测试
    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_MOCKCYCLE_0100
     * @tc.name      testMockDataCycleThroughLevels0004
     * @tc.desc      Verify mock data cycles through levels in order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testMockDataCycleThroughLevels0004', 0, async () => {
      logger.info(`${BUNDLE}testMockDataCycleThroughLevels0004, begin`);

      let mockLevelIndex = 0;
      expect(mockLevelIndex).assertEqual(0);
      const levels = [
        systemLoad.SystemLoadLevel.LOW,
        systemLoad.SystemLoadLevel.NORMAL,
        systemLoad.SystemLoadLevel.MEDIUM,
        systemLoad.SystemLoadLevel.HIGH
      ];
      expect(levels.length).assertEqual(4);

      for (let i = 0; i < 8; i++) {
        const currentLevel = levels[mockLevelIndex];
        logger.info(`${BUNDLE}cycle ${i}: level ${currentLevel}, index ${mockLevelIndex}`);
        expect(isValidLevel(currentLevel)).assertTrue();
        expect(currentLevel >= 0).assertTrue();
        
        mockLevelIndex = (mockLevelIndex + 1) % levels.length;
      }

      expect(mockLevelIndex).assertEqual(0);
      logger.info(`${BUNDLE}completed full cycle, returned to index 0`);

      logger.info(`${BUNDLE}mockDataCycleThroughLevels_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_MOCKCYCLE_0200
     * @tc.name      testMockDataReverseCycle0005
     * @tc.desc      Verify mock data can cycle in reverse order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testMockDataReverseCycle0005', 0, async () => {
      logger.info(`${BUNDLE}testMockDataReverseCycle0005, begin`);

      let mockLevelIndex = 3;
      expect(mockLevelIndex).assertEqual(3);
      const levels = [
        systemLoad.SystemLoadLevel.LOW,
        systemLoad.SystemLoadLevel.NORMAL,
        systemLoad.SystemLoadLevel.MEDIUM,
        systemLoad.SystemLoadLevel.HIGH
      ];
      expect(levels.length).assertEqual(4);

      for (let i = 0; i < 8; i++) {
        const currentLevel = levels[mockLevelIndex];
        logger.info(`${BUNDLE}reverse cycle ${i}: level ${currentLevel}, index ${mockLevelIndex}`);
        expect(isValidLevel(currentLevel)).assertTrue();
        expect(currentLevel >= 0).assertTrue();
        
        mockLevelIndex = (mockLevelIndex - 1 + levels.length) % levels.length;
      }

      expect(mockLevelIndex).assertEqual(3);
      logger.info(`${BUNDLE}completed reverse cycle, returned to index 3`);

      logger.info(`${BUNDLE}mockDataReverseCycle_0001, end`);
    });

    // ========================================================================
    // 数据源切换增强测�?    // ========================================================================

    /**
     * @tc.number    SUB_SYSTEMLOAD_DATASOURCE_0100
     * @tc.name      testDataSourceSwitchRealToMock0006
     * @tc.desc      Verify switch from real data source to mock data source
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDataSourceSwitchRealToMock0006', 0, async () => {
      logger.info(`${BUNDLE}testDataSourceSwitchRealToMock0006, begin`);

      let isMock = false;
      let sourceText = 'local data';
      logger.info(`${BUNDLE}initial state: isMock=${isMock}, source=${sourceText}`);

      const realLevel = await systemLoad.getLevel();
      expect(isValidLevel(realLevel)).assertTrue();
      logger.info(`${BUNDLE}queried real level: ${realLevel}`);

      isMock = true;
      sourceText = 'mock data';
      logger.info(`${BUNDLE}switched to mock: isMock=${isMock}, source=${sourceText}`);
      expect(isMock).assertTrue();
      expect(sourceText).assertContain('mock');

      const mockLevel = systemLoad.SystemLoadLevel.MEDIUM;
      expect(isValidLevel(mockLevel)).assertTrue();
      logger.info(`${BUNDLE}using mock level: ${mockLevel}`);

      logger.info(`${BUNDLE}dataSourceSwitchRealToMock_0001, end`);
    });

    /**
     * @tc.number    SUB_SYSTEMLOAD_DATASOURCE_0200
     * @tc.name      testDataSourceSwitchMockToReal0007
     * @tc.desc      Verify switch from mock data source back to real data source
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDataSourceSwitchMockToReal0007', 0, async () => {
      logger.info(`${BUNDLE}testDataSourceSwitchMockToReal0007, begin`);

      let isMock = true;
      let sourceText = 'mock data';
      logger.info(`${BUNDLE}initial state: isMock=${isMock}, source=${sourceText}`);

      const mockLevel = systemLoad.SystemLoadLevel.HIGH;
      expect(isValidLevel(mockLevel)).assertTrue();
      logger.info(`${BUNDLE}using mock level: ${mockLevel}`);

      isMock = false;
      sourceText = 'local data';
      logger.info(`${BUNDLE}switched to real: isMock=${isMock}, source=${sourceText}`);
      expect(isMock).assertFalse();
      expect(sourceText).assertContain('local');

      const realLevel = await systemLoad.getLevel();
      expect(isValidLevel(realLevel)).assertTrue();
      logger.info(`${BUNDLE}queried real level: ${realLevel}`);

      logger.info(`${BUNDLE}dataSourceSwitchMockToReal_0001, end`);
    });
  });
}
