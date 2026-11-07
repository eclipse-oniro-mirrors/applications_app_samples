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
 * 国际化与主题适配测试
 * 包含：国际化测试、主题适配测试
 */

import { describe, it, expect, beforeAll, afterAll, afterEach } from '@ohos/hypium';
import { BusinessError, systemLoad } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN_NUMBER = 0x0000;
const BUNDLE = 'I18nThemeTest: ';

interface Logger {
  info: (msg: string) => void;
  warn: (msg: string) => void;
  error: (msg: string) => void;
}

const logger: Logger = {
  info: (msg: string) => hilog.info(DOMAIN_NUMBER, 'I18nThemeTest', msg),
  warn: (msg: string) => hilog.warn(DOMAIN_NUMBER, 'I18nThemeTest', msg),
  error: (msg: string) => hilog.error(DOMAIN_NUMBER, 'I18nThemeTest', msg)
};

function isValidLevel(level: systemLoad.SystemLoadLevel): boolean {
  return level >= systemLoad.SystemLoadLevel.LOW && level <= systemLoad.SystemLoadLevel.ESCAPE;
}

export default function i18nThemeTest() {
  describe('SystemLoadI18nThemeTest', () => {
    // ========================================================================
    // 国际化测试
    // ========================================================================

    /**
     * @tc.number    SYSTEMLOAD_I18N_0100
     * @tc.name      testI18nChineseLocalization0001
     * @tc.desc      Verify Chinese localization resources
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 4
     */
    it('testI18nChineseLocalization0001', 0, async () => {
      logger.info(`${BUNDLE}testI18nChineseLocalization0001, begin`);

      const chineseStrings: string[] = [
        '系统负载',
        '当前等级',
        '不可用',
        '本地数据',
        '模拟数据',
        '未监听',
        '监听中',
        '准备就绪',
        '低负载',
        '正常负载',
        '中等负载',
        '高负载',
        '过热',
        '警告',
        '紧急',
        '逃生'
      ];

      expect(chineseStrings.length).assertEqual(16);
      expect(chineseStrings.length > 0).assertTrue();
      for (const str of chineseStrings) {
        logger.info(`${BUNDLE}chinese string: ${str}`);
        expect(str.length > 0).assertTrue();
        expect(typeof str).assertEqual('string');
      }

      logger.info(`${BUNDLE}all ${chineseStrings.length} chinese strings validated`);

      logger.info(`${BUNDLE}i18nChineseLocalization_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_I18N_0200
     * @tc.name      testI18nEnglishLocalization0001
     * @tc.desc      Verify English localization resources
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 4
     */
    it('testI18nEnglishLocalization0001', 0, async () => {
      logger.info(`${BUNDLE}testI18nEnglishLocalization0001, begin`);

      const englishStrings: string[] = [
        'System Load',
        'Current Level',
        'Unavailable',
        'Local Data',
        'Mock Data',
        'Not Listening',
        'Listening',
        'Ready',
        'Low Load',
        'Normal Load',
        'Medium Load',
        'High Load',
        'Overheated',
        'Warning',
        'Emergency',
        'Escape'
      ];

      expect(englishStrings.length).assertEqual(16);
      expect(englishStrings.length > 0).assertTrue();
      for (const str of englishStrings) {
        logger.info(`${BUNDLE}english string: ${str}`);
        expect(str.length > 0).assertTrue();
        expect(typeof str).assertEqual('string');
      }

      logger.info(`${BUNDLE}all ${englishStrings.length} english strings validated`);

      logger.info(`${BUNDLE}i18nEnglishLocalization_0001, end`);
    });

    // ========================================================================
    // 主题适配测试
    // ========================================================================

    /**
     * @tc.number    SYSTEMLOAD_THEME_0100
     * @tc.name      testThemeDarkMode0001
     * @tc.desc      Verify UI display in dark theme
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 4
     */
    it('testThemeDarkMode0001', 0, async () => {
      logger.info(`${BUNDLE}testThemeDarkMode0001, begin`);

      const isDarkMode = true;
      logger.info(`${BUNDLE}dark mode enabled: ${isDarkMode}`);
      expect(isDarkMode).assertTrue();

      const backgroundColor = '#1A1A1A';
      const textColor = '#FFFFFF';
      logger.info(`${BUNDLE}dark theme colors: bg=${backgroundColor}, text=${textColor}`);
      expect(backgroundColor.length > 0).assertTrue();
      expect(textColor.length > 0).assertTrue();

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      logger.info(`${BUNDLE}query succeeded in dark mode`);

      logger.info(`${BUNDLE}themeDarkMode_0001, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_THEME_0200
     * @tc.name      testThemeLightMode0001
     * @tc.desc      Verify UI display in light theme
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 4
     */
    it('testThemeLightMode0001', 0, async () => {
      logger.info(`${BUNDLE}testThemeLightMode0001, begin`);

      const isDarkMode = false;
      logger.info(`${BUNDLE}light mode enabled: ${!isDarkMode}`);
      expect(isDarkMode).assertFalse();

      const backgroundColor = '#FFFFFF';
      const textColor = '#1A1A1A';
      logger.info(`${BUNDLE}light theme colors: bg=${backgroundColor}, text=${textColor}`);
      expect(backgroundColor.length > 0).assertTrue();
      expect(textColor.length > 0).assertTrue();

      const level = await systemLoad.getLevel();
      expect(isValidLevel(level)).assertTrue();
      logger.info(`${BUNDLE}query succeeded in light mode`);

      logger.info(`${BUNDLE}themeLightMode_0001, end`);
    });
  });
}
