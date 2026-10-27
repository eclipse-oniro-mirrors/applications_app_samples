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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import resourceManager from '@ohos.resourceManager';
import { keepMainThreadResponsive } from './MainThreadYield';

// Exhaustive resource integrity matrix generated from the actual packaged
// resources (base / en_US / zh_CN). Every expectation is the literal value
// shipped with the application, so a broken or missing resource qualifier
// fails loudly instead of degrading silently.

export default function resourceExhaustiveMatrixContractTest(): void {
  describe('ResourceExhaustiveMatrixContractTest', () => {
    // Pace the pure-logic matrix; see MainThreadYield.ets.
    beforeEach(keepMainThreadResponsive);
    let manager: resourceManager.ResourceManager;
    let originalLocale: string;

    const createLocaleManager = (locale: string): resourceManager.ResourceManager => {
      const configuration: resourceManager.Configuration = manager.getOverrideConfiguration();
      configuration.locale = locale;
      return manager.getOverrideResourceManager(configuration);
    };

    const resolveNames = (resolver: resourceManager.ResourceManager, names: string[]): string[] => {
      const values: string[] = [];
      for (let index: number = 0; index < names.length; index++) {
        values.push(resolver.getStringByNameSync(names[index]));
      }
      return values;
    };

    const assertExact = (resolver: resourceManager.ResourceManager, names: string[], expected: string[]): void => {
      expect(names.length).assertEqual(expected.length);
      const values: string[] = resolveNames(resolver, names);
      for (let index: number = 0; index < expected.length; index++) {
        expect(values[index]).assertEqual(expected[index]);
      }
    };

    const assertAllNonEmpty = (resolver: resourceManager.ResourceManager, names: string[]): void => {
      const values: string[] = resolveNames(resolver, names);
      for (let index: number = 0; index < values.length; index++) {
        expect(values[index].trim().length > 0).assertTrue();
      }
    };

    // Locale-aware wrappers that create an override resource manager, run the
    // assertion, and release it in a finally block. Override resource managers
    // consume a system-side budget that is not reclaimed by GC; the exhaustive
    // matrix creates dozens of them, so every one must be released after use or
    // the budget is exhausted and the process is killed by the resource manager.
    const assertExactInLocale = (locale: string, names: string[], expected: string[]): void => {
      const resolver: resourceManager.ResourceManager = createLocaleManager(locale);
      try {
        assertExact(resolver, names, expected);
      } finally {
        resolver.release();
      }
    };

    const assertAllNonEmptyInLocale = (locale: string, names: string[]): void => {
      const resolver: resourceManager.ResourceManager = createLocaleManager(locale);
      try {
        assertAllNonEmpty(resolver, names);
      } finally {
        resolver.release();
      }
    };

    beforeAll((): void => {
      manager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
      originalLocale = manager.getConfigurationSync().locale;
    });

    beforeEach((): void => {
      expect(manager.getConfigurationSync().locale).assertEqual(originalLocale);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_0100
     * @tc.name resourceExhaustiveBaseSweep001
     * @tc.desc Verify base qualifier resolves every packaged string key to a readable value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExhaustiveBaseSweep001', 0, (): void => {
      const names: string[] = [
        '4K_demo_video',
        'Audio_characteristics',
        'Class_1_Energy_Efficiency',
        'Dolby_Atmos',
        'EntryAbility_desc',
        'EntryAbility_label',
        'Function_Directory',
        'Product_Specifications',
        'Smart_Life',
        'Sound_system',
        'Technical_Specifications',
        'ai_content_1',
        'ai_content_2',
        'ai_content_3',
        'ai_label_1',
        'ai_label_2',
        'ai_label_3',
        'audio_visual_experience',
        'cast_content_1',
        'cast_content_2',
        'cast_content_3',
        'cast_label_1',
        'cast_label_2',
        'cast_label_3',
        'childcare_content_1',
        'childcare_content_2',
        'childcare_label_1',
        'childcare_label_2',
        'distributed_content_1',
        'distributed_content_2',
        'distributed_content_3',
        'distributed_label_1',
      ];
      assertAllNonEmpty(manager, names);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_0200
     * @tc.name resourceExhaustiveBaseSweep002
     * @tc.desc Verify base qualifier resolves every packaged string key to a readable value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExhaustiveBaseSweep002', 0, (): void => {
      const names: string[] = [
        'distributed_label_2',
        'distributed_label_3',
        'energy_efficiency_rating',
        'error_get_screen_size_failed',
        'error_screen_params_invalid',
        'error_screensaver_failed',
        'feature_distributed',
        'feature_distributed_desc',
        'feature_pointing_remote',
        'feature_pointing_remote_desc',
        'feature_screen_cast',
        'feature_screen_cast_desc',
        'feature_smart_ai',
        'feature_smart_ai_desc',
        'feature_smart_screensaver',
        'feature_smart_screensaver_desc',
        'feature_universal_interconnection',
        'feature_universal_interconnection_desc',
        'feature_voice_interaction',
        'feature_voice_interaction_desc',
        'inter_content_1',
        'inter_content_2',
        'inter_content_3',
        'inter_label_1',
        'inter_label_2',
        'inter_label_3',
        'media_1000000_1',
        'media_120hz_memc',
        'media_1_07_billion_colors',
        'media_4k_demo_title',
        'media_color_depth',
        'media_content_1',
      ];
      assertAllNonEmpty(manager, names);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_0300
     * @tc.name resourceExhaustiveBaseSweep003
     * @tc.desc Verify base qualifier resolves every packaged string key to a readable value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExhaustiveBaseSweep003', 0, (): void => {
      const names: string[] = [
        'media_content_2',
        'media_content_3',
        'media_contrast_ratio',
        'media_dolby_atmos_sound',
        'media_hdr10plus',
        'media_hdr_support',
        'media_label_1',
        'media_label_2',
        'media_label_3',
        'media_refresh_rate',
        'media_smart_sound_field',
        'media_voice_enhancement',
        'module_desc',
        'office_content_1',
        'office_content_2',
        'office_content_3',
        'office_label_1',
        'office_label_2',
        'office_label_3',
        'pointing_content_1',
        'pointing_content_2',
        'pointing_content_3',
        'pointing_label_1',
        'pointing_label_2',
        'pointing_label_3',
        'product_27inch_1080p',
        'product_4gb_64gb',
        'product_75inch_4k',
        'product_display_tech',
        'product_gk6320',
        'product_gk6780',
        'product_hdmi21',
      ];
      assertAllNonEmpty(manager, names);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_0400
     * @tc.name resourceExhaustiveBaseSweep004
     * @tc.desc Verify base qualifier resolves every packaged string key to a readable value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExhaustiveBaseSweep004', 0, (): void => {
      const names: string[] = [
        'product_interface_config',
        'product_memory_config',
        'product_miniled_backlight',
        'product_openharmony',
        'product_os',
        'product_processor',
        'product_screen_size',
        'screensaver_content_1',
        'screensaver_content_2',
        'screensaver_content_3',
        'screensaver_label_1',
        'screensaver_label_2',
        'screensaver_label_3',
        'smartlife_child_care',
        'smartlife_child_care_desc',
        'smartlife_efficient_office',
        'smartlife_efficient_office_desc',
        'smartlife_entertainment_av',
        'smartlife_entertainment_av_desc',
        'tab_function_features',
        'tab_service_support',
        'voice_content_1',
        'voice_content_2',
        'voice_content_3',
        'voice_label_1',
        'voice_label_2',
        'voice_label_3',
      ];
      assertAllNonEmpty(manager, names);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_9000
     * @tc.name resourceExhaustiveEnglishSweep
     * @tc.desc Verify en_US override resolves every string key to a non-empty value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExhaustiveEnglishSweep', 0, (): void => {
      const names: string[] = [

        '4K_demo_video',
        'Audio_characteristics',
        'Class_1_Energy_Efficiency',
        'Dolby_Atmos',
        'EntryAbility_desc',
        'EntryAbility_label',
        'Function_Directory',
        'Product_Specifications',
        'Smart_Life',
        'Sound_system',
        'Technical_Specifications',
        'ai_content_1',
        'ai_content_2',
        'ai_content_3',
        'ai_label_1',
        'ai_label_2',
        'ai_label_3',
        'audio_visual_experience',
        'cast_content_1',
        'cast_content_2',
        'cast_content_3',
        'cast_label_1',
        'cast_label_2',
        'cast_label_3',
        'childcare_content_1',
        'childcare_content_2',
        'childcare_label_1',
        'childcare_label_2',
        'distributed_content_1',
        'distributed_content_2',
        'distributed_content_3',
        'distributed_label_1',
        'distributed_label_2',
        'distributed_label_3',
        'energy_efficiency_rating',
        'error_get_screen_size_failed',
        'error_screen_params_invalid',
        'error_screensaver_failed',
        'feature_distributed',
        'feature_distributed_desc',
        'feature_pointing_remote',
        'feature_pointing_remote_desc',
        'feature_screen_cast',
        'feature_screen_cast_desc',
        'feature_smart_ai',
        'feature_smart_ai_desc',
        'feature_smart_screensaver',
        'feature_smart_screensaver_desc',
        'feature_universal_interconnection',
        'feature_universal_interconnection_desc',
        'feature_voice_interaction',
        'feature_voice_interaction_desc',
        'inter_content_1',
        'inter_content_2',
        'inter_content_3',
        'inter_label_1',
        'inter_label_2',
        'inter_label_3',
        'media_1000000_1',
        'media_120hz_memc',
        'media_1_07_billion_colors',
        'media_4k_demo_title',
        'media_color_depth',
        'media_content_1',
        'media_content_2',
        'media_content_3',
        'media_contrast_ratio',
        'media_dolby_atmos_sound',
        'media_hdr10plus',
        'media_hdr_support',
        'media_label_1',
        'media_label_2',
        'media_label_3',
        'media_refresh_rate',
        'media_smart_sound_field',
        'media_voice_enhancement',
        'module_desc',
        'office_content_1',
        'office_content_2',
        'office_content_3',
        'office_label_1',
        'office_label_2',
        'office_label_3',
        'pointing_content_1',
        'pointing_content_2',
        'pointing_content_3',
        'pointing_label_1',
        'pointing_label_2',
        'pointing_label_3',
        'product_27inch_1080p',
        'product_4gb_64gb',
        'product_75inch_4k',
        'product_display_tech',
        'product_gk6320',
        'product_gk6780',
        'product_hdmi21',
        'product_interface_config',
        'product_memory_config',
        'product_miniled_backlight',
        'product_openharmony',
        'product_os',
        'product_processor',
        'product_screen_size',
        'screensaver_content_1',
        'screensaver_content_2',
        'screensaver_content_3',
        'screensaver_label_1',
        'screensaver_label_2',
        'screensaver_label_3',
        'smartlife_child_care',
        'smartlife_child_care_desc',
        'smartlife_efficient_office',
        'smartlife_efficient_office_desc',
        'smartlife_entertainment_av',
        'smartlife_entertainment_av_desc',
        'tab_function_features',
        'tab_service_support',
        'voice_content_1',
        'voice_content_2',
        'voice_content_3',
        'voice_label_1',
        'voice_label_2',
        'voice_label_3',
      ];
      assertAllNonEmptyInLocale('en_US', names);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_9100
     * @tc.name resourceExhaustiveChineseSweep
     * @tc.desc Verify zh_CN override resolves every string key to a non-empty value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExhaustiveChineseSweep', 0, (): void => {
      const names: string[] = [

        '4K_demo_video',
        'Audio_characteristics',
        'Class_1_Energy_Efficiency',
        'Dolby_Atmos',
        'EntryAbility_desc',
        'EntryAbility_label',
        'Function_Directory',
        'Product_Specifications',
        'Smart_Life',
        'Sound_system',
        'Technical_Specifications',
        'ai_content_1',
        'ai_content_2',
        'ai_content_3',
        'ai_label_1',
        'ai_label_2',
        'ai_label_3',
        'audio_visual_experience',
        'cast_content_1',
        'cast_content_2',
        'cast_content_3',
        'cast_label_1',
        'cast_label_2',
        'cast_label_3',
        'childcare_content_1',
        'childcare_content_2',
        'childcare_label_1',
        'childcare_label_2',
        'distributed_content_1',
        'distributed_content_2',
        'distributed_content_3',
        'distributed_label_1',
        'distributed_label_2',
        'distributed_label_3',
        'energy_efficiency_rating',
        'error_get_screen_size_failed',
        'error_screen_params_invalid',
        'error_screensaver_failed',
        'feature_distributed',
        'feature_distributed_desc',
        'feature_pointing_remote',
        'feature_pointing_remote_desc',
        'feature_screen_cast',
        'feature_screen_cast_desc',
        'feature_smart_ai',
        'feature_smart_ai_desc',
        'feature_smart_screensaver',
        'feature_smart_screensaver_desc',
        'feature_universal_interconnection',
        'feature_universal_interconnection_desc',
        'feature_voice_interaction',
        'feature_voice_interaction_desc',
        'inter_content_1',
        'inter_content_2',
        'inter_content_3',
        'inter_label_1',
        'inter_label_2',
        'inter_label_3',
        'media_1000000_1',
        'media_120hz_memc',
        'media_1_07_billion_colors',
        'media_4k_demo_title',
        'media_color_depth',
        'media_content_1',
        'media_content_2',
        'media_content_3',
        'media_contrast_ratio',
        'media_dolby_atmos_sound',
        'media_hdr10plus',
        'media_hdr_support',
        'media_label_1',
        'media_label_2',
        'media_label_3',
        'media_refresh_rate',
        'media_smart_sound_field',
        'media_voice_enhancement',
        'module_desc',
        'office_content_1',
        'office_content_2',
        'office_content_3',
        'office_label_1',
        'office_label_2',
        'office_label_3',
        'pointing_content_1',
        'pointing_content_2',
        'pointing_content_3',
        'pointing_label_1',
        'pointing_label_2',
        'pointing_label_3',
        'product_27inch_1080p',
        'product_4gb_64gb',
        'product_75inch_4k',
        'product_display_tech',
        'product_gk6320',
        'product_gk6780',
        'product_hdmi21',
        'product_interface_config',
        'product_memory_config',
        'product_miniled_backlight',
        'product_openharmony',
        'product_os',
        'product_processor',
        'product_screen_size',
        'screensaver_content_1',
        'screensaver_content_2',
        'screensaver_content_3',
        'screensaver_label_1',
        'screensaver_label_2',
        'screensaver_label_3',
        'smartlife_child_care',
        'smartlife_child_care_desc',
        'smartlife_efficient_office',
        'smartlife_efficient_office_desc',
        'smartlife_entertainment_av',
        'smartlife_entertainment_av_desc',
        'tab_function_features',
        'tab_service_support',
        'voice_content_1',
        'voice_content_2',
        'voice_content_3',
        'voice_label_1',
        'voice_label_2',
        'voice_label_3',
      ];
      assertAllNonEmptyInLocale('zh_CN', names);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_10100
     * @tc.name resourceExactNavigationLabels001
     * @tc.desc Verify base, English and Chinese resolve the NavigationLabels strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactNavigationLabels001', 0, (): void => {
      const names: string[] = [
        'Product_Specifications',
        'Function_Directory',
        'Smart_Life',
        'tab_service_support',
        'tab_function_features',
      ];
      assertExact(manager, names, [
        "Product Specifications",
        "Function Directory",
        "Smart Life",
        "Service Support",
        "Function Features",
      ]);
      assertExactInLocale('en_US', names, [
        "Product Specifications",
        "Function Directory",
        "Smart Life",
        "Service Support",
        "Function Features",
      ]);
      assertExactInLocale('zh_CN', names, [
        "产品规格",
        "功能目录",
        "智慧生活",
        "服务支持",
        "功能特性",
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_10200
     * @tc.name resourceExactFeatureTitles001
     * @tc.desc Verify base, English and Chinese resolve the FeatureTitles strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactFeatureTitles001', 0, (): void => {
      const names: string[] = [
        'feature_universal_interconnection',
        'feature_screen_cast',
        'feature_smart_ai',
        'feature_pointing_remote',
        'feature_smart_screensaver',
        'feature_voice_interaction',
        'feature_distributed',
      ];
      assertExact(manager, names, [
        "Universal Interconnection",
        "Screen Cast",
        "Smart AI",
        "Pointing Remote",
        "Smart Screensaver",
        "Voice Interaction",
        "Distributed",
      ]);
      assertExactInLocale('en_US', names, [
        "Universal Interconnection",
        "Screen Cast",
        "Smart AI",
        "Pointing Remote",
        "Smart Screensaver",
        "Voice Interaction",
        "Distributed",
      ]);
      assertExactInLocale('zh_CN', names, [
        "通用互联",
        "投屏",
        "智能AI",
        "指向遥控",
        "智慧屏保",
        "语音交互",
        "分布式",
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_10300
     * @tc.name resourceExactFeatureDescriptions001
     * @tc.desc Verify base, English and Chinese resolve the FeatureDescriptions strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactFeatureDescriptions001', 0, (): void => {
      const names: string[] = [
        'feature_universal_interconnection_desc',
        'feature_screen_cast_desc',
        'feature_smart_ai_desc',
        'feature_pointing_remote_desc',
        'feature_smart_screensaver_desc',
        'feature_voice_interaction_desc',
        'feature_distributed_desc',
      ];
      assertExact(manager, names, [
        "Multi-device collaboration, one-tap content transfer",
        "Miracast+DLNA, small screen to big screen with ease",
        "DeepSeek AI model, knowledge at your command",
        "Point and control, effortless TV interaction",
        "Custom Photo and Video Display",
        "One-tap voice, search and control hands-free",
        "Whiteboard, Gallery, Camera — seamless cross-device synergy",
      ]);
      assertExactInLocale('en_US', names, [
        "Multi-device collaboration, one-tap content transfer",
        "Miracast+DLNA, small screen to big screen with ease",
        "DeepSeek AI model, knowledge at your command",
        "Point and control, effortless TV interaction",
        "Custom Photo and Video Display",
        "One-tap voice, search and control hands-free",
        "Whiteboard, Gallery, Camera — seamless cross-device synergy",
      ]);
      assertExactInLocale('zh_CN', names, [
        "多设备协同，一键流转内容",
        "Miracast+DLNA，小屏轻松上大屏",
        "DeepSeek大模型，有问必答懂你所想",
        "远场语音，无需遥控器操作",
        "待机艺术，回忆名画轮播",
        "一键语音，搜片调机动口不动手",
        "白板图库相机，跨端协同无界",
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_10400
     * @tc.name resourceExactSmartLifeTitles001
     * @tc.desc Verify base, English and Chinese resolve the SmartLifeTitles strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactSmartLifeTitles001', 0, (): void => {
      const names: string[] = [
        'smartlife_entertainment_av',
        'smartlife_child_care',
        'smartlife_efficient_office',
      ];
      assertExact(manager, names, [
        "Entertainment & AV",
        "Child Care",
        "Efficient Office",
      ]);
      assertExactInLocale('en_US', names, [
        "Entertainment & AV",
        "Child Care",
        "Efficient Office",
      ]);
      assertExactInLocale('zh_CN', names, [
        "娱乐影音",
        "儿童关怀",
        "高效办公",
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_10500
     * @tc.name resourceExactSmartLifeDescriptions001
     * @tc.desc Verify base, English and Chinese resolve the SmartLifeDescriptions strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactSmartLifeDescriptions001', 0, (): void => {
      const names: string[] = [
        'smartlife_entertainment_av_desc',
        'smartlife_child_care_desc',
        'smartlife_efficient_office_desc',
      ];
      assertExact(manager, names, [
        "Smart scene recognition, auto-optimize picture settings",
        "Healthy viewing habits, protect children's eyesight",
        "Multi-device collaboration, one-tap content transfer",
      ]);
      assertExactInLocale('en_US', names, [
        "Smart scene recognition, auto-optimize picture settings",
        "Healthy viewing habits, protect children's eyesight",
        "Multi-device collaboration, one-tap content transfer",
      ]);
      assertExactInLocale('zh_CN', names, [
        "智能场景识别，自动优化画面参数",
        "远场语音，无需遥控器操作",
        "多设备协同，一键流转内容",
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_10600
     * @tc.name resourceExactInteroperationContent001
     * @tc.desc Verify base, English and Chinese resolve the InteroperationContent strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactInteroperationContent001', 0, (): void => {
      const names: string[] = [
        'inter_label_1',
        'inter_content_1',
        'inter_label_2',
        'inter_content_2',
        'inter_label_3',
        'inter_content_3',
      ];
      assertExact(manager, names, [
        "Seamless Multi-Device Connection, Boundless Collaboration",
        "TV supports cross-brand interconnection of phones, computers, smart home devices and more — no tedious pairing needed, just bring them close to connect instantly. Cast phone videos to TV with one tap, sync computer documents to the big screen for work, and view smart home status on the TV display, integrating all devices for more convenient operation and a seamless experience.",
        "Effortless Data Flow, Switch Content Freely",
        "Achieve real-time cross-device data sharing and continuity — unfinished shows on your phone can be cast to TV and resumed; photos browsed on TV can sync to your phone. File transfers require no third-party software, just drag and drop, allowing content to flow freely between devices to meet diverse usage needs.",
        "Expanding Scene Ecosystem, Upgraded Smart Experience",
        "Based on universal interconnection capabilities, the TV serves as a smart home control hub, linking lights, curtains, air conditioning and other devices for scene-based control; it can also connect to education and fitness apps, syncing phone-based courses to the big screen. From entertainment to lifestyle to work, it expands the scene ecosystem in all dimensions, upgrading the smart living experience.",
      ]);
      assertExactInLocale('en_US', names, [
        "Seamless Multi-Device Connection, Boundless Collaboration",
        "TV supports cross-brand interconnection of phones, computers, smart home devices and more — no tedious pairing needed, just bring them close to connect instantly. Cast phone videos to TV with one tap, sync computer documents to the big screen for work, and view smart home status on the TV display, integrating all devices for more convenient operation and a seamless experience.",
        "Effortless Data Flow, Switch Content Freely",
        "Achieve real-time cross-device data sharing and continuity — unfinished shows on your phone can be cast to TV and resumed; photos browsed on TV can sync to your phone. File transfers require no third-party software, just drag and drop, allowing content to flow freely between devices to meet diverse usage needs.",
        "Expanding Scene Ecosystem, Upgraded Smart Experience",
        "Based on universal interconnection capabilities, the TV serves as a smart home control hub, linking lights, curtains, air conditioning and other devices for scene-based control; it can also connect to education and fitness apps, syncing phone-based courses to the big screen. From entertainment to lifestyle to work, it expands the scene ecosystem in all dimensions, upgrading the smart living experience.",
      ]);
      assertExactInLocale('zh_CN', names, [
        "多端无缝连接，设备协同无界",
        "电视支持手机、电脑、智能家居等多设备跨品牌互联，无需繁琐配对，靠近即可快速连接。手机视频一键投屏至电视，电脑文档同步显示办公，智能家居状态在电视屏幕集中呈现，让各类设备融为一体，操作更便捷，体验更连贯。",
        "数据流转自如，内容随心切换",
        "实现跨设备数据实时共享与接续，手机上未看完的剧集，投屏到电视可续播；电视上浏览的图片，能同步保存至手机。文件传输无需依赖第三方软件，拖拽即可完成，让内容在不同设备间自由流转，满足用户多场景使用需求。",
        "场景生态拓展，智慧体验升级",
        "基于通用互联能力，电视可作为智慧家庭控制中枢，联动灯光、窗帘、空调等设备实现场景化控制；也能对接教育、健身等应用，将手机端课程同步至电视大屏学习。从娱乐到生活再到办公，全方位拓展场景生态，升级智慧生活体验。",
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_10700
     * @tc.name resourceExactCastContent001
     * @tc.desc Verify base, English and Chinese resolve the CastContent strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactCastContent001', 0, (): void => {
      const names: string[] = [
        'cast_label_1',
        'cast_content_1',
        'cast_label_2',
        'cast_content_2',
        'cast_label_3',
        'cast_content_3',
      ];
      assertExact(manager, names, [
        "Miracast Casting, Smooth Screen Mirroring",
        "Based on Miracast protocol, mirror your phone or computer screen to the TV in real time. Gaming battles and office presentations without lag, peer-to-peer direct connection without network dependency — even on camping trips, cast phone movies to the big screen and enjoy an open-air cinema with friends.",
        "DLNA Casting, Direct Content Push",
        "Supports DLNA multimedia sharing — directly 'push' movies from video apps and local music to the TV for playback. After pushing, your phone operates independently; making calls or replying to messages won't affect TV playback, so binge-watching and music listening never interfere with each other.",
        "Full Protocol Coverage, Cast Your Way",
        "Miracast and DLNA, the two mainstream casting protocols, complement each other to meet different scenario needs. Whether mirroring games, pushing videos, or sharing photos, you'll find the most suitable casting method to effortlessly bring content to the big screen.",
      ]);
      assertExactInLocale('en_US', names, [
        "Miracast Casting, Smooth Screen Mirroring",
        "Based on Miracast protocol, mirror your phone or computer screen to the TV in real time. Gaming battles and office presentations without lag, peer-to-peer direct connection without network dependency — even on camping trips, cast phone movies to the big screen and enjoy an open-air cinema with friends.",
        "DLNA Casting, Direct Content Push",
        "Supports DLNA multimedia sharing — directly 'push' movies from video apps and local music to the TV for playback. After pushing, your phone operates independently; making calls or replying to messages won't affect TV playback, so binge-watching and music listening never interfere with each other.",
        "Full Protocol Coverage, Cast Your Way",
        "Miracast and DLNA, the two mainstream casting protocols, complement each other to meet different scenario needs. Whether mirroring games, pushing videos, or sharing photos, you'll find the most suitable casting method to effortlessly bring content to the big screen.",
      ]);
      assertExactInLocale('zh_CN', names, [
        "Miracast投屏，镜像丝滑流畅",
        "基于Miracast协议，手机、电脑屏幕实时镜像至电视。游戏激战、办公演示无延迟，点对点直连不依赖网络，郊游露营也能将手机电影投到大屏，与好友共享露天影院。",
        "DLNA投屏，内容直接推送",
        "支持DLNA多媒体共享，将视频App中的电影、本地音乐直接\"推送\"至电视播放。推送后手机可独立操作，打电话、回消息均不影响电视播放，追剧听歌互不干扰。",
        "全协议覆盖，投屏随心所欲",
        "Miracast与DLNA两大主流投屏协议互补，满足不同场景需求。无论是镜像游戏、推送视频，还是分享照片，都能找到最适合的投屏方式，让内容轻松上大屏。",
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_10800
     * @tc.name resourceExactAIContent001
     * @tc.desc Verify base, English and Chinese resolve the AIContent strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactAIContent001', 0, (): void => {
      const names: string[] = [
        'ai_label_1',
        'ai_content_1',
        'ai_label_2',
        'ai_content_2',
        'ai_label_3',
        'ai_content_3',
      ];
      assertExact(manager, names, [
        "Knowledge Encyclopedia, Answers at Your Call",
        "Built-in DeepSeek large language model transforms the TV into a family knowledge base. A child asks 'Why is the sky blue?' or an elder wants to learn about wellness — simply speak your question into the remote, and the TV deeply understands and provides detailed answers, satisfying the curiosity of the entire family.",
        "Document Assistant, One-Click Summary Generation",
        "Upload work documents and learning materials to the TV, and DeepSeek AI automatically extracts core summaries and generates mind maps or presentation outlines. It can even help polish emails and write weekly reports, making tedious text work easy and efficient — the TV becomes a productivity tool.",
        "Life Butler, Plan Your Daily Routine",
        "From 'weekend family dinner recipes' to 'three-day family trip itineraries', DeepSeek AI combines your preferences to customize personalized plans. It can also recommend recipes based on leftover fridge ingredients and remind about clothing based on weather forecasts — let the TV manage life's little details for you.",
      ]);
      assertExactInLocale('en_US', names, [
        "Knowledge Encyclopedia, Answers at Your Call",
        "Built-in DeepSeek large language model transforms the TV into a family knowledge base. A child asks 'Why is the sky blue?' or an elder wants to learn about wellness — simply speak your question into the remote, and the TV deeply understands and provides detailed answers, satisfying the curiosity of the entire family.",
        "Document Assistant, One-Click Summary Generation",
        "Upload work documents and learning materials to the TV, and DeepSeek AI automatically extracts core summaries and generates mind maps or presentation outlines. It can even help polish emails and write weekly reports, making tedious text work easy and efficient — the TV becomes a productivity tool.",
        "Life Butler, Plan Your Daily Routine",
        "From 'weekend family dinner recipes' to 'three-day family trip itineraries', DeepSeek AI combines your preferences to customize personalized plans. It can also recommend recipes based on leftover fridge ingredients and remind about clothing based on weather forecasts — let the TV manage life's little details for you.",
      ]);
      assertExactInLocale('zh_CN', names, [
        "知识百科，有问必答",
        "内置DeepSeek大模型，电视变身家庭知识库。孩子问\"为什么天是蓝的？\"，老人想了解养生知识，只需对着遥控器说出问题，电视便深度理解、给出详尽解答，满足全家人的好奇心。",
        "文档助手，摘要生成一键搞定",
        "将工作文档、学习资料上传至电视，DeepSeek AI自动提炼核心摘要，生成思维导图或PPT大纲。甚至能帮你润色邮件、撰写周报，让繁琐的文字工作变得轻松高效，电视也能成为生产力工具。",
        "生活管家，规划你的日常",
        "从\"周末家庭聚餐食谱\"到\"三天两夜亲子游路线\"，DeepSeek AI结合你的偏好，定制个性化方案。还能根据冰箱剩余食材推荐菜谱，根据天气提醒增减衣物，让电视为你打理生活琐事。",
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_10900
     * @tc.name resourceExactPointingContent001
     * @tc.desc Verify base, English and Chinese resolve the PointingContent strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactPointingContent001', 0, (): void => {
      const names: string[] = [
        'pointing_label_1',
        'pointing_content_1',
        'pointing_label_2',
        'pointing_content_2',
        'pointing_label_3',
        'pointing_content_3',
      ];
      assertExact(manager, names, [
        "Precision Pointing Control, Double the Efficiency",
        "Say goodbye to the tedious row-by-row cursor movement of traditional remotes. The pointing remote simply aims at the target area on the TV screen for precise 'point-and-select' control. Whether switching channels, opening apps, or selecting menu options, it responds instantly, greatly reducing steps and making TV interaction more efficient and convenient.",
        "Minimalist Interaction, Zero Learning Curve",
        "No need to memorize complex button combinations — point and confirm, two steps to complete most operations. The elderly and children can quickly master usage without usage difficulties caused by complex operations. Simple button layout paired with intuitive pointing functionality lets the whole family easily enjoy TV entertainment without extra learning costs.",
        "Long-Range Stable Response, Full Coverage",
        "Features powerful signal reception with effective control distance up to 8 meters and wide-angle signal coverage. Even from the corner of the living room or the other side of the sofa, you can stably control the TV without signal interruption or control lag. Whether multiple people use it during family gatherings or for daily long-distance control, it maintains a smooth experience.",
      ]);
      assertExactInLocale('en_US', names, [
        "Precision Pointing Control, Double the Efficiency",
        "Say goodbye to the tedious row-by-row cursor movement of traditional remotes. The pointing remote simply aims at the target area on the TV screen for precise 'point-and-select' control. Whether switching channels, opening apps, or selecting menu options, it responds instantly, greatly reducing steps and making TV interaction more efficient and convenient.",
        "Minimalist Interaction, Zero Learning Curve",
        "No need to memorize complex button combinations — point and confirm, two steps to complete most operations. The elderly and children can quickly master usage without usage difficulties caused by complex operations. Simple button layout paired with intuitive pointing functionality lets the whole family easily enjoy TV entertainment without extra learning costs.",
        "Long-Range Stable Response, Full Coverage",
        "Features powerful signal reception with effective control distance up to 8 meters and wide-angle signal coverage. Even from the corner of the living room or the other side of the sofa, you can stably control the TV without signal interruption or control lag. Whether multiple people use it during family gatherings or for daily long-distance control, it maintains a smooth experience.",
      ]);
      assertExactInLocale('zh_CN', names, [
        "精准指向操控，效率翻倍",
        "告别传统遥控器逐行移动光标的繁琐，指向遥控器只需对准电视屏幕目标区域，即可实现\"指哪选哪\"的精准操控。无论是切换频道、打开应用还是选中菜单选项，都能瞬间响应，大幅减少操作步骤，让电视交互更高效便捷。",
        "极简交互逻辑，上手零门槛",
        "无需记忆复杂按键组合，指向+确认两步就能完成绝大多数操作。老人、小孩都能快速掌握使用方法，避免因操作复杂导致的使用困扰。简洁的按键布局搭配直观的指向功能，让全家成员都能轻松享受电视娱乐，无需额外学习成本。",
        "远距离稳定响应，无死角覆盖",
        "具备超强信号接收能力，有效操控距离可达8米，且支持广角度信号覆盖。即使在客厅角落、沙发另一侧等位置，也能稳定控制电视，不会出现信号中断或操控延迟的情况。无论是家庭聚会多人共用，还是日常远距离操控，都能保持流畅体验。",
      ]);
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_11100
     * @tc.name resourceExactVoiceContent001
     * @tc.desc Verify base, English and Chinese resolve the VoiceContent strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactVoiceContent001', 0, (): void => {
      const names: string[] = [
        'voice_label_1',
        'voice_content_1',
        'voice_label_2',
        'voice_content_2',
        'voice_label_3',
        'voice_content_3',
      ];
      assertExact(manager, names, [
        "Always-On Wake, Always Ready",
        "No need to repeatedly say the wake word — wake once for continuous conversation. 'Play Jay Chou's songs', 'Next track', 'Volume to 50%' — the TV accurately understands context and executes each command. Communication flows as naturally as talking to a person, completely freeing your hands.",
        "Dialect Recognition, Zero Barrier Communication",
        "Supports recognition of multiple dialects including Sichuanese, Cantonese, Shanghainese and more — easy for both elderly and children to use. Grandma says in dialect 'I want to watch Peking opera' and the TV instantly tunes to the opera channel; a child says in a childish voice 'I want to watch Peppa Pig' and the cartoon plays immediately.",
        "Smart Home Hub, One Word Controls All",
        "Control ecosystem-connected lights, air conditioning, curtains and other devices through TV voice. Say 'I want to watch a movie' and the TV automatically dims the lights, closes the curtains, and activates cinema mode. Voice interaction makes the smart home truly understand you — control the entire house with a single word.",
      ]);
      assertExactInLocale('en_US', names, [
        "Always-On Wake, Always Ready",
        "No need to repeatedly say the wake word — wake once for continuous conversation. 'Play Jay Chou's songs', 'Next track', 'Volume to 50%' — the TV accurately understands context and executes each command. Communication flows as naturally as talking to a person, completely freeing your hands.",
        "Dialect Recognition, Zero Barrier Communication",
        "Supports recognition of multiple dialects including Sichuanese, Cantonese, Shanghainese and more — easy for both elderly and children to use. Grandma says in dialect 'I want to watch Peking opera' and the TV instantly tunes to the opera channel; a child says in a childish voice 'I want to watch Peppa Pig' and the cartoon plays immediately.",
        "Smart Home Hub, One Word Controls All",
        "Control ecosystem-connected lights, air conditioning, curtains and other devices through TV voice. Say 'I want to watch a movie' and the TV automatically dims the lights, closes the curtains, and activates cinema mode. Voice interaction makes the smart home truly understand you — control the entire house with a single word.",
      ]);
      assertExactInLocale('zh_CN', names, [
        "全时唤醒，随时待命",
        "无需反复说出唤醒词，一次唤醒即可连续对话。\"播放周杰伦的歌\"，\"下一首\"，\"音量调到50%\"，电视准确理解上下文，一一执行。交流如真人般自然顺畅，彻底解放双手。",
        "方言识别，沟通零障碍",
        "支持四川话、粤语、上海话等多种方言识别，老人小孩都能轻松使用。姥姥用方言说\"我想看京剧\"，电视立刻调出戏曲频道；孩子奶声奶气说\"我要看佩奇\"，动画片即刻播放。",
        "智能家居中枢，一句话控全屋",
        "通过电视语音控制接入生态的灯光、空调、窗帘等设备。说\"我要看电影\"，电视自动调暗灯光、关闭窗帘、开启影院模式。语音交互让智慧家庭真正懂你，一句话掌控全屋。",
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_11200
     * @tc.name resourceExactDistributedContent001
     * @tc.desc Verify base, English and Chinese resolve the DistributedContent strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactDistributedContent001', 0, (): void => {
      const names: string[] = [
        'distributed_label_1',
        'distributed_content_1',
        'distributed_label_2',
        'distributed_content_2',
        'distributed_label_3',
        'distributed_content_3',
      ];
      assertExact(manager, names, [
        "Distributed Whiteboard, Inspiration Across Devices",
        "The distributed whiteboard breaks device silos, supporting simultaneous access from phones, tablets, and computers for multiple people. Draw greeting cards together during family gatherings, and annotate proposal sketches synchronously in work meetings. Strokes and shapes flow in real time, letting everyone see each other's changes as if in the same room, multiplying collaboration efficiency.",
        "Distributed Gallery, Memories Auto-Gathered",
        "Turn on the distributed gallery and family members' phone photos automatically sync to the TV family album. Children's growth moments and parents' travel footprints — no manual transfer needed, all beautiful moments captured by any device are intelligently organized by time and location. After meals, the whole family gathers before the big screen to relive those warm moments.",
        "Distributed Camera, Multi-Dimensional Vision Extension",
        "During video calls, you can invoke the phone camera to let faraway parents see children's drawings clearly. When exercising at home, connect a smart camera for AI real-time motion capture and correction. The distributed camera lets the TV use lenses from other devices, unlocking new possibilities for smart living.",
      ]);
      assertExactInLocale('en_US', names, [
        "Distributed Whiteboard, Inspiration Across Devices",
        "The distributed whiteboard breaks device silos, supporting simultaneous access from phones, tablets, and computers for multiple people. Draw greeting cards together during family gatherings, and annotate proposal sketches synchronously in work meetings. Strokes and shapes flow in real time, letting everyone see each other's changes as if in the same room, multiplying collaboration efficiency.",
        "Distributed Gallery, Memories Auto-Gathered",
        "Turn on the distributed gallery and family members' phone photos automatically sync to the TV family album. Children's growth moments and parents' travel footprints — no manual transfer needed, all beautiful moments captured by any device are intelligently organized by time and location. After meals, the whole family gathers before the big screen to relive those warm moments.",
        "Distributed Camera, Multi-Dimensional Vision Extension",
        "During video calls, you can invoke the phone camera to let faraway parents see children's drawings clearly. When exercising at home, connect a smart camera for AI real-time motion capture and correction. The distributed camera lets the TV use lenses from other devices, unlocking new possibilities for smart living.",
      ]);
      assertExactInLocale('zh_CN', names, [
        "分布式白板，灵感跨端挥洒",
        "分布式白板打破设备孤岛，支持手机、平板、电脑多人同时接入。家庭聚会时一起绘制贺卡，工作会议中同步批注方案草图。笔迹、图形实时流转，每个人都能看见彼此的修改，如同共处一室挥洒创意，让协作效率倍增。",
        "分布式图库，回忆自动汇聚",
        "开启分布式图库，家人手机中的照片自动同步至电视家庭相册。孩子的成长点滴、父母的旅行足迹，无需手动传输，所有设备拍摄的美好瞬间都会按时间地点智能归类。茶余饭后，全家围坐大屏前，一起重温那些温馨时刻。",
        "分布式相机，视界多维延伸",
        "视频通话时可调用手机摄像头，让远方父母看清孩子的涂鸦；居家健身时连接智能摄像头，AI实时捕捉动作并进行矫正。分布式相机让电视调用其他设备的镜头，解锁更多智慧生活新可能。",
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_11300
     * @tc.name resourceExactMediaContent001
     * @tc.desc Verify base, English and Chinese resolve the MediaContent strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactMediaContent001', 0, (): void => {
      const names: string[] = [
        'media_label_1',
        'media_content_1',
        'media_label_2',
        'media_content_2',
        'media_label_3',
        'media_content_3',
      ];
      assertExact(manager, names, [
        "Immersive Audio-Visual, Living Room Transforms into Private Cinema",
        "Equipped with a 4K high-definition picture engine and high-quality sound system, viewing experiences are enhanced. Dark scene details are clearly rendered and colors are vibrant and vivid.",
        "Massive Content Aggregation, Something for Everyone",
        "Integrates resources from mainstream video platforms — movies, TV series, variety shows, documentaries, and children's animation all in one place. Based on family members' viewing habits, the intelligent recommendation algorithm customizes exclusive content pages for everyone. The period dramas parents follow, the educational cartoons children watch, the classic films you want to catch up on — find them all when you turn on the TV. No more fighting over the remote, let every family member's leisure time be well spent.",
        "Karaoke Entertainment Upgrade, Party Vibe Anytime",
        "Built-in professional karaoke system with a massive library of licensed backing tracks continuously updated, from classic oldies to trending hits covering everything. Supports dual microphone connection, intelligent scoring, reverb adjustment, one-touch vocal removal and more — heating up family gatherings instantly. Friends visiting, family birthdays, no need to go to a KTV, sing your heart out in the living room and turn every reunion into an unforgettable joyful party.",
      ]);
      assertExactInLocale('en_US', names, [
        "Immersive Audio-Visual, Living Room Transforms into Private Cinema",
        "Equipped with a 4K high-definition picture engine and high-quality sound system, viewing experiences are enhanced. Dark scene details are clearly rendered and colors are vibrant and vivid.",
        "Massive Content Aggregation, Something for Everyone",
        "Integrates resources from mainstream video platforms — movies, TV series, variety shows, documentaries, and children's animation all in one place. Based on family members' viewing habits, the intelligent recommendation algorithm customizes exclusive content pages for everyone. The period dramas parents follow, the educational cartoons children watch, the classic films you want to catch up on — find them all when you turn on the TV. No more fighting over the remote, let every family member's leisure time be well spent.",
        "Karaoke Entertainment Upgrade, Party Vibe Anytime",
        "Built-in professional karaoke system with a massive library of licensed backing tracks continuously updated, from classic oldies to trending hits covering everything. Supports dual microphone connection, intelligent scoring, reverb adjustment, one-touch vocal removal and more — heating up family gatherings instantly. Friends visiting, family birthdays, no need to go to a KTV, sing your heart out in the living room and turn every reunion into an unforgettable joyful party.",
      ]);
      assertExactInLocale('zh_CN', names, [
        "沉浸式视听，客厅变身私人影院",
        "搭载4K超高清画质引擎与影院级音效系统，让每一次观影都身临其境。暗场细节层次分明，亮部色彩鲜活通透，配合杜比全景声的立体环绕音效，无论是科幻大片的宇宙激战，还是文艺电影的雨滴落地，都能精准还原导演镜头下的每一个情绪细节。关灯，打开电视，客厅即刻升级为专属家庭影院。",
        "海量内容聚合，全家人各有所爱",
        "整合主流视频平台资源，电影、电视剧、综艺、纪录片、少儿动漫一站式配齐。基于家庭成员的观看习惯，智能推荐算法为每个人定制专属内容页。爸妈追的年代剧、孩子看的启蒙动画、你想补档的经典老片，打开电视就能找到，不再为遥控器争夺发愁，让全家人的闲暇时光各得其所。",
        "K歌娱乐升级，聚会氛围随时点燃",
        "内置专业卡拉OK系统，海量正版伴奏曲库持续更新，从经典老歌到抖音热曲一应俱全。支持双麦克风连接，智能评分、混响调节、一键消原唱等功能，让家庭聚会瞬间升温。朋友来做客、家人过生日，不用转场KTV，在客厅就能尽情欢唱，把每一次团聚都变成难忘的欢乐派对。",
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_11400
     * @tc.name resourceExactChildcareContent001
     * @tc.desc Verify base, English and Chinese resolve the ChildcareContent strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactChildcareContent001', 0, (): void => {
      const names: string[] = [
        'childcare_label_1',
        'childcare_content_1',
        'childcare_label_2',
        'childcare_content_2',
      ];
      assertExact(manager, names, [
        "Healthy Eye Protection, Balance Fun and Health",
        "Features distance sensing and duration control — when children get too close to the screen, an automatic pop-up reminder appears and brightness decreases. When cumulative viewing reaches the set duration, the TV gently reminds them to rest and locks the screen. Also supports blue light filtering mode to reduce blue light damage to children's eyesight, protecting from three aspects of viewing distance, time, and lighting, letting children enjoy screen time healthily.",
        "Interactive Growth Guidance, Learn Through Play",
        "Integrates interactive educational content such as voice Q&A, animated picture books, and educational games, embedding knowledge into fun interactions to stimulate children's learning interest. Parents can view children's viewing and learning records via mobile phone, understand interest preferences and growth progress, and push customized educational content — transforming the TV from an entertainment tool into a smart companion that supports children's growth.",
      ]);
      assertExactInLocale('en_US', names, [
        "Healthy Eye Protection, Balance Fun and Health",
        "Features distance sensing and duration control — when children get too close to the screen, an automatic pop-up reminder appears and brightness decreases. When cumulative viewing reaches the set duration, the TV gently reminds them to rest and locks the screen. Also supports blue light filtering mode to reduce blue light damage to children's eyesight, protecting from three aspects of viewing distance, time, and lighting, letting children enjoy screen time healthily.",
        "Interactive Growth Guidance, Learn Through Play",
        "Integrates interactive educational content such as voice Q&A, animated picture books, and educational games, embedding knowledge into fun interactions to stimulate children's learning interest. Parents can view children's viewing and learning records via mobile phone, understand interest preferences and growth progress, and push customized educational content — transforming the TV from an entertainment tool into a smart companion that supports children's growth.",
      ]);
      assertExactInLocale('zh_CN', names, [
        "健康用眼守护，平衡娱乐与健康",
        "具备距离感应与时长管控功能，孩子离屏幕过近时自动弹窗提醒并降低亮度，累计观看达到设定时长后，电视会温和提示休息并锁定画面。同时支持蓝光过滤模式，减少屏幕蓝光对孩子视力的伤害，从用眼距离、时间、光线三方面守护，让孩子健康享受观影时光。",
        "互动成长引导，边玩边学更高效",
        "融合互动式教育内容，如语音问答、动画绘本、益智游戏等，将知识融入趣味互动中，激发孩子学习兴趣。家长可通过手机端查看孩子的观看与学习记录，了解兴趣偏好与成长进度，还能推送定制化教育内容，让电视从娱乐工具转变为助力孩子成长的智能伙伴",
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_11500
     * @tc.name resourceExactOfficeContent001
     * @tc.desc Verify base, English and Chinese resolve the OfficeContent strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactOfficeContent001', 0, (): void => {
      const names: string[] = [
        'office_label_1',
        'office_content_1',
        'office_label_2',
        'office_content_2',
        'office_label_3',
        'office_content_3',
      ];
      assertExact(manager, names, [
        "Big Screen Document Processing, Broader View",
        "Project documents, spreadsheets, and presentations from your laptop to the TV big screen with one tap, saying goodbye to prolonged hunching over a small screen. 4K ultra-clear quality renders text sharp and clear, with data chart details fully visible. Whether reviewing hundred-page reports, proofreading complex spreadsheets, or revising design drafts, the big screen presentation makes information clear at a glance, doubling office efficiency.",
        "Wireless Presentation, Smoother Meetings",
        "Supports Miracast, DLNA and other wireless casting protocols — no tedious wiring needed, quickly project proposals to the TV before meetings begin. Presenters can walk freely in the meeting room, use the pointing remote to flip pages and annotate, circling key content in real time. Client visits or team discussions no longer need crowding around a small screen, making every presentation confident and composed.",
        "Split-Screen Collaboration, Multi-Tasking in Parallel",
        "TV supports split-screen display — run a video conference on one side while showing relevant documents on the other. During remote communication, the other party's video and discussion content are displayed on the same screen, no frequent window switching needed. Team members can join simultaneously, share screens, and annotate together — remote collaboration feels like face-to-face interaction, breaking through spatial limitations.",
      ]);
      assertExactInLocale('en_US', names, [
        "Big Screen Document Processing, Broader View",
        "Project documents, spreadsheets, and presentations from your laptop to the TV big screen with one tap, saying goodbye to prolonged hunching over a small screen. 4K ultra-clear quality renders text sharp and clear, with data chart details fully visible. Whether reviewing hundred-page reports, proofreading complex spreadsheets, or revising design drafts, the big screen presentation makes information clear at a glance, doubling office efficiency.",
        "Wireless Presentation, Smoother Meetings",
        "Supports Miracast, DLNA and other wireless casting protocols — no tedious wiring needed, quickly project proposals to the TV before meetings begin. Presenters can walk freely in the meeting room, use the pointing remote to flip pages and annotate, circling key content in real time. Client visits or team discussions no longer need crowding around a small screen, making every presentation confident and composed.",
        "Split-Screen Collaboration, Multi-Tasking in Parallel",
        "TV supports split-screen display — run a video conference on one side while showing relevant documents on the other. During remote communication, the other party's video and discussion content are displayed on the same screen, no frequent window switching needed. Team members can join simultaneously, share screens, and annotate together — remote collaboration feels like face-to-face interaction, breaking through spatial limitations.",
      ]);
      assertExactInLocale('zh_CN', names, [
        "大屏文档处理，视野更开阔",
        "将笔记本电脑的文档、表格、演示文稿一键投射至电视大屏，告别长时间低头伏案的疲惫。4K超清画质让文字锐利清晰，数据图表细节分毫毕现。无论是审阅百页报告、校对复杂报表，还是修改设计稿，大屏呈现让信息一目了然，办公效率倍增。",
        "无线投屏演示，会议更流畅",
        "支持Miracast、DLNA等多种无线投屏协议，无需繁琐接线，会议开始前即可快速将方案投射至电视。演讲者在会议室自由走动，用指向遥控翻页批注，重点内容实时圈画。客户到访或团队讨论，无需围挤在小屏幕前，让每一次演示都从容自信。",
        "分屏协作模式，多任务并行",
        "电视支持分屏显示功能，一边开启视频会议，一边展示相关文档资料。远程沟通时，对方画面与讨论内容同屏呈现，无需频繁切换窗口。团队成员可同时接入，共享屏幕、共同批注，异地协作如同面对面，让办公突破空间限制。",
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_11600
     * @tc.name resourceExactProductSpecifications001
     * @tc.desc Verify base, English and Chinese resolve the ProductSpecifications strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactProductSpecifications001', 0, (): void => {
      const names: string[] = [
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
      ];
      assertExact(manager, names, [
        "Screen Size",
        "75-inch 4K Ultra HD",
        "Display Technology",
        "MiniLED Full Array Backlight",
        "Operating System",
        "Memory Configuration",
        "4GB+64GB",
        "Processor",
        "Interface Configuration",
        "HDMI 2.1",
        "27-inch 1080P",
        "GK6320",
        "GK6780V100",
        "OpenHarmony 5.1",
      ]);
      assertExactInLocale('en_US', names, [
        "Screen Size",
        "75-inch 4K Ultra HD",
        "Display Technology",
        "MiniLED Full Array Backlight",
        "Operating System",
        "Memory Configuration",
        "4GB+64GB",
        "Processor",
        "Interface Configuration",
        "HDMI 2.1",
        "27-inch 1080P",
        "GK6320",
        "GK6780V100",
        "OpenHarmony 5.1",
      ]);
      assertExactInLocale('zh_CN', names, [
        "屏幕尺寸",
        "75英寸 4K超清",
        "显示技术",
        "MiniLED全阵列背光",
        "操作系统",
        "内存配置",
        "4GB+64GB",
        "处理器",
        "接口配置",
        "HDMI2.1",
        "27英寸 1080P",
        "GK6320",
        "GK6780V100",
        "OpenHarmony5.1",
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_11700
     * @tc.name resourceExactMediaFeatureTitles001
     * @tc.desc Verify base, English and Chinese resolve the MediaFeatureTitles strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactMediaFeatureTitles001', 0, (): void => {
      const names: string[] = [
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
      ];
      assertExact(manager, names, [
        "4K Demo Video - Nature Scenery",
        "Dolby Atmos Sound",
        "Smart Sound Field",
        "Voice Enhancement",
        "HDR Support",
        "HDR10+, Dolby Vision",
        "Refresh Rate",
        "120Hz MEMC",
        "Color Depth",
        "1.07 Billion Colors",
        "Contrast Ratio",
        "1,000,000:1",
      ]);
      assertExactInLocale('en_US', names, [
        "4K Demo Video - Nature Scenery",
        "Dolby Atmos Sound",
        "Smart Sound Field",
        "Voice Enhancement",
        "HDR Support",
        "HDR10+, Dolby Vision",
        "Refresh Rate",
        "120Hz MEMC",
        "Color Depth",
        "1.07 Billion Colors",
        "Contrast Ratio",
        "1,000,000:1",
      ]);
      assertExactInLocale('zh_CN', names, [
        "4K演示视频 - 自然风光",
        "杜比全景声",
        "智能音场",
        "语音增强",
        "HDR支持",
        "HDR10+, Dolby Vision",
        "刷新率",
        "120Hz MEMC",
        "色彩深度",
        "10.7亿色",
        "对比度",
        "1000000:1",
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_11800
     * @tc.name resourceExactAudioVideo001
     * @tc.desc Verify base, English and Chinese resolve the AudioVideo strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactAudioVideo001', 0, (): void => {
      const names: string[] = [
        'audio_visual_experience',
        '4K_demo_video',
        'Audio_characteristics',
        'Technical_Specifications',
        'Sound_system',
        'Dolby_Atmos',
      ];
      assertExact(manager, names, [
        "Audio-Visual Experience",
        "4K Demo Video",
        "Audio Characteristics",
        "Technical Specifications",
        "Sound System",
        "Dolby Atmos",
      ]);
      assertExactInLocale('en_US', names, [
        "Audio-Visual Experience",
        "4K Demo Video",
        "Audio Characteristics",
        "Technical Specifications",
        "Sound System",
        "Dolby Atmos",
      ]);
      assertExactInLocale('zh_CN', names, [
        "影音体验",
        "4K演示视频",
        "音频特性",
        "技术规格",
        "音效系统",
        "杜比音效",
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_11900
     * @tc.name resourceExactEnergy001
     * @tc.desc Verify base, English and Chinese resolve the Energy strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactEnergy001', 0, (): void => {
      const names: string[] = [
        'energy_efficiency_rating',
        'Class_1_Energy_Efficiency',
      ];
      assertExact(manager, names, [
        "Energy Efficiency Rating",
        "Class 1 Energy Efficiency",
      ]);
      assertExactInLocale('en_US', names, [
        "Energy Efficiency Rating",
        "Class 1 Energy Efficiency",
      ]);
      assertExactInLocale('zh_CN', names, [
        "能效等级",
        "一级能效",
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_12000
     * @tc.name resourceExactErrorMessages001
     * @tc.desc Verify base, English and Chinese resolve the ErrorMessages strings to their shipped literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExactErrorMessages001', 0, (): void => {
      const names: string[] = [
        'error_screen_params_invalid',
        'error_get_screen_size_failed',
        'error_screensaver_failed',
      ];
      assertExact(manager, names, [
        "Invalid screen parameters",
        "Failed to get screen size",
        "Failed to jump to screensaver",
      ]);
      assertExactInLocale('en_US', names, [
        "Invalid screen parameters",
        "Failed to get screen size",
        "Failed to jump to screensaver",
      ]);
      assertExactInLocale('zh_CN', names, [
        "屏幕参数无效",
        "获取屏幕尺寸失败",
        "跳屏保失败",
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_9800
     * @tc.name resourceExhaustiveTranslationDifference
     * @tc.desc Verify every localized string actually differs between English and Chinese
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExhaustiveTranslationDifference', 0, (): void => {
      const names: string[] = [

        '4K_demo_video',
        'Audio_characteristics',
        'Class_1_Energy_Efficiency',
        'Dolby_Atmos',
        'Function_Directory',
        'Product_Specifications',
        'Smart_Life',
        'Sound_system',
        'Technical_Specifications',
        'ai_content_1',
        'ai_content_2',
        'ai_content_3',
        'ai_label_1',
        'ai_label_2',
        'ai_label_3',
        'audio_visual_experience',
        'cast_content_1',
        'cast_content_2',
        'cast_content_3',
        'cast_label_1',
        'cast_label_2',
        'cast_label_3',
        'childcare_content_1',
        'childcare_content_2',
        'childcare_label_1',
        'childcare_label_2',
        'distributed_content_1',
        'distributed_content_2',
        'distributed_content_3',
        'distributed_label_1',
        'distributed_label_2',
        'distributed_label_3',
        'energy_efficiency_rating',
        'error_get_screen_size_failed',
        'error_screen_params_invalid',
        'error_screensaver_failed',
        'feature_distributed',
        'feature_distributed_desc',
        'feature_pointing_remote',
        'feature_pointing_remote_desc',
        'feature_screen_cast',
        'feature_screen_cast_desc',
        'feature_smart_ai',
        'feature_smart_ai_desc',
        'feature_smart_screensaver',
        'feature_smart_screensaver_desc',
        'feature_universal_interconnection',
        'feature_universal_interconnection_desc',
        'feature_voice_interaction',
        'feature_voice_interaction_desc',
        'inter_content_1',
        'inter_content_2',
        'inter_content_3',
        'inter_label_1',
        'inter_label_2',
        'inter_label_3',
        'media_1000000_1',
        'media_1_07_billion_colors',
        'media_4k_demo_title',
        'media_color_depth',
        'media_content_1',
        'media_content_2',
        'media_content_3',
        'media_contrast_ratio',
        'media_dolby_atmos_sound',
        'media_hdr_support',
        'media_label_1',
        'media_label_2',
        'media_label_3',
        'media_refresh_rate',
        'media_smart_sound_field',
        'media_voice_enhancement',
        'office_content_1',
        'office_content_2',
        'office_content_3',
        'office_label_1',
        'office_label_2',
        'office_label_3',
        'pointing_content_1',
        'pointing_content_2',
        'pointing_content_3',
        'pointing_label_1',
        'pointing_label_2',
        'pointing_label_3',
        'product_27inch_1080p',
        'product_75inch_4k',
        'product_display_tech',
        'product_hdmi21',
        'product_interface_config',
        'product_memory_config',
        'product_miniled_backlight',
        'product_openharmony',
        'product_os',
        'product_processor',
        'product_screen_size',
        'screensaver_content_1',
        'screensaver_content_2',
        'screensaver_content_3',
        'screensaver_label_1',
        'screensaver_label_2',
        'screensaver_label_3',
        'smartlife_child_care',
        'smartlife_child_care_desc',
        'smartlife_efficient_office',
        'smartlife_efficient_office_desc',
        'smartlife_entertainment_av',
        'smartlife_entertainment_av_desc',
        'tab_function_features',
        'tab_service_support',
        'voice_content_1',
        'voice_content_2',
        'voice_content_3',
        'voice_label_1',
        'voice_label_2',
        'voice_label_3',
      ];
      const englishResolver: resourceManager.ResourceManager = createLocaleManager('en_US');
      const chineseResolver: resourceManager.ResourceManager = createLocaleManager('zh_CN');
      const english: string[] = resolveNames(englishResolver, names);
      const chinese: string[] = resolveNames(chineseResolver, names);
      for (let index: number = 0; index < names.length; index++) {
        expect(english[index] === chinese[index]).assertFalse();
      }
      englishResolver.release();
      chineseResolver.release();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_EXHAUSTIVE_9900
     * @tc.name resourceExhaustiveColorIntegrity
     * @tc.desc Verify packaged color resources resolve to their shipped ARGB literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceExhaustiveColorIntegrity', 0, (): void => {

      expect(manager.getColorByNameSync('start_window_background')).assertEqual(0xFFFFFFFF); // #FFFFFF
      expect(manager.getColorByNameSync('primary_text')).assertEqual(0xFF333333); // #333333
      expect(manager.getColorByNameSync('secondary_text')).assertEqual(0xFF666666); // #666666
      expect(manager.getColorByNameSync('primary_color')).assertEqual(0xFF0A59F7); // #0A59F7
    });
  });
}
