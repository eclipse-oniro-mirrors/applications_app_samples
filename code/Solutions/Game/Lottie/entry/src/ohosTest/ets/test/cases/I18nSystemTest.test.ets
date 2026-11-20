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

import { describe, it, expect } from '@ohos/hypium';
import i18n from '@ohos.i18n';
import Logger from '../../utils/Logger';
import { BUNDLE, SuiteTag } from '../common/TestConstant';

const TAG: string = SuiteTag.I18N;

/**
 * System locale contract used to lay out and localize the sample page. The
 * suite reads the language, region, locale and preferred language list through
 * the i18n module and never touches the UI tree.
 */
export default function i18nSystemTest(): void {
  describe('LottieI18nSystemTest', (): void => {

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_I18N_0100
     * @tc.name systemLanguagePresent001
     * @tc.desc Verify the system language is a non empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'systemLanguagePresent_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'systemLanguagePresent_001 begin');
      const check01: string = i18n.System.getSystemLanguage();
      Logger.info(TAG, 'systemLanguagePresent_001, check01=' + JSON.stringify(check01));
      expect(check01.length > 0).assertTrue();
      Logger.info(TAG, 'systemLanguagePresent_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_I18N_0200
     * @tc.name systemRegionPresent002
     * @tc.desc Verify the system region is a non empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'systemRegionPresent_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'systemRegionPresent_002 begin');
      const check01: string = i18n.System.getSystemRegion();
      Logger.info(TAG, 'systemRegionPresent_002, check01=' + JSON.stringify(check01));
      expect(check01.length > 0).assertTrue();
      Logger.info(TAG, 'systemRegionPresent_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_I18N_0300
     * @tc.name systemLocalePresent003
     * @tc.desc Verify the system locale is a non empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'systemLocalePresent_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'systemLocalePresent_003 begin');
      const check01: string = i18n.System.getSystemLocale();
      Logger.info(TAG, 'systemLocalePresent_003, check01=' + JSON.stringify(check01));
      expect(check01.length > 0).assertTrue();
      Logger.info(TAG, 'systemLocalePresent_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_I18N_0400
     * @tc.name localeStartsWithLanguage004
     * @tc.desc Verify the system locale begins with the system language
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'localeStartsWithLanguage_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'localeStartsWithLanguage_004 begin');
      const language: string = i18n.System.getSystemLanguage().toLowerCase();
      const locale: string = i18n.System.getSystemLocale().toLowerCase();
      const check01: boolean = locale.indexOf(language) === 0;
      Logger.info(TAG, 'localeStartsWithLanguage_004, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'localeStartsWithLanguage_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_I18N_0500
     * @tc.name localeContainsRegion005
     * @tc.desc Verify the system locale carries the system region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'localeContainsRegion_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'localeContainsRegion_005 begin');
      const region: string = i18n.System.getSystemRegion().toUpperCase();
      const locale: string = i18n.System.getSystemLocale().toUpperCase();
      const check01: boolean = locale.indexOf(region) >= 0;
      Logger.info(TAG, 'localeContainsRegion_005, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'localeContainsRegion_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_I18N_0600
     * @tc.name systemLanguagesPresent006
     * @tc.desc Verify the system language list contains at least one entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'systemLanguagesPresent_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'systemLanguagesPresent_006 begin');
      const languages: Array<string> = i18n.System.getSystemLanguages();
      const check01: number = languages.length;
      Logger.info(TAG, 'systemLanguagesPresent_006, check01=' + JSON.stringify(check01));
      expect(check01 > 0).assertTrue();
      Logger.info(TAG, 'systemLanguagesPresent_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_I18N_0700
     * @tc.name systemCountriesPresent007
     * @tc.desc Verify the country list of a known language is not empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'systemCountriesPresent_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'systemCountriesPresent_007 begin');
      const countries: Array<string> = i18n.System.getSystemCountries('en');
      const check01: number = countries.length;
      Logger.info(TAG, 'systemCountriesPresent_007, check01=' + JSON.stringify(check01));
      expect(check01 > 0).assertTrue();
      Logger.info(TAG, 'systemCountriesPresent_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_I18N_0800
     * @tc.name preferredListPresent008
     * @tc.desc Verify the preferred language list contains at least one entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'preferredListPresent_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'preferredListPresent_008 begin');
      const languages: Array<string> = i18n.System.getPreferredLanguageList();
      const check01: number = languages.length;
      Logger.info(TAG, 'preferredListPresent_008, check01=' + JSON.stringify(check01));
      expect(check01 > 0).assertTrue();
      Logger.info(TAG, 'preferredListPresent_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_I18N_0900
     * @tc.name firstPreferredMatchesList009
     * @tc.desc Verify the first preferred language is the head of the list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'firstPreferredMatchesList_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'firstPreferredMatchesList_009 begin');
      const languages: Array<string> = i18n.System.getPreferredLanguageList();
      const first: string = i18n.System.getFirstPreferredLanguage();
      const check01: boolean = languages.length > 0 && languages[0] === first;
      Logger.info(TAG, 'firstPreferredMatchesList_009, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'firstPreferredMatchesList_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_I18N_1000
     * @tc.name appPreferredPresent010
     * @tc.desc Verify the application preferred language is non empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'appPreferredPresent_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'appPreferredPresent_010 begin');
      const check01: string = i18n.System.getAppPreferredLanguage();
      Logger.info(TAG, 'appPreferredPresent_010, check01=' + JSON.stringify(check01));
      expect(check01.length > 0).assertTrue();
      Logger.info(TAG, 'appPreferredPresent_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_I18N_1100
     * @tc.name clockModeStable011
     * @tc.desc Verify repeated clock mode reads return the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'clockModeStable_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'clockModeStable_011 begin');
      const first: boolean = i18n.System.is24HourClock();
      const second: boolean = i18n.System.is24HourClock();
      Logger.info(TAG, 'clockModeStable_011, first=' + JSON.stringify(first) +
        ', second=' + JSON.stringify(second));
      const check01: boolean = first === second;
      Logger.info(TAG, 'clockModeStable_011, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'clockModeStable_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_I18N_1200
     * @tc.name displayLanguagePresent012
     * @tc.desc Verify a known language name is localized for English
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'displayLanguagePresent_012', 0, async (): Promise<void> => {
      Logger.info(TAG, 'displayLanguagePresent_012 begin');
      const check01: string = i18n.System.getDisplayLanguage('zh', 'en-US');
      Logger.info(TAG, 'displayLanguagePresent_012, check01=' + JSON.stringify(check01));
      expect(check01.length > 0).assertTrue();
      Logger.info(TAG, 'displayLanguagePresent_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_I18N_1300
     * @tc.name displayCountryPresent013
     * @tc.desc Verify a known country name is localized for English
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'displayCountryPresent_013', 0, async (): Promise<void> => {
      Logger.info(TAG, 'displayCountryPresent_013 begin');
      const check01: string = i18n.System.getDisplayCountry('CN', 'en-US');
      Logger.info(TAG, 'displayCountryPresent_013, check01=' + JSON.stringify(check01));
      expect(check01.length > 0).assertTrue();
      Logger.info(TAG, 'displayCountryPresent_013 end');
    });
  });
}
