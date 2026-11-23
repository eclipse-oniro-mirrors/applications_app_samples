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
import { Cart, CartLine, Catalog, CouponBook, Goods, Money, Order, OrderCenter, OrderCounts, OrderState, ProductFilter, SearchEngine } from '../Shared/ShopModel';
import { CATEGORY_FOOD, CATEGORY_PHONE, LABEL_NEW, PRODUCTS, cartLine, createGoods, defaultCouponBook } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';
const STRESS_SIZE: number = 200;

/**
 * 200 entries: price 1000 + (i % 50) * 100, every tenth id sold out.
 * Rating cycles 1..5 and sales equal index * 3.
 */
function buildStressCatalog(): Catalog {
  let items: Goods[] = [];
  for (let index: number = 0; index < STRESS_SIZE; index++) {
    let price: number = 1000 + (index % 50) * 100;
    let category: string = index % 2 === 0 ? CATEGORY_PHONE : CATEGORY_FOOD;
    let stock: number = index % 10 === 0 ? 0 : 50;
    let rating: number = index % 5 + 1;
    let sales: number = index * 3;
    let info: string = 'bulk catalog entry ' + index.toString();
    items.push(createGoods(index, 'Stress Item ' + index.toString(), price, category, info,
      LABEL_NEW, stock, sales, rating, -1));
  }
  return new Catalog(items);
}

/** Ids start at 300, prices rise by ten cents, createdAt starts at 5000. */
function buildStressOrders(count: number): Order[] {
  let orders: Order[] = [];
  for (let index: number = 0; index < count; index++) {
    let price: number = 1000 + index * 10;
    let line: CartLine[] = [cartLine(index, price, 1, true)];
    orders.push(new Order(300 + index, line, OrderState.OBLIGATION, 5000 + index));
  }
  return orders;
}

/** Series 1, 4, 7, ... (index * 3 + 1) with a closed-form total. */
function buildMoneyArray(count: number): Money[] {
  let values: Money[] = [];
  for (let index: number = 0; index < count; index++) {
    values.push(new Money(index * 3 + 1));
  }
  return values;
}

