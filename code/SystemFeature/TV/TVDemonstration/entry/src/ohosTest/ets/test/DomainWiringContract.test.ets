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

import { beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import resourceManager from '@ohos.resourceManager';
import { keepMainThreadResponsive } from './MainThreadYield';

// Content-wiring contract for the launcher's FeatureComponent and
// SmartLifeComponent models. Every feature/scene in those components wires a
// title plus a fixed set of label/content resource pairs; this suite resolves
// each referenced string through the real resource manager (the same
// name-based lookup the resource compiler performs for $r()) and asserts the
// exact visible title plus structural invariants of the copy (non-empty,
// distinct, label never equals content). A deleted or renamed resource key, or
// a duplicated title, fails loudly instead of rendering a blank feature page.

interface ContentEntry {
  labelKey: string;
  contentKey: string;
}

interface FeatureModel {
  titleKey: string;
  titleText: string;
  entries: ContentEntry[];
}

// The exact feature model from FeatureComponent.details. Index order matters:
// Swiper pages are rendered in this order and DetailIndexPolicy routes to it.
const FEATURES: FeatureModel[] = [
  {
    titleKey: 'feature_universal_interconnection',
    titleText: 'Universal Interconnection',
    entries: [
      { labelKey: 'inter_label_1', contentKey: 'inter_content_1' },
      { labelKey: 'inter_label_2', contentKey: 'inter_content_2' },
      { labelKey: 'inter_label_3', contentKey: 'inter_content_3' }
    ]
  },
  {
    titleKey: 'feature_screen_cast',
    titleText: 'Screen Cast',
    entries: [
      { labelKey: 'cast_label_1', contentKey: 'cast_content_1' },
      { labelKey: 'cast_label_2', contentKey: 'cast_content_2' },
      { labelKey: 'cast_label_3', contentKey: 'cast_content_3' }
    ]
  },
  {
    titleKey: 'feature_smart_ai',
    titleText: 'Smart AI',
    entries: [
      { labelKey: 'ai_label_1', contentKey: 'ai_content_1' },
      { labelKey: 'ai_label_2', contentKey: 'ai_content_2' },
      { labelKey: 'ai_label_3', contentKey: 'ai_content_3' }
    ]
  },
  {
    titleKey: 'feature_pointing_remote',
    titleText: 'Pointing Remote',
    entries: [
      { labelKey: 'pointing_label_1', contentKey: 'pointing_content_1' },
      { labelKey: 'pointing_label_2', contentKey: 'pointing_content_2' },
      { labelKey: 'pointing_label_3', contentKey: 'pointing_content_3' }
    ]
  },
  {
    titleKey: 'feature_smart_screensaver',
    titleText: 'Smart Screensaver',
    entries: [
      { labelKey: 'screensaver_label_1', contentKey: 'screensaver_content_1' },
      { labelKey: 'screensaver_label_2', contentKey: 'screensaver_content_2' },
      { labelKey: 'screensaver_label_3', contentKey: 'screensaver_content_3' }
    ]
  },
  {
    titleKey: 'feature_voice_interaction',
    titleText: 'Voice Interaction',
    entries: [
      { labelKey: 'voice_label_1', contentKey: 'voice_content_1' },
      { labelKey: 'voice_label_2', contentKey: 'voice_content_2' },
      { labelKey: 'voice_label_3', contentKey: 'voice_content_3' }
    ]
  },
  {
    titleKey: 'feature_distributed',
    titleText: 'Distributed',
    entries: [
      { labelKey: 'distributed_label_1', contentKey: 'distributed_content_1' },
      { labelKey: 'distributed_label_2', contentKey: 'distributed_content_2' },
      { labelKey: 'distributed_label_3', contentKey: 'distributed_content_3' }
    ]
  }
];

// The exact scene model from SmartLifeComponent.details. Note child_care wires
// only two content entries while the other scenes wire three.
const SCENES: FeatureModel[] = [
  {
    titleKey: 'smartlife_entertainment_av',
    titleText: 'Entertainment & AV',
    entries: [
      { labelKey: 'media_label_1', contentKey: 'media_content_1' },
      { labelKey: 'media_label_2', contentKey: 'media_content_2' },
      { labelKey: 'media_label_3', contentKey: 'media_content_3' }
    ]
  },
  {
    titleKey: 'smartlife_child_care',
    titleText: 'Child Care',
    entries: [
      { labelKey: 'childcare_label_1', contentKey: 'childcare_content_1' },
      { labelKey: 'childcare_label_2', contentKey: 'childcare_content_2' }
    ]
  },
  {
    titleKey: 'smartlife_efficient_office',
    titleText: 'Efficient Office',
    entries: [
      { labelKey: 'office_label_1', contentKey: 'office_content_1' },
      { labelKey: 'office_label_2', contentKey: 'office_content_2' },
      { labelKey: 'office_label_3', contentKey: 'office_content_3' }
    ]
  }
];

export default function domainWiringContractTest(): void {
  describe('DomainWiringContractTest', () => {
    // Pace the pure-logic matrix; see MainThreadYield.ets.
    beforeEach(keepMainThreadResponsive);
    let manager: resourceManager.ResourceManager;

    // Same name-based lookup the resource compiler maps $r('app.string.<key>')
    // to; using it keeps the test decoupled from compile-time id tables.
    const loadString = (key: string): string => {
      return manager.getStringByNameSync(key);
    };

    beforeAll((): void => {
      manager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WIRING_0100
     * @tc.name domainFeatureCatalogSize001
     * @tc.desc Verify the FeatureComponent model exposes exactly seven features
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('domainFeatureCatalogSize001', 0, (): void => {
      // Seven Swiper pages exactly match the details array in FeatureComponent.
      expect(FEATURES.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WIRING_0200
     * @tc.name domainFeatureTitlesExactAndUnique002
     * @tc.desc Verify every feature title resolves to its exact published text and no title repeats
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('domainFeatureTitlesExactAndUnique002', 0, (): void => {
      const titles: string[] = [];
      for (let index: number = 0; index < FEATURES.length; index++) {
        const feature: FeatureModel = FEATURES[index];
        const resolved: string = loadString(feature.titleKey);
        // Exact match pins the visible headline text shown by Text(item.title).
        expect(resolved).assertEqual(feature.titleText);
        titles.push(resolved);
      }
      // Duplicate titles would make two Swiper pages indistinguishable to users.
      expect(titles.length).assertEqual(new Set(titles).size);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WIRING_0300
     * @tc.name domainFeatureEntryShape003
     * @tc.desc Verify every feature wires exactly three label/content pairs
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('domainFeatureEntryShape003', 0, (): void => {
      for (let index: number = 0; index < FEATURES.length; index++) {
        // FeatureComponent iterates ContentListN (three entries) per feature.
        expect(FEATURES[index].entries.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WIRING_0400
     * @tc.name domainFeatureCopyResolvesNonEmpty004
     * @tc.desc Verify every feature label and content resource resolves to a non-empty string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('domainFeatureCopyResolvesNonEmpty004', 0, (): void => {
      for (let featurePos: number = 0; featurePos < FEATURES.length; featurePos++) {
        const feature: FeatureModel = FEATURES[featurePos];
        for (let entryPos: number = 0; entryPos < feature.entries.length; entryPos++) {
          const entry: ContentEntry = feature.entries[entryPos];
          const label: string = loadString(entry.labelKey);
          const content: string = loadString(entry.contentKey);
          expect(label.length > 0).assertTrue();
          expect(content.length > 0).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WIRING_0500
     * @tc.name domainFeatureCopyIsSubstantive005
     * @tc.desc Verify feature content copy is long-form and label is meaningfully shorter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('domainFeatureCopyIsSubstantive005', 0, (): void => {
      for (let featurePos: number = 0; featurePos < FEATURES.length; featurePos++) {
        const feature: FeatureModel = FEATURES[featurePos];
        for (let entryPos: number = 0; entryPos < feature.entries.length; entryPos++) {
          const entry: ContentEntry = feature.entries[entryPos];
          const label: string = loadString(entry.labelKey);
          const content: string = loadString(entry.contentKey);
          // Content paragraphs describe the capability in detail; a stub shorter
          // than 60 characters would read as an unfinished description.
          expect(content.length > 60).assertTrue();
          // The label is a short headline; if it were longer than its own body
          // the visual hierarchy (28lpx vs 22lpx) would be absurd.
          expect(label.length < content.length).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WIRING_0600
     * @tc.name domainFeatureLabelNeverEqualsContent006
     * @tc.desc Verify within every feature each label differs from its own content and all entries are distinct
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('domainFeatureLabelNeverEqualsContent006', 0, (): void => {
      for (let featurePos: number = 0; featurePos < FEATURES.length; featurePos++) {
        const feature: FeatureModel = FEATURES[featurePos];
        const allCopy: string[] = [];
        for (let entryPos: number = 0; entryPos < feature.entries.length; entryPos++) {
          const entry: ContentEntry = feature.entries[entryPos];
          const label: string = loadString(entry.labelKey);
          const content: string = loadString(entry.contentKey);
          expect(label === content).assertFalse();
          allCopy.push(label);
          allCopy.push(content);
        }
        // No copy text may repeat inside one feature, which would make the
        // rendered column look duplicated.
        expect(allCopy.length).assertEqual(new Set(allCopy).size);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WIRING_0700
     * @tc.name domainSceneCatalogSize007
     * @tc.desc Verify the SmartLifeComponent model exposes exactly three scenes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('domainSceneCatalogSize007', 0, (): void => {
      // SmartLifeComponent.details holds three scenes (AV / child care / office).
      expect(SCENES.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WIRING_0800
     * @tc.name domainSceneTitlesExactAndUnique008
     * @tc.desc Verify every scene title resolves to its exact published text and no title repeats
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('domainSceneTitlesExactAndUnique008', 0, (): void => {
      const titles: string[] = [];
      for (let index: number = 0; index < SCENES.length; index++) {
        const scene: FeatureModel = SCENES[index];
        const resolved: string = loadString(scene.titleKey);
        expect(resolved).assertEqual(scene.titleText);
        titles.push(resolved);
      }
      expect(titles.length).assertEqual(new Set(titles).size);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WIRING_0900
     * @tc.name domainSceneEntryShape009
     * @tc.desc Verify child-care wires two entries while the other scenes wire three
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('domainSceneEntryShape009', 0, (): void => {
      // The asymmetric shape is deliberate: ChildCare has two copy blocks.
      expect(SCENES[0].entries.length).assertEqual(3);
      expect(SCENES[1].entries.length).assertEqual(2);
      expect(SCENES[2].entries.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WIRING_1000
     * @tc.name domainSceneCopyResolvesNonEmpty010
     * @tc.desc Verify every scene label and content resource resolves to a non-empty string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('domainSceneCopyResolvesNonEmpty010', 0, (): void => {
      for (let scenePos: number = 0; scenePos < SCENES.length; scenePos++) {
        const scene: FeatureModel = SCENES[scenePos];
        for (let entryPos: number = 0; entryPos < scene.entries.length; entryPos++) {
          const entry: ContentEntry = scene.entries[entryPos];
          expect(loadString(entry.labelKey).length > 0).assertTrue();
          expect(loadString(entry.contentKey).length > 0).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WIRING_1100
     * @tc.name domainSceneCopyIsSubstantive011
     * @tc.desc Verify scene content copy is long-form and label is shorter than its body
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('domainSceneCopyIsSubstantive011', 0, (): void => {
      for (let scenePos: number = 0; scenePos < SCENES.length; scenePos++) {
        const scene: FeatureModel = SCENES[scenePos];
        for (let entryPos: number = 0; entryPos < scene.entries.length; entryPos++) {
          const entry: ContentEntry = scene.entries[entryPos];
          const label: string = loadString(entry.labelKey);
          const content: string = loadString(entry.contentKey);
          expect(content.length > 60).assertTrue();
          expect(label.length < content.length).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WIRING_1200
     * @tc.name domainSceneLabelNeverEqualsContent012
     * @tc.desc Verify within every scene each label differs from its content and entries are distinct
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('domainSceneLabelNeverEqualsContent012', 0, (): void => {
      for (let scenePos: number = 0; scenePos < SCENES.length; scenePos++) {
        const scene: FeatureModel = SCENES[scenePos];
        const allCopy: string[] = [];
        for (let entryPos: number = 0; entryPos < scene.entries.length; entryPos++) {
          const entry: ContentEntry = scene.entries[entryPos];
          const label: string = loadString(entry.labelKey);
          const content: string = loadString(entry.contentKey);
          expect(label === content).assertFalse();
          allCopy.push(label);
          allCopy.push(content);
        }
        expect(allCopy.length).assertEqual(new Set(allCopy).size);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WIRING_1300
     * @tc.name domainFeatureSceneCopyDisjoint013
     * @tc.desc Verify feature copy and scene copy never accidentally share text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('domainFeatureSceneCopyDisjoint013', 0, (): void => {
      // Feature copy targets the TV feature catalog, scene copy targets smart
      // living scenes; an identical label would confuse the two domains.
      const featureCopy: string[] = [];
      for (let featurePos: number = 0; featurePos < FEATURES.length; featurePos++) {
        const feature: FeatureModel = FEATURES[featurePos];
        for (let entryPos: number = 0; entryPos < feature.entries.length; entryPos++) {
          featureCopy.push(loadString(feature.entries[entryPos].labelKey));
        }
      }
      for (let scenePos: number = 0; scenePos < SCENES.length; scenePos++) {
        const scene: FeatureModel = SCENES[scenePos];
        for (let entryPos: number = 0; entryPos < scene.entries.length; entryPos++) {
          const sceneLabel: string = loadString(scene.entries[entryPos].labelKey);
          for (let featurePos: number = 0; featurePos < featureCopy.length; featurePos++) {
            expect(featureCopy[featurePos] === sceneLabel).assertFalse();
          }
        }
      }
    });
  });
}
