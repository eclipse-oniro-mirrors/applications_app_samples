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

// Every declared base string must resolve through the live, English-override and
// Chinese-override managers. One long-lived override manager per locale avoids
// exhausting the system override budget while still exercising all names.

const EXPANDED_STRING_NAMES: string[] = [
  'module_desc',
  'EntryAbility_desc',
  'EntryAbility_label',
  'audio_visual_experience',
  '4K_demo_video',
  'Audio_characteristics',
  'Technical_Specifications',
  'Function_Directory',
  'Smart_Life',
  'Product_Specifications',
  'Sound_system',
  'Dolby_Atmos',
  'energy_efficiency_rating',
  'Class_1_Energy_Efficiency',
  'tab_function_features',
  'tab_service_support',
  'feature_universal_interconnection',
  'feature_screen_cast',
  'feature_smart_ai',
  'feature_pointing_remote',
  'feature_smart_screensaver',
  'feature_voice_interaction',
  'feature_distributed',
  'feature_universal_interconnection_desc',
  'feature_screen_cast_desc',
  'feature_smart_ai_desc',
  'feature_pointing_remote_desc',
  'feature_smart_screensaver_desc',
  'feature_voice_interaction_desc',
  'feature_distributed_desc',
  'smartlife_entertainment_av',
  'smartlife_child_care',
  'smartlife_efficient_office',
  'smartlife_entertainment_av_desc',
  'smartlife_child_care_desc',
  'smartlife_efficient_office_desc',
  'inter_label_1',
  'inter_content_1',
  'inter_label_2',
  'inter_content_2',
  'inter_label_3',
  'inter_content_3',
  'cast_label_1',
  'cast_content_1',
  'cast_label_2',
  'cast_content_2',
  'cast_label_3',
  'cast_content_3',
  'ai_label_1',
  'ai_content_1',
  'ai_label_2',
  'ai_content_2',
  'ai_label_3',
  'ai_content_3',
  'pointing_label_1',
  'pointing_content_1',
  'pointing_label_2',
  'pointing_content_2',
  'pointing_label_3',
  'pointing_content_3',
  'screensaver_label_1',
  'screensaver_content_1',
  'screensaver_label_2',
  'screensaver_content_2',
  'screensaver_label_3',
  'screensaver_content_3',
  'voice_label_1',
  'voice_content_1',
  'voice_label_2',
  'voice_content_2',
  'voice_label_3',
  'voice_content_3',
  'distributed_label_1',
  'distributed_content_1',
  'distributed_label_2',
  'distributed_content_2',
  'distributed_label_3',
  'distributed_content_3',
  'media_label_1',
  'media_content_1',
  'media_label_2',
  'media_content_2',
  'media_label_3',
  'media_content_3',
  'childcare_label_1',
  'childcare_content_1',
  'childcare_label_2',
  'childcare_content_2',
  'office_label_1',
  'office_content_1',
  'office_label_2',
  'office_content_2',
  'office_label_3',
  'office_content_3',
  'product_screen_size',
  'product_75inch_4k',
  'product_display_tech',
  'product_miniled_backlight',
  'product_os',
  'product_memory_config',
  'product_4gb_64gb',
  'product_processor',
  'product_interface_config',
  'product_hdmi21',
  'product_27inch_1080p',
  'product_gk6320',
  'product_gk6780',
  'product_openharmony',
  'media_4k_demo_title',
  'media_dolby_atmos_sound',
  'media_smart_sound_field',
  'media_voice_enhancement',
  'media_hdr_support',
  'media_hdr10plus',
  'media_refresh_rate',
  'media_120hz_memc',
  'media_color_depth',
  'media_1_07_billion_colors',
  'media_contrast_ratio',
  'media_1000000_1',
  'error_screen_params_invalid',
  'error_get_screen_size_failed',
  'error_screensaver_failed',
];

