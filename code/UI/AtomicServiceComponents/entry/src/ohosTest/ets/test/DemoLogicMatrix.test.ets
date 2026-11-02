import { describe, it, expect } from '@ohos/hypium';
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
    it('filter_web', 0, () => {
      expect(filterDemos(DEMO_ITEMS, 'web', '全部').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_0200
     * @tc.name filterWebUppercase020
     * @tc.desc Verify keyword matching is case-insensitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_webUppercase', 0, () => {
      expect(filterDemos(DEMO_ITEMS, 'WEB', '全部').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_0300
     * @tc.name filterTrimmedKeyword030
     * @tc.desc Verify surrounding whitespace is trimmed before keyword matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_trimmedKeyword', 0, () => {
      expect(filterDemos(DEMO_ITEMS, '  web  ', '全部').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_0400
     * @tc.name filterTabsSubtitle040
     * @tc.desc Verify a keyword found only in a subtitle still matches its entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_tabsSubtitle', 0, () => {
      expect(filterDemos(DEMO_ITEMS, '页签', '全部').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_0500
     * @tc.name filterNavDestination050
     * @tc.desc Verify a router keyword in the navigation subtitle matches one entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_navDestination', 0, () => {
      expect(filterDemos(DEMO_ITEMS, 'NavDestination', '全部').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_0600
     * @tc.name filterEmptyKeywordContainer060
     * @tc.desc Verify the container category contains one demo entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_emptyKeywordContainer', 0, () => {
      expect(filterDemos(DEMO_ITEMS, '', '容器').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_0700
     * @tc.name filterEmptyKeywordInteraction070
     * @tc.desc Verify the interaction category contains three demo entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_emptyKeywordInteraction', 0, () => {
      expect(filterDemos(DEMO_ITEMS, '', '交互').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_0800
     * @tc.name filterEmptyKeywordCapability080
     * @tc.desc Verify the capability category contains five demo entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_emptyKeywordCapability', 0, () => {
      expect(filterDemos(DEMO_ITEMS, '', '能力').length).assertEqual(5);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_0900
     * @tc.name filterAllCategory090
     * @tc.desc Verify the all category keeps the full catalog
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_allCategory', 0, () => {
      expect(filterDemos(DEMO_ITEMS, '', '全部').length).assertEqual(9);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_1000
     * @tc.name filterUnknownCategory100
     * @tc.desc Verify an unknown category yields no demo entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_unknownCategory', 0, () => {
      expect(filterDemos(DEMO_ITEMS, '', '未知分类').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_1100
     * @tc.name filterCombinedMatch110
     * @tc.desc Verify a matching keyword and category combination keeps one entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_combinedMatch', 0, () => {
      expect(filterDemos(DEMO_ITEMS, 'search', '交互').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'download', '能力').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_1200
     * @tc.name filterCombinedMismatch120
     * @tc.desc Verify a keyword and category that never co-occur yield no entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_combinedMismatch', 0, () => {
      expect(filterDemos(DEMO_ITEMS, 'download', '容器').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_1300
     * @tc.name tabUnlockedValid130
     * @tc.desc Verify an unlocked tab bar allows switching to another valid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tab_unlockedValid', 0, () => {
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
    it('tab_lockedSame', 0, () => {
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
    it('tab_lockedOther', 0, () => {
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
    it('tab_zeroCount', 0, () => {
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
    it('tab_indexEqualsCount', 0, () => {
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
    it('tab_negativeIndex', 0, () => {
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
    it('navStack_empty', 0, () => {
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
    it('navStack_nonEmpty', 0, () => {
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
    it('catalog_keysAreRoutes', 0, () => {
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
    it('catalog_titlesMatchComponents', 0, () => {
      expect(DEMO_ITEMS[0].title).assertEqual('AtomicServiceNavigation');
      expect(DEMO_ITEMS[1].title).assertEqual('AtomicServiceSearch');
      expect(DEMO_ITEMS[2].title).assertEqual('AtomicServiceTabs');
      expect(DEMO_ITEMS[3].title).assertEqual('AtomicServiceWeb');
      expect(DEMO_ITEMS[4].title).assertEqual('DownloadFileButton');
      expect(DEMO_ITEMS[5].title).assertEqual('HalfScreenLaunchComponent');
      expect(DEMO_ITEMS[6].title).assertEqual('应用间跳转');
      expect(DEMO_ITEMS[7].title).assertEqual('半模态面板');
      expect(DEMO_ITEMS[8].title).assertEqual('首选项存储');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEMOLOGICMATRIX_2300
     * @tc.name catalogKeysUnique230
     * @tc.desc Verify the catalog has nine unique keys and a four-entry category list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('catalog_keysUnique', 0, () => {
      const keys: string[] = DEMO_ITEMS.map((item: DemoItem) => item.key);
      expect(keys.length).assertEqual(9);
      for (const key of keys) {
        expect(keys.indexOf(key)).assertEqual(keys.lastIndexOf(key));
      }
      expect(CATEGORIES.length).assertEqual(4);
      expect(CATEGORIES[0]).assertEqual('全部');
    });
  });
}
