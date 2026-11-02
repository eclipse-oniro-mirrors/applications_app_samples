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
      expect(filterDemos(DEMO_ITEMS, 'web', '全部').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'WEB', '全部').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, '  web  ', '全部').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, '', '全部').length).assertEqual(9);
      expect(filterDemos(DEMO_ITEMS, '不存在的组件', '全部').length).assertEqual(0);
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
      expect(filterDemos(DEMO_ITEMS, '页签', '全部').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'NavDestination', '全部').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, '半屏', '全部').length).assertEqual(1);
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
      expect(filterDemos(DEMO_ITEMS, '', '容器').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, '', '交互').length).assertEqual(3);
      expect(filterDemos(DEMO_ITEMS, '', '能力').length).assertEqual(5);
      expect(filterDemos(DEMO_ITEMS, '', '未知分类').length).assertEqual(0);
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
      expect(filterDemos(DEMO_ITEMS, 'search', '交互').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'button', '能力').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'download', '容器').length).assertEqual(0);
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
      const result = filterDemos(DEMO_ITEMS, '', '交互');
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
      expect(CATEGORIES[0]).assertEqual('全部');
      expect(CATEGORIES[1]).assertEqual('容器');
      expect(CATEGORIES[2]).assertEqual('交互');
      expect(CATEGORIES[3]).assertEqual('能力');
      const item = new DemoItem('key', '标题', '副标题', '能力');
      expect(item.key).assertEqual('key');
      expect(item.title).assertEqual('标题');
      expect(item.subtitle).assertEqual('副标题');
      expect(item.category).assertEqual('能力');
    });
  });
}
