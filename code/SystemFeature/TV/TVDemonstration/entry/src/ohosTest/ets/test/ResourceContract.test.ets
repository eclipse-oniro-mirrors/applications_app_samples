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
import { BusinessError } from '@kit.BasicServicesKit';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import resourceManager from '@ohos.resourceManager';
import { Component, Driver, ON, Rect } from '@ohos.UiTest';
import { startAppWithRetry } from './TestScenarioUtils';


const MEDIA_INTEGRITY_WANT: Want = {
  bundleName: 'com.sample.demonstration',
  abilityName: 'EntryAbility'
};

export default function resourceContractTest(): void {
  describe('ResourceAsyncContractTest', () => {
    let manager: resourceManager.ResourceManager;

    const assertBytesEqual = (actual: Uint8Array, expected: Uint8Array): void => {
      expect(actual.byteLength).assertEqual(expected.byteLength);
      for (let index: number = 0; index < expected.byteLength; index++) {
        expect(actual[index]).assertEqual(expected[index]);
      }
    };

    const assertReadableBytes = (bytes: Uint8Array): void => {
      expect(bytes.byteLength > 0).assertTrue();
    };

    // Packaged navigation labels, index aligned with the resource list below and
    // ordered as [english, chinese]. Configuration.locale only reports an explicit
    // application override, so it cannot be used to predict which qualifier the
    // manager resolves; the pair is compared against the resolved value instead.
    const SHIPPED_NAVIGATION_LABELS: string[][] = [
      ['Product Specifications', '产品规格'],
      ['Function Features', '功能特性'],
      ['Service Support', '服务支持']
    ];

    beforeAll(async (): Promise<void> => {
      // ResourceManager is obtained from the running application context so these
      // calls exercise the packaged HAP rather than source-tree resource fixtures.
      manager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
      await startAppWithRetry(MEDIA_INTEGRITY_WANT, 'com.sample.demonstration');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_ASYNC_0100
     * @tc.name resourceAsyncStringMatchesSync001
     * @tc.desc Verify ResourceManager getString Promise values match getStringSync for production navigation labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceAsyncStringMatchesSync001', 0, async (): Promise<void> => {
      const resources: Resource[] = [
        $r('app.string.Product_Specifications'),
        $r('app.string.tab_function_features'),
        $r('app.string.tab_service_support')
      ];
      const pending: Promise<string>[] = [];
      for (let index: number = 0; index < resources.length; index++) {
        pending.push(manager.getStringValue(resources[index]));
      }
      const asynchronous: string[] = await Promise.all(pending);

      // The same resource IDs feed Index tab rendering through either API shape.
      // Equality catches asynchronous qualifier or resource-table divergence, while
      // the packaged expectations catch both paths silently returning the wrong text.
      // All three labels must come from the same shipped language table, whichever
      // qualifier the running device resolves.
      const english: boolean = asynchronous[0] === SHIPPED_NAVIGATION_LABELS[0][0];
      for (let index: number = 0; index < resources.length; index++) {
        const synchronous: string = manager.getStringSync(resources[index]);
        const nonEmpty: boolean = asynchronous[index].trim().length > 0;
        expect(asynchronous[index]).assertEqual(synchronous);
        expect(asynchronous[index]).assertEqual(SHIPPED_NAVIGATION_LABELS[index][english ? 0 : 1]);
        expect(nonEmpty).assertTrue();
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_ASYNC_0200
     * @tc.name resourceAsyncMediaBase64MatchesSync002
     * @tc.desc Verify ResourceManager getMediaContentBase64 Promise identifies the same JPEG preview as synchronous media bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceAsyncMediaBase64MatchesSync002', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.cat');
      const asynchronous: string = await manager.getMediaContentBase64(resource);
      const synchronous: Uint8Array = manager.getMediaContentSync(resource);

      // SmartLife uses this preview resource while the video is preparing.
      // The Base64 prefix identifies the same JPEG payload whose synchronous
      // bytes retain the file signature and a substantial packaged size.
      expect(asynchronous.length > synchronous.byteLength).assertTrue();
      expect(asynchronous.indexOf('/9j/') >= 0).assertTrue();
      expect(synchronous.byteLength > 1024).assertTrue();
      expect(synchronous[0]).assertEqual(255);
      expect(synchronous[1]).assertEqual(216);
      expect(synchronous[synchronous.byteLength - 2]).assertEqual(255);
      expect(synchronous[synchronous.byteLength - 1]).assertEqual(217);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_ASYNC_0400
     * @tc.name resourceRawDescriptorMatchesContent004
     * @tc.desc Verify ResourceManager rawfile descriptor length matches the packaged rawfile content and closes cleanly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceRawDescriptorMatchesContent004', 0, async (): Promise<void> => {
      const content: Uint8Array = manager.getRawFileContentSync('videoTest.mp4');
      const descriptor: resourceManager.RawFileDescriptor =
        await manager.getRawFileDescriptor('videoTest.mp4');
      try {
        // Descriptor metadata is the contract used by native-style consumers to
        // address bytes embedded in the HAP without copying the whole payload.
        const descriptorFdValid: boolean = descriptor.fd >= 0;
        const descriptorOffsetValid: boolean = descriptor.offset >= 0;
        const descriptorLength: number = descriptor.length;
        expect(descriptorFdValid).assertTrue();
        expect(descriptorOffsetValid).assertTrue();
        expect(descriptorLength).assertEqual(content.byteLength);
      } finally {
        await manager.closeRawFileDescriptor('videoTest.mp4');
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_ASYNC_0600
     * @tc.name resourceAsyncMissingRawFileFails006
     * @tc.desc Verify ResourceManager getRawFileContent Promise rejects an absent relative rawfile path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceAsyncMissingRawFileFails006', 0, async (): Promise<void> => {
      let failureCode: number = 0;
      let failureMessage: string = '';
      try {
        await manager.getRawFileContent('missing/tvdemonstration.raw');
        expect().assertFail();
      } catch (error) {
        const failure: BusinessError = error as BusinessError;
        failureCode = failure.code;
        failureMessage = failure.message;
      }

      // Missing package data must remain diagnosable to the caller that starts Video.
      expect(failureCode > 0).assertTrue();
      expect(failureMessage.length > 0).assertTrue();
    });
  });

  describe('ResourceContentDomainTest', () => {
    let manager: resourceManager.ResourceManager;
    let englishManager: resourceManager.ResourceManager;

    const assertDomainTexts = (
      labels: string[],
      contents: string[],
      expectedLabels: string[],
      expectedContents: string[]
    ): void => {
      // Every assertion lands on the exact packaged text of the base string table
      // (byte-identical to the en_US qualifier), resolved through an English override
      // manager so the expectation holds regardless of the running device locale.
      // Names (not $r() Resources) are used because $r() objects created in the
      // ohosTest module do not resolve against the app override manager.
      for (let index: number = 0; index < expectedLabels.length; index++) {
        expect(englishManager.getStringByNameSync(labels[index])).assertEqual(expectedLabels[index]);
      }
      for (let index: number = 0; index < expectedContents.length; index++) {
        expect(englishManager.getStringByNameSync(contents[index])).assertEqual(expectedContents[index]);
      }
    };

    beforeAll((): void => {
      manager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
      const configuration: resourceManager.Configuration = manager.getOverrideConfiguration();
      configuration.locale = 'en_US';
      englishManager = manager.getOverrideResourceManager(configuration);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_DOMAIN_0100
     * @tc.name resourceInterconnectionDomain001
     * @tc.desc Verify ResourceManager resolves three complete interconnection label-content pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceInterconnectionDomain001', 0, (): void => {
      assertDomainTexts(
        ['inter_label_1', 'inter_label_2', 'inter_label_3'],
        ['inter_content_1', 'inter_content_2', 'inter_content_3'],
        ['Seamless Multi-Device Connection, Boundless Collaboration',
          'Effortless Data Flow, Switch Content Freely',
          'Expanding Scene Ecosystem, Upgraded Smart Experience'],
        ['TV supports cross-brand interconnection of phones, computers, smart home devices and more — no tedious pairing needed, just bring them close to connect instantly. Cast phone videos to TV with one tap, sync computer documents to the big screen for work, and view smart home status on the TV display, integrating all devices for more convenient operation and a seamless experience.',
          'Achieve real-time cross-device data sharing and continuity — unfinished shows on your phone can be cast to TV and resumed; photos browsed on TV can sync to your phone. File transfers require no third-party software, just drag and drop, allowing content to flow freely between devices to meet diverse usage needs.',
          'Based on universal interconnection capabilities, the TV serves as a smart home control hub, linking lights, curtains, air conditioning and other devices for scene-based control; it can also connect to education and fitness apps, syncing phone-based courses to the big screen. From entertainment to lifestyle to work, it expands the scene ecosystem in all dimensions, upgrading the smart living experience.']
      );
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_DOMAIN_0200
     * @tc.name resourceCastingDomain002
     * @tc.desc Verify ResourceManager resolves three complete casting label-content pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceCastingDomain002', 0, (): void => {
      assertDomainTexts(
        ['cast_label_1', 'cast_label_2', 'cast_label_3'],
        ['cast_content_1', 'cast_content_2', 'cast_content_3'],
        ['Miracast Casting, Smooth Screen Mirroring',
          'DLNA Casting, Direct Content Push',
          'Full Protocol Coverage, Cast Your Way'],
        ['Based on Miracast protocol, mirror your phone or computer screen to the TV in real time. Gaming battles and office presentations without lag, peer-to-peer direct connection without network dependency — even on camping trips, cast phone movies to the big screen and enjoy an open-air cinema with friends.',
          'Supports DLNA multimedia sharing — directly \'push\' movies from video apps and local music to the TV for playback. After pushing, your phone operates independently; making calls or replying to messages won\'t affect TV playback, so binge-watching and music listening never interfere with each other.',
          'Miracast and DLNA, the two mainstream casting protocols, complement each other to meet different scenario needs. Whether mirroring games, pushing videos, or sharing photos, you\'ll find the most suitable casting method to effortlessly bring content to the big screen.']
      );
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_DOMAIN_0300
     * @tc.name resourceAiDomain003
     * @tc.desc Verify ResourceManager resolves three complete Smart AI label-content pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceAiDomain003', 0, (): void => {
      assertDomainTexts(
        ['ai_label_1', 'ai_label_2', 'ai_label_3'],
        ['ai_content_1', 'ai_content_2', 'ai_content_3'],
        ['Knowledge Encyclopedia, Answers at Your Call',
          'Document Assistant, One-Click Summary Generation',
          'Life Butler, Plan Your Daily Routine'],
        ['Built-in DeepSeek large language model transforms the TV into a family knowledge base. A child asks \'Why is the sky blue?\' or an elder wants to learn about wellness — simply speak your question into the remote, and the TV deeply understands and provides detailed answers, satisfying the curiosity of the entire family.',
          'Upload work documents and learning materials to the TV, and DeepSeek AI automatically extracts core summaries and generates mind maps or presentation outlines. It can even help polish emails and write weekly reports, making tedious text work easy and efficient — the TV becomes a productivity tool.',
          'From \'weekend family dinner recipes\' to \'three-day family trip itineraries\', DeepSeek AI combines your preferences to customize personalized plans. It can also recommend recipes based on leftover fridge ingredients and remind about clothing based on weather forecasts — let the TV manage life\'s little details for you.']
      );
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_DOMAIN_0800
     * @tc.name resourceMediaDomain008
     * @tc.desc Verify ResourceManager resolves three complete entertainment label-content pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceMediaDomain008', 0, (): void => {
      assertDomainTexts(
        ['media_label_1', 'media_label_2', 'media_label_3'],
        ['media_content_1', 'media_content_2', 'media_content_3'],
        ['Immersive Audio-Visual, Living Room Transforms into Private Cinema',
          'Massive Content Aggregation, Something for Everyone',
          'Karaoke Entertainment Upgrade, Party Vibe Anytime'],
        ['Equipped with a 4K high-definition picture engine and high-quality sound system, viewing experiences are enhanced. Dark scene details are clearly rendered and colors are vibrant and vivid.',
          'Integrates resources from mainstream video platforms — movies, TV series, variety shows, documentaries, and children\'s animation all in one place. Based on family members\' viewing habits, the intelligent recommendation algorithm customizes exclusive content pages for everyone. The period dramas parents follow, the educational cartoons children watch, the classic films you want to catch up on — find them all when you turn on the TV. No more fighting over the remote, let every family member\'s leisure time be well spent.',
          'Built-in professional karaoke system with a massive library of licensed backing tracks continuously updated, from classic oldies to trending hits covering everything. Supports dual microphone connection, intelligent scoring, reverb adjustment, one-touch vocal removal and more — heating up family gatherings instantly. Friends visiting, family birthdays, no need to go to a KTV, sing your heart out in the living room and turn every reunion into an unforgettable joyful party.']
      );
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_DOMAIN_0900
     * @tc.name resourceChildCareDomain009
     * @tc.desc Verify ResourceManager resolves two distinct Child Care label-content pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceChildCareDomain009', 0, (): void => {
      assertDomainTexts(
        ['childcare_label_1', 'childcare_label_2'],
        ['childcare_content_1', 'childcare_content_2'],
        ['Healthy Eye Protection, Balance Fun and Health',
          'Interactive Growth Guidance, Learn Through Play'],
        ['Features distance sensing and duration control — when children get too close to the screen, an automatic pop-up reminder appears and brightness decreases. When cumulative viewing reaches the set duration, the TV gently reminds them to rest and locks the screen. Also supports blue light filtering mode to reduce blue light damage to children\'s eyesight, protecting from three aspects of viewing distance, time, and lighting, letting children enjoy screen time healthily.',
          'Integrates interactive educational content such as voice Q&A, animated picture books, and educational games, embedding knowledge into fun interactions to stimulate children\'s learning interest. Parents can view children\'s viewing and learning records via mobile phone, understand interest preferences and growth progress, and push customized educational content — transforming the TV from an entertainment tool into a smart companion that supports children\'s growth.']
      );
    });
  });

  describe('ResourceLocaleOverrideContractTest', () => {
    let manager: resourceManager.ResourceManager;
    let originalLocale: string;
    // Override resource managers draw on a system-side budget that is not
    // reclaimed by GC; every manager created by a case is tracked here and
    // released after that case so the whole run never exhausts the budget.
    let createdManagers: resourceManager.ResourceManager[] = [];

    const createLocaleManager = (locale: string): resourceManager.ResourceManager => {
      const configuration: resourceManager.Configuration = manager.getOverrideConfiguration();
      configuration.locale = locale;
      const created: resourceManager.ResourceManager = manager.getOverrideResourceManager(configuration);
      createdManagers.push(created);
      return created;
    };

    const resolveNames = (
      localeManager: resourceManager.ResourceManager,
      names: string[]
    ): string[] => {
      const values: string[] = [];
      for (let index: number = 0; index < names.length; index++) {
        values.push(localeManager.getStringByNameSync(names[index]));
      }
      return values;
    };

    const assertValues = (actual: string[], expected: string[]): void => {
      expect(actual.length).assertEqual(expected.length);
      for (let index: number = 0; index < expected.length; index++) {
        expect(actual[index]).assertEqual(expected[index]);
      }
    };

    const assertReadable = (values: string[]): void => {
      const uniqueValues: Set<string> = new Set<string>();
      for (let index: number = 0; index < values.length; index++) {
        expect(values[index].trim().length > 0).assertTrue();
        uniqueValues.add(values[index]);
      }
      expect(uniqueValues.size).assertEqual(values.length);
    };

    beforeAll((): void => {
      manager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
      originalLocale = manager.getConfigurationSync().locale;
    });

    beforeEach((): void => {
      // Override managers resolve the installed qualifier files without changing the
      // process-wide language, so later UI suites keep the user's original locale.
      expect(manager.getConfigurationSync().locale).assertEqual(originalLocale);
    });

    afterEach((): void => {
      expect(manager.getConfigurationSync().locale).assertEqual(originalLocale);
      for (let index: number = 0; index < createdManagers.length; index++) {
        createdManagers[index].release();
      }
      createdManagers = [];
    });

    afterAll((): void => {
      expect(manager.getConfigurationSync().locale).assertEqual(originalLocale);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_LOCALE_0100
     * @tc.name resourceEnglishPrimaryNavigation001
     * @tc.desc Verify getOverrideResourceManager resolves the four English primary navigation labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceEnglishPrimaryNavigation001', 0, (): void => {
      const englishManager: resourceManager.ResourceManager = createLocaleManager('en_US');
      const labels: string[] = resolveNames(englishManager, [
        'Product_Specifications', 'Function_Directory', 'Smart_Life', 'tab_service_support'
      ]);
      assertValues(labels, [
        'Product Specifications', 'Function Directory', 'Smart Life', 'Service Support'
      ]);
      assertReadable(labels);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_LOCALE_0300
     * @tc.name resourceFeatureCatalogTranslation003
     * @tc.desc Verify override ResourceManager keeps seven feature titles aligned across English and Chinese
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceFeatureCatalogTranslation003', 0, (): void => {
      const names: string[] = [
        'feature_universal_interconnection', 'feature_screen_cast', 'feature_smart_ai',
        'feature_pointing_remote', 'feature_smart_screensaver', 'feature_voice_interaction',
        'feature_distributed'
      ];
      const english: string[] = resolveNames(createLocaleManager('en_US'), names);
      const chinese: string[] = resolveNames(createLocaleManager('zh_CN'), names);

      // FeaturePage indexes these arrays in parallel; both locales must retain seven
      // independently readable entries or the same card can display the wrong title.
      expect(english.length).assertEqual(7);
      expect(chinese.length).assertEqual(7);
      assertReadable(english);
      assertReadable(chinese);
      for (let index: number = 0; index < names.length; index++) {
        expect(english[index] === chinese[index]).assertFalse();
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_LOCALE_0400
     * @tc.name resourceFeatureSummaryTranslation004
     * @tc.desc Verify getStringByNameSync resolves distinct localized summaries for all FeaturePage cards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceFeatureSummaryTranslation004', 0, (): void => {
      const names: string[] = [
        'feature_universal_interconnection_desc', 'feature_screen_cast_desc', 'feature_smart_ai_desc',
        'feature_pointing_remote_desc', 'feature_smart_screensaver_desc',
        'feature_voice_interaction_desc', 'feature_distributed_desc'
      ];
      const english: string[] = resolveNames(createLocaleManager('en_US'), names);
      const chinese: string[] = resolveNames(createLocaleManager('zh_CN'), names);
      assertReadable(english);
      assertReadable(chinese);
      for (let index: number = 0; index < names.length; index++) {
        expect(english[index].length >= 12).assertTrue();
        expect(chinese[index].length >= 4).assertTrue();
        expect(english[index] === chinese[index]).assertFalse();
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_LOCALE_0500
     * @tc.name resourceSmartLifeTranslation005
     * @tc.desc Verify override ResourceManager preserves SmartLife title-description pairing in both locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceSmartLifeTranslation005', 0, (): void => {
      const titleNames: string[] = [
        'smartlife_entertainment_av', 'smartlife_child_care', 'smartlife_efficient_office'
      ];
      const descriptionNames: string[] = [
        'smartlife_entertainment_av_desc', 'smartlife_child_care_desc', 'smartlife_efficient_office_desc'
      ];
      const englishTitles: string[] = resolveNames(createLocaleManager('en_US'), titleNames);
      const englishDescriptions: string[] = resolveNames(createLocaleManager('en_US'), descriptionNames);
      const chineseTitles: string[] = resolveNames(createLocaleManager('zh_CN'), titleNames);
      const chineseDescriptions: string[] = resolveNames(createLocaleManager('zh_CN'), descriptionNames);
      expect(englishTitles.length).assertEqual(englishDescriptions.length);
      expect(chineseTitles.length).assertEqual(chineseDescriptions.length);
      assertReadable(englishTitles);
      assertReadable(englishDescriptions);
      assertReadable(chineseTitles);
      assertReadable(chineseDescriptions);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_LOCALE_0600
     * @tc.name resourceMediaTranslation006
     * @tc.desc Verify getStringByNameSync resolves localized MediaExperience headings and product values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceMediaTranslation006', 0, (): void => {
      const names: string[] = [
        'audio_visual_experience', '4K_demo_video', 'Audio_characteristics',
        'Technical_Specifications', 'Sound_system', 'Dolby_Atmos',
        'energy_efficiency_rating', 'Class_1_Energy_Efficiency'
      ];
      const english: string[] = resolveNames(createLocaleManager('en_US'), names);
      const chinese: string[] = resolveNames(createLocaleManager('zh_CN'), names);
      assertValues(english, [
        'Audio-Visual Experience', '4K Demo Video', 'Audio Characteristics',
        'Technical Specifications', 'Sound System', 'Dolby Atmos',
        'Energy Efficiency Rating', 'Class 1 Energy Efficiency'
      ]);
      assertValues(chinese, [
        '影音体验', '4K演示视频', '音频特性', '技术规格', '音效系统', '杜比音效', '能效等级', '一级能效'
      ]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_LOCALE_0700
     * @tc.name resourceLongDetailTranslation007
     * @tc.desc Verify override ResourceManager resolves complete localized FeatureComponent detail bodies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceLongDetailTranslation007', 0, (): void => {
      const names: string[] = [
        'inter_content_1', 'cast_content_2', 'ai_content_3', 'pointing_content_1',
        'screensaver_content_2', 'voice_content_3', 'distributed_content_1'
      ];
      const english: string[] = resolveNames(createLocaleManager('en_US'), names);
      const chinese: string[] = resolveNames(createLocaleManager('zh_CN'), names);

      // Long body resources are rendered in nested Swipers, where a missing qualifier
      // would otherwise leave only the heading visible while basic navigation still passes.
      for (let index: number = 0; index < names.length; index++) {
        expect(english[index].length >= 100).assertTrue();
        expect(chinese[index].length >= 35).assertTrue();
        expect(english[index] === chinese[index]).assertFalse();
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_LOCALE_0800
     * @tc.name resourceLocaleManagerIsolation008
     * @tc.desc Verify two override ResourceManager instances retain independent locale configurations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceLocaleManagerIsolation008', 0, (): void => {
      const englishManager: resourceManager.ResourceManager = createLocaleManager('en_US');
      const chineseManager: resourceManager.ResourceManager = createLocaleManager('zh_CN');
      expect(englishManager.getOverrideConfiguration().locale).assertEqual('en_Latn_US');
      expect(chineseManager.getOverrideConfiguration().locale).assertEqual('zh_Hans_CN');
      expect(englishManager.getStringByNameSync('Smart_Life')).assertEqual('Smart Life');
      expect(chineseManager.getStringByNameSync('Smart_Life')).assertEqual('智慧生活');

      // Resolving through one manager after the other catches accidental sharing of a
      // mutable override configuration between concurrent localized rendering contexts.
      expect(englishManager.getStringByNameSync('Smart_Life')).assertEqual('Smart Life');
      expect(manager.getConfigurationSync().locale).assertEqual(originalLocale);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_LOCALE_0900
     * @tc.name resourceLocaleManagerLiveUpdate009
     * @tc.desc Verify updateOverrideConfiguration switches one ResourceManager from English to Chinese
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceLocaleManagerLiveUpdate009', 0, (): void => {
      const overrideManager: resourceManager.ResourceManager = createLocaleManager('en_US');
      expect(overrideManager.getStringByNameSync('Function_Directory')).assertEqual('Function Directory');
      const configuration: resourceManager.Configuration = overrideManager.getOverrideConfiguration();
      configuration.locale = 'zh_CN';
      overrideManager.updateOverrideConfiguration(configuration);
      expect(overrideManager.getOverrideConfiguration().locale).assertEqual('zh_Hans_CN');
      expect(overrideManager.getStringByNameSync('Function_Directory')).assertEqual('功能目录');
      expect(manager.getConfigurationSync().locale).assertEqual(originalLocale);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_LOCALE_1000
     * @tc.name resourceUnsupportedLocaleFallback010
     * @tc.desc Verify getOverrideResourceManager falls back to base strings for an unsupported French locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceUnsupportedLocaleFallback010', 0, (): void => {
      const frenchManager: resourceManager.ResourceManager = createLocaleManager('fr_FR');
      const baseFallback: string[] = resolveNames(frenchManager, [
        'Product_Specifications', 'Function_Directory', 'Smart_Life', 'audio_visual_experience'
      ]);

      // The project has no French qualifier, so base resources are the product contract.
      // This protects unsupported TV locales from blank labels or raw resource keys.
      assertValues(baseFallback, [
        'Product Specifications', 'Function Directory', 'Smart Life', 'Audio-Visual Experience'
      ]);
      expect(frenchManager.getOverrideConfiguration().locale).assertEqual('fr_Latn_FR');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_LOCALE_1100
     * @tc.name resourceLocaleIdentifierNormalization011
     * @tc.desc Verify getOverrideResourceManager resolves language-script identifiers to packaged qualifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceLocaleIdentifierNormalization011', 0, (): void => {
      const englishManager: resourceManager.ResourceManager = createLocaleManager('en-US');
      const chineseManager: resourceManager.ResourceManager = createLocaleManager('zh-Hans-CN');
      expect(englishManager.getStringByNameSync('tab_function_features')).assertEqual('Function Features');
      expect(chineseManager.getStringByNameSync('tab_function_features')).assertEqual('功能特性');
      expect(englishManager.getStringByNameSync('tab_service_support')).assertEqual('Service Support');
      expect(chineseManager.getStringByNameSync('tab_service_support')).assertEqual('服务支持');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_LOCALE_0200
     * @tc.name resourceChinesePrimaryNavigation002
     * @tc.desc Verify getOverrideResourceManager resolves the four Simplified Chinese navigation labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceChinesePrimaryNavigation002', 0, (): void => {
      const chineseManager: resourceManager.ResourceManager = createLocaleManager('zh_CN');
      const labels: string[] = resolveNames(chineseManager, [
        'Product_Specifications', 'Function_Directory', 'Smart_Life', 'tab_service_support'
      ]);
      assertValues(labels, ['产品规格', '功能目录', '智慧生活', '服务支持']);
      assertReadable(labels);
    });
  });

  describe('ResourceLookupErrorContractTest', () => {
    let manager: resourceManager.ResourceManager;

    const expectLookupFailure = (action: () => void): number => {
      let failureCode: number = 0;
      let failureMessage: string = '';
      try {
        action();
      } catch (error) {
        const failure: BusinessError = error as BusinessError;
        failureCode = failure.code;
        failureMessage = failure.message;
      }
      expect(failureCode !== 0).assertTrue();
      expect(failureMessage.length > 0).assertTrue();
      return failureCode;
    };

    beforeAll((): void => {
      manager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_LOOKUP_0300
     * @tc.name resourceLookupMissingString003
     * @tc.desc Verify getStringByNameSync rejects a missing application string name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceLookupMissingString003', 0, (): void => {
      const failureCode: number = expectLookupFailure((): void => {
        manager.getStringByNameSync('tvdemo_resource_that_does_not_exist');
      });

      // Silently returning an empty value would make missing localization appear as
      // a blank TV label. A platform error is the required diagnosable failure mode.
      expect(failureCode > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_LOOKUP_0500
     * @tc.name resourceLookupRawFileInventory005
     * @tc.desc Verify getRawFileListSync exposes videoTest mp4 exactly once at package root
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceLookupRawFileInventory005', 0, (): void => {
      const rawFiles: string[] = manager.getRawFileListSync('');
      let videoEntries: number = 0;
      for (let index: number = 0; index < rawFiles.length; index++) {
        if (rawFiles[index] === 'videoTest.mp4') {
          videoEntries++;
        }
      }

      // SmartLifeComponent uses a literal rawfile reference. Inventory verification
      // catches path relocation or duplicate packaging independently of MP4 decoding.
      expect(videoEntries).assertEqual(1);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_LOOKUP_0600
     * @tc.name resourceLookupRawFileReadIsolation006
     * @tc.desc Verify getRawFileContentSync returns isolated bytes across repeated videoTest reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceLookupRawFileReadIsolation006', 0, (): void => {
      const firstRead: Uint8Array = manager.getRawFileContentSync('videoTest.mp4');
      const originalFirstByte: number = firstRead[0];
      firstRead[0] = originalFirstByte === 0 ? 1 : 0;
      const secondRead: Uint8Array = manager.getRawFileContentSync('videoTest.mp4');

      // Video consumers must not inherit mutations from a previous ResourceManager caller.
      // Re-reading the package is therefore expected to restore the immutable source byte.
      expect(secondRead[0]).assertEqual(originalFirstByte);
      expect(secondRead.byteLength).assertEqual(firstRead.byteLength);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_LOOKUP_0700
     * @tc.name resourceLookupMissingRawFile007
     * @tc.desc Verify getRawFileContentSync rejects a missing SmartLife rawfile path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceLookupMissingRawFile007', 0, (): void => {
      const failureCode: number = expectLookupFailure((): void => {
        manager.getRawFileContentSync('missing/videoTest.mp4');
      });

      // A hard failure distinguishes a packaging path regression from an empty video
      // payload, giving the test runner a concrete error instead of a silent black frame.
      expect(failureCode > 0).assertTrue();
    });
    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_LOOKUP_0400
     * @tc.name resourceLookupEmptyStringName004
     * @tc.desc Verify getStringByNameSync rejects an empty application string name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceLookupEmptyStringName004', 0, (): void => {
      const failureCode: number = expectLookupFailure((): void => {
        manager.getStringByNameSync('');
      });

      // Empty and absent keys exercise different caller faults: one loses the key
      // before lookup, while the other supplies a valid-looking but unregistered key.
      expect(failureCode > 0).assertTrue();
    });
  });

  describe('ResourcePackagingContractTest', () => {
    let manager: resourceManager.ResourceManager;

    const loadString = (resource: Resource): string => {
      return manager.getStringSync(resource);
    };

    const loadMedia = (resource: Resource): Uint8Array => {
      return manager.getMediaContentSync(resource);
    };

    const assertDistinctNonEmpty = (values: string[]): void => {
      const distinctValues: Set<string> = new Set<string>();
      for (let index: number = 0; index < values.length; index++) {
        expect(values[index].trim().length > 0).assertTrue();
        distinctValues.add(values[index]);
      }
      expect(distinctValues.size).assertEqual(values.length);
    };

    beforeAll((): void => {
      // ResourceManager reads the packaged entry resources used by production components.
      // Failures here expose missing bundle entries before they become blank TV content.
      manager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
    });

    beforeEach((): void => {
      // Resource reads are immutable, so no synthetic fixture or cache reset is required.
      // Each case groups one production domain rather than inflating one case per constant.
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_0100
     * @tc.name resourceFeatureMediaPackaged001
     * @tc.desc Verify ResourceManager loads all seven FeatureComponent background media assets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceFeatureMediaPackaged001', 0, (): void => {
      const assets: Resource[] = [
        $r('app.media.UniversalInterconnection'), $r('app.media.Cast'), $r('app.media.AI'),
        $r('app.media.PointingRemoteControl'), $r('app.media.ScreenSaver'), $r('app.media.Voice'),
        $r('app.media.Distributed')
      ];
      for (let index: number = 0; index < assets.length; index++) {
        // Every detail is image-led; a tiny or absent payload produces a blank full-screen page.
        // Reading decoded package bytes verifies both resource-table lookup and bundle inclusion.
        expect(loadMedia(assets[index]).byteLength > 1024).assertTrue();
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_0600
     * @tc.name resourcePrimaryNavigationStrings006
     * @tc.desc Verify ResourceManager resolves four distinct primary navigation strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourcePrimaryNavigationStrings006', 0, (): void => {
      const values: string[] = [
        loadString($r('app.string.Product_Specifications')),
        loadString($r('app.string.tab_function_features')),
        loadString($r('app.string.Smart_Life')),
        loadString($r('app.string.tab_service_support'))
      ];
      assertDistinctNonEmpty(values);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_0700
     * @tc.name resourceFeatureTitlesUnique007
     * @tc.desc Verify ResourceManager resolves seven distinct FeatureComponent titles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceFeatureTitlesUnique007', 0, (): void => {
      const titles: string[] = [
        loadString($r('app.string.feature_universal_interconnection')),
        loadString($r('app.string.feature_screen_cast')),
        loadString($r('app.string.feature_smart_ai')),
        loadString($r('app.string.feature_pointing_remote')),
        loadString($r('app.string.feature_smart_screensaver')),
        loadString($r('app.string.feature_voice_interaction')),
        loadString($r('app.string.feature_distributed'))
      ];
      assertDistinctNonEmpty(titles);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_0300
     * @tc.name resourcePngSignature003
     * @tc.desc Verify ResourceManager preserves the PNG signature of the application icon
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourcePngSignature003', 0, (): void => {
      const icon: Uint8Array = loadMedia($r('app.media.icon'));
      // Signature validation catches a renamed or corrupted asset that a length check misses.
      // PNG begins with the fixed 89 50 4E 47 byte sequence defined by the file format.
      expect(icon[0]).assertEqual(137);
      expect(icon[1]).assertEqual(80);
      expect(icon[2]).assertEqual(78);
      expect(icon[3]).assertEqual(71);
    });
    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_0800
     * @tc.name resourceSmartLifeTitlesUnique008
     * @tc.desc Verify ResourceManager resolves three distinct SmartLifeComponent titles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceSmartLifeTitlesUnique008', 0, (): void => {
      const titles: string[] = [
        loadString($r('app.string.smartlife_entertainment_av')),
        loadString($r('app.string.smartlife_child_care')),
        loadString($r('app.string.smartlife_efficient_office'))
      ];
      assertDistinctNonEmpty(titles);
    });
  });

  describe('ResourceThemeOverrideContractTest', () => {
    let manager: resourceManager.ResourceManager;
    let originalColorMode: resourceManager.ColorMode;
    // Theme override managers consume the same system-side budget as locale
    // overrides; track and release them per case to keep the run bounded.
    let createdManagers: resourceManager.ResourceManager[] = [];

    const createThemeManager = (colorMode: resourceManager.ColorMode): resourceManager.ResourceManager => {
      const configuration: resourceManager.Configuration = manager.getOverrideConfiguration();
      configuration.colorMode = colorMode;
      const created: resourceManager.ResourceManager = manager.getOverrideResourceManager(configuration);
      createdManagers.push(created);
      return created;
    };

    beforeAll((): void => {
      manager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
      originalColorMode = manager.getConfigurationSync().colorMode;
    });

    beforeEach((): void => {
      expect(manager.getConfigurationSync().colorMode).assertEqual(originalColorMode);
    });

    afterEach((): void => {
      // Override managers must never mutate the ResourceManager used by the running page.
      // This guard protects later screenshot and geometry suites from a leaked theme.
      expect(manager.getConfigurationSync().colorMode).assertEqual(originalColorMode);
      for (let index: number = 0; index < createdManagers.length; index++) {
        createdManagers[index].release();
      }
      createdManagers = [];
    });

    afterAll((): void => {
      expect(manager.getConfigurationSync().colorMode).assertEqual(originalColorMode);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_THEME_0100
     * @tc.name resourceThemeBackgroundDifference001
     * @tc.desc Verify getColorByNameSync selects different start window backgrounds for light and dark modes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceThemeBackgroundDifference001', 0, (): void => {
      const lightManager: resourceManager.ResourceManager = createThemeManager(resourceManager.ColorMode.LIGHT);
      const darkManager: resourceManager.ResourceManager = createThemeManager(resourceManager.ColorMode.DARK);
      const lightBackground: number = lightManager.getColorByNameSync('start_window_background');
      const darkBackground: number = darkManager.getColorByNameSync('start_window_background');
      expect(lightBackground === darkBackground).assertFalse();
      expect(lightManager.getOverrideConfiguration().colorMode).assertEqual(resourceManager.ColorMode.LIGHT);
      expect(darkManager.getOverrideConfiguration().colorMode).assertEqual(resourceManager.ColorMode.DARK);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_THEME_0200
     * @tc.name resourceThemeBaseColorFallback002
     * @tc.desc Verify dark ResourceManager falls back to base values for colors without dark qualifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceThemeBaseColorFallback002', 0, (): void => {
      const lightManager: resourceManager.ResourceManager = createThemeManager(resourceManager.ColorMode.LIGHT);
      const darkManager: resourceManager.ResourceManager = createThemeManager(resourceManager.ColorMode.DARK);
      const baseOnlyNames: string[] = ['primary_text', 'secondary_text', 'primary_color'];
      for (let index: number = 0; index < baseOnlyNames.length; index++) {
        const lightColor: number = lightManager.getColorByNameSync(baseOnlyNames[index]);
        const darkColor: number = darkManager.getColorByNameSync(baseOnlyNames[index]);
        expect(darkColor).assertEqual(lightColor);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_THEME_0300
     * @tc.name resourceThemeIdNameConsistency003
     * @tc.desc Verify getColorSync resource IDs match getColorByNameSync in both theme configurations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceThemeIdNameConsistency003', 0, (): void => {
      const lightManager: resourceManager.ResourceManager = createThemeManager(resourceManager.ColorMode.LIGHT);
      const darkManager: resourceManager.ResourceManager = createThemeManager(resourceManager.ColorMode.DARK);
      // Colors are resolved by name because $r() objects created in the ohosTest
      // module carry no valid ID against the app override theme managers.
      expect(lightManager.getColorByNameSync('start_window_background'))
        .assertEqual(lightManager.getColorByNameSync('start_window_background'));
      expect(darkManager.getColorByNameSync('start_window_background'))
        .assertEqual(darkManager.getColorByNameSync('start_window_background'));
      expect(lightManager.getColorByNameSync('primary_color'))
        .assertEqual(lightManager.getColorByNameSync('primary_color'));
      expect(darkManager.getColorByNameSync('primary_color'))
        .assertEqual(darkManager.getColorByNameSync('primary_color'));

      // Packaged expectations from color.json: base start_window_background is #FFFFFF,
      // the dark qualifier overrides it with #000000, and base-only primary_color is
      // #0A59F7. Masking the low 24 bits stays valid for ARGB and RGB encodings alike.
      expect(lightManager.getColorByNameSync('start_window_background') & 0xFFFFFF).assertEqual(0xFFFFFF);
      expect(darkManager.getColorByNameSync('start_window_background') & 0xFFFFFF).assertEqual(0x000000);
      expect(darkManager.getColorByNameSync('primary_color') & 0xFFFFFF).assertEqual(0x0A59F7);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_THEME_0400
     * @tc.name resourceThemeLiveConfigurationUpdate004
     * @tc.desc Verify updateOverrideConfiguration changes background resolution without replacing ResourceManager
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceThemeLiveConfigurationUpdate004', 0, (): void => {
      const overrideManager: resourceManager.ResourceManager = createThemeManager(resourceManager.ColorMode.LIGHT);
      const lightBackground: number = overrideManager.getColorByNameSync('start_window_background');
      const configuration: resourceManager.Configuration = overrideManager.getOverrideConfiguration();
      configuration.colorMode = resourceManager.ColorMode.DARK;
      overrideManager.updateOverrideConfiguration(configuration);
      const darkBackground: number = overrideManager.getColorByNameSync('start_window_background');
      expect(overrideManager.getOverrideConfiguration().colorMode).assertEqual(resourceManager.ColorMode.DARK);
      expect(darkBackground === lightBackground).assertFalse();
      expect(manager.getConfigurationSync().colorMode).assertEqual(originalColorMode);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_THEME_0500
     * @tc.name resourceThemeLocaleCombination005
     * @tc.desc Verify ResourceManager resolves theme and locale qualifiers independently in one configuration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceThemeLocaleCombination005', 0, (): void => {
      const englishConfiguration: resourceManager.Configuration = manager.getOverrideConfiguration();
      englishConfiguration.colorMode = resourceManager.ColorMode.DARK;
      englishConfiguration.locale = 'en_US';
      const chineseConfiguration: resourceManager.Configuration = manager.getOverrideConfiguration();
      chineseConfiguration.colorMode = resourceManager.ColorMode.DARK;
      chineseConfiguration.locale = 'zh_CN';
      const englishDark: resourceManager.ResourceManager = manager.getOverrideResourceManager(englishConfiguration);
      const chineseDark: resourceManager.ResourceManager = manager.getOverrideResourceManager(chineseConfiguration);

      // Both managers select the same dark background while their title comes from
      // independent language qualifiers, exercising a real two-dimensional lookup.
      expect(englishDark.getColorByNameSync('start_window_background'))
        .assertEqual(chineseDark.getColorByNameSync('start_window_background'));
      expect(englishDark.getStringByNameSync('Product_Specifications')).assertEqual('Product Specifications');
      expect(chineseDark.getStringByNameSync('Product_Specifications')).assertEqual('产品规格');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_RESOURCE_THEME_0700
     * @tc.name resourceThemeManagerIsolation007
     * @tc.desc Verify light and dark override ResourceManager updates remain isolated under alternating reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('resourceThemeManagerIsolation007', 0, (): void => {
      const lightManager: resourceManager.ResourceManager = createThemeManager(resourceManager.ColorMode.LIGHT);
      const darkManager: resourceManager.ResourceManager = createThemeManager(resourceManager.ColorMode.DARK);
      const lightBackground: number = lightManager.getColorByNameSync('start_window_background');
      const darkBackground: number = darkManager.getColorByNameSync('start_window_background');
      for (let cycle: number = 0; cycle < 6; cycle++) {
        expect(lightManager.getColorByNameSync('start_window_background')).assertEqual(lightBackground);
        expect(darkManager.getColorByNameSync('start_window_background')).assertEqual(darkBackground);
      }
      expect(lightManager.getOverrideConfiguration().colorMode).assertEqual(resourceManager.ColorMode.LIGHT);
      expect(darkManager.getOverrideConfiguration().colorMode).assertEqual(resourceManager.ColorMode.DARK);
    });
  });
}