export default function stressTest() {
  describe('OrangeShoppingStress', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'stress suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0010
     * @tc.name      stress_catalog_builds_two_hundred_entries_001
     * @tc.desc      Verify stress catalog builds two hundred entries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_catalog_builds_two_hundred_entries_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_catalog_builds_two_hundred_entries_001');
      let startedAt: number = Date.now();
      let catalog: Catalog = buildStressCatalog();
      let elapsed: number = Date.now() - startedAt;
      hilog.info(DOMAIN, TAG, 'catalog build elapsed %{public}d ms', elapsed);
      expect(catalog.count()).assertEqual(STRESS_SIZE);
      expect(catalog.isEmpty()).assertFalse();
      expect(catalog.ids().length).assertEqual(STRESS_SIZE);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0020
     * @tc.name      stress_catalog_ids_are_unique_and_ordered_002
     * @tc.desc      Verify stress catalog ids are unique and ordered.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_catalog_ids_are_unique_and_ordered_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_catalog_ids_are_unique_and_ordered_002');
      let catalog: Catalog = buildStressCatalog();
      let ids: number[] = catalog.ids();
      expect(ids[0]).assertEqual(0);
      expect(ids[99]).assertEqual(99);
      expect(ids[199]).assertEqual(199);
      let __seen468: number[] = [];
      for (let __i468: number = 0; __i468 < (ids).length; __i468++) {
        expect(__seen468.indexOf((ids)[__i468]) < 0).assertTrue();
        __seen468.push((ids)[__i468]);
      }
      expect(ids.length).assertEqual(STRESS_SIZE);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0030
     * @tc.name      stress_catalog_ascending_sort_is_monotonic_003
     * @tc.desc      Verify stress catalog ascending sort is monotonic.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_catalog_ascending_sort_is_monotonic_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_catalog_ascending_sort_is_monotonic_003');
      let startedAt: number = Date.now();
      let catalog: Catalog = buildStressCatalog();
      let sorted: Goods[] = catalog.sortedByPrice(true);
      let elapsed: number = Date.now() - startedAt;
      hilog.info(DOMAIN, TAG, 'ascending sort elapsed %{public}d ms', elapsed);
      expect(sorted.length).assertEqual(STRESS_SIZE);
      let cents: number[] = [];
      for (let index: number = 0; index < sorted.length; index++) {
        cents.push(sorted[index].price.cents());
      }
      for (let __i472: number = 1; __i472 < (cents).length; __i472++) {
        expect((cents)[__i472 - 1] <= (cents)[__i472]).assertTrue();
      }
      expect(cents[0]).assertEqual(1000);
      expect(cents[cents.length - 1]).assertEqual(5900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0040
     * @tc.name      stress_catalog_descending_sort_is_monotonic_004
     * @tc.desc      Verify stress catalog descending sort is monotonic.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_catalog_descending_sort_is_monotonic_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_catalog_descending_sort_is_monotonic_004');
      let catalog: Catalog = buildStressCatalog();
      let sorted: Goods[] = catalog.sortedByPrice(false);
      let cents: number[] = [];
      for (let index: number = 0; index < sorted.length; index++) {
        cents.push(sorted[index].price.cents());
      }
      for (let __i473: number = 1; __i473 < (cents).length; __i473++) {
        expect((cents)[__i473 - 1] >= (cents)[__i473]).assertTrue();
      }
      expect(cents[0]).assertEqual(5900);
      expect(cents[cents.length - 1]).assertEqual(1000);
      let priciest: Goods | undefined = catalog.mostExpensive();
      expect(priciest !== null && priciest !== undefined).assertTrue();
      if (priciest !== undefined) {
        expect(sorted[0].price.cents()).assertEqual(priciest.price.cents());
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0050
     * @tc.name      stress_catalog_sort_keeps_every_identifier_005
     * @tc.desc      Verify stress catalog sort keeps every identifier.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_catalog_sort_keeps_every_identifier_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_catalog_sort_keeps_every_identifier_005');
      let catalog: Catalog = buildStressCatalog();
      let sorted: Goods[] = catalog.sortedByPrice(true);
      let ids: number[] = [];
      for (let index: number = 0; index < sorted.length; index++) {
        ids.push(sorted[index].id);
      }
      expect(ids.length).assertEqual(STRESS_SIZE);
      let __seen469: number[] = [];
      for (let __i469: number = 0; __i469 < (ids).length; __i469++) {
        expect(__seen469.indexOf((ids)[__i469]) < 0).assertTrue();
        __seen469.push((ids)[__i469]);
      }
      expect(ids.length).assertEqual(catalog.count());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0060
     * @tc.name      stress_catalog_sort_does_not_mutate_the_source_006
     * @tc.desc      Verify stress catalog sort does not mutate the source.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_catalog_sort_does_not_mutate_the_source_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_catalog_sort_does_not_mutate_the_source_006');
      let catalog: Catalog = buildStressCatalog();
      let before: number[] = catalog.ids();
      catalog.sortedByPrice(false);
      let after: number[] = catalog.ids();
      expect((after).length).assertEqual((before).length);
      for (let __i465: number = 0; __i465 < (before).length; __i465++) {
        expect((after)[__i465]).assertEqual((before)[__i465]);
      }
      expect(after[0]).assertEqual(0);
      expect(after[199]).assertEqual(199);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0070
     * @tc.name      stress_catalog_price_extremes_match_the_sorted_ends_007
     * @tc.desc      Verify stress catalog price extremes match the sorted ends.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_catalog_price_extremes_match_the_sorted_ends_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_catalog_price_extremes_match_the_sorted_ends_007');
      let catalog: Catalog = buildStressCatalog();
      let cheapest: Goods | undefined = catalog.cheapest();
      let priciest: Goods | undefined = catalog.mostExpensive();
      expect(cheapest !== null && cheapest !== undefined).assertTrue();
      expect(priciest !== null && priciest !== undefined).assertTrue();
      if (cheapest !== undefined && priciest !== undefined) {
        expect(cheapest.price.cents()).assertEqual(1000);
        expect(priciest.price.cents()).assertEqual(5900);
        expect(cheapest.id).assertEqual(0);
        // The price cycle repeats every fifty ids, so the 5900-cent peak first appears at id 49.
        expect(priciest.id).assertEqual(49);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0080
     * @tc.name      stress_catalog_sales_sort_puts_the_top_seller_first_008
     * @tc.desc      Verify stress catalog sales sort puts the top seller first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_catalog_sales_sort_puts_the_top_seller_first_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_catalog_sales_sort_puts_the_top_seller_first_008');
      let catalog: Catalog = buildStressCatalog();
      let sorted: Goods[] = catalog.sortedBySales();
      expect(sorted[0].id).assertEqual(199);
      expect(sorted[0].sales).assertEqual(597);
      expect(sorted.length).assertEqual(STRESS_SIZE);
      let sales: number[] = [];
      for (let index: number = 0; index < sorted.length; index++) {
        sales.push(sorted[index].sales);
      }
      for (let __i474: number = 1; __i474 < (sales).length; __i474++) {
        expect((sales)[__i474 - 1] >= (sales)[__i474]).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0090
     * @tc.name      stress_catalog_page_windows_cover_all_entries_009
     * @tc.desc      Verify stress catalog page windows cover all entries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_catalog_page_windows_cover_all_entries_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_catalog_page_windows_cover_all_entries_009');
      let startedAt: number = Date.now();
      let catalog: Catalog = buildStressCatalog();
      let pageSize: number = 30;
      // 200 rows in windows of 30 need ceil(200 / 30) = 7 pages, the seventh carrying 20 rows.
      let pages: number = catalog.pageCount(pageSize);
      let collected: number[] = [];
      for (let page: number = 0; page < pages; page++) {
        let items: Goods[] = catalog.page(page, pageSize);
        for (let index: number = 0; index < items.length; index++) {
          collected.push(items[index].id);
        }
      }
      let elapsed: number = Date.now() - startedAt;
      hilog.info(DOMAIN, TAG, 'page walk elapsed %{public}d ms', elapsed);

      expect(pages).assertEqual(7);
      expect(collected.length).assertEqual(STRESS_SIZE);
      let __seen470: number[] = [];
      for (let __i470: number = 0; __i470 < (collected).length; __i470++) {
        expect(__seen470.indexOf((collected)[__i470]) < 0).assertTrue();
        __seen470.push((collected)[__i470]);
      }
      expect(collected[0]).assertEqual(0);
      expect(collected[199]).assertEqual(199);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0100
     * @tc.name      stress_catalog_last_page_has_the_remainder_size_010
     * @tc.desc      Verify stress catalog last page has the remainder size.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_catalog_last_page_has_the_remainder_size_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_catalog_last_page_has_the_remainder_size_010');
      let catalog: Catalog = buildStressCatalog();
      let middle: Goods[] = catalog.page(3, 30);
      let last: Goods[] = catalog.page(6, 30);
      expect(middle.length).assertEqual(30);
      expect(last.length).assertEqual(20);
      expect(last[0].id).assertEqual(180);
      expect(last[19].id).assertEqual(199);
      expect(catalog.pageCount(30)).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0110
     * @tc.name      stress_catalog_search_returns_every_bulk_match_011
     * @tc.desc      Verify stress catalog search returns every bulk match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_catalog_search_returns_every_bulk_match_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_catalog_search_returns_every_bulk_match_011');
      let startedAt: number = Date.now();
      let catalog: Catalog = buildStressCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let matches: Goods[] = engine.search('bulk');
      let elapsed: number = Date.now() - startedAt;
      hilog.info(DOMAIN, TAG, 'bulk search elapsed %{public}d ms', elapsed);
      expect(matches.length).assertEqual(STRESS_SIZE);
      let ids: number[] = [];
      for (let index: number = 0; index < matches.length; index++) {
        ids.push(matches[index].id);
        expect(matches[index].category).assertEqual(matches[index].id % 2 === 0 ?
          CATEGORY_PHONE : CATEGORY_FOOD);
      }
      let __seen471: number[] = [];
      for (let __i471: number = 0; __i471 < (ids).length; __i471++) {
        expect(__seen471.indexOf((ids)[__i471]) < 0).assertTrue();
        __seen471.push((ids)[__i471]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0120
     * @tc.name      stress_catalog_search_multi_token_narrows_to_one_012
     * @tc.desc      Verify stress catalog search multi token narrows to one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_catalog_search_multi_token_narrows_to_one_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_catalog_search_multi_token_narrows_to_one_012');
      let catalog: Catalog = buildStressCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let matches: Goods[] = engine.search('item 199');
      expect(matches.length).assertEqual(1);
      expect(matches[0].id).assertEqual(199);
      expect(matches[0].title).assertEqual('Stress Item 199');
      let allMatches: Goods[] = engine.search('stress item');
      expect(allMatches.length).assertEqual(STRESS_SIZE);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0130
     * @tc.name      stress_catalog_search_unknown_keyword_is_empty_013
     * @tc.desc      Verify stress catalog search unknown keyword is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_catalog_search_unknown_keyword_is_empty_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_catalog_search_unknown_keyword_is_empty_013');
      let catalog: Catalog = buildStressCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let matches: Goods[] = engine.search('nonexistent tablet');
      expect(matches.length).assertEqual(0);
      expect(catalog.count()).assertEqual(STRESS_SIZE);
      let blank: Goods[] = engine.search('   ');
      expect(blank.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0140
     * @tc.name      stress_catalog_suggest_respects_the_limit_014
     * @tc.desc      Verify stress catalog suggest respects the limit.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_catalog_suggest_respects_the_limit_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_catalog_suggest_respects_the_limit_014');
      let catalog: Catalog = buildStressCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let limited: string[] = engine.suggest('stress', 10);
      let wider: string[] = engine.suggest('stress', 25);
      expect(limited.length).assertEqual(10);
      expect(wider.length).assertEqual(25);
      for (let index: number = 0; index < limited.length; index++) {
        expect(wider.indexOf(limited[index]) >= 0).assertTrue();
        expect(limited[index].indexOf('Stress Item') >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0150
     * @tc.name      stress_catalog_category_filter_balances_the_catalog_015
     * @tc.desc      Verify stress catalog category filter balances the catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_catalog_category_filter_balances_the_catalog_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_catalog_category_filter_balances_the_catalog_015');
      let catalog: Catalog = buildStressCatalog();
      let phone: Goods[] = catalog.byCategory(CATEGORY_PHONE);
      let food: Goods[] = catalog.byCategory(CATEGORY_FOOD);
      expect(phone.length).assertEqual(100);
      expect(food.length).assertEqual(100);
      expect(phone.length + food.length).assertEqual(catalog.count());
      expect(catalog.categories().length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0160
     * @tc.name      stress_catalog_price_window_counts_each_tier_016
     * @tc.desc      Verify stress catalog price window counts each tier.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_catalog_price_window_counts_each_tier_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_catalog_price_window_counts_each_tier_016');
      let catalog: Catalog = buildStressCatalog();
      // Six tiers (2000 through 2500) occur in each fifty-id cycle, and 200 rows hold four cycles: 24.
      let windowGoods: Goods[] = catalog.inPriceRange(2000, 2500);
      expect(windowGoods.length).assertEqual(24);
      for (let index: number = 0; index < windowGoods.length; index++) {
        expect(windowGoods[index].price.cents() >= 2000 && windowGoods[index].price.cents() <= 2500).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0170
     * @tc.name      stress_catalog_in_stock_filter_removes_twenty_017
     * @tc.desc      Verify stress catalog in stock filter removes twenty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_catalog_in_stock_filter_removes_twenty_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_catalog_in_stock_filter_removes_twenty_017');
      let catalog: Catalog = buildStressCatalog();
      let inStock: Goods[] = catalog.inStockOnly();
      expect(inStock.length).assertEqual(180);
      for (let index: number = 0; index < inStock.length; index++) {
        expect(inStock[index].isInStock()).assertTrue();
      }
      expect(catalog.count()).assertEqual(200);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0180
     * @tc.name      stress_catalog_top_rated_keeps_forty_entries_018
     * @tc.desc      Verify stress catalog top rated keeps forty entries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_catalog_top_rated_keeps_forty_entries_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_catalog_top_rated_keeps_forty_entries_018');
      let catalog: Catalog = buildStressCatalog();
      let fiveStars: Goods[] = catalog.topRated(5);
      // Rating cycles 1..5, so one fifth of 200 is five-star; lowering the bar to 4 doubles it to 80.
      expect(fiveStars.length).assertEqual(40);
      for (let index: number = 0; index < fiveStars.length; index++) {
        expect(fiveStars[index].rating).assertEqual(5);
      }
      expect(catalog.topRated(4).length).assertEqual(80);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0190
     * @tc.name      stress_cart_holds_sixteen_products_at_max_quantity_019
     * @tc.desc      Verify stress cart holds sixteen products at max quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_cart_holds_sixteen_products_at_max_quantity_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_cart_holds_sixteen_products_at_max_quantity_019');
      let cart: Cart = new Cart();
      let expected: number = 0;
      for (let index: number = 0; index < 16; index++) {
        let goods: Goods = PRODUCTS[index];
        let accepted: number = cart.add(goods.id, goods.price.cents(), 99, 99);
        expect(accepted).assertEqual(99);
        expected += goods.price.cents() * 99;
      }
      expect(cart.distinctCount()).assertEqual(16);
      // Sixteen distinct products at the 99-unit ceiling give 16 x 99 = 1584 units.
      expect(cart.totalQuantity()).assertEqual(1584);
      expect(cart.selectedQuantity()).assertEqual(1584);
      expect(cart.subtotal().cents()).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0200
     * @tc.name      stress_cart_max_quantity_aggregates_to_expected_total_020
     * @tc.desc      Verify stress cart max quantity aggregates to expected total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_cart_max_quantity_aggregates_to_expected_total_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_cart_max_quantity_aggregates_to_expected_total_020');
      let cart: Cart = new Cart();
      for (let index: number = 0; index < 16; index++) {
        let goods: Goods = PRODUCTS[index];
        cart.add(goods.id, goods.price.cents(), 99, 99);
      }
      let lineSum: number = 0;
      for (let index: number = 0; index < cart.allLines().length; index++) {
        let line: CartLine = cart.allLines()[index];
        expect(line.quantity).assertEqual(99);
        lineSum += line.unitPriceCents * line.quantity;
      }
      expect(cart.allLinesSubtotal().cents()).assertEqual(lineSum);
      expect(cart.subtotal().cents()).assertEqual(lineSum);
      expect(lineSum > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0210
     * @tc.name      stress_cart_repeat_adds_keep_the_line_count_021
     * @tc.desc      Verify stress cart repeat adds keep the line count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_cart_repeat_adds_keep_the_line_count_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_cart_repeat_adds_keep_the_line_count_021');
      let cart: Cart = new Cart();
      for (let index: number = 0; index < 16; index++) {
        let goods: Goods = PRODUCTS[index];
        cart.add(goods.id, goods.price.cents(), 99, 99);
      }
      for (let index: number = 0; index < 16; index++) {
        let goods: Goods = PRODUCTS[index];
        let afterRepeat: number = cart.add(goods.id, goods.price.cents(), 99, 99);
        expect(afterRepeat).assertEqual(99);
      }
      expect(cart.distinctCount()).assertEqual(16);
      expect(cart.totalQuantity()).assertEqual(1584);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0220
     * @tc.name      stress_thousand_add_remove_cycles_leave_the_cart_empty_022
     * @tc.desc      Verify stress thousand add remove cycles leave the cart empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_thousand_add_remove_cycles_leave_the_cart_empty_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_thousand_add_remove_cycles_leave_the_cart_empty_022');
      let startedAt: number = Date.now();
      let cart: Cart = new Cart();
      for (let index: number = 0; index < 1000; index++) {
        cart.add(0, 5000, 1, 99);
        cart.remove(0);
      }
      let elapsed: number = Date.now() - startedAt;
      hilog.info(DOMAIN, TAG, 'add remove cycles elapsed %{public}d ms', elapsed);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(0);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.allLines().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0230
     * @tc.name      stress_thousand_cycles_count_every_removal_023
     * @tc.desc      Verify stress thousand cycles count every removal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_thousand_cycles_count_every_removal_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_thousand_cycles_count_every_removal_023');
      let cart: Cart = new Cart();
      let removals: number = 0;
      let maxLines: number = 0;
      for (let index: number = 0; index < 1000; index++) {
        let accepted: number = cart.add(0, 5000, 1, 99);

        expect(accepted).assertEqual(1);
        if (cart.distinctCount() > maxLines) {
          maxLines = cart.distinctCount();
        }
        let removed: boolean = cart.remove(0);
        if (removed) {
          removals++;
        }
      }
      expect(removals).assertEqual(1000);
      expect(maxLines).assertEqual(1);
      expect(cart.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0240
     * @tc.name      stress_repeat_add_clamps_at_ninety_nine_024
     * @tc.desc      Verify stress repeat add clamps at ninety nine.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_repeat_add_clamps_at_ninety_nine_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_repeat_add_clamps_at_ninety_nine_024');
      let cart: Cart = new Cart();
      // A request of 150 clears the 200-unit stock but still stops at the 99-unit cart ceiling.
      let first: number = cart.add(0, 1000, 150, 200);
      expect(first).assertEqual(99);
      let second: number = cart.add(0, 1000, 150, 200);
      expect(second).assertEqual(99);
      expect(cart.quantityOf(0)).assertEqual(99);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.subtotal().cents()).assertEqual(99000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0250
     * @tc.name      stress_five_hundred_price_calculations_match_manual_sum_025
     * @tc.desc      Verify stress five hundred price calculations match manual sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_five_hundred_price_calculations_match_manual_sum_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_five_hundred_price_calculations_match_manual_sum_025');
      let startedAt: number = Date.now();
      let unit: Money = new Money(1000);
      let total: Money = Money.zero();
      let manual: number = 0;
      for (let index: number = 1; index <= 500; index++) {
        let factor: number = index % 5 + 1;
        total = total.add(unit.multiply(factor));
        manual += 1000 * (index % 5 + 1);
      }
      let elapsed: number = Date.now() - startedAt;
      hilog.info(DOMAIN, TAG, 'five hundred calculations elapsed %{public}d ms', elapsed);
      expect(total.cents()).assertEqual(manual);
      expect(total.cents() > 0).assertTrue();
      // Every five factors sum to 1 + 2 + 3 + 4 + 5 = 15, so 100 cycles give 15 x 1000 x 100 = 1500000.
      expect(manual).assertEqual(1500000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0260
     * @tc.name      stress_five_hundred_line_totals_stay_positive_026
     * @tc.desc      Verify stress five hundred line totals stay positive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_five_hundred_line_totals_stay_positive_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_five_hundred_line_totals_stay_positive_026');
      let running: Money = Money.zero();
      let count: number = 0;
      for (let index: number = 1; index <= 500; index++) {
        let factor: number = index % 3 + 1;
        let line: Money = new Money(100 + index).multiply(factor);
        expect(line.cents() > 0).assertTrue();
        expect(line.cents()).assertEqual((100 + index) * factor);
        running = running.add(line);
        count++;
      }
      expect(count).assertEqual(500);
      expect(running.cents() > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0270
     * @tc.name      stress_hundred_order_advances_reach_completed_027
     * @tc.desc      Verify stress hundred order advances reach completed.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_hundred_order_advances_reach_completed_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_hundred_order_advances_reach_completed_027');
      let startedAt: number = Date.now();
      let orders: Order[] = buildStressOrders(25);
      let advances: number = 0;
      for (let orderIndex: number = 0; orderIndex < orders.length; orderIndex++) {
        for (let step: number = 0; step < 4; step++) {
          let moved: boolean = orders[orderIndex].advance();
          if (moved) {
            advances++;
          }
        }
      }
      let elapsed: number = Date.now() - startedAt;
      hilog.info(DOMAIN, TAG, 'hundred advances elapsed %{public}d ms', elapsed);
      let center: OrderCenter = new OrderCenter(orders);
      let counts: OrderCounts = center.counts();

      // Twenty-five orders each need four advances, so the inner loop must report success exactly 100 times.
      expect(advances).assertEqual(100);
      expect(counts.completed).assertEqual(25);
      expect(counts.total).assertEqual(25);
      expect(counts.obligation).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0280
     * @tc.name      stress_hundred_advances_keep_the_order_amounts_028
     * @tc.desc      Verify stress hundred advances keep the order amounts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_hundred_advances_keep_the_order_amounts_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_hundred_advances_keep_the_order_amounts_028');
      let orders: Order[] = buildStressOrders(25);
      let expected: number = 0;
      for (let index: number = 0; index < orders.length; index++) {

        expected += orders[index].total().cents();
      }
      for (let index: number = 0; index < orders.length; index++) {
        for (let step: number = 0; step < 4; step++) {
          orders[index].advance();
        }
      }
      let center: OrderCenter = new OrderCenter(orders);
      expect(center.spent().cents()).assertEqual(expected);
      for (let index: number = 0; index < orders.length; index++) {
        expect(orders[index].isFinal()).assertTrue();
        expect(orders[index].total().isPositive()).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0290
     * @tc.name      stress_large_array_sum_matches_row_by_row_029
     * @tc.desc      Verify stress large array sum matches row by row.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_large_array_sum_matches_row_by_row_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_large_array_sum_matches_row_by_row_029');
      let values: Money[] = buildMoneyArray(1000);
      let aggregate: number = Money.sum(values).cents();
      let rowByRow: number = 0;
      for (let index: number = 0; index < values.length; index++) {
        rowByRow += values[index].cents();
      }
      expect(values.length).assertEqual(1000);
      expect(aggregate).assertEqual(rowByRow);
      expect(aggregate > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0300
     * @tc.name      stress_large_array_sum_matches_arithmetic_formula_030
     * @tc.desc      Verify stress large array sum matches arithmetic formula.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_large_array_sum_matches_arithmetic_formula_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_large_array_sum_matches_arithmetic_formula_030');
      let values: Money[] = buildMoneyArray(1000);
      let aggregate: number = Money.sum(values).cents();
      // Sum of index * 3 over 0..999 is 3 x 499500, plus 1000 for the added one in each entry.
      let formula: number = 3 * 499500 + 1000;
      expect(aggregate).assertEqual(formula);
      expect(aggregate).assertEqual(1499500);
      expect(values[0].cents()).assertEqual(1);
      expect(values[999].cents()).assertEqual(2998);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0310
     * @tc.name      stress_repeated_sort_is_stable_031
     * @tc.desc      Verify stress repeated sort is stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_repeated_sort_is_stable_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_repeated_sort_is_stable_031');
      let catalog: Catalog = buildStressCatalog();
      let first: Goods[] = catalog.sortedByPrice(true);
      let second: Goods[] = catalog.sortedByPrice(true);
      let firstIds: number[] = [];
      let secondIds: number[] = [];
      for (let index: number = 0; index < first.length; index++) {
        firstIds.push(first[index].id);
        secondIds.push(second[index].id);
      }
      expect((secondIds).length).assertEqual((firstIds).length);
      for (let __i466: number = 0; __i466 < (firstIds).length; __i466++) {
        expect((secondIds)[__i466]).assertEqual((firstIds)[__i466]);
      }
      expect(firstIds.length).assertEqual(STRESS_SIZE);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0320
     * @tc.name      stress_repeated_search_is_stable_032
     * @tc.desc      Verify stress repeated search is stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_repeated_search_is_stable_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_repeated_search_is_stable_032');
      let catalog: Catalog = buildStressCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let first: Goods[] = engine.search('stress item 19');
      let second: Goods[] = engine.search('stress item 19');
      let firstIds: number[] = [];
      let secondIds: number[] = [];
      for (let index: number = 0; index < first.length; index++) {
        firstIds.push(first[index].id);
      }
      for (let index: number = 0; index < second.length; index++) {
        secondIds.push(second[index].id);
      }
      expect((secondIds).length).assertEqual((firstIds).length);
      for (let __i467: number = 0; __i467 < (firstIds).length; __i467++) {
        expect((secondIds)[__i467]).assertEqual((firstIds)[__i467]);
      }
      expect(firstIds.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0330
     * @tc.name      stress_repeated_cart_total_is_stable_033
     * @tc.desc      Verify stress repeated cart total is stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_repeated_cart_total_is_stable_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_repeated_cart_total_is_stable_033');
      let cart: Cart = new Cart();
      for (let index: number = 0; index < 16; index++) {
        let goods: Goods = PRODUCTS[index];
        cart.add(goods.id, goods.price.cents(), 99, 99);
      }
      let baseline: number = cart.subtotal().cents();
      let readings: number[] = [];
      for (let index: number = 0; index < 100; index++) {
        readings.push(cart.subtotal().cents());
      }
      expect(readings.length).assertEqual(100);
      for (let index: number = 0; index < readings.length; index++) {
        expect(readings[index]).assertEqual(baseline);
      }
      expect(cart.distinctCount()).assertEqual(16);
      expect(cart.totalQuantity()).assertEqual(1584);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0340
     * @tc.name      stress_snapshot_restore_of_large_cart_matches_034
     * @tc.desc      Verify stress snapshot restore of large cart matches.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_snapshot_restore_of_large_cart_matches_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_snapshot_restore_of_large_cart_matches_034');
      let cart: Cart = new Cart();
      for (let index: number = 0; index < 16; index++) {
        let goods: Goods = PRODUCTS[index];
        cart.add(goods.id, goods.price.cents(), index + 1, 99);
      }
      let expected: number = cart.subtotal().cents();
      let restored: Cart = Cart.restore(cart.snapshot());
      expect(restored.distinctCount()).assertEqual(16);
      expect(restored.totalQuantity()).assertEqual(cart.totalQuantity());
      expect(restored.subtotal().cents()).assertEqual(expected);
      expect(cart.subtotal().cents()).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0350
     * @tc.name      stress_merge_of_large_carts_keeps_the_total_035
     * @tc.desc      Verify stress merge of large carts keeps the total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_merge_of_large_carts_keeps_the_total_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_merge_of_large_carts_keeps_the_total_035');
      let first: Cart = new Cart();
      let second: Cart = new Cart();
      for (let index: number = 0; index < 8; index++) {
        first.add(index, PRODUCTS[index].price.cents(), 1, 99);
        second.add(index + 8, PRODUCTS[index + 8].price.cents(), 1, 99);
      }
      let expected: number = first.subtotal().cents() + second.subtotal().cents();
      first.merge(second);
      expect(first.distinctCount()).assertEqual(16);
      expect(first.totalQuantity()).assertEqual(16);
      expect(first.subtotal().cents()).assertEqual(expected);
      expect(second.distinctCount()).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0360
     * @tc.name      stress_coupon_payable_on_large_cart_stays_bounded_036
     * @tc.desc      Verify stress coupon payable on large cart stays bounded.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_coupon_payable_on_large_cart_stays_bounded_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_coupon_payable_on_large_cart_stays_bounded_036');
      let cart: Cart = new Cart();
      for (let index: number = 0; index < 16; index++) {
        let goods: Goods = PRODUCTS[index];
        cart.add(goods.id, goods.price.cents(), 99, 99);
      }
      let book: CouponBook = defaultCouponBook();
      let payable: Money = cart.payable(book);
      let subtotal: number = cart.subtotal().cents();
      expect(payable.cents() >= 0).assertTrue();
      expect(payable.cents() <= subtotal).assertTrue();
      expect(payable.isNegative()).assertFalse();
      expect(cart.totalWithCoupon(book).cents()).assertEqual(book.bestDiscount(cart.subtotal()).cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0370
     * @tc.name      stress_product_filter_combines_three_dimensions_037
     * @tc.desc      Verify stress product filter combines three dimensions.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_product_filter_combines_three_dimensions_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_product_filter_combines_three_dimensions_037');
      let catalog: Catalog = buildStressCatalog();
      let filter: ProductFilter = new ProductFilter(CATEGORY_PHONE, 2000, 3000, '', true);
      let matched: Goods[] = filter.apply(catalog.all());
      // Even ids fill six price tiers with 24 rows, then the eight multiples of ten with stock 0 drop out.
      expect(matched.length).assertEqual(16);
      for (let index: number = 0; index < matched.length; index++) {
        let goods: Goods = matched[index];
        expect(goods.category).assertEqual(CATEGORY_PHONE);
        expect(goods.price.cents() >= 2000 && goods.price.cents() <= 3000).assertTrue();
        expect(goods.isInStock()).assertTrue();
        expect(goods.id % 2).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0380
     * @tc.name      stress_thousand_adds_stay_in_one_capped_line_038
     * @tc.desc      Verify stress thousand adds stay in one capped line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_thousand_adds_stay_in_one_capped_line_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_thousand_adds_stay_in_one_capped_line_038');
      let startedAt: number = Date.now();
      let cart: Cart = new Cart();
      for (let index: number = 0; index < 1000; index++) {
        cart.add(0, 1000, 1, 200);
      }
      let elapsed: number = Date.now() - startedAt;
      hilog.info(DOMAIN, TAG, 'thousand adds elapsed %{public}d ms', elapsed);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.quantityOf(0)).assertEqual(99);
      expect(cart.totalQuantity()).assertEqual(99);
      expect(cart.subtotal().cents()).assertEqual(99000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0390
     * @tc.name      stress_quantity_sweep_keeps_the_total_linear_039
     * @tc.desc      Verify stress quantity sweep keeps the total linear.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_quantity_sweep_keeps_the_total_linear_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_quantity_sweep_keeps_the_total_linear_039');
      let cart: Cart = new Cart();
      cart.add(0, 250, 1, 99);
      for (let quantity: number = 1; quantity <= 99; quantity++) {
        let applied: number = cart.setQuantity(0, quantity, 99);
        expect(applied).assertEqual(quantity);
        expect(cart.subtotal().cents()).assertEqual(250 * quantity);
      }
      expect(cart.totalQuantity()).assertEqual(99);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0400
     * @tc.name      stress_paired_increase_decrease_returns_to_start_040
     * @tc.desc      Verify stress paired increase decrease returns to start.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_paired_increase_decrease_returns_to_start_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_paired_increase_decrease_returns_to_start_040');
      let cart: Cart = new Cart();
      cart.add(0, 800, 1, 99);
      for (let index: number = 0; index < 500; index++) {
        let raised: number = cart.increase(0, 1, 99);
        let lowered: number = cart.decrease(0, 1, 99);
        expect(raised).assertEqual(2);
        expect(lowered).assertEqual(1);
      }
      expect(cart.quantityOf(0)).assertEqual(1);
      expect(cart.subtotal().cents()).assertEqual(800);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0410
     * @tc.name      stress_merge_of_overlapping_carts_sums_quantities_041
     * @tc.desc      Verify stress merge of overlapping carts sums quantities.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_merge_of_overlapping_carts_sums_quantities_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_merge_of_overlapping_carts_sums_quantities_041');
      let first: Cart = new Cart();
      let second: Cart = new Cart();
      for (let index: number = 0; index < 8; index++) {
        first.add(index, PRODUCTS[index].price.cents(), 2, 99);
        second.add(index + 4, PRODUCTS[index + 4].price.cents(), 3, 99);
      }
      first.merge(second);

      expect(first.distinctCount()).assertEqual(12);
      // Ids 4 through 7 sit on both carts, so their 2 + 3 units merge to 5; ids 8 to 11 are new at 3.
      for (let index: number = 4; index < 8; index++) {
        expect(first.quantityOf(index)).assertEqual(5);
      }
      for (let index: number = 0; index < 4; index++) {
        expect(first.quantityOf(index)).assertEqual(2);
      }
      for (let index: number = 8; index < 12; index++) {
        expect(first.quantityOf(index)).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0420
     * @tc.name      stress_clamped_subtraction_never_goes_negative_042
     * @tc.desc      Verify stress clamped subtraction never goes negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_clamped_subtraction_never_goes_negative_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_clamped_subtraction_never_goes_negative_042');
      let running: Money = new Money(1000);
      let subtractor: Money = new Money(7);
      for (let index: number = 0; index < 500; index++) {
        running = running.subtract(subtractor).clampAtZero();
        expect(running.cents() >= 0).assertTrue();
      }
      expect(running.cents()).assertEqual(0);
      expect(running.isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0430
     * @tc.name      stress_order_center_spent_ignores_terminal_states_043
     * @tc.desc      Verify stress order center spent ignores terminal states.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_order_center_spent_ignores_terminal_states_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_order_center_spent_ignores_terminal_states_043');
      let orders: Order[] = [];
      let expected: number = 0;
      for (let index: number = 0; index < 25; index++) {
        let amount: number = 1000 + index * 100;
        let state: OrderState = OrderState.OBLIGATION;
        if (index < 5) {
          state = OrderState.CANCELLED;
        } else if (index < 10) {
          state = OrderState.REFUND;
        } else {

          expected += amount;
        }
        orders.push(new Order(400 + index, [cartLine(index, amount, 1, true)], state, 9000 + index));
      }
      let center: OrderCenter = new OrderCenter(orders);
      let counts: OrderCounts = center.counts();
      expect(center.spent().cents()).assertEqual(expected);
      expect(counts.cancelled).assertEqual(5);
      expect(counts.refund).assertEqual(5);
      expect(counts.obligation).assertEqual(15);
      expect(counts.total).assertEqual(25);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0440
     * @tc.name      stress_full_scan_resolves_every_lookup_044
     * @tc.desc      Verify stress full scan resolves every lookup.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_full_scan_resolves_every_lookup_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_full_scan_resolves_every_lookup_044');
      let catalog: Catalog = buildStressCatalog();
      for (let index: number = 0; index < STRESS_SIZE; index++) {
        let goods: Goods | undefined = catalog.byId(index);
        expect(goods !== null && goods !== undefined).assertTrue();
        if (goods !== undefined) {
          expect(goods.id).assertEqual(index);
        }
        expect(catalog.indexOf(index)).assertEqual(index);
      }
      expect(catalog.indexOf(STRESS_SIZE)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0450
     * @tc.name      stress_price_ties_break_by_ascending_id_045
     * @tc.desc      Verify stress price ties break by ascending id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_price_ties_break_by_ascending_id_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_price_ties_break_by_ascending_id_045');
      let catalog: Catalog = buildStressCatalog();
      let ascending: Goods[] = catalog.sortedByPrice(true);
      for (let index: number = 1; index < ascending.length; index++) {
        let previous: Goods = ascending[index - 1];
        let current: Goods = ascending[index];
        if (previous.price.cents() === current.price.cents()) {
          expect(previous.id < current.id).assertTrue();
        }
      }
      expect(ascending[0].id).assertEqual(0);
      // The 5900-cent tier holds ids 49, 99, 149 and 199, so the id tie-break leaves 199 last.
      expect(ascending[ascending.length - 1].id).assertEqual(199);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_STRESS_0460
     * @tc.name      stress_quantity_sum_matches_the_series_046
     * @tc.desc      Verify stress quantity sum matches the series.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stress_quantity_sum_matches_the_series_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stress_quantity_sum_matches_the_series_046');
      let cart: Cart = new Cart();
      let expected: number = 0;
      for (let index: number = 0; index < 16; index++) {
        let quantity: number = index + 1;
        let goods: Goods = PRODUCTS[index];
        cart.add(goods.id, goods.price.cents(), quantity, 99);
        expected += quantity;
      }
      expect(cart.totalQuantity()).assertEqual(expected);
      // Quantities 1 through 16 add up to 16 x 17 / 2 = 136 units.
      expect(cart.totalQuantity()).assertEqual(136);
      expect(cart.selectedQuantity()).assertEqual(expected);
      expect(cart.distinctCount()).assertEqual(16);
      expect(expected).assertEqual(16 * 17 / 2);
    });
  });
}
