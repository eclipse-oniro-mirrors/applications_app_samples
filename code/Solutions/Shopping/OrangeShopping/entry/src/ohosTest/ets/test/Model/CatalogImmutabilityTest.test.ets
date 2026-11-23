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
import { Catalog, Goods, Money } from '../Shared/ShopModel';
import { CATEGORY_FOOD, CATEGORY_PHONE, CATEGORY_SPORT, CATEGORY_WEAR, createGoods, defaultCatalog } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

export default function catalogImmutabilityTest() {
  describe('OrangeShoppingCatalogImmutability', () => {
    let catalog: Catalog = defaultCatalog();

    beforeAll(() => {
      catalog = defaultCatalog();
      hilog.info(DOMAIN, TAG, '%{public}s', 'immutability suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0010
     * @tc.name      immutability_all_returns_a_fresh_array_on_every_call_001
     * @tc.desc      Verify immutability all returns a fresh array on every call.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_all_returns_a_fresh_array_on_every_call_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_all_returns_a_fresh_array_on_every_call_001');
      // The default catalog holds 16 rows, so both arrays report 16 while remaining distinct objects.
      let first: Goods[] = catalog.all();
      let second: Goods[] = catalog.all();
      expect(first !== second).assertTrue();
      expect(first.length).assertEqual(16);
      expect(second.length).assertEqual(16);
      let firstIds: number[] = [];
      let secondIds: number[] = [];
      for (let index: number = 0; index < first.length; index++) {
        firstIds.push(first[index].id);
      }
      for (let index: number = 0; index < second.length; index++) {
        secondIds.push(second[index].id);
      }
      expect((firstIds).length).assertEqual((secondIds).length);
      for (let __i43: number = 0; __i43 < (secondIds).length; __i43++) {
        expect((firstIds)[__i43]).assertEqual((secondIds)[__i43]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0020
     * @tc.name      immutability_all_copy_can_be_cleared_without_emptying_the_catalog_002
     * @tc.desc      Verify immutability all copy can be cleared without emptying the catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_all_copy_can_be_cleared_without_emptying_the_catalog_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_all_copy_can_be_cleared_without_emptying_the_catalog_002');
      let copy: Goods[] = catalog.all();
      // Emptying the borrowed array must leave byId lookups on ids 0 and 15, which sat at its two ends, intact.
      copy.splice(0, copy.length);
      expect(copy.length).assertEqual(0);
      expect(catalog.count()).assertEqual(16);
      expect(catalog.isEmpty()).assertFalse();
      expect(catalog.byId(0) !== null && catalog.byId(0) !== undefined).assertTrue();
      expect(catalog.byId(15) !== null && catalog.byId(15) !== undefined).assertTrue();
      expect(catalog.all().length).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0030
     * @tc.name      immutability_all_copy_supports_local_replacement_003
     * @tc.desc      Verify immutability all copy supports local replacement.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_all_copy_supports_local_replacement_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_all_copy_supports_local_replacement_003');
      let copy: Goods[] = catalog.all();
      copy[0] = createGoods(999, 'Replacement Row', 1000, CATEGORY_PHONE);
      expect(copy[0].id).assertEqual(999);
      expect(catalog.byId(999) === null || catalog.byId(999) === undefined).assertTrue();
      expect(catalog.byId(0) !== null && catalog.byId(0) !== undefined).assertTrue();
      expect(catalog.all()[0].id).assertEqual(0);
      expect(catalog.count()).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0040
     * @tc.name      immutability_all_copy_shares_the_catalog_goods_004
     * @tc.desc      Verify immutability all copy shares the catalog goods.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_all_copy_shares_the_catalog_goods_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_all_copy_shares_the_catalog_goods_004');
      let local: Catalog = new Catalog([
        createGoods(10, 'Local One', 1000, CATEGORY_PHONE, 'local info', 'basic_label', 5),
        createGoods(11, 'Local Two', 2000, CATEGORY_FOOD, 'local info', 'basic_label', 6)
      ]);
      let copy: Goods[] = local.all();
      // The array is copied but its elements are shared, so zeroing stock through the copy puts goods 10 out of stock.
      copy[0].stock = 0;
      let first: Goods | undefined = local.byId(10);
      let second: Goods | undefined = local.byId(11);

      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined) {
        expect(first.stock).assertEqual(0);
        expect(first.isInStock()).assertFalse();
      }
      if (second !== undefined) {
        expect(second.stock).assertEqual(6);
      }
      expect(local.all()[0].stock).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0050
     * @tc.name      immutability_ids_result_is_detached_from_the_catalog_005
     * @tc.desc      Verify immutability ids result is detached from the catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_ids_result_is_detached_from_the_catalog_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_ids_result_is_detached_from_the_catalog_005');
      // After one edit and a two-element splice, 14 ids remain, while a fresh ids() still reports 16 ending at 15.
      let ids: number[] = catalog.ids();
      ids[0] = 999;
      ids.splice(1, 2);
      let fresh: number[] = catalog.ids();
      expect(ids.length).assertEqual(14);
      expect(fresh.length).assertEqual(16);
      expect(fresh[0]).assertEqual(0);
      expect(fresh[15]).assertEqual(15);
      expect(catalog.byId(0) !== null && catalog.byId(0) !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0060
     * @tc.name      immutability_ids_result_is_fresh_each_call_006
     * @tc.desc      Verify immutability ids result is fresh each call.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_ids_result_is_fresh_each_call_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_ids_result_is_fresh_each_call_006');
      let first: number[] = catalog.ids();
      let second: number[] = catalog.ids();
      expect(first !== second).assertTrue();
      expect((first).length).assertEqual((second).length);
      for (let __i44: number = 0; __i44 < (second).length; __i44++) {
        expect((first)[__i44]).assertEqual((second)[__i44]);
      }
      first.splice(0, 1);
      expect(first.length).assertEqual(15);
      expect(second.length).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0070
     * @tc.name      immutability_sorted_by_price_returns_fresh_arrays_007
     * @tc.desc      Verify immutability sorted by price returns fresh arrays.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_sorted_by_price_returns_fresh_arrays_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_sorted_by_price_returns_fresh_arrays_007');
      // Two sorts must be distinct arrays; the cheapest 8900 sits first and both still cover all 16 rows.
      let first: Goods[] = catalog.sortedByPrice(true);
      let second: Goods[] = catalog.sortedByPrice(true);
      expect(first !== second).assertTrue();
      expect(first.length).assertEqual(16);
      expect(second.length).assertEqual(16);
      expect(first[0].price.cents()).assertEqual(8900);
      expect(second[0].price.cents()).assertEqual(8900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0080
     * @tc.name      immutability_sorted_by_price_leaves_the_catalog_order_008
     * @tc.desc      Verify immutability sorted by price leaves the catalog order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_sorted_by_price_leaves_the_catalog_order_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_sorted_by_price_leaves_the_catalog_order_008');
      let before: number[] = catalog.ids();
      let sorted: Goods[] = catalog.sortedByPrice(true);
      let after: number[] = catalog.ids();
      expect((after).length).assertEqual((before).length);
      for (let __i45: number = 0; __i45 < (before).length; __i45++) {
        expect((after)[__i45]).assertEqual((before)[__i45]);
      }
      expect(after[0]).assertEqual(0);
      expect(after[15]).assertEqual(15);
      expect(sorted[0].price.cents()).assertEqual(8900);
      expect(sorted[15].price.cents()).assertEqual(499900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0090
     * @tc.name      immutability_descending_price_sort_is_complete_and_source_stable_009
     * @tc.desc      Verify immutability descending price sort is complete and source stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_descending_price_sort_is_complete_and_source_stable_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_descending_price_sort_is_complete_and_source_stable_009');
      let before: number[] = catalog.ids();
      // Flipping the comparator puts 499900 first and 8900 last while the source keeps its 0..15 order.
      let sorted: Goods[] = catalog.sortedByPrice(false);
      let after: number[] = catalog.ids();
      expect((after).length).assertEqual((before).length);
      for (let __i46: number = 0; __i46 < (before).length; __i46++) {
        expect((after)[__i46]).assertEqual((before)[__i46]);
      }
      expect(sorted.length).assertEqual(16);
      expect(sorted[0].price.cents()).assertEqual(499900);
      expect(sorted[15].price.cents()).assertEqual(8900);
      expect(catalog.all()[0].id).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0100
     * @tc.name      immutability_sorted_by_sales_returns_fresh_arrays_010
     * @tc.desc      Verify immutability sorted by sales returns fresh arrays.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_sorted_by_sales_returns_fresh_arrays_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_sorted_by_sales_returns_fresh_arrays_010');
      let first: Goods[] = catalog.sortedBySales();
      let second: Goods[] = catalog.sortedBySales();
      expect(first !== second).assertTrue();
      expect(first.length).assertEqual(16);
      expect(second.length).assertEqual(16);
      expect(first[0].sales).assertEqual(3200);
      expect(second[0].sales).assertEqual(3200);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0110
     * @tc.name      immutability_sorted_by_sales_leaves_the_catalog_order_011
     * @tc.desc      Verify immutability sorted by sales leaves the catalog order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_sorted_by_sales_leaves_the_catalog_order_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_sorted_by_sales_leaves_the_catalog_order_011');
      let before: number[] = catalog.ids();
      // The sales-descending order starts at the 3200 best seller and ends at the 430 slow mover.
      let sorted: Goods[] = catalog.sortedBySales();
      let after: number[] = catalog.ids();
      expect((after).length).assertEqual((before).length);
      for (let __i47: number = 0; __i47 < (before).length; __i47++) {
        expect((after)[__i47]).assertEqual((before)[__i47]);
      }
      expect(after[0]).assertEqual(0);
      expect(after[15]).assertEqual(15);
      expect(sorted[0].sales).assertEqual(3200);
      expect(sorted[15].sales).assertEqual(430);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0120
     * @tc.name      immutability_reordering_the_price_copy_does_not_reorder_the_catalog_012
     * @tc.desc      Verify immutability reordering the price copy does not reorder the catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_reordering_the_price_copy_does_not_reorder_the_catalog_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_reordering_the_price_copy_does_not_reorder_the_catalog_012');
      let sorted: Goods[] = catalog.sortedByPrice(true);
      let first: Goods = sorted[0];
      sorted[0] = sorted[15];
      sorted[15] = first;
      expect(sorted[0].price.cents()).assertEqual(499900);
      let after: number[] = catalog.ids();
      expect(after[0]).assertEqual(0);
      expect(after[15]).assertEqual(15);
      expect(catalog.all()[0].id).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0130
     * @tc.name      immutability_reordering_the_sales_copy_does_not_reorder_the_catalog_013
     * @tc.desc      Verify immutability reordering the sales copy does not reorder the catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_reordering_the_sales_copy_does_not_reorder_the_catalog_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_reordering_the_sales_copy_does_not_reorder_the_catalog_013');
      let sorted: Goods[] = catalog.sortedBySales();
      let first: Goods = sorted[0];
      sorted[0] = sorted[15];
      sorted[15] = first;
      expect(sorted[0].sales).assertEqual(430);
      expect(catalog.all()[0].id).assertEqual(0);
      expect(catalog.all()[15].id).assertEqual(15);
      expect(catalog.count()).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0140
     * @tc.name      immutability_price_sorted_elements_are_catalog_references_014
     * @tc.desc      Verify immutability price sorted elements are catalog references.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_price_sorted_elements_are_catalog_references_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_price_sorted_elements_are_catalog_references_014');
      let local: Catalog = new Catalog([
        createGoods(10, 'Cheap Local', 1000, CATEGORY_PHONE, 'local info', 'basic_label', 5),
        createGoods(11, 'Pricey Local', 4000, CATEGORY_FOOD, 'local info', 'basic_label', 6)
      ]);
      let sorted: Goods[] = local.sortedByPrice(true);
      // Sorted rows point at the same Goods objects, so 77777 written into the cheapest slot shows through byId 10.
      sorted[0].sales = 77777;
      let first: Goods | undefined = local.byId(10);
      let second: Goods | undefined = local.byId(11);

      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined) {
        expect(first.sales).assertEqual(77777);
      }
      if (second !== undefined) {
        expect(second.sales).assertEqual(0);
      }
      expect(local.all()[0].sales).assertEqual(77777);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0150
     * @tc.name      immutability_sales_sorted_elements_are_catalog_references_015
     * @tc.desc      Verify immutability sales sorted elements are catalog references.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_sales_sorted_elements_are_catalog_references_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_sales_sorted_elements_are_catalog_references_015');
      let local: Catalog = new Catalog([
        createGoods(12, 'Best Local', 1000, CATEGORY_PHONE, 'local info', 'basic_label', 5, 90),
        createGoods(13, 'Slow Local', 2000, CATEGORY_FOOD, 'local info', 'basic_label', 6, 10)
      ]);
      let sorted: Goods[] = local.sortedBySales();
      sorted[0].title = 'Renamed Best Local';
      let first: Goods | undefined = local.byId(12);
      let second: Goods | undefined = local.byId(13);

      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined) {
        expect(first.title).assertEqual('Renamed Best Local');
      }
      if (second !== undefined) {
        expect(second.title).assertEqual('Slow Local');
      }
      expect(local.all()[0].title).assertEqual('Renamed Best Local');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0160
     * @tc.name      immutability_repeated_price_sort_calls_are_identical_016
     * @tc.desc      Verify immutability repeated price sort calls are identical.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_repeated_price_sort_calls_are_identical_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_repeated_price_sort_calls_are_identical_016');
      let first: Goods[] = catalog.sortedByPrice(true);
      let second: Goods[] = catalog.sortedByPrice(true);
      let firstIds: number[] = [];
      let secondIds: number[] = [];
      for (let index: number = 0; index < first.length; index++) {
        firstIds.push(first[index].id);
      }
      for (let index: number = 0; index < second.length; index++) {
        secondIds.push(second[index].id);
      }
      expect((firstIds).length).assertEqual((secondIds).length);
      for (let __i48: number = 0; __i48 < (secondIds).length; __i48++) {
        expect((firstIds)[__i48]).assertEqual((secondIds)[__i48]);
      }
      expect(first !== second).assertTrue();
      expect(firstIds[0]).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0170
     * @tc.name      immutability_repeated_sales_sort_calls_are_identical_017
     * @tc.desc      Verify immutability repeated sales sort calls are identical.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_repeated_sales_sort_calls_are_identical_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_repeated_sales_sort_calls_are_identical_017');
      let first: Goods[] = catalog.sortedBySales();
      let second: Goods[] = catalog.sortedBySales();
      let firstIds: number[] = [];
      let secondIds: number[] = [];
      for (let index: number = 0; index < first.length; index++) {
        firstIds.push(first[index].id);
      }
      for (let index: number = 0; index < second.length; index++) {
        secondIds.push(second[index].id);
      }
      expect((firstIds).length).assertEqual((secondIds).length);
      for (let __i49: number = 0; __i49 < (secondIds).length; __i49++) {
        expect((firstIds)[__i49]).assertEqual((secondIds)[__i49]);
      }
      expect(first !== second).assertTrue();
      expect(firstIds[0]).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0180
     * @tc.name      immutability_page_returns_fresh_arrays_018
     * @tc.desc      Verify immutability page returns fresh arrays.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_page_returns_fresh_arrays_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_page_returns_fresh_arrays_018');
      let first: Goods[] = catalog.page(0, 4);
      let second: Goods[] = catalog.page(0, 4);
      expect(first !== second).assertTrue();
      expect(first.length).assertEqual(4);
      expect(second.length).assertEqual(4);
      let firstIds: number[] = [];
      let secondIds: number[] = [];
      for (let index: number = 0; index < first.length; index++) {
        firstIds.push(first[index].id);
      }
      for (let index: number = 0; index < second.length; index++) {
        secondIds.push(second[index].id);
      }
      expect((firstIds).length).assertEqual((secondIds).length);
      for (let __i50: number = 0; __i50 < (secondIds).length; __i50++) {
        expect((firstIds)[__i50]).assertEqual((secondIds)[__i50]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0190
     * @tc.name      immutability_page_copy_supports_local_truncation_019
     * @tc.desc      Verify immutability page copy supports local truncation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_page_copy_supports_local_truncation_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_page_copy_supports_local_truncation_019');
      let copy: Goods[] = catalog.page(1, 4);
      copy.splice(0, 4);
      expect(copy.length).assertEqual(0);
      expect(catalog.count()).assertEqual(16);
      let fresh: Goods[] = catalog.page(1, 4);
      expect(fresh.length).assertEqual(4);
      expect(fresh[0].id).assertEqual(4);
      expect(catalog.byId(4) !== null && catalog.byId(4) !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0200
     * @tc.name      immutability_page_copy_supports_local_replacement_020
     * @tc.desc      Verify immutability page copy supports local replacement.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_page_copy_supports_local_replacement_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_page_copy_supports_local_replacement_020');
      let copy: Goods[] = catalog.page(1, 4);
      // Page 1 starts at id 4, so swapping in goods 998 changes only the copy while the catalog keeps id 4.
      copy[0] = createGoods(998, 'Page Replacement', 1000, CATEGORY_PHONE);
      expect(copy[0].id).assertEqual(998);
      expect(catalog.byId(998) === null || catalog.byId(998) === undefined).assertTrue();
      expect(catalog.byId(4) !== null && catalog.byId(4) !== undefined).assertTrue();
      expect(catalog.page(1, 4)[0].id).assertEqual(4);
      expect(catalog.count()).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0210
     * @tc.name      immutability_page_copy_shares_the_catalog_goods_021
     * @tc.desc      Verify immutability page copy shares the catalog goods.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_page_copy_shares_the_catalog_goods_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_page_copy_shares_the_catalog_goods_021');
      let local: Catalog = new Catalog([
        createGoods(20, 'Paged Local One', 1000, CATEGORY_PHONE, 'local info', 'basic_label', 5),
        createGoods(21, 'Paged Local Two', 2000, CATEGORY_FOOD, 'local info', 'basic_label', 6)
      ]);
      let page: Goods[] = local.page(0, 2);
      page[0].title = 'Renamed Paged Local';
      let first: Goods | undefined = local.byId(20);
      let second: Goods | undefined = local.byId(21);

      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined) {
        expect(first.title).assertEqual('Renamed Paged Local');
      }
      if (second !== undefined) {
        expect(second.title).assertEqual('Paged Local Two');
      }
      expect(local.all()[0].title).assertEqual('Renamed Paged Local');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0220
     * @tc.name      immutability_page_of_empty_catalog_is_fresh_and_empty_022
     * @tc.desc      Verify immutability page of empty catalog is fresh and empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_page_of_empty_catalog_is_fresh_and_empty_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_page_of_empty_catalog_is_fresh_and_empty_022');
      let empty: Catalog = new Catalog([]);
      let first: Goods[] = empty.page(0, 4);
      let second: Goods[] = empty.page(0, 4);
      expect(first.length).assertEqual(0);
      expect(second.length).assertEqual(0);
      expect(first !== second).assertTrue();
      expect(empty.count()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0230
     * @tc.name      immutability_page_beyond_the_end_is_fresh_and_empty_023
     * @tc.desc      Verify immutability page beyond the end is fresh and empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_page_beyond_the_end_is_fresh_and_empty_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_page_beyond_the_end_is_fresh_and_empty_023');
      // Page 10 starts well past the 16-row catalog, so both calls return empty arrays that are still distinct.
      let first: Goods[] = catalog.page(10, 4);
      let second: Goods[] = catalog.page(10, 4);
      expect(first.length).assertEqual(0);
      expect(second.length).assertEqual(0);
      expect(first !== second).assertTrue();
      expect(catalog.count()).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0240
     * @tc.name      immutability_sorted_empty_catalog_returns_fresh_empty_arrays_024
     * @tc.desc      Verify immutability sorted empty catalog returns fresh empty arrays.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_sorted_empty_catalog_returns_fresh_empty_arrays_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_sorted_empty_catalog_returns_fresh_empty_arrays_024');
      let empty: Catalog = new Catalog([]);
      let priceAscending: Goods[] = empty.sortedByPrice(true);
      let priceDescending: Goods[] = empty.sortedByPrice(false);
      let sales: Goods[] = empty.sortedBySales();
      expect(priceAscending.length).assertEqual(0);
      expect(priceDescending.length).assertEqual(0);
      expect(sales.length).assertEqual(0);
      let again: Goods[] = empty.sortedByPrice(true);
      expect(priceAscending !== again).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0250
     * @tc.name      immutability_by_id_returns_a_stable_reference_025
     * @tc.desc      Verify immutability by id returns a stable reference.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_by_id_returns_a_stable_reference_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_by_id_returns_a_stable_reference_025');
      let local: Catalog = new Catalog([
        createGoods(30, 'Stable Local', 1000, CATEGORY_PHONE, 'local info', 'basic_label', 5),
        createGoods(31, 'Other Local', 2000, CATEGORY_FOOD, 'local info', 'basic_label', 6)
      ]);
      let first: Goods | undefined = local.byId(30);
      let second: Goods | undefined = local.byId(30);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined && second !== undefined) {
        first.title = 'Edited Stable Local';
        expect(second.title).assertEqual('Edited Stable Local');
        expect(first.id).assertEqual(second.id);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0260
     * @tc.name      immutability_by_id_mutation_persists_through_all_026
     * @tc.desc      Verify immutability by id mutation persists through all.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_by_id_mutation_persists_through_all_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_by_id_mutation_persists_through_all_026');
      let local: Catalog = new Catalog([
        createGoods(32, 'Mutable Local One', 1000, CATEGORY_PHONE, 'local info', 'basic_label', 5),
        createGoods(33, 'Mutable Local Two', 2000, CATEGORY_FOOD, 'local info', 'basic_label', 6)
      ]);
      let found: Goods | undefined = local.byId(33);

      expect(found !== null && found !== undefined).assertTrue();
      if (found !== undefined) {
        found.stock = 0;
        found.title = 'Mutated Local Two';
      }
      let after: Goods | undefined = local.byId(33);
      expect(after !== null && after !== undefined).assertTrue();
      if (after !== undefined) {
        expect(after.stock).assertEqual(0);
        expect(after.title).assertEqual('Mutated Local Two');
        expect(after.isInStock()).assertFalse();
      }
      expect(local.all()[1].title).assertEqual('Mutated Local Two');
      expect(local.count()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0270
     * @tc.name      immutability_by_id_price_mutation_is_visible_through_page_027
     * @tc.desc      Verify immutability by id price mutation is visible through page.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_by_id_price_mutation_is_visible_through_page_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_by_id_price_mutation_is_visible_through_page_027');
      let items: Goods[] = [];
      for (let index: number = 0; index < 8; index++) {
        items.push(createGoods(40 + index, 'Paged Slot', 1000, CATEGORY_PHONE,
          'local info', 'basic_label', 5));
      }
      let local: Catalog = new Catalog(items);
      let page: Goods[] = local.page(1, 4);

      expect(page[0].id).assertEqual(44);
      let found: Goods | undefined = local.byId(44);
      expect(found !== null && found !== undefined).assertTrue();
      if (found !== undefined) {
        found.price = new Money(999999);
      }
      expect(local.page(1, 4)[0].price.cents()).assertEqual(999999);
      expect(page[0].price.cents()).assertEqual(999999);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0280
     * @tc.name      immutability_by_id_price_mutation_changes_the_sort_028
     * @tc.desc      Verify immutability by id price mutation changes the sort.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_by_id_price_mutation_changes_the_sort_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_by_id_price_mutation_changes_the_sort_028');
      let local: Catalog = new Catalog([
        createGoods(50, 'Sorted Local One', 1000, CATEGORY_PHONE, 'local info', 'basic_label', 5),
        createGoods(51, 'Sorted Local Two', 2000, CATEGORY_FOOD, 'local info', 'basic_label', 6),
        createGoods(52, 'Sorted Local Three', 3000, CATEGORY_SPORT, 'local info', 'basic_label', 7)
      ]);
      // Raising goods 50 to 999999 cents pushes it to the end of the ascending sort and leaves 51 at 2000 cheapest.
      let found: Goods | undefined = local.byId(50);

      expect(found !== null && found !== undefined).assertTrue();
      if (found !== undefined) {
        found.price = new Money(999999);
      }
      let sorted: Goods[] = local.sortedByPrice(true);
      expect(sorted[2].id).assertEqual(50);
      let expensive: Goods | undefined = local.mostExpensive();
      expect(expensive !== null && expensive !== undefined).assertTrue();
      if (expensive !== undefined) {
        expect(expensive.id).assertEqual(50);
      }
      let cheapest: Goods | undefined = local.cheapest();
      expect(cheapest !== null && cheapest !== undefined).assertTrue();
      if (cheapest !== undefined) {
        expect(cheapest.id).assertEqual(51);
        expect(cheapest.price.cents()).assertEqual(2000);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0290
     * @tc.name      immutability_by_id_object_is_the_all_element_029
     * @tc.desc      Verify immutability by id object is the all element.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_by_id_object_is_the_all_element_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_by_id_object_is_the_all_element_029');
      let local: Catalog = new Catalog([
        createGoods(60, 'Element One', 1000, CATEGORY_PHONE, 'local info', 'basic_label', 5),
        createGoods(61, 'Element Two', 2000, CATEGORY_FOOD, 'local info', 'basic_label', 6),
        createGoods(62, 'Element Three', 3000, CATEGORY_SPORT, 'local info', 'basic_label', 7)
      ]);
      let found: Goods | undefined = local.byId(61);

      expect(found !== null && found !== undefined).assertTrue();
      let items: Goods[] = local.all();
      items[1].title = 'Renamed Element Two';
      if (found !== undefined) {
        expect(found.title).assertEqual('Renamed Element Two');
      }
      let after: Goods | undefined = local.byId(61);
      expect(after !== null && after !== undefined).assertTrue();
      if (after !== undefined) {
        expect(after.title).assertEqual('Renamed Element Two');
      }
      expect(local.all()[1].title).assertEqual('Renamed Element Two');
      expect(local.all()[1].id).assertEqual(61);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0300
     * @tc.name      immutability_page_elements_are_catalog_references_030
     * @tc.desc      Verify immutability page elements are catalog references.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_page_elements_are_catalog_references_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_page_elements_are_catalog_references_030');
      let items: Goods[] = [];
      for (let index: number = 0; index < 12; index++) {
        items.push(createGoods(70 + index, 'Referenced Slot', 1000, CATEGORY_PHONE,
          'local info', 'basic_label', 5));
      }
      let local: Catalog = new Catalog(items);
      // With twelve rows starting at id 70, page 2 begins at index 8, which is id 78.
      let page: Goods[] = local.page(2, 4);

      expect(page[0].id).assertEqual(78);
      page[0].sales = 55555;
      let first: Goods | undefined = local.byId(78);
      let second: Goods | undefined = local.byId(79);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined) {
        expect(first.sales).assertEqual(55555);
      }
      if (second !== undefined) {
        expect(second.sales).assertEqual(0);
      }
      expect(local.all()[8].sales).assertEqual(55555);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0310
     * @tc.name      immutability_sorted_elements_are_catalog_references_031
     * @tc.desc      Verify immutability sorted elements are catalog references.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_sorted_elements_are_catalog_references_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_sorted_elements_are_catalog_references_031');
      let local: Catalog = new Catalog([
        createGoods(80, 'Ref Local One', 1000, CATEGORY_PHONE, 'local info', 'basic_label', 5),
        createGoods(81, 'Ref Local Two', 2000, CATEGORY_FOOD, 'local info', 'basic_label', 6)
      ]);
      let sorted: Goods[] = local.sortedByPrice(false);

      expect(sorted[0].id).assertEqual(81);
      sorted[0].stock = 0;
      let first: Goods | undefined = local.byId(81);
      let second: Goods | undefined = local.byId(80);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined) {
        expect(first.stock).assertEqual(0);
      }
      if (second !== undefined) {
        expect(second.stock).assertEqual(5);
      }
      expect(local.all()[1].stock).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0320
     * @tc.name      immutability_constructor_copies_the_input_array_032
     * @tc.desc      Verify immutability constructor copies the input array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_constructor_copies_the_input_array_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_constructor_copies_the_input_array_032');
      let first: Goods = createGoods(90, 'Input One', 1000, CATEGORY_PHONE);
      let second: Goods = createGoods(91, 'Input Two', 2000, CATEGORY_FOOD);
      let third: Goods = createGoods(92, 'Input Three', 3000, CATEGORY_SPORT);
      let input: Goods[] = [first, second];
      let local: Catalog = new Catalog(input);
      // Pushing a third row and reversing the caller's array must leave the catalog on ids 90 then 91.
      input.push(third);
      input.reverse();
      expect(local.count()).assertEqual(2);
      expect((local.ids()).length).assertEqual(([90, 91]).length);
      for (let __i51: number = 0; __i51 < ([90, 91]).length; __i51++) {
        expect((local.ids())[__i51]).assertEqual(([90, 91])[__i51]);
      }
      expect(local.byId(92) === null || local.byId(92) === undefined).assertTrue();
      expect(input.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0330
     * @tc.name      immutability_constructor_shares_the_input_elements_033
     * @tc.desc      Verify immutability constructor shares the input elements.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_constructor_shares_the_input_elements_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_constructor_shares_the_input_elements_033');
      let first: Goods = createGoods(93, 'Shared Input', 1000, CATEGORY_PHONE);
      let input: Goods[] = [first];
      let local: Catalog = new Catalog(input);
      input[0].title = 'Changed After Construction';
      let stored: Goods | undefined = local.byId(93);
      expect(stored !== null && stored !== undefined).assertTrue();
      if (stored !== undefined) {
        expect(stored.title).assertEqual('Changed After Construction');
        expect(stored.id).assertEqual(93);
      }
      expect(local.count()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0340
     * @tc.name      immutability_constructor_slot_replacement_is_local_034
     * @tc.desc      Verify immutability constructor slot replacement is local.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_constructor_slot_replacement_is_local_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_constructor_slot_replacement_is_local_034');
      let first: Goods = createGoods(94, 'Original Input', 1000, CATEGORY_PHONE);
      let replacement: Goods = createGoods(95, 'Replacement Input', 2000, CATEGORY_FOOD);
      let input: Goods[] = [first];
      let local: Catalog = new Catalog(input);
      input[0] = replacement;
      let stored: Goods | undefined = local.byId(94);
      expect(stored !== null && stored !== undefined).assertTrue();
      if (stored !== undefined) {
        expect(stored.title).assertEqual('Original Input');
      }
      expect(local.byId(95) === null || local.byId(95) === undefined).assertTrue();
      expect(local.count()).assertEqual(1);
      expect(local.ids()[0]).assertEqual(94);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0350
     * @tc.name      immutability_constructor_empty_input_stays_empty_035
     * @tc.desc      Verify immutability constructor empty input stays empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_constructor_empty_input_stays_empty_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_constructor_empty_input_stays_empty_035');
      let input: Goods[] = [];
      let local: Catalog = new Catalog(input);
      expect(local.count()).assertEqual(0);
      expect(local.isEmpty()).assertTrue();
      input.push(createGoods(96, 'Late Input', 1000, CATEGORY_PHONE));
      expect(input.length).assertEqual(1);
      expect(local.count()).assertEqual(0);
      expect(local.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0360
     * @tc.name      immutability_two_catalogs_are_isolated_036
     * @tc.desc      Verify immutability two catalogs are isolated.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_two_catalogs_are_isolated_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_two_catalogs_are_isolated_036');
      let first: Goods = createGoods(97, 'First Catalog Row', 1000, CATEGORY_PHONE);
      let second: Goods = createGoods(98, 'Second Catalog Row', 2000, CATEGORY_FOOD);
      let firstCatalog: Catalog = new Catalog([first]);
      let secondCatalog: Catalog = new Catalog([second]);
      let found: Goods | undefined = firstCatalog.byId(97);

      expect(found !== null && found !== undefined).assertTrue();
      if (found !== undefined) {
        found.title = 'Mutated In First Catalog';
      }
      let storedFirst: Goods | undefined = firstCatalog.byId(97);
      let storedSecond: Goods | undefined = secondCatalog.byId(98);
      expect(storedFirst !== null && storedFirst !== undefined).assertTrue();
      expect(storedSecond !== null && storedSecond !== undefined).assertTrue();
      if (storedFirst !== undefined) {
        expect(storedFirst.title).assertEqual('Mutated In First Catalog');
      }
      if (storedSecond !== undefined) {
        expect(storedSecond.title).assertEqual('Second Catalog Row');
      }
      expect(secondCatalog.byId(97) === null || secondCatalog.byId(97) === undefined).assertTrue();
      expect(firstCatalog.count()).assertEqual(1);
      expect(secondCatalog.count()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0370
     * @tc.name      immutability_in_stock_only_returns_a_fresh_array_037
     * @tc.desc      Verify immutability in stock only returns a fresh array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_in_stock_only_returns_a_fresh_array_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_in_stock_only_returns_a_fresh_array_037');
      let first: Goods[] = catalog.inStockOnly();
      let second: Goods[] = catalog.inStockOnly();
      expect(first !== second).assertTrue();
      expect(first.length).assertEqual(14);
      expect(second.length).assertEqual(14);
      first.splice(0, 1);
      expect(first.length).assertEqual(13);
      expect(second.length).assertEqual(14);
      expect(catalog.count()).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0380
     * @tc.name      immutability_in_stock_only_elements_are_catalog_references_038
     * @tc.desc      Verify immutability in stock only elements are catalog references.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_in_stock_only_elements_are_catalog_references_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_in_stock_only_elements_are_catalog_references_038');
      let local: Catalog = new Catalog([
        createGoods(100, 'Available Local', 1000, CATEGORY_PHONE, 'local info', 'basic_label', 5),
        createGoods(101, 'Sold Out Local', 2000, CATEGORY_FOOD, 'local info', 'basic_label', 0)
      ]);
      let result: Goods[] = local.inStockOnly();

      expect(result.length).assertEqual(1);
      expect(result[0].id).assertEqual(100);
      result[0].stock = 0;
      let stored: Goods | undefined = local.byId(100);
      expect(stored !== null && stored !== undefined).assertTrue();
      if (stored !== undefined) {
        expect(stored.stock).assertEqual(0);
        expect(stored.isInStock()).assertFalse();
      }
      expect(local.all()[0].stock).assertEqual(0);
      let after: Goods[] = local.inStockOnly();
      expect(after.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0390
     * @tc.name      immutability_two_all_copies_have_independent_containers_039
     * @tc.desc      Verify immutability two all copies have independent containers.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_two_all_copies_have_independent_containers_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_two_all_copies_have_independent_containers_039');
      let first: Goods[] = catalog.all();
      let second: Goods[] = catalog.all();
      // Cutting five of the 16 rows affects only the first container, so the second still runs 0 through 15.
      first.splice(0, 5);
      expect(first.length).assertEqual(11);
      expect(second.length).assertEqual(16);
      expect(catalog.count()).assertEqual(16);
      expect(second[0].id).assertEqual(0);
      expect(second[15].id).assertEqual(15);
      expect(first !== second).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0400
     * @tc.name      immutability_two_page_copies_have_independent_containers_040
     * @tc.desc      Verify immutability two page copies have independent containers.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_two_page_copies_have_independent_containers_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_two_page_copies_have_independent_containers_040');
      let first: Goods[] = catalog.page(0, 4);
      let second: Goods[] = catalog.page(0, 4);
      first.splice(0, 2);
      expect(first.length).assertEqual(2);
      expect(second.length).assertEqual(4);
      expect(second[0].id).assertEqual(0);
      expect(second[3].id).assertEqual(3);
      expect(catalog.count()).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0410
     * @tc.name      immutability_page_copy_replacement_does_not_affect_another_page_copy_041
     * @tc.desc      Verify immutability page copy replacement does not affect another page copy.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_page_copy_replacement_does_not_affect_another_page_copy_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_page_copy_replacement_does_not_affect_another_page_copy_041');
      let first: Goods[] = catalog.page(1, 4);
      let second: Goods[] = catalog.page(1, 4);
      first[0] = createGoods(997, 'Page Copy Replacement', 1000, CATEGORY_PHONE);
      expect(first[0].id).assertEqual(997);
      expect(second[0].id).assertEqual(4);
      expect(catalog.byId(4) !== null && catalog.byId(4) !== undefined).assertTrue();
      expect(catalog.byId(997) === null || catalog.byId(997) === undefined).assertTrue();
      expect(catalog.page(1, 4)[0].id).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0420
     * @tc.name      immutability_two_price_sorted_copies_have_independent_order_042
     * @tc.desc      Verify immutability two price sorted copies have independent order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_two_price_sorted_copies_have_independent_order_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_two_price_sorted_copies_have_independent_order_042');
      let first: Goods[] = catalog.sortedByPrice(true);
      let second: Goods[] = catalog.sortedByPrice(true);
      // Swapping the ends of one sorted copy must leave the other still starting at 8900 and ending at 499900.
      let swap: Goods = first[0];
      first[0] = first[15];
      first[15] = swap;
      expect(first[0].price.cents()).assertEqual(499900);
      expect(second[0].price.cents()).assertEqual(8900);
      expect(second[15].price.cents()).assertEqual(499900);
      expect(catalog.all()[0].id).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0430
     * @tc.name      immutability_sorted_price_copy_truncation_leaves_catalog_complete_043
     * @tc.desc      Verify immutability sorted price copy truncation leaves catalog complete.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_sorted_price_copy_truncation_leaves_catalog_complete_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_sorted_price_copy_truncation_leaves_catalog_complete_043');
      let sorted: Goods[] = catalog.sortedByPrice(true);
      sorted.splice(0, 10);
      expect(sorted.length).assertEqual(6);
      expect(catalog.count()).assertEqual(16);
      expect(catalog.all().length).assertEqual(16);
      let fresh: Goods[] = catalog.sortedByPrice(true);
      expect(fresh.length).assertEqual(16);
      expect(fresh[0].price.cents()).assertEqual(8900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0440
     * @tc.name      immutability_page_slice_matches_the_all_slice_044
     * @tc.desc      Verify immutability page slice matches the all slice.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_page_slice_matches_the_all_slice_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_page_slice_matches_the_all_slice_044');
      // Page 2 maps to offsets 8..11, so each slot must equal the all() element at 8 plus its index.
      let page: Goods[] = catalog.page(2, 4);
      let items: Goods[] = catalog.all();
      let pageIds: number[] = [];
      let allIds: number[] = [];
      for (let index: number = 0; index < page.length; index++) {
        pageIds.push(page[index].id);
        allIds.push(items[8 + index].id);
      }
      expect((pageIds).length).assertEqual(([8, 9, 10, 11]).length);
      for (let __i52: number = 0; __i52 < ([8, 9, 10, 11]).length; __i52++) {
        expect((pageIds)[__i52]).assertEqual(([8, 9, 10, 11])[__i52]);
      }
      expect((pageIds).length).assertEqual((allIds).length);
      for (let __i53: number = 0; __i53 < (allIds).length; __i53++) {
        expect((pageIds)[__i53]).assertEqual((allIds)[__i53]);
      }
      expect(page[3].id).assertEqual(items[11].id);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0450
     * @tc.name      immutability_extremes_return_catalog_references_045
     * @tc.desc      Verify immutability extremes return catalog references.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_extremes_return_catalog_references_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_extremes_return_catalog_references_045');
      let local: Catalog = new Catalog([
        createGoods(110, 'Extreme One', 1000, CATEGORY_PHONE, 'local info', 'basic_label', 5),
        createGoods(111, 'Extreme Two', 4000, CATEGORY_FOOD, 'local info', 'basic_label', 6),
        createGoods(112, 'Extreme Three', 2000, CATEGORY_SPORT, 'local info', 'basic_label', 7)
      ]);
      let cheapest: Goods | undefined = local.cheapest();
      let expensive: Goods | undefined = local.mostExpensive();

      expect(cheapest !== null && cheapest !== undefined).assertTrue();
      expect(expensive !== null && expensive !== undefined).assertTrue();
      if (cheapest !== undefined && expensive !== undefined) {
        expect(cheapest.id).assertEqual(110);
        expect(expensive.id).assertEqual(111);
        cheapest.title = 'Edited Cheapest';
        expensive.title = 'Edited Most Expensive';
        expect(local.all()[0].title).assertEqual('Edited Cheapest');
        expect(local.all()[1].title).assertEqual('Edited Most Expensive');
      }
      expect(local.all()[0].title).assertEqual('Edited Cheapest');
      expect(local.all()[1].title).assertEqual('Edited Most Expensive');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0460
     * @tc.name      immutability_by_id_mutation_changes_the_cheapest_item_046
     * @tc.desc      Verify immutability by id mutation changes the cheapest item.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_by_id_mutation_changes_the_cheapest_item_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_by_id_mutation_changes_the_cheapest_item_046');
      let local: Catalog = new Catalog([
        createGoods(113, 'Cheap Candidate', 1000, CATEGORY_PHONE, 'local info', 'basic_label', 5),
        createGoods(114, 'Middle Candidate', 2000, CATEGORY_FOOD, 'local info', 'basic_label', 6),
        createGoods(115, 'High Candidate', 3000, CATEGORY_SPORT, 'local info', 'basic_label', 7)
      ]);
      let found: Goods | undefined = local.byId(113);

      expect(found !== null && found !== undefined).assertTrue();
      if (found !== undefined) {
        found.price = new Money(999999);
      }
      let cheapest: Goods | undefined = local.cheapest();
      expect(cheapest !== null && cheapest !== undefined).assertTrue();
      if (cheapest !== undefined) {
        expect(cheapest.id).assertEqual(114);
        expect(cheapest.price.cents()).assertEqual(2000);
      }
      let expensive: Goods | undefined = local.mostExpensive();
      expect(expensive !== null && expensive !== undefined).assertTrue();
      if (expensive !== undefined) {
        expect(expensive.id).assertEqual(113);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0470
     * @tc.name      immutability_by_id_mutation_changes_the_sales_sort_047
     * @tc.desc      Verify immutability by id mutation changes the sales sort.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_by_id_mutation_changes_the_sales_sort_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_by_id_mutation_changes_the_sales_sort_047');
      let local: Catalog = new Catalog([
        createGoods(116, 'Sales Low', 1000, CATEGORY_PHONE, 'local info', 'basic_label', 5, 10),
        createGoods(117, 'Sales High', 2000, CATEGORY_FOOD, 'local info', 'basic_label', 6, 50),
        createGoods(118, 'Sales Middle', 3000, CATEGORY_SPORT, 'local info', 'basic_label', 7, 20)
      ]);

      expect(local.sortedBySales()[0].id).assertEqual(117);
      let found: Goods | undefined = local.byId(116);
      expect(found !== null && found !== undefined).assertTrue();
      if (found !== undefined) {
        found.sales = 90;
      }
      let sorted: Goods[] = local.sortedBySales();
      expect(sorted[0].id).assertEqual(116);
      expect(sorted[1].id).assertEqual(117);
      expect(sorted[2].id).assertEqual(118);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0480
     * @tc.name      immutability_by_id_mutation_changes_the_stock_filter_048
     * @tc.desc      Verify immutability by id mutation changes the stock filter.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_by_id_mutation_changes_the_stock_filter_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_by_id_mutation_changes_the_stock_filter_048');
      let local: Catalog = new Catalog([
        createGoods(119, 'Stock One', 1000, CATEGORY_PHONE, 'local info', 'basic_label', 5),
        createGoods(120, 'Stock Two', 2000, CATEGORY_FOOD, 'local info', 'basic_label', 5),
        createGoods(121, 'Stock Three', 3000, CATEGORY_SPORT, 'local info', 'basic_label', 5)
      ]);

      expect(local.inStockOnly().length).assertEqual(3);
      let found: Goods | undefined = local.byId(120);
      expect(found !== null && found !== undefined).assertTrue();
      if (found !== undefined) {
        found.stock = 0;
      }
      let result: Goods[] = local.inStockOnly();
      expect(result.length).assertEqual(2);
      expect(result[0].id).assertEqual(119);
      expect(result[1].id).assertEqual(121);
      let after: Goods | undefined = local.byId(120);
      expect(after !== null && after !== undefined).assertTrue();
      if (after !== undefined) {
        expect(after.stock).assertEqual(0);
        expect(after.isInStock()).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0490
     * @tc.name      immutability_by_id_mutation_changes_the_category_group_049
     * @tc.desc      Verify immutability by id mutation changes the category group.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_by_id_mutation_changes_the_category_group_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_by_id_mutation_changes_the_category_group_049');
      let local: Catalog = new Catalog([
        createGoods(122, 'Group Phone', 1000, CATEGORY_PHONE, 'local info', 'basic_label', 5),
        createGoods(123, 'Group Food', 2000, CATEGORY_FOOD, 'local info', 'basic_label', 6),
        createGoods(124, 'Group Sport', 3000, CATEGORY_SPORT, 'local info', 'basic_label', 7)
      ]);

      expect(local.byCategory(CATEGORY_PHONE).length).assertEqual(1);
      let found: Goods | undefined = local.byId(122);
      expect(found !== null && found !== undefined).assertTrue();
      if (found !== undefined) {
        found.category = CATEGORY_FOOD;
      }
      expect(local.byCategory(CATEGORY_PHONE).length).assertEqual(0);
      expect(local.byCategory(CATEGORY_FOOD).length).assertEqual(2);
      expect((local.categories()).length).assertEqual(([CATEGORY_FOOD, CATEGORY_SPORT]).length);
      for (let __i55: number = 0; __i55 < ([CATEGORY_FOOD, CATEGORY_SPORT]).length; __i55++) {
        expect((local.categories())[__i55]).assertEqual(([CATEGORY_FOOD, CATEGORY_SPORT])[__i55]);
      }
      expect(local.count()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0500
     * @tc.name      immutability_ids_mutation_does_not_change_other_views_050
     * @tc.desc      Verify immutability ids mutation does not change other views.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_ids_mutation_does_not_change_other_views_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_ids_mutation_does_not_change_other_views_050');
      let ids: number[] = catalog.ids();
      ids[0] = 999;
      ids.splice(1, 3);
      let page: Goods[] = catalog.page(0, 4);
      let sorted: Goods[] = catalog.sortedByPrice(true);
      expect(ids.length).assertEqual(13);
      expect(page[0].id).assertEqual(0);
      expect(page[3].id).assertEqual(3);
      expect(sorted[0].price.cents()).assertEqual(8900);
      expect(catalog.count()).assertEqual(16);
      expect(catalog.ids()[0]).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_IMMUTABILITY_0510
     * @tc.name      immutability_sorted_price_remains_monotonic_after_a_price_mutation_051
     * @tc.desc      Verify immutability sorted price remains monotonic after a price mutation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('immutability_sorted_price_remains_monotonic_after_a_price_mutation_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: immutability_sorted_price_remains_monotonic_after_a_price_mutation_051');
      let local: Catalog = new Catalog([
        createGoods(125, 'Monotonic One', 1000, CATEGORY_PHONE, 'local info', 'basic_label', 5),
        createGoods(126, 'Monotonic Two', 4000, CATEGORY_FOOD, 'local info', 'basic_label', 6),
        createGoods(127, 'Monotonic Three', 2000, CATEGORY_SPORT, 'local info', 'basic_label', 7),
        createGoods(128, 'Monotonic Four', 3000, CATEGORY_WEAR, 'local info', 'basic_label', 8)
      ]);
      let found: Goods | undefined = local.byId(125);

      expect(found !== null && found !== undefined).assertTrue();
      if (found !== undefined) {
        // Changing goods 125 from 1000 to 2500 reorders the ascending prices to 2000, 2500, 3000, 4000.
        found.price = new Money(2500);
      }
      let sorted: Goods[] = local.sortedByPrice(true);
      let prices: number[] = [];
      for (let index: number = 0; index < sorted.length; index++) {
        prices.push(sorted[index].price.cents());
      }
      expect((prices).length).assertEqual(([2000, 2500, 3000, 4000]).length);
      for (let __i54: number = 0; __i54 < ([2000, 2500, 3000, 4000]).length; __i54++) {
        expect((prices)[__i54]).assertEqual(([2000, 2500, 3000, 4000])[__i54]);
      }
      for (let __i56: number = 1; __i56 < (prices).length; __i56++) {
        expect((prices)[__i56 - 1] <= (prices)[__i56]).assertTrue();
      }
      expect(sorted[1].id).assertEqual(125);
    });
  });
}
