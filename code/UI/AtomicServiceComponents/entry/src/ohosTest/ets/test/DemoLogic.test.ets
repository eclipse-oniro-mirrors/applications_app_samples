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
import { CATEGORIES, DEMO_ITEMS, DemoItem, canPopNavStack, canSwitchTab, filterDemos } from '../../../main/ets/model/DemoLogic';

export default function demoLogicTest() {
  describe('demoLogicTest', () => {

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGIC_0100
     * @tc.name demoItemsCatalogShape001
     * @tc.desc Verify the demo catalog exposes nine unique entries with non-empty fields and known categories
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('demoItems_catalogShape', 0, () => {
      expect(DEMO_ITEMS.length).assertEqual(9);
      const keys: string[] = DEMO_ITEMS.map((item: DemoItem) => item.key);
      for (const key of keys) {
        expect(keys.indexOf(key)).assertEqual(keys.lastIndexOf(key));
      }
      for (const item of DEMO_ITEMS) {
        expect(item.title.length > 0).assertTrue();
        expect(item.subtitle.length > 0).assertTrue();
        expect(CATEGORIES.includes(item.category)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGIC_0200
     * @tc.name filterDemosKeywordNormalization002
     * @tc.desc Verify keyword filtering is trimmed and case-insensitive and supports empty keywords
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filterDemos_keywordNormalization', 0, () => {
      expect(filterDemos(DEMO_ITEMS, 'web', 'All').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'WEB', 'All').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, '  web  ', 'All').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, '', 'All').length).assertEqual(9);
      expect(filterDemos(DEMO_ITEMS, 'missing component', 'All').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGIC_0300
     * @tc.name filterDemosSubtitleMatch003
     * @tc.desc Verify keyword filtering also matches subtitle text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filterDemos_subtitleMatch', 0, () => {
      expect(filterDemos(DEMO_ITEMS, 'Simplified', 'All').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'NavDestination', 'All').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'Half-screen', 'All').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGIC_0400
     * @tc.name filterDemosCategoryBuckets004
     * @tc.desc Verify category filtering returns the expected bucket sizes and empty category matches all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filterDemos_categoryBuckets', 0, () => {
      expect(filterDemos(DEMO_ITEMS, '', '').length).assertEqual(9);
      expect(filterDemos(DEMO_ITEMS, '', 'Container').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, '', 'Interaction').length).assertEqual(3);
      expect(filterDemos(DEMO_ITEMS, '', 'Capability').length).assertEqual(5);
      expect(filterDemos(DEMO_ITEMS, '', 'Unknown').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGIC_0500
     * @tc.name filterDemosCombinedConditions005
     * @tc.desc Verify keyword and category filters combine with logical AND
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filterDemos_combinedConditions', 0, () => {
      expect(filterDemos(DEMO_ITEMS, 'search', 'Interaction').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'button', 'Capability').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'download', 'Container').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGIC_0600
     * @tc.name filterDemosDoesNotMutateInput006
     * @tc.desc Verify filtering returns a new array and leaves the source catalog untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filterDemos_doesNotMutateInput', 0, () => {
      const result = filterDemos(DEMO_ITEMS, '', 'Interaction');
      expect(result.length).assertEqual(3);
      result.pop();
      expect(result.length).assertEqual(2);
      expect(DEMO_ITEMS.length).assertEqual(9);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGIC_0700
     * @tc.name canSwitchTabLockRules007
     * @tc.desc Verify tab switching rejects invalid counts and enforces the locked flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('canSwitchTab_lockRules', 0, () => {
      expect(canSwitchTab(0, 0, false, 0)).assertFalse();
      expect(canSwitchTab(0, 0, false, -1)).assertFalse();
      expect(canSwitchTab(0, 1, true, 3)).assertFalse();
      expect(canSwitchTab(1, 1, true, 3)).assertTrue();
      expect(canSwitchTab(0, 1, false, 3)).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGIC_0800
     * @tc.name canSwitchTabIndexBounds008
     * @tc.desc Verify out-of-range target indexes are rejected while the current index is not range checked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('canSwitchTab_indexBounds', 0, () => {
      expect(canSwitchTab(0, 3, false, 3)).assertFalse();
      expect(canSwitchTab(0, -1, false, 3)).assertFalse();
      expect(canSwitchTab(-5, 0, false, 3)).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGIC_0900
     * @tc.name canPopNavStackValues009
     * @tc.desc Verify navigation stack popping requires a positive stack size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('canPopNavStack_values', 0, () => {
      expect(canPopNavStack(0)).assertFalse();
      expect(canPopNavStack(-1)).assertFalse();
      expect(canPopNavStack(1)).assertTrue();
      expect(canPopNavStack(5)).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGIC_1000
     * @tc.name categoriesOrderAndDemoItem010
     * @tc.desc Verify the category list order and the DemoItem constructor field mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('categoriesOrder_and_DemoItem', 0, () => {
      expect(CATEGORIES.length).assertEqual(4);
      expect(CATEGORIES[0]).assertEqual('All');
      expect(CATEGORIES[1]).assertEqual('Container');
      expect(CATEGORIES[2]).assertEqual('Interaction');
      expect(CATEGORIES[3]).assertEqual('Capability');
      const item = new DemoItem('key', 'Title', 'Subtitle', 'Capability');
      expect(item.key).assertEqual('key');
      expect(item.title).assertEqual('Title');
      expect(item.subtitle).assertEqual('Subtitle');
      expect(item.category).assertEqual('Capability');
    });
  });
}
