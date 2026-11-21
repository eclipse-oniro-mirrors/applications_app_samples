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

import { describe, beforeAll, it, afterEach, expect } from '@ohos/hypium';
import { yieldToEventLoop } from '../Shared/TestDriver';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Catalog, Goods, Money } from '../Shared/ShopModel';
import { CATEGORY_APPLIANCE, CATEGORY_FOOD, CATEGORY_PHONE, CATEGORY_SPORT, CATEGORY_WEAR, PRODUCTS, createGoods, defaultCatalog } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

export default function catalogModelTest() {
  describe('OrangeShoppingCatalogModel', () => {
    let catalog: Catalog = defaultCatalog();

    beforeAll(() => {
      catalog = defaultCatalog();
      hilog.info(DOMAIN, TAG, '%{public}s', 'catalog suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0010
     * @tc.name      catalog_keeps_all_sixteen_products_001
     * @tc.desc      Verify catalog keeps all sixteen products.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_keeps_all_sixteen_products_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_keeps_all_sixteen_products_001');
      let count: number = catalog.count();
      expect(count).assertEqual(PRODUCTS.length);
      expect(catalog.isEmpty()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0020
     * @tc.name      catalog_by_id_returns_the_matching_product_002
     * @tc.desc      Verify catalog by id returns the matching product.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_by_id_returns_the_matching_product_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_by_id_returns_the_matching_product_002');
      let goods: Goods | undefined = catalog.byId(5);
      expect(goods !== null && goods !== undefined).assertTrue();
      if (goods !== undefined) {
        expect(goods.id).assertEqual(5);
        expect(goods.title).assertEqual('Kitchen Blender');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0030
     * @tc.name      catalog_by_unknown_id_returns_undefined_003
     * @tc.desc      Verify catalog by unknown id returns undefined.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_by_unknown_id_returns_undefined_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_by_unknown_id_returns_undefined_003');
      let goods: Goods | undefined = catalog.byId(99);
      expect(goods === null || goods === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0040
     * @tc.name      catalog_by_negative_id_returns_undefined_004
     * @tc.desc      Verify catalog by negative id returns undefined.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_by_negative_id_returns_undefined_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_by_negative_id_returns_undefined_004');
      let goods: Goods | undefined = catalog.byId(-1);
      expect(goods === null || goods === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0050
     * @tc.name      catalog_ids_preserve_insertion_order_005
     * @tc.desc      Verify catalog ids preserve insertion order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_ids_preserve_insertion_order_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_ids_preserve_insertion_order_005');
      let ids: number[] = catalog.ids();
      expect(ids.length).assertEqual(16);
      expect(ids[0]).assertEqual(0);
      expect(ids[15]).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0060
     * @tc.name      catalog_ids_are_unique_006
     * @tc.desc      Verify catalog ids are unique.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_ids_are_unique_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_ids_are_unique_006');
      let ids: number[] = catalog.ids();
      let __seen58: number[] = [];
      for (let __i58: number = 0; __i58 < (ids).length; __i58++) {
        expect(__seen58.indexOf((ids)[__i58]) < 0).assertTrue();
        __seen58.push((ids)[__i58]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0070
     * @tc.name      catalog_all_returns_a_defensive_copy_007
     * @tc.desc      Verify catalog all returns a defensive copy.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_all_returns_a_defensive_copy_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_all_returns_a_defensive_copy_007');
      let first: Goods[] = catalog.all();
      // Removing an element from the returned array must not reach the catalog's own storage.
      first.splice(0, 1);
      let second: Goods[] = catalog.all();
      expect(first.length).assertEqual(15);
      expect(second.length).assertEqual(16);
      expect(catalog.count()).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0080
     * @tc.name      catalog_index_of_known_and_unknown_id_008
     * @tc.desc      Verify catalog index of known and unknown id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_index_of_known_and_unknown_id_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_index_of_known_and_unknown_id_008');
      expect(catalog.indexOf(0)).assertEqual(0);
      expect(catalog.indexOf(15)).assertEqual(15);
      expect(catalog.indexOf(42)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0090
     * @tc.name      catalog_exposes_five_categories_009
     * @tc.desc      Verify catalog exposes five categories.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_exposes_five_categories_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_exposes_five_categories_009');
      let categories: string[] = catalog.categories();
      expect(categories.length).assertEqual(5);
      expect(categories.indexOf(CATEGORY_PHONE) >= 0).assertTrue();
      expect(categories.indexOf(CATEGORY_SPORT) >= 0).assertTrue();
      expect(categories.indexOf(CATEGORY_FOOD) >= 0).assertTrue();
      expect(categories.indexOf(CATEGORY_APPLIANCE) >= 0).assertTrue();
      expect(categories.indexOf(CATEGORY_WEAR) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0100
     * @tc.name      catalog_category_filter_keeps_only_phone_entries_010
     * @tc.desc      Verify catalog category filter keeps only phone entries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_category_filter_keeps_only_phone_entries_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_category_filter_keeps_only_phone_entries_010');
      // Ids 0, 1 and 6 are the phone entries; the fixture lists them again in its second half.
      let phones: Goods[] = catalog.byCategory(CATEGORY_PHONE);
      expect(phones.length).assertEqual(6);
      for (let index: number = 0; index < phones.length; index++) {
        expect(phones[index].category).assertEqual(CATEGORY_PHONE);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0110
     * @tc.name      catalog_category_filter_for_food_returns_two_entries_011
     * @tc.desc      Verify catalog category filter for food returns two entries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_category_filter_for_food_returns_two_entries_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_category_filter_for_food_returns_two_entries_011');
      let food: Goods[] = catalog.byCategory(CATEGORY_FOOD);
      expect(food.length).assertEqual(2);
      expect(food[0].price.cents()).assertEqual(8900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0120
     * @tc.name      catalog_unknown_category_returns_empty_list_012
     * @tc.desc      Verify catalog unknown category returns empty list.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_unknown_category_returns_empty_list_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_unknown_category_returns_empty_list_012');
      let result: Goods[] = catalog.byCategory('tablet');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0130
     * @tc.name      catalog_price_range_is_inclusive_on_both_ends_013
     * @tc.desc      Verify catalog price range is inclusive on both ends.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_price_range_is_inclusive_on_both_ends_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_price_range_is_inclusive_on_both_ends_013');
      // Only the tea pack (8900) and the shirt (15900) fit, each present twice: 2 + 2 = 4.
      let result: Goods[] = catalog.inPriceRange(8900, 15900);
      expect(result.length).assertEqual(4);
      for (let index: number = 0; index < result.length; index++) {
        expect(result[index].price.cents() >= 8900 && result[index].price.cents() <= 15900).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0140
     * @tc.name      catalog_reversed_price_range_is_empty_014
     * @tc.desc      Verify catalog reversed price range is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_reversed_price_range_is_empty_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_reversed_price_range_is_empty_014');
      let reversed: Goods[] = catalog.inPriceRange(200000, 10000);
      expect(reversed.length).assertEqual(0);
      let ordered: Goods[] = catalog.inPriceRange(10000, 200000);
      expect(ordered.length).assertEqual(10);
      expect(ordered.length > reversed.length).assertTrue();
      for (let index: number = 0; index < ordered.length; index++) {
        expect(ordered[index].price.cents() >= 10000 && ordered[index].price.cents() <= 200000).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0150
     * @tc.name      catalog_zero_to_zero_keeps_nothing_015
     * @tc.desc      Verify catalog zero to zero keeps nothing.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_zero_to_zero_keeps_nothing_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_zero_to_zero_keeps_nothing_015');
      let result: Goods[] = catalog.inPriceRange(0, 0);
      expect(result.length).assertEqual(0);
      // The shipped catalog has no zero-cent row, so only a synthetic free sample can sit at 0..0.
      let freeCatalog: Catalog = new Catalog([
        createGoods(950, 'Free Sample', 0, CATEGORY_FOOD),
        createGoods(951, 'Paid Sample', 100, CATEGORY_FOOD)
      ]);
      let freeOnly: Goods[] = freeCatalog.inPriceRange(0, 0);
      expect(freeOnly.length).assertEqual(1);
      expect(freeOnly[0].id).assertEqual(950);
      expect(freeOnly[0].price.cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0160
     * @tc.name      catalog_single_cent_range_can_match_exact_price_016
     * @tc.desc      Verify catalog single cent range can match exact price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_single_cent_range_can_match_exact_price_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_single_cent_range_can_match_exact_price_016');
      // A one-cent window still admits a row whose price equals both bounds.
      let result: Goods[] = catalog.inPriceRange(8900, 8900);
      expect(result.length).assertEqual(2);
      expect(result[0].price.cents()).assertEqual(8900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0170
     * @tc.name      catalog_in_stock_filter_removes_sold_out_items_017
     * @tc.desc      Verify catalog in stock filter removes sold out items.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_in_stock_filter_removes_sold_out_items_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_in_stock_filter_removes_sold_out_items_017');
      // Wireless Earbuds (ids 6 and 14) carry stock 0, so two of the sixteen rows drop out.
      let inStock: Goods[] = catalog.inStockOnly();
      expect(inStock.length).assertEqual(14);
      for (let index: number = 0; index < inStock.length; index++) {
        expect(inStock[index].isInStock()).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0180
     * @tc.name      catalog_sold_out_items_are_identified_018
     * @tc.desc      Verify catalog sold out items are identified.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_sold_out_items_are_identified_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_sold_out_items_are_identified_018');
      let earbuds: Goods | undefined = catalog.byId(6);
      expect(earbuds !== null && earbuds !== undefined).assertTrue();
      if (earbuds !== undefined) {
        expect(earbuds.isInStock()).assertFalse();
        expect(earbuds.stock).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0190
     * @tc.name      catalog_ascending_sort_starts_at_lowest_price_019
     * @tc.desc      Verify catalog ascending sort starts at lowest price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_ascending_sort_starts_at_lowest_price_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_ascending_sort_starts_at_lowest_price_019');
      let sorted: Goods[] = catalog.sortedByPrice(true);
      expect(sorted[0].price.cents()).assertEqual(8900);
      expect(sorted[sorted.length - 1].price.cents()).assertEqual(499900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0200
     * @tc.name      catalog_descending_sort_starts_at_highest_price_020
     * @tc.desc      Verify catalog descending sort starts at highest price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_descending_sort_starts_at_highest_price_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_descending_sort_starts_at_highest_price_020');
      let sorted: Goods[] = catalog.sortedByPrice(false);
      expect(sorted[0].price.cents()).assertEqual(499900);
      expect(sorted[sorted.length - 1].price.cents()).assertEqual(8900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0210
     * @tc.name      catalog_price_sort_is_monotonic_ascending_021
     * @tc.desc      Verify catalog price sort is monotonic ascending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_price_sort_is_monotonic_ascending_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_price_sort_is_monotonic_ascending_021');
      let sorted: Goods[] = catalog.sortedByPrice(true);
      for (let index: number = 1; index < sorted.length; index++) {
        expect(sorted[index - 1].price.cents() <= sorted[index].price.cents()).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0220
     * @tc.name      catalog_price_sort_is_monotonic_descending_022
     * @tc.desc      Verify catalog price sort is monotonic descending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_price_sort_is_monotonic_descending_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_price_sort_is_monotonic_descending_022');
      let sorted: Goods[] = catalog.sortedByPrice(false);
      for (let index: number = 1; index < sorted.length; index++) {
        expect(sorted[index - 1].price.cents() >= sorted[index].price.cents()).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0230
     * @tc.name      catalog_price_ties_are_broken_by_id_023
     * @tc.desc      Verify catalog price ties are broken by id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_price_ties_are_broken_by_id_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_price_ties_are_broken_by_id_023');
      let sorted: Goods[] = catalog.sortedByPrice(true);
      // Every price appears twice through the duplicated fixture, so ties force an id comparison.
      for (let index: number = 1; index < sorted.length; index++) {
        let previous: Goods = sorted[index - 1];
        let current: Goods = sorted[index];
        if (previous.price.cents() === current.price.cents()) {
          expect(previous.id < current.id).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0240
     * @tc.name      catalog_sort_does_not_mutate_the_source_order_024
     * @tc.desc      Verify catalog sort does not mutate the source order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_sort_does_not_mutate_the_source_order_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_sort_does_not_mutate_the_source_order_024');
      let before: number[] = catalog.ids();
      catalog.sortedByPrice(false);
      let after: number[] = catalog.ids();
      expect((after).length).assertEqual((before).length);
      for (let __i57: number = 0; __i57 < (before).length; __i57++) {
        expect((after)[__i57]).assertEqual((before)[__i57]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0250
     * @tc.name      catalog_sales_sort_puts_best_seller_first_025
     * @tc.desc      Verify catalog sales sort puts best seller first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_sales_sort_puts_best_seller_first_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_sales_sort_puts_best_seller_first_025');
      let sorted: Goods[] = catalog.sortedBySales();
      expect(sorted[0].title).assertEqual('Green Tea Pack');
      expect(sorted[0].sales).assertEqual(3200);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0260
     * @tc.name      catalog_sales_sort_is_monotonic_026
     * @tc.desc      Verify catalog sales sort is monotonic.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_sales_sort_is_monotonic_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_sales_sort_is_monotonic_026');
      let sorted: Goods[] = catalog.sortedBySales();
      for (let index: number = 1; index < sorted.length; index++) {
        expect(sorted[index - 1].sales >= sorted[index].sales).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0270
     * @tc.name      catalog_top_rated_filter_keeps_five_star_items_027
     * @tc.desc      Verify catalog top rated filter keeps five star items.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_top_rated_filter_keeps_five_star_items_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_top_rated_filter_keeps_five_star_items_027');
      let fiveStars: Goods[] = catalog.topRated(5);
      expect(fiveStars.length).assertEqual(8);
      for (let index: number = 0; index < fiveStars.length; index++) {
        expect(fiveStars[index].rating).assertEqual(5);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0280
     * @tc.name      catalog_top_rated_threshold_above_five_is_empty_028
     * @tc.desc      Verify catalog top rated threshold above five is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_top_rated_threshold_above_five_is_empty_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_top_rated_threshold_above_five_is_empty_028');
      // Ratings are capped at five stars in the fixture, so asking for 6 cannot match.
      let result: Goods[] = catalog.topRated(6);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0290
     * @tc.name      catalog_page_returns_the_requested_window_029
     * @tc.desc      Verify catalog page returns the requested window.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_page_returns_the_requested_window_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_page_returns_the_requested_window_029');
      // Pages are zero-based: page 1 with size 5 covers offsets 5 through 9.
      let page: Goods[] = catalog.page(1, 5);
      expect(page.length).assertEqual(5);
      expect(page[0].id).assertEqual(5);
      expect(page[4].id).assertEqual(9);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0300
     * @tc.name      catalog_last_page_is_partial_030
     * @tc.desc      Verify catalog last page is partial.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_last_page_is_partial_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_last_page_is_partial_030');
      // Sixteen rows split into pages of five leave index 15 alone on page 3.
      let page: Goods[] = catalog.page(3, 5);
      expect(page.length).assertEqual(1);
      expect(page[0].id).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0310
     * @tc.name      catalog_page_beyond_the_end_is_empty_031
     * @tc.desc      Verify catalog page beyond the end is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_page_beyond_the_end_is_empty_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_page_beyond_the_end_is_empty_031');
      let page: Goods[] = catalog.page(8, 5);
      expect(page.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0320
     * @tc.name      catalog_page_size_zero_is_rejected_032
     * @tc.desc      Verify catalog page size zero is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_page_size_zero_is_rejected_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_page_size_zero_is_rejected_032');
      let page: Goods[] = catalog.page(0, 0);
      expect(page.length).assertEqual(0);
      expect(catalog.pageCount(0)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0330
     * @tc.name      catalog_negative_page_is_rejected_033
     * @tc.desc      Verify catalog negative page is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_negative_page_is_rejected_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_negative_page_is_rejected_033');
      let page: Goods[] = catalog.page(-1, 4);
      expect(page.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0340
     * @tc.name      catalog_page_count_rounds_up_034
     * @tc.desc      Verify catalog page count rounds up.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_page_count_rounds_up_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_page_count_rounds_up_034');
      // ceil(16 / 5) rounds up to 4; size 4 divides exactly, and size 1 gives one page per row.
      expect(catalog.pageCount(5)).assertEqual(4);
      expect(catalog.pageCount(4)).assertEqual(4);
      expect(catalog.pageCount(1)).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0350
     * @tc.name      catalog_cheapest_entry_is_the_tea_pack_035
     * @tc.desc      Verify catalog cheapest entry is the tea pack.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_cheapest_entry_is_the_tea_pack_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_cheapest_entry_is_the_tea_pack_035');
      let cheapest: Goods | undefined = catalog.cheapest();
      expect(cheapest !== null && cheapest !== undefined).assertTrue();
      if (cheapest !== undefined) {
        expect(cheapest.price.cents()).assertEqual(8900);
        expect(cheapest.title).assertEqual('Green Tea Pack');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0360
     * @tc.name      catalog_most_expensive_entry_is_the_flagship_phone_036
     * @tc.desc      Verify catalog most expensive entry is the flagship phone.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_most_expensive_entry_is_the_flagship_phone_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_most_expensive_entry_is_the_flagship_phone_036');
      let mostExpensive: Goods | undefined = catalog.mostExpensive();
      expect(mostExpensive !== null && mostExpensive !== undefined).assertTrue();
      if (mostExpensive !== undefined) {
        expect(mostExpensive.price.cents()).assertEqual(499900);
        expect(mostExpensive.title).assertEqual('Harmony Phone One');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0370
     * @tc.name      catalog_empty_catalog_has_no_extremes_037
     * @tc.desc      Verify catalog empty catalog has no extremes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_empty_catalog_has_no_extremes_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_empty_catalog_has_no_extremes_037');
      let empty: Catalog = new Catalog([]);
      expect(empty.isEmpty()).assertTrue();
      expect(empty.cheapest() === null || empty.cheapest() === undefined).assertTrue();
      expect(empty.mostExpensive() === null || empty.mostExpensive() === undefined).assertTrue();
      expect(empty.pageCount(5)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0380
     * @tc.name      catalog_accepts_a_single_item_list_038
     * @tc.desc      Verify catalog accepts a single item list.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_accepts_a_single_item_list_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_accepts_a_single_item_list_038');
      let single: Catalog = new Catalog([
        createGoods(100, 'Solo Item', 100, CATEGORY_PHONE)
      ]);
      expect(single.count()).assertEqual(1);
      let cheapest: Goods | undefined = single.cheapest();
      let mostExpensive: Goods | undefined = single.mostExpensive();
      expect(cheapest !== null && cheapest !== undefined).assertTrue();
      expect(mostExpensive !== null && mostExpensive !== undefined).assertTrue();
      if (cheapest !== undefined && mostExpensive !== undefined) {
        expect(cheapest.title).assertEqual('Solo Item');
        expect(mostExpensive.title).assertEqual('Solo Item');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0390
     * @tc.name      catalog_duplicate_ids_are_kept_but_lookup_uses_first_039
     * @tc.desc      Verify catalog duplicate ids are kept but lookup uses first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_duplicate_ids_are_kept_but_lookup_uses_first_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_duplicate_ids_are_kept_but_lookup_uses_first_039');
      // Both rows stay countable, yet the id lookup reports position 0 rather than throwing or merging.
      let duplicate: Catalog = new Catalog([
        createGoods(7, 'First Seven', 100, CATEGORY_PHONE),
        createGoods(7, 'Second Seven', 200, CATEGORY_FOOD)
      ]);
      expect(duplicate.count()).assertEqual(2);
      let found: Goods | undefined = duplicate.byId(7);
      expect(found !== null && found !== undefined).assertTrue();
      if (found !== undefined) {
        expect(found.title).assertEqual('First Seven');
      }
      expect(duplicate.indexOf(7)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0400
     * @tc.name      catalog_contains_expected_high_price_entries_040
     * @tc.desc      Verify catalog contains expected high price entries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_contains_expected_high_price_entries_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_contains_expected_high_price_entries_040');
      let ids: number[] = catalog.ids();
      expect(ids.indexOf(0) >= 0).assertTrue();
      expect(ids.indexOf(1) >= 0).assertTrue();
      expect(ids.indexOf(99) < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0410
     * @tc.name      catalog_price_is_never_negative_041
     * @tc.desc      Verify catalog price is never negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_price_is_never_negative_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_price_is_never_negative_041');
      for (let index: number = 0; index < catalog.count(); index++) {
        let price: Money = catalog.all()[index].price;
        expect(price.isPositive()).assertTrue();
        expect(price.isNegative()).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0420
     * @tc.name      catalog_live_rooms_are_attached_to_the_first_four_products_042
     * @tc.desc      Verify catalog live rooms are attached to the first four products.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_live_rooms_are_attached_to_the_first_four_products_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_live_rooms_are_attached_to_the_first_four_products_042');
      // Live rooms belong to ids 0, 1, 2 and 5; the repeated half doubles that to eight rows.
      let liveCount: number = 0;
      for (let index: number = 0; index < catalog.count(); index++) {
        if (catalog.all()[index].hasLiveRoom()) {
          liveCount++;
        }
      }
      expect(liveCount).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0430
     * @tc.name      catalog_category_counts_add_up_to_the_total_043
     * @tc.desc      Verify catalog category counts add up to the total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_category_counts_add_up_to_the_total_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_category_counts_add_up_to_the_total_043');
      let categories: string[] = catalog.categories();
      let sum: number = 0;
      for (let index: number = 0; index < categories.length; index++) {
        sum += catalog.byCategory(categories[index]).length;
      }
      expect(sum).assertEqual(catalog.count());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0440
     * @tc.name      catalog_pages_cover_every_product_exactly_once_044
     * @tc.desc      Verify catalog pages cover every product exactly once.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_pages_cover_every_product_exactly_once_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_pages_cover_every_product_exactly_once_044');
      // Pages of three need ceil(16 / 3) = 6 calls, the sixth returning the lone id 15.
      let collected: number[] = [];
      let pageSize: number = 3;
      let pages: number = catalog.pageCount(pageSize);
      for (let page: number = 0; page < pages; page++) {
        let items: Goods[] = catalog.page(page, pageSize);
        for (let index: number = 0; index < items.length; index++) {
          collected.push(items[index].id);
        }
      }
      expect(collected.length).assertEqual(16);
      let __seen59: number[] = [];
      for (let __i59: number = 0; __i59 < (collected).length; __i59++) {
        expect(__seen59.indexOf((collected)[__i59]) < 0).assertTrue();
        __seen59.push((collected)[__i59]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_MODEL_0450
     * @tc.name      catalog_sorted_result_keeps_every_identifier_045
     * @tc.desc      Verify catalog sorted result keeps every identifier.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_sorted_result_keeps_every_identifier_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_sorted_result_keeps_every_identifier_045');
      let sorted: Goods[] = catalog.sortedByPrice(true);
      let ids: number[] = [];
      for (let index: number = 0; index < sorted.length; index++) {
        ids.push(sorted[index].id);
      }
      expect(ids.length).assertEqual(16);
      let __seen60: number[] = [];
      for (let __i60: number = 0; __i60 < (ids).length; __i60++) {
        expect(__seen60.indexOf((ids)[__i60]) < 0).assertTrue();
        __seen60.push((ids)[__i60]);
      }
      expect(ids.indexOf(15) >= 0).assertTrue();
    });
  });
}
