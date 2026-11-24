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
import { Goods, ProductFilter } from '../Shared/ShopModel';
import { CATEGORY_APPLIANCE, CATEGORY_FOOD, CATEGORY_PHONE, CATEGORY_SPORT, CATEGORY_WEAR, LABEL_HOT, PRODUCTS, createGoods } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

export default function productFilterTest() {
  describe('OrangeShoppingProductFilter', () => {
    let catalogGoods: Goods[] = PRODUCTS;

    beforeAll(() => {
      catalogGoods = PRODUCTS;
      hilog.info(DOMAIN, TAG, '%{public}s', 'product filter suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0010
     * @tc.name      filter_default_accepts_the_whole_catalog_001
     * @tc.desc      Verify filter default accepts the whole catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_default_accepts_the_whole_catalog_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_default_accepts_the_whole_catalog_001');
      // The default catalog holds 16 rows with consecutive ids, so an unconstrained pass keeps 0 first and 15 last.
      let filter: ProductFilter = new ProductFilter();
      let result: Goods[] = filter.apply(catalogGoods);
      expect(result.length).assertEqual(catalogGoods.length);
      for (let index: number = 0; index < catalogGoods.length; index++) {
        expect(filter.matches(catalogGoods[index])).assertTrue();
      }
      expect(result[0].id).assertEqual(0);
      expect(result[result.length - 1].id).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0020
     * @tc.name      filter_constructor_stores_every_dimension_002
     * @tc.desc      Verify filter constructor stores every dimension.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_constructor_stores_every_dimension_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_constructor_stores_every_dimension_002');
      let filter: ProductFilter = new ProductFilter(CATEGORY_SPORT, 10000, 200000, 'watch', true);
      expect(filter.category).assertEqual(CATEGORY_SPORT);
      expect(filter.minCents).assertEqual(10000);
      expect(filter.maxCents).assertEqual(200000);
      expect(filter.keyword).assertEqual('watch');
      expect(filter.inStockOnly).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0030
     * @tc.name      filter_defaults_span_the_whole_price_range_003
     * @tc.desc      Verify filter defaults span the whole price range.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_defaults_span_the_whole_price_range_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_defaults_span_the_whole_price_range_003');
      // An unset ceiling becomes Number.MAX_SAFE_INTEGER so any real cent value passes, with a 0 floor.
      let filter: ProductFilter = new ProductFilter();
      expect(filter.category).assertEqual('');
      expect(filter.minCents).assertEqual(0);
      expect(filter.maxCents).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(filter.keyword).assertEqual('');
      expect(filter.inStockOnly).assertFalse();
      expect(filter.matches(catalogGoods[0])).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0040
     * @tc.name      filter_category_keeps_only_the_phone_rows_004
     * @tc.desc      Verify filter category keeps only the phone rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_category_keeps_only_the_phone_rows_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_category_keeps_only_the_phone_rows_004');
      let filter: ProductFilter = new ProductFilter(CATEGORY_PHONE);
      let result: Goods[] = filter.apply(catalogGoods);
      let ids: number[] = [];
      for (let index: number = 0; index < result.length; index++) {
        ids.push(result[index].id);
        expect(result[index].category).assertEqual(CATEGORY_PHONE);
      }
      expect((ids).length).assertEqual(([0, 1, 6, 8, 9, 14]).length);
      for (let __i219: number = 0; __i219 < ([0, 1, 6, 8, 9, 14]).length; __i219++) {
        expect((ids)[__i219]).assertEqual(([0, 1, 6, 8, 9, 14])[__i219]);
      }
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0050
     * @tc.name      filter_five_categories_partition_the_catalog_005
     * @tc.desc      Verify filter five categories partition the catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_five_categories_partition_the_catalog_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_five_categories_partition_the_catalog_005');
      // The per-category counts 6 + 4 + 2 + 2 + 2 must add up to the whole 16-row catalog, proving a partition.
      let categories: string[] = [CATEGORY_PHONE, CATEGORY_SPORT, CATEGORY_FOOD,
        CATEGORY_APPLIANCE, CATEGORY_WEAR];
      let expected: number[] = [6, 4, 2, 2, 2];
      let total: number = 0;
      for (let index: number = 0; index < categories.length; index++) {
        let filter: ProductFilter = new ProductFilter(categories[index]);
        let result: Goods[] = filter.apply(catalogGoods);
        expect(result.length).assertEqual(expected[index]);
        total += result.length;
        for (let itemIndex: number = 0; itemIndex < result.length; itemIndex++) {
          expect(result[itemIndex].category).assertEqual(categories[index]);
        }
      }
      expect(total).assertEqual(catalogGoods.length);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0060
     * @tc.name      filter_category_match_is_exact_and_case_sensitive_006
     * @tc.desc      Verify filter category match is exact and case sensitive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_category_match_is_exact_and_case_sensitive_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_category_match_is_exact_and_case_sensitive_006');
      let rejected: string[] = ['Phone', 'PHONE', ' phone', 'phone '];
      for (let index: number = 0; index < rejected.length; index++) {
        let filter: ProductFilter = new ProductFilter(rejected[index]);
        expect(filter.apply(catalogGoods).length).assertEqual(0);
      }
      let accepted: ProductFilter = new ProductFilter(CATEGORY_PHONE);
      expect(accepted.apply(catalogGoods).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0070
     * @tc.name      filter_unknown_categories_return_no_rows_007
     * @tc.desc      Verify filter unknown categories return no rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_unknown_categories_return_no_rows_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_unknown_categories_return_no_rows_007');
      let absent: string[] = ['tablet', 'laptop', 'phones'];
      for (let index: number = 0; index < absent.length; index++) {
        let filter: ProductFilter = new ProductFilter(absent[index]);
        expect(filter.apply(catalogGoods).length).assertEqual(0);
        expect(filter.matches(catalogGoods[0])).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0080
     * @tc.name      filter_minimum_price_only_removes_cheaper_rows_008
     * @tc.desc      Verify filter minimum price only removes cheaper rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_minimum_price_only_removes_cheaper_rows_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_minimum_price_only_removes_cheaper_rows_008');
      let filter: ProductFilter = new ProductFilter('', 100000);
      let result: Goods[] = filter.apply(catalogGoods);
      let prices: number[] = [];
      let ids: number[] = [];
      for (let index: number = 0; index < result.length; index++) {
        prices.push(result[index].price.cents());
        ids.push(result[index].id);
      }
      expect(result.length).assertEqual(6);
      expect((ids).length).assertEqual(([0, 1, 2, 8, 9, 10]).length);
      for (let __i220: number = 0; __i220 < ([0, 1, 2, 8, 9, 10]).length; __i220++) {
        expect((ids)[__i220]).assertEqual(([0, 1, 2, 8, 9, 10])[__i220]);
      }
      for (let __i235: number = 0; __i235 < (prices).length; __i235++) {
        expect((prices)[__i235] >= (100000)).assertTrue();
        expect((prices)[__i235] <= (Number.MAX_SAFE_INTEGER)).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0090
     * @tc.name      filter_maximum_price_only_removes_pricier_rows_009
     * @tc.desc      Verify filter maximum price only removes pricier rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_maximum_price_only_removes_pricier_rows_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_maximum_price_only_removes_pricier_rows_009');
      let filter: ProductFilter = new ProductFilter('', 0, 19900);
      let result: Goods[] = filter.apply(catalogGoods);
      let prices: number[] = [];
      let ids: number[] = [];
      for (let index: number = 0; index < result.length; index++) {
        prices.push(result[index].price.cents());
        ids.push(result[index].id);
      }
      expect(result.length).assertEqual(6);
      expect((ids).length).assertEqual(([4, 6, 7, 12, 14, 15]).length);
      for (let __i221: number = 0; __i221 < ([4, 6, 7, 12, 14, 15]).length; __i221++) {
        expect((ids)[__i221]).assertEqual(([4, 6, 7, 12, 14, 15])[__i221]);
      }
      for (let __i236: number = 0; __i236 < (prices).length; __i236++) {
        expect((prices)[__i236] >= (0)).assertTrue();
        expect((prices)[__i236] <= (19900)).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0100
     * @tc.name      filter_closed_interval_keeps_both_boundaries_010
     * @tc.desc      Verify filter closed interval keeps both boundaries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_closed_interval_keeps_both_boundaries_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_closed_interval_keeps_both_boundaries_010');
      // Both 29900 and 59900 appear twice, so an exclusive comparison at either end would cut 4 down to 2.
      let filter: ProductFilter = new ProductFilter('', 29900, 59900);
      let result: Goods[] = filter.apply(catalogGoods);
      let lowCount: number = 0;
      let highCount: number = 0;
      for (let index: number = 0; index < result.length; index++) {
        if (result[index].price.cents() === 29900) {
          lowCount++;
        }
        if (result[index].price.cents() === 59900) {
          highCount++;
        }
      }

      expect(result.length).assertEqual(4);
      expect(lowCount).assertEqual(2);
      expect(highCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0110
     * @tc.name      filter_minimum_greater_than_maximum_yields_nothing_011
     * @tc.desc      Verify filter minimum greater than maximum yields nothing.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_minimum_greater_than_maximum_yields_nothing_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_minimum_greater_than_maximum_yields_nothing_011');
      let minimums: number[] = [200000, 500000];
      let maximums: number[] = [10000, 499900];
      for (let index: number = 0; index < minimums.length; index++) {
        let filter: ProductFilter = new ProductFilter('', minimums[index], maximums[index]);
        expect(filter.apply(catalogGoods).length).assertEqual(0);
        expect(filter.matches(catalogGoods[0])).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0120
     * @tc.name      filter_minimum_at_the_highest_price_keeps_only_flagships_012
     * @tc.desc      Verify filter minimum at the highest price keeps only flagships.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_minimum_at_the_highest_price_keeps_only_flagships_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_minimum_at_the_highest_price_keeps_only_flagships_012');
      // 499900 is the catalog's top price and two rows share it, so a floor at that exact value keeps both.
      let filter: ProductFilter = new ProductFilter('', 499900);
      let result: Goods[] = filter.apply(catalogGoods);
      expect(result.length).assertEqual(2);
      expect(result[0].id).assertEqual(0);
      expect(result[1].id).assertEqual(8);
      for (let index: number = 0; index < result.length; index++) {
        expect(result[index].price.cents()).assertEqual(499900);
        expect(result[index].title).assertEqual('Harmony Phone One');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0130
     * @tc.name      filter_maximum_at_the_lowest_price_keeps_only_tea_013
     * @tc.desc      Verify filter maximum at the lowest price keeps only tea.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_maximum_at_the_lowest_price_keeps_only_tea_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_maximum_at_the_lowest_price_keeps_only_tea_013');
      // 8900 is the lowest price and the two tea rows sit on it, so a ceiling at 8900 keeps exactly them.
      let filter: ProductFilter = new ProductFilter('', 0, 8900);
      let result: Goods[] = filter.apply(catalogGoods);
      expect(result.length).assertEqual(2);
      expect(result[0].id).assertEqual(4);
      expect(result[1].id).assertEqual(12);
      for (let index: number = 0; index < result.length; index++) {
        expect(result[index].price.cents()).assertEqual(8900);
        expect(result[index].searchText().indexOf('organic') >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0140
     * @tc.name      filter_keyword_watch_matches_titles_014
     * @tc.desc      Verify filter keyword watch matches titles.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_keyword_watch_matches_titles_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_keyword_watch_matches_titles_014');
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, 'watch', false);
      let result: Goods[] = filter.apply(catalogGoods);
      let ids: number[] = [];
      for (let index: number = 0; index < result.length; index++) {
        ids.push(result[index].id);
        expect(result[index].title).assertEqual('Smart Watch Pro');
      }
      expect((ids).length).assertEqual(([2, 10]).length);
      for (let __i222: number = 0; __i222 < ([2, 10]).length; __i222++) {
        expect((ids)[__i222]).assertEqual(([2, 10])[__i222]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0150
     * @tc.name      filter_keyword_discount_matches_labels_015
     * @tc.desc      Verify filter keyword discount matches labels.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_keyword_discount_matches_labels_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_keyword_discount_matches_labels_015');
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, 'discount', false);
      let result: Goods[] = filter.apply(catalogGoods);
      let ids: number[] = [];
      for (let index: number = 0; index < result.length; index++) {
        ids.push(result[index].id);
        expect(result[index].labels).assertEqual('discount');
      }
      expect((ids).length).assertEqual(([3, 7, 11, 15]).length);
      for (let __i223: number = 0; __i223 < ([3, 7, 11, 15]).length; __i223++) {
        expect((ids)[__i223]).assertEqual(([3, 7, 11, 15])[__i223]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0160
     * @tc.name      filter_keyword_appliances_matches_the_category_text_016
     * @tc.desc      Verify filter keyword appliances matches the category text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_keyword_appliances_matches_the_category_text_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_keyword_appliances_matches_the_category_text_016');
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, 'appliances', false);
      let result: Goods[] = filter.apply(catalogGoods);
      expect(result.length).assertEqual(2);
      expect(result[0].id).assertEqual(5);
      expect(result[1].id).assertEqual(13);
      for (let index: number = 0; index < result.length; index++) {
        expect(result[index].category).assertEqual(CATEGORY_APPLIANCE);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0170
     * @tc.name      filter_keyword_organic_matches_the_info_text_017
     * @tc.desc      Verify filter keyword organic matches the info text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_keyword_organic_matches_the_info_text_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_keyword_organic_matches_the_info_text_017');
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, 'organic', false);
      let result: Goods[] = filter.apply(catalogGoods);
      expect(result.length).assertEqual(2);
      expect(result[0].id).assertEqual(4);
      expect(result[1].id).assertEqual(12);
      for (let index: number = 0; index < result.length; index++) {
        expect(result[index].searchText().indexOf('organic') >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0180
     * @tc.name      filter_keyword_hot_sale_matches_every_hot_label_018
     * @tc.desc      Verify filter keyword hot sale matches every hot label.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_keyword_hot_sale_matches_every_hot_label_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_keyword_hot_sale_matches_every_hot_label_018');
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, LABEL_HOT, false);
      let result: Goods[] = filter.apply(catalogGoods);
      let ids: number[] = [];
      for (let index: number = 0; index < result.length; index++) {
        ids.push(result[index].id);
      }
      expect((ids).length).assertEqual(([1, 4, 6, 9, 12, 14]).length);
      for (let __i224: number = 0; __i224 < ([1, 4, 6, 9, 12, 14]).length; __i224++) {
        expect((ids)[__i224]).assertEqual(([1, 4, 6, 9, 12, 14])[__i224]);
      }
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0190
     * @tc.name      filter_blank_keyword_does_not_constrain_results_019
     * @tc.desc      Verify filter blank keyword does not constrain results.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_blank_keyword_does_not_constrain_results_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_blank_keyword_does_not_constrain_results_019');
      let blank: string[] = ['', ' ', '   ', '\t'];
      for (let index: number = 0; index < blank.length; index++) {
        let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, blank[index], false);
        let result: Goods[] = filter.apply(catalogGoods);
        expect(result.length).assertEqual(catalogGoods.length);
        expect(result[0].id).assertEqual(0);
        expect(result[result.length - 1].id).assertEqual(15);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0200
     * @tc.name      filter_keyword_variants_share_one_result_set_020
     * @tc.desc      Verify filter keyword variants share one result set.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_keyword_variants_share_one_result_set_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_keyword_variants_share_one_result_set_020');
      let variants: string[] = ['watch', 'WATCH', ' WaTcH '];
      for (let index: number = 0; index < variants.length; index++) {
        let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, variants[index], false);
        let result: Goods[] = filter.apply(catalogGoods);
        let ids: number[] = [];
        for (let itemIndex: number = 0; itemIndex < result.length; itemIndex++) {
          ids.push(result[itemIndex].id);
        }
        expect((ids).length).assertEqual(([2, 10]).length);
        for (let __i225: number = 0; __i225 < ([2, 10]).length; __i225++) {
          expect((ids)[__i225]).assertEqual(([2, 10])[__i225]);
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0210
     * @tc.name      filter_unknown_keyword_returns_no_rows_021
     * @tc.desc      Verify filter unknown keyword returns no rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_unknown_keyword_returns_no_rows_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_unknown_keyword_returns_no_rows_021');
      let absent: string[] = ['tablet', 'laptop', 'camera'];
      for (let index: number = 0; index < absent.length; index++) {
        let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, absent[index], false);
        expect(filter.apply(catalogGoods).length).assertEqual(0);
        expect(filter.matches(catalogGoods[0])).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0220
     * @tc.name      filter_keyword_internal_double_space_does_not_match_022
     * @tc.desc      Verify filter keyword internal double space does not match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_keyword_internal_double_space_does_not_match_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_keyword_internal_double_space_does_not_match_022');
      // The stored title carries a single space, so the doubled-space keyword matches nothing despite both words.
      let exact: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, 'phone two', false);
      let spaced: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, 'phone  two', false);
      expect(exact.apply(catalogGoods).length).assertEqual(2);
      expect(spaced.apply(catalogGoods).length).assertEqual(0);
      expect(spaced.matches(catalogGoods[1])).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0230
     * @tc.name      filter_keyword_does_not_match_price_digits_023
     * @tc.desc      Verify filter keyword does not match price digits.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_keyword_does_not_match_price_digits_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_keyword_does_not_match_price_digits_023');
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, '499900', false);
      expect(filter.apply(catalogGoods).length).assertEqual(0);
      expect(filter.matches(catalogGoods[0])).assertFalse();
      expect(catalogGoods[0].price.cents()).assertEqual(499900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0240
     * @tc.name      filter_keyword_phone_matches_the_category_text_024
     * @tc.desc      Verify filter keyword phone matches the category text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_keyword_phone_matches_the_category_text_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_keyword_phone_matches_the_category_text_024');
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, 'PHONE', false);
      let result: Goods[] = filter.apply(catalogGoods);
      expect(result.length).assertEqual(6);
      for (let index: number = 0; index < result.length; index++) {
        expect(result[index].category).assertEqual(CATEGORY_PHONE);
      }
      expect(result[0].id).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0250
     * @tc.name      filter_in_stock_only_keeps_available_rows_025
     * @tc.desc      Verify filter in stock only keeps available rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_in_stock_only_keeps_available_rows_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_in_stock_only_keeps_available_rows_025');
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, '', true);
      let result: Goods[] = filter.apply(catalogGoods);
      let ids: number[] = [];
      for (let index: number = 0; index < result.length; index++) {
        ids.push(result[index].id);
        expect(result[index].isInStock()).assertTrue();
      }
      // Two of the 16 rows have zero stock, ids 6 and 14, so in-stock-only leaves 14.
      expect(result.length).assertEqual(14);
      expect(ids.indexOf(6) < 0).assertTrue();
      expect(ids.indexOf(14) < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0260
     * @tc.name      filter_in_stock_flag_false_keeps_sold_out_rows_026
     * @tc.desc      Verify filter in stock flag false keeps sold out rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_in_stock_flag_false_keeps_sold_out_rows_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_in_stock_flag_false_keeps_sold_out_rows_026');
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, '', false);
      let result: Goods[] = filter.apply(catalogGoods);
      let ids: number[] = [];
      for (let index: number = 0; index < result.length; index++) {
        ids.push(result[index].id);
      }
      expect(result.length).assertEqual(16);
      expect(ids.indexOf(6) >= 0).assertTrue();
      expect(ids.indexOf(14) >= 0).assertTrue();
      expect(result[6].isInStock()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0270
     * @tc.name      filter_in_stock_uses_stock_not_sales_027
     * @tc.desc      Verify filter in stock uses stock not sales.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_in_stock_uses_stock_not_sales_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_in_stock_uses_stock_not_sales_027');
      let soldOutBestseller: Goods = createGoods(500, 'Sold Out Bestseller', 1000, CATEGORY_PHONE,
        'high demand', LABEL_HOT, 0, 99999);
      let slowSeller: Goods = createGoods(501, 'Slow Seller', 1000, CATEGORY_PHONE,
        'low demand', LABEL_HOT, 3, 1);
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, '', true);
      let result: Goods[] = filter.apply([soldOutBestseller, slowSeller]);
      expect(result.length).assertEqual(1);
      expect(result[0].id).assertEqual(501);
      expect(result[0].isInStock()).assertTrue();
      expect(soldOutBestseller.isInStock()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0280
     * @tc.name      filter_in_stock_within_a_price_band_keeps_available_rows_028
     * @tc.desc      Verify filter in stock within a price band keeps available rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_in_stock_within_a_price_band_keeps_available_rows_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_in_stock_within_a_price_band_keeps_available_rows_028');
      let filter: ProductFilter = new ProductFilter('', 10000, 20000, '', true);
      let result: Goods[] = filter.apply(catalogGoods);
      let ids: number[] = [];
      for (let index: number = 0; index < result.length; index++) {
        ids.push(result[index].id);
        expect(result[index].isInStock()).assertTrue();
      }
      expect((ids).length).assertEqual(([7, 15]).length);
      for (let __i226: number = 0; __i226 < ([7, 15]).length; __i226++) {
        expect((ids)[__i226]).assertEqual(([7, 15])[__i226]);
      }
      expect(result[0].price.cents()).assertEqual(15900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0290
     * @tc.name      filter_price_band_without_stock_flag_includes_sold_out_rows_029
     * @tc.desc      Verify filter price band without stock flag includes sold out rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_price_band_without_stock_flag_includes_sold_out_rows_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_price_band_without_stock_flag_includes_sold_out_rows_029');
      let filter: ProductFilter = new ProductFilter('', 10000, 20000, '', false);
      let result: Goods[] = filter.apply(catalogGoods);
      let ids: number[] = [];
      for (let index: number = 0; index < result.length; index++) {
        ids.push(result[index].id);
      }
      expect((ids).length).assertEqual(([6, 7, 14, 15]).length);
      for (let __i227: number = 0; __i227 < ([6, 7, 14, 15]).length; __i227++) {
        expect((ids)[__i227]).assertEqual(([6, 7, 14, 15])[__i227]);
      }
      expect(result[0].isInStock()).assertFalse();
      expect(result[1].isInStock()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0300
     * @tc.name      filter_four_dimensions_keep_the_premium_phones_030
     * @tc.desc      Verify filter four dimensions keep the premium phones.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_four_dimensions_keep_the_premium_phones_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_four_dimensions_keep_the_premium_phones_030');
      // All four dimensions must hold together: the 400000 ceiling drops the 499900 flagships while stock and keyword trim the rest.
      let filter: ProductFilter = new ProductFilter(CATEGORY_PHONE, 100000, 400000, 'phone', true);
      let result: Goods[] = filter.apply(catalogGoods);
      expect(result.length).assertEqual(2);
      expect(result[0].id).assertEqual(1);
      expect(result[1].id).assertEqual(9);
      for (let index: number = 0; index < result.length; index++) {
        expect(result[index].category).assertEqual(CATEGORY_PHONE);
        expect(result[index].isInStock()).assertTrue();
        expect(result[index].matchesKeyword('phone')).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0310
     * @tc.name      filter_four_dimensions_can_keep_sold_out_earbuds_031
     * @tc.desc      Verify filter four dimensions can keep sold out earbuds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_four_dimensions_can_keep_sold_out_earbuds_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_four_dimensions_can_keep_sold_out_earbuds_031');
      let filter: ProductFilter = new ProductFilter(CATEGORY_PHONE, 0, Number.MAX_SAFE_INTEGER,
        'earbud', false);
      let result: Goods[] = filter.apply(catalogGoods);
      expect(result.length).assertEqual(2);
      expect(result[0].id).assertEqual(6);
      expect(result[1].id).assertEqual(14);
      for (let index: number = 0; index < result.length; index++) {
        expect(result[index].isInStock()).assertFalse();
        expect(result[index].title).assertEqual('Wireless Earbuds');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0320
     * @tc.name      filter_four_dimensions_with_stock_remove_sold_out_earbuds_032
     * @tc.desc      Verify filter four dimensions with stock remove sold out earbuds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_four_dimensions_with_stock_remove_sold_out_earbuds_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_four_dimensions_with_stock_remove_sold_out_earbuds_032');
      let filter: ProductFilter = new ProductFilter(CATEGORY_PHONE, 0, Number.MAX_SAFE_INTEGER,
        'earbud', true);
      let result: Goods[] = filter.apply(catalogGoods);
      expect(result.length).assertEqual(0);
      expect(filter.matches(catalogGoods[6])).assertFalse();
      expect(filter.matches(catalogGoods[14])).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0330
     * @tc.name      filter_category_and_keyword_must_both_match_033
     * @tc.desc      Verify filter category and keyword must both match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_category_and_keyword_must_both_match_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_category_and_keyword_must_both_match_033');
      let phoneWatch: ProductFilter = new ProductFilter(CATEGORY_PHONE, 0, Number.MAX_SAFE_INTEGER,
        'watch', false);
      let sportWatch: ProductFilter = new ProductFilter(CATEGORY_SPORT, 0, Number.MAX_SAFE_INTEGER,
        'watch', false);
      expect(phoneWatch.apply(catalogGoods).length).assertEqual(0);
      let sportResult: Goods[] = sportWatch.apply(catalogGoods);
      expect(sportResult.length).assertEqual(2);
      expect(sportResult[0].id).assertEqual(2);
      expect(sportResult[1].id).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0340
     * @tc.name      filter_blank_keyword_with_category_keeps_the_category_rows_034
     * @tc.desc      Verify filter blank keyword with category keeps the category rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_blank_keyword_with_category_keeps_the_category_rows_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_blank_keyword_with_category_keeps_the_category_rows_034');
      let filter: ProductFilter = new ProductFilter(CATEGORY_PHONE, 0, Number.MAX_SAFE_INTEGER,
        '   ', false);
      let result: Goods[] = filter.apply(catalogGoods);
      expect(result.length).assertEqual(6);
      for (let index: number = 0; index < result.length; index++) {
        expect(result[index].category).assertEqual(CATEGORY_PHONE);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0350
     * @tc.name      filter_empty_input_returns_empty_output_035
     * @tc.desc      Verify filter empty input returns empty output.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_empty_input_returns_empty_output_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_empty_input_returns_empty_output_035');
      let none: Goods[] = [];
      let defaultFilter: ProductFilter = new ProductFilter();
      let categoryFilter: ProductFilter = new ProductFilter(CATEGORY_PHONE);
      expect(defaultFilter.apply(none).length).assertEqual(0);
      expect(categoryFilter.apply(none).length).assertEqual(0);
      expect(none.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0360
     * @tc.name      filter_zero_price_goods_passes_the_default_floor_036
     * @tc.desc      Verify filter zero price goods passes the default floor.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_zero_price_goods_passes_the_default_floor_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_zero_price_goods_passes_the_default_floor_036');
      let free: Goods = createGoods(502, 'Free Sample', 0, CATEGORY_FOOD, 'free info', 'basic_label', 5);
      let filter: ProductFilter = new ProductFilter();
      expect(filter.matches(free)).assertTrue();
      let result: Goods[] = filter.apply([free]);
      expect(result.length).assertEqual(1);
      expect(result[0].price.cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0370
     * @tc.name      filter_negative_price_goods_fails_the_default_floor_037
     * @tc.desc      Verify filter negative price goods fails the default floor.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_negative_price_goods_fails_the_default_floor_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_negative_price_goods_fails_the_default_floor_037');
      let adjustment: Goods = createGoods(503, 'Adjustment Item', -100, CATEGORY_FOOD,
        'negative info', 'basic_label', 5);
      // The default floor is 0, so the -100 cent row fails even though the ceiling is effectively unbounded.
      let filter: ProductFilter = new ProductFilter();
      expect(filter.matches(adjustment)).assertFalse();
      expect(filter.apply([adjustment]).length).assertEqual(0);
      expect(adjustment.price.cents()).assertEqual(-100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0380
     * @tc.name      filter_maximum_safe_integer_is_an_inclusive_ceiling_038
     * @tc.desc      Verify filter maximum safe integer is an inclusive ceiling.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_maximum_safe_integer_is_an_inclusive_ceiling_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_maximum_safe_integer_is_an_inclusive_ceiling_038');
      let ceiling: Goods = createGoods(504, 'Ceiling Item', Number.MAX_SAFE_INTEGER, CATEGORY_PHONE,
        'ceiling info', 'basic_label', 1);
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, '', false);
      expect(filter.matches(ceiling)).assertTrue();
      let result: Goods[] = filter.apply([ceiling]);
      expect(result.length).assertEqual(1);
      expect(result[0].price.cents()).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0390
     * @tc.name      filter_maximum_safe_integer_minus_one_rejects_the_ceiling_039
     * @tc.desc      Verify filter maximum safe integer minus one rejects the ceiling.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_maximum_safe_integer_minus_one_rejects_the_ceiling_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_maximum_safe_integer_minus_one_rejects_the_ceiling_039');
      let ceiling: Goods = createGoods(505, 'Ceiling Item', Number.MAX_SAFE_INTEGER, CATEGORY_PHONE,
        'ceiling info', 'basic_label', 1);
      // Lowering the ceiling by one cent is enough to reject a row priced exactly at Number.MAX_SAFE_INTEGER.
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER - 1, '', false);
      expect(filter.matches(ceiling)).assertFalse();
      expect(filter.apply([ceiling]).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0400
     * @tc.name      filter_matches_goods_exactly_at_both_price_bounds_040
     * @tc.desc      Verify filter matches goods exactly at both price bounds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_matches_goods_exactly_at_both_price_bounds_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_matches_goods_exactly_at_both_price_bounds_040');
      let lower: Goods = createGoods(506, 'Lower Bound Item', 10000, CATEGORY_PHONE,
        'lower info', 'basic_label', 1);
      let upper: Goods = createGoods(507, 'Upper Bound Item', 20000, CATEGORY_PHONE,
        'upper info', 'basic_label', 1);
      let filter: ProductFilter = new ProductFilter('', 10000, 20000);
      expect(filter.matches(lower)).assertTrue();
      expect(filter.matches(upper)).assertTrue();
      expect(filter.apply([lower, upper]).length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0410
     * @tc.name      filter_apply_preserves_the_sport_relative_order_041
     * @tc.desc      Verify filter apply preserves the sport relative order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_apply_preserves_the_sport_relative_order_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_apply_preserves_the_sport_relative_order_041');
      let filter: ProductFilter = new ProductFilter(CATEGORY_SPORT);
      let result: Goods[] = filter.apply(catalogGoods);
      let ids: number[] = [];
      for (let index: number = 0; index < result.length; index++) {
        ids.push(result[index].id);
      }
      expect((ids).length).assertEqual(([2, 3, 10, 11]).length);
      for (let __i228: number = 0; __i228 < ([2, 3, 10, 11]).length; __i228++) {
        expect((ids)[__i228]).assertEqual(([2, 3, 10, 11])[__i228]);
      }
      expect(result[0].title).assertEqual('Smart Watch Pro');
      expect(result[3].title).assertEqual('Sport Runner Shoes');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0420
     * @tc.name      filter_apply_preserves_the_discount_relative_order_042
     * @tc.desc      Verify filter apply preserves the discount relative order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_apply_preserves_the_discount_relative_order_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_apply_preserves_the_discount_relative_order_042');
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, 'discount', false);
      let result: Goods[] = filter.apply(catalogGoods);
      let ids: number[] = [];
      for (let index: number = 0; index < result.length; index++) {
        ids.push(result[index].id);
      }
      expect((ids).length).assertEqual(([3, 7, 11, 15]).length);
      for (let __i229: number = 0; __i229 < ([3, 7, 11, 15]).length; __i229++) {
        expect((ids)[__i229]).assertEqual(([3, 7, 11, 15])[__i229]);
      }
      expect(result[0].price.cents()).assertEqual(59900);
      expect(result[3].price.cents()).assertEqual(15900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0430
     * @tc.name      filter_apply_does_not_mutate_or_alias_the_input_043
     * @tc.desc      Verify filter apply does not mutate or alias the input.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_apply_does_not_mutate_or_alias_the_input_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_apply_does_not_mutate_or_alias_the_input_043');
      let before: number[] = [];
      for (let index: number = 0; index < catalogGoods.length; index++) {
        before.push(catalogGoods[index].id);
      }
      let filter: ProductFilter = new ProductFilter(CATEGORY_PHONE);
      let result: Goods[] = filter.apply(catalogGoods);

      expect(result !== catalogGoods).assertTrue();
      expect(catalogGoods.length).assertEqual(16);
      let after: number[] = [];
      for (let index: number = 0; index < catalogGoods.length; index++) {
        after.push(catalogGoods[index].id);
      }
      expect((after).length).assertEqual((before).length);
      for (let __i230: number = 0; __i230 < (before).length; __i230++) {
        expect((after)[__i230]).assertEqual((before)[__i230]);
      }
      // The phone filter leaves 6 of the 16 rows; splicing the returned copy must not shrink the catalog.
      result.splice(0, 1);
      expect(catalogGoods.length).assertEqual(16);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0440
     * @tc.name      filter_apply_keeps_duplicate_input_rows_044
     * @tc.desc      Verify filter apply keeps duplicate input rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_apply_keeps_duplicate_input_rows_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_apply_keeps_duplicate_input_rows_044');
      let first: Goods = createGoods(510, 'Duplicate Phone', 1000, CATEGORY_PHONE);
      let second: Goods = createGoods(510, 'Duplicate Phone', 1000, CATEGORY_PHONE);
      let filter: ProductFilter = new ProductFilter(CATEGORY_PHONE);
      let result: Goods[] = filter.apply([first, second]);
      expect(result.length).assertEqual(2);
      expect(result[0].id).assertEqual(510);
      expect(result[1].id).assertEqual(510);
      expect(result[0] !== result[1]).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0450
     * @tc.name      filter_apply_on_a_single_matching_item_045
     * @tc.desc      Verify filter apply on a single matching item.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_apply_on_a_single_matching_item_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_apply_on_a_single_matching_item_045');
      let phone: Goods = createGoods(511, 'Single Phone', 1000, CATEGORY_PHONE);
      let phoneFilter: ProductFilter = new ProductFilter(CATEGORY_PHONE);
      let foodFilter: ProductFilter = new ProductFilter(CATEGORY_FOOD);
      let result: Goods[] = phoneFilter.apply([phone]);
      expect(result.length).assertEqual(1);
      expect(result[0].id).assertEqual(511);
      expect(foodFilter.apply([phone]).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0460
     * @tc.name      filter_default_matches_a_sold_out_product_046
     * @tc.desc      Verify filter default matches a sold out product.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_default_matches_a_sold_out_product_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_default_matches_a_sold_out_product_046');
      let filter: ProductFilter = new ProductFilter();
      expect(catalogGoods[6].isInStock()).assertFalse();
      expect(filter.matches(catalogGoods[6])).assertTrue();
      let result: Goods[] = filter.apply(catalogGoods);
      let ids: number[] = [];
      for (let index: number = 0; index < result.length; index++) {
        ids.push(result[index].id);
      }
      expect(ids.indexOf(6) >= 0).assertTrue();
      expect(ids.indexOf(14) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0470
     * @tc.name      filter_category_does_not_accept_a_title_047
     * @tc.desc      Verify filter category does not accept a title.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_category_does_not_accept_a_title_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_category_does_not_accept_a_title_047');
      let filter: ProductFilter = new ProductFilter('Smart Watch Pro');
      expect(filter.apply(catalogGoods).length).assertEqual(0);
      expect(filter.matches(catalogGoods[2])).assertFalse();
      expect(catalogGoods[2].title).assertEqual('Smart Watch Pro');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0480
     * @tc.name      filter_floor_at_maximum_safe_price_is_empty_for_the_catalog_048
     * @tc.desc      Verify filter floor at maximum safe price is empty for the catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_floor_at_maximum_safe_price_is_empty_for_the_catalog_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_floor_at_maximum_safe_price_is_empty_for_the_catalog_048');
      let filter: ProductFilter = new ProductFilter('', Number.MAX_SAFE_INTEGER);
      expect(filter.apply(catalogGoods).length).assertEqual(0);
      expect(filter.matches(catalogGoods[0])).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0490
     * @tc.name      filter_collapsed_ceiling_interval_keeps_the_ceiling_goods_049
     * @tc.desc      Verify filter collapsed ceiling interval keeps the ceiling goods.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_collapsed_ceiling_interval_keeps_the_ceiling_goods_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_collapsed_ceiling_interval_keeps_the_ceiling_goods_049');
      let ceiling: Goods = createGoods(512, 'Ceiling Only Item', Number.MAX_SAFE_INTEGER, CATEGORY_PHONE,
        'ceiling info', 'basic_label', 1);
      // Floor and ceiling collapse onto Number.MAX_SAFE_INTEGER, so only an item priced exactly there survives.
      let filter: ProductFilter = new ProductFilter('', Number.MAX_SAFE_INTEGER,
        Number.MAX_SAFE_INTEGER);
      expect(filter.matches(ceiling)).assertTrue();
      let result: Goods[] = filter.apply([ceiling]);
      expect(result.length).assertEqual(1);
      expect(result[0].id).assertEqual(512);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0500
     * @tc.name      filter_maximum_below_the_lowest_catalog_price_is_empty_050
     * @tc.desc      Verify filter maximum below the lowest catalog price is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_maximum_below_the_lowest_catalog_price_is_empty_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_maximum_below_the_lowest_catalog_price_is_empty_050');
      let filter: ProductFilter = new ProductFilter('', 0, 8899);
      expect(filter.apply(catalogGoods).length).assertEqual(0);
      expect(filter.matches(catalogGoods[4])).assertFalse();
      expect(catalogGoods[4].price.cents()).assertEqual(8900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0510
     * @tc.name      filter_minimum_above_the_highest_catalog_price_is_empty_051
     * @tc.desc      Verify filter minimum above the highest catalog price is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_minimum_above_the_highest_catalog_price_is_empty_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_minimum_above_the_highest_catalog_price_is_empty_051');
      let filter: ProductFilter = new ProductFilter('', 499901);
      expect(filter.apply(catalogGoods).length).assertEqual(0);
      expect(filter.matches(catalogGoods[0])).assertFalse();
      expect(catalogGoods[0].price.cents()).assertEqual(499900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0520
     * @tc.name      filter_one_cent_wide_band_keeps_only_the_two_boundaries_052
     * @tc.desc      Verify filter one cent wide band keeps only the two boundaries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_one_cent_wide_band_keeps_only_the_two_boundaries_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_one_cent_wide_band_keeps_only_the_two_boundaries_052');
      let lower: Goods = createGoods(515, 'Narrow Lower Item', 10000, CATEGORY_PHONE,
        'lower info', 'basic_label', 1);
      let upper: Goods = createGoods(516, 'Narrow Upper Item', 10001, CATEGORY_PHONE,
        'upper info', 'basic_label', 1);
      let outside: Goods = createGoods(517, 'Narrow Outside Item', 10002, CATEGORY_PHONE,
        'outside info', 'basic_label', 1);
      // The band is one cent wide, so 10000 and 10001 pass while 10002 is already above the ceiling.
      let filter: ProductFilter = new ProductFilter('', 10000, 10001);
      expect(filter.matches(lower)).assertTrue();
      expect(filter.matches(upper)).assertTrue();
      expect(filter.matches(outside)).assertFalse();
      expect(filter.apply([lower, upper, outside]).length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0530
     * @tc.name      filter_category_with_a_price_floor_combines_both_053
     * @tc.desc      Verify filter category with a price floor combines both.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_category_with_a_price_floor_combines_both_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_category_with_a_price_floor_combines_both_053');
      let filter: ProductFilter = new ProductFilter(CATEGORY_PHONE, 100000);
      let result: Goods[] = filter.apply(catalogGoods);
      let ids: number[] = [];
      for (let index: number = 0; index < result.length; index++) {
        ids.push(result[index].id);
        expect(result[index].category).assertEqual(CATEGORY_PHONE);
        expect(result[index].price.cents() >= 100000 && result[index].price.cents() <= Number.MAX_SAFE_INTEGER).assertTrue();
      }
      expect((ids).length).assertEqual(([0, 1, 8, 9]).length);
      for (let __i231: number = 0; __i231 < ([0, 1, 8, 9]).length; __i231++) {
        expect((ids)[__i231]).assertEqual(([0, 1, 8, 9])[__i231]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0540
     * @tc.name      filter_category_with_the_stock_flag_combines_both_054
     * @tc.desc      Verify filter category with the stock flag combines both.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_category_with_the_stock_flag_combines_both_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_category_with_the_stock_flag_combines_both_054');
      let filter: ProductFilter = new ProductFilter(CATEGORY_PHONE, 0, Number.MAX_SAFE_INTEGER,
        '', true);
      let result: Goods[] = filter.apply(catalogGoods);
      let ids: number[] = [];
      for (let index: number = 0; index < result.length; index++) {
        ids.push(result[index].id);
        expect(result[index].category).assertEqual(CATEGORY_PHONE);
        expect(result[index].isInStock()).assertTrue();
      }
      expect((ids).length).assertEqual(([0, 1, 8, 9]).length);
      for (let __i232: number = 0; __i232 < ([0, 1, 8, 9]).length; __i232++) {
        expect((ids)[__i232]).assertEqual(([0, 1, 8, 9])[__i232]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0550
     * @tc.name      filter_keyword_with_the_stock_flag_combines_both_055
     * @tc.desc      Verify filter keyword with the stock flag combines both.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_keyword_with_the_stock_flag_combines_both_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_keyword_with_the_stock_flag_combines_both_055');
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, LABEL_HOT, true);
      let result: Goods[] = filter.apply(catalogGoods);
      let ids: number[] = [];
      for (let index: number = 0; index < result.length; index++) {
        ids.push(result[index].id);
        expect(result[index].isInStock()).assertTrue();
        expect(result[index].matchesKeyword(LABEL_HOT)).assertTrue();
      }
      expect((ids).length).assertEqual(([1, 4, 9, 12]).length);
      for (let __i233: number = 0; __i233 < ([1, 4, 9, 12]).length; __i233++) {
        expect((ids)[__i233]).assertEqual(([1, 4, 9, 12])[__i233]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0560
     * @tc.name      filter_keyword_with_a_price_band_combines_both_056
     * @tc.desc      Verify filter keyword with a price band combines both.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_keyword_with_a_price_band_combines_both_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_keyword_with_a_price_band_combines_both_056');
      let filter: ProductFilter = new ProductFilter('', 100000, 200000, 'watch', false);
      let result: Goods[] = filter.apply(catalogGoods);
      expect(result.length).assertEqual(2);
      expect(result[0].id).assertEqual(2);
      expect(result[1].id).assertEqual(10);
      for (let index: number = 0; index < result.length; index++) {
        expect(result[index].price.cents() >= 100000 && result[index].price.cents() <= 200000).assertTrue();
        expect(result[index].matchesKeyword('watch')).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0570
     * @tc.name      filter_category_food_with_a_low_price_ceiling_057
     * @tc.desc      Verify filter category food with a low price ceiling.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_category_food_with_a_low_price_ceiling_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_category_food_with_a_low_price_ceiling_057');
      let filter: ProductFilter = new ProductFilter(CATEGORY_FOOD, 0, 10000);
      let result: Goods[] = filter.apply(catalogGoods);
      expect(result.length).assertEqual(2);
      expect(result[0].id).assertEqual(4);
      expect(result[1].id).assertEqual(12);
      for (let index: number = 0; index < result.length; index++) {
        expect(result[index].category).assertEqual(CATEGORY_FOOD);
        expect(result[index].price.cents() >= 0 && result[index].price.cents() <= 10000).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0580
     * @tc.name      filter_apply_selects_one_of_two_input_rows_058
     * @tc.desc      Verify filter apply selects one of two input rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_apply_selects_one_of_two_input_rows_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_apply_selects_one_of_two_input_rows_058');
      let phone: Goods = createGoods(519, 'Selected Phone', 1000, CATEGORY_PHONE);
      let food: Goods = createGoods(520, 'Rejected Food', 1000, CATEGORY_FOOD);
      let filter: ProductFilter = new ProductFilter(CATEGORY_PHONE);
      let result: Goods[] = filter.apply([food, phone]);
      expect(result.length).assertEqual(1);
      expect(result[0].id).assertEqual(519);
      expect(result[0].category).assertEqual(CATEGORY_PHONE);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0590
     * @tc.name      filter_matches_leaves_the_goods_unchanged_059
     * @tc.desc      Verify filter matches leaves the goods unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_matches_leaves_the_goods_unchanged_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_matches_leaves_the_goods_unchanged_059');
      let goods: Goods = catalogGoods[0];
      let filter: ProductFilter = new ProductFilter(CATEGORY_PHONE, 100000, 600000, 'phone', true);
      let beforeId: number = goods.id;
      let beforeTitle: string = goods.title;
      let beforeStock: number = goods.stock;
      let beforePrice: number = goods.price.cents();
      expect(filter.matches(goods)).assertTrue();
      expect(filter.matches(catalogGoods[6])).assertFalse();
      expect(goods.id).assertEqual(beforeId);
      expect(goods.title).assertEqual(beforeTitle);
      expect(goods.stock).assertEqual(beforeStock);
      expect(goods.price.cents()).assertEqual(beforePrice);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0600
     * @tc.name      filter_keyword_blender_matches_the_title_only_060
     * @tc.desc      Verify filter keyword blender matches the title only.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_keyword_blender_matches_the_title_only_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_keyword_blender_matches_the_title_only_060');
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, 'blender', false);
      let result: Goods[] = filter.apply(catalogGoods);
      expect(result.length).assertEqual(2);
      for (let index: number = 0; index < result.length; index++) {
        expect(result[index].title).assertEqual('Kitchen Blender');
        expect(result[index].category).assertEqual(CATEGORY_APPLIANCE);
        expect(result[index].info.toLowerCase().indexOf('blender') < 0).assertTrue();
        expect(result[index].matchesKeyword('blender')).assertTrue();
      }
      expect(result[0].id).assertEqual(5);
      expect(result[1].id).assertEqual(13);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0610
     * @tc.name      filter_full_title_keyword_matches_both_phone_ones_061
     * @tc.desc      Verify filter full title keyword matches both phone ones.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_full_title_keyword_matches_both_phone_ones_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_full_title_keyword_matches_both_phone_ones_061');
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER,
        'Harmony Phone One', false);
      let result: Goods[] = filter.apply(catalogGoods);
      expect(result.length).assertEqual(2);
      expect(result[0].id).assertEqual(0);
      expect(result[1].id).assertEqual(8);
      for (let index: number = 0; index < result.length; index++) {
        expect(result[index].title).assertEqual('Harmony Phone One');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0620
     * @tc.name      filter_apply_preserves_injected_input_order_062
     * @tc.desc      Verify filter apply preserves injected input order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_apply_preserves_injected_input_order_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_apply_preserves_injected_input_order_062');
      // The food row leads the input, yet only the phones come back, still in the order 701 then 702.
      let food: Goods = createGoods(700, 'Injected Food', 1000, CATEGORY_FOOD);
      let firstPhone: Goods = createGoods(701, 'Injected Phone One', 2000, CATEGORY_PHONE);
      let secondPhone: Goods = createGoods(702, 'Injected Phone Two', 3000, CATEGORY_PHONE);
      let filter: ProductFilter = new ProductFilter(CATEGORY_PHONE);
      let result: Goods[] = filter.apply([food, firstPhone, secondPhone]);
      let ids: number[] = [];
      for (let index: number = 0; index < result.length; index++) {
        ids.push(result[index].id);
      }
      expect((ids).length).assertEqual(([701, 702]).length);
      for (let __i234: number = 0; __i234 < ([701, 702]).length; __i234++) {
        expect((ids)[__i234]).assertEqual(([701, 702])[__i234]);
      }
      expect(result[0].price.cents()).assertEqual(2000);
      expect(result[1].price.cents()).assertEqual(3000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0630
     * @tc.name      filter_collapsed_intervals_keep_only_the_exact_price_063
     * @tc.desc      Verify filter collapsed intervals keep only the exact price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_collapsed_intervals_keep_only_the_exact_price_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_collapsed_intervals_keep_only_the_exact_price_063');
      // Each collapsed interval keeps the two rows priced exactly there, one per category listed.
      let prices: number[] = [8900, 129900, 499900];
      let categories: string[] = [CATEGORY_FOOD, CATEGORY_SPORT, CATEGORY_PHONE];
      expect(prices.length).assertEqual(categories.length);
      for (let index: number = 0; index < prices.length; index++) {
        let filter: ProductFilter = new ProductFilter('', prices[index], prices[index]);
        let result: Goods[] = filter.apply(catalogGoods);
        expect(result.length).assertEqual(2);
        for (let item: number = 0; item < result.length; item++) {
          expect(result[item].price.cents()).assertEqual(prices[index]);
          expect(result[item].category).assertEqual(categories[index]);
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0640
     * @tc.name      filter_accepts_prices_inside_the_inclusive_band_064
     * @tc.desc      Verify filter accepts prices inside the inclusive band.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_accepts_prices_inside_the_inclusive_band_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_accepts_prices_inside_the_inclusive_band_064');
      // 10001 and 19999 sit one cent inside the band's ends, while 0 passes the degenerate 0..0 interval.
      let ids: number[] = [513, 514, 518];
      let prices: number[] = [10001, 19999, 0];
      let floors: number[] = [10000, 10000, 0];
      let ceilings: number[] = [20000, 20000, 0];
      expect(ids.length).assertEqual(prices.length);
      for (let index: number = 0; index < ids.length; index++) {
        let item: Goods = createGoods(ids[index], 'Inside Band Item', prices[index],
          CATEGORY_PHONE, 'inside info', 'basic_label', 1);
        let filter: ProductFilter = new ProductFilter('', floors[index], ceilings[index]);
        expect(filter.matches(item)).assertTrue();
        let result: Goods[] = filter.apply([item]);
        expect(result.length).assertEqual(1);
        expect(result[0].price.cents()).assertEqual(prices[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRODUCT_FILTER_0650
     * @tc.name      filter_rejects_prices_outside_the_inclusive_band_065
     * @tc.desc      Verify filter rejects prices outside the inclusive band.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filter_rejects_prices_outside_the_inclusive_band_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filter_rejects_prices_outside_the_inclusive_band_065');
      // 9999 and 20001 miss the 10000..20000 band by exactly one cent on each side.
      let ids: number[] = [508, 509];
      let prices: number[] = [9999, 20001];
      expect(ids.length).assertEqual(prices.length);
      for (let index: number = 0; index < ids.length; index++) {
        let item: Goods = createGoods(ids[index], 'Outside Band Item', prices[index],
          CATEGORY_PHONE, 'outside info', 'basic_label', 1);
        let filter: ProductFilter = new ProductFilter('', 10000, 20000);
        expect(filter.matches(item)).assertFalse();
        expect(filter.apply([item]).length).assertEqual(0);
      }
    });

  });
}
