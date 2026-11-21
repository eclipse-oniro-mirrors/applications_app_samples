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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import i18n from '@ohos.i18n';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Locale identity and text direction reported by the system.
 * A caption can be laid out right to left for an Arabic reader, and the page
 * formats dates by the system locale. The cases pin the locale parts and the
 * direction decision the layout uses.
 */
export default function i18nLocaleTest() {
  describe('I18nLocaleTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_I18N_0100
     * @tc.name LocaleNonEmpty001
     * @tc.desc Verify the system reports a non empty locale tag
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LocaleNonEmpty_001', 0, (): void => {
      Logger.info(TAG, 'LocaleNonEmpty_001 begin');
      expect(i18n.System.getSystemLocale().length > 0).assertTrue();
      Logger.info(TAG, 'LocaleNonEmpty_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_I18N_0200
     * @tc.name LanguagePrefixesLocale002
     * @tc.desc Verify the language tag is the leading part of the locale
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LanguagePrefixesLocale_002', 0, (): void => {
      Logger.info(TAG, 'LanguagePrefixesLocale_002 begin');
      const language: string = i18n.System.getSystemLanguage();
      const locale: string = i18n.System.getSystemLocale();
      expect(locale.startsWith(language)).assertTrue();
      Logger.info(TAG, 'LanguagePrefixesLocale_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_I18N_0300
     * @tc.name RegionIsTwoLetters003
     * @tc.desc Verify the region code is a two letter uppercase tag
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RegionIsTwoLetters_003', 0, (): void => {
      Logger.info(TAG, 'RegionIsTwoLetters_003 begin');
      const region: string = i18n.System.getSystemRegion();
      expect(region.length).assertEqual(2);
      expect(region).assertEqual(region.toUpperCase());
      Logger.info(TAG, 'RegionIsTwoLetters_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_I18N_0400
     * @tc.name LocaleStableAcrossReads004
     * @tc.desc Verify two locale reads report the same tag
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LocaleStableAcrossReads_004', 0, (): void => {
      Logger.info(TAG, 'LocaleStableAcrossReads_004 begin');
      const first: string = i18n.System.getSystemLocale();
      const second: string = i18n.System.getSystemLocale();
      expect(second).assertEqual(first);
      Logger.info(TAG, 'LocaleStableAcrossReads_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_I18N_0500
     * @tc.name ArabicIsRightToLeft005
     * @tc.desc Verify an Arabic locale is reported as right to left
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArabicIsRightToLeft_005', 0, (): void => {
      Logger.info(TAG, 'ArabicIsRightToLeft_005 begin');
      expect(i18n.isRTL('ar')).assertTrue();
      Logger.info(TAG, 'ArabicIsRightToLeft_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_I18N_0600
     * @tc.name EnglishIsLeftToRight006
     * @tc.desc Verify an English locale is not reported as right to left
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EnglishIsLeftToRight_006', 0, (): void => {
      Logger.info(TAG, 'EnglishIsLeftToRight_006 begin');
      expect(i18n.isRTL('en')).assertFalse();
      Logger.info(TAG, 'EnglishIsLeftToRight_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_I18N_0700
     * @tc.name ChineseIsLeftToRight007
     * @tc.desc Verify a Chinese locale is not reported as right to left
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ChineseIsLeftToRight_007', 0, (): void => {
      Logger.info(TAG, 'ChineseIsLeftToRight_007 begin');
      const ltrLocales: Array<string> = ['zh-Hans', 'en-GB'];
      let rtlCount: number = 0;
      for (let index: number = 0; index < ltrLocales.length; index++) {
        if (i18n.isRTL(ltrLocales[index])) {
          rtlCount += 1;
        }
      }
      expect(rtlCount).assertEqual(0);
      Logger.info(TAG, 'ChineseIsLeftToRight_007 end');
    });
  });
}
