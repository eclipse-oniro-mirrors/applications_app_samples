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
 
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { CATEGORIES, DEMO_ITEMS, DemoItem, canPopNavStack, canSwitchTab, filterDemos } from '../../../main/ets/model/DemoLogic';
import { isRouteKey } from '../../../main/ets/common/AppConstants';

export default function demoLogicMatrixTest() {
  describe('demoLogicMatrixTest', () => {

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_0100
     * @tc.name filterWeb010
     * @tc.desc Verify the web keyword keeps only the web demo entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_web', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, 'web', 'All').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_0200
     * @tc.name filterWebUppercase020
     * @tc.desc Verify keyword matching is case-insensitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_webUppercase', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, 'WEB', 'All').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_0300
     * @tc.name filterTrimmedKeyword030
     * @tc.desc Verify surrounding whitespace is trimmed before keyword matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_trimmedKeyword', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, '  web  ', 'All').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_0400
     * @tc.name filterTabsSubtitle040
     * @tc.desc Verify a keyword found only in a subtitle still matches its entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_tabsSubtitle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, 'Simplified', 'All').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_0500
     * @tc.name filterNavDestination050
     * @tc.desc Verify a router keyword in the navigation subtitle matches one entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_navDestination', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, 'NavDestination', 'All').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_0600
     * @tc.name filterEmptyKeywordContainer060
     * @tc.desc Verify the container category contains one demo entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_emptyKeywordContainer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, '', 'Container').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_0700
     * @tc.name filterEmptyKeywordInteraction070
     * @tc.desc Verify the interaction category contains three demo entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_emptyKeywordInteraction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, '', 'Interaction').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_0800
     * @tc.name filterEmptyKeywordCapability080
     * @tc.desc Verify the capability category contains five demo entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_emptyKeywordCapability', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, '', 'Capability').length).assertEqual(5);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_0900
     * @tc.name filterAllCategory090
     * @tc.desc Verify the all category keeps the full catalog
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_allCategory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, '', 'All').length).assertEqual(9);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_1000
     * @tc.name filterUnknownCategory100
     * @tc.desc Verify an unknown category yields no demo entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_unknownCategory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, '', 'Unknown').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_1100
     * @tc.name filterCombinedMatch110
     * @tc.desc Verify a matching keyword and category combination keeps one entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_combinedMatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, 'search', 'Interaction').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'download', 'Capability').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_1200
     * @tc.name filterCombinedMismatch120
     * @tc.desc Verify a keyword and category that never co-occur yield no entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_combinedMismatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, 'download', 'Container').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_1300
     * @tc.name tabUnlockedValid130
     * @tc.desc Verify an unlocked tab bar allows switching to another valid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tab_unlockedValid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(canSwitchTab(0, 1, false, 3)).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_1400
     * @tc.name tabLockedSame140
     * @tc.desc Verify a locked tab bar still allows re-selecting the current index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tab_lockedSame', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(canSwitchTab(1, 1, true, 3)).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_1500
     * @tc.name tabLockedOther150
     * @tc.desc Verify a locked tab bar rejects switching to another index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tab_lockedOther', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(canSwitchTab(0, 1, true, 3)).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_1600
     * @tc.name tabZeroCount160
     * @tc.desc Verify an empty tab bar rejects every switch attempt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tab_zeroCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(canSwitchTab(0, 0, false, 0)).assertFalse();
      expect(canSwitchTab(0, 0, false, -1)).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_1700
     * @tc.name tabIndexEqualsCount170
     * @tc.desc Verify the tab count itself is out of range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tab_indexEqualsCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(canSwitchTab(0, 3, false, 3)).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_1800
     * @tc.name tabNegativeIndex180
     * @tc.desc Verify a negative target index is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tab_negativeIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(canSwitchTab(0, -1, false, 3)).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_1900
     * @tc.name navStackEmpty190
     * @tc.desc Verify an empty navigation stack cannot be popped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('navStack_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(canPopNavStack(0)).assertFalse();
      expect(canPopNavStack(-1)).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_2000
     * @tc.name navStackNonEmpty200
     * @tc.desc Verify a non-empty navigation stack can be popped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('navStack_nonEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(canPopNavStack(1)).assertTrue();
      expect(canPopNavStack(5)).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_2100
     * @tc.name catalogKeysAreRoutes210
     * @tc.desc Verify every catalog key is a registered route key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('catalog_keysAreRoutes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      for (const item of DEMO_ITEMS) {
        expect(isRouteKey(item.key)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_2200
     * @tc.name catalogTitlesMatchComponents220
     * @tc.desc Verify each catalog entry names the component it demonstrates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('catalog_titlesMatchComponents', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(DEMO_ITEMS[0].title).assertEqual('AtomicServiceNavigation');
      expect(DEMO_ITEMS[1].title).assertEqual('AtomicServiceSearch');
      expect(DEMO_ITEMS[2].title).assertEqual('AtomicServiceTabs');
      expect(DEMO_ITEMS[3].title).assertEqual('AtomicServiceWeb');
      expect(DEMO_ITEMS[4].title).assertEqual('DownloadFileButton');
      expect(DEMO_ITEMS[5].title).assertEqual('HalfScreenLaunchComponent');
      expect(DEMO_ITEMS[6].title).assertEqual('Cross-app jump');
      expect(DEMO_ITEMS[7].title).assertEqual('Half-modal sheet');
      expect(DEMO_ITEMS[8].title).assertEqual('Preferences storage');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_2300
     * @tc.name catalogKeysUnique230
     * @tc.desc Verify the catalog has nine unique keys and a four-entry category list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('catalog_keysUnique', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const keys: string[] = DEMO_ITEMS.map((item: DemoItem) => item.key);
      expect(keys.length).assertEqual(9);
      for (const key of keys) {
        expect(keys.indexOf(key)).assertEqual(keys.lastIndexOf(key));
      }
      expect(CATEGORIES.length).assertEqual(4);
      expect(CATEGORIES[0]).assertEqual('All');
    });
  });
}