export default function resourceStringExpandedMatrixTest(): void {
  describe('ResourceStringExpandedMatrixTest', () => {
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
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_1000
     * @tc.name stringExpanded000
     * @tc.desc Verify resource string module_desc resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded000', 0, (): void => {
      const resourceName: string = 'module_desc';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_1100
     * @tc.name stringExpanded001
     * @tc.desc Verify resource string EntryAbility_desc resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded001', 0, (): void => {
      const resourceName: string = 'EntryAbility_desc';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_1200
     * @tc.name stringExpanded002
     * @tc.desc Verify resource string EntryAbility_label resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded002', 0, (): void => {
      const resourceName: string = 'EntryAbility_label';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_1300
     * @tc.name stringExpanded003
     * @tc.desc Verify resource string audio_visual_experience resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded003', 0, (): void => {
      const resourceName: string = 'audio_visual_experience';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_1400
     * @tc.name stringExpanded004
     * @tc.desc Verify resource string 4K_demo_video resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded004', 0, (): void => {
      const resourceName: string = '4K_demo_video';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_1500
     * @tc.name stringExpanded005
     * @tc.desc Verify resource string Audio_characteristics resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded005', 0, (): void => {
      const resourceName: string = 'Audio_characteristics';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_1600
     * @tc.name stringExpanded006
     * @tc.desc Verify resource string Technical_Specifications resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded006', 0, (): void => {
      const resourceName: string = 'Technical_Specifications';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_1700
     * @tc.name stringExpanded007
     * @tc.desc Verify resource string Function_Directory resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded007', 0, (): void => {
      const resourceName: string = 'Function_Directory';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_1800
     * @tc.name stringExpanded008
     * @tc.desc Verify resource string Smart_Life resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded008', 0, (): void => {
      const resourceName: string = 'Smart_Life';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_1900
     * @tc.name stringExpanded009
     * @tc.desc Verify resource string Product_Specifications resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded009', 0, (): void => {
      const resourceName: string = 'Product_Specifications';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_2000
     * @tc.name stringExpanded010
     * @tc.desc Verify resource string Sound_system resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded010', 0, (): void => {
      const resourceName: string = 'Sound_system';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_2100
     * @tc.name stringExpanded011
     * @tc.desc Verify resource string Dolby_Atmos resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded011', 0, (): void => {
      const resourceName: string = 'Dolby_Atmos';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_2200
     * @tc.name stringExpanded012
     * @tc.desc Verify resource string energy_efficiency_rating resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded012', 0, (): void => {
      const resourceName: string = 'energy_efficiency_rating';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_2300
     * @tc.name stringExpanded013
     * @tc.desc Verify resource string Class_1_Energy_Efficiency resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded013', 0, (): void => {
      const resourceName: string = 'Class_1_Energy_Efficiency';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_2400
     * @tc.name stringExpanded014
     * @tc.desc Verify resource string tab_function_features resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded014', 0, (): void => {
      const resourceName: string = 'tab_function_features';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_2500
     * @tc.name stringExpanded015
     * @tc.desc Verify resource string tab_service_support resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded015', 0, (): void => {
      const resourceName: string = 'tab_service_support';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_2600
     * @tc.name stringExpanded016
     * @tc.desc Verify resource string feature_universal_interconnection resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded016', 0, (): void => {
      const resourceName: string = 'feature_universal_interconnection';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_2700
     * @tc.name stringExpanded017
     * @tc.desc Verify resource string feature_screen_cast resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded017', 0, (): void => {
      const resourceName: string = 'feature_screen_cast';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_2800
     * @tc.name stringExpanded018
     * @tc.desc Verify resource string feature_smart_ai resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded018', 0, (): void => {
      const resourceName: string = 'feature_smart_ai';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_2900
     * @tc.name stringExpanded019
     * @tc.desc Verify resource string feature_pointing_remote resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded019', 0, (): void => {
      const resourceName: string = 'feature_pointing_remote';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_3000
     * @tc.name stringExpanded020
     * @tc.desc Verify resource string feature_smart_screensaver resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded020', 0, (): void => {
      const resourceName: string = 'feature_smart_screensaver';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_3100
     * @tc.name stringExpanded021
     * @tc.desc Verify resource string feature_voice_interaction resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded021', 0, (): void => {
      const resourceName: string = 'feature_voice_interaction';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_3200
     * @tc.name stringExpanded022
     * @tc.desc Verify resource string feature_distributed resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded022', 0, (): void => {
      const resourceName: string = 'feature_distributed';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_3300
     * @tc.name stringExpanded023
     * @tc.desc Verify resource string feature_universal_interconnection_desc resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded023', 0, (): void => {
      const resourceName: string = 'feature_universal_interconnection_desc';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_3400
     * @tc.name stringExpanded024
     * @tc.desc Verify resource string feature_screen_cast_desc resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded024', 0, (): void => {
      const resourceName: string = 'feature_screen_cast_desc';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_3500
     * @tc.name stringExpanded025
     * @tc.desc Verify resource string feature_smart_ai_desc resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded025', 0, (): void => {
      const resourceName: string = 'feature_smart_ai_desc';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_3600
     * @tc.name stringExpanded026
     * @tc.desc Verify resource string feature_pointing_remote_desc resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded026', 0, (): void => {
      const resourceName: string = 'feature_pointing_remote_desc';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_3700
     * @tc.name stringExpanded027
     * @tc.desc Verify resource string feature_smart_screensaver_desc resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded027', 0, (): void => {
      const resourceName: string = 'feature_smart_screensaver_desc';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_3800
     * @tc.name stringExpanded028
     * @tc.desc Verify resource string feature_voice_interaction_desc resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded028', 0, (): void => {
      const resourceName: string = 'feature_voice_interaction_desc';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_3900
     * @tc.name stringExpanded029
     * @tc.desc Verify resource string feature_distributed_desc resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded029', 0, (): void => {
      const resourceName: string = 'feature_distributed_desc';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_4000
     * @tc.name stringExpanded030
     * @tc.desc Verify resource string smartlife_entertainment_av resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded030', 0, (): void => {
      const resourceName: string = 'smartlife_entertainment_av';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_4100
     * @tc.name stringExpanded031
     * @tc.desc Verify resource string smartlife_child_care resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded031', 0, (): void => {
      const resourceName: string = 'smartlife_child_care';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_4200
     * @tc.name stringExpanded032
     * @tc.desc Verify resource string smartlife_efficient_office resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded032', 0, (): void => {
      const resourceName: string = 'smartlife_efficient_office';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_4300
     * @tc.name stringExpanded033
     * @tc.desc Verify resource string smartlife_entertainment_av_desc resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded033', 0, (): void => {
      const resourceName: string = 'smartlife_entertainment_av_desc';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_4400
     * @tc.name stringExpanded034
     * @tc.desc Verify resource string smartlife_child_care_desc resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded034', 0, (): void => {
      const resourceName: string = 'smartlife_child_care_desc';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_4500
     * @tc.name stringExpanded035
     * @tc.desc Verify resource string smartlife_efficient_office_desc resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded035', 0, (): void => {
      const resourceName: string = 'smartlife_efficient_office_desc';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_4600
     * @tc.name stringExpanded036
     * @tc.desc Verify resource string inter_label_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded036', 0, (): void => {
      const resourceName: string = 'inter_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_4700
     * @tc.name stringExpanded037
     * @tc.desc Verify resource string inter_content_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded037', 0, (): void => {
      const resourceName: string = 'inter_content_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_4800
     * @tc.name stringExpanded038
     * @tc.desc Verify resource string inter_label_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded038', 0, (): void => {
      const resourceName: string = 'inter_label_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_4900
     * @tc.name stringExpanded039
     * @tc.desc Verify resource string inter_content_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded039', 0, (): void => {
      const resourceName: string = 'inter_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_5000
     * @tc.name stringExpanded040
     * @tc.desc Verify resource string inter_label_3 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded040', 0, (): void => {
      const resourceName: string = 'inter_label_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_5100
     * @tc.name stringExpanded041
     * @tc.desc Verify resource string inter_content_3 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded041', 0, (): void => {
      const resourceName: string = 'inter_content_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_5200
     * @tc.name stringExpanded042
     * @tc.desc Verify resource string cast_label_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded042', 0, (): void => {
      const resourceName: string = 'cast_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_5300
     * @tc.name stringExpanded043
     * @tc.desc Verify resource string cast_content_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded043', 0, (): void => {
      const resourceName: string = 'cast_content_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_5400
     * @tc.name stringExpanded044
     * @tc.desc Verify resource string cast_label_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded044', 0, (): void => {
      const resourceName: string = 'cast_label_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_5500
     * @tc.name stringExpanded045
     * @tc.desc Verify resource string cast_content_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded045', 0, (): void => {
      const resourceName: string = 'cast_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_5600
     * @tc.name stringExpanded046
     * @tc.desc Verify resource string cast_label_3 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded046', 0, (): void => {
      const resourceName: string = 'cast_label_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_5700
     * @tc.name stringExpanded047
     * @tc.desc Verify resource string cast_content_3 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded047', 0, (): void => {
      const resourceName: string = 'cast_content_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_5800
     * @tc.name stringExpanded048
     * @tc.desc Verify resource string ai_label_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded048', 0, (): void => {
      const resourceName: string = 'ai_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_5900
     * @tc.name stringExpanded049
     * @tc.desc Verify resource string ai_content_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded049', 0, (): void => {
      const resourceName: string = 'ai_content_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_6000
     * @tc.name stringExpanded050
     * @tc.desc Verify resource string ai_label_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded050', 0, (): void => {
      const resourceName: string = 'ai_label_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_6100
     * @tc.name stringExpanded051
     * @tc.desc Verify resource string ai_content_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded051', 0, (): void => {
      const resourceName: string = 'ai_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_6200
     * @tc.name stringExpanded052
     * @tc.desc Verify resource string ai_label_3 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded052', 0, (): void => {
      const resourceName: string = 'ai_label_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_6300
     * @tc.name stringExpanded053
     * @tc.desc Verify resource string ai_content_3 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded053', 0, (): void => {
      const resourceName: string = 'ai_content_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_6400
     * @tc.name stringExpanded054
     * @tc.desc Verify resource string pointing_label_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded054', 0, (): void => {
      const resourceName: string = 'pointing_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_6500
     * @tc.name stringExpanded055
     * @tc.desc Verify resource string pointing_content_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded055', 0, (): void => {
      const resourceName: string = 'pointing_content_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_6600
     * @tc.name stringExpanded056
     * @tc.desc Verify resource string pointing_label_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded056', 0, (): void => {
      const resourceName: string = 'pointing_label_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_6700
     * @tc.name stringExpanded057
     * @tc.desc Verify resource string pointing_content_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded057', 0, (): void => {
      const resourceName: string = 'pointing_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_6800
     * @tc.name stringExpanded058
     * @tc.desc Verify resource string pointing_label_3 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded058', 0, (): void => {
      const resourceName: string = 'pointing_label_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_6900
     * @tc.name stringExpanded059
     * @tc.desc Verify resource string pointing_content_3 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded059', 0, (): void => {
      const resourceName: string = 'pointing_content_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_7000
     * @tc.name stringExpanded060
     * @tc.desc Verify resource string screensaver_label_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded060', 0, (): void => {
      const resourceName: string = 'screensaver_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_7100
     * @tc.name stringExpanded061
     * @tc.desc Verify resource string screensaver_content_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded061', 0, (): void => {
      const resourceName: string = 'screensaver_content_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_7200
     * @tc.name stringExpanded062
     * @tc.desc Verify resource string screensaver_label_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded062', 0, (): void => {
      const resourceName: string = 'screensaver_label_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_7300
     * @tc.name stringExpanded063
     * @tc.desc Verify resource string screensaver_content_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded063', 0, (): void => {
      const resourceName: string = 'screensaver_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_7400
     * @tc.name stringExpanded064
     * @tc.desc Verify resource string screensaver_label_3 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded064', 0, (): void => {
      const resourceName: string = 'screensaver_label_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_7500
     * @tc.name stringExpanded065
     * @tc.desc Verify resource string screensaver_content_3 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded065', 0, (): void => {
      const resourceName: string = 'screensaver_content_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_7600
     * @tc.name stringExpanded066
     * @tc.desc Verify resource string voice_label_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded066', 0, (): void => {
      const resourceName: string = 'voice_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_7700
     * @tc.name stringExpanded067
     * @tc.desc Verify resource string voice_content_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded067', 0, (): void => {
      const resourceName: string = 'voice_content_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_7800
     * @tc.name stringExpanded068
     * @tc.desc Verify resource string voice_label_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded068', 0, (): void => {
      const resourceName: string = 'voice_label_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_7900
     * @tc.name stringExpanded069
     * @tc.desc Verify resource string voice_content_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded069', 0, (): void => {
      const resourceName: string = 'voice_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_8000
     * @tc.name stringExpanded070
     * @tc.desc Verify resource string voice_label_3 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded070', 0, (): void => {
      const resourceName: string = 'voice_label_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_8100
     * @tc.name stringExpanded071
     * @tc.desc Verify resource string voice_content_3 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded071', 0, (): void => {
      const resourceName: string = 'voice_content_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_8200
     * @tc.name stringExpanded072
     * @tc.desc Verify resource string distributed_label_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded072', 0, (): void => {
      const resourceName: string = 'distributed_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_8300
     * @tc.name stringExpanded073
     * @tc.desc Verify resource string distributed_content_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded073', 0, (): void => {
      const resourceName: string = 'distributed_content_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_8400
     * @tc.name stringExpanded074
     * @tc.desc Verify resource string distributed_label_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded074', 0, (): void => {
      const resourceName: string = 'distributed_label_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_8500
     * @tc.name stringExpanded075
     * @tc.desc Verify resource string distributed_content_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded075', 0, (): void => {
      const resourceName: string = 'distributed_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_8600
     * @tc.name stringExpanded076
     * @tc.desc Verify resource string distributed_label_3 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded076', 0, (): void => {
      const resourceName: string = 'distributed_label_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_8700
     * @tc.name stringExpanded077
     * @tc.desc Verify resource string distributed_content_3 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded077', 0, (): void => {
      const resourceName: string = 'distributed_content_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_8800
     * @tc.name stringExpanded078
     * @tc.desc Verify resource string media_label_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded078', 0, (): void => {
      const resourceName: string = 'media_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_8900
     * @tc.name stringExpanded079
     * @tc.desc Verify resource string media_content_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded079', 0, (): void => {
      const resourceName: string = 'media_content_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_9000
     * @tc.name stringExpanded080
     * @tc.desc Verify resource string media_label_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded080', 0, (): void => {
      const resourceName: string = 'media_label_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_9100
     * @tc.name stringExpanded081
     * @tc.desc Verify resource string media_content_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded081', 0, (): void => {
      const resourceName: string = 'media_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_9200
     * @tc.name stringExpanded082
     * @tc.desc Verify resource string media_label_3 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded082', 0, (): void => {
      const resourceName: string = 'media_label_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_9300
     * @tc.name stringExpanded083
     * @tc.desc Verify resource string media_content_3 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded083', 0, (): void => {
      const resourceName: string = 'media_content_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_9400
     * @tc.name stringExpanded084
     * @tc.desc Verify resource string childcare_label_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded084', 0, (): void => {
      const resourceName: string = 'childcare_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_9500
     * @tc.name stringExpanded085
     * @tc.desc Verify resource string childcare_content_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded085', 0, (): void => {
      const resourceName: string = 'childcare_content_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_9600
     * @tc.name stringExpanded086
     * @tc.desc Verify resource string childcare_label_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded086', 0, (): void => {
      const resourceName: string = 'childcare_label_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_9700
     * @tc.name stringExpanded087
     * @tc.desc Verify resource string childcare_content_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded087', 0, (): void => {
      const resourceName: string = 'childcare_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_9800
     * @tc.name stringExpanded088
     * @tc.desc Verify resource string office_label_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded088', 0, (): void => {
      const resourceName: string = 'office_label_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_9900
     * @tc.name stringExpanded089
     * @tc.desc Verify resource string office_content_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded089', 0, (): void => {
      const resourceName: string = 'office_content_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_10000
     * @tc.name stringExpanded090
     * @tc.desc Verify resource string office_label_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded090', 0, (): void => {
      const resourceName: string = 'office_label_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_10100
     * @tc.name stringExpanded091
     * @tc.desc Verify resource string office_content_2 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded091', 0, (): void => {
      const resourceName: string = 'office_content_2';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_10200
     * @tc.name stringExpanded092
     * @tc.desc Verify resource string office_label_3 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded092', 0, (): void => {
      const resourceName: string = 'office_label_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_10300
     * @tc.name stringExpanded093
     * @tc.desc Verify resource string office_content_3 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded093', 0, (): void => {
      const resourceName: string = 'office_content_3';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_10400
     * @tc.name stringExpanded094
     * @tc.desc Verify resource string product_screen_size resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded094', 0, (): void => {
      const resourceName: string = 'product_screen_size';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_10500
     * @tc.name stringExpanded095
     * @tc.desc Verify resource string product_75inch_4k resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded095', 0, (): void => {
      const resourceName: string = 'product_75inch_4k';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_10600
     * @tc.name stringExpanded096
     * @tc.desc Verify resource string product_display_tech resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded096', 0, (): void => {
      const resourceName: string = 'product_display_tech';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_10700
     * @tc.name stringExpanded097
     * @tc.desc Verify resource string product_miniled_backlight resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded097', 0, (): void => {
      const resourceName: string = 'product_miniled_backlight';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_10800
     * @tc.name stringExpanded098
     * @tc.desc Verify resource string product_os resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded098', 0, (): void => {
      const resourceName: string = 'product_os';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_10900
     * @tc.name stringExpanded099
     * @tc.desc Verify resource string product_memory_config resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded099', 0, (): void => {
      const resourceName: string = 'product_memory_config';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_11000
     * @tc.name stringExpanded100
     * @tc.desc Verify resource string product_4gb_64gb resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded100', 0, (): void => {
      const resourceName: string = 'product_4gb_64gb';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_11100
     * @tc.name stringExpanded101
     * @tc.desc Verify resource string product_processor resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded101', 0, (): void => {
      const resourceName: string = 'product_processor';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_11200
     * @tc.name stringExpanded102
     * @tc.desc Verify resource string product_interface_config resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded102', 0, (): void => {
      const resourceName: string = 'product_interface_config';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_11300
     * @tc.name stringExpanded103
     * @tc.desc Verify resource string product_hdmi21 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded103', 0, (): void => {
      const resourceName: string = 'product_hdmi21';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_11400
     * @tc.name stringExpanded104
     * @tc.desc Verify resource string product_27inch_1080p resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded104', 0, (): void => {
      const resourceName: string = 'product_27inch_1080p';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_11500
     * @tc.name stringExpanded105
     * @tc.desc Verify resource string product_gk6320 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded105', 0, (): void => {
      const resourceName: string = 'product_gk6320';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_11600
     * @tc.name stringExpanded106
     * @tc.desc Verify resource string product_gk6780 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded106', 0, (): void => {
      const resourceName: string = 'product_gk6780';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_11700
     * @tc.name stringExpanded107
     * @tc.desc Verify resource string product_openharmony resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded107', 0, (): void => {
      const resourceName: string = 'product_openharmony';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_11800
     * @tc.name stringExpanded108
     * @tc.desc Verify resource string media_4k_demo_title resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded108', 0, (): void => {
      const resourceName: string = 'media_4k_demo_title';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_11900
     * @tc.name stringExpanded109
     * @tc.desc Verify resource string media_dolby_atmos_sound resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded109', 0, (): void => {
      const resourceName: string = 'media_dolby_atmos_sound';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_12000
     * @tc.name stringExpanded110
     * @tc.desc Verify resource string media_smart_sound_field resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded110', 0, (): void => {
      const resourceName: string = 'media_smart_sound_field';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_12100
     * @tc.name stringExpanded111
     * @tc.desc Verify resource string media_voice_enhancement resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded111', 0, (): void => {
      const resourceName: string = 'media_voice_enhancement';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_12200
     * @tc.name stringExpanded112
     * @tc.desc Verify resource string media_hdr_support resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded112', 0, (): void => {
      const resourceName: string = 'media_hdr_support';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_12300
     * @tc.name stringExpanded113
     * @tc.desc Verify resource string media_hdr10plus resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded113', 0, (): void => {
      const resourceName: string = 'media_hdr10plus';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_12400
     * @tc.name stringExpanded114
     * @tc.desc Verify resource string media_refresh_rate resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded114', 0, (): void => {
      const resourceName: string = 'media_refresh_rate';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_12500
     * @tc.name stringExpanded115
     * @tc.desc Verify resource string media_120hz_memc resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded115', 0, (): void => {
      const resourceName: string = 'media_120hz_memc';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_12600
     * @tc.name stringExpanded116
     * @tc.desc Verify resource string media_color_depth resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded116', 0, (): void => {
      const resourceName: string = 'media_color_depth';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_12700
     * @tc.name stringExpanded117
     * @tc.desc Verify resource string media_1_07_billion_colors resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded117', 0, (): void => {
      const resourceName: string = 'media_1_07_billion_colors';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_12800
     * @tc.name stringExpanded118
     * @tc.desc Verify resource string media_contrast_ratio resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded118', 0, (): void => {
      const resourceName: string = 'media_contrast_ratio';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_12900
     * @tc.name stringExpanded119
     * @tc.desc Verify resource string media_1000000_1 resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded119', 0, (): void => {
      const resourceName: string = 'media_1000000_1';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_13000
     * @tc.name stringExpanded120
     * @tc.desc Verify resource string error_screen_params_invalid resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded120', 0, (): void => {
      const resourceName: string = 'error_screen_params_invalid';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_13100
     * @tc.name stringExpanded121
     * @tc.desc Verify resource string error_get_screen_size_failed resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded121', 0, (): void => {
      const resourceName: string = 'error_get_screen_size_failed';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_STRING_EXPANDED_13200
     * @tc.name stringExpanded122
     * @tc.desc Verify resource string error_screensaver_failed resolves through base, en_US and zh_CN managers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('stringExpanded122', 0, (): void => {
      const resourceName: string = 'error_screensaver_failed';
      const baseValue: string = baseManager.getStringByNameSync(resourceName);
      const englishValue: string = englishManager.getStringByNameSync(resourceName);
      const chineseValue: string = chineseManager.getStringByNameSync(resourceName);
      expect(baseValue.trim().length > 0).assertTrue();
      expect(englishValue.trim().length > 0).assertTrue();
      expect(chineseValue.trim().length > 0).assertTrue();
      expect(baseValue === englishValue || baseValue === chineseValue).assertTrue();
    });

  });
}
