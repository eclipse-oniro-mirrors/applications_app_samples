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

import { afterAll, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import resourceManager from '@ohos.resourceManager';
import { keepMainThreadResponsive } from './MainThreadYield';

// Locale parity matrix. Every name must resolve to a stable value in both
// override locales, and the base manager must agree with one of those locales.
// Two observations per locale catch accidental transient resolution.

export default function resourceLocaleParityExpandedMatrixTest(): void {
  describe('ResourceLocaleParityExpandedMatrixTest', () => {
    // Pace the pure-logic matrix; see MainThreadYield.ets.
    beforeEach(keepMainThreadResponsive);
    let baseManager: resourceManager.ResourceManager;
    let englishManager: resourceManager.ResourceManager;
    let chineseManager: resourceManager.ResourceManager;

    const overrideFor = (locale: string): resourceManager.ResourceManager => {
      const configuration: resourceManager.Configuration = baseManager.getOverrideConfiguration();
      configuration.locale = locale;
      return baseManager.getOverrideResourceManager(configuration);
    };

    beforeAll((): void => {
      baseManager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
      englishManager = overrideFor('en_US');
      chineseManager = overrideFor('zh_CN');
    });

    afterAll((): void => {
      englishManager.release();
      chineseManager.release();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_1000
     * @tc.name localeParityExpanded000
     * @tc.desc Verify module_desc is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded000', 0, (): void => {
      const resourceName: string = 'module_desc';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_1100
     * @tc.name localeParityExpanded001
     * @tc.desc Verify audio_visual_experience is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded001', 0, (): void => {
      const resourceName: string = 'audio_visual_experience';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_1200
     * @tc.name localeParityExpanded002
     * @tc.desc Verify Technical_Specifications is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded002', 0, (): void => {
      const resourceName: string = 'Technical_Specifications';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_1300
     * @tc.name localeParityExpanded003
     * @tc.desc Verify Product_Specifications is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded003', 0, (): void => {
      const resourceName: string = 'Product_Specifications';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_1400
     * @tc.name localeParityExpanded004
     * @tc.desc Verify energy_efficiency_rating is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded004', 0, (): void => {
      const resourceName: string = 'energy_efficiency_rating';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_1500
     * @tc.name localeParityExpanded005
     * @tc.desc Verify tab_service_support is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded005', 0, (): void => {
      const resourceName: string = 'tab_service_support';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_1600
     * @tc.name localeParityExpanded006
     * @tc.desc Verify feature_smart_ai is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded006', 0, (): void => {
      const resourceName: string = 'feature_smart_ai';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_1700
     * @tc.name localeParityExpanded007
     * @tc.desc Verify feature_voice_interaction is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded007', 0, (): void => {
      const resourceName: string = 'feature_voice_interaction';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_1800
     * @tc.name localeParityExpanded008
     * @tc.desc Verify feature_screen_cast_desc is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded008', 0, (): void => {
      const resourceName: string = 'feature_screen_cast_desc';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_1900
     * @tc.name localeParityExpanded009
     * @tc.desc Verify feature_smart_screensaver_desc is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded009', 0, (): void => {
      const resourceName: string = 'feature_smart_screensaver_desc';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_2000
     * @tc.name localeParityExpanded010
     * @tc.desc Verify smartlife_entertainment_av is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded010', 0, (): void => {
      const resourceName: string = 'smartlife_entertainment_av';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_2100
     * @tc.name localeParityExpanded011
     * @tc.desc Verify smartlife_entertainment_av_desc is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded011', 0, (): void => {
      const resourceName: string = 'smartlife_entertainment_av_desc';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_2200
     * @tc.name localeParityExpanded012
     * @tc.desc Verify inter_label_1 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded012', 0, (): void => {
      const resourceName: string = 'inter_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_2300
     * @tc.name localeParityExpanded013
     * @tc.desc Verify inter_content_2 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded013', 0, (): void => {
      const resourceName: string = 'inter_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_2400
     * @tc.name localeParityExpanded014
     * @tc.desc Verify cast_label_1 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded014', 0, (): void => {
      const resourceName: string = 'cast_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_2500
     * @tc.name localeParityExpanded015
     * @tc.desc Verify cast_content_2 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded015', 0, (): void => {
      const resourceName: string = 'cast_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_2600
     * @tc.name localeParityExpanded016
     * @tc.desc Verify ai_label_1 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded016', 0, (): void => {
      const resourceName: string = 'ai_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_2700
     * @tc.name localeParityExpanded017
     * @tc.desc Verify ai_content_2 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded017', 0, (): void => {
      const resourceName: string = 'ai_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_2800
     * @tc.name localeParityExpanded018
     * @tc.desc Verify pointing_label_1 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded018', 0, (): void => {
      const resourceName: string = 'pointing_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_2900
     * @tc.name localeParityExpanded019
     * @tc.desc Verify pointing_content_2 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded019', 0, (): void => {
      const resourceName: string = 'pointing_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_3000
     * @tc.name localeParityExpanded020
     * @tc.desc Verify screensaver_label_1 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded020', 0, (): void => {
      const resourceName: string = 'screensaver_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_3100
     * @tc.name localeParityExpanded021
     * @tc.desc Verify screensaver_content_2 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded021', 0, (): void => {
      const resourceName: string = 'screensaver_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_3200
     * @tc.name localeParityExpanded022
     * @tc.desc Verify voice_label_1 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded022', 0, (): void => {
      const resourceName: string = 'voice_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_3300
     * @tc.name localeParityExpanded023
     * @tc.desc Verify voice_content_2 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded023', 0, (): void => {
      const resourceName: string = 'voice_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_3400
     * @tc.name localeParityExpanded024
     * @tc.desc Verify distributed_label_1 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded024', 0, (): void => {
      const resourceName: string = 'distributed_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_3500
     * @tc.name localeParityExpanded025
     * @tc.desc Verify distributed_content_2 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded025', 0, (): void => {
      const resourceName: string = 'distributed_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_3600
     * @tc.name localeParityExpanded026
     * @tc.desc Verify media_label_1 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded026', 0, (): void => {
      const resourceName: string = 'media_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_3700
     * @tc.name localeParityExpanded027
     * @tc.desc Verify media_content_2 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded027', 0, (): void => {
      const resourceName: string = 'media_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_3800
     * @tc.name localeParityExpanded028
     * @tc.desc Verify childcare_label_1 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded028', 0, (): void => {
      const resourceName: string = 'childcare_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_3900
     * @tc.name localeParityExpanded029
     * @tc.desc Verify childcare_content_2 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded029', 0, (): void => {
      const resourceName: string = 'childcare_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_4000
     * @tc.name localeParityExpanded030
     * @tc.desc Verify office_label_2 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded030', 0, (): void => {
      const resourceName: string = 'office_label_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_4100
     * @tc.name localeParityExpanded031
     * @tc.desc Verify office_content_3 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded031', 0, (): void => {
      const resourceName: string = 'office_content_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_4200
     * @tc.name localeParityExpanded032
     * @tc.desc Verify product_display_tech is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded032', 0, (): void => {
      const resourceName: string = 'product_display_tech';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_4300
     * @tc.name localeParityExpanded033
     * @tc.desc Verify product_memory_config is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded033', 0, (): void => {
      const resourceName: string = 'product_memory_config';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_4400
     * @tc.name localeParityExpanded034
     * @tc.desc Verify product_interface_config is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded034', 0, (): void => {
      const resourceName: string = 'product_interface_config';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_4500
     * @tc.name localeParityExpanded035
     * @tc.desc Verify product_gk6320 is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded035', 0, (): void => {
      const resourceName: string = 'product_gk6320';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_4600
     * @tc.name localeParityExpanded036
     * @tc.desc Verify media_4k_demo_title is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded036', 0, (): void => {
      const resourceName: string = 'media_4k_demo_title';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_4700
     * @tc.name localeParityExpanded037
     * @tc.desc Verify media_voice_enhancement is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded037', 0, (): void => {
      const resourceName: string = 'media_voice_enhancement';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_4800
     * @tc.name localeParityExpanded038
     * @tc.desc Verify media_refresh_rate is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded038', 0, (): void => {
      const resourceName: string = 'media_refresh_rate';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LOCALE_PARITY_EXPANDED_4900
     * @tc.name localeParityExpanded039
     * @tc.desc Verify media_1_07_billion_colors is stable, non-empty and base-consistent across en_US and zh_CN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('localeParityExpanded039', 0, (): void => {
      const resourceName: string = 'media_1_07_billion_colors';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishFirst: string = englishManager.getStringByNameSync(resourceName);
      const englishSecond: string = englishManager.getStringByNameSync(resourceName);
      const chineseFirst: string = chineseManager.getStringByNameSync(resourceName);
      const chineseSecond: string = chineseManager.getStringByNameSync(resourceName);
      expect(englishFirst).assertEqual(englishSecond);
      expect(chineseFirst).assertEqual(chineseSecond);
      expect(englishFirst.length > 0).assertTrue();
      expect(chineseFirst.length > 0).assertTrue();
      expect(baseValue === englishFirst || baseValue === chineseFirst).assertTrue();
    });

  });
}
