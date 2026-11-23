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

import { describe, beforeAll, it, expect, afterEach } from '@ohos/hypium';
import { yieldToEventLoop } from '../Shared/TestDriver';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Catalog, Goods } from '../Shared/ShopModel';
import { CATEGORY_APPLIANCE, CATEGORY_FOOD, CATEGORY_PHONE, CATEGORY_SPORT, CATEGORY_WEAR, PRODUCTS, createGoods, defaultCatalog } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

export default function categoryGroupingTest() {
  describe('OrangeShoppingCategoryGrouping', () => {
    let catalog: Catalog = defaultCatalog();

    beforeAll(() => {
      catalog = defaultCatalog();
      hilog.info(DOMAIN, TAG, '%{public}s', 'category grouping suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0010
     * @tc.name      grouping_reports_the_expected_count_for_each_category_001
     * @tc.desc      Verify grouping reports the expected count for each category.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_reports_the_expected_count_for_each_category_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_reports_the_expected_count_for_each_category_001');
      let categories: string[] = [CATEGORY_PHONE, CATEGORY_SPORT, CATEGORY_FOOD,
        CATEGORY_APPLIANCE, CATEGORY_WEAR];
      // The five group sizes 6, 4, 2, 2, 2 add up to the 16 fixture rows, which is why the
      // running total below must equal count().
      let expected: number[] = [6, 4, 2, 2, 2];
      let total: number = 0;
      for (let index: number = 0; index < categories.length; index++) {
        let group: Goods[] = catalog.byCategory(categories[index]);
        expect(group.length).assertEqual(expected[index]);
        total += group.length;
        for (let itemIndex: number = 0; itemIndex < group.length; itemIndex++) {
          expect(group[itemIndex].category).assertEqual(categories[index]);
        }
      }
      expect(total).assertEqual(catalog.count());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0020
     * @tc.name      grouping_lists_categories_in_first_appearance_order_002
     * @tc.desc      Verify grouping lists categories in first appearance order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_lists_categories_in_first_appearance_order_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_lists_categories_in_first_appearance_order_002');
      let categories: string[] = catalog.categories();
      expect((categories).length).assertEqual(([CATEGORY_PHONE, CATEGORY_SPORT, CATEGORY_FOOD,
        CATEGORY_APPLIANCE, CATEGORY_WEAR]).length);
      for (let __i76: number = 0; __i76 < ([CATEGORY_PHONE, CATEGORY_SPORT, CATEGORY_FOOD,
        CATEGORY_APPLIANCE, CATEGORY_WEAR]).length; __i76++) {
        expect((categories)[__i76]).assertEqual(([CATEGORY_PHONE, CATEGORY_SPORT, CATEGORY_FOOD,
        CATEGORY_APPLIANCE, CATEGORY_WEAR])[__i76]);
      }
      expect(categories.length).assertEqual(5);
      expect(categories[0]).assertEqual(CATEGORY_PHONE);
      expect(categories[4]).assertEqual(CATEGORY_WEAR);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0030
     * @tc.name      grouping_category_names_are_unique_003
     * @tc.desc      Verify grouping category names are unique.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_category_names_are_unique_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_category_names_are_unique_003');
      let categories: string[] = catalog.categories();
      expect(categories.length).assertEqual(5);
      let __seen99: string[] = [];
      for (let __i99: number = 0; __i99 < (categories).length; __i99++) {
        expect(__seen99.indexOf((categories)[__i99]) < 0).assertTrue();
        __seen99.push((categories)[__i99]);
      }
      let phoneOccurrences: number = 0;
      for (let index: number = 0; index < categories.length; index++) {
        if (categories[index] === CATEGORY_PHONE) {
          phoneOccurrences++;
        }
      }
      expect(phoneOccurrences).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0040
     * @tc.name      grouping_item_tallies_match_the_group_sizes_004
     * @tc.desc      Verify grouping item tallies match the group sizes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_item_tallies_match_the_group_sizes_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_item_tallies_match_the_group_sizes_004');
      let categories: string[] = catalog.categories();
      // An independent double scan tallies each product into its category bucket; the
      // buckets must agree with byCategory and add up to all 16 rows.
      let tallies: number[] = [];
      for (let index: number = 0; index < categories.length; index++) {
        tallies.push(0);
      }
      let items: Goods[] = catalog.all();
      for (let itemIndex: number = 0; itemIndex < items.length; itemIndex++) {
        for (let categoryIndex: number = 0; categoryIndex < categories.length; categoryIndex++) {
          if (items[itemIndex].category === categories[categoryIndex]) {
            tallies[categoryIndex] = tallies[categoryIndex] + 1;
          }
        }
      }
      let total: number = 0;
      for (let index: number = 0; index < categories.length; index++) {

        expect(tallies[index]).assertEqual(catalog.byCategory(categories[index]).length);
        total += tallies[index];
      }
      expect(total).assertEqual(items.length);
      expect(total).assertEqual(catalog.count());
      expect(catalog.count()).assertEqual(PRODUCTS.length);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0050
     * @tc.name      grouping_lists_each_product_category_exactly_once_005
     * @tc.desc      Verify grouping lists each product category exactly once.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_lists_each_product_category_exactly_once_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_lists_each_product_category_exactly_once_005');
      let categories: string[] = catalog.categories();
      let items: Goods[] = catalog.all();
      for (let itemIndex: number = 0; itemIndex < items.length; itemIndex++) {
        let occurrences: number = 0;
        for (let categoryIndex: number = 0; categoryIndex < categories.length; categoryIndex++) {
          if (categories[categoryIndex] === items[itemIndex].category) {
            occurrences++;
          }
        }
        expect(occurrences).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0060
     * @tc.name      grouping_phone_group_contains_the_expected_identifiers_006
     * @tc.desc      Verify grouping phone group contains the expected identifiers.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_phone_group_contains_the_expected_identifiers_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_phone_group_contains_the_expected_identifiers_006');
      let group: Goods[] = catalog.byCategory(CATEGORY_PHONE);
      let ids: number[] = [];
      for (let index: number = 0; index < group.length; index++) {
        ids.push(group[index].id);
      }
      expect((ids).length).assertEqual(([0, 1, 6, 8, 9, 14]).length);
      for (let __i67: number = 0; __i67 < ([0, 1, 6, 8, 9, 14]).length; __i67++) {
        expect((ids)[__i67]).assertEqual(([0, 1, 6, 8, 9, 14])[__i67]);
      }
      expect(group[0].title).assertEqual('Harmony Phone One');
      // Ids 0, 1, 6 and their repeated copies 8, 9, 14 are the phone rows, because the
      // fixture lists the eight products twice.
      expect(group[5].title).assertEqual('Wireless Earbuds');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0070
     * @tc.name      grouping_sport_group_keeps_the_relative_order_007
     * @tc.desc      Verify grouping sport group keeps the relative order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_sport_group_keeps_the_relative_order_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_sport_group_keeps_the_relative_order_007');
      let group: Goods[] = catalog.byCategory(CATEGORY_SPORT);
      let ids: number[] = [];
      for (let index: number = 0; index < group.length; index++) {
        ids.push(group[index].id);
        expect(group[index].category).assertEqual(CATEGORY_SPORT);
      }
      expect((ids).length).assertEqual(([2, 3, 10, 11]).length);
      for (let __i68: number = 0; __i68 < ([2, 3, 10, 11]).length; __i68++) {
        expect((ids)[__i68]).assertEqual(([2, 3, 10, 11])[__i68]);
      }
      expect(group[0].title).assertEqual('Smart Watch Pro');
      expect(group[3].title).assertEqual('Sport Runner Shoes');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0080
     * @tc.name      grouping_membership_matches_a_manual_scan_for_every_category_008
     * @tc.desc      Verify grouping membership matches a manual scan for every category.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_membership_matches_a_manual_scan_for_every_category_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_membership_matches_a_manual_scan_for_every_category_008');
      let categories: string[] = catalog.categories();
      let items: Goods[] = catalog.all();
      for (let categoryIndex: number = 0; categoryIndex < categories.length; categoryIndex++) {
        let manualIds: number[] = [];
        for (let itemIndex: number = 0; itemIndex < items.length; itemIndex++) {
          if (items[itemIndex].category === categories[categoryIndex]) {
            manualIds.push(items[itemIndex].id);
          }
        }
        let group: Goods[] = catalog.byCategory(categories[categoryIndex]);
        let groupIds: number[] = [];
        for (let groupIndex: number = 0; groupIndex < group.length; groupIndex++) {
          groupIds.push(group[groupIndex].id);
        }

        expect((groupIds).length).assertEqual((manualIds).length);
        for (let __i69: number = 0; __i69 < (manualIds).length; __i69++) {
          expect((groupIds)[__i69]).assertEqual((manualIds)[__i69]);
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0090
     * @tc.name      grouping_unknown_category_lookups_do_not_disturb_the_catalog_009
     * @tc.desc      Verify grouping unknown category lookups do not disturb the catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_unknown_category_lookups_do_not_disturb_the_catalog_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_unknown_category_lookups_do_not_disturb_the_catalog_009');
      let before: string[] = catalog.categories();
      let absent: string[] = ['laptop', 'camera', 'headphones'];
      for (let index: number = 0; index < absent.length; index++) {
        let group: Goods[] = catalog.byCategory(absent[index]);
        expect(group.length).assertEqual(0);
      }
      let after: string[] = catalog.categories();
      expect((after).length).assertEqual((before).length);
      for (let __i77: number = 0; __i77 < (before).length; __i77++) {
        expect((after)[__i77]).assertEqual((before)[__i77]);
      }
      expect(catalog.count()).assertEqual(16);
      expect(catalog.byCategory('laptop').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0100
     * @tc.name      grouping_lookup_is_case_sensitive_010
     * @tc.desc      Verify grouping lookup is case sensitive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_lookup_is_case_sensitive_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_lookup_is_case_sensitive_010');
      // Title-case and upper-case spellings are refused, so the lookup is a raw string
      // comparison with no normalisation.
      let rejected: string[] = ['Phone', 'PHONE', 'Sport', 'FOOD'];
      for (let index: number = 0; index < rejected.length; index++) {
        expect(catalog.byCategory(rejected[index]).length).assertEqual(0);
      }
      expect(catalog.byCategory(CATEGORY_PHONE).length).assertEqual(6);
      expect(catalog.byCategory(CATEGORY_SPORT).length).assertEqual(4);
      expect(catalog.byCategory(CATEGORY_FOOD).length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0110
     * @tc.name      grouping_lookup_requires_the_full_equality_011
     * @tc.desc      Verify grouping lookup requires the full equality.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_lookup_requires_the_full_equality_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_lookup_requires_the_full_equality_011');
      // Prefix, plural, underscore, leading-space and trailing-space variants all miss,
      // which pins equality instead of substring matching.
      let nearMisses: string[] = ['phon', 'phones', 'phone_', ' phone', 'phone '];
      for (let index: number = 0; index < nearMisses.length; index++) {
        expect(catalog.byCategory(nearMisses[index]).length).assertEqual(0);
      }
      expect(catalog.byCategory(CATEGORY_PHONE).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0120
     * @tc.name      grouping_empty_string_is_not_a_category_of_the_fixture_012
     * @tc.desc      Verify grouping empty string is not a category of the fixture.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_empty_string_is_not_a_category_of_the_fixture_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_empty_string_is_not_a_category_of_the_fixture_012');
      expect(catalog.byCategory('').length).assertEqual(0);
      let categories: string[] = catalog.categories();
      let emptyCount: number = 0;
      for (let index: number = 0; index < categories.length; index++) {
        if (categories[index].length === 0) {
          emptyCount++;
        }
      }
      expect(emptyCount).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0130
     * @tc.name      grouping_empty_catalog_has_no_categories_013
     * @tc.desc      Verify grouping empty catalog has no categories.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_empty_catalog_has_no_categories_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_empty_catalog_has_no_categories_013');
      let empty: Catalog = new Catalog([]);
      let categories: string[] = empty.categories();
      expect(categories.length).assertEqual(0);
      expect(empty.count()).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0140
     * @tc.name      grouping_empty_catalog_returns_empty_groups_014
     * @tc.desc      Verify grouping empty catalog returns empty groups.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_empty_catalog_returns_empty_groups_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_empty_catalog_returns_empty_groups_014');
      let empty: Catalog = new Catalog([]);
      let names: string[] = [CATEGORY_PHONE, CATEGORY_FOOD, ''];
      for (let index: number = 0; index < names.length; index++) {
        expect(empty.byCategory(names[index]).length).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0150
     * @tc.name      grouping_by_category_returns_a_fresh_array_each_call_015
     * @tc.desc      Verify grouping by category returns a fresh array each call.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_by_category_returns_a_fresh_array_each_call_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_by_category_returns_a_fresh_array_each_call_015');
      let first: Goods[] = catalog.byCategory(CATEGORY_PHONE);
      let second: Goods[] = catalog.byCategory(CATEGORY_PHONE);
      expect(first !== second).assertTrue();
      expect(first.length).assertEqual(6);
      expect(second.length).assertEqual(6);
      // Removing one row from the first result must leave the second result at 6 and the
      // catalog at 16.
      first.splice(0, 1);
      expect(first.length).assertEqual(5);
      expect(second.length).assertEqual(6);
      expect(catalog.count()).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0160
     * @tc.name      grouping_categories_result_is_detached_from_the_catalog_016
     * @tc.desc      Verify grouping categories result is detached from the catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_categories_result_is_detached_from_the_catalog_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_categories_result_is_detached_from_the_catalog_016');
      let first: string[] = catalog.categories();
      first.splice(0, 2);
      expect(first.length).assertEqual(3);
      let second: string[] = catalog.categories();
      expect(second.length).assertEqual(5);
      expect((second).length).assertEqual(([CATEGORY_PHONE, CATEGORY_SPORT, CATEGORY_FOOD,
        CATEGORY_APPLIANCE, CATEGORY_WEAR]).length);
      for (let __i78: number = 0; __i78 < ([CATEGORY_PHONE, CATEGORY_SPORT, CATEGORY_FOOD,
        CATEGORY_APPLIANCE, CATEGORY_WEAR]).length; __i78++) {
        expect((second)[__i78]).assertEqual(([CATEGORY_PHONE, CATEGORY_SPORT, CATEGORY_FOOD,
        CATEGORY_APPLIANCE, CATEGORY_WEAR])[__i78]);
      }
      expect(catalog.count()).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0170
     * @tc.name      grouping_keeps_duplicate_identifier_rows_in_one_group_017
     * @tc.desc      Verify grouping keeps duplicate identifier rows in one group.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_keeps_duplicate_identifier_rows_in_one_group_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_keeps_duplicate_identifier_rows_in_one_group_017');
      let duplicate: Catalog = new Catalog([
        createGoods(7, 'First Seven', 1000, CATEGORY_PHONE),
        createGoods(7, 'Second Seven', 2000, CATEGORY_PHONE)
      ]);
      let group: Goods[] = duplicate.byCategory(CATEGORY_PHONE);
      expect(group.length).assertEqual(2);
      expect(group[0].id).assertEqual(7);
      expect(group[1].id).assertEqual(7);
      expect(group[0].title).assertEqual('First Seven');
      // Two rows share goods id 7 and both are phone, so the group keeps 2 entries instead
      // of collapsing them by id.
      expect(group[1].title).assertEqual('Second Seven');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0180
     * @tc.name      grouping_single_item_catalog_has_one_category_018
     * @tc.desc      Verify grouping single item catalog has one category.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_single_item_catalog_has_one_category_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_single_item_catalog_has_one_category_018');
      let single: Catalog = new Catalog([
        createGoods(600, 'Single Category Item', 1000, CATEGORY_FOOD)
      ]);
      expect((single.categories()).length).assertEqual(([CATEGORY_FOOD]).length);
      for (let __i79: number = 0; __i79 < ([CATEGORY_FOOD]).length; __i79++) {
        expect((single.categories())[__i79]).assertEqual(([CATEGORY_FOOD])[__i79]);
      }
      expect(single.byCategory(CATEGORY_FOOD).length).assertEqual(1);
      expect(single.byCategory(CATEGORY_PHONE).length).assertEqual(0);
      expect(single.byCategory(CATEGORY_FOOD)[0].id).assertEqual(600);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0190
     * @tc.name      grouping_single_category_catalog_collapses_to_one_group_019
     * @tc.desc      Verify grouping single category catalog collapses to one group.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_single_category_catalog_collapses_to_one_group_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_single_category_catalog_collapses_to_one_group_019');
      let same: Catalog = new Catalog([
        createGoods(601, 'Same One', 1000, CATEGORY_APPLIANCE),
        createGoods(602, 'Same Two', 2000, CATEGORY_APPLIANCE),
        createGoods(603, 'Same Three', 3000, CATEGORY_APPLIANCE)
      ]);
      let categories: string[] = same.categories();
      expect(categories.length).assertEqual(1);
      expect(categories[0]).assertEqual(CATEGORY_APPLIANCE);
      expect(same.byCategory(CATEGORY_APPLIANCE).length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0200
     * @tc.name      grouping_all_distinct_categories_keep_insertion_order_020
     * @tc.desc      Verify grouping all distinct categories keep insertion order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_all_distinct_categories_keep_insertion_order_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_all_distinct_categories_keep_insertion_order_020');
      let distinct: Catalog = new Catalog([
        createGoods(604, 'Distinct Sport', 1000, CATEGORY_SPORT),
        createGoods(605, 'Distinct Food', 1000, CATEGORY_FOOD),
        createGoods(606, 'Distinct Phone', 1000, CATEGORY_PHONE),
        createGoods(607, 'Distinct Wear', 1000, CATEGORY_WEAR)
      ]);
      expect((distinct.categories()).length).assertEqual(([CATEGORY_SPORT, CATEGORY_FOOD,
        CATEGORY_PHONE, CATEGORY_WEAR]).length);
      for (let __i80: number = 0; __i80 < ([CATEGORY_SPORT, CATEGORY_FOOD,
        CATEGORY_PHONE, CATEGORY_WEAR]).length; __i80++) {
        expect((distinct.categories())[__i80]).assertEqual(([CATEGORY_SPORT, CATEGORY_FOOD,
        CATEGORY_PHONE, CATEGORY_WEAR])[__i80]);
      }
      expect(distinct.byCategory(CATEGORY_SPORT).length).assertEqual(1);
      expect(distinct.byCategory(CATEGORY_FOOD).length).assertEqual(1);
      expect(distinct.byCategory(CATEGORY_PHONE).length).assertEqual(1);
      expect(distinct.byCategory(CATEGORY_WEAR).length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0210
     * @tc.name      grouping_singleton_category_stays_separate_021
     * @tc.desc      Verify grouping singleton category stays separate.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_singleton_category_stays_separate_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_singleton_category_stays_separate_021');
      let mixed: Catalog = new Catalog([
        createGoods(608, 'Mixed Phone One', 1000, CATEGORY_PHONE),
        createGoods(609, 'Mixed Food', 1000, CATEGORY_FOOD),
        createGoods(610, 'Mixed Phone Two', 1000, CATEGORY_PHONE)
      ]);
      expect((mixed.categories()).length).assertEqual(([CATEGORY_PHONE, CATEGORY_FOOD]).length);
      for (let __i81: number = 0; __i81 < ([CATEGORY_PHONE, CATEGORY_FOOD]).length; __i81++) {
        expect((mixed.categories())[__i81]).assertEqual(([CATEGORY_PHONE, CATEGORY_FOOD])[__i81]);
      }
      expect(mixed.byCategory(CATEGORY_PHONE).length).assertEqual(2);
      expect(mixed.byCategory(CATEGORY_FOOD).length).assertEqual(1);
      expect(mixed.byCategory(CATEGORY_FOOD)[0].id).assertEqual(609);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0220
     * @tc.name      grouping_preserves_the_stored_category_spelling_022
     * @tc.desc      Verify grouping preserves the stored category spelling.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_preserves_the_stored_category_spelling_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_preserves_the_stored_category_spelling_022');
      let spelled: Catalog = new Catalog([
        createGoods(611, 'Spelled Item', 1000, 'Men_Wear')
      ]);
      expect((spelled.categories()).length).assertEqual((['Men_Wear']).length);
      for (let __i82: number = 0; __i82 < (['Men_Wear']).length; __i82++) {
        expect((spelled.categories())[__i82]).assertEqual((['Men_Wear'])[__i82]);
      }
      expect(spelled.byCategory('Men_Wear').length).assertEqual(1);
      expect(spelled.byCategory('men_wear').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0230
     * @tc.name      grouping_ignores_stock_availability_023
     * @tc.desc      Verify grouping ignores stock availability.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_ignores_stock_availability_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_ignores_stock_availability_023');
      let group: Goods[] = catalog.byCategory(CATEGORY_PHONE);
      let ids: number[] = [];
      for (let index: number = 0; index < group.length; index++) {
        ids.push(group[index].id);
      }
      expect(group.length).assertEqual(6);
      expect(ids.indexOf(6) >= 0).assertTrue();
      expect(ids.indexOf(14) >= 0).assertTrue();
      // The sold-out phone rows (ids 6 and 14) still appear, so grouping filters on the
      // category field and never on stock.
      expect(group[2].isInStock()).assertFalse();
      expect(group[5].isInStock()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0240
     * @tc.name      grouping_uses_the_category_field_not_the_title_024
     * @tc.desc      Verify grouping uses the category field not the title.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_uses_the_category_field_not_the_title_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_uses_the_category_field_not_the_title_024');
      let sameTitle: Catalog = new Catalog([
        createGoods(612, 'Twin Title', 1000, CATEGORY_PHONE),
        createGoods(613, 'Twin Title', 2000, CATEGORY_FOOD)
      ]);
      expect(sameTitle.byCategory(CATEGORY_PHONE).length).assertEqual(1);
      expect(sameTitle.byCategory(CATEGORY_FOOD).length).assertEqual(1);
      expect(sameTitle.byCategory(CATEGORY_PHONE)[0].id).assertEqual(612);
      expect(sameTitle.byCategory(CATEGORY_FOOD)[0].id).assertEqual(613);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0250
     * @tc.name      grouping_by_category_does_not_reorder_the_catalog_025
     * @tc.desc      Verify grouping by category does not reorder the catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_by_category_does_not_reorder_the_catalog_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_by_category_does_not_reorder_the_catalog_025');
      let before: number[] = catalog.ids();
      let group: Goods[] = catalog.byCategory(CATEGORY_FOOD);
      expect(group.length).assertEqual(2);
      let after: number[] = catalog.ids();
      expect((after).length).assertEqual((before).length);
      for (let __i70: number = 0; __i70 < (before).length; __i70++) {
        expect((after)[__i70]).assertEqual((before)[__i70]);
      }
      expect(after[0]).assertEqual(0);
      expect(after[15]).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0260
     * @tc.name      grouping_multiple_catalogs_stay_independent_026
     * @tc.desc      Verify grouping multiple catalogs stay independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_multiple_catalogs_stay_independent_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_multiple_catalogs_stay_independent_026');
      let phoneOnly: Catalog = new Catalog([
        createGoods(614, 'Only Phone', 1000, CATEGORY_PHONE)
      ]);
      let foodOnly: Catalog = new Catalog([
        createGoods(615, 'Only Food', 1000, CATEGORY_FOOD)
      ]);
      expect((phoneOnly.categories()).length).assertEqual(([CATEGORY_PHONE]).length);
      for (let __i83: number = 0; __i83 < ([CATEGORY_PHONE]).length; __i83++) {
        expect((phoneOnly.categories())[__i83]).assertEqual(([CATEGORY_PHONE])[__i83]);
      }
      expect((foodOnly.categories()).length).assertEqual(([CATEGORY_FOOD]).length);
      for (let __i84: number = 0; __i84 < ([CATEGORY_FOOD]).length; __i84++) {
        expect((foodOnly.categories())[__i84]).assertEqual(([CATEGORY_FOOD])[__i84]);
      }
      expect(phoneOnly.byCategory(CATEGORY_FOOD).length).assertEqual(0);
      expect(foodOnly.byCategory(CATEGORY_PHONE).length).assertEqual(0);
      expect(phoneOnly.count()).assertEqual(1);
      expect(foodOnly.count()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0270
     * @tc.name      grouping_empty_string_category_is_listed_verbatim_027
     * @tc.desc      Verify grouping empty string category is listed verbatim.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_empty_string_category_is_listed_verbatim_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_empty_string_category_is_listed_verbatim_027');
      let blank: Catalog = new Catalog([
        createGoods(616, 'Blank Category Item', 1000, ''),
        createGoods(617, 'Named Category Item', 1000, CATEGORY_PHONE)
      ]);
      expect((blank.categories()).length).assertEqual((['', CATEGORY_PHONE]).length);
      for (let __i85: number = 0; __i85 < (['', CATEGORY_PHONE]).length; __i85++) {
        expect((blank.categories())[__i85]).assertEqual((['', CATEGORY_PHONE])[__i85]);
      }
      // An empty category string is a value like any other: it is listed first and
      // byCategory('') returns the blank row.
      expect(blank.byCategory('').length).assertEqual(1);
      expect(blank.byCategory('')[0].id).assertEqual(616);
      expect(blank.byCategory(CATEGORY_PHONE).length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0280
     * @tc.name      grouping_partitions_every_identifier_into_one_group_028
     * @tc.desc      Verify grouping partitions every identifier into one group.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_partitions_every_identifier_into_one_group_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_partitions_every_identifier_into_one_group_028');
      let categories: string[] = catalog.categories();
      // Each of the 16 ids must land in exactly one group, so a duplicated or dropped row
      // shows up as a seen count other than 1.
      let seen: number[] = [];
      for (let index: number = 0; index < catalog.count(); index++) {
        seen.push(0);
      }
      for (let categoryIndex: number = 0; categoryIndex < categories.length; categoryIndex++) {
        let group: Goods[] = catalog.byCategory(categories[categoryIndex]);
        for (let itemIndex: number = 0; itemIndex < group.length; itemIndex++) {
          let identifier: number = group[itemIndex].id;
          seen[identifier] = seen[identifier] + 1;
        }
      }
      for (let identifier: number = 0; identifier < seen.length; identifier++) {

        expect(seen[identifier]).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0290
     * @tc.name      grouping_categories_are_stable_across_repeated_calls_029
     * @tc.desc      Verify grouping categories are stable across repeated calls.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_categories_are_stable_across_repeated_calls_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_categories_are_stable_across_repeated_calls_029');
      let first: string[] = catalog.categories();
      let second: string[] = catalog.categories();
      expect((first).length).assertEqual((second).length);
      for (let __i86: number = 0; __i86 < (second).length; __i86++) {
        expect((first)[__i86]).assertEqual((second)[__i86]);
      }
      expect(first.length).assertEqual(second.length);
      expect(first[1]).assertEqual(second[1]);
      expect(first[1]).assertEqual(CATEGORY_SPORT);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0300
     * @tc.name      grouping_group_contents_are_stable_across_repeated_calls_030
     * @tc.desc      Verify grouping group contents are stable across repeated calls.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_group_contents_are_stable_across_repeated_calls_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_group_contents_are_stable_across_repeated_calls_030');
      let first: Goods[] = catalog.byCategory(CATEGORY_SPORT);
      let second: Goods[] = catalog.byCategory(CATEGORY_SPORT);
      let firstIds: number[] = [];
      let secondIds: number[] = [];
      for (let index: number = 0; index < first.length; index++) {
        firstIds.push(first[index].id);
      }
      for (let index: number = 0; index < second.length; index++) {
        secondIds.push(second[index].id);
      }
      expect((firstIds).length).assertEqual((secondIds).length);
      for (let __i71: number = 0; __i71 < (secondIds).length; __i71++) {
        expect((firstIds)[__i71]).assertEqual((secondIds)[__i71]);
      }
      expect((firstIds).length).assertEqual(([2, 3, 10, 11]).length);
      for (let __i72: number = 0; __i72 < ([2, 3, 10, 11]).length; __i72++) {
        expect((firstIds)[__i72]).assertEqual(([2, 3, 10, 11])[__i72]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0310
     * @tc.name      grouping_live_category_mutation_moves_membership_031
     * @tc.desc      Verify grouping live category mutation moves membership.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_live_category_mutation_moves_membership_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_live_category_mutation_moves_membership_031');
      let first: Goods = createGoods(618, 'Moving Phone', 1000, CATEGORY_PHONE);
      let second: Goods = createGoods(619, 'Staying Phone', 1000, CATEGORY_PHONE);
      let third: Goods = createGoods(620, 'Existing Food', 1000, CATEGORY_FOOD);
      let local: Catalog = new Catalog([first, second, third]);
      expect(local.byCategory(CATEGORY_PHONE).length).assertEqual(2);
      expect(local.byCategory(CATEGORY_FOOD).length).assertEqual(1);
      // Editing one goods object without recreating it must move it between groups, because byCategory
      // reads the live category field rather than a cached index.
      first.category = CATEGORY_FOOD;
      expect(local.byCategory(CATEGORY_PHONE).length).assertEqual(1);
      expect(local.byCategory(CATEGORY_FOOD).length).assertEqual(2);
      expect(local.byCategory(CATEGORY_PHONE)[0].id).assertEqual(619);
      expect(local.byCategory(CATEGORY_FOOD)[0].id).assertEqual(618);
      expect(local.byCategory(CATEGORY_FOOD)[1].id).assertEqual(620);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0320
     * @tc.name      grouping_live_stock_mutation_keeps_membership_032
     * @tc.desc      Verify grouping live stock mutation keeps membership.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_live_stock_mutation_keeps_membership_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_live_stock_mutation_keeps_membership_032');
      let item: Goods = createGoods(621, 'Stock Moving Item', 1000, CATEGORY_PHONE, 'stock probe',
        'basic_label', 5);
      let local: Catalog = new Catalog([item]);
      expect(local.byCategory(CATEGORY_PHONE).length).assertEqual(1);
      item.stock = 0;
      expect(item.isInStock()).assertFalse();
      expect(local.byCategory(CATEGORY_PHONE).length).assertEqual(1);
      expect(local.byCategory(CATEGORY_PHONE)[0].category).assertEqual(CATEGORY_PHONE);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0330
     * @tc.name      grouping_underscore_category_is_matched_literally_033
     * @tc.desc      Verify grouping underscore category is matched literally.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_underscore_category_is_matched_literally_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_underscore_category_is_matched_literally_033');
      let group: Goods[] = catalog.byCategory(CATEGORY_WEAR);
      expect(group.length).assertEqual(2);
      expect(group[0].id).assertEqual(7);
      expect(group[1].id).assertEqual(15);
      expect(catalog.byCategory('men wear').length).assertEqual(0);
      expect(group[0].category).assertEqual(CATEGORY_WEAR);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0340
     * @tc.name      grouping_unknown_lookup_returns_a_fresh_empty_array_034
     * @tc.desc      Verify grouping unknown lookup returns a fresh empty array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_unknown_lookup_returns_a_fresh_empty_array_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_unknown_lookup_returns_a_fresh_empty_array_034');
      let first: Goods[] = catalog.byCategory('tablet');
      let second: Goods[] = catalog.byCategory('tablet');
      expect(first.length).assertEqual(0);
      expect(second.length).assertEqual(0);
      expect(first !== second).assertTrue();
      expect(catalog.count()).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0350
     * @tc.name      grouping_duplicate_rows_keep_their_prices_035
     * @tc.desc      Verify grouping duplicate rows keep their prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_duplicate_rows_keep_their_prices_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_duplicate_rows_keep_their_prices_035');
      let duplicate: Catalog = new Catalog([
        createGoods(700, 'Price Seven Low', 1000, CATEGORY_FOOD),
        createGoods(700, 'Price Seven High', 9000, CATEGORY_FOOD)
      ]);
      let group: Goods[] = duplicate.byCategory(CATEGORY_FOOD);
      expect(group.length).assertEqual(2);
      expect(group[0].price.cents()).assertEqual(1000);
      expect(group[1].price.cents()).assertEqual(9000);
      expect(([group[0].id, group[1].id]).length).assertEqual(([700, 700]).length);
      for (let __i73: number = 0; __i73 < ([700, 700]).length; __i73++) {
        expect(([group[0].id, group[1].id])[__i73]).assertEqual(([700, 700])[__i73]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0360
     * @tc.name      grouping_crafted_distribution_reports_matching_counts_036
     * @tc.desc      Verify grouping crafted distribution reports matching counts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_crafted_distribution_reports_matching_counts_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_crafted_distribution_reports_matching_counts_036');
      let crafted: Catalog = new Catalog([
        createGoods(701, 'A One', 1000, 'alpha'),
        createGoods(702, 'A Two', 1000, 'alpha'),
        createGoods(703, 'B One', 1000, 'beta'),
        createGoods(704, 'C One', 1000, 'gamma'),
        createGoods(705, 'C Two', 1000, 'gamma'),
        createGoods(706, 'C Three', 1000, 'gamma')
      ]);
      expect((crafted.categories()).length).assertEqual((['alpha', 'beta', 'gamma']).length);
      for (let __i87: number = 0; __i87 < (['alpha', 'beta', 'gamma']).length; __i87++) {
        expect((crafted.categories())[__i87]).assertEqual((['alpha', 'beta', 'gamma'])[__i87]);
      }
      expect(crafted.byCategory('alpha').length).assertEqual(2);
      expect(crafted.byCategory('beta').length).assertEqual(1);
      expect(crafted.byCategory('gamma').length).assertEqual(3);
      expect(crafted.byCategory('alpha').length + crafted.byCategory('beta').length +
        crafted.byCategory('gamma').length).assertEqual(crafted.count());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0370
     * @tc.name      grouping_every_group_carries_its_category_label_037
     * @tc.desc      Verify grouping every group carries its category label.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_every_group_carries_its_category_label_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_every_group_carries_its_category_label_037');
      let categories: string[] = catalog.categories();
      for (let categoryIndex: number = 0; categoryIndex < categories.length; categoryIndex++) {
        let group: Goods[] = catalog.byCategory(categories[categoryIndex]);
        expect(group.length > 0).assertTrue();
        for (let itemIndex: number = 0; itemIndex < group.length; itemIndex++) {
          expect(group[itemIndex].category).assertEqual(categories[categoryIndex]);
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0380
     * @tc.name      grouping_interleaved_categories_keep_first_appearance_order_038
     * @tc.desc      Verify grouping interleaved categories keep first appearance order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_interleaved_categories_keep_first_appearance_order_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_interleaved_categories_keep_first_appearance_order_038');
      let interleaved: Catalog = new Catalog([
        // Beta appears first even though alpha sorts earlier, so the order is first
        // appearance, not alphabetical.
        createGoods(707, 'Beta First', 1000, 'beta'),
        createGoods(708, 'Alpha Second', 1000, 'alpha'),
        createGoods(709, 'Beta Third', 1000, 'beta'),
        createGoods(710, 'Gamma Fourth', 1000, 'gamma')
      ]);
      expect((interleaved.categories()).length).assertEqual((['beta', 'alpha', 'gamma']).length);
      for (let __i88: number = 0; __i88 < (['beta', 'alpha', 'gamma']).length; __i88++) {
        expect((interleaved.categories())[__i88]).assertEqual((['beta', 'alpha', 'gamma'])[__i88]);
      }
      expect(interleaved.byCategory('beta').length).assertEqual(2);
      expect(interleaved.byCategory('alpha').length).assertEqual(1);
      expect(interleaved.byCategory('gamma').length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0390
     * @tc.name      grouping_phone_group_includes_both_sold_out_rows_039
     * @tc.desc      Verify grouping phone group includes both sold out rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_phone_group_includes_both_sold_out_rows_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_phone_group_includes_both_sold_out_rows_039');
      let group: Goods[] = catalog.byCategory(CATEGORY_PHONE);
      let soldOut: number[] = [];
      for (let index: number = 0; index < group.length; index++) {
        if (!group[index].isInStock()) {
          soldOut.push(group[index].id);
        }
      }
      expect((soldOut).length).assertEqual(([6, 14]).length);
      for (let __i74: number = 0; __i74 < ([6, 14]).length; __i74++) {
        expect((soldOut)[__i74]).assertEqual(([6, 14])[__i74]);
      }
      expect(group.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0400
     * @tc.name      grouping_category_at_both_ends_keeps_first_and_last_rows_040
     * @tc.desc      Verify grouping category at both ends keeps first and last rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_category_at_both_ends_keeps_first_and_last_rows_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_category_at_both_ends_keeps_first_and_last_rows_040');
      let group: Goods[] = catalog.byCategory(CATEGORY_PHONE);
      let firstId: number = group[0].id;
      let lastId: number = group[group.length - 1].id;
      expect(firstId).assertEqual(0);
      expect(lastId).assertEqual(14);
      expect(firstId).assertEqual(catalog.ids()[0]);
      expect(lastId).assertEqual(catalog.ids()[14]);
      // Phone rows open the catalog at id 0 and end at id 14, and the final row 15 belongs
      // to wear, so the group spans the fixture without touching the last slot.
      expect(catalog.all()[15].category).assertEqual(CATEGORY_WEAR);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0410
     * @tc.name      grouping_by_category_calls_do_not_change_the_category_list_041
     * @tc.desc      Verify grouping by category calls do not change the category list.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_by_category_calls_do_not_change_the_category_list_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_by_category_calls_do_not_change_the_category_list_041');
      let before: string[] = catalog.categories();
      catalog.byCategory(CATEGORY_FOOD);
      catalog.byCategory('tablet');
      catalog.byCategory('');
      let after: string[] = catalog.categories();
      expect((after).length).assertEqual((before).length);
      for (let __i89: number = 0; __i89 < (before).length; __i89++) {
        expect((after)[__i89]).assertEqual((before)[__i89]);
      }
      expect(after.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0420
     * @tc.name      grouping_absent_category_in_a_crafted_catalog_is_empty_042
     * @tc.desc      Verify grouping absent category in a crafted catalog is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_absent_category_in_a_crafted_catalog_is_empty_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_absent_category_in_a_crafted_catalog_is_empty_042');
      let crafted: Catalog = new Catalog([
        createGoods(711, 'Alpha Only', 1000, 'alpha'),
        createGoods(712, 'Beta Only', 1000, 'beta')
      ]);
      expect(crafted.byCategory(CATEGORY_PHONE).length).assertEqual(0);
      expect(crafted.byCategory('gamma').length).assertEqual(0);
      expect(crafted.byCategory('alpha').length).assertEqual(1);
      expect(crafted.byCategory('beta').length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0430
     * @tc.name      grouping_group_identifiers_belong_to_the_catalog_043
     * @tc.desc      Verify grouping group identifiers belong to the catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_group_identifiers_belong_to_the_catalog_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_group_identifiers_belong_to_the_catalog_043');
      let catalogIds: number[] = catalog.ids();
      let categories: string[] = catalog.categories();
      for (let categoryIndex: number = 0; categoryIndex < categories.length; categoryIndex++) {
        let group: Goods[] = catalog.byCategory(categories[categoryIndex]);
        for (let itemIndex: number = 0; itemIndex < group.length; itemIndex++) {
          expect(catalogIds.indexOf(group[itemIndex].id) >= 0).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0440
     * @tc.name      grouping_reports_the_fixture_group_sizes_in_order_044
     * @tc.desc      Verify grouping reports the fixture group sizes in order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_reports_the_fixture_group_sizes_in_order_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_reports_the_fixture_group_sizes_in_order_044');
      let categories: string[] = catalog.categories();
      let sizes: number[] = [];
      for (let index: number = 0; index < categories.length; index++) {
        sizes.push(catalog.byCategory(categories[index]).length);
      }
      expect((sizes).length).assertEqual(([6, 4, 2, 2, 2]).length);
      for (let __i75: number = 0; __i75 < ([6, 4, 2, 2, 2]).length; __i75++) {
        expect((sizes)[__i75]).assertEqual(([6, 4, 2, 2, 2])[__i75]);
      }
      expect(sizes.length).assertEqual(5);
      expect(sizes[0]).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0450
     * @tc.name      grouping_does_not_merge_similar_category_names_045
     * @tc.desc      Verify grouping does not merge similar category names.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_does_not_merge_similar_category_names_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_does_not_merge_similar_category_names_045');
      let similar: Catalog = new Catalog([
        createGoods(713, 'Lower Phone', 1000, 'phone'),
        createGoods(714, 'Upper Phone', 1000, 'Phone'),
        createGoods(715, 'Plural Phones', 1000, 'phones'),
        createGoods(716, 'Spaced Phone', 1000, ' phone')
      ]);
      let categories: string[] = similar.categories();
      // Lower-case, title-case, plural and space-prefixed spellings stay four distinct
      // groups, so no trimming or case folding happens.
      expect(categories.length).assertEqual(4);
      let __seen100: string[] = [];
      for (let __i100: number = 0; __i100 < (categories).length; __i100++) {
        expect(__seen100.indexOf((categories)[__i100]) < 0).assertTrue();
        __seen100.push((categories)[__i100]);
      }
      expect(similar.byCategory('phone').length).assertEqual(1);
      expect(similar.byCategory('Phone').length).assertEqual(1);
      expect(similar.byCategory('phones').length).assertEqual(1);
      expect(similar.byCategory(' phone').length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0460
     * @tc.name      grouping_singleton_category_count_is_one_046
     * @tc.desc      Verify grouping singleton category count is one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_singleton_category_count_is_one_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_singleton_category_count_is_one_046');
      let mixed: Catalog = new Catalog([
        createGoods(717, 'Solo Food', 1000, CATEGORY_FOOD),
        createGoods(718, 'Phone One', 1000, CATEGORY_PHONE),
        createGoods(719, 'Phone Two', 1000, CATEGORY_PHONE)
      ]);
      expect(mixed.byCategory(CATEGORY_FOOD).length).assertEqual(1);
      expect(mixed.byCategory(CATEGORY_PHONE).length).assertEqual(2);
      expect(mixed.categories().length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0470
     * @tc.name      grouping_empty_category_group_is_separate_from_phone_047
     * @tc.desc      Verify grouping empty category group is separate from phone.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_empty_category_group_is_separate_from_phone_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_empty_category_group_is_separate_from_phone_047');
      let blank: Catalog = new Catalog([
        createGoods(720, 'Blank One', 1000, ''),
        createGoods(721, 'Blank Two', 2000, ''),
        createGoods(722, 'Phone One', 3000, CATEGORY_PHONE)
      ]);
      let blankIds: number[] = [];
      let blankGroup: Goods[] = blank.byCategory('');
      for (let index: number = 0; index < blankGroup.length; index++) {
        blankIds.push(blankGroup[index].id);
      }

      expect(blank.byCategory('').length).assertEqual(2);
      expect(blank.byCategory(CATEGORY_PHONE).length).assertEqual(1);
      expect(blankIds.indexOf(720) >= 0).assertTrue();
      expect(blankIds.indexOf(722) < 0).assertTrue();
      expect((blank.categories()).length).assertEqual((['', CATEGORY_PHONE]).length);
      for (let __i90: number = 0; __i90 < (['', CATEGORY_PHONE]).length; __i90++) {
        expect((blank.categories())[__i90]).assertEqual((['', CATEGORY_PHONE])[__i90]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0480
     * @tc.name      grouping_category_names_are_opaque_strings_048
     * @tc.desc      Verify grouping category names are opaque strings.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_category_names_are_opaque_strings_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_category_names_are_opaque_strings_048');
      let names: string[] = ['A', 'home appliance', '2025', ' '];
      let seconds: string[] = ['B', CATEGORY_PHONE, '2024', CATEGORY_PHONE];
      let ids: number[] = [800, 802, 804, 850];
      let probes: string[] = ['a', 'homeappliance', '2026', ''];

      expect(names.length).assertEqual(ids.length);
      expect(seconds.length).assertEqual(probes.length);
      for (let index: number = 0; index < names.length; index++) {
        let catalog: Catalog = new Catalog([
          createGoods(ids[index], 'Primary Item', 1000, names[index]),
          createGoods(ids[index] + 1, 'Second Item', 1000, seconds[index])
        ]);
        expect((catalog.categories()).length).assertEqual(([names[index], seconds[index]]).length);
        for (let __i91: number = 0; __i91 < ([names[index], seconds[index]]).length; __i91++) {
          expect((catalog.categories())[__i91]).assertEqual(([names[index], seconds[index]])[__i91]);
        }
        expect(catalog.byCategory(names[index]).length).assertEqual(1);
        expect(catalog.byCategory(names[index])[0].id).assertEqual(ids[index]);
        expect(catalog.byCategory(probes[index]).length).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0490
     * @tc.name      grouping_large_category_group_keeps_all_rows_049
     * @tc.desc      Verify grouping large category group keeps all rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_large_category_group_keeps_all_rows_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_large_category_group_keeps_all_rows_049');
      let bulk: Goods[] = [];
      for (let index: number = 0; index < 10; index++) {
        bulk.push(createGoods(810 + index, 'Bulk Item', 1000, 'bulk'));
      }
      let large: Catalog = new Catalog(bulk);
      let group: Goods[] = large.byCategory('bulk');
      expect(group.length).assertEqual(10);
      expect(group[0].id).assertEqual(810);
      // Ten generated rows with ids 810..819 must all sit in the single bulk group.
      expect(group[9].id).assertEqual(819);
      expect((large.categories()).length).assertEqual((['bulk']).length);
      for (let __i92: number = 0; __i92 < (['bulk']).length; __i92++) {
        expect((large.categories())[__i92]).assertEqual((['bulk'])[__i92]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0500
     * @tc.name      grouping_many_distinct_categories_are_all_listed_050
     * @tc.desc      Verify grouping many distinct categories are all listed.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_many_distinct_categories_are_all_listed_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_many_distinct_categories_are_all_listed_050');
      let items: Goods[] = [];
      for (let index: number = 0; index < 10; index++) {
        items.push(createGoods(830 + index, 'Distinct Item', 1000, 'cat' + index.toString()));
      }
      let many: Catalog = new Catalog(items);
      let categories: string[] = many.categories();
      expect(categories.length).assertEqual(10);
      let __seen101: string[] = [];
      for (let __i101: number = 0; __i101 < (categories).length; __i101++) {
        expect(__seen101.indexOf((categories)[__i101]) < 0).assertTrue();
        __seen101.push((categories)[__i101]);
      }
      for (let index: number = 0; index < categories.length; index++) {
        expect(many.byCategory(categories[index]).length).assertEqual(1);
      }
      expect(many.byCategory('cat0').length).assertEqual(1);
      expect(many.byCategory('cat9').length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0510
     * @tc.name      grouping_live_category_edit_adds_and_removes_categories_051
     * @tc.desc      Verify grouping live category edit adds and removes categories.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_live_category_edit_adds_and_removes_categories_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_live_category_edit_adds_and_removes_categories_051');
      let phone: Goods = createGoods(820, 'Edited Phone', 1000, CATEGORY_PHONE);
      let mover: Goods = createGoods(821, 'Edited Mover', 1000, CATEGORY_FOOD);
      let toys: Goods = createGoods(822, 'Existing Toy', 1000, 'toys');
      let local: Catalog = new Catalog([phone, mover, toys]);
      expect((local.categories()).length).assertEqual(([CATEGORY_PHONE, CATEGORY_FOOD, 'toys']).length);
      for (let __i93: number = 0; __i93 < ([CATEGORY_PHONE, CATEGORY_FOOD, 'toys']).length; __i93++) {
        expect((local.categories())[__i93]).assertEqual(([CATEGORY_PHONE, CATEGORY_FOOD, 'toys'])[__i93]);
      }
      // Once mover joins toys, the now-empty food category must disappear and the list
      // shrink to phone and toys.
      mover.category = 'toys';
      expect(local.byCategory(CATEGORY_FOOD).length).assertEqual(0);
      expect(local.byCategory('toys').length).assertEqual(2);
      expect((local.categories()).length).assertEqual(([CATEGORY_PHONE, 'toys']).length);
      for (let __i94: number = 0; __i94 < ([CATEGORY_PHONE, 'toys']).length; __i94++) {
        expect((local.categories())[__i94]).assertEqual(([CATEGORY_PHONE, 'toys'])[__i94]);
      }
      expect(local.count()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0520
     * @tc.name      grouping_live_move_of_the_first_row_changes_category_order_052
     * @tc.desc      Verify grouping live move of the first row changes category order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_live_move_of_the_first_row_changes_category_order_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_live_move_of_the_first_row_changes_category_order_052');
      let first: Goods = createGoods(823, 'First Phone', 1000, CATEGORY_PHONE);
      let second: Goods = createGoods(824, 'Second Phone', 1000, CATEGORY_PHONE);
      let food: Goods = createGoods(825, 'Existing Food', 1000, CATEGORY_FOOD);
      let local: Catalog = new Catalog([first, second, food]);
      expect((local.categories()).length).assertEqual(([CATEGORY_PHONE, CATEGORY_FOOD]).length);
      for (let __i95: number = 0; __i95 < ([CATEGORY_PHONE, CATEGORY_FOOD]).length; __i95++) {
        expect((local.categories())[__i95]).assertEqual(([CATEGORY_PHONE, CATEGORY_FOOD])[__i95]);
      }
      first.category = CATEGORY_FOOD;
      // Moving the first row out of phone leaves food as the earliest appearance, so the
      // order flips to food, phone.
      expect((local.categories()).length).assertEqual(([CATEGORY_FOOD, CATEGORY_PHONE]).length);
      for (let __i96: number = 0; __i96 < ([CATEGORY_FOOD, CATEGORY_PHONE]).length; __i96++) {
        expect((local.categories())[__i96]).assertEqual(([CATEGORY_FOOD, CATEGORY_PHONE])[__i96]);
      }
      expect(local.byCategory(CATEGORY_FOOD).length).assertEqual(2);
      expect(local.byCategory(CATEGORY_PHONE).length).assertEqual(1);
      expect(local.byCategory(CATEGORY_PHONE)[0].id).assertEqual(824);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0530
     * @tc.name      grouping_categories_match_a_manual_distinct_count_053
     * @tc.desc      Verify grouping categories match a manual distinct count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_categories_match_a_manual_distinct_count_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_categories_match_a_manual_distinct_count_053');
      let items: Goods[] = catalog.all();
      let manual: string[] = [];
      for (let itemIndex: number = 0; itemIndex < items.length; itemIndex++) {
        if (manual.indexOf(items[itemIndex].category) < 0) {
          manual.push(items[itemIndex].category);
        }
      }
      let categories: string[] = catalog.categories();
      expect(categories.length).assertEqual(manual.length);
      for (let categoryIndex: number = 0; categoryIndex < categories.length; categoryIndex++) {
        expect(manual.indexOf(categories[categoryIndex]) >= 0).assertTrue();
        expect(categories.indexOf(manual[categoryIndex]) >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0540
     * @tc.name      grouping_empty_catalog_categories_is_fresh_each_call_054
     * @tc.desc      Verify grouping empty catalog categories is fresh each call.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_empty_catalog_categories_is_fresh_each_call_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_empty_catalog_categories_is_fresh_each_call_054');
      let empty: Catalog = new Catalog([]);
      let first: string[] = empty.categories();
      let second: string[] = empty.categories();
      expect(first.length).assertEqual(0);
      expect(second.length).assertEqual(0);
      expect(first !== second).assertTrue();
      expect(empty.count()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0550
     * @tc.name      grouping_empty_catalog_lookup_returns_fresh_arrays_055
     * @tc.desc      Verify grouping empty catalog lookup returns fresh arrays.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_empty_catalog_lookup_returns_fresh_arrays_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_empty_catalog_lookup_returns_fresh_arrays_055');
      let empty: Catalog = new Catalog([]);
      let first: Goods[] = empty.byCategory(CATEGORY_PHONE);
      let second: Goods[] = empty.byCategory(CATEGORY_PHONE);
      expect(first.length).assertEqual(0);
      expect(second.length).assertEqual(0);
      expect(first !== second).assertTrue();
      expect(empty.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0560
     * @tc.name      grouping_catalog_of_only_empty_names_has_one_category_056
     * @tc.desc      Verify grouping catalog of only empty names has one category.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_catalog_of_only_empty_names_has_one_category_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_catalog_of_only_empty_names_has_one_category_056');
      let unnamed: Catalog = new Catalog([
        createGoods(840, 'Unnamed One', 1000, ''),
        createGoods(841, 'Unnamed Two', 2000, '')
      ]);
      expect((unnamed.categories()).length).assertEqual((['']).length);
      for (let __i97: number = 0; __i97 < (['']).length; __i97++) {
        expect((unnamed.categories())[__i97]).assertEqual(([''])[__i97]);
      }
      expect(unnamed.byCategory('').length).assertEqual(2);
      expect(unnamed.byCategory('')[0].id).assertEqual(840);
      expect(unnamed.byCategory('')[1].id).assertEqual(841);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0570
     * @tc.name      grouping_calls_do_not_mutate_goods_categories_057
     * @tc.desc      Verify grouping calls do not mutate goods categories.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_calls_do_not_mutate_goods_categories_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_calls_do_not_mutate_goods_categories_057');
      let before: string[] = [];
      let items: Goods[] = catalog.all();
      for (let index: number = 0; index < items.length; index++) {
        before.push(items[index].category);
      }
      let categories: string[] = catalog.categories();
      for (let index: number = 0; index < categories.length; index++) {
        catalog.byCategory(categories[index]);
      }
      catalog.byCategory('tablet');
      for (let index: number = 0; index < items.length; index++) {
        expect(items[index].category).assertEqual(before[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0580
     * @tc.name      grouping_first_row_of_each_group_is_the_first_matching_row_058
     * @tc.desc      Verify grouping first row of each group is the first matching row.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_first_row_of_each_group_is_the_first_matching_row_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_first_row_of_each_group_is_the_first_matching_row_058');
      let categories: string[] = catalog.categories();
      let items: Goods[] = catalog.all();
      for (let categoryIndex: number = 0; categoryIndex < categories.length; categoryIndex++) {
        let firstMatchingId: number = -1;
        for (let itemIndex: number = 0; itemIndex < items.length; itemIndex++) {
          if (items[itemIndex].category === categories[categoryIndex]) {
            firstMatchingId = items[itemIndex].id;
            break;
          }
        }
        let group: Goods[] = catalog.byCategory(categories[categoryIndex]);
        expect(group[0].id).assertEqual(firstMatchingId);
        expect(group[0].category).assertEqual(categories[categoryIndex]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0590
     * @tc.name      grouping_same_identifier_in_two_categories_is_grouped_twice_059
     * @tc.desc      Verify grouping same identifier in two categories is grouped twice.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_same_identifier_in_two_categories_is_grouped_twice_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_same_identifier_in_two_categories_is_grouped_twice_059');
      let cross: Catalog = new Catalog([
        createGoods(900, 'Cross Phone', 1000, CATEGORY_PHONE),
        createGoods(900, 'Cross Food', 2000, CATEGORY_FOOD)
      ]);
      expect(cross.byCategory(CATEGORY_PHONE).length).assertEqual(1);
      expect(cross.byCategory(CATEGORY_FOOD).length).assertEqual(1);
      expect(cross.byCategory(CATEGORY_PHONE)[0].id).assertEqual(900);
      expect(cross.byCategory(CATEGORY_FOOD)[0].id).assertEqual(900);
      expect(cross.byCategory(CATEGORY_PHONE)[0].title).assertEqual('Cross Phone');
      expect(cross.byCategory(CATEGORY_FOOD)[0].title).assertEqual('Cross Food');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATEGORY_GROUPING_0600
     * @tc.name      grouping_leading_space_category_is_distinct_from_the_trimmed_name_060
     * @tc.desc      Verify grouping leading space category is distinct from the trimmed name.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('grouping_leading_space_category_is_distinct_from_the_trimmed_name_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: grouping_leading_space_category_is_distinct_from_the_trimmed_name_060');
      let padded: Catalog = new Catalog([
        createGoods(852, 'Padded Category Item', 1000, ' phone'),
        createGoods(853, 'Trimmed Category Item', 1000, CATEGORY_PHONE)
      ]);
      expect((padded.categories()).length).assertEqual(([' phone', CATEGORY_PHONE]).length);
      for (let __i98: number = 0; __i98 < ([' phone', CATEGORY_PHONE]).length; __i98++) {
        expect((padded.categories())[__i98]).assertEqual(([' phone', CATEGORY_PHONE])[__i98]);
      }
      expect(padded.byCategory(' phone').length).assertEqual(1);
      expect(padded.byCategory(' phone')[0].id).assertEqual(852);
      expect(padded.byCategory(CATEGORY_PHONE).length).assertEqual(1);
      expect(padded.byCategory(CATEGORY_PHONE)[0].id).assertEqual(853);
    });
  });
}
