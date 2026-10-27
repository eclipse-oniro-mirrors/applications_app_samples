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
import resourceManager from '@ohos.resourceManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { keepMainThreadResponsive } from './MainThreadYield';

// Every string key referenced by the production UI. The matrix verifies that all
// three packaged qualifiers (base, en_US, zh_CN) resolve each key to a non-empty
// value and that the two shipping locales are genuinely localized (en != zh).
const UI_STRING_KEYS: string[] = [
  'audio_visual_experience', '4K_demo_video', 'Audio_characteristics', 'Technical_Specifications',
  'Function_Directory', 'Smart_Life', 'Product_Specifications', 'Sound_system', 'Dolby_Atmos',
  'energy_efficiency_rating', 'Class_1_Energy_Efficiency', 'tab_function_features', 'tab_service_support',
  'feature_universal_interconnection', 'feature_screen_cast', 'feature_smart_ai', 'feature_pointing_remote',
  'feature_smart_screensaver', 'feature_voice_interaction', 'feature_distributed',
  'feature_universal_interconnection_desc', 'feature_screen_cast_desc', 'feature_smart_ai_desc',
  'feature_pointing_remote_desc', 'feature_smart_screensaver_desc', 'feature_voice_interaction_desc',
  'feature_distributed_desc', 'smartlife_entertainment_av', 'smartlife_child_care',
  'smartlife_efficient_office', 'smartlife_entertainment_av_desc', 'smartlife_child_care_desc',
  'smartlife_efficient_office_desc', 'inter_label_1', 'inter_label_2', 'inter_label_3',
  'inter_content_1', 'inter_content_2', 'inter_content_3', 'cast_label_1', 'cast_label_2', 'cast_label_3',
  'cast_content_1', 'cast_content_2', 'cast_content_3', 'ai_label_1', 'ai_label_2', 'ai_label_3',
  'ai_content_1', 'ai_content_2', 'ai_content_3', 'pointing_label_1', 'pointing_label_2', 'pointing_label_3',
  'pointing_content_1', 'pointing_content_2', 'pointing_content_3', 'screensaver_label_1',
  'screensaver_label_2', 'screensaver_label_3', 'screensaver_content_1', 'screensaver_content_2',
  'screensaver_content_3', 'voice_label_1', 'voice_label_2', 'voice_label_3', 'voice_content_1',
  'voice_content_2', 'voice_content_3', 'distributed_label_1', 'distributed_label_2', 'distributed_label_3',
  'distributed_content_1', 'distributed_content_2', 'distributed_content_3', 'media_label_1',
  'media_label_2', 'media_label_3', 'media_content_1', 'media_content_2', 'media_content_3',
  'childcare_label_1', 'childcare_label_2', 'childcare_content_1', 'childcare_content_2',
  'office_label_1', 'office_label_2', 'office_label_3', 'office_content_1', 'office_content_2',
  'office_content_3', 'product_screen_size', 'product_75inch_4k', 'product_display_tech',
  'product_miniled_backlight', 'product_os', 'product_memory_config', 'product_4gb_64gb',
  'product_processor', 'product_interface_config', 'product_hdmi21', 'product_27inch_1080p',
  'product_gk6320', 'product_gk6780', 'product_openharmony', 'media_4k_demo_title',
  'media_dolby_atmos_sound', 'media_smart_sound_field', 'media_voice_enhancement',
  'media_hdr_support', 'media_hdr10plus', 'media_refresh_rate', 'media_120hz_memc', 'media_color_depth',
  'media_1_07_billion_colors', 'media_contrast_ratio', 'media_1000000_1', 'error_screen_params_invalid',
  'error_get_screen_size_failed', 'error_screensaver_failed'
];
// Ability metadata keys exist only in the base qualifier (AppScope resources).
const METADATA_KEYS: string[] = ['module_desc', 'EntryAbility_desc', 'EntryAbility_label'];

export default function resourceLocaleConsistencyMatrixContractTest(): void {
  describe('ResourceLocaleConsistencyMatrixContractTest', () => {
    // Pace the pure-logic matrix; see MainThreadYield.ets.
    beforeEach(keepMainThreadResponsive);
    let manager: resourceManager.ResourceManager;
    let englishManager: resourceManager.ResourceManager;
    let chineseManager: resourceManager.ResourceManager;

    const localeManager = (locale: string): resourceManager.ResourceManager => {
      const configuration: resourceManager.Configuration = manager.getOverrideConfiguration();
      configuration.locale = locale;
      return manager.getOverrideResourceManager(configuration);
    };

    const resolve = (managerInstance: resourceManager.ResourceManager, key: string): string => {
      try {
        return managerInstance.getStringByNameSync(key);
      } catch (error) {
        return '';
      }
    };

    beforeAll((): void => {
      manager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
      englishManager = localeManager('en_US');
      chineseManager = localeManager('zh_CN');
    });

    afterAll((): void => {
      // The override managers are scoped objects; no process-wide locale is touched.
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_MATRIX_0100
     * @tc.name resourceMatrixBaseResolvesEveryKey001
     * @tc.desc Verify the base qualifier resolves every UI string key to a non-empty value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceMatrixBaseResolvesEveryKey001', 0, (): void => {
      for (let keyIndex: number = 0; keyIndex < UI_STRING_KEYS.length; keyIndex++) {
        const value: string = resolve(manager, UI_STRING_KEYS[keyIndex]);
        expect(value.trim().length).assertLarger(0);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_MATRIX_0200
     * @tc.name resourceMatrixEnglishResolvesEveryKey002
     * @tc.desc Verify the en_US qualifier resolves every UI string key to a non-empty value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceMatrixEnglishResolvesEveryKey002', 0, (): void => {
      for (let keyIndex: number = 0; keyIndex < UI_STRING_KEYS.length; keyIndex++) {
        const value: string = resolve(englishManager, UI_STRING_KEYS[keyIndex]);
        expect(value.trim().length).assertLarger(0);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_MATRIX_0300
     * @tc.name resourceMatrixChineseResolvesEveryKey003
     * @tc.desc Verify the zh_CN qualifier resolves every UI string key to a non-empty value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceMatrixChineseResolvesEveryKey003', 0, (): void => {
      for (let keyIndex: number = 0; keyIndex < UI_STRING_KEYS.length; keyIndex++) {
        const value: string = resolve(chineseManager, UI_STRING_KEYS[keyIndex]);
        expect(value.trim().length).assertLarger(0);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_MATRIX_0400
     * @tc.name resourceMatrixPrimaryNavigationLocalized004
     * @tc.desc Verify primary navigation labels are genuinely translated into Chinese
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceMatrixPrimaryNavigationLocalized004', 0, (): void => {
      const english: string[] = [
        resolve(englishManager, 'Product_Specifications'),
        resolve(englishManager, 'tab_function_features'),
        resolve(englishManager, 'Smart_Life'),
        resolve(englishManager, 'tab_service_support')
      ];
      const chinese: string[] = [
        resolve(chineseManager, 'Product_Specifications'),
        resolve(chineseManager, 'tab_function_features'),
        resolve(chineseManager, 'Smart_Life'),
        resolve(chineseManager, 'tab_service_support')
      ];
      for (let index: number = 0; index < english.length; index++) {
        expect(english[index] === chinese[index]).assertFalse();
        expect(chinese[index].trim().length).assertLarger(0);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_MATRIX_0500
     * @tc.name resourceMatrixFeatureTitlesLocalized005
     * @tc.desc Verify every Feature title differs between English and Chinese qualifiers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceMatrixFeatureTitlesLocalized005', 0, (): void => {
      const keys: string[] = ['feature_universal_interconnection', 'feature_screen_cast', 'feature_smart_ai',
        'feature_pointing_remote', 'feature_smart_screensaver', 'feature_voice_interaction',
        'feature_distributed'];
      for (let keyIndex: number = 0; keyIndex < keys.length; keyIndex++) {
        const englishValue: string = resolve(englishManager, keys[keyIndex]);
        const chineseValue: string = resolve(chineseManager, keys[keyIndex]);
        expect(englishValue === chineseValue).assertFalse();
        expect(englishValue.trim().length).assertLarger(0);
        expect(chineseValue.trim().length).assertLarger(0);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_MATRIX_0600
     * @tc.name resourceMatrixSceneTitlesLocalized006
     * @tc.desc Verify Smart Life scene titles differ between English and Chinese qualifiers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceMatrixSceneTitlesLocalized006', 0, (): void => {
      const keys: string[] = ['smartlife_entertainment_av', 'smartlife_child_care', 'smartlife_efficient_office'];
      for (let keyIndex: number = 0; keyIndex < keys.length; keyIndex++) {
        const englishValue: string = resolve(englishManager, keys[keyIndex]);
        const chineseValue: string = resolve(chineseManager, keys[keyIndex]);
        expect(englishValue === chineseValue).assertFalse();
        expect(chineseValue.trim().length).assertLarger(0);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_MATRIX_0700
     * @tc.name resourceMatrixProductSpecsLocalized007
     * @tc.desc Verify Product Specifications values differ between English and Chinese qualifiers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceMatrixProductSpecsLocalized007', 0, (): void => {
      const keys: string[] = ['product_screen_size', 'product_os', 'product_processor',
        'product_display_tech', 'product_memory_config', 'product_interface_config', 'Sound_system',
        'energy_efficiency_rating', 'Dolby_Atmos', 'Class_1_Energy_Efficiency'];
      for (let keyIndex: number = 0; keyIndex < keys.length; keyIndex++) {
        const englishValue: string = resolve(englishManager, keys[keyIndex]);
        const chineseValue: string = resolve(chineseManager, keys[keyIndex]);
        expect(englishValue === chineseValue).assertFalse();
        expect(chineseValue.trim().length).assertLarger(0);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_MATRIX_0800
     * @tc.name resourceMatrixMediaPageLocalized008
     * @tc.desc Verify MediaExperiencePage strings differ between English and Chinese qualifiers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceMatrixMediaPageLocalized008', 0, (): void => {
      const keys: string[] = ['audio_visual_experience', 'Audio_characteristics', 'Technical_Specifications',
        'media_dolby_atmos_sound', 'media_smart_sound_field', 'media_voice_enhancement'];
      for (let keyIndex: number = 0; keyIndex < keys.length; keyIndex++) {
        const englishValue: string = resolve(englishManager, keys[keyIndex]);
        const chineseValue: string = resolve(chineseManager, keys[keyIndex]);
        expect(englishValue === chineseValue).assertFalse();
        expect(chineseValue.trim().length).assertLarger(0);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_MATRIX_0900
     * @tc.name resourceMatrixMetadataBaseOnly009
     * @tc.desc Verify ability metadata keys resolve in base while UI managers stay non-empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceMatrixMetadataBaseOnly009', 0, (): void => {
      for (let keyIndex: number = 0; keyIndex < METADATA_KEYS.length; keyIndex++) {
        const baseValue: string = resolve(manager, METADATA_KEYS[keyIndex]);
        expect(baseValue.trim().length).assertLarger(0);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_MATRIX_1000
     * @tc.name resourceMatrixFullMatrixSweep010
     * @tc.desc Verify every key resolves in all three qualifiers in a single sweep
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceMatrixFullMatrixSweep010', 0, (): void => {
      for (let keyIndex: number = 0; keyIndex < UI_STRING_KEYS.length; keyIndex++) {
        const baseValue: string = resolve(manager, UI_STRING_KEYS[keyIndex]);
        const englishValue: string = resolve(englishManager, UI_STRING_KEYS[keyIndex]);
        const chineseValue: string = resolve(chineseManager, UI_STRING_KEYS[keyIndex]);
        expect(baseValue.trim().length).assertLarger(0);
        expect(englishValue.trim().length).assertLarger(0);
        expect(chineseValue.trim().length).assertLarger(0);
      }
    });
  });
}
